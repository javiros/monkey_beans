<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Products.aspx.vb" Inherits="Products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monkey Beans Products</title>
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
</head>
<body>
<%--navigation bar, links, pictures and text--%>
    <div>
        <div class="navbar">
            <div class="navbar-inner">
                <ul class="nav">
                    <li><a href="Index.aspx">Home</a> </li>
                    <li><a href="Customers.aspx">Customers</a></li>
                    <li><a href="Orders.aspx">Orders</a></li>
                    <li class="active"><a href="Products.aspx">Products</a></li>
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
                            Search for Products</h2>
                    </div>
                   <%-- link to xml file--%>
                    <p class='btn'>
                        <a href='styledstock.aspx'>View Current Stock</a></p>
                    <form id="form1" runat="server">
                    <div>
                        <h1>
                            All Products</h1>
                          <%--  ADO.net access layer begins--%>
                        <p>
                            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="StockID"
                                DataSourceID="ObjectDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                                BorderWidth="1px" CellPadding="2" ForeColor="Black">
                                <EditItemTemplate>
                                    StockID:
                                    <asp:Label ID="StockIDLabel1" runat="server" Text='<%# Eval("StockID") %>' />
                                    <br />
                                    Description:
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                    <br />
                                    Price:
                                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                                    <br />
                                    Stock_level:
                                    <asp:TextBox ID="Stock_levelTextBox" runat="server" Text='<%# Bind("Stock_level") %>' />
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
                                <%--validation "required field" in place--%>
                                    StockID:
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StockIDTextBox"
                                        ErrorMessage="Enter an ID Please."></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="StockIDTextBox" runat="server" Text='<%# Bind("StockID") %>' />
                                    <br />
                                    Description:
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DescriptionTextBox"
                                        ErrorMessage="Enter a description Please"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                    <br />
                                    Price:
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PriceTextBox"
                                        ErrorMessage="Price field can not be empty or be zero"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                                    <br />
                                    Stock_level:
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Stock_levelTextBox"
                                        ErrorMessage="Enter a valid stock level Please"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="Stock_levelTextBox" runat="server" Text='<%# Bind("Stock_level") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    StockID:
                                    <asp:Label ID="StockIDLabel" runat="server" Text='<%# Eval("StockID") %>' />
                                    <br />
                                    Description:
                                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                                    <br />
                                    Price:
                                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                                    <br />
                                    Stock_level:
                                    <asp:Label ID="Stock_levelLabel" runat="server" Text='<%# Bind("Stock_level") %>' />
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
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetStock"
                                TypeName="DataSet1TableAdapters.StockTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_StockID" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="StockID" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="Price" Type="String" />
                                    <asp:Parameter Name="Stock_level" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="Price" Type="String" />
                                    <asp:Parameter Name="Stock_level" Type="Int32" />
                                    <asp:Parameter Name="Original_StockID" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                            <p>
                             <%--  ADO.net access layer ends--%>
                                &nbsp;</p>
                    </div>
                    </form>
                    </div>
                   <%-- decoration image--%>
                    <div class='productsimage'>
                        <image src='beans.jpg' alt='coffee picture'></image>
                    </div>
                
            </div>
        </div>]
        <%--footer--%>
        <div class="footer">
            Copyright Javier Rossetti</div>
    </div>
</body>
</html>
