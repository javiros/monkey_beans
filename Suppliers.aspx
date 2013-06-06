<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Suppliers.aspx.vb" Inherits="Suppliers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
    <title>Monkey Beans Suppliers</title>
</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="Index.aspx">Home</a> </li>
                <li><a href="Customers.aspx">Customers</a></li>
                <li><a href="Orders.aspx">Orders</a></li>
                <li><a href="Products.aspx">Products</a></li>
                <li class="active"><a href="Suppliers.aspx">Suppliers</a></li>
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
                <p id="sidetext">We bring you a great selection of beans and coffee supplies for you to enjoy the best coffee cup.</p>
                <legend>Contact Us:</legend>
                <p>Orders?</p>
                <p>Enquires?</p>
                <p>Comments?</p>
                <legend>Email</legend>
                <h6>monkeybeans@coffee.com</h6>
                <legend>Phone</legend>
                <h5>01-535-3535</h5>
            </div>
            <div class="span10">
                <form id="form1" runat="server">
                <div class='page-header'>
                <h2 class="maintitle">
                    Search For Suppliers</h2>
                    </div>
                <div>
                    <div>
                    <%--scrip manager for ajax assisted search begins--%>
                        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
                        </asp:ScriptManager>

                       <%-- script manager ends--%>
                        <asp:Label ID="Label1" runat="server" Text="Search Suppliers"></asp:Label> <%--ajax assisted search box--%>
                        <br />
                        <asp:TextBox ID="txtContactsSearch" runat="server"></asp:TextBox> search box
                        <asp:Button ID="Button1" runat="server" Text="Search" />
                        <br />
                       <%-- autocomplete extender (ajax)--%>
                        <asp:AutoCompleteExtender ServiceMethod="SearchCustomers" MinimumPrefixLength="2"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtContactsSearch"
                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
                        </asp:AutoCompleteExtender>
                        <br />
                        <br />
                        <%--grid view to display results of search--%>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="SupplierID"
                            DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="SupplierID"></asp:BoundField>
                                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName">
                                </asp:BoundField>
                                <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName">
                                </asp:BoundField>
                                <asp:BoundField DataField="ContactTitle" HeaderText="ContactTitle" SortExpression="ContactTitle">
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                </asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                                <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region"></asp:BoundField>
                                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode">
                                </asp:BoundField>
                                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                </asp:BoundField>
                                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
                                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax"></asp:BoundField>
                                <asp:BoundField DataField="HomePage" HeaderText="HomePage" SortExpression="HomePage">
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                       <%-- end grid view--%>
                       <%--data source link to sql database--%>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>"
                            SelectCommand="SELECT * FROM [Suppliers] WHERE ([ContactName] = @ContactName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtContactsSearch" Name="ContactName" PropertyName="Text"
                                    Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <li class='btn'><a href="ADOsupplierconnection.aspx">View All Suppliers</a></li>
                </div>
                </form>
            </div>
            <div class='supplierimage'>
                        <image src='images/suppliers.gif' alt='coffee picture'></image>
                    </div>
        </div>
    </div>
    <div class="footer">
            Copyright Javier Rossetti</div>
    </div>
</body>
</html>
