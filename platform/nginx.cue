// platform/nginx.cue
package holos

Platform: _ & {
  Components: {
    nginx: {
      name: "nginx"
      path: "components/nginx"
      parameters: {
        message: "<html><body><h1>Dev environment</h1></body></html>"
      }
    }
  }
}
