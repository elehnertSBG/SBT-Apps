{
  "stdout": "",
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/bt-query/4/raw/",
  "sbg:revision": 4,
  "sbg:sbgMaintained": false,
  "temporaryFailCodes": [],
  "outputs": [
    {
      "label": "Bloomtree output",
      "outputBinding": {
        "glob": "*versus*.txt"
      },
      "id": "#output",
      "type": [
        "null",
        "File"
      ]
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:cmdPreview": "tar -xvf /path/to/test.tar && mv srv/* /srv/ && cwd=$(pwd) && cd /srv && bt query mySBT.compressed.bloomtree query.txt \"$cwd/query_versus_test.txt\"",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:job": {
    "inputs": {
      "threshold": 0.5,
      "max_filters": 5,
      "srv_input": {
        "size": 0,
        "path": "/path/to/test.tar",
        "class": "File",
        "secondaryFiles": []
      },
      "leaf_only": "0",
      "query_file": {
        "size": 0,
        "path": "query.txt",
        "class": "File",
        "secondaryFiles": []
      }
    },
    "allocatedResources": {
      "cpu": 1,
      "mem": 1000
    }
  },
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/bt-query/4",
  "description": "",
  "successCodes": [],
  "sbg:createdOn": 1471798549,
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
  "sbg:modifiedOn": 1474385670,
  "inputs": [
    {
      "description": "A float between 0 and 1 that defines the proportion of query k-mers that must be present in any bloom filter to define a \"hit.\"",
      "type": [
        "null",
        "float"
      ],
      "id": "#threshold",
      "label": "threshold",
      "sbg:toolDefaultValue": "0.8",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": true,
        "prefix": "-t",
        "valueFrom": {
          "script": "{ if (filepath = $job.inputs.threshold) {\n  return $job.inputs.threshold\n}\n else {\n   return 0.8\n }\n}",
          "class": "Expression",
          "engine": "#cwl-js-engine"
        }
      }
    },
    {
      "description": "Defines the total number of filters that can be loaded at one time into memory.",
      "type": [
        "null",
        "int"
      ],
      "id": "#max_filters",
      "label": "max_filters",
      "sbg:toolDefaultValue": "1",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": true,
        "prefix": "--max-filters",
        "valueFrom": {
          "script": "{if ($job.inputs.max_filters) {\n  return $job.inputs.max_filters\n}\n else {\n   return 1\n }\n}\n   ",
          "class": "Expression",
          "engine": "#cwl-js-engine"
        }
      }
    },
    {
      "description": "(0) is the default and searches the entire SBT, whereas (1) ignores the tree structure and only searches leaf nodes.",
      "type": [
        "null",
        {
          "type": "enum",
          "symbols": [
            "0",
            "1"
          ],
          "name": "leaf_only"
        }
      ],
      "id": "#leaf_only",
      "label": "leaf-only",
      "sbg:toolDefaultValue": "0",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": true,
        "prefix": "--leaf-only",
        "valueFrom": {
          "script": "{if ($job.inputs.leaf_only) {\n  return $job.inputs.leaf_only\n}\n else {\n   return 0\n }\n}",
          "class": "Expression",
          "engine": "#cwl-js-engine"
        }
      }
    },
    {
      "type": [
        "File"
      ],
      "id": "#query_file",
      "inputBinding": {
        "sbg:cmdInclude": true,
        "separate": false,
        "position": 2
      }
    },
    {
      "type": [
        "null",
        "File"
      ],
      "id": "#srv_input",
      "sbg:stageInput": null
    }
  ],
  "label": "bt query",
  "baseCommand": [
    {
      "script": "{\n  return \"tar -xvf \" + $job.inputs.srv_input.path + \" && mv srv/* /srv/ && cwd=$(pwd) && cd /srv && bt query\"\n}",
      "class": "Expression",
      "engine": "#cwl-js-engine"
    }
  ],
  "sbg:latestRevision": 4,
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/bt-query/0",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798549
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 1,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473952529
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 2,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473955352
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 3,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1474381090
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 4,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1474385670
    }
  ],
  "arguments": [
    {
      "separate": false,
      "position": 100,
      "valueFrom": {
        "script": "\"\\\"$cwd/\" + $job.inputs.query_file.path.split(\"/\").pop().split(\".\")[0] + \"_versus_\" + $job.inputs.srv_input.path.split(\"/\").pop().split(\".\")[0] +\".txt\\\"\"",
        "class": "Expression",
        "engine": "#cwl-js-engine"
      }
    },
    {
      "separate": false,
      "position": 1,
      "valueFrom": "mySBT.compressed.bloomtree"
    }
  ],
  "stdin": ""
}
