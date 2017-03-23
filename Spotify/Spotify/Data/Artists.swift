//
//  Artists.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Artists: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let limit = "limit"
    static let href = "href"
    static let uri = "uri"
    static let id = "id"
    static let externalUrls = "external_urls"
    static let offset = "offset"
    static let next = "next"
    static let total = "total"
    static let items = "items"
    static let type = "type"
  }

  // MARK: Properties
  public var name: String?
  public var limit: Int?
  public var href: String?
  public var uri: String?
  public var id: String?
  public var externalUrls: ExternalUrls?
  public var offset: Int?
  public var next: String?
  public var total: Int?
  public var items: [Items]?
  public var type: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    name = try? object.value(for: SerializationKeys.name)
    limit = try? object.value(for: SerializationKeys.limit)
    href = try? object.value(for: SerializationKeys.href)
    uri = try? object.value(for: SerializationKeys.uri)
    id = try? object.value(for: SerializationKeys.id)
    externalUrls = try? object.value(for: SerializationKeys.externalUrls)
    offset = try? object.value(for: SerializationKeys.offset)
    next = try? object.value(for: SerializationKeys.next)
    total = try? object.value(for: SerializationKeys.total)
    items = try? object.value(for: SerializationKeys.items)
    type = try? object.value(for: SerializationKeys.type)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = limit { dictionary[SerializationKeys.limit] = value }
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = offset { dictionary[SerializationKeys.offset] = value }
    if let value = next { dictionary[SerializationKeys.next] = value }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = items { dictionary[SerializationKeys.items] = value.map { $0.dictionaryRepresentation() } }
    if let value = type { dictionary[SerializationKeys.type] = value }
    return dictionary
  }

}
