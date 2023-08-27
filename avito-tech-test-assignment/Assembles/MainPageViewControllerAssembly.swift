//
//  MainPageViewControllerAssembly.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

struct MainPageViewControllerAssembly{
    func create() -> MainPageViewController{
        let mainPageView = MainPageView()
        
        let controller = MainPageViewController(mainPageView: mainPageView)
        
        mainPageView.delegate = controller
        
        return controller
    }
}
