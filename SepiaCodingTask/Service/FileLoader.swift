//
//  FileLoader.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 26/02/23.
//

import Foundation

class FileLoader {
    static func readLocalFile(_ filename: String) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: "json")
        else {
            fatalError("Unable to locate file \"\(filename)\" in main bundle.")
        }
        
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
        }
    }
}
