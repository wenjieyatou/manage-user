/**
 * 分页
 */
	function getPage(curPage, showPage, pageCount, url, tj){
		//alert(curPage+", "+ showPage+","+ pageCount+","+url);
		var start = 0;
		var end = 0;
		var endUrl = url;
		if(curPage % showPage == 0){
			start = parseInt((curPage -1 )  / showPage) * showPage + 1;
		}else{
			start = parseInt(curPage / showPage) * showPage + 1;
		}
		end = start + showPage - 1; 
		if(end > pageCount){
			end = pageCount;
		}
		var html = "";
		if(curPage > showPage){
			endUrl = url + (start - 1) + tj; 
			html += "<li><a href='"+endUrl+"'>&lt;&lt;</a></li>";
		}
		for(var i=start; i<=end; i++){
			if(curPage == i){
				html += "<li><span class='current'> <font color='black'>" + i + "</font></span></li>";
			}else{
				endUrl = url + i + tj; 
				html += "<li><a href='" + endUrl + "'>" + i + "</a></li>";
			}
		}
		
		if(end < pageCount){
			endUrl = url + (end + 1) + tj; 
			html += "<li><a href='" + endUrl + "'>&gt;&gt;</a></li>";
		}
		return html;
	}