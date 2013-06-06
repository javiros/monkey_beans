<%@ Page Language="VB" %>

<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    'script to edit xml file begins
    Private i, j As Integer
    Private strOutput As String = ""
    Public xmldoc As New XmlDataDocument()
   
    Sub Page_Load(ByVal Sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            GetData()
            BindControl()
        End If
    End Sub
    'variables declaration
    Sub UpdateBtn_Click(ByVal Sender As Object, ByVal e As EventArgs)
        Dim StockID As TextBox
        Dim Description As TextBox
        Dim Price As TextBox
        Dim Stock_level As TextBox
      
        GetData()
        'update data
        For i = 0 To DataGrid1.Items.Count - 1
            StockID = DataGrid1.Items(i).FindControl("StockID")
            Description = DataGrid1.Items(i).FindControl("Description")
            Price = DataGrid1.Items(i).FindControl("Price")
            Stock_level = DataGrid1.Items(i).FindControl("Stock_level")
      
            xmldoc.DataSet.Tables(0).Rows(i)("StockID") = StockID.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Description") = Description.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Price") = Price.Text
            xmldoc.DataSet.Tables(0).Rows(i)("Stock_level") = Stock_level.Text
        Next
      
        Try
            xmldoc.Save(Server.MapPath("Stock.xml")) 'saves info to xml file
        Catch
            output.Text = "Error updating data"  'display error if any
        End Try
      
        BindControl()
    End Sub
   
    Sub GetData()
        Try
            xmldoc.DataSet.ReadXml(Server.MapPath("Stock.xml")) 'reads xml data 
        Catch ex As Exception
            output.Text = "Error accessing XML file"
        End Try
    End Sub
   
    Sub BindControl()  'gets info from xml to be displayed in data grid
        DataGrid1.DataSource = xmldoc.DataSet
        DataGrid1.DataMember = xmldoc.DataSet.Tables(0).TableName
        DataGrid1.DataBind()
    End Sub
    'script to edit xml file ends
</script>
<html>
<head>
    <title>Edit Stock</title>
    <link rel="stylesheet" href="Styles/bootstrap.css" type="text/css" />
</head>
<body>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
            <%--navigation bar, links, pictures and text begins--%>
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
            <%--navigation bar, links, pictures and text ends--%>
            <div class="span10">
                <div class='page-header'>
                    <h2 class="maintitle">
                        Edit Stock</h2>
                    <li class='btn'><a href="Products.aspx">Back</a></li> <%--back button to products page--%>
                </div>

                <%--data grid to display xml contents begins--%>
                <asp:Label ID="output" runat="server" />
                <form id="Form1" runat="server">
                <asp:DataGrid ID="DataGrid1" runat="server" BorderColor="Tan" GridLines="None"
                    HeaderStyle-BackColor="#cccc99" ItemStyle-BackColor="#ffffff" AlternatingItemStyle-BackColor=""
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" 
                    BorderWidth="1px" CellPadding="2" ForeColor="Black">
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Stock Id">
                            <ItemTemplate>
                                <asp:TextBox ID="StockID" runat="server" Text='<%# Container.DataItem("StockID") %>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Description">
                            <ItemTemplate>
                                <asp:TextBox ID="Description" runat="server" Text='<%# Container.DataItem("Description") %>'
                                    Width="275px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Price">
                            <ItemTemplate>
                                <asp:TextBox ID="Price" runat="server" Text='<%# Container.DataItem("Price") %>'
                                    Width="150px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Stock Level">
                            <ItemTemplate>
                                <asp:TextBox ID="Stock_level" runat="server" Text='<%# Container.DataItem("Stock_level") %>'
                                    Width="80px" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <FooterStyle BackColor="Tan" />

<HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>

                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:DataGrid>
               <%-- data grid to display xml contents ends --%>
                <p></p>
                <p>
               <%-- update button --%>
                    <asp:Button ID="update" runat="server" OnClick="UpdateBtn_Click" Text="Update!" class='btn' />
                </p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
