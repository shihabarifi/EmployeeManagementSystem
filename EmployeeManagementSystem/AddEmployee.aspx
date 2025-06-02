<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="EmployeeManagementSystem.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    إضافة موظف جديد
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .add-employee-form-container {
            background-color: #fff;
            padding: 25px 35px; /* زيادة الحشوة */
            border-radius: 10px; /* زيادة استدارة الحواف */
            box-shadow: 0 5px 15px rgba(0,0,0,0.12); /* ظل أوضح */
            max-width: 800px; /* زيادة العرض الأقصى */
            margin: 40px auto; /* زيادة الهامش العلوي والسفلي */
        }
        .add-employee-form-container h2 {
            font-size: 26px; /* تكبير حجم العنوان */
            color: #2c3e50; /* لون أغمق للعنوان */
            margin-bottom: 30px;
            text-align: center;
            font-weight: 700; /* خط أعرض */
        }
        .form-grid-asp {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); /* تعديل حجم الأعمدة */
            gap: 25px; /* زيادة الفجوة */
        }
        .form-group-asp {
            display: flex;
            flex-direction: column;
        }
        .form-group-asp label {
            margin-bottom: 10px; /* زيادة الهامش أسفل العنوان */
            font-weight: 600;
            color: #555;
            font-size: 15px; /* تكبير حجم خط العنوان الفرعي */
        }
        .form-group-asp .asp-control, /* فئة عامة لعناصر التحكم ASP.NET */
        .form-group-asp input[type="text"], /* للتوافق مع المدخلات غير ASP.NET إذا وجدت */
        .form-group-asp input[type="date"],
        .form-group-asp select {
            padding: 12px 15px; /* زيادة الحشوة الداخلية */
            border: 1px solid #ced4da; /* لون إطار أفتح */
            border-radius: 5px; /* استدارة حواف طفيفة */
            font-size: 16px;
            width: 100%;
            box-sizing: border-box; /* لضمان أن الحشوة والإطار لا يزيدان العرض */
            transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .form-group-asp .asp-control:focus,
        .form-group-asp input:focus,
        .form-group-asp select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .phone-numbers-section .phone-entry-asp {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }
        .phone-numbers-section .asp-control { /* تطبيق النمط على حقل الهاتف */
            flex-grow: 1;
            margin-left: 10px; /* RTL: margin-right */
        }
        .add-phone-btn-asp, .remove-phone-btn-asp {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 5px; /* RTL: margin-left */
            min-width: 36px; /* عرض أدنى للأزرار الصغيرة */
            text-align: center;
        }
        .remove-phone-btn-asp {
            background-color: #dc3545;
        }
        .submit-btn-asp {
            background-color: #007bff;
            color: white;
            padding: 14px 25px; /* زيادة الحشوة */
            border: none;
            border-radius: 5px;
            font-size: 17px; /* تكبير حجم الخط */
            cursor: pointer;
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            transition: background-color 0.3s, transform 0.1s;
        }
        .submit-btn-asp:hover {
            background-color: #0056b3;
            transform: translateY(-1px); /* تأثير رفع طفيف عند المرور */
        }
        .asp-validator { /* فئة عامة لرسائل التحقق */
            color: #dc3545; /* لون أحمر لرسائل الخطأ */
            font-size: 0.875em; /* حجم خط أصغر لرسائل التحقق */
            margin-top: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-employee-form-container">
        <h2>إضافة موظف جديد</h2>
        <asp:Label ID="lblAddStatus" runat="server" CssClass="text-center mb-4 block" EnableViewState="false"></asp:Label>

        <div class="form-grid-asp">
            <div class="form-group-asp">
                <label for="txtEmployeeNumber">رقم الموظف:</label>
                <asp:TextBox ID="txtEmployeeNumber" runat="server" CssClass="asp-control" required="required"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmployeeNumber" runat="server" ControlToValidate="txtEmployeeNumber"
                    ErrorMessage="رقم الموظف مطلوب." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group-asp">
                <label for="txtEmployeeName">اسم الموظف:</label>
                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="asp-control" required="required"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ControlToValidate="txtEmployeeName"
                    ErrorMessage="اسم الموظف مطلوب." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group-asp">
                <label for="ddlDepartment">الجهة:</label>
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="asp-control">
                    <%-- يتم ملء الخيارات ديناميكياً من قاعدة البيانات --%>
                </asp:DropDownList>
                <asp:RequiredFieldValidator InitialValue="" ID="rfvDepartment" runat="server" ControlToValidate="ddlDepartment"
                    ErrorMessage="الرجاء اختيار الجهة." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group-asp">
                <label for="ddlStatus">حالة الموظف:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="asp-control">
                    <%-- يتم ملء الخيارات ديناميكياً من قاعدة البيانات --%>
                </asp:DropDownList>
                 <asp:RequiredFieldValidator InitialValue="" ID="rfvStatus" runat="server" ControlToValidate="ddlStatus"
                    ErrorMessage="الرجاء اختيار حالة الموظف." Display="Dynamic" CssClass="asp-validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group-asp">
                <label for="txtJobTitle">المسمى الوظيفي:</label>
                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="asp-control"></asp:TextBox>
            </div>
            <div class="form-group-asp">
                <label for="txtHireDate">تاريخ التعيين:</label>
                <asp:TextBox ID="txtHireDate" runat="server" CssClass="asp-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>
        
        <div class="form-group-asp mt-5 phone-numbers-section">
            <label>أرقام الهواتف:</label>
            <asp:Panel ID="pnlPhoneNumbers" runat="server">
                <%-- سيتم إضافة حقول الهاتف هنا ديناميكياً من الكود الخلفي أو الاحتفاظ بالـ JavaScript --%>
                <div class="phone-entry-asp">
                    <asp:TextBox ID="txtPhoneNumber1" runat="server" CssClass="asp-control" placeholder="رقم الهاتف"></asp:TextBox>
                    <%-- زر الإضافة الأول يمكن أن يكون هنا أو يتم التحكم به بالكامل من JavaScript --%>
                </div>
            </asp:Panel>
            <button type="button" class="add-phone-btn-asp mt-2" onclick="addPhoneNumberField()">+ إضافة رقم آخر</button>
        </div>

        <asp:Button ID="btnSubmitEmployee" runat="server" Text="حفظ الموظف" OnClick="BtnSubmitEmployee_Click" CssClass="submit-btn-asp" />
    </div>

    <script type="text/javascript">
        const phoneNumbersContainerAsp = document.getElementById('<%--= pnlPhoneNumbers.ClientID --%>');
        let phoneCounter = 1; // عداد لأرقام الهواتف المضافة

        function addPhoneNumberField() {
            if (phoneNumbersContainerAsp) {
                phoneCounter++;
                const newPhoneEntry = document.createElement('div');
                newPhoneEntry.className = 'phone-entry-asp mt-2';
                
                const newTextBox = document.createElement('input');
                newTextBox.type = 'text';
                newTextBox.name = 'txtDynamicPhoneNumber' + phoneCounter; // اسم فريد للحقل
                newTextBox.className = 'asp-control'; // استخدام نفس فئة CSS
                newTextBox.placeholder = 'رقم هاتف إضافي';
                
                const removeButton = document.createElement('button');
                removeButton.type = 'button';
                removeButton.className = 'remove-phone-btn-asp';
                removeButton.innerText = '-';
                removeButton.onclick = function() { removePhoneNumberField(this); };
                
                newPhoneEntry.appendChild(newTextBox);
                newPhoneEntry.appendChild(removeButton);
                phoneNumbersContainerAsp.appendChild(newPhoneEntry);
            }
        }

        function removePhoneNumberField(button) {
            // التأكد من وجود عنصر أب قبل محاولة الحذف
            if (button.parentElement) {
                 // لا تحذف أول حقل هاتف إذا كان هو الوحيد
                if (phoneNumbersContainerAsp.querySelectorAll('.phone-entry-asp').length > 1) {
                    button.parentElement.remove();
                } else {
                    // إذا كان الحقل الوحيد، قم بمسح قيمته بدلاً من حذفه
                    const singleInput = phoneNumbersContainerAsp.querySelector('.phone-entry-asp input[type="text"]');
                    if (singleInput) {
                        singleInput.value = '';
                    }
                }
            }
        }
    </script>
</asp:Content>
