//
//  ViewController.swift
//  task
//
//  Created by Apple User on 01/03/22.
//

import UIKit
let defaultss = UserDefaults()
class ViewController: UIViewController, UIApplicationDelegate {
   
   
    var indexCu: Int = 0
    @IBOutlet weak var viewNew: UIView!
    var foreCount = 0
    var tapCount = 0
    var currentImage = UIImage()
    var imgArr: [UIImage] = [UIImage(named: "field")!,UIImage(named: "new")!,UIImage(named: "photo")!,UIImage(named: "wp5519602")!]
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var cornerRBtn: UIButton!
    @IBOutlet weak var roundBtn: UIButton!
    @IBOutlet weak var squareBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let data = defaultss.value(forKey: "number") as? Int {
            self.imageView.image = self.imgArr[data]
        }

        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.currentImage = self.imageView.image!
            
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { [self] (notification) in
            switch self.foreCount {
                case 0:
                self.imageView.image = self.imgArr[self.foreCount + 1]
                case 1:
                self.imageView.image = self.imgArr[self.foreCount-1]
                case 2:
                self.imageView.image = self.imgArr[self.foreCount + 1]
                case 3:
                self.imageView.image = self.imgArr[self.foreCount]
                default:
                     self.foreCount = 0
                self.imageView.image = UIImage(named: "new")
                
                }
            self.foreCount = self.foreCount + 1
                
            }
        NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: nil) { (notification) in
         self.currentImage = self.imageView.image!

        }
    
        
        NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: nil) { (notification) in
            if self.tapCount == 1{
                self.tapCount = self.tapCount + 3
            }
            self.tapCount = self.tapCount - 1
            self.indexCu = self.tapCount
            defaultss.set(self.indexCu, forKey: "number")
            print( self.indexCu)
        }
    }

    @IBAction func ClickBtn(_ sender: UIButton) {
       
        if roundBtn.isTouchInside {
            
            self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2
            self.imageView.clipsToBounds = true
            imageView.shadowCircle()
            viewNew.shadowOfCornerRadius(cornerRadius: viewNew.frame.width/2, shadowColor: .gray, shadowRadius: CGFloat(self.shadowSlider.value))
            self.imageView.layer.mask = nil
            viewNew.layer.mask = nil
}
        else if cornerRBtn.isTouchInside {
            self.imageView.layer.cornerRadius = 25
            self.imageView.clipsToBounds = true
            viewNew.shadowOfCornerRadius(cornerRadius: 25, shadowColor: .gray, shadowRadius: CGFloat(self.shadowSlider.value))
            viewNew.layer.mask = nil
            self.imageView.layer.mask = nil
        }
        else if squareBtn.isTouchInside {
        self.imageView.layer.cornerRadius = 0
          self.imageView.clipsToBounds = true
            viewNew.shadowOfCornerRadius(cornerRadius: 5, shadowColor: .gray, shadowRadius: CGFloat(self.shadowSlider.value))
            self.imageView.layer.mask = nil
            viewNew.layer.mask = nil
    }
        else if starBtn.isTouchInside {
           drawRectangleDD()
        //viewNew.changeShadow(shadowColor: .gray, shadowRadius: CGFloat(self.shadowSlider.value))
    self.imageView.clipsToBounds = true
            
        }
    }

    @IBAction func changeBtn(_ sender: UIButton) {
        
        switch tapCount {
        case 0:
            self.imageView.image = imgArr[tapCount]
            
        case 1:
            self.imageView.image = imgArr[tapCount]
            
        case 2:
            self.imageView.image = imgArr[tapCount]
           
        case 3:
            self.imageView.image = imgArr[tapCount]
            
        default:
            tapCount = 0
            self.imageView.image = imgArr[tapCount]
        }
        tapCount = tapCount + 1
        
    }
    @objc func applicationWillTerminate(_ : Notification){
      self.currentImage = self.imageView.image!
    }
    
    @IBAction func sliderTap(_ sender: UISlider) {
        let value = sender.value
        viewNew.changeShadow(shadowColor: .gray, shadowRadius: CGFloat(value))
    }
    fileprivate func drawRectangleDD() {
           
        let mul1 = 0.39
        let mul2 = 0.66
        let mul3 = 0.78
        let mul4 = 0.35
        let mul5 = 0.5
            let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.viewNew.frame.height*mul1))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*mul4, y: self.viewNew.frame.height*mul1))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*mul5, y:0))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*0.65, y: self.viewNew.frame.height*mul1))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width, y: self.viewNew.frame.height*mul1))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*mul2, y: self.viewNew.frame.height*0.61))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*0.85, y: self.viewNew.frame.height))
        path.addLine(to: CGPoint(x: self.viewNew.frame.width*mul5, y:self.viewNew.frame.height*mul3))
        path.addLine(to: CGPoint(x:  self.viewNew.frame.width*0.15, y:  self.viewNew.frame.height))
        path.addLine(to: CGPoint(x:self.viewNew.frame.width*0.34 , y:  self.viewNew.frame.height*0.61))
        path.close()
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.lineWidth = 1
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.75
        shapeLayer.shadowOffset = .zero
//        self.viewNew.layer.shadowOpacity = 1
//        self.viewNew.layer.shadowRadius = 15
//        self.viewNew.layer.shadowColor = UIColor.gray.cgColor
        
         self.imageView.layer.mask = shapeLayer
        self.imageView.layer.masksToBounds = true
       self.viewNew.layer.mask = shapeLayer
            //viewNew.layer.addSublayer(shapeLayer)
     
        
    }

}
extension UIView{
    func shadowOfCornerRadius(cornerRadius: CGFloat, shadowColor: UIColor,shadowOffset: CGRect = .zero, shadowOpacity: Float = 1, shadowRadius: CGFloat){
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowRadius = shadowRadius
    }
    func changeShadow(shadowColor: UIColor,shadowOffset: CGRect = .zero, shadowOpacity: Float = 1,shadowRadius: CGFloat){
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    func shadowCircle(){
        layer.cornerRadius =  self.frame.width * 0.5
        layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        layer.shadowRadius = 5
    }
    
    
}
