﻿
Partial Class cat0209
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat0209"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class