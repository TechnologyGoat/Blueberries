//
//  Theme.swift
//  Blueberries
//
//  Created by Christopher Benton on 5/14/23.
//

import SwiftUI

struct Theme: Codable {
    let name: String
    let colors: [Color]
    let price: Int
}

extension Theme {
    static let red = Theme(name: "red", colors: [Color(red: 246 / 255, green: 0 / 255, blue: 0 / 255)], price: 60)
    static let orange = Theme(name: "orange", colors: [Color(red: 255 / 255, green: 140 / 255, blue: 0 / 255)], price: 60)
    static let yellow = Theme(name: "yellow", colors: [Color(red: 254 / 255, green: 242 / 255, blue: 78 / 255)], price: 60)
    static let green = Theme(name: "green", colors: [Color(red: 61 / 255, green: 236 / 255, blue: 85 / 255)], price: 60)
    static let blue = Theme(name: "blue", colors: [Color(red: 55 / 255, green: 131 / 255, blue: 255 / 255)], price: 60)
    static let purple = Theme(name: "purple", colors: [Color(red: 193 / 255, green: 117 / 255, blue: 255 / 255)], price: 60)
    static let white = Theme(name: "white", colors: [Color(red: 250 / 255, green: 250 / 255, blue: 250 / 255)], price: 60)
    static let black = Theme(name: "black", colors: [Color(red: 5 / 255, green: 5 / 255, blue: 5 / 255)], price: 60)
    static let flare = Theme(name: "flare", colors: [Color(red: 241 / 255, green: 39 / 255, blue: 17 / 255), Color(red: 245 / 255, green: 175 / 255, blue: 25 / 255)], price: 480)
    static let orangeJuice = Theme(name: "orangeJuice", colors: [Color(red: 252 / 255, green: 96 / 255, blue: 118 / 255), Color(red: 255 / 255, green: 154 / 255, blue: 68 / 255)], price: 480)
    static let sulphur = Theme(name: "sulphur", colors: [Color(red: 202 / 255, green: 197 / 255, blue: 49 / 255), Color(red: 243 / 255, green: 249 / 255, blue: 167 / 255)], price: 480)
    static let dustyGrass = Theme(name: "dustyGrass", colors: [Color(red: 212 / 255, green: 252 / 255, blue: 121 / 255), Color(red: 150 / 255, green: 230 / 255, blue: 161 / 255)], price: 480)
    static let blueSkies = Theme(name: "blueSkies", colors: [Color(red: 86 / 255, green: 204 / 255, blue: 242 / 255), Color(red: 47 / 255, green: 128 / 255, blue: 237 / 255)], price: 480)
    static let intuitivePurple = Theme(name: "intuitivePurple", colors: [Color(red: 218 / 255, green: 34 / 255, blue: 255 / 255), Color(red: 151 / 255, green: 51 / 255, blue: 238 / 255)], price: 480)
    static let mystic = Theme(name: "mystic", colors: [Color(red: 117 / 255, green: 127 / 255, blue: 154 / 255), Color(red: 215 / 255, green: 221 / 255, blue: 232 / 255)], price: 480)
    static let steelGray = Theme(name: "steelGray", colors: [Color(red: 31 / 255, green: 28 / 255, blue: 44 / 255), Color(red: 146 / 255, green: 141 / 255, blue: 171 / 255)], price: 480)
    static let springWarmth = Theme(name: "springWarmth", colors: [Color(red: 250 / 255, green: 208 / 255, blue: 196 / 255), Color(red: 255 / 255, green: 209 / 255, blue: 255 / 255)], price: 480)
    static let warmFlame = Theme(name: "warmFlame", colors: [Color(red: 255 / 255, green: 154 / 255, blue: 158 / 255), Color(red: 250 / 255, green: 208 / 255, blue: 196 / 255)], price: 480)
    static let nightFade = Theme(name: "nightFade", colors: [Color(red: 161 / 255, green: 140 / 255, blue: 209 / 255), Color(red: 251 / 255, green: 194 / 255, blue: 235 / 255)], price: 480)
    static let cherry = Theme(name: "cherry", colors: [Color(red: 235 / 255, green: 51 / 255, blue: 73 / 255), Color(red: 244 / 255, green: 92 / 255, blue: 67 / 255)], price: 1440)
    static let loveKiss = Theme(name: "loveKiss", colors: [Color(red: 255 / 255, green: 8 / 255, blue: 68 / 255), Color(red: 255 / 255, green: 177 / 255, blue: 153 / 255)], price: 1440)
    static let piggyPink = Theme(name: "piggyPink", colors: [Color(red: 238 / 255, green: 156 / 255, blue: 167 / 255), Color(red: 255 / 255, green: 221 / 255, blue: 225 / 255)], price: 1440)
    static let mango = Theme(name: "mango", colors: [Color(red: 255 / 255, green: 226 / 255, blue: 89 / 255), Color(red: 255 / 255, green: 167 / 255, blue: 81 / 255)], price: 1440)
    static let sunOnTheHorizon = Theme(name: "sunOnTheHorizon", colors: [Color(red: 252 / 255, green: 234 / 255, blue: 187 / 255), Color(red: 248 / 255, green: 181 / 255, blue: 0 / 255)], price: 1440)
    static let kokoCaramel = Theme(name: "kokoCaramel", colors: [Color(red: 209 / 255, green: 145 / 255, blue: 60 / 255), Color(red: 255 / 255, green: 209 / 255, blue: 148 / 255)], price: 1440)
    static let copper = Theme(name: "copper", colors: [Color(red: 183 / 255, green: 152 / 255, blue: 145 / 255), Color(red: 148 / 255, green: 113 / 255, blue: 107 / 255)], price: 1440)
    static let limeade = Theme(name: "limeade", colors: [Color(red: 161 / 255, green: 255 / 255, blue: 206 / 255), Color(red: 250 / 255, green: 255 / 255, blue: 209 / 255)], price: 1440)
    static let summerDog = Theme(name: "summerDog", colors: [Color(red: 168 / 255, green: 255 / 255, blue: 120 / 255), Color(red: 120 / 255, green: 255 / 255, blue: 214 / 255)], price: 1440)
    static let littleLeaf = Theme(name: "littleLeaf", colors: [Color(red: 118 / 255, green: 184 / 255, blue: 82 / 255), Color(red: 141 / 255, green: 194 / 255, blue: 111 / 255)], price: 1440)
    static let mojito = Theme(name: "mojito", colors: [Color(red: 29 / 255, green: 151 / 255, blue: 108 / 255), Color(red: 147 / 255, green: 249 / 255, blue: 185 / 255)], price: 1440)
    static let maldives = Theme(name: "maldives", colors: [Color(red: 178 / 255, green: 254 / 255, blue: 250 / 255), Color(red: 14 / 255, green: 210 / 255, blue: 247 / 255)], price: 1440)
    static let winterNeva = Theme(name: "winterNeva", colors: [Color(red: 161 / 255, green: 196 / 255, blue: 253 / 255), Color(red: 193 / 255, green: 233 / 255, blue: 251 / 255)], price: 1440)
    static let blueRaspberry = Theme(name: "blueRaspberry", colors: [Color(red: 0 / 255, green: 180 / 255, blue: 219 / 255), Color(red: 0 / 255, green: 131 / 255, blue: 176 / 255)], price: 1440)
    static let skyline = Theme(name: "skyline", colors: [Color(red: 20 / 255, green: 136 / 255, blue: 204 / 255), Color(red: 43 / 255, green: 50 / 255, blue: 178 / 255)], price: 1440)
    static let moonPurple = Theme(name: "moonPurple", colors: [Color(red: 78 / 255, green: 84 / 255, blue: 200 / 255), Color(red: 143 / 255, green: 148 / 255, blue: 251 / 255)], price: 1440)
    static let sweetDessert = Theme(name: "sweetDessert", colors: [Color(red: 119 / 255, green: 66 / 255, blue: 178 / 255), Color(red: 241 / 255, green: 128 / 255, blue: 255 / 255), Color(red: 253 / 255, green: 139 / 255, blue: 217 / 255)], price: 1440)
    static let anamnisar = Theme(name: "anamnisar", colors: [Color(red: 151 / 255, green: 150 / 255, blue: 240 / 255), Color(red: 251 / 255, green: 199 / 255, blue: 212 / 255)], price: 1440)
    static let zinc = Theme(name: "zinc", colors: [Color(red: 173 / 255, green: 169 / 255, blue: 150 / 255), Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255), Color(red: 219 / 255, green: 219 / 255, blue: 219 / 255), Color(red: 234 / 255, green: 234 / 255, blue: 234 / 255)], price: 1440)
    static let deepSeaSpace = Theme(name: "deepSeaSpace", colors: [Color(red: 44 / 255, green: 62 / 255, blue: 80 / 255), Color(red: 76 / 255, green: 161 / 255, blue: 175 / 255)], price: 1440)
    static let blueRed = Theme(name: "blueRed", colors: [Color(red: 54 / 255, green: 177 / 255, blue: 199 / 255), Color(red: 150 / 255, green: 11 / 255, blue: 51 / 255)], price: 10080)
    static let relaxingRed = Theme(name: "relaxingRed", colors: [Color(red: 255 / 255, green: 251 / 255, blue: 213 / 255), Color(red: 178 / 255, green: 10 / 255, blue: 44 / 255)], price: 10080)
    static let tranquil = Theme(name: "tranquil", colors: [Color(red: 238 / 255, green: 205 / 255, blue: 163 / 255), Color(red: 239 / 255, green: 98 / 255, blue: 159 / 255)], price: 10080)
    static let cherryBlossoms = Theme(name: "cherryBlossoms", colors: [Color(red: 251 / 255, green: 211 / 255, blue: 233 / 255), Color(red: 187 / 255, green: 55 / 255, blue: 125 / 255)], price: 10080)
    static let peach = Theme(name: "peach", colors: [Color(red: 237 / 255, green: 66 / 255, blue: 100 / 255), Color(red: 255 / 255, green: 237 / 255, blue: 188 / 255)], price: 10080)
    static let chocolate = Theme(name: "chocolate", colors: [Color(red: 30 / 255, green: 19 / 255, blue: 12 / 255), Color(red: 154 / 255, green: 132 / 255, blue: 120 / 255)], price: 10080)
    static let starfall = Theme(name: "starfall", colors: [Color(red: 240 / 255, green: 194 / 255, blue: 123 / 255), Color(red: 75 / 255, green: 18 / 255, blue: 72 / 255)], price: 10080)
    static let seaWeed = Theme(name: "seaweed", colors: [Color(red: 76 / 255, green: 184 / 255, blue: 196 / 255), Color(red: 60 / 255, green: 211 / 255, blue: 173 / 255)], price: 10080)
    static let cinnamint = Theme(name: "cinnamint", colors: [Color(red: 74 / 255, green: 194 / 255, blue: 154 / 255), Color(red: 189 / 255, green: 255 / 255, blue: 243 / 255)], price: 10080)
    static let moss = Theme(name: "moss", colors: [Color(red: 19 / 255, green: 78 / 255, blue: 94 / 255), Color(red: 113 / 255, green: 178 / 255, blue: 128 / 255)], price: 10080)
    static let flower = Theme(name: "flower", colors: [Color(red: 220 / 255, green: 255 / 255, blue: 189 / 255), Color(red: 204 / 255, green: 134 / 255, blue: 209 / 255)], price: 10080)
    static let candy = Theme(name: "candy", colors: [Color(red: 211 / 255, green: 149 / 255, blue: 155 / 255), Color(red: 191 / 255, green: 230 / 255, blue: 186 / 255)], price: 10080)
    static let shore = Theme(name: "shore", colors: [Color(red: 112 / 255, green: 225 / 255, blue: 245 / 255), Color(red: 255 / 255, green: 209 / 255, blue: 148 / 255)], price: 10080)
    static let aquaMarine = Theme(name: "aquaMarine", colors: [Color(red: 26 / 255, green: 41 / 255, blue: 128 / 255), Color(red: 38 / 255, green: 208 / 255, blue: 206 / 255)], price: 10080)
    static let frost = Theme(name: "frost", colors: [Color(red: 0 / 255, green: 4 / 255, blue: 40 / 255), Color(red: 0 / 255, green: 78 / 255, blue: 146 / 255)], price: 10080)
    static let azurePop = Theme(name: "azurePop", colors: [Color(red: 239 / 255, green: 50 / 255, blue: 217 / 255), Color(red: 137 / 255, green: 255 / 255, blue: 253 / 255)], price: 10080)
    static let electricViolet = Theme(name: "electricViolet", colors: [Color(red: 71 / 255, green: 118 / 255, blue: 230 / 255), Color(red: 142 / 255, green: 84 / 255, blue: 233 / 255)], price: 10080)
    static let amethyst = Theme(name: "amethyst", colors: [Color(red: 157 / 255, green: 80 / 255, blue: 187 / 255), Color(red: 110 / 255, green: 72 / 255, blue: 170 / 255)], price: 10080)
    static let celestial = Theme(name: "celestial", colors: [Color(red: 195 / 255, green: 55 / 255, blue: 100 / 255), Color(red: 29 / 255, green: 39 / 255, blue: 113 / 255)], price: 10080)
    static let margo = Theme(name: "margo", colors: [Color(red: 255 / 255, green: 255 / 255, blue: 186 / 255), Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)], price: 10080)
    static let everlastingSky = Theme(name: "everlastingSky", colors: [Color(red: 253 / 255, green: 252 / 255, blue: 251 / 255), Color(red: 226 / 255, green: 209 / 255, blue: 195 / 255)], price: 10080)
    static let brokenHearts = Theme(name: "brokenHearts", colors: [Color(red: 217 / 255, green: 167 / 255, blue: 199 / 255), Color(red: 255 / 255, green: 252 / 255, blue: 220 / 255)], price: 10080)
    static let jShine = Theme(name: "jShine", colors: [Color(red: 18 / 255, green: 194 / 255, blue: 233 / 255), Color(red: 196 / 255, green: 113 / 255, blue: 237 / 255), Color(red: 246 / 255, green: 79 / 255, blue: 89 / 255)], price: 43800)
    static let megaTron = Theme(name: "megaTron", colors: [Color(red: 198 / 255, green: 255 / 255, blue: 221 / 255), Color(red: 251 / 255, green: 215 / 255, blue: 134 / 255), Color(red: 247 / 255, green: 121 / 255, blue: 125 / 255)], price: 43800)
    static let weddingDayBlues = Theme(name: "weddingDayBlues", colors: [Color(red: 64 / 255, green: 224 / 255, blue: 208 / 255), Color(red: 255 / 255, green: 140 / 255, blue: 0 / 255), Color(red: 255 / 255, green: 0 / 255, blue: 128 / 255)], price: 43800)
    static let burningSpring = Theme(name: "burningSpring", colors: [Color(red: 79 / 255, green: 181 / 255, blue: 118 / 255), Color(red: 68 / 255, green: 196 / 255, blue: 137 / 255), Color(red: 40 / 255, green: 169 / 255, blue: 174 / 255), Color(red: 40 / 255, green: 162 / 255, blue: 183 / 255), Color(red: 76 / 255, green: 119 / 255, blue: 136 / 255), Color(red: 108 / 255, green: 79 / 255, blue: 99 / 255), Color(red: 67 / 255, green: 44 / 255, blue: 57 / 255)], price: 43800)
    static let gargarinView = Theme(name: "gargarinView", colors: [Color(red: 105 / 255, green: 234 / 255, blue: 203 / 255), Color(red: 234 / 255, green: 204 / 255, blue: 248 / 255), Color(red: 102 / 255, green: 84 / 255, blue: 241 / 255)], price: 43800)
    static let softCherish = Theme(name: "softCherish", colors: [Color(red: 219 / 255, green: 220 / 255, blue: 215 / 255), Color(red: 221 / 255, green: 220 / 255, blue: 215 / 255), Color(red: 226 / 255, green: 201 / 255, blue: 204 / 255), Color(red: 231 / 255, green: 98 / 255, blue: 125 / 255), Color(red: 184 / 255, green: 35 / 255, blue: 90 / 255), Color(red: 128 / 255, green: 19 / 255, blue: 87 / 255), Color(red: 61 / 255, green: 22 / 255, blue: 53 / 255), Color(red: 28 / 255, green: 26 / 255, blue: 39 / 255)], price: 43800)
    static let argon = Theme(name: "argon", colors: [Color(red: 3 / 255, green: 0 / 255, blue: 30 / 255), Color(red: 115 / 255, green: 3 / 255, blue: 192 / 255), Color(red: 236 / 255, green: 56 / 255, blue: 188 / 255), Color(red: 253 / 255, green: 239 / 255, blue: 249 / 255)], price: 43800)
    static let fabledSunset = Theme(name: "fabledSunset", colors: [Color(red: 35 / 255, green: 21 / 255, blue: 87 / 255), Color(red: 68 / 255, green: 16 / 255, blue: 122 / 255), Color(red: 255 / 255, green: 19 / 255, blue: 97 / 255), Color(red: 255 / 255, green: 248 / 255, blue: 0 / 255)], price: 43800)
    static let unicornRainbow = Theme(name: "unicornRainbow", colors: [Color(red: 247 / 255, green: 240 / 255, blue: 172 / 255), Color(red: 172 / 255, green: 247 / 255, blue: 240 / 255), Color(red: 240 / 255, green: 172 / 255, blue: 247 / 255)], price: 43800)
    static let afterTheRain  = Theme(name: "afterTheRain", colors: [Color(red: 255 / 255, green: 117 / 255, blue: 195 / 255), Color(red: 255 / 255, green: 166 / 255, blue: 71 / 255), Color(red: 255 / 255, green: 232 / 255, blue: 63 / 255), Color(red: 159 / 255, green: 255 / 255, blue: 91 / 255), Color(red: 112 / 255, green: 226 / 255, blue: 255 / 255), Color(red: 205 / 255, green: 147 / 255, blue: 255 / 255)], price: 525600)
}
