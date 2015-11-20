//
//  Message.swift
//  ShowMessagesDate
//
//  Created by Ayman  on 11/20/15.
//  Copyright © 2015 ayman mohamed. All rights reserved.
//

import Foundation

enum MessageType  {
  case Recived
  case Send
  init() {
    self = .Recived
  }
}

class Message: NSObject {
  
  var content :String!
  var time :String!
  var messageType :MessageType!
  
  override init() {
    content = ""
    time = ""
  }
  
  init(messageContent : String , messageDate : String , type : MessageType) {
    content = messageContent
    time = messageDate
    messageType = type
  }
}