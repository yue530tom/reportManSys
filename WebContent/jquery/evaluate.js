function initVersionSelect(jsonstr){
      var list = jsonstr.versionList;
      var i = 0;
      for(; i <list.length; i++){
    	  var version = list[i].version;
    	  $("#version_select").append('<option id="version_'+version+'" value="'+version+'">'+version+'</option>');
      }
      var j = i+1;
      //$("select option:nth-child("+2+")").attr("selected" , "selected");  
      $("#version_select option:last").attr("selected","selected");
     var select_size = $("#version_select").children().length;
     //alert(select_size);
    //  $("#version_select").get(0).selectedIndex=3;
    //  $("#version_select").append('<option id="new_version" value="新建version">新建version</version>');
      //alert($("#version_select").children().length);
}
function changeOption(){
	 if($("#version_select").val()==0){
		 var flag = confirm("确定要创建新版本吗？");
		 if(flag){
			 var size = $("#version_select").children().length;
			 $("#version_select").append('<option id="version_'+size+'" value="'+size+'">'+size+'</option>');
			 $("#version_select option:last").attr("selected","selected");
		 }else{
			 $("#version_select option:last").attr("selected","selected");
		 }
	 }else{
	 }
}

function clearText(id){
	$(id).val("");
}
function reFixText(id,str){
	var content = $(id).val();
	if(content == ''){
		$(id).val(str);
		}
	}
function showCorrectBox(){
	var tmp_name=$('input[name="dd_com_result"]:checked').val();

	if(tmp_name == 1){
		$("#correct_box").show();
		}else{
			$("#correct_box").hide();
			$("#correct_box").val("请输入正确的query");
			}
	}


