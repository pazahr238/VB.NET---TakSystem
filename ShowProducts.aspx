<%@ Page Language="VB" MasterPageFile="~/tmpl.master" AutoEventWireup="false" CodeFile="ShowProducts.aspx.vb" Inherits="ShowProducts" title="لیستی از محصولات فروشگاه" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style8
    {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style8">
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: center">
    <asp:SqlDataSource ID="SqlDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
        SelectCommand="SELECT * FROM [Products] ORDER BY [cat]"></asp:SqlDataSource>
            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="lblmsgprice" runat="server" ForeColor="Red" Font-Bold="True">کلیه 
            قیمت های این سایت به روز می باشند</asp:Label>
            <br />
            <br />
            <b>اگر قیمت یک کالا صفر بود، لطفا جهت آگاهی از قیمت دقیق با ما <a class="style5" 
                href="contact.aspx">تماس</a> بگیرید<br />
            </b>
            <br />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center" valign="middle">
    <asp:GridView ID="gvproducts" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        Height="172px" Width="618px">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:ImageField DataImageUrlField="img" HeaderText="تصویر">
                <ControlStyle Height="100px" Width="100px" />
                <HeaderStyle Height="25px" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:ImageField>
            <asp:BoundField DataField="pname" HeaderText="نام محصول" 
                SortExpression="pname" >
                <ItemStyle Width="250px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="قیمت" 
                SortExpression="price" >
                <ItemStyle Width="70px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:HyperLinkField Text="تومان">
                <ItemStyle HorizontalAlign="Right" Width="50px" />
            </asp:HyperLinkField>
            <asp:CommandField ButtonType="Image" HeaderText="انتخاب" 
                SelectImageUrl="~/shopping_cart_add.png" ShowSelectButton="True" 
                SelectText="انتخاب" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

