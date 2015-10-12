var diff;

diff = resemble('pic1.png').compareTo('pic2.png').onComplete(function(data) {
  return console.log(data);
});
