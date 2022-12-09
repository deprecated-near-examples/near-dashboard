# ⚠️⛔ DEPRECATED

> This project is not being actively supported, the code is not expected to work nor reflects the latests improvements in our tooling stack

A toy project to produce a cool looking CLI dashboard for the NEAR platform.

## Quickstart

1. clone this repo
2. install [Sampler](https://sampler.dev/#installation) with `brew install sampler`
3. start the dashboard with `npm start`

## Wat?

Sampler is a *"A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file."*

This project provides a `near.yml` configuration file for Sampler that renders a dashboard against the NEAR platform by polling data from various NEAR endpoints over HTTP.

It depends on Sampler being installed along with the availability of `curl`, `awk` and `printf` at the terminal.

Caveat: this project was only tested on a 2015 Macbook Pro.

### What does the dashboard look like?

![demo](https://user-images.githubusercontent.com/24913/70863197-8ce9c300-1f56-11ea-9655-dc10427eb455.gif)

### Where is the data coming from?

The NEAR platform exposes multiple status endpoints for polling over HTTP for TestNet:

- https://rpc.nearprotocol.com/status
- https://rpc.nearprotocol.com/metrics

At the terminal you can use this command (wherever `curl` is available) to fetch network status

```sh
curl -s https://rpc.nearprotocol.com/status
```
*see [explainshell](https://explainshell.com/explain?cmd=curl+-s+http%3A%2F%2Frpc.nearprotocol.com%2Fstatus) for details on the line above*


Another utility, [jq](https://stedolan.github.io/jq/), is used to process the results that arrive as JSON

```sh
curl -s https://rpc.nearprotocol.com/status | jq '.chain_id'
```
*see [explainshell](https://explainshell.com/explain?cmd=curl+-s+http%3A%2F%2Frpc.nearprotocol.com%2Fstatus+%7C+jq+%27.chain_id%27) for details on the line above*


And [awk](https://linuxconfig.org/learning-linux-commands-awk) is used to extract data when multiple values are retrieved together and [printf](https://linuxconfig.org/bash-printf-syntax-basics-with-examples) us used to format the results for presentation.

```sh
curl -s https://rpc.nearprotocol.com/metrics | grep '^block_produced_total' | awk -F ' ' '{ printf(" %d", $2) }'
```
*see [explainshell](https://explainshell.com/explain?cmd=curl+-s+http%3A%2F%2Frpc.nearprotocol.com%2Fmetrics+%7C+grep+%27%5Eblock_produced_total%27+%7C+awk+-F+%27+%27+%27%7B+printf%28%22+%25d%22%2C+%242%29+%7D%27) for details on the line above*


**Note**

Another endpoint is available but not currently used by this dashboard
- https://rpc.nearprotocol.com/network_info


## Local Development

The dashboard is configured using `near.yml`.  See [Sampler documentation](https://github.com/sqshq/sampler) for details on the format.

All requests used by the dashboard are also available in the file `dev/requests.sh`.  This file is executable and running it will generate all the data being used to drive the dashboard, although without the pretty formatting.

A fake `/status` endpoint is included for sizing the dashboard to variable size data like number of validators.  To use this utility use `npm run dev` to start a local server and edit the `near.yml` file anywhere you see the `/status` endpoint being used.  Since the data is polled, any edits to `dev/db.json` will appear in the dashboard with the next request.

## Related Resources

There are lots of dashboard builders like this:

- Go https://github.com/gizak/termui (used by Sampler)
- Rust https://github.com/fdehau/tui-rs
- JavaScript https://github.com/yaronn/blessed-contrib
