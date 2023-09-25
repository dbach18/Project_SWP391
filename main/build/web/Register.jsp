<%@page import="model.SendEmail"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
        <link rel="stylesheet" href="css/RegisterStyleindex.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="WelcomePage.jsp">Happy Programming</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="RegisterServlet" id="signupForm" method="POST">
            <div class="Center">
                <h1>Sign up</h1>
                <div class="container text-center">
                    <div class="row align-items-start">
                        <div class="col">
                            <!-- Username input -->
                            <div class="txt_field">
                                <input type="text" name="username" required /> 
                                <span></span>
                                <label>Username</label>
                            </div>
                            <div class="txt_field">
                                <input type="text"id="email" name="email" required /> 
                                <span></span>
                                <label>Email</label>
                            </div>
                            <script>
                                function isEmailValid(email) {
                                    // Regular expression pattern for a valid email address
                                    let emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                                    return emailPattern.test(email);
                                }
                                let emailInput = document.getElementById("email");
                                emailInput.addEventListener("change", (event) => {
                                    let email = emailInput.value.trim();
                                    if (isEmailValid(email)) {
                                        emailValidationMessage.textContent = "Email is valid.";
                                        emailValidationMessage.style.color = "green";
                                    } else {
                                        alert("Invalid Email");
                                        event.target.value = "";
                                    }
                                });
                            </script>
                            <!-- Password input -->
                            <div class="txt_field">
                                <input type="password" id="password" name="password" required>
                                <span></span>
                                <label>Password</label>
                            </div>
                            <script>
                                // Get a reference to the password input field and the error message span
                                let passwordInput = document.getElementById("password");
                                // Add an event listener to the input field to validate the password
                                passwordInput.addEventListener("change", (event)=> {
                                    const password = passwordInput.value;

                                    // Define the regular expression pattern for password validation
                                    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

                                    // Check if the password matches the pattern
                                    if (!passwordPattern.test(password)) {
                                        alert("Password must contain at least one lowercase letter, one uppercase letter, one digit, and be at least 8 characters long.");
                                        event.target.value = ""; 
                                    }
                                });
                            </script>
                            <div class="txt_field">
                                <input type="password" id="confirmPassword" name="confirmPassword" required />
                                <span></span>
                                <label>Confirm Password</label>
                            </div>
                            <script>//check if password in confirm password field matches that in password field
                                let password = document.getElementById("password");
                                let passwordConfirm = document.getElementById("confirmPassword");
                                passwordConfirm.addEventListener("change", (event) => {
                                    try {
                                        if (passwordConfirm.value !== password.value) {
                                            alert("Password not matched");
                                            event.target.value = "";
                                        }
                                    } catch (error) {
                                        alert("Password not matched");
                                        event.target.value = "";
                                    }
                                });
                            </script>
                            <div class="txt_field">
                                <input type="text" name="fullname" required />
                                <span></span>
                                <label>Full Name</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="txt_field">
                                <input type="text" id="phone" name="phone" required />
                                <span></span>
                                <label>Phone number</label>
                            </div>
                            <script>//check phone number
                                let phone = document.getElementById("phone");
                                phone.addEventListener("change", (event) => {
                                    try {
                                        if (phone.value.length !== 10) {
                                            alert("Phone number have 10 digits.");
                                            event.target.value = "";
                                        }
                                    } catch (error) {
                                        alert("Invalid phone number.");
                                        event.target.value = "";
                                    }
                                });
                            </script>
                            <div class="date_field">
                                <label>Date of Birth:</label> 
                                <input type="date"id="dob" name="dob" required />
                            </div>
                            <script>//check dob
                                let dob = document.getElementById("dob");
                                dob.addEventListener("blur", () => {
                                    try {
                                        let today = new Date();
                                        let birthDate = new Date(dob.value);
                                        let age = today.getFullYear() - birthDate.getFullYear();
                                        let monthDiff = today.getMonth() - birthDate.getMonth();

                                        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                                            age--;
                                        }
                                        if (age > 130) {
                                            alert("User must be less than 130 years old");
                                            event.target.value = "";
                                        }
                                        if (age < 18) {
                                            alert("User must be over 17 years old");
                                            event.target.value = "";
                                        }
                                    } catch (error) {
                                        alert("Invalid dob.");
                                        event.target.value = "";
                                    }
                                });
                            </script>
                            <div class="Sex_field">
                                <select class="form-select" name="gender" aria-label="DefaSult select example">
                                    <option selected>Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                            <div class="txt_field">
                                <input type="text" name="address" required />
                                <span></span>
                                <label>Address</label>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Button trigger modal -->
                <button type="button" class="signup_link" onclick="CheckOtp(); return false;" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    Sign Up
                </button>
                <%
                    SendEmail sm = new SendEmail();
                    int otp = sm.getOtp();
                %>
                <script>
                    function CheckOtp() {
                        let emailInput = document.getElementById("email").value; // Get the email input value
                        let otp = <%=otp%>; // Use JSP tag to get the server-side value

                        let xhr = new XMLHttpRequest();
                        xhr.open("POST", "/main/RegisterConfirmAccountServlet");
                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhr.send("email=" + emailInput + "&otp=" + otp); // Send OTP and user email for validation
                    }
                </script>
                <%
                    // Server-side code to handle failed registration attempt
                    String failedRegister = (String) request.getAttribute("failedRegister");
                    if (failedRegister != null) {
                        if (failedRegister.equalsIgnoreCase("fail")) {
                %> 
                <!-- Display error message for failed registration -->
                <div class="WrongRegister">
                    <p>Account already existed, please choose another email</p>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirm information</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="txt_field">
                                <input type="password" id="confirmOTP" name="confirmOTP" required />
                                <span></span>
                                <label>We have sent an otp code to your email, enter it here:</label>
                            </div>
                            <script>
                                let otp = document.getElementById("confirmOTP");
                                let confirmOtp = "<%=otp%>";
                                otp.addEventListener("change", (event) => {
                                    try {
                                        if (otp.value !== confirmOtp) {
                                            alert("Otp not matched");
                                            event.target.value = "";
                                        }
                                    } catch (error) {
                                        alert("Otp not matched");
                                        event.target.value = "";
                                    }
                                });
                            </script>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <input type="submit" class="btn btn-primary" value="Confirm"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>