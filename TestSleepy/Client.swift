//
//  Client.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/30/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import Foundation
import UIKit

class Client: NSObject, StreamDelegate {

    var inputStream: InputStream!
    var outputStream: OutputStream!
    
    let maxReadLength = 1024
    
    //Set up the input and output streams
    func setupNetworkCommunication() {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "192.168.1.69" as CFString,
                                           5432,
                                           &readStream,
                                           &writeStream)
        
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        
        inputStream.delegate = self
        outputStream.delegate = self
        
        inputStream.schedule(in: .main, forMode: .commonModes)
        outputStream.schedule(in: .main, forMode: .commonModes)
        
        inputStream.open()
        outputStream.open()
        
        print("setupNetworkCommunication setup completed")
    }
    
    //Sending a message to the remote server
    func sendMessage(message: String) {

        if(message == ""){
            print("no data sent")
        }
        else{
            let data = "\(message)".data(using: .ascii)!
            _ = data.withUnsafeBytes { outputStream.write($0, maxLength: data.count) }
            print(message);
            print("Message sent")
        }

    }
    
    //Closing the in/out streams
    func stopSession() {
        inputStream.close()
        outputStream.close()
    }
}
