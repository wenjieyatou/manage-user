function imgPreview(url, path, type){
	if(type == 1){
		if(url != ''){
			url = url.substring(0,url.lastIndexOf("_")) + url.substring(url.lastIndexOf("."));
		}
	}
	var html = "<img src='"+path + "/upload" + url+"' width='400px' >";
	dialog =art.dialog({
	    content: html,
	    lock: true,
	    resize: true,
    	outsideCancleable: true,
    	padding: '0px 0px'
	});
}