module.exports = function(robot) {
  var rot13;
  rot13 = function(keyword) {
    var original;
    original = 'abcdefghijklmnopqrstuvwxyz';
    return keyword.split('').map(function(c) {
      var index;
      index = original.indexOf(c);
      if (index >= 0) {
        return original.charAt((index + 13) % 26);
      } else {
        return c;
      }
    }).join('');
  };
  return robot.respond(/rot13\s+(.+)$/i, function(res) {
    var converted, keyword;
    keyword = res.match[1];
    converted = rot13(keyword);
    return res.send(converted);
  });
};
