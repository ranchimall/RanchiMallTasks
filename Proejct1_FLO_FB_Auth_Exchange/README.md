# What are different files here
  - customer.sql is the customer table where authentication information is stored
  - ranchi8_exchange_test.sql is the ful MySQL database with test data
  - Exchange_PHP_code.zip has the full PHP code 
  - flo-auth.php illustrates how FLO based authentication happens

# Main Task
  >  You have to convert Facebook based authentication to FLO based authentication

# Notes
Currently, the user gets the authentcation clearance for Facebook using fb_config.php, and it sets login status to unity

customer is the table with all the users
There is no session information stored in Database currently
It only has action or not active

So session and login tokens are not stored in DB
We do not have record of when was login made

DB Name is ranchi8_flexchange8

==
CHECKLOGINSTATUS
checkLoginStatus()
  
EVERY FILES HAS THIS ON TOP
 require_once '../includes/imp_files.php';
    
   if (!checkLoginStatus()) {
        return false;
    }

AND THIS IS HOW THE LOGIN STATUS IS CHECKED

function checkLoginStatus() {
    if(!isset($_SESSION['fb_id']) || !isset($_SESSION['user_id']) || !isset($_SESSION['user_name'])) {
        return false;
    }
    return true;
}

==

WE ARE INTERESTED IN THIS fb_id

isset($_SESSION['fb_id'])

fb_id is a field in database

# Interesting code snippets

From fbconfig.php which sets the $_SESSION variables 

```php
    // printing $profile array on the screen which holds the basic info about user

    $name = isset($profile['name']) ? $profile['name'] : null;
    $first_name = isset($profile['first_name']) ? $profile['first_name'] : null;
    $last_name = isset($profile['last_name']) ? $profile['last_name'] : null;
    $email = isset($profile['email']) ? $profile['email'] : null;
    //$gender = isset($profile['gender']) ? $profile['gender'] : null;
    $fb_id = isset($profile['id']) ? $profile['id'] : null;

    $_SESSION['first_name'] = $first_name;
    $_SESSION['full_name'] = $name;
    $_SESSION['email'] = $email;
    $_SESSION['fb_id'] = $fb_id;
 ```   
