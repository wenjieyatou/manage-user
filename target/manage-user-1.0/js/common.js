function strFormat(val){
	if(typeof(val)== 'undefined' || val == '' || val == null){
		return '';
	}
	val =  val.replace(/\n/g,'<br/>');
	val =  val.replace(/\r/g,'<br/>');
	val =  val.replace(/\r\n/g,'<br/>');
	val =  val.replace(/\s/g,'&nbsp;');
	return val;
}

function strReFormat(val){
	if(typeof(val)== 'undefined' || val == '' || val == null){
		return '';
	}
	val =  val.replace(/<br\/>/g, "\n");
	val =  val.replace(/&nbsp;/g, " " );
	return val;
}
