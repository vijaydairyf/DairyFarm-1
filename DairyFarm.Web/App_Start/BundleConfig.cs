﻿using System.Web;
using System.Web.Optimization;

namespace DairyFarm.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Content/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Content/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Content/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Content/Scripts/bootstrap.js",
                      "~/Content/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/morris-charts").Include(
            "~/Content/css/morris.css",
            "~/Content/css/example.css"
            ));

            bundles.Add(new ScriptBundle("~/bundles/morris-charts").Include(
                      "~/Content/Scripts/Gruntfile.js",
                      "~/Content/Scripts/morris.js",
                      "~/Content/Scripts/morris.min.js",
                      "~/Content/Scripts/example.js"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/flot-charts").Include(
                      "~/Content/Scripts/plugins/flot/jquery.flot.js",
                      "~/Content/Scripts/plugins/flot/jquery.flot.tooltip.js",
                      "~/Content/Scripts/plugins/flot/jquery.flot.resize.js",
                      "~/Content/Scripts/plugins/flot/jquery.flot.pie.js",
                      "~/Content/Scripts/plugins/flot/flot-data.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/css/bootstrap.css",
                      "~/Content/css/sb-admin.css",
                      "~/Content/font-awesome/css/font-awesome.css",
                      "~/Content/themes/base/dialog.css",
                      "~/Content/css/site.css",
                      "~/Content/css/jquery-ui.css",
                      "~/Content/css/bootstrap-dialog.css",
                      "~/Content/css/jquery.dataTables.css",
                      "~/Content/css/jquery.dataTables_themeroller.css"
                      ));

            bundles.Add(new StyleBundle("~/Content/select2").Include(
          "~/Content/css/select2.css"));

            bundles.Add(new ScriptBundle("~/bundles/custom").Include(
                "~/Content/Scripts/jquery-ui.js",
                "~/Content/Scripts/jquery.ui.datepicker-fr.js",
                "~/Content/Scripts/dairy-farm.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/select2").Include(
                "~/Content/Scripts/select2.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/unobtrusive-ajax").Include(
                "~/Content/Scripts/jquery.unobtrusive-ajax.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap-dialog").Include(
                "~/Content/Scripts/bootstrap-dialog.js"
                ));
            bundles.Add(new ScriptBundle("~/bundles/dataTable").Include(
                "~/Content/Scripts/jquery.dataTables.js"
                ));
        }
    }
}
