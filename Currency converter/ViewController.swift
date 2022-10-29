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

private var rubRate: Float = 1
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
    var allValueFields: [UITextField] = []
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var updateSwitch: UISwitch!
    
    private func takeRate(field: UITextField) -> Float {

        let fieldSelected = field
        switch fieldSelected{
        case amdValue:
            return amdRate
        case usdValue:
            return usdRate
        case eurValue:
            return eurRate
        case aedValue:
            return aedRate
        case tklValue:
            return tklRate
        case rubValue:
            return rubRate
        default:
            return 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rubRateLabel.text = String(format: "%.2f", (1/amdRate))
        amdRateLabel.text = String(format: "%.2f", amdRate)
        usdRateLabel.text = String(format: "%.2f", usdRate)
        eurRateLabel.text = String(format: "%.2f", eurRate)
        aedRateLabel.text = String(format: "%.2f", aedRate)
        tklRateLabel.text = String(format: "%.2f", tklRate)
        
        allValueFields.append(rubValue)
        allValueFields.append(amdValue)
        allValueFields.append(usdValue)
        allValueFields.append(eurValue)
        allValueFields.append(aedValue)
        allValueFields.append(tklValue)
        
        amdValue.becomeFirstResponder()
        amdValue.layer.borderWidth = 2
    }

    private func clearFields() {
        for i in allValueFields {
            i.text = ""
        }
    }
    
    private func colorizeFields(color: UIColor) {
        for i in allValueFields {
            i.backgroundColor = color
        }
    }
    
    private func thinBorder() {
        for i in allValueFields {
            i.layer.borderWidth = 0
        }
    }
    
    private func actionsOnTouchDown(field: UITextField) {
        thinBorder()
        field.layer.borderWidth = 2
        clearFields()
    }
    
    @IBAction func rubDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: rubValue)
    }

    @IBAction func amdDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: amdValue)
    }
    
    @IBAction func usdDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: usdValue)
    }
    
    @IBAction func eurDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: eurValue)
    }
    
    @IBAction func aedDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: aedValue)
    }
    
    @IBAction func tklDidTouchDown(_ sender: Any) {
        actionsOnTouchDown(field: tklValue)
    }
    
    
    private func calculateValues(field: UITextField) {
        for i in allValueFields {
            if i != field {
                if i == rubValue {
                    i.text = String(format: "%.2f", field.text!.floatValue * takeRate(field: field))
                } else {
                    i.text = String(format: "%.2f", field.text!.floatValue * takeRate(field: field) / takeRate(field: i))
                }
                
            }
        }
    }
    
    
    @IBAction func rubDidChange(_ sender: Any) {
        calculateValues(field: rubValue)
    }

    @IBAction func amdDidChange(_ sender: Any) {
        calculateValues(field: amdValue)
    }
    
    @IBAction func usdDidChange(_ sender: Any) {
        calculateValues(field: usdValue)
    }
    
    @IBAction func eurDidChange(_ sender: Any) {
        calculateValues(field: eurValue)
    }
    
    @IBAction func aedDidChange(_ sender: Any) {
        calculateValues(field: aedValue)
    }
    
    @IBAction func tklDidChange(_ sender: Any) {
        calculateValues(field: tklValue)
    }
    
    
    @IBAction func updateDidSwitch(_ sender: Any) {
        if updateSwitch.isOn {
            clearFields()
//            colorizeFields(color: .systemGray6)
        } else {
            clearFields()
//            colorizeFields(color: .clear)
        }
    }
    

    

    
    

    

        
    @IBAction func resetDidTap(_ sender: Any) {
        clearFields()
        
    }
    
}

