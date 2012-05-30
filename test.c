#include <stdlib.h>

int compare(const void *x, const void *y)
{
  if((*(int*)x)>(*((int*)y)))
	return 1;
  else if((*(int*)x)<(*((int*)y)))
	return -1;
  else
	return 0;
}

void bubble(int *arr, int size)
{
  int tmp;
  for(int i=0;i<size;i++)
	for(int j=0;j<size;j++)
	  if(arr[i]>arr[j])
	  {
		tmp = arr[j];
		arr[j]=arr[i];
		arr[i] = tmp;
	  }
}

void sort (int *arr,int size)
{
  qsort(arr,size, sizeof(int),compare);
}

