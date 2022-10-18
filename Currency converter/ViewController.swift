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
    
    func takeRate(field: UITextField) -> Float {

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
        
        allValueFields.append(rubValue)
        allValueFields.append(amdValue)
        allValueFields.append(usdValue)
        allValueFields.append(eurValue)
        allValueFields.append(aedValue)
        allValueFields.append(tklValue)
        
        amdValue.becomeFirstResponder()
        amdValue.backgroundColor = .systemGray6
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
    
    private func colorizeOnTouchDown(field: UITextField) {
        colorizeFields(color: .clear)
        field.backgroundColor = .systemGray6
    }
    
    
    private func calculateValues(field: UITextField) {
        for i in allValueFields {
            if i != field {
                if i == rubValue {
                    i.text = String(Int(round(field.text!.floatValue * takeRate(field: field))))
                } else {
                    i.text = String(Int(round(field.text!.floatValue * takeRate(field: field) / takeRate(field: i))))
                }
                
            }
        }
    }
    
    @IBAction func updateDidSwitch(_ sender: Any) {
        if updateSwitch.isOn {
            clearFields()
            colorizeFields(color: .systemGray6)
        } else {
            clearFields()
            colorizeFields(color: .clear)
        }
    }
    
    @IBAction func amdDidTouchDown(_ sender: Any) {
        colorizeOnTouchDown(field: amdValue)
    }
    
    @IBAction func amdDidChange(_ sender: Any) {
//        rubValue.text = String(Int(round(amdValue.text!.floatValue * amdRate)))
        calculateValues(field: amdValue)
    }
    
    
    @IBAction func rubDidTouchDown(_ sender: Any) {
        colorizeOnTouchDown(field: rubValue)
    }
    
    @IBAction func rubDidChange(_ sender: Any) {
        amdValue.text = String(Int(round(rubValue.text!.floatValue / amdRate)))
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

