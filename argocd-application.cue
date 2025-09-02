package holos

import (
  "path"
  app "argoproj.io/application/v1alpha1"
)

#ComponentConfig: {
  Name: _
  OutputBaseDir: _

  let ArtifactPath = path.Join([OutputBaseDir, "gitops", "\(Name).application.gen.yaml"], path.Unix)
  let ResourcesPath = path.Join(["deploy", OutputBaseDir, "components", Name], path.Unix)

  Artifacts: "\(Name)-application": {
    artifact: ArtifactPath
    generators: [{
      kind:   "Resources"
      output: artifact
      resources: Application: (Name): app.#Application & {
        metadata: {
          name: Name
          namespace: "argocd"
        }
        spec: {
          project: "default"
          destination: {
            server: "https://kubernetes.default.svc"
            namespace: "default"
          }
          source: {
            repoURL: "https://github.com/p1kalinga/holos.git"
            targetRevision: "main"
            path: ResourcesPath
          }
          syncPolicy: {
            automated: {
              prune: true
              selfHeal: true
            }
            syncOptions: [
              "CreateNamespace=true",
              "ServerSideApply=true",
            ]
          }
        }
      }
    }]
  }
}
