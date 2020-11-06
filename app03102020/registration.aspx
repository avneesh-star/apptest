<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="app03102020.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="validation.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div  class="form-group container">
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="3">
                            <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Blood Group:</td>
                    <td>
                        <asp:RadioButtonList ID="rbl_bloodgroup" runat="server" RepeatColumns="8">
                            <asp:ListItem Text="A+" Value="1"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="2"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="3"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="4"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="5"></asp:ListItem>
                            <asp:ListItem Text="AB-" Value="6"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="7"></asp:ListItem>
                            <asp:ListItem Text="O-" Value="8"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Course :</td>
                    <td>
                        <asp:DropDownList ID="ddl_course" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" Text="Save" OnClientClick="return validation()" CssClass="btn btn-primary"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lbl_msh" runat="server" Font-Bold="True" Font-Names="Segoe Print"></asp:Label></td>
                </tr>
                <tr>

                    <td></td>
                    <td style="text-align:left">
                        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_RowCommand" >
                            <Columns>
                                <asp:TemplateField HeaderText="Registration ID" >
                                    <ItemTemplate>
                                        <%# Eval("RId") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%# Eval("Name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <%# Eval("Gender").ToString()=="1"?"Male":Eval("Gender").ToString()=="2"?"Female":"Others"%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Blood Group">
                                    <ItemTemplate>
                                        <%# Eval("BloodGroup").ToString()=="1"?"A+":Eval("BloodGroup").ToString()=="2"?"A-":Eval("BloodGroup").ToString()=="3"?"B+":Eval("BloodGroup").ToString()=="4"?"B-"
                                     :Eval("BloodGroup").ToString()=="5"?"AB+":Eval("BloodGroup").ToString()=="6"?"AB-":Eval("BloodGroup").ToString()=="7"?"O+":"O-"%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Course">
                                    <ItemTemplate>
                                        <%# Eval("course_name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btn_delete" Text="Delete" CommandName="del" runat="server" CommandArgument='<%# Eval("RId") %>' CssClass="btn btn-danger" />
                                        <asp:Button ID="btn_edit" Text="Edit" CommandName="edt" runat="server" CommandArgument='<%# Eval("RId") %>' CssClass="btn btn-warning" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
