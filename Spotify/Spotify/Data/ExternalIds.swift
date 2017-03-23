//
//  ExternalIds.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct ExternalIds: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isrc = "isrc"
  }

  // MARK: Properties
  public var isrc: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    isrc = try? object.value(for: SerializationKeys.isrc)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = isrc { dictionary[SerializationKeys.isrc] = value }
    return dictionary
  }

}
