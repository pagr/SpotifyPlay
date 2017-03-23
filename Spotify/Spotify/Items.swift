//
//  Items.swift
//
//  Created by Paul Griffin on 2017-03-23
//  Copyright (c) . All rights reserved.
//

import Foundation

public struct Items {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let href = "href"
    static let addedAt = "added_at"
    static let track = "track"
    static let durationMs = "duration_ms"
    static let explicit = "explicit"
    static let type = "type"
    static let trackNumber = "track_number"
    static let snapshotId = "snapshot_id"
    static let collaborative = "collaborative"
    static let id = "id"
    static let owner = "owner"
    static let availableMarkets = "available_markets"
    static let images = "images"
    static let followers = "followers"
    static let name = "name"
    static let uri = "uri"
    static let externalUrls = "external_urls"
    static let genres = "genres"
    static let previewUrl = "preview_url"
    static let externalIds = "external_ids"
    static let artists = "artists"
    static let album = "album"
    static let isLocal = "is_local"
    static let popularity = "popularity"
    static let discNumber = "disc_number"
    static let tracks = "tracks"
    static let addedBy = "added_by"
    static let `public` = "public"
    static let albumType = "album_type"
  }

  // MARK: Properties
  public var href: String?
  public var addedAt: String?
  public var track: Track?
  public var durationMs: Int?
  public var explicit: Bool? = false
  public var type: String?
  public var trackNumber: Int?
  public var snapshotId: String?
  public var collaborative: Bool? = false
  public var id: String?
  public var owner: Owner?
  public var availableMarkets: [String]?
  public var images: [Images]?
  public var followers: Followers?
  public var name: String?
  public var uri: String?
  public var externalUrls: ExternalUrls?
  public var genres: [String]?
  public var previewUrl: String?
  public var externalIds: ExternalIds?
  public var artists: [Artists]?
  public var album: Album?
  public var isLocal: Bool? = false
  public var popularity: Int?
  public var discNumber: Int?
  public var tracks: Tracks?
  public var addedBy: AddedBy?
  public var `public`: Bool? = false
  public var albumType: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public init(json: JSON) {
    href = json[SerializationKeys.href].string
    addedAt = json[SerializationKeys.addedAt].string
    track = Track(json: json[SerializationKeys.track])
    durationMs = json[SerializationKeys.durationMs].int
    explicit = json[SerializationKeys.explicit].boolValue
    type = json[SerializationKeys.type].string
    trackNumber = json[SerializationKeys.trackNumber].int
    snapshotId = json[SerializationKeys.snapshotId].string
    collaborative = json[SerializationKeys.collaborative].boolValue
    id = json[SerializationKeys.id].string
    owner = Owner(json: json[SerializationKeys.owner])
    if let items = json[SerializationKeys.availableMarkets].array { availableMarkets = items.map { $0.stringValue } }
    if let items = json[SerializationKeys.images].array { images = items.map { Images(json: $0) } }
    followers = Followers(json: json[SerializationKeys.followers])
    name = json[SerializationKeys.name].string
    uri = json[SerializationKeys.uri].string
    externalUrls = ExternalUrls(json: json[SerializationKeys.externalUrls])
    if let items = json[SerializationKeys.genres].array { genres = items.map { $0.stringValue } }
    previewUrl = json[SerializationKeys.previewUrl].string
    externalIds = ExternalIds(json: json[SerializationKeys.externalIds])
    if let items = json[SerializationKeys.artists].array { artists = items.map { Artists(json: $0) } }
    album = Album(json: json[SerializationKeys.album])
    isLocal = json[SerializationKeys.isLocal].boolValue
    popularity = json[SerializationKeys.popularity].int
    discNumber = json[SerializationKeys.discNumber].int
    tracks = Tracks(json: json[SerializationKeys.tracks])
    addedBy = AddedBy(json: json[SerializationKeys.addedBy])
    `public` = json[SerializationKeys.`public`].boolValue
    albumType = json[SerializationKeys.albumType].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = addedAt { dictionary[SerializationKeys.addedAt] = value }
    if let value = track { dictionary[SerializationKeys.track] = value.dictionaryRepresentation() }
    if let value = durationMs { dictionary[SerializationKeys.durationMs] = value }
    dictionary[SerializationKeys.explicit] = explicit
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = trackNumber { dictionary[SerializationKeys.trackNumber] = value }
    if let value = snapshotId { dictionary[SerializationKeys.snapshotId] = value }
    dictionary[SerializationKeys.collaborative] = collaborative
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = owner { dictionary[SerializationKeys.owner] = value.dictionaryRepresentation() }
    if let value = availableMarkets { dictionary[SerializationKeys.availableMarkets] = value }
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    if let value = followers { dictionary[SerializationKeys.followers] = value.dictionaryRepresentation() }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = uri { dictionary[SerializationKeys.uri] = value }
    if let value = externalUrls { dictionary[SerializationKeys.externalUrls] = value.dictionaryRepresentation() }
    if let value = genres { dictionary[SerializationKeys.genres] = value }
    if let value = previewUrl { dictionary[SerializationKeys.previewUrl] = value }
    if let value = externalIds { dictionary[SerializationKeys.externalIds] = value.dictionaryRepresentation() }
    if let value = artists { dictionary[SerializationKeys.artists] = value.map { $0.dictionaryRepresentation() } }
    if let value = album { dictionary[SerializationKeys.album] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.isLocal] = isLocal
    if let value = popularity { dictionary[SerializationKeys.popularity] = value }
    if let value = discNumber { dictionary[SerializationKeys.discNumber] = value }
    if let value = tracks { dictionary[SerializationKeys.tracks] = value.dictionaryRepresentation() }
    if let value = addedBy { dictionary[SerializationKeys.addedBy] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.`public`] = `public`
    if let value = albumType { dictionary[SerializationKeys.albumType] = value }
    return dictionary
  }

}
