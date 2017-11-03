//
//  ViewController.swift
//  Minhas anotacoes Aula
//
//  Created by Jamilton  Damasceno
//  Copyright © Jamilton  Damasceno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textoTextView: UITextView!
    let minhaAnotacaoChave = "minhaAnotacao"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //recuperar dados
        let textoRecuperado = self.recuperarDadosAnotacao()
        textoTextView.text = textoRecuperado
        
    }
    
    @IBAction func salvarAnotacao(_ sender: AnyObject) {
        
        if let texto = textoTextView.text {
           self.salvarDadosAnotacao(texto: texto )
           esconderTeclado()
        }
        
    }
    
    func salvarDadosAnotacao( texto: String ){
        UserDefaults.standard().set( texto , forKey: minhaAnotacaoChave)
    }
    
    func recuperarDadosAnotacao() -> String {
        
        let textoRecuperado = UserDefaults.standard().object(forKey: minhaAnotacaoChave)
        
        if textoRecuperado != nil {
            return textoRecuperado as! String
        }else{
            return ""
        }
        
    }
    
    func esconderTeclado(){
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        esconderTeclado()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

