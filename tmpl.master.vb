Imports System.Data

Partial Class tmpl
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("user") = "" Then
                btnlogin.Text = "ورود"
                txtuser.Enabled = True
                txtpass.Enabled = True
                txtuser.BackColor = Drawing.Color.Gold
                txtpass.BackColor = Drawing.Color.Gold
                lblcurrentusr.Text = "مهمان"
            Else
                btnlogin.Text = "خروج"
                txtuser.Enabled = False
                txtpass.Enabled = False
                txtuser.BackColor = Drawing.Color.Gray
                txtpass.BackColor = Drawing.Color.Gray
                lblcurrentusr.Text = Session("user")
            End If
        End If

    End Sub

    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click
        If Page.IsPostBack Then

            If btnlogin.Text = "ورود" Then
                Dim strsql, strcn As String
                Dim cn As OleDb.OleDbConnection
                Dim da As OleDb.OleDbDataAdapter
                Dim ds As New DataSet
                'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
                'strcn = "Provider=SQLOLEDB.1;Initial Catalog=taksystem;Data Source = 173.224.214.228;User ID=tak;Password=72150090"
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
                cn = New OleDb.OleDbConnection(strcn)
                cn.Open()
                strsql = "select * from users where (cuser='" + txtuser.Text + "') and (cpass='" + txtpass.Text + "')"
                da = New OleDb.OleDbDataAdapter(strsql, cn)
                da.Fill(ds, "users")
                If ds.Tables("users").Rows.Count > 0 Then
                    Session("user") = ds.Tables("users").Rows(0).Item("cuser")
                    lblcurrentusr.Text = Session("user")
                    btnlogin.Text = "خروج"
                    txtuser.Enabled = False 
                    txtpass.Enabled = False
                    txtuser.BackColor = Drawing.Color.Gray
                    txtpass.BackColor = Drawing.Color.Gray
                    If Session("user") = "adm" Then
                        Response.Redirect("admcp.aspx")
                    End If
                End If
                ds.Clear()

                Exit Sub
            End If

            If btnlogin.Text = "خروج" Then
                btnlogin.Text = "ورود"
                Session("User") = ""
                txtuser.Enabled = True
                txtpass.Enabled = True
                txtuser.BackColor = Drawing.Color.Gold
                txtpass.BackColor = Drawing.Color.Gold
            End If
            Response.Redirect("main.aspx")
        End If

    End Sub
End Class

