//
//  CalculateViewController.swift
//  tipCalculator
//
//  Created by etudiant-06 on 02/03/2017.
//  Copyright © 2017 mehdi. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: === VARIABLES & CONSTANTES ===
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var checkAmountLabel: UILabel!
    @IBOutlet weak var checkAmountTextField: UITextField!
    @IBOutlet weak var serviceLabel: UILabel!
    var serviceLabelText = ["Service 10%", "Service 15%", "Service 20%"]
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var convertedAmountLabel: UILabel!
    
    // Les Boutons étoiles
    @IBOutlet weak var firstStar: UIButton!
    @IBOutlet weak var secondStar: UIButton!
    @IBOutlet weak var thirdStar: UIButton!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    // Appel du cerveau des opérations
    var brain = CalculatorModel()
    
    
    //MARK: === AUTRES FONCTIONS ===
    
    @IBAction func serviceButtonTapped(_ sender: UIButton) {
        //print( "button tapped N° \(sender.tag)" )
        let imagePleine = #imageLiteral(resourceName: "fleche_pleine")
        let imageCreuse = #imageLiteral(resourceName: "fleche_creuse")
        brain.serviceLevel = sender.tag
        serviceLabel.text = serviceLabelText[brain.serviceLevel]
        tipLabel.text = brain.tipLabel[brain.serviceLevel]
        
        
//        switch brain.serviceLevel {
//        case 0:
//            self.firstStar.setImage(imagePleine, for: .normal)
//            self.secondStar.setImage(imageCreuse, for: .normal)
//            self.thirdStar.setImage(imageCreuse, for: .normal)
//            self.serviceLabel.text = "Service 10%"
//
//        case 1:
//            self.firstStar.setImage(imagePleine, for: .normal)
//            self.secondStar.setImage(imagePleine, for: .normal)
//            self.thirdStar.setImage(imageCreuse, for: .normal)
//            self.serviceLabel.text = "Service 15%"
//            
//        case 2:
//            self.secondStar.setImage(imagePleine, for: .normal)
//            self.thirdStar.setImage(imagePleine, for: .normal)
//            self.serviceLabel.text = "Service 20%"
//            
//        default:
//            self.firstStar.setImage(imageCreuse, for: .normal)
//            self.secondStar.setImage(imageCreuse, for: .normal)
//            self.thirdStar.setImage(imageCreuse, for: .normal)
//            self.serviceLabel.text = "Service 0%"
//        }
        
        // Pour simplifier au max par des ternaires à la place du Switch ci-dessus
        self.firstStar.setImage(imagePleine, for: .normal)
        self.secondStar.setImage(brain.serviceLevel >= 1 ? imagePleine : imageCreuse, for: .normal)
        self.thirdStar.setImage(brain.serviceLevel >= 2 ? imagePleine : imageCreuse, for: .normal)
        
        if let amount = checkAmountTextField.text, let formattedAmount = stringToDouble(amount) {
            brain.checkAmount = formattedAmount
            self.amountLabel.text = " \(String(brain.computedTip)) €"
            convertedAmountLabel.text = "\(String(brain.computedTip * brain.conversionRate))"
            updateCurrencyConversion()
            
        }
        
    }
    
    // Choix de la conversion à effectuer
    @IBAction func defineCurrency(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.amountLabel.text = "0.00€"
            self.checkAmountTextField.text = "0.00€"
            self.checkAmountLabel.text = "Montant"
            self.convertedAmountLabel.text = "($0.00)"
            
        case 1:
            self.amountLabel.text = "$0.00"
            self.checkAmountTextField.text = "$0.00"
            self.checkAmountLabel.text = "Amount"
            self.convertedAmountLabel.text = "(0.00€)"
        default:
            break
        }
    }
    
    // Mise à jour de la conversion
    func updateCurrencyConversion() {
        if self.currencySegmentedControl.selectedSegmentIndex == 0 {
            convertedAmountLabel.text = ( ("$ ") + ( brain.computedTip / brain.conversionRate ).toFormattedString! )
            
        } else {
            convertedAmountLabel.text = ( ( brain.computedTip * brain.conversionRate ).toFormattedString! + " €" )
        }
        
    }
    
    // Disparition du clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: === FONCTIONS LIEES A LA VUE ===
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.checkAmountTextField.text = "0.00€"
        self.checkAmountLabel.text = "Montant"
    }
}
