package holos

import "encoding/yaml"

// Patch the ConfigMap's index.html with the Greeting value
Kustomize: KustomizeConfig: Kustomization: _patches: {
  indexHTML: {
    target: kind: "ConfigMap"
    target: name: "nginx-index"
    patch: yaml.Marshal([{
			op:    "replace"
			path:  "/data/index.html"
			value: #Params.Message
    }])
  }
}
