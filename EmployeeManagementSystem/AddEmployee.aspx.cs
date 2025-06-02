using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                LoadEmployeeStatuses();
                // يمكنك تهيئة حقل الهاتف الأول هنا إذا أردت
                // AddInitialPhoneNumberField();
            }
        }

        private void LoadDepartments()
        {
            // هنا يتم تحميل بيانات الجهات من قاعدة البيانات
            // مثال بيانات وهمية:
            ddlDepartment.Items.Clear();
            ddlDepartment.Items.Add(new ListItem("اختر الجهة...", ""));
            ddlDepartment.Items.Add(new ListItem("فرع الرياض", "1"));
            ddlDepartment.Items.Add(new ListItem("فرع جدة", "2"));
            ddlDepartment.Items.Add(new ListItem("المركز الرئيسي", "3"));
            // ddlDepartment.DataSource = YourDataAccessLayer.GetDepartments();
            // ddlDepartment.DataTextField = "DepartmentName";
            // ddlDepartment.DataValueField = "DepartmentID";
            // ddlDepartment.DataBind();
            // ddlDepartment.Items.Insert(0, new ListItem("اختر الجهة...", ""));
        }

        private void LoadEmployeeStatuses()
        {
            // هنا يتم تحميل بيانات حالات الموظفين من قاعدة البيانات
            // مثال بيانات وهمية:
            ddlStatus.Items.Clear();
            ddlStatus.Items.Add(new ListItem("اختر الحالة...", ""));
            ddlStatus.Items.Add(new ListItem("نشط", "1"));
            ddlStatus.Items.Add(new ListItem("في إجازة", "2"));
            ddlStatus.Items.Add(new ListItem("مستقيل", "3"));
            // ddlStatus.DataSource = YourDataAccessLayer.GetEmployeeStatuses();
            // ddlStatus.DataTextField = "StatusName";
            // ddlStatus.DataValueField = "StatusID";
            // ddlStatus.DataBind();
            // ddlStatus.Items.Insert(0, new ListItem("اختر الحالة...", ""));
        }

        // هذه الدالة توضح كيفية التعامل مع الحقول المضافة ديناميكياً من جانب الخادم
        // إذا كنت ستعتمد على JavaScript بالكامل للإضافة، فستحتاج إلى قراءة القيم من Request.Form
        protected List<string> GetPhoneNumbersFromForm()
        {
            List<string> phoneNumbers = new List<string>();

            // قراءة حقل الهاتف الأول الثابت
            if (!string.IsNullOrWhiteSpace(txtPhoneNumber1.Text))
            {
                phoneNumbers.Add(txtPhoneNumber1.Text.Trim());
            }

            // قراءة الحقول المضافة ديناميكياً بواسطة JavaScript
            // تبحث عن الحقول التي تبدأ بـ "txtDynamicPhoneNumber"
            foreach (string key in Request.Form.Keys)
            {
                if (key != null && key.StartsWith("txtDynamicPhoneNumber"))
                {
                    string phoneValue = Request.Form[key];
                    if (!string.IsNullOrWhiteSpace(phoneValue))
                    {
                        phoneNumbers.Add(phoneValue.Trim());
                    }
                }
            }
            return phoneNumbers;
        }


        protected void BtnSubmitEmployee_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // التحقق من صحة المدخلات بناءً على أدوات التحقق
            {
                try
                {
                    string employeeNumber = txtEmployeeNumber.Text.Trim();
                    string employeeName = txtEmployeeName.Text.Trim();
                    string departmentId = ddlDepartment.SelectedValue;
                    string statusId = ddlStatus.SelectedValue;
                    string jobTitle = txtJobTitle.Text.Trim();
                    string hireDate = txtHireDate.Text.Trim(); // يجب تحويله إلى DateTime

                    List<string> phoneNumbers = GetPhoneNumbersFromForm();

                    // هنا يتم استدعاء منطق حفظ بيانات الموظف في قاعدة البيانات
                    // YourDataAccessLayer.AddEmployee(employeeNumber, employeeName, departmentId, statusId, jobTitle, hireDate, phoneNumbers);

                    lblAddStatus.Text = "تم حفظ بيانات الموظف بنجاح!";
                    lblAddStatus.CssClass = "text-center mb-4 block text-green-600";

                    // مسح الحقول بعد الحفظ الناجح (اختياري)
                    txtEmployeeNumber.Text = "";
                    txtEmployeeName.Text = "";
                    ddlDepartment.SelectedIndex = 0;
                    ddlStatus.SelectedIndex = 0;
                    txtJobTitle.Text = "";
                    txtHireDate.Text = "";
                    txtPhoneNumber1.Text = "";
                    // قد تحتاج إلى طريقة لمسح الحقول الديناميكية أو إعادة تحميل الصفحة
                    // pnlPhoneNumbers.Controls.Clear(); // إذا كنت تضيفها من السيرفر
                    // AddInitialPhoneNumberField(); // لإعادة إضافة الحقل الأول
                    // أو إعادة توجيه المستخدم
                    // Response.Redirect(Request.RawUrl);


                }
                catch (Exception ex)
                {
                    lblAddStatus.Text = "حدث خطأ أثناء حفظ البيانات: " + ex.Message;
                    lblAddStatus.CssClass = "text-center mb-4 block text-red-500";
                    // يمكنك تسجيل الخطأ هنا LogError(ex);
                }
            }
            else
            {
                lblAddStatus.Text = "الرجاء التأكد من تعبئة جميع الحقول المطلوبة بشكل صحيح.";
                lblAddStatus.CssClass = "text-center mb-4 block text-red-500";
            }
        }
    }
}