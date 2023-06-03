//
//  View+Filled.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

extension View {
    func filled(_ fill: some View) -> some View {
        fill
            .mask(self)
    }
}
