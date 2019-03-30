//
//  Client.swift
//  TestSleepy
//
//  Created by Kelly Cole on 3/30/19.
//  Copyright © 2019 Kelly Cole. All rights reserved.
//

import Foundation
import UIKit

//protocol ChatRoomDelegate: class {
//    func receivedMessage(message: Message)
//}

class Client: NSObject, StreamDelegate {
//    weak var delegate: ChatRoomDelegate?
    
    var inputStream: InputStream!
    var outputStream: OutputStream!
    
    var username = ""
    
    let maxReadLength = 1024
    
    //1) Set up the input and output streams for message sending
    func setupNetworkCommunication() {
//        let host: String // future for setting up custom server IP
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault,
                                           "localhost" as CFString,
                                           5432,
                                           &readStream,
                                           &writeStream)
        
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        
        inputStream.delegate = self
        outputStream.delegate = self
        
        inputStream.schedule(in: .main, forMode: RunLoop.Mode.common)
        outputStream.schedule(in: .main, forMode: RunLoop.Mode.common)
        
        inputStream.open()
        outputStream.open()
        
        print("setupNetworkCommunication setup completed")
    }
    
    func sendMessage(message: String) {
         let data = "msg:\(message)".data(using: .ascii)!
        _ = data.withUnsafeBytes { outputStream.write($0, maxLength: data.count) }
        print("Message sent")
    }
    
    func stopChatSession() {
        inputStream.close()
        outputStream.close()
    }
}
//
//extension Client: StreamDelegate {
//    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
//        switch eventCode {
//        case Stream.Event.hasBytesAvailable:
//            print("new message received")
//            readAvailableBytes(stream: aStream as! InputStream)
//        case Stream.Event.endEncountered:
//            stopChatSession()
//        case Stream.Event.errorOccurred:
//            print("error occurred")
//        case Stream.Event.hasSpaceAvailable:
//            print("has space available")
//        default:
//            print("some other event...")
//            break
//        }
//    }
//
//    private func readAvailableBytes(stream: InputStream) {
//        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxReadLength)
//
//        while stream.hasBytesAvailable {
//            let numberOfBytesRead = inputStream.read(buffer, maxLength: maxReadLength)
//
//            if numberOfBytesRead < 0 {
//                if let _ = inputStream.streamError {
//                    break
//                }
//            }
//
//            if let message = processedMessageString(buffer: buffer, length: numberOfBytesRead) {
//                delegate?.receivedMessage(message: message)
//            }
//        }
//    }
//
//    private func processedMessageString(buffer: UnsafeMutablePointer<UInt8>,
//                                        length: Int) -> Message? {
//        guard let stringArray = String(bytesNoCopy: buffer,
//                                       length: length,
//                                       encoding: .ascii,
//                                       freeWhenDone: true)?.components(separatedBy: ":"),
//            let name = stringArray.first,
//            let message = stringArray.last else {
//                return nil
//        }
//
//        let messageSender:MessageSender = (name == self.username) ? .ourself : .someoneElse
//
//        return Message(message: message, messageSender: messageSender, username: name)
//    }
//}
