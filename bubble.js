function bubble(arr, size)
{
  var tmp;
  for(var i=0;i<size;i++)
	for(var j=0;j<size;j++)
	  if(arr[i]>arr[j])
	  {
		tmp = arr[j];
		arr[j]=arr[i];
		arr[i] = tmp;
	  }
}
