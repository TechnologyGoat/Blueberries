//
//  Color+Codable.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

extension Color: Codable {
    init(hex: String) {
          let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
          var int: UInt64 = 0
          Scanner(string: hex).scanHexInt64(&int)
          let a, r, g, b: UInt64

          switch hex.count {
          case 3: // RGB (12-bit)
              (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
          case 6: // RGB (24-bit)
              (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
          case 8: // ARGB (32-bit)
              (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
          default:
              (a, r, g, b) = (1, 1, 1, 0)
          }
        
          self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
      }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let hex = try container.decode(String.self)
        
        self.init(hex: hex)
    }

    public func encode(to encoder: Encoder) throws {
        guard let components = cgColor?.components, components.count >= 3 else { return }
        var container = encoder.singleValueContainer()
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        try container.encode(String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)))
    }
}
