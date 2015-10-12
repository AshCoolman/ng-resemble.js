diff = resemble 'pic1.png'
    .compareTo 'pic2.png'
    .onComplete (data)->
        console.log data