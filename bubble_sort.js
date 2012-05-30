Array.prototype.bubbleSort = function(){
  var array = this
  var size = array.length
  var tmp
  for(var i = 0; i < size; i++)
    for(var j = 0; j < size; j++)
      if(array[i] > array[j]){
        tmp = array[j]
        array[j] = array[i]
        array[i] = tmp
      }
}
