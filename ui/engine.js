function openRenameMenu() {
	document.getElementById("buttonShow").style.display = 'none';
	document.getElementById("show").style.display = 'flex';
	WebUI.Call('EnableKeyboard');
}

function closeRenameMenu() {
	document.getElementById("buttonShow").style.display = 'block';
	document.getElementById("show").style.display = 'none';
	document.getElementById("name").value = "";
	WebUI.Call('DisableKeyboard');
}

function apply() {
	WebUI.Call('DispatchEvent', 'SquadRenamer:UIApplySquad', document.getElementById("name").value);
	closeRenameMenu();
}