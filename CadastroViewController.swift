//
//  CadastroViewController.swift
//  
//
//  Created by Fernando Valler on 10/03/17.
//
//

import UIKit
import RealmSwift

class CadastroViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSalvar(_ sender: Any) {
        
        do {
            
            let realm:Realm = try! Realm()
            
            let nome = txtNome.text!
            let email = txtEmail.text!
            let senha = txtSenha.text!
            
            if (nome != "" && email != "" && senha != "") {
                
                //objeto
                let cad1 = Usuarios()
                
                //gerar um novo id
                var nid = realm.objects(Usuarios.self).map{$0.id}.max() ?? 0
                nid = nid + 1
                
                cad1.id = nid
                cad1.nome = nome
                cad1.email = email
                cad1.senha = senha
                    
                //salva o objeto
                try realm.write {
                        realm.add(cad1)
                }
                
            } else {
                
                // create the alert
                let alert = UIAlertController(title: "", message: "Nome, Email e Senha são obrigatorios", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
                
            }
            
            self.navigationController?.popViewController(animated: true)
            
        } catch {
            fatalError("Erro ao criar o objeto \(error)")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
