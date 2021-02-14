Class {
	#name : #Edge,
	#superclass : #Object,
	#instVars : [
		'id',
		'label',
		'inVertexId',
		'outVertexId'
	],
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
Edge class >> buildFromNeoJSONObject: obj [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
	
	|output|
	
	output := Edge new.
	
	output id: (obj atPath: {'@value'. 'id'. '@value'}).
	output label: (obj atPath: {'@value'. 'label'}).
	output outVertexId: (obj atPath: {'@value'. 'outV'. '@value'}).
	output inVertexId:  (obj atPath: {'@value'. 'inV'. '@value'}).
	
	^ output.
.
]

{ #category : #accessing }
Edge >> id [
	^ id
]

{ #category : #accessing }
Edge >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Edge >> inVertexId [
	^ inVertexId
]

{ #category : #accessing }
Edge >> inVertexId: anObject [
	inVertexId := anObject
]

{ #category : #accessing }
Edge >> label [
	^ label
]

{ #category : #accessing }
Edge >> label: anObject [
	label := anObject
]

{ #category : #accessing }
Edge >> outVertexId [
	^ outVertexId
]

{ #category : #accessing }
Edge >> outVertexId: anObject [
	outVertexId := anObject
]
