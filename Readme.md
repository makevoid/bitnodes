# Bitnodes

Script that generates a `bitcoin.conf` Bitcoin Core Configuration file to be able to connect to multiple bitcoin core nodes.

Please use with moderation, you don't really want to run many clients that open connections to all the peers in the network for an extended amount of time, this will degrade the overall network perfomance. See this SO message from `pwulle`: https://bitcoin.stackexchange.com/a/8140/12796

### Run

    ruby bitnodes.rb

Then copy the config generated in `bitnodes.txt` into your `bitcoin.conf`. Edit the script to use `sample()` instead of `sort()` if you just want to add some random nodes and not all of them.

IP sources from `blockchain.info`

##### Quick examples:

Check how many open connections you have:

    bitcoin-cli getinfo  | grep connections
     
Check how many different peers you are connected to:

    bitcoin-cli getpeerinfo | grep subver | sort | uniq -c | sort -r
