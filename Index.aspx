<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
    <title>Monkey Beans Home</title>
</head>
<body>
<%--navigation bar, links, pictures and text--%>
    <asp:Panel ID="Panel1" runat="server">
        <div class="navbar">
            <div class="navbar-inner">
                <ul class="nav">
                    <li class="active"><a href="Index.aspx">Home</a> </li>
                    <li><a href="Customers.aspx">Customers</a></li>
                    <li><a href="Orders.aspx">Orders</a></li>
                    <li><a href="Products.aspx">Products</a></li>
                    <li><a href="Suppliers.aspx">Suppliers</a></li>
                    <li><a href="Login.aspx">Sign in</a></li>
                </ul>
            </div>
        </div>
    </asp:Panel>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <div class="image">
                    <img src="coffeelogo.jpg" width="400" height="300"></image>
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
            <div class="span10">
                <form id="form1" runat="server">
                <div class='page-header'>
                    <h2 class="maintitle">
                        Welcome to Monkey Beans Coffee Supplies</h2>
                </div>
                <%--end navigation bar and side bar--%>
                <%--Start // Search Facility for Order Table--%>
                <%-- Start // Label, data source and button for search--%>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Search For Customers or Orders"></asp:Label>
                    :
                    <asp:TextBox ID="Search" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="Button1" runat="server" Text="Search" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Search"
                        CssClass=" " ErrorMessage="Enter Order ID or Customer Surname Please"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/projectdata.mdb"
                        SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Search" Name="OrderID2" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </p>
                <%--End // Label, data source and button for search--%>
                <%--Start // Gridview for display purposes--%>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                        BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="OrderID" DataSourceID="AccessDataSource1"
                        ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                            <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                            <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </p>
                <p>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/projectdata.mdb"
                        SelectCommand="SELECT * FROM [Customers] WHERE ([Surname] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Search" Name="Surname" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </p>
                <p>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataKeyNames="CustomerID" DataSourceID="AccessDataSource2"
                        GridLines="None" ForeColor="Black">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                            <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </p>
                <p>
                    <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/projectdata.mdb"
                        SelectCommand="SELECT * FROM [Stock] WHERE ([Description] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Search" Name="Description" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </p>
                <p>
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataKeyNames="StockID" DataSourceID="AccessDataSource3"
                        ForeColor="Black" GridLines="None">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="StockID" HeaderText="StockID" ReadOnly="True" SortExpression="StockID" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                            <asp:BoundField DataField="Stock_level" HeaderText="Stock_level" SortExpression="Stock_level" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <div>
                    <br />
                    <br />
                </div>
                </form>
            </div>
            <div class='homelogo'>
                <img src='homelogo.jpg' alt='coffee picture'></image>
            </div>
        </div>
        <div class="footer">
            Copyright Javier Rossetti</div>
    </div>
    <%--End // Gridview for display purposes--%>
    <%--End // Search Facility for Order Table--%>
</body>
</html>
