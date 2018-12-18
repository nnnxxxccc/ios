//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
    docPath.appendPathComponent("cpy")
    if !fileManager.fileExists(atPath: docPath.path) {
        try? fileManager.createDirectory(at: docPath, withIntermediateDirectories: true, attributes: nil)
    }
    docPath.appendPathComponent("image.jpg")
    print(docPath)
    if !fileManager.fileExists(atPath: docPath.path) {
        let url = URL(string: "http://cs.sicnu.edu.cn/Upload/Images/20140611215620542.jpg")
        let data = try? Data(contentsOf: url!)
        try? data?.write(to: docPath)
    }
}