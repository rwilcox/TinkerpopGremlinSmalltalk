Class {
	#name : #ErrorGremlinStacktrace,
	#superclass : #Error,
	#instVars : [
		'javaStacktrace',
		'javaExceptionMessage'
	],
	#category : #TinkerpopGremlin
}

{ #category : #accessing }
ErrorGremlinStacktrace >> javaExceptionMessage [
	^ javaExceptionMessage
]

{ #category : #accessing }
ErrorGremlinStacktrace >> javaExceptionMessage: anObject [
	javaExceptionMessage := anObject
]

{ #category : #accessing }
ErrorGremlinStacktrace >> javaStacktrace [
	^ javaStacktrace
]

{ #category : #accessing }
ErrorGremlinStacktrace >> javaStacktrace: anObject [
	javaStacktrace := anObject
]
