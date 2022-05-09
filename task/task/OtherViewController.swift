//
//  OtherViewController.swift
//  task
//
//  Created by Apple User on 01/03/22.
//

import UIKit
var counttaps = 0

func randomCGFloat() -> CGFloat {
return CGFloat(arc4random()) / CGFloat(UInt32.max)}

extension UIColor {
    func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()

        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class OtherViewController: UIViewController {
     var completionHandler: ((String?) -> Void)?
    var bgPass: ((UIColor?)-> Void)?
    @IBOutlet weak var tapCountLabel: UILabel!
    
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var labelField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func countButton(_ sender: UIButton){
        counttaps = counttaps + 1
        tapCountLabel.text = "Count Updated = " + String(counttaps)
        self.view.backgroundColor = UIColor.randomColor()
        
    }
    

    @IBAction func didTapSave() {
        
        completionHandler?(String(counttaps))
        bgPass?(self.view.backgroundColor)
        dismiss(animated: true, completion: nil)
    }
}

