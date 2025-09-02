// platform/nginx.cue
package holos

Platform: _ & {
  Components: {
    nginx: {
      name: "nginx"
      path: "components/nginx"
      parameters: {
        message: "<html><body><h1>Hello, Dev!!!</h1></body></html>"
      }
    }
  }
}
