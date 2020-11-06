function validation() {
    var msg = "";
    msg += checkname();
    msg += checkgender();
    
    msg += checkcourse();
    if (msg == "") {
        return true;

    }
    else {
        alert(msg);
        return false;
    }
}

function checkname() {
    var tt = document.getElementById('txt_name');
    if (tt.value == "") {
        return 'Please enter your name!!\n\n';
    }
    else {
        return "";
    }
}
function checkgender() {

    var tt = document.getElementById('rbl_gender');
    var bl = false;
    for (var i = 1; tt.rows.length; i++) {
        if (tt.value == i) {
            bl = true;
        }
    }
    if(bl==false) {
        return "selelct gender!!\n\n";
    }
    else {
        return "";
    }
}



function checkcourse() {
    var tt = document.getElementById('ddl_course');

    if (tt.value == "0") {
        return 'Please select your course!!\n\n';
    }
    else {
        return "";
    }

}