﻿$(document).ready(function () {
    debugger;
    var usr = $("#userData");
    var usrData = usr.data("user");
    localStorage.removeItem("loggedInUser");
    localStorage.setItem("loggedInUser", JSON.stringify(usrData));
});
