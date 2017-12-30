//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//Live Frame: animations will happen in here

let liveViewFrame = CGRect(x: 0, y:0, width: 500, height: 500) //The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white
PlaygroundPage.current.liveView = liveView

//Subview to the live frame

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple
liveView.addSubview(square)


//MARK: - Animate the subview with a completion handler that animates it back!

//UIView.animate(withDuration: 2.0, animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//    square.center = liveView.center
//}) { (_) in
//    UIView.animate(withDuration: 1.0, animations: {
//        square.backgroundColor = .blue
//        square.frame = smallFrame
//    })
//}


//MARK: - Second animation with options and delay

//UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height:
//    100)
//    }, completion: nil)


//MARK: - Third animation using transformaiton: scale, rotate, transform

UIView.animate(withDuration: 2.0, animations: {
    square.backgroundColor = .orange

    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)

    square.transform = comboTransform
}) { (_) in
    UIView.animate(withDuration: 2.0, animations: {
        square.transform = CGAffineTransform.identity
    })
}
