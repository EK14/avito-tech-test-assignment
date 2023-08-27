//
//  MainPageView.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import UIKit

protocol MainPageViewProtocol: UIView{
    func didLoad()
}

class MainPageView: UIView {
    
    weak var delegate: MainPageViewControllerDelegate?
    
    func changeColor(){
        self.backgroundColor = .yellow
    }

    
}

extension MainPageView: MainPageViewProtocol{
    func didLoad() {
        changeColor()
    }
}
