<%@ Page Language="VB" MasterPageFile="~/tmpl.master" AutoEventWireup="false" CodeFile="registeration.aspx.vb" Inherits="registeration" title="ثبت نام کاربر" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style8
    {
        width: 100%;
    }
    .style9
    {
            width: 149px;
        }
        .style10
        {
            width: 149px;
            height: 38px;
        }
        .style11
        {
            height: 38px;
        }
        .style12
        {
            color: #FF0000;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style8">
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="Label8" runat="server" Text="نام"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtname" runat="server" Width="180px"></asp:TextBox>
            <span class="style12">*</span></td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="Label9" runat="server" Text="نام خانوادگی"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtlname" runat="server" Width="180px"></asp:TextBox>
            <span class="style12">*</span></td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="Label10" runat="server" Text="موبایل"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtmobile" runat="server" Width="180px"></asp:TextBox>
            <span class="style12">*</span></td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="Label11" runat="server" Text="آدرس" 
                ToolTip="جهت دریافت محصول خریداری شده"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:TextBox ID="txtaddress" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style9">
            <asp:Label ID="Label12" runat="server" Text="نام کاربری"></asp:Label>
            </td>
        <td>
            <asp:TextBox ID="txtuser" runat="server" Width="180px"></asp:TextBox>
            <span class="style12">*<asp:Label ID="lblmsg" runat="server"></asp:Label>
            </span></td>
    </tr>
     <tr>
        <td class="style9">
            <asp:Label ID="Label13" runat="server" Text="رمز عبور"></asp:Label>
            &nbsp;(فقط شامل عدد)</td>
        <td>
            <asp:TextBox ID="txtpass" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            <span class="style12">*</span></td>
    </tr>
     <tr>
        <td class="style9">
            <asp:Label ID="Label1" runat="server" Text="تکرار رمز عبور"></asp:Label>
         </td>
        <td style="text-align: right">
            <asp:TextBox ID="txtrepass" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
        </td>
        
    </tr>
    <tr>
        <td class="style9">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnreg" runat="server" Text="ثبت نام" Width="84px" 
                Font-Names="Tahoma" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtuser" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="\w+">نام کاربری باید شامل حروف الفبا باشد</asp:RegularExpressionValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="txtpass" ErrorMessage="RangeValidator" 
                MaximumValue="99999999" MinimumValue="10000">لطفا یک عدد انتخاب نمایید</asp:RangeValidator>
        </td>
    </tr>
    <tr>
        <td class="style10">
            </td>
        <td class="style11">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtname" ErrorMessage="RequiredFieldValidator">لطفا نام 
            را وارد نمایید</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtuser" ErrorMessage="RequiredFieldValidator">لطفا کد 
            ملی خود را وارد نمایید</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtpass" ControlToValidate="txtrepass" 
                ErrorMessage="CompareValidator">رمز و تکرار آن با هم همخوانی ندارند</asp:CompareValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtlname" ErrorMessage="RequiredFieldValidator">لطفا نام 
            خانوادگی را وارد نمایید</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtmobile" ErrorMessage="RequiredFieldValidator">لطفا 
            شماره موبایل خود را وارد نمایید</asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
</asp:Content>

