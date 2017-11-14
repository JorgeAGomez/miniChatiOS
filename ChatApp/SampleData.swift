//
//  UsersTVC.swift
//  ChatApp
//
//  Created by Jorge Gomez on 2017-11-14.
//  Copyright © 2017 Jorge Gomez. All rights reserved.
//
import MessageKit
import CoreLocation

final class SampleData {

    static let shared = SampleData()

    private init() {}

    let messageTextValues = [
        "Hello"
    ]

    let jorge = Sender(id: "0000", displayName: "Jorge Gomez")
    let daniel = Sender(id: "1111", displayName: "Daniel")
    let andres = Sender(id: "2222", displayName: "Andres")

    lazy var senders = [jorge, daniel, andres]
  
    var currentSender: Sender!

    let messageImages: [UIImage] = []

    var now = Date()

    let messageTypes = ["Text", "Text", "Text"]

    let attributes = ["Font1"]

    let emojis = [
        "👍",
        "👋",
        "👋👋👋",
        "😱😱",
        "🎈",
        "🇧🇷"
    ]

    func attributedString(with text: String) -> NSAttributedString {
        let nsString = NSString(string: text)
        var mutableAttributedString = NSMutableAttributedString(string: text)
        let randomAttribute = Int(arc4random_uniform(UInt32(attributes.count)))
        let range = NSRange(location: 0, length: nsString.length)

        switch attributes[randomAttribute] {
        case "Font1":
            mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.preferredFont(forTextStyle: .body), range: range)
        default:
            fatalError("Unrecognized attribute for mock message")
        }

        return NSAttributedString(attributedString: mutableAttributedString)
    }

    func dateAddingRandomTime() -> Date {
        let randomNumber = Int(arc4random_uniform(UInt32(10)))
        if randomNumber % 2 == 0 {
            let date = Calendar.current.date(byAdding: .hour, value: randomNumber, to: now)!
            now = date
            return date
        } else {
            let randomMinute = Int(arc4random_uniform(UInt32(59)))
            let date = Calendar.current.date(byAdding: .minute, value: randomMinute, to: now)!
            now = date
            return date
        }
    }

    func randomMessage() -> MockMessage {

        let randomNumberSender = Int(arc4random_uniform(UInt32(senders.count)))
        let randomNumberText = Int(arc4random_uniform(UInt32(messageTextValues.count)))
        let randomMessageType = Int(arc4random_uniform(UInt32(messageTypes.count)))
        let randomNumberEmoji = Int(arc4random_uniform(UInt32(emojis.count)))
        let uniqueID = NSUUID().uuidString
        let sender = senders[randomNumberSender]
        let date = dateAddingRandomTime()

        switch messageTypes[randomMessageType] {
        case "Text":
            return MockMessage(text: messageTextValues[randomNumberText], sender: sender, messageId: uniqueID, date: date)
        case "AttributedText":
            let attributedText = attributedString(with: messageTextValues[randomNumberText])
            return MockMessage(attributedText: attributedText, sender: senders[randomNumberSender], messageId: uniqueID, date: date)
//        case "Photo":
//            let image = messageImages[randomNumberImage]
//            return MockMessage(image: image, sender: sender, messageId: uniqueID, date: date)
//        case "Video":
//            let image = messageImages[randomNumberImage]
//            return MockMessage(thumbnail: image, sender: sender, messageId: uniqueID, date: date)
//        case "Location":
//            return MockMessage(location: locations[randomNumberLocation], sender: sender, messageId: uniqueID, date: date)
        case "Emoji":
            return MockMessage(emoji: emojis[randomNumberEmoji], sender: sender, messageId: uniqueID, date: date)
        default:
            return MockMessage(text: "Test", sender: currentSender, messageId: uniqueID, date: date)
        }
    }

    func getMessages(count: Int, completion: ([MockMessage]) -> Void) {
        var messages: [MockMessage] = []
        for _ in 0...count {
            messages.append(randomMessage())
        }
        completion(messages)
    }

    func getAvatarFor(sender: Sender) -> Avatar {
        switch sender {
        case jorge:
            return Avatar(image: UIImage(named: "JorgeGomez"), initals: "JG")
        case daniel:
            return Avatar(initals: "AA")
        case andres:
            return Avatar(image: UIImage(named: "Jorge2"), initals: "AA")
        default:
            return Avatar()
        }
    }

}