function doQuery(){
	var query_name = $("#query_name").val();
	if(query_name == "请输入查询词"){
		return alert("请输入查询词！ ");
	}
	if(query_name == $("#Query_name").text()){
		return;
	}else{
		clearPage();
	}
	$("#Query_name").text(query_name);
	var version = $("#version_select").val();
	//alert(query_name);
	var inquireJs = {};
	inquireJs["query_name"] = query_name;
	inquireJs["version"] = version;
	var data = null;
	data = "query_name=" + JSON.stringify(inquireJs);
	$.ajax({
		type : "GET",
		url : "query_inquire",
		data : data,
		dataType : "JSON",
		success : function(json) {
			if(json.msg == "same"){
				var flag =  confirm("该查询词的查询结果与数据库中一致，仍要查看吗？ ")
				if(flag){
					refreshPage(json);
				}else{
					clearPage();
				}
			}else{
				refreshPage(json);
			}
			
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}


function refreshPage(json){
	var jsonObj = json;
	var jo_dd = jsonObj.dd;
    var jo_jd = jsonObj.jd;
    var jo_am = jsonObj.am;
    
    var queryName = $("#Query_name").text();
   

    var dd = "dd";
    var jd = "jd";
    var am = "am";
    var partOfQueryInfo = {};
    var partOfDd = {};
    var partOfJd = {};
    var partOfAm = {};
    for(var p in json){
    	if( p == dd){
    		partOfDd = getPartInfo(jo_dd);
    		partOfQueryInfo["dd"] = partOfDd;
    		refreshInfoDiv(dd,jo_dd);
    	}
    	if( p == jd){
    		partOfJd = getPartInfo(jo_jd);
    		partOfQueryInfo["jd"] = partOfJd;
    		refreshInfoDiv(jd,jo_jd);
    	}
    	if( p == am){
    		partOfAm = getPartInfo(jo_am);
    		partOfQueryInfo["am"] = partOfAm;
    		refreshInfoDiv(am,jo_am);
    	}
    }
    $("#partOfQueryInfo").text(JSON.stringify(partOfQueryInfo));

}

function getPartInfo(jsonStr){
	var shopObj = {};
	if(jsonStr.hasOwnProperty("correctResult")){
		shopObj["correctResult"] = jsonStr.correctResult;
	}else{
		if(jsonStr.searchKey == "noResult" || jsonStr.searchKey == "error"){
			shopObj["searchKey"] = "noResult";
		}else{
			shopObj["searchKey"] = jsonStr.productList[0].productName;
		}
	}
	return shopObj;
}

function refreshInfoDiv(name,valueJson){
	//alert(JSON.stringify(valueJson));
	$("a.product_prompt_info").css("display","block");
	$(".result_prompt_info_div").css("display","block");
	var queryName;
	var temp = $("#Query_name").text();
		queryName = $("#Query_name").text();
	
    if(valueJson.searchKey == "noResult"){
        $("#"+"{0}".format(name)+"_correct").text(queryName);
        $("#"+"{0}".format(name)+"_correct").css("color","#9E9E0C");
    	$("#"+name+"_no_result_show").append('<span style="color:#000; font-size:16px; display:block">&nbsp;&nbsp;没有搜索结果返回!</span>');
    }else{
    	if(valueJson.searchKey == "error"){
            $("#"+"{0}".format(name)+"_correct").text(queryName);
            $("#"+"{0}".format(name)+"_correct").css("color","#B7B705");
        	$("#"+name+"_no_result_show").append('<span style="color:#000; font-size:16px; display:block">&nbsp;&nbsp;返回切词召回结果!</span>');
    	}else{
    		var correctResult;
    		if(valueJson.hasOwnProperty("correctResult")){
    			correctResult = valueJson.correctResult;
    			 $("#"+"{0}".format(name)+"_correct").text(correctResult);
    			 $("#"+"{0}".format(name)+"_correct").css("color","red");
    		}else{
    			correctResult = queryName;
    			 $("#"+"{0}".format(name)+"_correct").text(correctResult);
    			 $("#"+"{0}".format(name)+"_correct").css("color","green");
    		} 	
    		 var proList = valueJson.productList;
    		 for(var i=0; i < proList.length; i++){
    			 var product = proList[i];
    			 var productName = product.productName;
    			 var productNameVice = product.productNameVice;
    			 var publishName = product.publishName;
    			 var authorName = product.authorName;
    			 var productImg = product.productImg;
    			 var productUrl = product.productUrl;
    			 
    			 $("#"+"{0}".format(name)+"_product_list").append('<li id="'+'{0}_pro_'.format(name)+ i + '"></li>');
    			 $("#"+"{0}_pro_".format(name)+i).append('<div class="content_div" id="'+'{0}_content_div_'.format(name)+i+'"></div>');
    			 $("#"+"{0}_content_div_".format(name)+i).append('<a class="picture" href="'+productUrl+'" id="'+'{0}_picture_'.format(name)+i+'"</a>');
    			 $("#"+"{0}_picture_".format(name)+i).append('<img src="'+productImg+'"></img>');
    			 $("#"+"{0}_content_div_".format(name)+i).append('<div class="product_info" id="'+'{0}_product_info_'.format(name)+i+'"></div>');
    			 $("#"+"{0}_product_info_".format(name)+i).append('<p id="'+'{0}_product_name_p_'.format(name)+i+'"></p>');
    			 $("#"+"{0}_product_name_p_".format(name)+i).append('<a title="'+productName+'" id="'+'{0}_product_name_a_'.format(name)+i+'" href="'+productUrl+'"></a>');
    			 $("#"+"{0}_product_name_a_".format(name)+i).append('<span>'+productName+'</span>');
    			 $("#"+"{0}_product_info_".format(name)+i).append('<p id="'+'{0}_product_author_p_'.format(name)+i+'"></p>');
    			 $("#"+"{0}_product_author_p_".format(name)+i).append('<a title="'+authorName+'" id="'+'{0}_product_author_a_'.format(name)+i+'" >'+authorName+'</a>');
    			 $("#"+"{0}_product_author_p_".format(name)+i).append('<em>&nbsp;|&nbsp;</em>');
    			 $("#"+"{0}_product_author_p_".format(name)+i).append('<a title="'+publishName+'" id="'+'{0}_product_publish_a_'.format(name)+i+'">'+publishName+'</a>');
    			 $("#"+"{0}_product_info_".format(name)+i).append('<p id="'+'{0}_product_infovice_p_'.format(name)+i+'"></p>');
    			 $("#"+"{0}_product_infovice_p_".format(name)+i).append('<a title="'+productNameVice+'" class="product_detail_info" id="'+'{0}_product_infovice_a_'.format(name)+i+'" href="'+productUrl+'">'+productNameVice+'</a>');
 	 
    		 }
    	}
    }
}

String.prototype.format= function(){

    var args = arguments;

    return this.replace(/\{(\d+)\}/g,function(s,i){

      return args[i];

    });
}

function clearPage(){
	$("#dd_product_list").empty();
	$("#jd_product_list").empty();
	$("#am_product_list").empty();
	$("span.query_correct").css("color","rgba(20, 85, 185, 0.9)");
	$("input[name=dd_com_result]").attr("checked","false");
	$("input[name=jd_com_result]").attr("checked","false");
	$("input[name=am_com_result]").attr("checked","false");
	$("input:radio").attr("checked",false);
	$("p.no_result_show").empty();
	$(".result_prompt_info_div").css("display","none");
	$('.product_prompt_info').css("display","none");
}

function commitQuery(){
	var query_name_input = $("#query_name").val();
	if(query_name_input == "请输入查询词"){
		return alert("请输入查询词！ ");
	}
	
	var partOfInfo = $("#partOfQueryInfo").text();
	var queryName = $("#Query_name").text();
	if(queryName == ""){
		return alert("请先查询query！ ");
	}

	var ddEvalResult=$('input[name="dd_com_result"]:checked').val();
	var jdEvalResult=$('input[name="jd_com_result"]:checked').val();
	var amEvalResult=$('input[name="am_com_result"]:checked').val();
	
	if(ddEvalResult == 1){
		var ddCorrectAbsolute = $("#correct_box").val();
        if(ddCorrectAbsolute == "请输入正确的query"){
        	alert("请输入纠正后的query!");
        	return;
        }
	}
	if(ddEvalResult ==null || jdEvalResult==null || amEvalResult ==null ){
		alert("请对商品结果做出评测！ ");
		return;
	}
	 
	var jsonStr = eval('(' + partOfInfo + ')');
	jsonStr.dd.evalResult = ddEvalResult;
	jsonStr.jd.evalResult = jdEvalResult;
	jsonStr.am.evalResult = amEvalResult;
	
	if($("#correct_box").val() != "请输入正确的query"){
		jsonStr.ddCorrctAbsolute = $("#correct_box").val();
	}
	var version = $("#version_select").val();
	jsonStr.versionName = version;
	jsonStr.queryName = queryName;
	//var temp = JSON.stringify(jsonStr);
	//alert(temp);
	
	var data_encode = encodeURI( JSON.stringify(jsonStr));
	data_encode = data_encode.replace(/\&/g,"%26");
	var data = "evalInfo=" + data_encode;
	//var text = JSON.stringify(jsonStr);
	//alert(JSON.stringify(jsonStr));
	//var data = "evalInfo=" +'{"dd":{"searchKey":"世界艺术史九讲（全彩插图第8版）：畅销全美30年，荣获多个奖项的艺术入门读物；清晰梳理艺术发展脉络，一书囊括全球艺术精华","evalResult":"1"},"jd":{"correctResult":"世界地理","evalResult":"0"},"am":{"searchKey":"図解 日中クロスボーダーMA·再編の実務","evalResult":"1"},"ddCorrctAbsolute":"世界地理","version":"3","queryName":"世界第理"}';
	$.ajax({
		type : "GET",
		url : "deal_eval_info",
		data : data,
		dataType : "JSON",
		success : function(json) {
			alert(json.commit);
			clearPage();
			//clearText();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			//  alert(textStatus+errorThrown.getMessage());
		}
	});
	
}
