# Develop a Flask App with CockroachDB in Okteto Cloud

This is a sample of how to develop a Flask App that uses CockroachDB as the DB. 


1. Head to [Okteto Cloud](https://cloud.okteto.com). If this is the first time you visit the page, you'll be asked to login with your Github credentials. Doing this will automatically create a free developer account for you.

1. Okteto Cloud already includes CockroachDB in its default application catalog. This version is configured to be highly available, and to only admin traffic from within your Okteto namespace. To deploy it, click on the `deploy` button, select `cockroachdb`, and click the `deploy` button.

1. While your cluster finishes starting up, install the [okteto CLI](https://www.okteto.com/docs/getting-started/) in your local machine if you don't have it yet. We'll be using that to start a remote development environment and synchronize your local code.

1. Run the `okteto context use https://cloud.okteto.com` in your local terminal to connect to your Okteto Cloud account.

        $ okteto context use https://cloud.okteto.com

1. Run the `okteto kubeconfig` command to download your credentials and activate your Okteto Cloud namespace.

        $ okteto kubeconfig

1. Run `okteto up` to start your development environment in Okteto Cloud. Your development environment will be pre-configured with everything you need to develop your `flask` application.

        $ okteto up


1. Before starting our service, we need to create the database. Your development environment is already configured with the cockroachDB client and access to the cluster, so all you have to run is:

        okteto> cockroach sql -e 'CREATE DATABASE todo' --insecure

1. Start your service directly in your development environment

        okteto> python app.py

1. When you started your development environment, Okteto Cloud automatically created an HTTPS endpoint to it. Go to Okteto Cloud, find the service and click on the URL to access your application. Add and remove a few items from the todo list to try it out. 