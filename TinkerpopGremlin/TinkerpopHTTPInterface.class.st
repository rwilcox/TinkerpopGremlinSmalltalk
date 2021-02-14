Class {
	#name : #TinkerpopHTTPInterface,
	#superclass : #Object,
	#instVars : [
		'connectionURL'
	],
	#category : #TinkerpopGremlin
}

{ #category : #accessing }
TinkerpopHTTPInterface >> connectionURL [
	^ connectionURL
]

{ #category : #accessing }
TinkerpopHTTPInterface >> connectionURL: anObject [
	connectionURL := anObject
]

{ #category : #'as yet unclassified' }
TinkerpopHTTPInterface >> executeAndReturnRawGremlin: gremlinStr [
	|dataJson rawResult jsonStr dataEntity res|
	
	dataJson := (Dictionary
				newFromPairs:
					{'gremlin'.
					gremlinStr}).
	jsonStr := STONJSON toString: dataJson.		
	dataEntity := ZnEntity with: jsonStr type: ZnMimeType applicationJson.	
			
	res := ZnEasy post: connectionURL data: dataEntity.
	^ NeoJSONObject fromString: res entity.
]

{ #category : #'as yet unclassified' }
TinkerpopHTTPInterface >> executeGremlin: gremlinStr [
	| rawResult result rawGraphData processedGraphData |
	rawResult := self executeAndReturnRawGremlin: gremlinStr.
	
	(rawResult at: #exceptions)	ifNotNil: [ result := ErrorGremlinStacktrace new.
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
			type = 'g:Vertex'         ifTrue: [ output := Vertex buildFromNeoJSONObject: currElement ].
			type = 'g:VertexProperty' ifTrue: [ output := VertexProperty buildFromNeoJSONObject: currElement ].
			type = 'g:Edge'           ifTrue: [ output := Edge buildFromNeoJSONObject: currElement ].
			type = 'g:Property'       ifTrue: [ output := EdgeProperty buildFromNeoJSONObject: currElement ].
			
			output ].
	result resultGraph: processedGraphData.
	result rawResultGraph: rawGraphData.
	^ result
]
