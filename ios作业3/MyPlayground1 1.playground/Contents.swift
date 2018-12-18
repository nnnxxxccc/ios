//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//第三次
//1
var dic1 = ["name":"cpy","age":"20"]
var dic2 = ["name":"dht","age":"21"]

let arr = [dic1,dic2].map{
    $0["name"]!
}
print(arr)

//2
let arr1 = ["12","123","asdfsad","dsad","24"].filter{
    Int($0) != nil
}
print(arr1)

//3
let arr2 = ["sfdsf","scfdsf","sdfds","sdfsdf"].reduce(""){
    $0 + "\n" + $1
}
print(arr2)

//4
let arr3 = [4,5,2,24,5,6]

let a = arr3.reduce((max:Int.min, min:Int.max, sum:0, avg:0.0)) { r, i in
    (max(r.max, i), min(r.min, i), r.sum + i, r.avg + Double(i)/Double(arr3.count))
}
print("max:\(a.max) min:\(a.min) sum:\(a.sum) avg:\(a.avg)\n")
//5
func one(x:Int)->Int{
    return x;
}
func two(x:Int)->Int{
    return x;
}
func three()->Int{
    return 0;
}
func four(){
    
}
func five(x:Int,y:Int)->Int{
    return x+y;
}
func six(x:Int)->Int{
    return x;
}
var arr4:[Any] = [one,two,three,four,five].filter {
    $0 is (Int)->Int
}
print(arr4)
//6
extension Int{
    mutating func sqrt() -> Double{
        let a1: Double = Double(self)
        let a2 = a1 * a1
        return a2
    }
}

var x = 2;
print(x.sqrt())

//7
func plus<T>(a:T, b:T)->T{
    if a is Int{
        let x:Int = a as! Int;
        let y:Int = b as! Int;
        return (x + y) as! T
        
    }else if a is String{
        let x:String = a as! String;
        let y:String = b as! String;
        return (x + y) as! T
        
    }else if a is Double{
        let x:Double = a as! Double;
        let y:Double = b as! Double;
        return (x + y) as! T
        
    }else{
        return "Error" as! T
    }
}
print(plus(a: 3, b: 3))
print(plus(a: 3.3, b: 3.3))
