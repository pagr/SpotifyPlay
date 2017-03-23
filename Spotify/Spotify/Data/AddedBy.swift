//
//  AddedBy.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct AddedBy: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let href = "href"
    static let id = "id"
    static let externalUrls = "external_urls"
    static let type = "type"
    static let uri = "uri"
  }

  // MARK: Properties
  public var href: String?
  public var id: String?
  public var externalUrls: ExternalUrls?
  public var type: String?
  public var uri: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    href = try? object.value(for: SerializationKeys.href)
    id = try? object.value(for: SerializationKeys.id)
    externalUrls = try? object.value(for: SerializationKeys.externalUrls)
    type = try? object.value(for: SerializationKeys.type)
    uri = try? object.value(for: SerializationKeys.uri)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    return dictionary
  }

}
