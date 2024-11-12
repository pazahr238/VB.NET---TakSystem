
Partial Class cat10
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat10"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class
