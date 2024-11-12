
Partial Class cat0201
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat0201"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class
