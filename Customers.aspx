<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Customers.aspx.vb" Inherits="MasterDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monkey Beans Customers</title>
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
</head>
<body>
<%--navigation bar, links, pictures and text--%>
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="Index.aspx">Home</a> </li>
                <li class="active"><a href="Customers.aspx">Customers</a></li>
                <li><a href="Orders.aspx">Orders</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li><a href="Suppliers.aspx">Suppliers</a></li>
                <li><a href="Login.aspx">Sign in</a></li>
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
            <div class="span10">
                <div class='page-header'>
                    <h2 class="maintitle">
                        Customers Master Detail</h2>
                </div>
                <%--end navigation bar and side bar--%>
               <%-- data source 1 begins, link to database--%>
                <form id="form1" runat="server">
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/projectdata.mdb"
                    SelectCommand="SELECT * FROM [Customers]"></asp:AccessDataSource>
                 <%-- data source 1 ends, link to database--%>
                <br />
                <%--grid view link to data source 1--%>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="AccessDataSource1"
                    CellPadding="2" ForeColor="Black" GridLines="None" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                        <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                        <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <%--grid view link to data source 1 ends --%>
                <br />
                <%--data source 2 begins, link to database customers link--%>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/projectdata.mdb"
                    SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerID] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
                <%--data source 2 ends, link to database orders and customers link--%>
                <br />
                <%--grid view to display  customers results begins--%>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" DataKeyNames="OrderID" 
                    DataSourceID="AccessDataSource2" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                    GridLines="None">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                        <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
                        <asp:BoundField DataField="StockID" HeaderText="StockID" SortExpression="StockID" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                <%--grid view to display customers results ends--%>
                <%--form view detailing customer details, edit, delete and update links begins--%>
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="CustomerID"
                    DataSourceID="AccessDataSource3">
                    <EditItemTemplate>
                        CustomerID:
                        <asp:Label ID="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' />
                        <br />
                        Firstname:
                        <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
                        <br />
                        Surname:
                        <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' />
                        <br />
                        City:
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        Telephone:
                        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        CustomerID:
                        <asp:TextBox ID="CustomerIDTextBox" runat="server" Text='<%# Bind("CustomerID") %>' />
                        <br />
                        Firstname:
                        <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
                        <br />
                        Surname:
                        <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' />
                        <br />
                        City:
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        Telephone:
                        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        CustomerID:
                        <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                        <br />
                        Firstname:
                        <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' />
                        <br />
                        Surname:
                        <asp:Label ID="SurnameLabel" runat="server" Text='<%# Bind("Surname") %>' />
                        <br />
                        City:
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        Telephone:
                        <asp:Label ID="TelephoneLabel" runat="server" Text='<%# Bind("Telephone") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <%--form view detailing customer details, edit, delete and update links ends--%>
                <br />
               <%-- data source 3 to bind changes made in form view above begins--%>
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/projectdata.mdb"
                    DeleteCommand="DELETE FROM [Customers] WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL))"
                    InsertCommand="INSERT INTO [Customers] ([CustomerID], [Firstname], [Surname], [City], [Email], [Telephone]) VALUES (?, ?, ?, ?, ?, ?)"
                    SelectCommand="SELECT * FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [Firstname] = ?, [Surname] = ?, [City] = ?, [Email] = ?, [Telephone] = ? WHERE (([CustomerID] = ?) OR ([CustomerID] IS NULL AND ? IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="Firstname" Type="String" />
                        <asp:Parameter Name="Surname" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Telephone" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Firstname" Type="String" />
                        <asp:Parameter Name="Surname" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Telephone" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <%-- data source 3 to bind changes made in form view above ends--%>
                <br />
                <br />
                </form>
            </div>
            <%--decoration image begins--%>
            <div class='customerimage'>
                        <image src='images/customers.jpg' alt='coffee picture'></image>
                    </div>
                    <%--decoration image ends--%>
        </div>
    </div>
    <%--footer--%>
    <div class="footer">
            Copyright Javier Rossetti</div>
    </div>
</body>
</html>
