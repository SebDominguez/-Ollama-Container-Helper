This README provides a quick overview of the script’s functionality, usage examples, and setup instructions. It’s perfect for anyone looking to streamline the management of their Ollama Docker container!

---

## Features

- **Start** the Ollama Docker container with a single command.
- **Stop** the container when it’s no longer needed.
- **Update** the container or its models with ease.
- **Restart** the container for a fresh start or to apply updates.
- **List available models** inside the container for quick management.

## Installation

1. Clone the repository or download the script and the docker-compose file directly:
   ```bash
   curl -O https://raw.githubusercontent.com/SebDominguez/Ollama-Container-Helper/refs/heads/master/ollama.sh -O https://raw.githubusercontent.com/SebDominguez/Ollama-Container-Helper/refs/heads/master/docker-compose.yml
   ```
2. Make the script executable:
   ```bash
   chmod +x ollama.sh
   ```
3. (Optional) Move the script to a directory in your `PATH` to access it from anywhere:
   ```bash
   sudo mv ollama.sh /usr/local/bin/ollama
   ```

## Usage

To run the script, use the following syntax:
```bash
./ollama.sh [command]
```

Or if you moved it to `/usr/local/bin`, simply:
```bash
ollama [command]
```

### Available Commands

start
stop
update
pullmodel
listmodel
deletemodel

- `start` - Start the Ollama container.
- `stop` - Stop the container.
- `update` - Update the container or its models.
- `restart` - Restart the container.
- `listmodel` - List all available models within the container.
- `pullmodel` - Pull a specific model from the ollama.com
- `deletemodel` - delete model from the container's volume.

### Examples

- **Start** the container:
  ```bash
  ./ollama.sh start
  ```
- **Stop** the container:
  ```bash
  ./ollama.sh stop
  ```
- **Update** the container or models:
  ```bash
  ./ollama.sh update
  ```
- **Restart** the container:
  ```bash
  ./ollama.sh restart
  ```
- **List available models**:
  ```bash
  ./ollama.sh listmodel
  ```

## Prerequisites

- **Docker**: Ensure `docker` is installed and running on your machine. You can install it by following the [official Docker installation guide](https://docs.docker.com/get-docker/).
- **Docker Compose**: Make sure `docker-compose` is installed as well. Instructions can be found [here](https://docs.docker.com/compose/install/).

## Contributing

Contributions are welcome! If you have ideas for additional features or improvements, feel free to fork the repository and submit a pull request. 

## License

No license

## Acknowledgments

Thanks to the open-source community for the continuous inspiration and support.