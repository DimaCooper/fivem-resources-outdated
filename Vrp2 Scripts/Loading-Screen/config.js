/* 
	Config File For Simple Loading Screen v1.0
	NOTE: IF YOU WANT A CUSTOM BACKGROUND, IT MUST BE NAMED 'bg.jpg'
 	Made by G.H.0.S.T
 */


var title = ""; /* Insert server or community name here */

var description = "RolePlay"; /* Insert a short description or a slogan, set to "" to remove it */


/* Modify rules here */
var rules = [
"Соблюдайте правила",
"Уважайте других игроков",
"Получайте удовольствие",
"Вступите в дискорд",
			 ]; 



/* DO NOT MODIFY ANYTHING BELOW */

var counter = 0;
var elem = document.getElementById("rules");
setInterval(change, 3000);

function change() {
  elem.innerHTML = rules[counter];
  counter++;
  if (counter >= rules.length) {
    counter = 0;
  }
}

function changeText(){
    document.getElementById('text02 title').innerHTML = title;
    document.getElementById('text01 desc').innerHTML = description;
}
changeText();