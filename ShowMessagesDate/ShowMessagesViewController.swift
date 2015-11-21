//
//  ShowMessagesViewController.swift
//  ShowMessagesDate
//
//  Created by Ayman  on 10/2/15.
//  Copyright © 2015 ayman mohamed. All rights reserved.
//

import Foundation
import UIKit

class ShowMessagesViewController: UIViewController {
  
  //MARK: Instance Variables
  @IBOutlet var messagesTableView: UITableView!
  
  var messages : [Message] = []
  var messagesCellsSet =  Set<MessageTableViewCell>()
  var maxTranslation:CGFloat = 0.0
  var timeShown = false
  
  //MARK: View Life cycle
  override func viewDidLoad() {
    setMessages()
    setGesture()
    setTableViewCellHeight()
  }
  
  //MARK: Helper Methods
  func setMessages(){
    
    messages.append(Message(messageContent: "Hi", messageDate: "7.11 Pm", type: MessageType.Send))
    messages.append(Message(messageContent: "Hi", messageDate: "7.11 Pm", type: MessageType.Recived))
    messages.append(Message(messageContent: "How are you?", messageDate: "7.12 Pm", type: MessageType.Send))
    messages.append(Message(messageContent: "I am fine", messageDate: "7.13 Pm", type: MessageType.Recived))
    messages.append(Message(messageContent: "Did you go to work today or not ?", messageDate: "7.14 Pm", type: MessageType.Send))
    messages.append(Message(messageContent: "Yes i did", messageDate: "7.14 Pm", type: MessageType.Recived))
  }
  
  func setGesture(){
    let tableViewGesture = UIPanGestureRecognizer()
    tableViewGesture.delegate = self
    tableViewGesture.addTarget(self, action: "detectPan:")
    messagesTableView.addGestureRecognizer(tableViewGesture)
  }
  
  func setTableViewCellHeight (){
    messagesTableView.rowHeight = UITableViewAutomaticDimension
    messagesTableView.estimatedRowHeight = 80
  }
  
  func detectPan(recognizer:UIPanGestureRecognizer) {
    
    let translation  = recognizer.translationInView(self.messagesTableView)
    for cell in messagesCellsSet {
      if translation.x > 0 {   //  Hide
        if cell.messageTimeTrailingConstraint.constant >= -maxTranslation {
          var newConstant = cell.messageTimeTrailingConstraint.constant - translation.x
          if newConstant < -maxTranslation {
            newConstant = -maxTranslation
          }
          UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            cell.messageTimeTrailingConstraint.constant = newConstant
            cell.layer.layoutIfNeeded()
            } , completion: nil)
          cell.timeShown = true
          self.timeShown = true
        }
      } else if translation.x < 0 { //  Show
        
        if  translation.y < 5 && translation.y > -3 || timeShown {  // move up nagtive
          
          if translation.x > -maxTranslation - 20 {
            let newConstant = cell.messageTimeTrailingConstraint.constant + (translation.x * -1)
            UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
              
              if newConstant > 16 {
                cell.messageTimeTrailingConstraint.constant = 16
              } else {
                cell.messageTimeTrailingConstraint.constant = newConstant
              }
              cell.layer.layoutIfNeeded()
              }, completion: nil)
            
          }
          cell.timeShown = true
          timeShown = true
          
        }
      }
      
      if recognizer.state == UIGestureRecognizerState.Ended {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
          cell.messageTimeTrailingConstraint.constant = -self.maxTranslation
          cell.timeShown = false
          self.timeShown = false
          cell.layer.layoutIfNeeded()
          }, completion: nil)
        
      }
    }
    
  }
}

extension ShowMessagesViewController:UITableViewDataSource , UITableViewDelegate , UIGestureRecognizerDelegate {
  
  // table view data source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let message = messages[indexPath.row]
    var identifier = ""
    if message.messageType == MessageType.Send {
      identifier = "recivedMessageCell"
    } else {
      identifier = "sendMessageCell"
    }
    let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MessageTableViewCell
    cell?.selectionStyle = UITableViewCellSelectionStyle.None
    if maxTranslation == 0.0 {
      maxTranslation = cell!.messageTimeLabel.bounds.width
    }
    cell!.setCell(message)
    messagesCellsSet.insert(cell!)
    return cell!
  }
  
  // gesture Recongnizer delegate
  func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}