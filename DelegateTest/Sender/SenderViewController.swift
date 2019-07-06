//
//  SenderViewController.swift
//  DelegateTest
//
//  Created by Casa on 06/07/2019.
//  Copyright © 2019 Casa. All rights reserved.
//

import UIKit

struct SenderDTO {
    let name: String?
    let surname: String?
    let age: Int?
}

protocol SenderDelegate {
    func updateReceiverWithDTO(senderDTO : SenderDTO)
}

class SenderViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!

    var name: String = ""
    var surname: String = ""
    var age: Int = 0

    var senderDTO: SenderDTO?

    var delegate: SenderDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDelegate()
        self.view.backgroundColor = UIColor.lightGray

    }
    
    func initializeDelegate () {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        ageTextField.delegate = self
    }

    func setAllFields () {
        if name != "" && surname != "" && age != 0 {
            senderDTO = SenderDTO(name: name, surname: surname, age: age)
            setSaveButton()
        }
    }

    @objc func sendDTODelegate() {
        self.delegate?.updateReceiverWithDTO(senderDTO: self.senderDTO!)
        self.navigationController?.popViewController(animated: true)
    }

    func setSaveButton () {
        let saveButton: UIBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(self.sendDTODelegate))

        if senderDTO != nil {
            self.navigationItem.rightBarButtonItem = saveButton
        }
    }

}

extension SenderViewController: UITextFieldDelegate {

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // Se ha pulsado para empezar a escribir
        print("")
        return true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        // ha terminado el empezado a editar el textfield
        print("")
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {

        print("")
    }

    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // Se termino de editar
        print("")
        if !textField.text!.isEmpty ?? false {
            if textField == nameTextField {
                name = textField.text ?? ""
            } else if textField == surnameTextField {
                surname = textField.text ?? ""
            } else if textField == ageTextField {
                if let ageTemp = Int(textField.text ?? "0") {
                    age = ageTemp
                }
            }
        } else {
            // No hay nada
        }

        setAllFields()
        dismissKeyboard()
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Ha cambiado los caracteres que se presionaron
        print("")
        return true
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("")
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Se ha presionado el boton de return

        if !textField.text!.isEmpty ?? false {
            if textField == nameTextField {
                name = textField.text ?? ""
            } else if textField == surnameTextField {
                surname = textField.text ?? ""
            } else if textField == ageTextField {
                if let ageTemp = Int(textField.text ?? "0") {
                    age = ageTemp
                }
            }
        } else {
            // No hay nada
        }

        setAllFields()

        dismissKeyboard()
        print("")
        return true
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
