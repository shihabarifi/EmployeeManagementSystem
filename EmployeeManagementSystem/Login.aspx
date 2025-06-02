<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EmployeeManagementSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">تسجيل الدخول</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
        }
        .login-group { margin-bottom: 20px; }
        .login-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #555;}
        .login-group .asp-control { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; font-size:16px; }
        .login-button { 
            width: 100%; 
            padding: 12px; 
            background-color: #007bff; 
            color: white; 
            border: none; 
            border-radius: 4px; 
            font-size: 16px; 
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .login-button:hover { background-color: #0056b3; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <h2>تسجيل الدخول للنظام</h2>
        <asp:Label ID="lblLoginStatus" runat="server" CssClass="text-center mb-3 block" EnableViewState="false"></asp:Label>
        <div class="login-group">
            <label for="txtUsername">اسم المستخدم:</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="asp-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="اسم المستخدم مطلوب." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
        </div>
        <div class="login-group">
            <label for="txtPassword">كلمة المرور:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="asp-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="كلمة المرور مطلوبة." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
        </div>
        <asp:Button ID="btnLogin" runat="server" Text="دخول" OnClick="BtnLogin_Click" CssClass="login-button" />
    </div>
</asp:Content>
