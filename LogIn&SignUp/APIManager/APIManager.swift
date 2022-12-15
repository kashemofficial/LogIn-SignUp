//
//  APIManager.swift
//  LogIn&SignUp
//
//  Created by Abul Kashem on 13/12/22.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(){
        let headers: HTTPHeaders = [
            .contentType("application/json")
            ]
       // AF.request(register_url, method: .post, parameters: , encoder: JSONParameterEncoder.default,headers: headers)
        
    }
}
