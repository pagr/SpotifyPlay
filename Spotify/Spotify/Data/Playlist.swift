//
//  Playlist.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Playlist: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let limit = "limit"
    static let href = "href"
    static let offset = "offset"
    static let total = "total"
    static let items = "items"
  }

  // MARK: Properties
  public var limit: Int?
  public var href: String?
  public var offset: Int?
  public var total: Int?
  public var items: [Items]?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    limit = try? object.value(for: SerializationKeys.limit)
    href = try? object.value(for: SerializationKeys.href)
    offset = try? object.value(for: SerializationKeys.offset)
    total = try? object.value(for: SerializationKeys.total)
    items = try? object.value(for: SerializationKeys.items)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = limit { dictionary[SerializationKeys.limit] = value }
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = offset { dictionary[SerializationKeys.offset] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = items { dictionary[SerializationKeys.items] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
