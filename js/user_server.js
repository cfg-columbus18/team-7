const sql = window.SQL;
let db = new sqlite3.Database('../db/refugeedb.db', (err) => {
    if (err) {
      return console.error(err.message);
    }
    console.log('Connected to the in-memory SQlite database.');
});


function insertUser_serv(email, first, last, phone, langs, expertise, password){

    var query = "INSERT INTO users (email, first_n, last_n, phone, lang, platform, password, expertise) VALUES " +"("+ email + ", "+ first+ ", " + last + ", " + phone + "," + langs + ", " + platform+", " + password+", "+ expertise + ")";
    db.run(query, function(err){
        if(err) throw err;
    });
}


function matchingFunction(expertise, language){
    var matches = [];
    var query = "SELECT * FROM users WHERE expertise = " + expertise + "OR lang = " + language;
    db.all(query, function(err, rows){
        rows.forEach(function(row){
            matches.push(row);
        })
    });
    return matches;
}

function queryUserData(){
    var query = "SELECT expertise, language FROM users WHERE id = " + id;
    var matched = [];
    db.all(query, function(err, rows){
        rows.forEach(function(row){
            matched.push(matchingFunction(row['expertise'], row['lang']));
        })
    });
    return matched;
}