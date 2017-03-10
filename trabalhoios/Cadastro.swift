//
//  Cadastro.swift
//  trabalhoios
//
//  Created by Fernando Valler on 09/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import Foundation
import RealmSwift

class Cadastro: Object {
    
    dynamic var id:Int = 0
    dynamic var nome:String = ""
    dynamic var email:String? = ""
    dynamic var senha:String? = ""
    
    override static func primaryKey() -> String? {
            return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
