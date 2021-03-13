Class {
	#name : #TinkerpopGremlinExamplePlayground,
	#superclass : #Object,
	#classInstVars : [
		'statements'
	],
	#category : #'TinkerpopGremlin-Examples'
}

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> complexQueryInABuilderExample [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	<sampleInstance>	
	| a b q |
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
   q := GremlinQueryBuilder new.
   q queryString: 'g.V().hasLabel(vertexLabel).as(''parentVertex'').properties().union(select(''parentVertex''), identity()).dedup()'.  
        "this returns both the vertex and the properties associated with the vertex"
   q queryBinding: { #vertexLabel -> 'Smalltalk' }.
   
   ^ b executeBuilder: q withInterface: a.
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> createVertexExample [
	"creates a vertex using the HTTP Interface"
  <sampleInstance>
	| a b res |
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
	res := a executeGremlin: 'g.addV(lang)' withBindingsLiteral: { #lang -> 'Smalltalk' }.
	
   ^ b deserialize: res.
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> createVertexExampleComplex [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
  <sampleInstance>
	| a b res q|
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
	q := GremlinQueryBuilder new.
	q queryString: 'g.addV(lang)'.
	q propertyName: 'domaingraph' withValue: 'tinkerpopexample'.
	
	q queryBinding: { #lang -> 'Groovy' }.
	
	res := b executeBuilder: q withInterface: a. 
	
   ^ res.
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> findAllVerticesWithLabelExample [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	<sampleInstance>
| a b q|
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
	q := GremlinQueryBuilder findWithLabel: 'Smalltalk'.
	^ b executeBuilder: q withInterface: a.
	
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> findAllVerticesWithLabelsWithPropertyExample [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
	
	<sampleInstance>	
	| a b q |
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
   q := GremlinQueryBuilder findWithLabel: 'Smalltalk'.
   q propertyFilter: 'domaingraph' withValue: 'tinkerpopexample'.

   ^ b executeBuilder: q withInterface: a.
]

{ #category : #'as yet unclassified' }
TinkerpopGremlinExamplePlayground class >> updateVertexExample [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	<sampleInstance>
	
| a b res|
	
	a := TinkerpopHTTPInterface new.
	b := TinkerpopGremlinResultBaseRepository new.
	a connectionURL: 'http://localhost:8182'.
	
  res := a executeGremlin: 'g.V().hasLabel(inLabel).property(''domaingraph'', ''tinkerpopexample'')' withBindingsLiteral: { #inLabel -> 'Smalltalk'  }.

  ^ b deserialize: res.
]
