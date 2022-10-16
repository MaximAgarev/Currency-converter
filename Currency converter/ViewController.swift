//
//  ViewController.swift
//  Currency converter
//
//  Created by Maxim Agarev on 16/10/2022.
//

import UIKit

private extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

private var amdRate: Float = 0.1561
private var usdRate: Float = 63.06
private var eurRate: Float = 62.47
private var aedRate: Float = 16.91
private var tklRate: Float = 3.39


class ViewController: UIViewController {

    @IBOutlet weak var amdLabel: UILabel!
    @IBOutlet weak var rubLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var aedLabel: UILabel!
    @IBOutlet weak var tklLabel: UILabel!
    
    @IBOutlet weak var rubRateLabel: UILabel!  // rate to AMD
    @IBOutlet weak var amdRateLabel: UILabel!
    @IBOutlet weak var usdRateLabel: UILabel!
    @IBOutlet weak var eurRateLabel: UILabel!
    @IBOutlet weak var aedRateLabel: UILabel!
    @IBOutlet weak var tklRateLabel: UILabel!
        
    @IBOutlet weak var amdValue: UITextField!
    @IBOutlet weak var rubValue: UITextField!
    @IBOutlet weak var usdValue: UITextField!
    @IBOutlet weak var eurValue: UITextField!
    @IBOutlet weak var aedValue: UITextField!
    @IBOutlet weak var tklValue: UITextField!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var updateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rubRateLabel.text = String(round((1/amdRate)*100)/100)
        amdRateLabel.text = String((amdRate))
        usdRateLabel.text = String((usdRate))
        eurRateLabel.text = String((eurRate))
        aedRateLabel.text = String((aedRate))
        tklRateLabel.text = String((tklRate))
        
        amdValue.becomeFirstResponder()
    }


    @IBAction func amdDidChange(_ sender: Any) {
        rubValue.text = String(Int(round(amdValue.text!.floatValue * amdRate)))
    }
    
    @IBAction func rubDidChange(_ sender: Any) {
        amdValue.text = String(Int(round(rubValue.text!.floatValue * amdRate)))
    }
        
    @IBAction func resetDidTap(_ sender: Any) {
        amdValue.text = ""
        rubValue.text = ""
        usdValue.text = ""
        eurValue.text = ""
        aedValue.text = ""
        tklValue.text = ""
        
    }
    
}

