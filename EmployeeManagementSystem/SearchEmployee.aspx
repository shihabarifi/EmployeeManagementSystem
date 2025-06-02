<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchEmployee.aspx.cs" Inherits="EmployeeManagementSystem.SearchEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    بحث عن موظف
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .search-page-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* تغيير لتبدأ من الأعلى */
            min-height: calc(100vh - 250px); /* تعديل الارتفاع ليناسب الهيدر والفوتر */
            padding-top: 50px; /* إضافة مسافة من الأعلى */
        }
        .logo-search {
            max-width: 200px;
            margin-bottom: 30px;
        }
        .search-bar-wrapper {
            display: flex;
            align-items: center;
            background-color: #fff;
            border: 1px solid #dfe1e5;
            border-radius: 24px;
            padding: 5px 15px;
            width: 100%;
            max-width: 580px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .search-bar-wrapper:hover,
        .search-bar-wrapper:focus-within {
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }
        .search-input-asp {
            flex-grow: 1;
            border: none;
            outline: none;
            padding: 10px;
            font-size: 16px;
            background-color: transparent;
        }
        .search-button-asp {
            background-color: transparent !important; /* لضمان تجاوز أي تنسيقات افتراضية لـ ASP.NET Button */
            border: none !important;
            padding: 8px !important;
            cursor: pointer;
            margin-right: 5px;
        }
        .search-button-asp svg {
            width: 20px;
            height: 20px;
            fill: #4285f4;
        }
        .results-grid {
            margin-top: 30px;
            width: 100%;
            max-width: 800px; /* عرض أقصى لجدول النتائج */
        }
        .results-grid table {
            width: 100%;
            border-collapse: collapse;
        }
        .results-grid th, .results-grid td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: right; /* محاذاة النص لليمين للعربية */
        }
        .results-grid th {
            background-color: #f2f2f2; /* خلفية لرأس الجدول */
            font-weight: bold;
        }
        .no-results {
            text-align: center;
            color: #777;
            margin-top: 20px;
            font-size: 1.1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="search-page-container">
        <img src="https://placehold.co/272x92/ffffff/000000?text=شعار+النظام" alt="شعار النظام" class="logo-search"
             onerror="this.onerror=null; this.src='https://placehold.co/272x92/EFEFEF/AAAAAA&text=Image+Not+Found';" />

        <div class="search-bar-wrapper">
            <asp:TextBox ID="txtSearchTerm" runat="server" CssClass="search-input-asp" placeholder="ابحث بالاسم أو رقم الهاتف..." />
            <asp:Button ID="btnSearch" runat="server" Text="" OnClick="BtnSearch_Click" CssClass="search-button-asp" ToolTip="بحث" />
            <%-- استخدام SVG داخل الزر مباشرة قد لا يعمل بشكل جيد مع ASP:Button، يمكن استخدام صورة أو FontAwesome --%>
            <%-- كحل بديل، يمكن وضع الـ SVG بجانب الزر أو استخدام CSS background-image للزر --%>
            <script type="text/javascript">
                // إضافة أيقونة SVG إلى زر البحث باستخدام JavaScript بعد تحميل الصفحة
                document.addEventListener('DOMContentLoaded', function () {
                    var btnSearch = document.getElementById('<%--= btnSearch.ClientID --%>');
                    if (btnSearch) {
                        btnSearch.innerHTML = '<svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>';
                    }
                });
            </script>
        </div>

        <asp:Label ID="lblStatusSearch" runat="server" CssClass="mt-4 text-sm" EnableViewState="False"></asp:Label>

        <div class="results-grid">
            <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="False"
                CssClass="table-auto w-full bg-white shadow-md rounded-lg"
                EmptyDataText="لا توجد بيانات لعرضها. الرجاء إدخال معايير البحث."
                GridLines="None" HeaderStyle-CssClass="bg-gray-200 text-gray-700 font-semibold p-3"
                RowStyle-CssClass="border-b border-gray-200 p-3 hover:bg-gray-50" AlternatingRowStyle-CssClass="bg-gray-50">
                <Columns>
                    <asp:BoundField DataField="EmployeeName" HeaderText="اسم الموظف" />
                    <asp:BoundField DataField="EmployeeNumber" HeaderText="رقم الموظف" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="الجهة" />
                    <asp:BoundField DataField="StatusName" HeaderText="الحالة" />
                    <asp:BoundField DataField="PhoneNumbers" HeaderText="أرقام الهواتف" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="no-results p-5">
                        لا توجد نتائج مطابقة لمعايير البحث.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
