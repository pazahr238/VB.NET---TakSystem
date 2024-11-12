Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing

Partial Class ShowProducts
    Inherits System.Web.UI.Page

    Protected Sub gvproducts_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles gvproducts.SelectedIndexChanging
        If Session("user") <> "" Then
            Dim strsql, strcn As String
            Dim strpname, strcat, strimg As String
            Dim intprice As Integer
            Dim cn As OleDb.OleDbConnection
            Dim da As OleDb.OleDbDataAdapter
            Dim ds As New DataSet
            'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
            'strcn = "Provider=SQLOLEDB.1;Initial Catalog=taksystem;Data Source = 173.224.214.228;User ID=tak;Password=72150090"
            strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString

            cn = New OleDb.OleDbConnection(strcn)
            cn.Open()
            '---------------- recorde click shode ro entekhab mikone ----------------
            strsql = "select * from Products where (cat='" + Session("cat") + "')"
            da = New OleDb.OleDbDataAdapter(strsql, cn)
            da.Fill(ds, "Products")
            strpname = ds.Tables("products").Rows(e.NewSelectedIndex).Item("pname")
            strcat = ds.Tables("products").Rows(e.NewSelectedIndex).Item("cat")
            strimg = ds.Tables("products").Rows(e.NewSelectedIndex).Item("img")
            intprice = ds.Tables("products").Rows(e.NewSelectedIndex).Item("price")
            ds.Clear()
            ds.Dispose()
            da.Dispose()


            '--------------- check kon ghablan in mahsul ezafe shode?----------------
            'strsql = "select * from SelectedProducts where (pname=N'" + strpname + "') and (cuser='" + Session("user") + "')"

            'da = New OleDb.OleDbDataAdapter(strsql, cn)
            'da.Fill(ds, "SelectedProducts")
            'If ds.Tables("SelectedProducts").Rows.Count > 0 Then
            '    lblmsg.Text = "کاربر گرامی شما قبلا این محصول را سفارش داده اید"
            '    Response.Redirect("cat01.aspx")
            '    Exit Sub
            'End If

            'ds.Clear()
            'ds.Dispose()
            'cn.Close()

            '------------------------------------------
            'strsql = "insert into SelectedProducts(pname,price,cat,img,cuser) values('" + strpname + "'," + intprice.ToString + ",'" + strcat + "','" + strimg + "','" + Session("user") + "')"
            'da = New OleDb.OleDbDataAdapter(strsql, cn)
            'da.Fill(ds, "SelectedProducts")
            '------------------------------------------
            'Dim con As New System.Data.SqlClient.SqlConnection("data source=STATION1\SQLEXPRESS;Initial Catalog=taksystem;Integrated Security=True")
            strcn = ConfigurationManager.ConnectionStrings("taksystemonline").ConnectionString
            Dim con As New System.Data.SqlClient.SqlConnection(strcn)
            con.Open()
            Dim cmd As New System.Data.SqlClient.SqlCommand()
            cmd.Connection = con
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Insert into SelectedProducts(pname,price,cat,img,cuser) values(@pname,@price,@cat,@img,@cuser)"
            cmd.Parameters.AddWithValue("@pname", strpname)
            cmd.Parameters.AddWithValue("@price", intprice)
            cmd.Parameters.AddWithValue("@cat", strcat)
            cmd.Parameters.AddWithValue("@img", strimg)
            cmd.Parameters.AddWithValue("@cuser", Session("user"))
            cmd.ExecuteNonQuery()
            lblmsg.Text = "کاربر گرامی محصول مورد نظر شما به لیست محصولات انتخاب شده اضافه گردید"
            con.Close()
        Else
            lblmsg.Text = "برای انتخاب محصول ابتدا می بایست وارد سایت شوید"
        End If

    End Sub


    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim strsql, strcn As String
        Dim cn As OleDb.OleDbConnection
        Dim da As OleDb.OleDbDataAdapter
        Dim ds As New DataSet
        'strcn = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=taksystem;Data Source = station1\sqlexpress"
        'strcn = "Provider=SQLOLEDB.1;Initial Catalog=taksystem;Data Source = 173.224.214.228;User ID=tak;Password=72150090"
        strcn = ConfigurationManager.ConnectionStrings("taksystemonline2").ConnectionString
        cn = New OleDb.OleDbConnection(strcn)
        cn.Open()


        strsql = "select * from Products where (cat='" + Session("cat") + "')"

        da = New OleDb.OleDbDataAdapter(strsql, cn)
        da.Fill(ds, "Products")
      
        If ds.Tables("products").Rows.Count = 0 Then
            lblmsg.Text = "محصولی از این نوع وجود ندارد"
        End If
        If Session("cat") = "cat0201" Then
            lblmsg.Text = "برای مشاهده انواع کابل های دیگر به منوی اصلی مراجعه نمایید "
        End If
        gvproducts.DataSource = ds
        gvproducts.DataBind()
        ds.Clear()
        ds.Dispose()
        cn.Close()

    End Sub
End Class
