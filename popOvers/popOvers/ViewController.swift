//
//  ViewController.swift
//  popOvers
//
//  Created by Pushparaj Selvam on 05/12/20.
//

import UIKit
 
class ViewController: UIViewController ,UIPopoverPresentationControllerDelegate {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    @IBAction func showPopoverAction(_ sender: Any) {
        let button = sender as? UIButton
        let buttonFrame = button?.frame ?? CGRect.zero
         
        // Making normal view controller to a popover throught assigning modelPresentationStyle property value to popover
        let popoverContentController = self.storyboard?.instantiateViewController(withIdentifier: "PopoverContentController") as? PopoverContentController
        popoverContentController?.modalPresentationStyle = .popover
         
        // Configuring the behaviour of the UIPopoverPresentationController instance
        // popoverPresentationController property of the popover view controller will return the instance of the UIPopoverPresentationController
        let popoverPresentationController = popoverContentController?.popoverPresentationController
        popoverPresentationController!.permittedArrowDirections = .up
        popoverPresentationController!.sourceView = self.view
        popoverPresentationController!.sourceRect = buttonFrame
        popoverPresentationController!.delegate = self
        
        
        // Finally presenting the popover
        present(popoverContentController!, animated: true, completion: nil)
        
        
        }
         
        //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
        }
         
        //UIPopoverPresentationControllerDelegate
        func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
         
        }
         
        func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
        }
    }


