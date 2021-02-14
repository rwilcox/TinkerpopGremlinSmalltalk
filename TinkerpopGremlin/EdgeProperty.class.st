Class {
	#name : #EdgeProperty,
	#superclass : #Object,
	#instVars : [
		'key',
		'value'
	],
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
EdgeProperty class >> buildFromNeoJSONObject: obj [

	|output|
	
	output := EdgeProperty new.
	output key: (obj atPath: {'@value'. #key}).
	output value: (obj atPath: {'@value'. #value}).

   ^output. 
]

{ #category : #accessing }
EdgeProperty >> key [
	^ key
]

{ #category : #accessing }
EdgeProperty >> key: anObject [
	key := anObject
]

{ #category : #accessing }
EdgeProperty >> value [
	^ value
]

{ #category : #accessing }
EdgeProperty >> value: anObject [
	value := anObject
]
