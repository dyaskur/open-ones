<!--
 Screen: Manage master "Department"
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="resources/handsontable/lib/jquery-1.10.2.js"></script>
<script src="resources/handsontable/jquery.handsontable.full.js"></script>
<script src="resources/handsontable/lib/jquery-ui/js/jquery-ui.custom.min.js"></script>

<link rel="stylesheet" media="screen" href="resources/handsontable/jquery.handsontable.full.css">
<link rel="stylesheet" media="screen" href="resources/handsontable/lib/jquery-ui/css/ui-bootstrap/jquery-ui.custom.css">

<link rel="stylesheet" href="resources/jstree/themes/default/style.min.css" />
<script src="resources/jstree/jstree.min.js"></script>

<form:form action="saveMasterDepartment" method="POST">
  <div id="jstree_demo_div" class="col_3">
  </div>
  <div class="col_9">
    <div>
      <label for="parentDepartment">Chọn phòng ban</label>
       <form:select id="parentDepartment" path="parentDepartment">
        <option value="0">Công ty</option>
      </form:select>
    </div>

    <div>
        <div id="dataTable"></div>
        <div id="separator"></div>
        <a id="save" class="button" href="master.department">Lưu</a>
    </div>
  </div>
</form:form>
<script>
  $(function () {
    $('#jstree_demo_div').jstree({
    		  "core" : {
    			    "animation" : 0,
    			    "check_callback" : true,
    			    "themes" : { "stripes" : true },
    			    'data' : {
    			      'url' : function (node) {
    			        return node.id === '#' ?
    			          'master.department.getNodeRoot' : 'master.department.getNodeChildren';
    			      },
    			      'dataType' : 'JSON',
    			      'data' : function (node) {
    			        return { 'id' : node.id };
    			      }
    			    }
    			  },
    			  "types" : {
    			    "#" : {
    			      "max_children" : 1, 
    			      "max_depth" : 4, 
    			      "valid_children" : ["root"]
    			    },
    			    "root" : {
    			      "icon" : "/static/3.0.2/assets/images/tree_icon.png",
    			      "valid_children" : ["default"]
    			    },
    			    "default" : {
    			      "valid_children" : ["default","file"]
    			    },
    			    "file" : {
    			      "icon" : "glyphicon glyphicon-file",
    			      "valid_children" : []
    			    }
    			  },
    			  "plugins" : [
    			    "contextmenu", "dnd", "search",
    			    "state", "types", "wholerow"
    			  ]
    }      
    );
    }
  );
</script>

<script>
    $(document).ready(function() {
      var departmentData = [
                  ['', '', '', ''],
              ];
//         function createJsonSection(json) {
//             var jsonObj = [];

//             for (var i in json) {
//                 var obj = {};
//                 obj["cd"] = json[i]["cd"];
//                 obj["name"] = json[i]["name"];
//                 obj["manager"] = json[i]["manager"];
//                 obj["note"] = json[i]["note"];

//                 // Skip the empty lines
//                 if ((obj["cd"]) != null && (obj["name"] != null)) {
//                   jsonObj.push(obj);
//                 }
//             }

//             return jsonObj;
//         }

        var container = $("#dataTable");
        var parent = container.parent();
        container.handsontable({
            data: departmentData,
            startRows: 5,
            // dataShema: [cd: null, name: null, manager: null, note: null],
            startCols: 4,
            rowHeaders: true,
            colHeaders: ['Mã phòng ban', 'Tên phòng ban', 'Trưởng phòng', 'Ghi chú'],
            colWidths: [90, 150, 100, 150],
            manualColumnResize: true,
            minSpareRows: 1
        });
        $("#save").click(function() {
            var tableData = container.handsontable('getData');

            var parentDepartment = $('#parentDepartment').val();

            var formDataJson = JSON.stringify({"parentDepartment": parentDepartment,  "data":tableData});

            alert("formDataJson=" + formDataJson);
            
            $.ajax({
                type: "POST",
            	dataType: 'json',
                contentType: 'application/json',
                url: "saveMasterDepartment",
                data: formDataJson,
                success: function(res) {
                    alert(res.data);
                    window.location = "master.department";
                },
                error: function() {
                    window.location = "master.department";
                }
            });
        });
    });
</script>