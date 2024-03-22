 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card shadow-lg p-3 mb-5 bg-body-tertiary rounded">
                        <%@include file="components/message.jsp" %>

                        <div class="container text-center">
                            <img style="max-width: 100px;" class="img-fluid" src="img/register.png" alt="Register"/>
                        </div>
                        <h3 class="text-center my3 mt-4">Sign up here !!</h3>
                        <div class="card-body">
                            <form action="RegisterServlet" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="name" placeholder="Enter here" >  
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">User Email</label>
                                    <input type="email" name="user_email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp" />  
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">User Password</label>
                                    <input type="password" name="user_password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">  
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">User Phone</label>
                                    <input type="number" name="user_phone" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">  
                                </div>  
                                <div class="mb-3">
                                    <label for="address" class="form-label">User Address</label>
                                    <textarea class="form-control" name="user_address"  style="height: 100px;" id="address" placeholder="Enter Your adderss"></textarea>
                                </div> 

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
