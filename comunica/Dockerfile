FROM node:20

WORKDIR /app

# Install exactly what you have locally
RUN npm install -g @comunica/query-sparql

# Command to launch the HTTP federated SPARQL server
CMD ["comunica-sparql-http", "--port", "3000", "http://ontop:8080/sparql", "http://fuseki:3030/camunda/sparql"]
