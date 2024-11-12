<%@ Page Language="VB" Debug="true"  MasterPageFile="~/tmpl.master" AutoEventWireup="false" CodeFile="admcp.aspx.vb" Inherits="admcp" title="پنل مدیریت" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 100%;
        }
        .style9
        {
            height: 29px;
        }
        .style10
        {
            height: 27px;
        }
        .style11
        {
            height: 25px;
        }
    .style12
    {
        height: 26px;
    }
    .style13
    {
        height: 26px;
        font-weight: bold;
    }
    .style14
    {
        height: 27px;
        font-weight: bold;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style8">
          <tr bgcolor="#006699">
            <td class="style9">
                </td>
            <td class="style9">
            </td>
            <td class="style9">
                <asp:Label ID="Label1" runat="server" Text="افزودن محصول به فروشگاه" 
                    Font-Bold="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="نام محصول"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtpname" runat="server" Width="201px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="قیمت (تومان)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtprice" runat="server" TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="دسته بندی"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="cbcat" runat="server" Height="17px" TabIndex="2" 
                    Width="127px" Font-Names="Tahoma">
                    <asp:ListItem Value="cat01">مبدل</asp:ListItem>
                    <asp:ListItem Value="cat0201">کابل مانیتور</asp:ListItem>
                    <asp:ListItem Value="cat0202">کابل اچ دی و ویدیو</asp:ListItem>
                    <asp:ListItem Value="cat0203">کابل اسپیکر</asp:ListItem>
                    <asp:ListItem Value="cat0204">کابل افزایش هدفون</asp:ListItem>
                    <asp:ListItem Value="cat0205">کابل افزایش یو اس بی</asp:ListItem>
                    <asp:ListItem Value="cat0206">کابل برق</asp:ListItem>
                    <asp:ListItem Value="cat0207">کابل سریال و پارالل</asp:ListItem>
                    <asp:ListItem Value="cat0208">کابل تعمیری کی برد و ماوس</asp:ListItem>
                    <asp:ListItem Value="cat0209">کابل پرینتر</asp:ListItem>
                    <asp:ListItem Value="cat0210">کابل شبکه</asp:ListItem>
                    <asp:ListItem Value="cat0211">کابل های دیگر</asp:ListItem>
                    <asp:ListItem Value="cat03">فلش و مموری</asp:ListItem>
                    <asp:ListItem Value="cat04">هارد اکسترنال</asp:ListItem>
                    <asp:ListItem Value="cat05">آداپتور</asp:ListItem>
                    <asp:ListItem Value="cat06">باتری</asp:ListItem>
                    <asp:ListItem Value="cat07">تجهیزات شبکه</asp:ListItem>
                    <asp:ListItem Value="cat08">فن</asp:ListItem>
                    <asp:ListItem Value="cat09">محافظ برق</asp:ListItem>
                    <asp:ListItem Value="cat10">پاور</asp:ListItem>
                    <asp:ListItem Value="cat11">پاک کننده LCD</asp:ListItem>
                    <asp:ListItem Value="cat12">کارت های اینترنال</asp:ListItem>
                    <asp:ListItem Value="cat13">لوازم جانبی</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
            <td>
    <asp:FileUpload ID="fu" runat="server" Height="20px" TabIndex="3" Width="393px" />
            </td>
        </tr>
         <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqlds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
                    SelectCommand="SELECT * FROM [Products]">
                </asp:SqlDataSource>
             </td>
            <td>
                <asp:Button ID="btnsend" runat="server" Font-Names="Tahoma" Text="ارسال" 
                    Width="82px" TabIndex="4" />
            </td>
         </tr>
              <tr bgcolor="#006699">
            <td class="style10">
                  </td>
            <td class="style10">
                  </td>
            <td class="style14">
                حذف محصول از فروشگاه</td>
        </tr>
          <tr>
            <td class="style11">
                </td>
            <td class="style11">
                </td>
            <td class="style11">
                <asp:GridView ID="gvproducts" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="sqlds0" ForeColor="#333333" GridLines="None" 
                    PageSize="2">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="pname" HeaderText="نام محصول" SortExpression="pname">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="قیمت (تومان)" 
                            SortExpression="price">
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cat" HeaderText="دسته بندی" SortExpression="cat" />
                        <asp:BoundField DataField="cuser" HeaderText="کاربری" SortExpression="cuser" 
                            Visible="False" />
                        <asp:CommandField ButtonType="Image" HeaderText="حذف" 
                            SelectImageUrl="~/shopping_cart_remove.png" ShowSelectButton="True" />
                        <asp:CommandField ButtonType="Image" CancelText="انصراف" 
                            EditImageUrl="~/update.gif" EditText="ویرایش قیمت" HeaderText="ویرایش قیمت" 
                            ShowEditButton="True" UpdateText="به روز رسانی" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sqlds0" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
                    SelectCommand="SELECT * FROM [Products]" 
                    UpdateCommand="UPDATE Products SET price = @price WHERE (pname = @pname)">
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtprice" Name="@price" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtpname" Name="@pname" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </td>
        </tr>
          <tr style="background-color: #006699">
            <td class="style12">
                </td>
            <td class="style12">
                </td>
            <td class="style13">
                لیست سفارشات مشتریان</td>
        </tr>
          <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;<asp:CheckBox ID="chksure" runat="server" 
                    Text="از حذف کلیه سفارشات مشتریان مطمئن هستم" />
                &nbsp;&nbsp;
                <asp:Button ID="btndel" runat="server" Font-Names="Tahoma" 
                    Text="حذف کلیه سفارشات" Width="126px" />
                </td>
        </tr>
         <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="gvorder" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="sqlds1" ForeColor="#333333" GridLines="None" 
                    Width="441px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="pname" HeaderText="نام محصول" 
                            SortExpression="pname" />
                        <asp:BoundField DataField="price" HeaderText="قیمت" SortExpression="price" />
                        <asp:BoundField DataField="cuser" HeaderText="کاربر" SortExpression="cuser" />
                        <asp:CommandField ButtonType="Image" HeaderText="حذف" 
                            SelectImageUrl="~/shopping_cart_remove.png" ShowSelectButton="True">
                            <ItemStyle Width="50px" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </td>
        </tr>
          <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
          <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:DropDownList ID="cbusers" runat="server" DataSourceID="SqlDsUsers" 
                    DataTextField="cuser" Height="17px" Width="165px">
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:Button ID="btnuser" runat="server" Font-Names="Tahoma" 
                    Text="نمایش اطلاعات کاربر انتخاب شده" Width="200px" />
                &nbsp;&nbsp;
                <br />
                <asp:GridView ID="gvusers" runat="server" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    Width="462px">
                    <RowStyle ForeColor="#000066" />
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sqlds1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
                    
                    SelectCommand="SELECT * FROM [SelectedProducts] ORDER BY [cuser], [pname], [cat]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDsUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:taksystemonline %>" 
                    SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                </td>
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

