<%@ Import Namespace="System.Data" %>
<script runat="server">
    Sub Page_Load()
        If Not Page.IsPostBack Then
            Dim mycdcatalog = New DataSet
            mycdcatalog.ReadXml(MapPath("Stock.xml"))
            cdcatalog.DataSource = mycdcatalog
            cdcatalog.DataBind()
        End If
    End Sub
</script>

<link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
<html>
<head>
<title>Current Stock</title>
</head>
<body>
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
                        Current Stock</h2>
                 <li class='btn'><a href="Products.aspx">Back</a></li>
                </div>
                <%--XML file styled and presented with HTML--%>
                <form id="Form1" runat="server">
                <asp:DataList ID="cdcatalog" runat="server" CellPadding="4" ForeColor="#333333">
                    <HeaderStyle BackColor="#D9A13B" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        Current Stock (from XML file)
                    </HeaderTemplate>
                    <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <ItemTemplate>
                        <%# Container.DataItem("StockID")%>
                        <%# Container.DataItem("Description")%>
                        - €<%#Container.DataItem("Price")%>
                        <%# Container.DataItem("Stock_level")%>
                        Units
                    </ItemTemplate>
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#D9A13B" Font-Bold="True" ForeColor="White" />
                    <FooterTemplate>
                        Monkey Beans Property
                    </FooterTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                </asp:DataList>
                </form>
                <%--XML file styled and presented with HTML ends --%>
               <%-- Link to edit stock page--%>
                <p class='btn'>
                    <a href='editstock.aspx'>Edit Stock</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
