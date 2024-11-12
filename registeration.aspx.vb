Imports System.Data

Partial Class registeration
    Inherits System.Web.UI.Page

    Protected Sub btnreg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnreg.Click
        Dim strcn, strsql As String
        Dim cn As OleDb.OleDbConnection
        Dim da As OleDb.OleDbDataAdapter
        Dim ds As New DataSet
        '----------------------------------- check for existing user -------------------------------------
        strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
        cn = New OleDb.OleDbConnection(strcn)
        cn.Open()
        strsql = "Select * from users where cuser='" + txtuser.Text + "'"
        da = New OleDb.OleDbDataAdapter(strsql, cn)
        da.Fill(ds, "users")
        If ds.Tables("users").Rows.Count > 0 Then
            lblmsg.Text = "این نام کاربری قبلا انتخاب شده است"
            da.Dispose()
            ds.Dispose()
            ds.Clear()
            cn.Close()
            Exit Sub
        Else
            strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
            'Dim con As New System.Data.SqlClient.SqlConnection("data source=STATION1\SQLEXPRESS;Initial Catalog=taksystem;Integrated Security=True")
            Dim con As New System.Data.SqlClient.SqlConnection(strcn)
            con.Open()
            Dim cmd As New System.Data.SqlClient.SqlCommand()
            cmd.Connection = con
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Insert into users(cname,clname,cmobile,caddress,cuser,cpass) values(@cname,@clname,@cmobile,@caddress,@cuser,@cpass)"
            cmd.Parameters.AddWithValue("@cname", txtname.Text)
            cmd.Parameters.AddWithValue("@clname", txtlname.Text)
            cmd.Parameters.AddWithValue("@cmobile", txtmobile.Text)
            cmd.Parameters.AddWithValue("@caddress", txtaddress.Text)
            cmd.Parameters.AddWithValue("@cuser", txtuser.Text)
            cmd.Parameters.AddWithValue("@cpass", txtpass.Text)
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("main.aspx")
        End If

    End Sub
End Class
