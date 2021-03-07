//
//  ViewController.swift
//  Mario Kart Demo
//
//  Created by Tahmid Zaman on 3/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    
    var startingPointKartView0 = CGPoint() //Access the coordinate properties of each kart
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        startingPointKartView0 = kartView0.center //Store each karts starting point when the app loads
        startingPointKartView1 = kartView1.center
        startingPointKartView2 = kartView2.center
        // Do any additional setup after loading the view.
    }

    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view) //Access the location property of the pan gesture recognizer.
        print("Location: x:\(location.x), y:\(location.y)") // current location returned from the gesture recognizer
        let kartView = sender.view! //Access the view of the kart that was panned
        kartView.center = location //Set the kart view's position to the current position of the gesture recognizer
    }
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale //Access the scale property of the pan gesture recognizer.
        print("scale: \(scale)") //Print the scale value to the console
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale) //Adjust the scale of the kart view using the scale from the pinch gesture recognizer.
    }//All views have a transform property which, among other things, allows you to modify the view's scale rotation and translation.
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation  //Access the rotation property of the gesture recognizer that was rotated
        print("rotation: \(rotation)")  //Print the rotation value to the console
        let kartView = sender.view!  //Access the view of the kart that was panned
        kartView.transform = CGAffineTransform(rotationAngle: rotation)//Adjust the rotation of the kart view using the rotation from the pinch gesture recognizer.
    }
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        
        let kartView = sender.view! //Access the view of the kart that was panned
        //kartView.center.x += 50 //Test moving the kart's position
        UIView.animate(withDuration: 0.6) {
            kartView.center.x += 400 //the end state of your view animation, the position where the kart finishes --> off screen
        }
    }
    
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        print("Long press recognized")
        
        UIView.animate(withDuration: 0.8) { //reset the karts to its starting point
              self.kartView0.center = self.startingPointKartView0
              self.kartView1.center = self.startingPointKartView1
              self.kartView2.center = self.startingPointKartView2
        }
        
        self.kartView0.transform = CGAffineTransform.identity //scaled or rotated karts animate back to their unmodified states
        self.kartView1.transform = CGAffineTransform.identity
        self.kartView2.transform = CGAffineTransform.identity
    }
    
}

//Note: make sure to have user interaction enabled for each image in the image view section
