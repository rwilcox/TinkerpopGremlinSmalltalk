Class {
	#name : #TinkerpopHTTPResult,
	#superclass : #Object,
	#instVars : [
		'statusCode',
		'statusMessage',
		'resultGraph',
		'rawResultGraph'
	],
	#category : #TinkerpopGremlin
}

{ #category : #accessing }
TinkerpopHTTPResult >> rawResultGraph [
	^ rawResultGraph
]

{ #category : #accessing }
TinkerpopHTTPResult >> rawResultGraph: anObject [
	rawResultGraph := anObject
]

{ #category : #accessing }
TinkerpopHTTPResult >> resultGraph [
	^ resultGraph
]

{ #category : #accessing }
TinkerpopHTTPResult >> resultGraph: anObject [
	resultGraph := anObject
]

{ #category : #accessing }
TinkerpopHTTPResult >> statusCode [
	^ statusCode
]

{ #category : #accessing }
TinkerpopHTTPResult >> statusCode: anObject [
	statusCode := anObject
]

{ #category : #accessing }
TinkerpopHTTPResult >> statusMessage [
	^ statusMessage
]

{ #category : #accessing }
TinkerpopHTTPResult >> statusMessage: anObject [
	statusMessage := anObject
]
