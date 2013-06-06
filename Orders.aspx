<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Orders.aspx.vb" Inherits="Orders" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monkey Beans Orders</title>
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
</head>
<body>
    <%--navigation bar, links, pictures and text--%>
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="Index.aspx">Home</a> </li>
                <li><a href="Customers.aspx">Customers</a></li>
                <li class="active"><a href="Orders.aspx">Orders</a></li>
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
            <%--end navigation bar and side bar--%>
            <div class="span10">
                <div class='page-header'>
                    <h2 class="maintitle">
                        Search for Orders</h2>
                </div>
                <form id="form1" runat="server">
                <%-- data source 1 link to database, orders table begins--%>
                <div>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/projectdata.mdb"
                        SelectCommand="SELECT * FROM [Orders]" DeleteCommand="DELETE FROM [Orders] WHERE (([OrderID] = ?) OR ([OrderID] IS NULL AND ? IS NULL))"
                        InsertCommand="INSERT INTO [Orders] ([OrderID], [CustomerID], [Item], [Cost], [StockID]) VALUES (?, ?, ?, ?, ?)"
                        UpdateCommand="UPDATE [Orders] SET [CustomerID] = ?, [Item] = ?, [Cost] = ?, [StockID] = ? WHERE (([OrderID] = ?) OR ([OrderID] IS NULL AND ? IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="OrderID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="OrderID" Type="String" />
                            <asp:Parameter Name="CustomerID" Type="String" />
                            <asp:Parameter Name="Item" Type="String" />
                            <asp:Parameter Name="Cost" Type="String" />
                            <asp:Parameter Name="StockID" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CustomerID" Type="String" />
                            <asp:Parameter Name="Item" Type="String" />
                            <asp:Parameter Name="Cost" Type="String" />
                            <asp:Parameter Name="StockID" Type="String" />
                            <asp:Parameter Name="OrderID" Type="String" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                    <%-- data source 1 link to database, orders table ends--%>
                    <br />
                    <%--grid view to display order details begins--%>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="AccessDataSource1"
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                        ForeColor="Black" GridLines="None">
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
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <%--grid view to display order details ends--%>
                    <br />
                    <%--for view displaying order details, delete, edit and create commands begins--%>
                    <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataKeyNames="OrderID" DataSourceID="AccessDataSource1"
                        ForeColor="Black">
                        <EditItemTemplate>
                            OrderID:
                            <asp:Label ID="OrderIDLabel1" runat="server" Text='<%# Eval("OrderID") %>' />
                            <br />
                            CustomerID:
                            <asp:TextBox ID="CustomerIDTextBox" runat="server" Text='<%# Bind("CustomerID") %>' />
                            <br />
                            Item:
                            <asp:TextBox ID="ItemTextBox" runat="server" Text='<%# Bind("Item") %>' />
                            <br />
                            Cost:
                            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                            <br />
                            StockID:
                            <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <InsertItemTemplate>
                            OrderID:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="OrderIDTextBox"
                                ErrorMessage="Please enter an Order ID"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="OrderIDTextBox" runat="server" Text='<%# Bind("OrderID") %>' />
                            <br />
                            CustomerID:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CustomerIDTextBox"
                                ErrorMessage="Please enter a Customer Id"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="CustomerIDTextBox" runat="server" Text='<%# Bind("CustomerID") %>' />
                            <br />
                            Item:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ItemTextBox"
                                ErrorMessage="Please enter an Item"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ItemTextBox" runat="server" Text='<%# Bind("Item") %>' />
                            <br />
                            Cost:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CostTextBox"
                                ErrorMessage="Please enter a Cost"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                            <br />
                            StockID:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="StockIDTextBox"
                                ErrorMessage="Please enter Stock Id"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            OrderID:
                            <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                            <br />
                            CustomerID:
                            <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Bind("CustomerID") %>' />
                            <br />
                            Item:
                            <asp:Label ID="ItemLabel" runat="server" Text='<%# Bind("Item") %>' />
                            <br />
                            Cost:
                            <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
                            <br />
                            StockID:
                            <asp:Label ID="StockIDLabel" runat="server" Text='<%# Bind("StockID") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                Text="New" />
                        </ItemTemplate>
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    </asp:FormView>
                    <%--for view displaying order details, delete, edit and create commands ends--%>
                    <br />
                </div>
                </form>
            </div>
           <%-- decoration image--%>
            <div class='orderimage'>
                <image src='images/orderimage.jpg' alt='coffee picture'></image>
            </div>
            <%-- decoration image ends --%>
        </div>
    </div>
    <%--footer--%>
    <div class="footer">
        Copyright Javier Rossetti</div>
    </div>
</body>
</html>
