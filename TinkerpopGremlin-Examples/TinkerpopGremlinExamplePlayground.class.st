Class {
	#name : #TinkerpopGremlinExamplePlayground,
	#superclass : #Object,
	#classInstVars : [
		'statements'
	],
	#category : #'TinkerpopGremlin-Examples'
}

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> createVertexExample [
	"creates a vertex using the HTTP Interface"

	| a b res |
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
	res := a executeGremlin: 'g.addV(lang)' withBindingsLiteral: { #lang -> 'Smalltalk' }.
	
   ^ b deserialize: res.
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> findAllVerticesWithLabelExample [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
| a b|
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
	^ b findAllVerticesWithLabel: 'Smalltalk' withInterface: a.
	
]
