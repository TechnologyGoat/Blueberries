//
//  String+Localize.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import Foundation

extension String {
    func localize(tableName: String? = nil, bundle: Bundle = .main, comment: String = "", args: [CVarArg] = []) -> String {
        return String(format: NSLocalizedString(self, tableName: tableName, bundle: bundle, comment: comment), arguments: args)
    }
}
