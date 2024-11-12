<%@ Page Language="VB" EnableEventValidation="true"  MasterPageFile="~/tmpl.master" AutoEventWireup="false" CodeFile="order.aspx.vb" Inherits="order" title="سفارش محصولات انتخاب شده" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style8
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style6">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                    Text="لیست محصولات انتخاب شده جهت خرید"></asp:Label>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" valign="middle">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:SqlDataSource ID="sqlds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
                    
                    SelectCommand="SELECT pname, cuser, price, count(pname) as cp FROM [SelectedProducts] Group By pname, cuser, price"></asp:SqlDataSource>
                <asp:GridView ID="gvorder" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="sqlds" ForeColor="#333333" GridLines="None" 
                    Width="525px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="pname" HeaderText="نام محصول" SortExpression="pname">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="قیمت" 
                            SortExpression="price">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:HyperLinkField Text="تومان">
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="cuser" HeaderText="کاربری" SortExpression="cuser" 
                            Visible="False" />
                        <asp:BoundField DataField="cp" HeaderText="تعداد">
                            <ItemStyle Width="30px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" HeaderText="حذف انتخاب" 
                            SelectImageUrl="~/shopping_cart_remove.png" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style8">
                </td>
        </tr>
    </table>
</asp:Content>

