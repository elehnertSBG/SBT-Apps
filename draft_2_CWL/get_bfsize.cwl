{
  "stdout": "output.txt",
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/sequence-bloomtree/0/raw/",
  "sbg:revision": 0,
  "sbg:sbgMaintained": false,
  "temporaryFailCodes": [],
  "outputs": [
    {
      "type": [
        "null",
        "File"
      ],
      "outputBinding": {
        "glob": "output.txt"
      },
      "id": "#OUTPUT"
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:cmdPreview": "bt hashes myhashfile.hh 1 && get_bfsize.sh inputs.txt  > output.txt",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:job": {
    "inputs": {
      "SEQUENCE_INPUTS": [
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
      ]
    },
    "allocatedResources": {
      "cpu": 1,
      "mem": 1000
    }
  },
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/sequence-bloomtree/0",
  "description": "",
  "successCodes": [],
  "sbg:createdOn": 1471798563,
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
    }
  ],
  "requirements": [
    {
      "class": "CreateFileRequirement",
      "fileDef": [
        {
          "fileContent": {
            "script": "{\n  var list = [].concat($job.inputs.SEQUENCE_INPUTS);\n  var listLength = list.length;\n  hold = \"\";\n  \n  for (var i = 0; i < listLength; i++) {\n    hold = hold + list[i].path + \"\\n\"\n  }\n  return hold\n  }\n\n",
            "class": "Expression",
            "engine": "#cwl-js-engine"
          },
          "filename": "inputs.txt"
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
  "sbg:modifiedOn": 1471798563,
  "inputs": [
    {
      "type": [
        "null",
        {
          "type": "array",
          "items": "File",
          "name": "SEQUENCE_INPUTS"
        }
      ],
      "id": "#SEQUENCE_INPUTS",
      "sbg:stageInput": null
    }
  ],
  "label": "get_bfsize",
  "baseCommand": [
    "bt",
    "hashes",
    "myhashfile.hh",
    "1",
    "&&",
    "get_bfsize.sh",
    "inputs.txt"
  ],
  "sbg:latestRevision": 0,
  "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/sequence-bloomtree/0",
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/sequence-bloomtree/0",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798563
    }
  ],
  "arguments": [],
  "stdin": ""
}
