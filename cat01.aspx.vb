﻿

Partial Class cat01
    Inherits System.Web.UI.Page

 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("cat") = "cat01"
        Response.Redirect("ShowProducts.aspx")
    End Sub
End Class
