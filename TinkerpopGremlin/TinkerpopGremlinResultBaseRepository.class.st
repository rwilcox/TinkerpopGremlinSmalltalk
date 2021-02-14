"
Class: A TinkerpopGremlinResultBaseRepository deserializes results from the Tinkerpop*Interface, returning you Smalltalk objects instead of JSON.

Responsibility part: I should deserialize JSON, probably eventually serialize JSON, and at the very least provide a base class for those that Know What They Are Doing And Just Want To Serialize thing X in Y way.

This might be more coupled than I'd like to being a repository pattern for HTTP results, but I'm hoping that it will work equally well for HTTP interface as the websockets interface. (And if it doesn't work for your scenario, patches welcome...)
"
Class {
	#name : #TinkerpopGremlinResultBaseRepository,
	#superclass : #Object,
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
TinkerpopGremlinResultBaseRepository >> deserialize: rawResult [
	"comment stating purpose of instance-side message"

	"scope: class-variables  &  instance-variables"

	| result rawGraphData processedGraphData |
	(rawResult at: #exceptions)
		ifNotNil: [ result := ErrorGremlinStacktrace new.
			result javaExceptionMessage: (rawResult at: #message).
			result javaStacktrace: (rawResult at: #stackTrace).
			^ result ].
		
	result := TinkerpopHTTPResult new.
	result statusCode: (rawResult atPath: {#status . #code}).
	rawGraphData := rawResult atPath: {#result . #data . '@value'}.
	
	processedGraphData := rawGraphData
		collect: [ :currElement | 
			| type output |
			type := currElement at: '@type'.

			"who says Smalltalk doesn't have pattern matching?? ;)"
			type = 'g:Vertex'         ifTrue: [ output := self deserializeVertex: currElement ].
			type = 'g:VertexProperty' ifTrue: [ output := self deserialzeVertexProperties: currElement ].
			type = 'g:Edge'           ifTrue: [ output := self deserializeEdgeProperties: currElement ].
			type = 'g:Property'       ifTrue: [ output := self deserializeEdgePropertyProperties: currElement ].
			output ].
	result resultGraph: processedGraphData.
	result rawResultGraph: rawGraphData.
	^ result
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinResultBaseRepository >> deserializeEdgeProperties: currElement [
	^ Edge buildFromNeoJSONObject: currElement
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinResultBaseRepository >> deserializeEdgePropertyProperties: currElement [
	^ EdgeProperty buildFromNeoJSONObject: currElement
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinResultBaseRepository >> deserializeVertex: currElement [
	^ Vertex buildFromNeoJSONObject: currElement
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinResultBaseRepository >> deserialzeVertexProperties: currElement [
	^ VertexProperty buildFromNeoJSONObject: currElement
]
