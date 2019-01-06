//
//  MessageCreationViewController.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/21/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageCreationViewController: UIViewController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Appearance.backgroundGray
        navigationBar.delegate = self
        style()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
    
    @IBAction func clearText(_ sender: Any) {
        messageTextView.text = ""
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let message = messageTextView.text else { return }
        
        messageController?.createMessage(with: message, completion: { (_) in
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func discardMessage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func style(){
        messageTextView.backgroundColor = Appearance.backgroundGray
        messageTextView.textColor = .white
        
        let cornerRadiusTextButton = max(clearTextButton.frame.width, clearTextButton.frame.height) / 12.0
        let cornerRadiusMessageButton = max(sendMessageButton.frame.width, sendMessageButton.frame.height) / 12.0
        
        clearTextButton.backgroundColor = Appearance.lambdaRed
        sendMessageButton.backgroundColor = Appearance.lambdaRed
        
        clearTextButton.layer.cornerRadius = cornerRadiusTextButton
        sendMessageButton.layer.cornerRadius = cornerRadiusMessageButton
        
        sendMessageButton.setTitleColor(.white, for: .normal)
        clearTextButton.setTitleColor(.white, for: .normal)
        
        
    }
    
    var messageController: MessageController?

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var sendMessageButton: UIButton!
}
