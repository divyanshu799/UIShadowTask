//
//  starViewController.swift
//  task
//
//  Created by Apple User on 09/03/22.
//

import UIKit

class starViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRectangleDD()
       
    }
    
    private func drawRectangle() {
           
        
       
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 75, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 20))
            path.addLine(to: CGPoint(x: 125, y: 100))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 140, y: 150))
            path.addLine(to: CGPoint(x: 175, y: 225))
            path.addLine(to: CGPoint(x: 100, y: 175))
            path.addLine(to: CGPoint(x: 25, y: 225))
            path.addLine(to: CGPoint(x: 60, y: 150))

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = 1

            containerView.layer.addSublayer(shapeLayer)
       }
    
    private func drawRectangleDD() {
           
        let mul1 = 0.39
        let mul2 = 0.66
        let mul3 = 0.78
        let mul4 = 0.35
        let mul5 = 0.5
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: containerView.frame.height*mul1))
        path.addLine(to: CGPoint(x: containerView.frame.width*mul4, y: containerView.frame.height*mul1))
            path.addLine(to: CGPoint(x: containerView.frame.width*mul5, y:0))
        path.addLine(to: CGPoint(x: containerView.frame.width*0.65, y: containerView.frame.height*mul1))
            path.addLine(to: CGPoint(x: containerView.frame.width, y: containerView.frame.height*mul1))
        path.addLine(to: CGPoint(x: containerView.frame.width*mul2, y: containerView.frame.height*0.61))
        path.addLine(to: CGPoint(x: containerView.frame.width*0.85, y: containerView.frame.height))
            path.addLine(to: CGPoint(x: containerView.frame.width*mul5, y:containerView.frame.height*mul3))
        path.addLine(to: CGPoint(x:  containerView.frame.width*0.15, y:  containerView.frame.height))
        path.addLine(to: CGPoint(x:containerView.frame.width*0.34 , y:  containerView.frame.height*0.61))

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = 1
        imageView.layer.mask = shapeLayer
        imageView.layer.masksToBounds = true
        

     
        

            //containerView.layer.addSublayer(shapeLayer)
       }
    
   }



