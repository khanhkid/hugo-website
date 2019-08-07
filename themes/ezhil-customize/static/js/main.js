if(location.hostname == "khanhkid.github.io"){
    if (location.protocol != 'https:')
    {
     location.href = 'https:' + window.location.href.substring(window.location.protocol.length);
    }
}