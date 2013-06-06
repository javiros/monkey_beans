<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monkey Beans Login</title>
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
</head>
<body>
<%--navigation bar, links, pictures and text--%>
    <form id="form1" runat="server">
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="Index.aspx">Home</a> </li>
                <li><a href="Customers.aspx">Customers</a></li>
                <li><a href="Orders.aspx">Orders</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li><a href="Suppliers.aspx">Suppliers</a></li>
                <li class="active"><a href="Login.aspx">Sign in</a></li>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <div class="image">
                    <image src="coffeelogo.jpg" width="400" height="300"></image>
                </div>
                <br />
                <p id="sidetext">
                    We bring you a great selection of beans and coffee supplies for you to enjoy the
                    best coffee cup.</p>
                <legend>Contact Us:</legend>
                <p>
                    Orders?</p>
                <p>
                    Enquires?</p>
                <p>
                    Comments?</p>
                <legend>Email</legend>
                <h6>
                    monkeybeans@coffee.com</h6>
                <legend>Phone</legend>
                <h5>
                    01-535-3535</h5>
            </div>
              <%--end navigation bar and side bar--%>
            <div class="span10">

                <div class='page-header'>
                    <h2 class='maintitle'>
                        Sign In</h2>
                </div>
                    <p class='maintitle'>
                        &nbsp;</p>
                    <p class='maintitle'>
                        &nbsp;</p>
                    <p class='maintitle'>
                    <%--login control begins--%>
                        <asp:Login ID="Login1" runat="server" DestinationPageUrl="Index.aspx">
                        

                        </asp:Login>
                        <%--login control ends--%>
                    </p>
                    <%--decoration image--%>
                    <div class='signinimage'>
                        <image src='cofeshop.jpg' alt='coffee picture'></image>
                    </div>
                <%--decoration image ends--%>
            </div>
        </div>
    </form>
    <%--Footer--%>
    <div class="footer">
            Copyright Javier Rossetti</div>
    </div>
</body>
</html>
