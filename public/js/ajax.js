function getEvent(obj, t) {
    var strconfirm = confirm(t);
    if(strconfirm == true) {
        var url = $(obj).attr("url");
        $.ajax({url: url, success: function(result)})
    }
}