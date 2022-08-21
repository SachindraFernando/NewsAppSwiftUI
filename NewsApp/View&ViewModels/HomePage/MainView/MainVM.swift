//
//  MainVM.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import Foundation

class MainVM: ObservableObject {
    
    @Published var tabBarShow: Bool
    
    init() {
        
        self.tabBarShow = true
        
    }
}

