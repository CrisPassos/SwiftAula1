//
//  ViewController.swift
//  DesenvAula1
//
//  Created by Usuário Convidado on 22/02/17.
//  Copyright © 2017 Cristiana. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //torna o foco da view como default
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegar via código
        tfEmail.delegate = self
        tfPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //quando o usuário tocou na viewcontroller
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }

    func gotoNextScreen() {
        print("Estoy aqui")
    }
   
   
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfName:
            //mudar o foco para o próximo
            //elemento responsável pelo primeiro foco
            tfEmail.becomeFirstResponder()
        case tfEmail:
            //mudar o foco para o próximo
            tfPassword.becomeFirstResponder()
        default:
            //ir para próxima tela
            tfPassword.resignFirstResponder()
            gotoNextScreen()
        }
        
        return true
    }
    
    //bloqueia o text enquanto nao for escrever
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return !textField.text!.isEmpty
    }
    
    //fazer a mascara, contagem de caracteres 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
}

