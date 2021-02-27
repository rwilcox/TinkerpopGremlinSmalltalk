Class {
	#name : #TinkerpopGremlinExamplePlayground,
	#superclass : #Object,
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
