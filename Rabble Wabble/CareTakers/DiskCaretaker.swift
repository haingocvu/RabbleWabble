//
//  DiskCaretaker.swift
//  Rabble Wabble
//
//  Created by Hai Vu on 5/10/19.
//  Copyright © 2019 Hai Vu. All rights reserved.
//

import Foundation

public final class DiskCaretaker {
	public static let decoder = JSONDecoder()
	public static let encoder = JSONEncoder()
	
	public static func createDocumentURL(withFileName fileName: String) -> URL{
		let fileManager = FileManager.default
		let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
		return url.appendingPathComponent(fileName).appendingPathExtension("json")
	}
	
	public static func save<T: Codable>(_ object: T, to fileName: String) throws {
		do {
			let url = createDocumentURL(withFileName: fileName)
			let data = try encoder.encode(object)
			try data.write(to: url, options: .atomic)
		} catch {
			print("save failed: object: \(object). Error: \(error)")
			throw error
		}
	}
	
	//T.type nghĩa là truyền kiểu dữ liệu thôi.
	public static func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
		do {
			let data = try Data(contentsOf: url)
			let obj = try decoder.decode(T.self, from: data)
			return obj
		} catch {
			print("retrieve failed. URL: \(url). Error: \(error)")
			throw error
		}
	}
	
	//T.type nghĩa là truyền kiểu dữ liệu.
	public static func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
		let url = createDocumentURL(withFileName: fileName)
		return try retrieve(T.self, from: url)
	}
}
