Class {
	#name : #Vertex,
	#superclass : #Object,
	#instVars : [
		'id',
		'label'
	],
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
Vertex class >> buildFromNeoJSONObject: obj [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| output |
	
   output := Vertex new.

	output id: (obj atPath: {'@value'. 'id'. '@value'}).
   output label: (obj atPath: {'@value'. #label}).

  ^ output.
]

{ #category : #accessing }
Vertex >> id [
	^ id
]

{ #category : #accessing }
Vertex >> id: anObject [
	id := anObject
]

{ #category : #accessing }
Vertex >> label [
	^ label
]

{ #category : #accessing }
Vertex >> label: anObject [
	label := anObject
]

{ #category : #'as yet unclassified' }
Vertex >> toRSComposite [
	"Creates a Roassal 3 composit with a box and a label"
			
	| rslabel box|
	
	rslabel := RSLabel new text: label yourself.
	box := RSBox new withBorder; extent: rslabel extent + 10.
	
	^ RSComposite new draggable;
	model: self; shapes: {  box. rslabel }.
	
]
