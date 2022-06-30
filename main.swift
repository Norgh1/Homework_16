//
//  main.swift
//  Homework_16
//
//  Created by Nor Gh on 28.06.22.
//

import Foundation

//Exe 1
// Rect proparty for class View (frame:Rect)

struct Rect {
    var x: Double
    var y: Double
    var wight: Double
    var hight: Double
    
    init(x: Double,y: Double,wight: Double,hight: Double) {
        self.x = x
        self.y = y
        self.wight = wight
        self.hight = hight
    }
}
// Exe 1
// Color proparty for class View (backgroundColor:Color)

struct Color {
    var blue:String
    var black:String
    var red:String
    
    init(blue:String, black:String,red:String) {
        self.red = red
        self.black = black
        self.blue = blue
    }
}

//Exe 1
class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int
    
    init(frame: Rect, backgroundColor: Color, tag: Int) {
        self.tag = tag
        self.frame = frame
        self.backgroundColor = backgroundColor
    }
    
   convenience init(frame: Rect, backgroundColor: Color) {
       self.init(frame: frame, backgroundColor: backgroundColor, tag: 0)
    }
    
    convenience init(frame: Rect) {
        self.init(frame: frame, backgroundColor: Color(blue: "blue", black: "black", red: "red"))
    }
    
}

// Exe 2

class GITCViewController {
    var frame: Rect
    var navigationTitle: String
    
    init(){
        self.frame = Rect(x: 0, y: 0, wight: 0, hight: 0)
        self.navigationTitle = "title"
    }
    convenience init(navigationTitle: String){
        self.init()
    }
    convenience init(frame: Rect){
        self.init()
    }
        
}

var instanceFristOne = GITCViewController()
var instanceTwo = GITCViewController(frame:Rect(x: 0, y: 0, wight: 0, hight: 0))
var instaceThree = GITCViewController(navigationTitle: "title")

// Exe 3

struct PhoneNumber {
    var code: String
    var number: String
    
    init?(code: String, number: String) {
        if code.isEmpty || number.count == 0 {
            self.code = "code"
            self.number = "number"
        } else {
        self.code = code
        self.number = number
        }
    }
    init?(number: String){
        self.init(code: "", number: "")
        if number.isEmpty {
            self.number = "+374"
        }
    }
}

var firstOne = PhoneNumber(code: "", number: "")
var otherOne = PhoneNumber(number: "")


print("Annas phone number is:\(firstOne!)")
print("\(otherOne!)")


//Exe 4 ?????? 

class CallManager {
    var callFrom:PhoneNumber
    var callTo:PhoneNumber

    init?(callFrom:PhoneNumber?, callTo:PhoneNumber?){
        self.callFrom = PhoneNumber(code: "374", number: "+374")!
        self.callTo = PhoneNumber(code: "374", number: "374")!
    }
}
//Exe 5
enum RequestMethod {
    case post
    case get
    case delete
}
//Exe 5
class LoadDataFromServer {
    var requestUrl:String
    var requestMethod: RequestMethod
    
    init?(requestUrl:String, requestMethod: RequestMethod){
        self.requestUrl = requestUrl
        self.requestMethod = requestMethod
    }
    
    
    /// other case  ??? 
    
    convenience init?(request: RequestMethod){
        self.init(requestUrl: "URL", requestMethod: .get)
        func postRequest(){
            print("Post Request!")
        }
        func getRequest(){
           print("Get Request!")
        }
        func deleteRequest(){
            print("Delete Request!")
        }
        
        func getRequestMethod(request: RequestMethod) {
            switch request {
            case .post: return postRequest()
            case .get: return getRequest()
            case .delete: return deleteRequest()
            }
        }
        
    }
}

let requestPost = LoadDataFromServer(requestUrl: "https/request.com/post", requestMethod: .post)




let requestPostTwo = LoadDataFromServer(request: .post)
print(requestPost!.requestMethod)                                // POST

let requestDelete = LoadDataFromServer(request: .delete)         //delete
print(requestDelete!.requestMethod)

let getRequest = LoadDataFromServer(request: .get)
print(getRequest!.requestMethod)                                  //GET
