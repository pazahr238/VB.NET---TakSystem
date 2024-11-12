Imports System.Data

Partial Class admcp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("user") <> "adm" Then
            Response.Redirect("main.aspx")
        End If
    End Sub

    Protected Sub btnsend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsend.Click
        Dim strcn As String
        strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
        Dim con As New System.Data.SqlClient.SqlConnection(strcn)
        con.Open()
        Dim cmd As New System.Data.SqlClient.SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "Insert into Products(pname,price,cat,img) values(@pname,@price,@cat,@img)"
        cmd.Parameters.AddWithValue("@pname", txtpname.Text)
        cmd.Parameters.AddWithValue("@price", txtprice.Text)
        cmd.Parameters.AddWithValue("@cat", cbcat.SelectedValue)
        cmd.Parameters.AddWithValue("@img", "~\imgp\" + fu.FileName)
        If fu.HasFile Then
            fu.SaveAs(Server.MapPath("imgp") + "\" + fu.FileName)
            cmd.ExecuteNonQuery()
            lblmsg.Text = "فایل با موفقیت ارسال شد"
            lblmsg.ForeColor = Drawing.Color.Green
        Else
            lblmsg.Text = "می بایست یک فایل انتخاب کنید"
            lblmsg.ForeColor = Drawing.Color.Red
        End If

        con.Close()
        Response.Redirect("admcp.aspx")
    End Sub

    Protected Sub gvproducts_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvproducts.RowEditing

        'MsgBox("test")
        'sqlds0.UpdateCommand = "Update products(pname, price, cat, img) set price="
        'x = gvproducts.Rows(0).FindControl("txtname").


    End Sub

  
    Protected Sub gvproducts_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles gvproducts.SelectedIndexChanging
        Try
            If Session("user") = "adm" Then
                Dim strsql, strcn, strselp As String
                Dim cn As OleDb.OleDbConnection
                Dim da As OleDb.OleDbDataAdapter
                Dim ds As New DataSet
                'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
                cn = New OleDb.OleDbConnection(strcn)
                cn.Open()
                strsql = "select * from Products"
                da = New OleDb.OleDbDataAdapter(strsql, cn)
                da.Fill(ds, "products")
                If ds.Tables("products").Rows.Count = 0 Then
                    Exit Sub
                End If
                strselp = ds.Tables("products").Rows(e.NewSelectedIndex).Item("pname")

                ds.Clear()
                '------------------------------------------
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
                Dim con As New System.Data.SqlClient.SqlConnection(strcn)
                con.Open()
                Dim cmd As New System.Data.SqlClient.SqlCommand()
                cmd.Connection = con
                cmd.CommandType = CommandType.Text
                cmd.CommandText = "Delete from Products where (pname=@pname)"
                cmd.Parameters.AddWithValue("@pname", strselp)

                cmd.ExecuteNonQuery()
                Response.Redirect("admcp.aspx")
            Else
                Response.Redirect("main.aspx")
                'cn.Close()
            End If
        Catch ex As System.Data.SqlClient.SqlException
            Response.Write(ex.Message)
        End Try

    End Sub

    Protected Sub gvorder_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles gvorder.SelectedIndexChanging
        Try
            If Session("user") = "adm" Then
                Dim strsql, strcn, strselp, strcuser As String
                Dim cn As OleDb.OleDbConnection
                Dim da As OleDb.OleDbDataAdapter
                Dim ds As New DataSet
                'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
                strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
                cn = New OleDb.OleDbConnection(strcn)
                cn.Open()
                strsql = "select * from SelectedProducts"
                da = New OleDb.OleDbDataAdapter(strsql, cn)
                da.Fill(ds, "SelectedProducts")
                If ds.Tables("SelectedProducts").Rows.Count = 0 Then
                    Exit Sub
                End If
                strselp = ds.Tables("SelectedProducts").Rows(e.NewSelectedIndex).Item("pname")
                strcuser = ds.Tables("SelectedProducts").Rows(e.NewSelectedIndex).Item("cuser")

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
                cmd.Parameters.AddWithValue("@cuser", strcuser)
                cmd.ExecuteNonQuery()

                Response.Redirect("admcp.aspx")
            Else
                Response.Redirect("main.aspx")
                'con.Close()
            End If
        Catch ex As System.Data.SqlClient.SqlException
            Response.Write(ex.Message)
        End Try

    End Sub

  
    Protected Sub btnuser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnuser.Click
        Dim strsql, strcn As String
        Dim cn As OleDb.OleDbConnection
        Dim da As OleDb.OleDbDataAdapter
        Dim ds As New DataSet
        'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
        strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
        cn = New OleDb.OleDbConnection(strcn)
        cn.Open()
        strsql = "select * from users where cuser='" + cbusers.Text + "'"
        da = New OleDb.OleDbDataAdapter(strsql, cn)
        da.Fill(ds, "users")
        gvusers.DataSource = ds
        gvusers.DataBind()
        If ds.Tables("users").Rows.Count > 0 Then
            gvusers.HeaderRow.Cells(0).Text = "نام"
            gvusers.HeaderRow.Cells(1).Text = "نام خانوادگی"
            gvusers.HeaderRow.Cells(2).Text = "موبایل"
            gvusers.HeaderRow.Cells(3).Text = "آدرس"
            gvusers.HeaderRow.Cells(4).Text = "نام کاربری"
            gvusers.HeaderRow.Cells(5).Text = "رمز عبور"

        End If

        ds.Clear()
        ds.Dispose()
        da.Dispose()

        cn.Close()
    End Sub

    Protected Sub btndel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndel.Click
        Dim strcn As String

        If chksure.Checked Then
            strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
            Dim con As New System.Data.SqlClient.SqlConnection(strcn)
            con.Open()
            Dim cmd As New System.Data.SqlClient.SqlCommand()
            cmd.Connection = con
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Delete from SelectedProducts"
            cmd.ExecuteNonQuery()
            Response.Redirect("admcp.aspx")
        End If

    End Sub
End Class
