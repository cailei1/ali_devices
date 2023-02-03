//
//  KeyChainManager.swift
//  ali_devices
//
//  Created by APPLE on 2023/2/1.
//

import Foundation

import Security

// Set username and password
let UUID_KEY = "uuid"

class KeyChainManager{
    
    static let sharedInstance = KeyChainManager()
    
    func saveKeyChain(keyChain:String){
        
        // Set attributes
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: UUID_KEY,
            kSecValueData as String: keyChain.data(using: .utf8)!,
        ]
        // Add user
        if SecItemAdd(attributes as CFDictionary, nil) == noErr {
            print("User saved successfully in the keychain")
        } else {
            print("Something went wrong trying to save the user in the keychain")
        }
    }
    
    
    func readKeyChain() -> String{
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: UUID_KEY,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]
        var item: CFTypeRef?

        // Check if user exists in the keychain
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            // Extract result
            if let existingItem = item as? [String: Any],
               let username = existingItem[kSecAttrAccount as String] as? String,
               let passwordData = existingItem[kSecValueData as String] as? Data,
               let password = String(data: passwordData, encoding: .utf8)
            {
                print(username)
                print(password)
                return password
            }
        } else {
            print("Something went wrong trying to find the user in the keychain")
            
        }
        return ""
    }
}
