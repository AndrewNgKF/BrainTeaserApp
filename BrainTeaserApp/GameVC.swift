//
//  GameVC.swift
//  BrainTeaserApp
//
//  Created by IMAC on 14/5/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {
    

    @IBOutlet weak var yesBtn : CustomButton!
    @IBOutlet weak var noBtn: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    var currentCard: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.ScreenCenterPosition
        self.view.addSubview(currentCard)
        
        
    }
    
    
    
    @IBAction func yesPressed(sender: UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        } else {
            titleLbl.text = "Does This Card Match The Previous"
        }
        
        showNextCard()
    }
    
    @IBAction func noPressed (sender: UIButton) {
        checkAnswer()
        showNextCard()
        
    }
    
    func showNextCard() {
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim:POPAnimation!, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.hidden {
                noBtn.hidden = false
                yesBtn.setTitle("Yes", forState: .Normal)
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.ScreenCenterPosition, completion: { (anim:POPAnimation!, finished: Bool) in
                
                
            })
            
        }
        
    }
    //this is how you grab the nib file. It grabs an array of all the views

    func createCardFromNib() -> Card? {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }

    func checkAnswer() {
        
        
    }
    
    
}













