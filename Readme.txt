[open sourced verilog data]
PicorV32 [a type of microprocessor]
https://github.com/YosysHQ/picorv32

skywater-pdk-libs-sky130_fd_sc_hd [the definition library for the basic logic gates]
https://github.com/google/skywater-pdk-libs-sky130_fd_sc_hd.git


[n8n]
https://asmveb.online/
athel4@
1) preProcess.json [done]
	- let designers upload zip file to server & this workflow unzip, remove unnecesary files, extract & organize verilog file contents, trigger next workflow
2) pushToAi.json [still R&D]
	- supposed to recursively send each chunk into AI for generating test case chunk by chunk, save into a temp folder, use another workflow to aggregate all the info
	- each chunk of test case will go through multiple iterations of checking by AI to ensure no test cases are ignored
	- challenges
		* still in development as GPT file attachment having some issues & direct prompting has limited texts
		* needs to R&D the loop counter to avoid never ending processing between 2 AI Agents
3) Agregator.json [not yet start]
	- suppose to aggregate all results and compile into 1 testbench & saved physically
4) more to come...


[triggering n8n via Postman]
just copy paste this curl and attach a file to it to start testing.
curl --location 'https://asmveb.online/webhook/userSubmitZip' \
--form 'data=@"/D:/vebmy/projects/valiai_proj/picorv32x.zip"'

[python]
mainly used for processing the files physically in the server, being called by n8n