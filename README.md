# About TinkerGremlinSmalltalk

This repository contains the very basics around getting Smalltalk to talk to a graph database (via Gremlin).

# Example Time


```smalltalk

|a b res|

a := TinkerpopHTTPInterface new.
b := TinkerpopGremlinResultBaseRepository  new.

a connectionURL: 'http://localhost:8182'.

res := a executeGremlin: 'g.V().hasLabel(''author'')'.

b deserialize: res.
```

will likely return you a Vertex Smalltalk object, assuming such a vertex exists in your data store.
