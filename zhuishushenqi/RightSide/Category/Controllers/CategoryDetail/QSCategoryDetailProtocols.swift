//
//  QSCategoryDetailProtocols.swift
//  zhuishushenqi
//
//  Created caonongyun on 2017/4/20.
//  Copyright © 2017年 QS. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol QSCategoryDetailWireframeProtocol: class {
    func presentDetail(book:Book)
}
//MARK: Presenter -
protocol QSCategoryDetailPresenterProtocol: class {
    func setupSegview()->[UIViewController]
}

//MARK: Interactor -
protocol QSCategoryDetailInteractorProtocol: class {
    func setupSegview()->[UIViewController]
}

//MARK: Output - 
protocol QSCategoryDetailInteractorOutputProtocol: class {

}

//MARK: View -
protocol QSCategoryDetailViewProtocol: IndicatableView {

  var presenter: QSCategoryDetailPresenterProtocol?  { get set }
}
