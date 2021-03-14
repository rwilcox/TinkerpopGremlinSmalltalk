"
GremlinQueryBuilder give you an easy way to (composabily?) construct gremlin queries.

This is the query construction part of the ORM.
"
Class {
	#name : #GremlinQueryBuilder,
	#superclass : #Object,
	#instVars : [
		'queryString',
		'queryBinding'
	],
	#category : #TinkerpopGremlin
}

{ #category : #'as yet unclassified' }
GremlinQueryBuilder class >> createVertexWithLabel: label [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	|out|
	
   out := GremlinQueryBuilder new.

   out queryString: 'g.addV(newVertexLabel)'; queryBinding: { #newVertexLabel -> label }.

  ^ out.
]

{ #category : #'as yet unclassified' }
GremlinQueryBuilder class >> findEdgesWithLabel: label [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	|out|
	
   out := GremlinQueryBuilder new.

   out queryString: 'g.E().hasLabel(inLabel)'; queryBinding: { #inLabel -> label }.

  ^ out.
]

{ #category : #'as yet unclassified' }
GremlinQueryBuilder class >> findVerticesWithLabel: label [
	|out|
	
   out := GremlinQueryBuilder new.

   out queryString: 'g.V().hasLabel(inLabel)'; queryBinding: { #inLabel -> label }.

  ^ out.
]

{ #category : #streaming }
GremlinQueryBuilder >> << inString [
	"Append the input string to our current gremlin query. Because you can't just str << 'more' in Smalltalk"
	"scope: class-variables  &  instance-variables"	
			
	queryString := queryString, inString.
]

{ #category : #'as yet unclassified' }
GremlinQueryBuilder >> propertyFilter: propertyName withValue: value [
	"A helper method to construct (does this label have a property we want?) queries"
	"scope: class-variables  &  instance-variables"	
			
	|a|
	
  a := '.filter(properties(''', propertyName, ''').value().is(''', value, '''))'.
  "TODO: add this to bindings instead of hard coding"

  self << a.
]

{ #category : #'as yet unclassified' }
GremlinQueryBuilder >> propertyName: pname withValue: pvalue [
	"A helper method to construct a gremlin property function (saved you some typing!)"

	"scope: class-variables  &  instance-variables"

	| a |
	"TODO: add this to the bindings instead of manually quoting"
	
	a := '.property(''' , pname , ''', ''' , pvalue , ''')'.
	self << a.
	^ a.
]

{ #category : #accessing }
GremlinQueryBuilder >> queryBinding [
	^ queryBinding
]

{ #category : #accessing }
GremlinQueryBuilder >> queryBinding: anObject [
	queryBinding := anObject
]

{ #category : #'as yet unclassified' }
GremlinQueryBuilder >> queryDictionary [
	
  ^ Dictionary newFrom: (queryBinding).
]

{ #category : #accessing }
GremlinQueryBuilder >> queryString [
	^ queryString
]

{ #category : #accessing }
GremlinQueryBuilder >> queryString: anObject [
	queryString := anObject
]
