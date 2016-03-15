j3(() => {
  var i = 0;
  setInterval(() => {
    j3('#rotate-cube').attr('rotation', '0,'+i+',0');
    i += 6;
  }, 20);
});
