//
//  ContactsHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import Contacts
import ContactsUI


func getAppsUsingContacts() -> [String] {
    let store = CNContactStore()
    let keysToFetch = [CNContactViewController.descriptorForRequiredKeys()]
    var apps = [String]()
    store.requestAccess(for: .contacts) { granted, error in
        if granted {
            let predicate = CNContact.predicateForContactsInContainer(withIdentifier: store.defaultContainerIdentifier())
            do {
                let cnContacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
                for contact in cnContacts {
                    //print("App using contacts:", contact.givenName)
                    apps.append(contact.givenName)
                }
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Access to contacts denied by user.")
        }
    }
    
    return apps

}
