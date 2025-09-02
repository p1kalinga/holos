package holos

// Expose a message parameter (overridable via Platform / --inject)
#Params: {
  Message: string | *"<html><body><h1>Hello from Holos!</h1></body></html>" @tag(message, type=string)
}

// Produce a Kustomize BuildPlan for Holos
holos: Kustomize.BuildPlan

Kustomize: #Kustomize & {
  KustomizeConfig: {
    // include our base YAML
    Files: { "nginx.yaml": _ }
    
    // kustomization.yaml content
    Kustomization: {
      // keep patches extensible
      _patches: {}
      patches: [ for _, p in _patches { p } ]
    }
  }
}
