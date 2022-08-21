//
//  FontConstant.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import SwiftUI

//MARK: - Font

//Nunito Bold.ttf
func NunitoBoldCustom(size :CGFloat) -> Font{
    let font:Font = Font.custom("Nunito Bold", size: size)
    return font
}

//Nunito Light.ttf
func NunitoLightCustom(size :CGFloat) -> Font{
    let font:Font = Font.custom("Nunito Light", size: size)
    return font
}

//Nunito Regular.ttf
func NunitoRegularCustom(size :CGFloat) -> Font{
    let font:Font = Font.custom("Nunito Regular", size: size)
    return font
}

//Nunito-SemiBold.ttf
func NunitoSemiBoldCustom(size :CGFloat) -> Font{
    let font:Font = Font.custom("Nunito-SemiBold", size: size)
    return font
}

//NEWYORK.ttf
func NEWYORKCustom(size :CGFloat) -> Font{
    let font:Font = Font.custom("NEWYORK", size: size)
    return font
}
