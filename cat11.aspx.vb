
Partial Class cat11
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat11"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class
