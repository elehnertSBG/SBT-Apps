{
  "stdout": "",
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/bt-hashes/0/raw/",
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
        "glob": "hashfile.hh"
      },
      "id": "#hashfile"
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:cmdPreview": "bt hashes hashfile.hh",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:job": {
    "inputs": {
      "nb_hashes": 9,
      "kmer": 4
    },
    "allocatedResources": {
      "cpu": 1,
      "mem": 1000
    }
  },
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/bt-hashes/0",
  "description": "",
  "successCodes": [],
  "sbg:createdOn": 1471798560,
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
  "sbg:modifiedOn": 1471798560,
  "inputs": [
    {
      "description": "The kmer index size.",
      "type": [
        "null",
        "int"
      ],
      "id": "#kmer",
      "label": "kmer",
      "sbg:stageInput": null,
      "sbg:toolDefaultValue": "20",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": true,
        "prefix": "-k"
      }
    },
    {
      "description": "Number of hash functions to use",
      "label": "nb_hashes",
      "id": "#nb_hashes",
      "type": [
        "null",
        "int"
      ],
      "sbg:toolDefaultValue": "1",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": false,
        "position": 10000,
        "valueFrom": {
          "script": "{if ($job.inputs.nb_hashes) {\n  return $job.inputs.nb_hashes\n  }\n else {\n   return 1\n }\n}",
          "class": "Expression",
          "engine": "#cwl-js-engine"
        }
      }
    }
  ],
  "label": "bt hashes",
  "baseCommand": [
    "bt",
    "hashes"
  ],
  "sbg:latestRevision": 0,
  "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/bt-hashes/0",
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/bt-hashes/0",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798560
    }
  ],
  "arguments": [
    {
      "separate": false,
      "position": 900,
      "valueFrom": "hashfile.hh"
    }
  ],
  "stdin": ""
}
