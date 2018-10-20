function insertUser(){
    var email = document.getElementById('email').value;
    var first = document .getElementById('first').value;
    var last = document.getElementById('last').value;
    var phone = document.getElementById('phone').value;
    var city = document.getElementById('city').value;
    var state = document.getElementById('state').value;
    var country = document.getElementById('country').value;
    var langs = document.getElementById('langs').value;
    var platforms = document.getElementById('platforms').value;
    var expertise = document.getElementById('expertise').value;
    var password = document.getElementById('password').value;
    var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance 
    xmlhttp.open("POST", "/json-handler");
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xmlhttp.send(JSON.stringify({email:email, first:first, last:last, phone:phone, langs:langs, platforms:platforms, expertise:expertise, password:password}));
    insertUser_serv(email, first, last, phone, city, state, country, langs, platforms, expertise, password);
}


