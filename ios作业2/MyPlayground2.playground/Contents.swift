//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func isPrimeNumber(i:Int)->Bool{
    if i<=3 {
        return i>1
    }
    for j in 2..<i {
        if i%j==0 {
            return false
        }
    }
    return true
}
var shoppingList:[Int] = []
for n in 2...10000{
    if isPrimeNumber(i: n) {
        shoppingList.append(n)
    }
}
//sort排序
var sortArr1 = shoppingList.sorted{
    $1<$0
}
print(sortArr1)
/*
 //直接插入排序
 for i in 1..<shoppingList.count {
 //待插入元素
 var temp:Int = shoppingList[i];
 var j:Int;
 /*for (j = i-1; j>=0 && a[j]>temp; j--) {
 //将大于temp的往后移动一位
 a[j+1] = a[j];
 }*/
 j = i-1
 while j>=0 {
 if(shoppingList[j]<temp){
 shoppingList[j+1] = shoppingList[j];
 }else{
 break;
 }
 j -= 1
 }
 shoppingList[j+1] = temp;
 }
 */
/*
//二分排序
for i in 0..<shoppingList.count {
    var temp:Int = shoppingList[i];
    var left:Int = 0;
    var right:Int = i-1;
    var mid:Int = 0;
    while(left<=right){
        mid = (left+right)/2;
        if(temp>shoppingList[mid]){
            right = mid-1;
        }else{
            left = mid+1;
        }
    }
    var j = i-1
    while j>=left {
        shoppingList[j+1] = shoppingList[j];
        j -= 1
    }
    if(left != i){
        shoppingList[left] = temp;
    }
}
 */
/*
//希尔排序
var d:Int = shoppingList.count;
while(true){
    d = d / 2;
    for x in 0..<d{
        var i = x+d
        while i<shoppingList.count {
            var temp:Int = shoppingList[i]
            var j:Int
            j = i-d
            while j>=0 && shoppingList[j]<temp {
                shoppingList[j+d] = shoppingList[j]
                j = j-d
            }
            shoppingList[j+d] = temp
            i = i+d
        }
    }
    if(d == 1){
        break;
    }
}
 */
/*
//选择排序
for i in 0..<shoppingList.count {
    var min:Int = shoppingList[i];
    var n:Int = i; //最小数的索引
    for j in i+1..<shoppingList.count{
        if shoppingList[j]>min {  //找出最小的数
            min = shoppingList[j];
            n = j;
        }
    }
    shoppingList[n] = shoppingList[i];
    shoppingList[i] = min;
}
print(shoppingList)
*/
