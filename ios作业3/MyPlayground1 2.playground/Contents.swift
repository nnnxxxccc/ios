//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
enum Gender:Int{
    case female = 1;
    case male = 0;
}
enum Course:String{
    case iOS = "iOS";
    case Java = "Java";
    case C = "C";
}
protocol SchoolProtocol{
    var course:Course{get}
    func lendBook()
}
class Person:NSObject{
    var firstName:String
    var lastName:String
    var age:Int = 0
    var gender:Gender
    var fullName:String{
        get{
            return firstName+lastName
        }
    }
    convenience init(firstName:String, lastName:String, age:Int, gender:Gender) {
        self.init(fName:firstName, lName:lastName, age:age, gender:gender)
    }
    init(fName:String, lName:String, age:Int, gender:Gender) {
        self.firstName = fName
        self.lastName = lName
        self.age = age
        self.gender = gender
    }
    override var description: String{
        return "fullName:\(self.fullName), age:\(self.age), gender:\(self.gender)\n"
    }
    func run(){
        print("Person \(self.fullName) is running\n")
    }
}
var p1 = Person(fName: "Cai", lName: "Pengyuan", age: 20, gender: .male)
var p2 = Person(fName: "Cai", lName: "Pengyuan", age: 21, gender: .male)
p1.run()
print(p1)
func ==(p1:Person,p2:Person)->Bool{
    if p1.age == p2.age && p1.fullName == p2.fullName && p1.gender == p2.gender {
        return true
    }else{
        return false
    }
}
func !=(p1:Person,p2:Person)->Bool{
    if p1.age == p2.age && p1.fullName == p2.fullName && p1.gender == p2.gender {
        return false
    }else{
        return true
    }
}
print(p1 != p2)

class Teacher:Person, SchoolProtocol{
    var course: Course
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String, course:String){
        self.title = title
        self.course = Course(rawValue: course)!
        super.init(fName: firstName, lName: lastName, age: age, gender: gender)
    }
    func lendBook(){
        print("\(self.fullName) lend \(self.course) book\n")
    }
    override var description: String{
        return "fullName:\(self.fullName), age:\(self.age), gender:\(self.gender), title:\(self.title)\n"
    }
    override func run() {
        print("Teacher \(self.fullName) is running\n")
    }
}
var tea1 = Teacher(firstName: "Li", lastName: "Guiyang", age: 40, gender: .male, title: "iOS", course: "iOS")
var tea2 = Teacher(firstName: "Fan", lastName: "Xiangkui", age: 35, gender: .male, title: "Java", course: "Java")
var tea3 = Teacher(firstName: "Liao", lastName: "Xuehua", age: 40, gender: .female, title: "C", course: "C")
print(tea1)
tea1.lendBook()
tea1.run()
class Student:Person, SchoolProtocol{
    func lendBook() {
        print("\(self.fullName) lend \(self.course) book")
    }

    var course: Course
    var stuNo:Int
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:Int, course:String){
        self.stuNo = stuNo
        self.course = Course(rawValue: course)!
        super.init(fName: firstName, lName: lastName, age: age, gender: gender)
    }
    override var description: String{
        return "fullName:\(self.fullName), age:\(self.age), gender:\(self.gender), stuNo:\(self.stuNo)\n"
    }
    override func run() {
        print("Student \(self.fullName) is running\n")
    }
}
var stu1 = Student(firstName: "Cai", lastName: "Pengyuan", age: 20, gender: .male, stuNo: 2014110301, course: "iOS")
var stu2 = Student(firstName: "Da", lastName: "Hengtong", age: 21, gender: .male, stuNo: 2014110302, course: "Java")
var stu3 = Student(firstName: "Deng", lastName: "Yali", age: 20, gender: .female, stuNo: 2014110303, course: "C")
stu1.run()
print(stu1)
stu2.lendBook()

var totalarr = [p1,p2,tea1,tea2,tea3,stu1,stu2,stu3]
var personarr = [Person]()
var teacherarr = [Teacher]()
var studentarr = [Student]()
for p in totalarr {
    if p.classForCoder == Person.self {
        personarr.append(p )
    }else if p.classForCoder == Student.self{
        studentarr.append(p as! Student)
    }else{
        teacherarr.append(p as! Teacher)
    }
}
print(personarr.count)
print(studentarr.count)
print(teacherarr.count)

var totalDic = ["Person":personarr,"Teacher":teacherarr,"Student":studentarr]
print(totalDic)

totalarr.sort{$0.age>$1.age}
print(totalarr)
totalarr.sort{$0.fullName>$1.fullName}
print(totalarr)
totalarr.sort{p1, p2 in
    if p1.gender == p2.gender {
        return p1.age > p2.age
    }
    else{
        return p1.gender.rawValue > p2.gender.rawValue
    }
}
print(totalarr)

for p in totalarr{
    p.run()
}


