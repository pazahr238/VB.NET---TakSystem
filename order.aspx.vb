Imports System.Data
Imports System.Data.SqlClient

Partial Class order
    Inherits System.Web.UI.Page


    Protected Sub gvorder_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles gvorder.SelectedIndexChanging
        Try
            If Session("user") <> "" Then
                Dim strsql, strcn, strselp As String
                Dim cn As OleDb.OleDbConnection
                Dim da As OleDb.OleDbDataAdapter
                Dim ds As New DataSet
                'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
                cn = New OleDb.OleDbConnection(strcn)
                cn.Open()
                strsql = "select * from SelectedProducts"
                da = New OleDb.OleDbDataAdapter(strsql, cn)
                da.Fill(ds, "selectedproducts")
                If ds.Tables("selectedproducts").Rows.Count = 0 Then
                    Response.Redirect("main.aspx")
                    Exit Sub
                End If
                strselp = ds.Tables("selectedproducts").Rows(e.NewSelectedIndex).Item("pname")

                ds.Clear()
                '------------------------------------------
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
                Dim con As New System.Data.SqlClient.SqlConnection(strcn)
                con.Open()
                Dim cmd As New System.Data.SqlClient.SqlCommand()
                cmd.Connection = con
                cmd.CommandType = CommandType.Text
                cmd.CommandText = "Delete from SelectedProducts where (pname=@pname) and (cuser=@cuser)"
                cmd.Parameters.AddWithValue("@pname", strselp)
                cmd.Parameters.AddWithValue("@cuser", Session("user"))

                cmd.ExecuteNonQuery()
                cn.Close()
                Response.Redirect("order.aspx")
            Else
                Response.Redirect("main.aspx")

            End If
        Catch ex As System.Data.SqlClient.SqlException
            Response.Write(ex.Message)
        End Try


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strcn As String

        If Session("user") <> "" Then
            strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
            Dim con As New System.Data.SqlClient.SqlConnection(strcn)
            con.Open()
            Dim cmd As New System.Data.SqlClient.SqlCommand()
            cmd.Connection = con
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Select pname , cuser , price , count(pname) as cp from SelectedProducts where (cuser=@cuser) GROUP BY pname , cuser , price"
            cmd.Parameters.AddWithValue("@cuser", Session("user"))
            cmd.ExecuteNonQuery()
            Dim reader As SqlDataReader = cmd.ExecuteReader()

            If Not reader.HasRows Then
                lblmsg.Text = "محصولی جهت خرید وجود ندارد"
                'btnbuy.Enabled = False
            End If
            con.Close()
        Else
            Response.Redirect("main.aspx")
        End If

    End Sub

End Class
