# <center> GitHub Actions and Codespaces </center>
## <center> Configuring Development Containers </center>
---

#### `devcontainers.json`
- __name:__ You can name your dev container anything you want. A default value is supplied.
- __image:__ The name of an image in a container registry ([DockerHub](https://hub.docker.com/), [GitHub Container registry](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages), or [Azure Container Registry](https://azure.microsoft.com/services/container-registry/)) that will be used to create the dev container for the codespace.
- __features:__ A list of one or more objects, each of which references one of the available dev container features. Features are self-contained, shareable units of installation code and development container configuration. They provide an easy way to add more tooling, runtime, or library features to your development container. You can add features either within VS Code or in the devcontainer.json editor on GitHub.com. For more information, click either the Visual Studio Code or Web browser tab in "Adding features to a devcontainer.json file."
- __forwardPorts:__ Any ports listed here will be forwarded automatically. For more information, see "Forwarding ports in your codespace."
- __postCreateCommand:__ Use this property to run commands after your codespace is created. This can be formatted as a string (as above), an array, or an object. For more information, see the dev containers specification on the Development Containers website.
- __customizations:__ This property allows you to customize a specific tool or service when it is used for working in a codespace. For example, you can configure specific settings and extensions for VS Code. For more information, see "Supporting tools and services" on the Development Containers website.
- __remoteUser:__ By default, you’re running as the vscode user, but you can optionally set this to root.

