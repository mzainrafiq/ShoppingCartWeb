$(document).ready(function () {
    var usr = localStorage.getItem("loggedInUser");
    if (usr != null && usr != undefined && usr != "") {
        var loggedInUser = JSON.parse(usr);
        if (loggedInUser.IsAdmin)
            $(".forAdmin").show();
    }
});
