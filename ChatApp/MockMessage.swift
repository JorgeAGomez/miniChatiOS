//
//  UsersTVC.swift
//  ChatApp
//
//  Created by Jorge Gomez on 2017-11-14.
//  Copyright © 2017 Jorge Gomez. All rights reserved.
//

import Foundation
import MessageKit
import CoreLocation

struct MockMessage: MessageType {
	
	var messageId: String
	var sender: Sender
	var sentDate: Date
	var data: MessageData
	
    init(data: MessageData, sender: Sender, messageId: String, date: Date) {
		self.data = data
		self.sender = sender
		self.messageId = messageId
		self.sentDate = date
	}
	
    init(text: String, sender: Sender, messageId: String, date: Date) {
        self.init(data: .text(text), sender: sender, messageId: messageId, date: date)
	}
	
    init(attributedText: NSAttributedString, sender: Sender, messageId: String, date: Date) {
        self.init(data: .attributedText(attributedText), sender: sender, messageId: messageId, date: date)
	}

    init(emoji: String, sender: Sender, messageId: String, date: Date) {
        self.init(data: .emoji(emoji), sender: sender, messageId: messageId, date: date)
    }

}
