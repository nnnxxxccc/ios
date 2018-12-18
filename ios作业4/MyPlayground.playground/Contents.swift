//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//1
//北京
let date1 = Date()
var dateFormatter1 = DateFormatter()
dateFormatter1.dateFormat = "yyyy年M月dd日EEEE a hh:mm"
dateFormatter1.locale = Locale(identifier: "zh_cn")
let bj = dateFormatter1.string(from: date1)
//东京
let date2 = Date()
var dateFormatter2 = DateFormatter()
dateFormatter2.dateFormat = "yyyy年M月dd日EEEE a hh:mm"
dateFormatter2.locale = Locale(identifier: "zh_cn")
dateFormatter2.timeZone = TimeZone(abbreviation: "UTC+9:00")
let tokyo = dateFormatter2.string(from: date2)
//纽约
let date3 = Date()
var dateFormatter3 = DateFormatter()
dateFormatter3.dateFormat = "yyyy年M月dd日EEEE a hh:mm"
dateFormatter3.locale = Locale(identifier: "zh_cn")
dateFormatter3.timeZone = TimeZone(abbreviation: "UTC-4:00")
let newYork = dateFormatter3.string(from: date3)
//伦敦
let date4 = Date()
var dateFormatter4 = DateFormatter()
dateFormatter4.dateFormat = "yyyy年M月dd日EEEE a hh:mm"
dateFormatter4.locale = Locale(identifier: "zh_cn")
dateFormatter4.timeZone = TimeZone(abbreviation: "UTC+1:00")
let london = dateFormatter4.string(from: date4)
print("北京时间:\(bj)")
print("东京时间:\(tokyo)")
print("纽约时间:\(newYork)")
print("伦敦时间:\(london)")

//2
var currentstr = "Swift is a powerful and intuitive programming language for iOS, OS X. tvOS, and watchOS."
while currentstr.range(of: "OS") != nil {
    currentstr.removeSubrange(currentstr.range(of: "OS")!)
}
print(currentstr)
//3
let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
    docPath.appendPathComponent("test.txt")
    print(docPath.path)
    try currentstr.write(to: docPath, atomically: true, encoding: .utf8)
    let dic = ["北京时间":bj,"东京时间":tokyo,"纽约时间":newYork,"伦敦时间":london,"del OS":currentstr] as AnyObject
    print(dic)
    dic.write(to: docPath, atomically: true)
}
var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
docPath?.appendPathComponent("test.txt")
if let readData = NSData(contentsOfFile: (docPath?.path)!) {
    //如果内容存在 则用readData创建文字列
    print(NSString(data: readData as Data, encoding: String.Encoding.utf8.rawValue))
} else {
    //nil的话，输出空
    print("Null")
}
//4
var str1:URL?
do{
    let url = URL(string: "http://cs.sicnu.edu.cn/Upload/Images/20140611215620542.jpg")
    let data = try Data(contentsOf: url!)
    if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        docPath.appendPathComponent("test.txt")
        str1 = docPath
        let picData = data as AnyObject
        picData.write(to: docPath, atomically: true)
    }
}catch{
}
do{
    let readData = try Data(contentsOf: str1!)
    let picData = readData as AnyObject
    print(picData)
}catch{
    
}
//5
do{
    let url = URL(string: "http://www.weather.com.cn/adat/sk/101270101.html")
    let data = try Data(contentsOf: url!)
    
    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
    if var dic = object as? [String:Any] {
        print(dic)
        //print(dic["weatherinfo"])
        if let weather = dic["weatherinfo"] as? [String:Any] {
            print(weather["city"])
        }
    }
}catch{
}





