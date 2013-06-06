<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script language="VB" runat="server">
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        'Create a connection string
        Dim connString As String
        connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=|DataDirectory|projectdata.mdb;"
    
        'Open a connection
        Dim objConnection As OleDbConnection
        objConnection = New OleDbConnection(connString)
        objConnection.Open()
    
        'Specify the SQL string
        Dim strSQL As String = "SELECT * FROM Suppliers"
    
        'Create a command object
        Dim objCommand As OleDbCommand
        objCommand = New OleDbCommand(strSQL, objConnection)

        'Get a datareader
        Dim objDataReader As OleDbDataReader
        objDataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection)

        'Do the DataBinding
        dgResults.DataSource = objDataReader
        dgResults.DataBind()
    
        'Close the datareader/db connection
        objDataReader.Close()
    End Sub
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
                        Displaying Suppliers Details</h2>
                    
                </div>
               <asp:datagrid id="dgResults" runat="server" backcolor="LightGoldenrodYellow" bordercolor="Tan"
    borderwidth="1px" cellpadding="2" forecolor="Black" gridlines="None">
    <AlternatingItemStyle BackColor="PaleGoldenrod" />
    <FooterStyle BackColor="Tan" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
        HorizontalAlign="Center" />
    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
</asp:datagrid>
<br />
<li class='btn'><a href="Suppliers.aspx">Back</a></li>
            </div>
        </div>
    </div>
</body>
</html>
