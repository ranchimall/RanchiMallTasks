<?
ob_start();
session_start(); 
$_SESSION['id'] = session_id();
if (!isset($cookie_life_days)) {$cookie_life_days = 60;};

if (!isset($_SESSION['page_action'])) { $_SESSION['page_action']='verify_login'; };

if ($_REQUEST['page_action'] =='welcome') { $_SESSION['page_action']='welcome';} else
if ($_REQUEST['page_action'] =='verify_login') { $_SESSION['page_action']='verify_login';} else
if ($_REQUEST['page_action'] =='logout_request') { $_SESSION['page_action']='logout_request';};

if ($_SESSION['page_action']=='verify_login'){
    if (isset($_COOKIE['exchange'])){
        ob_end_clean();
        ob_start();
        $_SESSION['page_action']='welcome';
        header('Location: '.$_SERVER['PHP_SELF']); 
        exit();
    }
        
    if (isset($_POST['flo_id'], $_POST['pub_key'], $_SESSION['id'], $_POST['sign'] )){
        
        ob_start();
        
    
            function callAPI($method, $url, $data){
            $curl = curl_init();
            switch ($method){
                case "POST":
                    curl_setopt($curl, CURLOPT_POST, 1);
                    if ($data)
                        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    break;
                case "PUT":
                    curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
                    if ($data)
                        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);			 					
                    break;
                default:
                    if ($data)
                        $url = sprintf("%s?%s", $url, http_build_query($data));
            }
            // OPTIONS:
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array(
                'APIKEY: 111111111111111111111',
                'Content-Type: application/json',
            ));
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            // EXECUTE:
            $result = curl_exec($curl);
            if(!$result){die("Connection Failure");}
            curl_close($curl);
            return $result;
            }
    
            $floID = $_POST['flo_id'];
            $pubKey = $_POST['pub_key'];
            $s_id = $_SESSION['id'];
            $sign = $_POST['sign'];
    
    
            $data_array =  array( "floID"        => $floID, "pubKey" => $pubKey, "message" => $s_id, "sign" => $sign  );
            $make_call = callAPI('POST', 'https://flo-sign-validator.duckdns.org', json_encode($data_array));
            $response = json_decode($make_call, true);
    
    
            if ($response['success'] == 1) {
                
                //store $s_id (session ID) in SQl
                ob_end_clean();
                ob_start();
                setcookie("exchange[flo_id]", $floID, time () + (86400 * $cookie_life_days));
                setcookie("exchange[session_id]", $s_id, time () + (86400 * $cookie_life_days));
                setcookie("exchange[pub_key]", $pubKey,time () + (86400 * $cookie_life_days)); 
                $_SESSION['page_action']='welcome';
                header('Location: '.$_SERVER['PHP_SELF']); 
                exit();
                
            }  else {
                echo '<script>alert("Signature Verification Failed")</script>';
            }
        } 


echo <<<END
    <head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="css/mate.css">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://sairajzero.github.io/Standard_Operations/cdn/floCrypto.js"></script>


    </head>
    
            <div class="col-sm-4 ">
                <div class="box p--2 mt--4">
                    <div class="row">
                        <h2 class="text-center">Login using FLO Private Key </h2>
                        <hr>
                        <div class="col-lg-12 lazy-form">
                            <label for="key_flo">Enter your FLO Private Key</label>
                            <input type="text" name="key_flo" id="key_flo">
                        </div>
    
                        <div class="col-lg-12">
                            <input type="submit" id="key_flo_submit" class="btn btn--primary-1 btn-white fb_log_in" value="Enter Key">
                        </div>
    
                    </div>
    
                </div>
    
            </div>

    <form id="login" style="display: none;" method="POST">
        <input type="text" name="flo_id" />
        <input type="text" name="pub_key" />
        <input type="text" name="sign" />
        <input type="hidden" name="page_action" value="verify_login"/>
        <input type="submit" name="submit" />
    </form>
    <script>
        document.getElementById("key_flo_submit").onclick = function(evt) {
            let privKey = document.getElementById("key_flo").value;
            let pubKey = floCrypto.getPubKeyHex(privKey);
            let floID = floCrypto.getFloID(pubKey);
            let message = "{$_SESSION['id']}";
            let sign = floCrypto.signData(message, privKey);
            delete privKey;
            let form = document.forms["login"];
            form["flo_id"].value = floID;
            form["pub_key"].value = pubKey;
            form["sign"].value = sign;
            form["submit"].click();
        }
    </script>


END;
}

if ($_SESSION['page_action']=='welcome'){
    if (!isset($_COOKIE['exchange'])) {
        $_SESSION['page_action']='verify_login';
        ob_end_clean();
        ob_start();
        header('Location: '.$_SERVER['PHP_SELF']);
        exit();
     } 

echo <<<END
    <head>
        <title>Exchange</title>
    </head>
    <body>
        <h1>Welcome</h1>
        <h5>Logged in as {$_COOKIE['exchange']['flo_id']}</h5>
        <form action="">
            <input type="hidden" name="page_action" value="logout_request"/>
            <input type="submit" value="logout"/>
        </form>
    </body>    

END;
    
}

if ($_SESSION['page_action']=='logout_request'){

    if (isset($_COOKIE['exchange'])) {
        unset($_COOKIE['exchange[flo_id]']); 
        setcookie('exchange[flo_id]', null, -1); 
        unset($_COOKIE['exchange[session_id]']); 
        setcookie('exchange[session_id]', null, -1); 
        unset($_COOKIE['exchange[pub_key]']); 
        setcookie('exchange[pub_key]', null, -1);
        unset($_COOKIE['exchange']); 
        setcookie('exchange', null, -1);
     } 
    ob_end_clean();
    ob_start();     
     $_SESSION['page_action']='verify_login';
     header('Location: '.$_SERVER['PHP_SELF']); 
     exit();

}
 ?>

