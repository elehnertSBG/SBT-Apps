{
  "stdout": "",
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/bt-build-and-compress/2/raw/",
  "sbg:revision": 2,
  "sbg:sbgMaintained": false,
  "temporaryFailCodes": [],
  "outputs": [
    {
      "type": [
        "null",
        "File"
      ],
      "outputBinding": {
        "glob": "*tar"
      },
      "id": "#srv_tar"
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:cmdPreview": "bash ./prepareDirectory.sh && cwd=$(pwd) && cd /srv && bt build --sim-type 0 hashfile.ext filterListFile.txt mySBT.bloomtree && bt compress mySBT.bloomtree mySBT.compressed.bloomtree && rm *.bv && rm mySBT.bloomtree && tar -cvf \"$cwd/mySBT.tar\" /srv",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:job": {
    "inputs": {
      "sim_type": "0",
      "bf_inputs": [
        {
          "size": 0,
          "path": "/path/to/SEQUENCE_INPUTS-1.ext",
          "class": "File",
          "secondaryFiles": []
        },
        {
          "size": 0,
          "path": "/path/to/SEQUENCE_INPUTS-2.ext",
          "class": "File",
          "secondaryFiles": []
        }
      ],
      "output_prefix": "mySBT",
      "hashfile": {
        "size": 0,
        "path": "/path/to/hashfile.ext",
        "class": "File",
        "secondaryFiles": []
      }
    },
    "allocatedResources": {
      "cpu": 1,
      "mem": 1000
    }
  },
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/bt-build-and-compress/2",
  "description": "",
  "successCodes": [],
  "sbg:createdOn": 1478546421,
  "sbg:contributors": [
    "elehnert"
  ],
  "class": "CommandLineTool",
  "sbg:image_url": null,
  "sbg:validationErrors": [],
  "hints": [
    {
      "value": 1,
      "class": "sbg:CPURequirement"
    },
    {
      "value": 1000,
      "class": "sbg:MemRequirement"
    },
    {
      "class": "DockerRequirement",
      "dockerImageId": "",
      "dockerPull": "cgc-images.sbgenomics.com/elehnert/sbt:0.3.5"
    },
    {
      "value": "m1.xlarge",
      "class": "sbg:AWSInstanceType"
    }
  ],
  "requirements": [
    {
      "class": "CreateFileRequirement",
      "fileDef": [
        {
          "fileContent": {
            "script": "{\n  var list = [].concat($job.inputs.bf_inputs);\n  var listLength = list.length;\n  hold = \"\";\n  \n  for (var i = 0; i < listLength; i++) {\n    temp = list[i].path\n    temp2 = temp.split(\"/\")\n    temp3 = temp2[temp2.length-1]\n    hold = hold + \"/srv/\" + temp3 + \"\\n\"\n  }\n  return hold\n  }\n\n",
            "class": "Expression",
            "engine": "#cwl-js-engine"
          },
          "filename": "filterListFile.txt"
        },
        {
          "fileContent": {
            "script": "{\n\thashInput = $job.inputs.hashfile.path\n\ttmp = hashInput.split(\"/\")\n    tmp.pop()\n    inputDir = tmp.join(\"/\")\n\treturn \"cp filterListFile.txt /srv/;\\nfor f in `ls \" + inputDir + \"/*.bv` ; do\\n  mv $f /srv/;\\ndone\\nmv \" + $job.inputs.hashfile.path + \" /srv/\"\n}",
            "class": "Expression",
            "engine": "#cwl-js-engine"
          },
          "filename": "prepareDirectory.sh"
        }
      ]
    },
    {
      "class": "ExpressionEngineRequirement",
      "id": "#cwl-js-engine",
      "requirements": [
        {
          "dockerPull": "rabix/js-engine",
          "class": "DockerRequirement"
        }
      ]
    }
  ],
  "sbg:modifiedOn": 1478549317,
  "inputs": [
    {
      "description": "Bloom filters to be used to build tree.",
      "type": [
        "null",
        {
          "type": "array",
          "items": "File",
          "name": "bf_inputs"
        }
      ],
      "id": "#bf_inputs",
      "sbg:fileTypes": "BV",
      "label": "Bloomfilters",
      "sbg:stageInput": "link"
    },
    {
      "description": "Hashfile used to build bloomfilters",
      "type": [
        "null",
        "File"
      ],
      "id": "#hashfile",
      "sbg:fileTypes": "HH",
      "label": "hashfile"
    },
    {
      "description": "sim-type is an option that defines the similarity metric used. (0) uses the default Hamming distance between two bit vectors while (1) uses a Jaccard index metric.",
      "type": [
        "null",
        {
          "type": "enum",
          "symbols": [
            "0",
            "1"
          ],
          "name": "sim_type"
        }
      ],
      "id": "#sim_type",
      "label": "sim-type"
    },
    {
      "description": "The location of the SBT structure file being written.",
      "type": [
        "null",
        "string"
      ],
      "id": "#output_prefix",
      "label": "Bloomtree output file prefix"
    }
  ],
  "label": "bt build and compress",
  "baseCommand": [
    {
      "script": "{\n  build_options = \"\"\n\n  if ($job.inputs.sim_type) {\n    sim_type = $job.inputs.sim_type\n    build_options += \"--sim-type \" + sim_type\n  }\n  \n  \n  tempHash = $job.inputs.hashfile.path.split(\"/\").pop()\n\n  \n  if ($job.inputs.output_prefix) {\n    prefix = $job.inputs.output_prefix\n  }\n  else {\n    prefix = \"mySBT\"\n  }\n  \n  \n  build_command = \"bash ./prepareDirectory.sh && cwd=$(pwd) && cd /srv && bt build \" + build_options + \" \" + tempHash + \" filterListFile.txt mySBT.bloomtree\"\n  compress_command = \"bt compress mySBT.bloomtree mySBT.compressed.bloomtree\"\n  cleanup_command = \"rm *.bv && rm mySBT.bloomtree && tar -cvf \\\"$cwd/\" + prefix + \".tar\" + \"\\\" /srv\"\n  \n  \n  \n  return build_command + \" && \" + compress_command + \" && \" + cleanup_command\n \n}\n",
      "class": "Expression",
      "engine": "#cwl-js-engine"
    },
    ""
  ],
  "sbg:latestRevision": 2,
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloom-tree-reference-apps/bt-build/8",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1478546421
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 1,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1478548209
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 2,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1478549317
    }
  ],
  "arguments": [],
  "stdin": ""
}
