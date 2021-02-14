Class {
	#name : #VertexProperty,
	#superclass : #Object,
	#instVars : [
		'label',
		'value'
	],
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
VertexProperty class >> buildFromNeoJSONObject: obj [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| output |
	
   output := VertexProperty new.
   output label: (obj atPath: {'@value'. #label}).
   output value: (obj atPath: {'@value'. #value}).
	
   ^output.
]

{ #category : #accessing }
VertexProperty >> label [
	^ label
]

{ #category : #accessing }
VertexProperty >> label: anObject [
	label := anObject
]

{ #category : #accessing }
VertexProperty >> value [
	^ value
]

{ #category : #accessing }
VertexProperty >> value: anObject [
	value := anObject
]
