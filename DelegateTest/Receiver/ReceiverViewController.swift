//
//  ReceiverViewController.swift
//  DelegateTest
//
//  Created by Casa on 06/07/2019.
//  Copyright © 2019 Casa. All rights reserved.
//

import UIKit

class ReceiverViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let senderButton: UIBarButtonItem = UIBarButtonItem(title: "Sender", style: .done, target: self, action: #selector(self.nextViewController))
        self.navigationItem.rightBarButtonItem = senderButton
        self.view.backgroundColor = UIColor.lightGray

    }

    @objc func nextViewController () {
        let senderVC = SenderViewController()
        senderVC.delegate = self
        self.navigationController?.pushViewController(senderVC, animated: true)
    }
    
}

extension ReceiverViewController: SenderDelegate {
    func updateReceiverWithDTO(senderDTO: SenderDTO) {
        nameLabel.text = senderDTO.name
        surnameLabel.text = senderDTO.surname
        ageLabel.text = "\(senderDTO.age!)"
    }
}