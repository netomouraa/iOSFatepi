//
//  ViewController.swift
//  trabalhoios
//
//  Created by Fernando Valler on 09/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var lblSenha: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    
    var token:NotificationToken = NotificationToken()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            
//            let realm:Realm = try! Realm()
//            realm.deleteAll()
//            
//            self.token = realm.addNotificationBlock { notification, realm in
//                print("Fui notificado")
//            }
//            
//            //let cad = realm.objectForPrimaryKey(Cadastro.self, key: 1)
//            let cad = realm.object(ofType: Cadastro.self, forPrimaryKey: 1)
//            self.lblLabel.text = cad!.nome
            
        } catch {
        
        }
        
//        do {
//            let realm:Realm = try! Realm()
//            let cad = realm.objects(Cadastro)
//            if cad.count < 1 {
//                
//                let cad1 = Cadastro()
//                cad1.id = 1
//                cad1.nome = "Fernando Valler"
//                try realm.write {
//                    realm.add(cad1)
//                }
//                
//            }
//        } catch {
//            fatalError("Erro ao criar o objeto \(error)")
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bntClicked(_ sender: Any) {
        
        let email = lblEmail.text
        let senha = lblSenha.text
        
        if (email != "" && senha != "") {
            
            let realm:Realm = try! Realm()
            
            let predicate = NSPredicate(format: "email = %@ AND senha = %@", email!, senha!)
            let user1 = realm.objects(Usuarios.self).filter(predicate)
            
            if user1.count == 1 {
                
                let homeView: HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
                
                self.navigationController?.pushViewController(homeView, animated: true)
                
            } else {
                
                // create the alert
                let alert = UIAlertController(title: "", message: "Usuario ou senha incorretos", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)

            }
            
        } else {
            
            // create the alert
            let alert = UIAlertController(title: "", message: "Usuario e senha obrigatorio", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)

        }
            
//        do {
//            let realm:Realm = try! Realm()
//            let cad = realm.object(ofType: Cadastro.self, forPrimaryKey: 1)
//            
//            try realm.write {
//                cad!.nome = "RENATA VALLER"
//                self.lblLabel.text = cad!.nome
//            }
//        } catch {
//            
//        }
    }

    @IBAction func btnCadastro(_ sender: Any) {
        
//        let cadastroView: CadastroViewController = self.storyboard?.instantiateViewController(withIdentifier: "CadastroVC") as! CadastroViewController
//        self.navigationController?.pushViewController(cadastroView, animated: true)
        
    }
}

