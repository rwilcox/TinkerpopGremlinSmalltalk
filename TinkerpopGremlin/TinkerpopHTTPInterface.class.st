"
Class: I exist to interface with the gremlin data store using the HTTP interface

Responsibility part: In addition to sending Gremlin commands to the server I also deserialize responses to basic Smalltalk objects.

For the Collaborators Part: execute* instance methods will return a TinkerpopHTTPResult, or ErrorGremlinStacktrace objects.

This is the ""talk to the data store"" part of the ORM.
"
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
TinkerpopHTTPInterface >> executeGremlin: gremlinStr [
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
TinkerpopHTTPInterface >> executeGremlin: gremlinStr withBindings: graphCommandBindingsDict [
	|dataJson jsonStr dataEntity res|
	
	dataJson := (Dictionary
				newFromPairs:
					{
					'gremlin'.  gremlinStr.
					'bindings'. graphCommandBindingsDict . 
					}).
	jsonStr := STONJSON toString: dataJson.		
	dataEntity := ZnEntity with: jsonStr type: ZnMimeType applicationJson.	
			
	res := ZnEasy post: connectionURL data: dataEntity.
	^ NeoJSONObject fromString: res entity.
]

{ #category : #'as yet unclassified' }
TinkerpopHTTPInterface >> executeGremlin: gStr withBindingsLiteral: arrayLiteral [
	"Instead of doing
	
	executeGremlin: 'g.V(whatLabel)' withBindings: Dictionary newFrom: { #whatLabel -> foo }
	
	do
	
	executeGremlin: 'g.V(whatLabel)' withBindingsLiteral: { #whatLabel -> foo }
	
	saved you a phrase
	"
	^ self executeGremlin: gStr withBindings: (Dictionary newFrom: arrayLiteral).
]
