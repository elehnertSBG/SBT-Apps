{
  "stdout": "",
  "id": "https://cgc-api.sbgenomics.com/v2/apps/elehnert/sequence-bloom-tree-reference-apps/bt-count/26/raw/",
  "sbg:revision": 26,
  "sbg:sbgMaintained": false,
  "temporaryFailCodes": [],
  "outputs": [
    {
      "type": [
        "null",
        "File"
      ],
      "id": "#bit_vector",
      "sbg:fileTypes": "BV",
      "outputBinding": {
        "glob": "*bf.bv",
        "sbg:inheritMetadataFrom": "#fasta_in"
      }
    },
    {
      "type": [
        "null",
        "File"
      ],
      "outputBinding": {
        "glob": "*.sh"
      },
      "id": "#bashScript"
    }
  ],
  "sbg:createdBy": "elehnert",
  "sbg:cmdPreview": "bash runSBT_Count.sh",
  "sbg:project": "elehnert/sequence-bloom-tree-reference-apps",
  "sbg:job": {
    "inputs": {
      "fasta_in": [
        {
          "size": 0,
          "path": "/path/to/fasta_in-1.ext",
          "metadata": {
            "sample_id": "test"
          },
          "class": "File",
          "secondaryFiles": []
        },
        {
          "size": 0,
          "path": "/path/to/fasta_in-2.ext",
          "metadata": {
            "sample_id": "test"
          },
          "class": "File",
          "secondaryFiles": []
        }
      ],
      "cutoff": 4,
      "hashfile": {
        "size": 0,
        "path": "/path/to/hashfile.ext",
        "class": "File",
        "secondaryFiles": []
      },
      "bf_size": "10000"
    },
    "allocatedResources": {
      "cpu": 4,
      "mem": 1000
    }
  },
  "sbg:id": "elehnert/sequence-bloom-tree-reference-apps/bt-count/26",
  "description": "",
  "successCodes": [],
  "sbg:createdOn": 1471798566,
  "sbg:contributors": [
    "elehnert"
  ],
  "class": "CommandLineTool",
  "sbg:image_url": null,
  "sbg:validationErrors": [],
  "hints": [
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
      "value": 4,
      "class": "sbg:CPURequirement"
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
    },
    {
      "class": "CreateFileRequirement",
      "fileDef": [
        {
          "fileContent": {
            "script": "{\n filepath = $job.inputs.fasta_in[0].path\n filename = filepath.split(\"/\").pop();\n file_dot_sep = filename.split(\".\"); \n new_filename = filename.substr(0,filename.lastIndexOf(\".\")) + \".concatenated.bf.bv\"\n var list = [].concat($job.inputs.fasta_in)\n tmp = \"\"\n for (index = 0; index < list.length; ++index) {\n   tmp += \" \" + list[index].path\n }\n \n if ($job.inputs.cutoff) {\n  cutoff =  $job.inputs.cutoff}\n else {\n   cutoff = \"3\"}\n \n if ($job.inputs.bf_size) {\n  bf_size = $job.inputs.bf_size\n  }\n else {\n   bf_size = \"2000000000\"\n }\n  \n  \nreturn \"bt count --cutoff \" + cutoff + \" --threads \" + $job.allocatedResources.cpu + \" \" + $job.inputs.hashfile.path + \" \" + bf_size + \" <(cat\" + tmp + \")\" + \" \" + new_filename + \" && rm \" + tmp\n}",
            "class": "Expression",
            "engine": "#cwl-js-engine"
          },
          "filename": "runSBT_Count.sh"
        }
      ]
    }
  ],
  "sbg:modifiedOn": 1473781214,
  "inputs": [
    {
      "description": "The kmer count cutoff",
      "type": [
        "null",
        "int"
      ],
      "sbg:toolDefaultValue": "3",
      "id": "#cutoff",
      "label": "cutoff"
    },
    {
      "description": "The location of the hashfile written using the \"hashes\" function",
      "label": "hashfile",
      "id": "#hashfile",
      "sbg:fileTypes": "HH",
      "type": [
        "File"
      ],
      "sbg:toolDefaultValue": "1"
    },
    {
      "description": "bf_size determines the size of bloom filters used and should be set to an approximate count of the number of unique k-mers in your dataset.",
      "type": [
        "null",
        "string"
      ],
      "sbg:toolDefaultValue": "2000000000",
      "id": "#bf_size",
      "label": "bf_size"
    },
    {
      "description": "Input fasta/fastq being counted",
      "type": [
        {
          "type": "array",
          "items": "File",
          "name": "fasta_in"
        }
      ],
      "id": "#fasta_in",
      "sbg:fileTypes": "FASTA, FASTQ",
      "label": "fasta_in",
      "sbg:stageInput": null
    }
  ],
  "label": "bt count",
  "baseCommand": [
    "bash",
    "runSBT_Count.sh"
  ],
  "sbg:latestRevision": 26,
  "sbg:modifiedBy": "elehnert",
  "sbg:revisionsInfo": [
    {
      "sbg:revisionNotes": "Copy of elehnert/sequence-bloomtree-cesc/bt-count/2",
      "sbg:revision": 0,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798566
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 1,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798973
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 2,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471798986
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 3,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1471891377
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 4,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593170
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 5,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593664
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 6,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472593802
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 7,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472595684
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 8,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472596318
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 9,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472596378
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 10,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472597035
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 11,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472603024
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 12,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472661597
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 13,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1472661619
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 14,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473380340
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 15,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473380360
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 16,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473381027
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 17,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473381457
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 18,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473381531
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 19,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473381576
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 20,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473382187
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 21,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473384204
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 22,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473391687
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 23,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473393564
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 24,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473779253
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 25,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473780173
    },
    {
      "sbg:revisionNotes": null,
      "sbg:revision": 26,
      "sbg:modifiedBy": "elehnert",
      "sbg:modifiedOn": 1473781214
    }
  ],
  "arguments": [],
  "stdin": ""
}
