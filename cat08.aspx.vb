
Partial Class cat08
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat08"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class
