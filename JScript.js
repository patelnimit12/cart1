// <script type="text/javascript">
function checkEmail(myForm) {

    if (/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/.test(myForm.value)) {
        return (true);
    }
    alert("Invalid E-mail Address! Please re-enter.");
    myForm.focus();
    return (false);

}

function checkFileExtension(elem) {
    var filePath = elem.value;

    if (filePath.indexOf('.') == -1)
        return false;

    var validExtensions = new Array();
    var ext = filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

    validExtensions[0] = 'jpg';
    validExtensions[1] = 'jpeg';

    for (var i = 0; i < validExtensions.length; i++) {
        if (ext == validExtensions[i])
            return true;
    }

    alert('The file extension ' + ext.toUpperCase() + ' is not allowed!');
    return false;
}


function string_val(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;
    if ((KeyID >= 65 && KeyID <= 90) || (KeyID >= 97 && KeyID <= 122) || (KeyID == 8) || (KeyID == 32)) {
        return true;
    }
    alert("You should enter only string");
    return false;
}

function add_val(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;
    if ((KeyID >= 65 && KeyID <= 90) || (KeyID >= 97 && KeyID <= 122) || (KeyID == 8) || (KeyID == 46) || (KeyID == 32) || (KeyID >= 48 && KeyID <= 57) || (KeyID == 40) || (KeyID == 41) || (KeyID == 44) || (KeyID == 45) || (KeyID == 47)) {
        return true;
    }
    alert("You should enter only string");
    return false;

}

function pan(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;
    if ((KeyID >= 65 && KeyID <= 90) || (KeyID >= 97 && KeyID <= 122) || (KeyID == 8) || (KeyID == 32) || (KeyID >= 48 && KeyID <= 57)) {
        return true;
    }
    alert("You should enter only string");
    return false;

}
function numeric(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;

    //0-9                                 BackSpace    Delete                Arrows left   Right
    if ((KeyID >= 48 && KeyID <= 57) || (KeyID == 8) || (KeyID == 46)) {
        return true;
    }
    alert("You should enter only numbers");
    return false;
}

function phone(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;

    //0-9                                 BackSpace    Delete                Arrows left   Right                (               )               +               -               
    if ((KeyID >= 48 && KeyID <= 57) || (KeyID == 8) || (KeyID == 40) || (KeyID == 41) || (KeyID == 43) || (KeyID == 45)) {
        return true;
    }
    alert("Enter valid character");
    return false;
}

function demo(object)          //  for null field validations
{

    if (object.value=="") {
      
        alert('This field must contain a value.');
        object.focus();
        return true;
        }
}

function User(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;

    if ((KeyID != 32) && (KeyID != 33) && (KeyID != 34) && (KeyID != 35) && (KeyID != 36) && (KeyID != 37) && (KeyID != 38) && (KeyID != 39) && (KeyID != 40) && (KeyID != 41) && (KeyID != 42) && (KeyID != 43) && (KeyID != 44) && (KeyID != 45) && (KeyID != 46) && (KeyID != 47) && (KeyID != 58) && (KeyID != 59) && (KeyID != 60) && (KeyID != 61) && (KeyID != 62) && (KeyID != 63) && (KeyID != 64) && (KeyID != 91) && (KeyID != 92) && (KeyID != 93) && (KeyID != 94) && (KeyID != 95) && (KeyID != 96) && (KeyID != 123) && (KeyID != 124) && (KeyID != 125) && (KeyID != 126)) {
        return true;
    }
    return false;
}
function numeric1(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;

    //0-9                                 BackSpace    Delete                Arrows left   Right
    if ((KeyID >= 48 && KeyID <= 57) || (KeyID == 8)) {
        return true;
    }
    alert("You should enter only numbers");
    return false;
}
function add_val2(e) {
    var KeyID = (e.keyCode) ? event.keyCode : e.which;
    if ((KeyID >= 65 && KeyID <= 90) || (KeyID >= 97 && KeyID <= 122) || (KeyID == 8) || (KeyID == 46) || (KeyID == 32) || (KeyID >= 48 && KeyID <= 57) || (KeyID == 40) || (KeyID == 41) || (KeyID == 44) || (KeyID == 45) || (KeyID == 47) || (KeyID == 63)) {
        return true;
    }
    alert("You should enter only string");
    return false;

}
//function demo(object,x)          //  for null field validations
//{

//    if (object.value == "") {
//        document.getElementById('x').innerHTML = "Not Null";
//       
//        //  return false;
//    }


//}
