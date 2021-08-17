Goal: Create a "compact, optimized, ordered wordlist to rule them all" that can be used with rules. I manually reviewed all the lists in Daniel Miessler's SecLists and created an order that should provide maximum value when catted together and deduped. It's not exactly plug and play - you need to have installed SecLists in /opt/SecLists and unzipped rockyou.txt in-place. 

Installs duplicut, hate_crack, and generates an ordered wordlist based on almost all of the wordlists in Daniel Miessler's SecLists project (as of 8/16/2021).

I manually created an ordering (ordered-wordlists.txt) in which the lists are "catted" together before being duplicut'd. This ordering is based on a manual review of the lists prioritizing short lists and secondarily, lists that appear to have the most popular passwords at the top (vs being random or alphabetical). Most lists that appear to have popular 
passwords at the top only do that for the first 100-10000 passwords before being ordered alphabetically or some other recognizable ordering. It's likely that all these other passwords only had one "hit" in whatever frequency list was used to determine the order. That's why short, ordered lists are placed first.

Note that you have to install the SecLists and extract rockyou.txt yourself. If you install the SecLists to a different path than /opt/SecLists you'll need to locally update the base paths in ordered-wordlists.txt.
