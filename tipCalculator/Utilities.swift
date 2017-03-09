import UIKit

func stringToDouble(_ myString: String) -> Double? {
    
    //    let formatter = NumberFormatter()
    //    let myNumber = formatter.number(from: myString)
    //    let myDouble = myNumber?.doubleValue
    //    return myDouble
    
    return NumberFormatter().number(from: myString)?.doubleValue
}


/// Convertit un Double en String
///
/// - parameter myDouble:   Double en entrée
/// - parameter nbOfDigits: Nombre exact de chiffres après la virgule.
///
/// - returns: La String en résultat
func doubleToString(myDouble: Double, nbOfDigits: Int) -> String? {
    let formatter = NumberFormatter()
    
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = nbOfDigits
    formatter.minimumFractionDigits = nbOfDigits
    
    if let output = formatter.string(from: NSNumber(value:myDouble)) {
        return output
    } else {
        return nil
    }
}

/**
 * Fait monter ou descendre la vue entière de moveValue pixels.
 - parameter up : true pour monter la vue. false pour descendre
 - parameter cv :
 */
func animateViewMoving (vc: UIViewController, up: Bool, moveValue: CGFloat) {
    let movementDuration:TimeInterval = 0.3
    let movement:CGFloat = (up ? -moveValue : moveValue)
    UIView.beginAnimations( "animateView", context: nil)
    UIView.setAnimationBeginsFromCurrentState(true)
    UIView.setAnimationDuration(movementDuration )
    vc.view.frame = vc.view.frame.offsetBy(dx: 0,  dy: movement)
    UIView.commitAnimations()
}

extension Double {
    var toFormattedString : String? {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        if let output = formatter.string(from: NSNumber(value:self)) {
            return output
        } else {
            return nil
        }
    }
}





