//
//  Usuarios.swift
//  trabalhoios
//
//  Created by Fernando Valler on 10/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import Foundation
import RealmSwift

class Usuarios: Object {
    
    dynamic var id:Int = 0
    dynamic var nome:String = ""
    dynamic var email:String? = ""
    dynamic var senha:String? = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Incrementa ID
//    func IncrementaID() -> Int{
//        let realm = try! Realm()
//        let RetNext: NSArray = Array(realm.objects(Usuarios).sorted("id"))
//        let last = RetNext.lastObject
//        if RetNext.count > 0 {
//            let valor = last?.valueForKey("id") as? Int
//            return valor! + 1
//        } else {
//            return 1
//        }
//    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
