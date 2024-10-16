function clock(){
		var today = new Date();
		var hour = today.getHours();
		var minute = today.getMinutes();
		var second = today.getSeconds();
		document.getElementById("clock").innerHTML = hour + " : " + minute + " : " + second;
		setTimeout("clock()",1000);
}