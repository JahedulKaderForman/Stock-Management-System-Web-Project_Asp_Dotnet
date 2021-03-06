﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesDateUI.aspx.cs" Inherits="StockManagementSystemApp.UI.ViewSalesDateUI" EnableEventValidation="false" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Sales Date</title>



    <!-- Bootstrap core CSS
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        -->
    <link href="../Scripts/Admintheme/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom fonts for this template
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        -->
    <link href="../Scripts/Admintheme/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" />

    <!-- Page level plugin CSS
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        -->
    <link href="../Scripts/Admintheme/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />

    <!-- Custom styles for this template
    <link href="css/sb-admin.css" rel="stylesheet">
        -->
    <link href="../Content/sb-admin.min.css" rel="stylesheet" />
    <link href="../style/categoryCustomStyle.css" rel="stylesheet" />
    <link href="../Content/bootstrap-datepicker.css" rel="stylesheet" />


</head>

<body id="page-top">
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1" href="index.aspx">Stock Management</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>



            <!-- Navbar -->
            <ul class="navbar-nav ml-auto">

                <li class="nav-item">
                    <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Logout" OnClick="LogoutClick" />
                </li>
            </ul>

        </nav>

        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="CategoryUI.aspx">
                        <i class="fas fa-fw fa-table"></i>

                        <span>Category</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CompanyUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Company</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ItemUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Item</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="StockInUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Stock In</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="StockOutUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Stock Out</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="SearchViewUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Search and View</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewSalesDateUI.aspx">
                        <i class="fas fa-fw fa-table"></i>
                        <span>View Sales</span></a>
                </li>
            </ul>

            <div id="content-wrapper">

                <div class="container-fluid">
                    <!---asp code-->


                    <div class="container">

                        <div class="row justify-content-center align-items-center form-horizontal">

                            <div class="form-group form-group-sm col-sm-6">
                                <!--inputbox--->
                                <div class="row">
                                    <asp:Label ID="Label3" class="col-sm-3 col-form-label" runat="server" Text="From Date"></asp:Label>


                                    <div class="col-sm-9 custompadding">
                                        <asp:TextBox ID="FromDateTextboxId" class="form-control" runat="server"></asp:TextBox>


                                    </div>
                                </div>

                                <div class="row">
                                    <asp:Label ID="Label2" class="col-sm-3 col-form-label" runat="server" Text="To Date"></asp:Label>
                                    <div class="col-sm-9 custompadding">
                                        <asp:TextBox ID="ToDateTextboxId" CssClass="form-control" runat="server"></asp:TextBox>


                                    </div>
                                </div>


                                <!---inputboxend-->
                            </div>


                        </div>

                        <div class="row justify-content-center align-items-center">

                            <div class="col-sm-3 custompadding ">

                                <asp:Button ID="Button2" runat="server" class="btn btn-primary" OnClick="SearchButtonClick" Width="129px" Text="Search" />
                            </div>

                        </div>
                        <div class="row justify-content-center align-items-center">
                            <div class="col-sm-6 col-md-4 col-lg-4 custompadding ">
                                <asp:Label ID="LabelMessage" Visible="false" CssClass="alert alert-success" runat="server"></asp:Label>
                            </div>
                        </div>

                    </div>




                    <div class="container">
                        <asp:Label ID="LabelOutput" runat="server"></asp:Label>
                        <asp:GridView ID="SearchSellGridViewList" runat="server" CssClass="table table-hover table-striped" ShowFooter="True" AutoGenerateColumns="False" Height="150px">
                            <Columns>

                                <asp:TemplateField>
                                    <HeaderTemplate>Serial No.</HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Company Name">
                                    <ItemTemplate>
                                        <asp:Label ID="CompanyNameID" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Item">
                                    <ItemTemplate>
                                        <asp:Label ID="ItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sale Quantity">
                                    <ItemTemplate>

                                        <asp:Label ID="salequantityid" runat="server" Text='<%# Eval("SaleQuantity") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <div class="row justify-content-center align-items-center ">

                            <asp:Button ID="pdfbuttonid" class="btn btn-warning buttonmargin" runat="server" Text="Export to pdf" Visible="False" Width="120px" Height="35px" OnClick="ButtonPdfClick" />
                        </div>
                    </div>


                    <!---end asp code-->


                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © by Team Danpithe</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->
        <

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- Bootstrap core JavaScript
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        -->
    <script src="../Scripts/Admintheme/vendor/jquery/jquery.min.js"></script>
    <script src="../Scripts/Admintheme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        -->
    <script src="../Scripts/Admintheme/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
        -->
    <script src="../Scripts/Admintheme/vendor/datatables/jquery.dataTables.js"></script>
    <script src="../Scripts/Admintheme/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages
    <script src="js/sb-admin.min.js"></script>
        -->
    <script src="../Scripts/Admintheme/sb-admin.min.js"></script>

    <!-- Demo scripts for this page
    <script src="js/demo/datatables-demo.js"></script>
        -->
    <script src="../Scripts/Admintheme/datatables-demo.js"></script>

    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(document).ready(function () {
            $("#<%= FromDateTextboxId.ClientID %>").datepicker({
                format: "yyyy-mm-dd",
                autoclose: true,
                todayHighlight: true
            });

            $("#<%= ToDateTextboxId.ClientID %>").datepicker({
                format: "yyyy-mm-dd",
                autoclose: true,
                todayHighlight: true
            });
        });

    </script>

</body>

</html>


