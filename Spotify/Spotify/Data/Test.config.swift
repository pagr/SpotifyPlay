//
//  Test.config.swift
//
//  Created by Paul Griffin on 2017-03-22
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Test.config: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let supportNscoding = "support_nscoding"
    static let destinationPath = "destination_path"
    static let constructType = "construct_type"
    static let companyName = "company_name"
    static let modelMappingLibrary = "model_mapping_library"
    static let isHeaderIncluded = "is_header_included"
    static let isFinalRequired = "is_final_required"
    static let authorName = "author_name"
  }

  // MARK: Properties
  public var supportNscoding: Bool? = false
  public var destinationPath: String?
  public var constructType: String?
  public var companyName: String?
  public var modelMappingLibrary: String?
  public var isHeaderIncluded: Bool? = false
  public var isFinalRequired: Bool? = false
  public var authorName: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    supportNscoding = try? object.value(for: SerializationKeys.supportNscoding)
    destinationPath = try? object.value(for: SerializationKeys.destinationPath)
    constructType = try? object.value(for: SerializationKeys.constructType)
    companyName = try? object.value(for: SerializationKeys.companyName)
    modelMappingLibrary = try? object.value(for: SerializationKeys.modelMappingLibrary)
    isHeaderIncluded = try? object.value(for: SerializationKeys.isHeaderIncluded)
    isFinalRequired = try? object.value(for: SerializationKeys.isFinalRequired)
    authorName = try? object.value(for: SerializationKeys.authorName)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.supportNscoding] = supportNscoding
    if let value = destinationPath { dictionary[SerializationKeys.destinationPath] = value }
    if let value = constructType { dictionary[SerializationKeys.constructType] = value }
    if let value = companyName { dictionary[SerializationKeys.companyName] = value }
    if let value = modelMappingLibrary { dictionary[SerializationKeys.modelMappingLibrary] = value }
    dictionary[SerializationKeys.isHeaderIncluded] = isHeaderIncluded
    dictionary[SerializationKeys.isFinalRequired] = isFinalRequired
    if let value = authorName { dictionary[SerializationKeys.authorName] = value }
    return dictionary
  }

}
