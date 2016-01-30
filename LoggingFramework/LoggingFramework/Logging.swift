//
//  Logging.swift
//  LoggingFramework
//
//  Created by pandazheng on 1/30/16.
//  Copyright © 2016 pandazheng. All rights reserved.
//

import Foundation

public func NSLog(string : String) {
    let name = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
    print("\(NSDate()) \(name) \(string)")
}

public class Logging {
    public init() {
        
    }
    
    public func testMethod() {
        print("Test Method")
    }
    
    public class func testClassMethod() {
        print("Test Class Method")
    }
    
}
