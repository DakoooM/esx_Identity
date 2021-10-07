const Identity = []

$('#runIt').on('click', function(e){
    e.preventDefault();
    $.post('http://Identity/getInfos', JSON.stringify({
        firstName: $("#MyNameIs").val() || "",
        SubName: $("#MySubNameIs").val() || "",
        Size: $("#MySizeIs").val() || "",
        DateOfBirth: $("#MyDateOfBirth").val() || ""
    }));
});

window.addEventListener("message", (event) => {
    let eventType = event.data;
    switch (eventType.type) {
        case "showUI":
            $('#log_in_Section').fadeIn(300);
            break;
        case "hideUI":
            $('#log_in_Section').fadeOut(300);
            break;
    default:
        break;
    }
});