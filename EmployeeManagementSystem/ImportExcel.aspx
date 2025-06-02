<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportExcel.aspx.cs" Inherits="EmployeeManagementSystem.ImportExcel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    استيراد بيانات الموظفين
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .import-page-container {
            background-color: #fff;
            padding: 35px 40px; /* زيادة الحشوة */
            border-radius: 10px; /* زيادة استدارة الحواف */
            box-shadow: 0 5px 15px rgba(0,0,0,0.12); /* ظل أوضح */
            text-align: center;
            max-width: 600px; /* زيادة العرض الأقصى */
            margin: 50px auto; /* زيادة الهامش العلوي والسفلي */
        }
        .import-page-container h2 {
            font-size: 26px; /* تكبير حجم العنوان */
            color: #2c3e50; /* لون أغمق للعنوان */
            margin-bottom: 25px;
            font-weight: 700;
        }
        .file-upload-wrapper-asp {
            border: 2px dashed #007bff;
            border-radius: 8px;
            padding: 35px; /* زيادة الحشوة الداخلية */
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 20px; /* إضافة هامش سفلي */
        }
        .file-upload-wrapper-asp:hover {
            background-color: #f0f8ff;
        }
        /* لا يمكن تخصيص FileUpload مباشرة بشكل كبير، لذا نعتمد على الـ wrapper */
        .upload-icon-asp svg {
            width: 55px; /* تكبير الأيقونة */
            height: 55px;
            fill: #007bff;
            margin-bottom: 18px; /* زيادة الهامش السفلي للأيقونة */
        }
        .file-upload-text-asp {
            font-size: 17px; /* تكبير حجم النص */
            color: #555;
        }
        .import-btn-asp {
            background-color: #28a745;
            color: white;
            padding: 14px 30px; /* زيادة الحشوة */
            border: none;
            border-radius: 5px;
            font-size: 17px; /* تكبير حجم الخط */
            cursor: pointer;
            margin-top: 25px; /* زيادة الهامش العلوي */
            transition: background-color 0.3s, transform 0.1s;
        }
        .import-btn-asp:hover {
            background-color: #218838;
            transform: translateY(-1px);
        }
        .file-name-display-asp {
            margin-top: 15px;
            font-size: 15px;
            color: #333;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="import-page-container">
        <h2>استيراد بيانات الموظفين من ملف Excel</h2>
        
        <asp:Label ID="lblImportStatus" runat="server" CssClass="mb-4 block text-sm" EnableViewState="False"></asp:Label>

        <%-- استخدام Panel كـ wrapper لجعل FileUpload قابلاً للنقر عبر الـ label --%>
        <asp:Panel ID="pnlFileUploadWrapper" runat="server" CssClass="file-upload-wrapper-asp" onclick="document.getElementById('<%--= fuExcelFile.ClientID --%>').click();">
            <div class="upload-icon-asp">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"></path></svg>
            </div>
            <span class="file-upload-text-asp">انقر هنا لاختيار ملف Excel أو قم بسحبه وإفلاته (إذا كان المتصفح يدعم)</span>
        </asp:Panel>
        
        <%-- FileUpload مخفي جزئياً، يتم تفعيله عبر النقر على Panel --%>
        <asp:FileUpload ID="fuExcelFile" runat="server" accept=".xls,.xlsx" style="display:none;" onchange="displayFileName(this);" />
        <asp:Label ID="lblFileName" runat="server" CssClass="file-name-display-asp"></asp:Label>
        
        <asp:Button ID="btnImportFile" runat="server" Text="استيراد الملف" OnClick="BtnImportFile_Click" CssClass="import-btn-asp" />
         <asp:RequiredFieldValidator ID="rfvExcelFile" runat="server" ControlToValidate="fuExcelFile"
            ErrorMessage="الرجاء اختيار ملف Excel." Display="Dynamic" CssClass="asp-validator mt-2 block"></asp:RequiredFieldValidator>

    </div>
    <script type="text/javascript">
        function displayFileName(fileUploadControl) {
            const fileNameLabel = document.getElementById('<%--= lblFileName.ClientID --%>');
            if (fileUploadControl.files.length > 0) {
                fileNameLabel.textContent = 'الملف المختار: ' + fileUploadControl.files[0].name;
            } else {
                fileNameLabel.textContent = '';
            }
        }
    </script>
</asp:Content>
