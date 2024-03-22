
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<!---------------------------------------------->
<%@page import="com.learn.mycart.entities.User"%>

<%
    User user1 = (User) session.getAttribute("current-user");

%>





<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container-fluid container">
        <a class="navbar-brand" href="index.jsp">CyberMall</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Categories
                    </a>

                    <!--Dynamic category fetch-->
                    <ul class="dropdown-menu">
                        <%       CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> categoryList = categoryDao.getCategories();

                            for (Category category : categoryList) {
                        %>
                        <li>
                            <a class="dropdown-item" href="index.jsp?category=<%= category.getCategoryId()%>"><%= category.getCategoryTitle()%></a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                            <%
                                }
                            %>

                    </ul>
                </li>
                <%
                    String categoryParam = request.getParameter("category");
                    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> productList = null;
                    if (categoryParam == null || categoryParam.trim().equals("all")) {
                        productList = productDao.getAllProducts();
                    } else {
                        int categoryId = Integer.parseInt(categoryParam.trim());
                        productList = productDao.getAllProductsById(categoryId);
                    }
                %>
            </ul>
                <!--mycode-->
                <!--                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">All Products</a></li>
                                        <li><a class="dropdown-item" href="#">Laptops</a></li>
                                        <li><a class="dropdown-item" href="#">Mobiles</a></li>
                                        <li><a class="dropdown-item" href="#">Clothes</a></li>
                                        <li><a class="dropdown-item" href="#">Electronics</a></li>
                                        <li><a class="dropdown-item" href="#">Books</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>-->











                <ul class="navbar-nav ml-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart" > <i class="fa fa-cart-plus" style="font-size: 20px;"></i> <span style="font-size: 20px;" class="cart-items">(0)</span> </a>
                    </li>




                    <%              if (user1 == null) {


                    %>



                    <li class="nav-item active">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>


                    <%                } else {

                    %>
                    <li class="nav-item active">
                        <a class="nav-link"  href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normal.jsp"%>"><%=user1.getUserName()%></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="LogoutServlet">LogOut</a>
                    </li>


                    <%                        }


                    %>


                </ul>
        </div>
    </div>
</nav>