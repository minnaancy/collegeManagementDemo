<html>
    <head>
        <title> Login Form</title>
        <link rel="stylesheet" type="text/css" href="./CSS/style.css"/>
    </head>
    <body>
        
        <div class="login" style="background-image: url('images/bg6.jpg');  background-repeat: no-repeat; background-size: cover;">
            
          
            <form action="Action/loginaction.jsp" method="post" class="form">
                <h2>Login</h2>
                <div class="input">
                    <label>User Name</label>
                    <input type="text" name="user" id="user" pattern="[A-Z a-z]{2,30}[0-9]{0,11}" title="Username should only contain alphabets and digits [No special characters are allowed]" required/>
                </div>
                <div class="input">
                    <label>Password</label>
                    <input type="password" name="pass" id="pass" pattern="[A-Z a-z]{2,30}[0-9]{0,11}" title="Password should only contain alphabets and digits [No special characters are allowed]"  required/>
                </div>
                <input type="submit" value="Login" class="button">
                <a href="#forgot" class="forgot">Forgot Password?</a>
            </form>
            <div id="forgot">
                <form action="" class="form">
                    <a href="#" class="close">&times;</a>
                    <h2>Reset Password</h2>
                    <div class="input">
                        <label>Email</label> 
                        <input type="email" name="email" id="email" required/>
                        <input type="submit" value="Submit" class="button"/>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>