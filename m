Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp400225ejc;
        Thu, 2 Mar 2023 16:55:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8rb8xq2CmWeor/dGeHrwTGPJRNxx1CuapkNTbozccuahcc6hNdHhK79xBhfz3zqS8Rqs9r
X-Received: by 2002:a05:6a20:69a3:b0:b0:3329:c395 with SMTP id t35-20020a056a2069a300b000b03329c395mr5151742pzk.30.1677804935288;
        Thu, 02 Mar 2023 16:55:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677804935; cv=pass;
        d=google.com; s=arc-20160816;
        b=dg4Wf7CM+W4oBDdjRcAJYL0yMCZpID61G1wPVD3CSSZc6IOkzvgRyW3YV6KwNehlT/
         zagDtbMacXjTwVH1uqyNJFYuJfWv76M88uOQdaIw5gHqD96QPfhiiIu/6ThQVwe/pUPF
         zVXaKuGgCb1WtiyVJXUPra/KB7waCLia1LK2J4A5tb5L3wUWVBN4lcfAnDBeg3/zl84X
         LBdpf8UuOFiRj+KPqDkwUDhJt+bQ6FE1cdGj7SSPB5ZRPhOOt8gjHOYE5lHdLFQHJlxO
         6WhHh3tOyyui3IGv2bUBoFK3zu9spU/OMCrCh7O0bC32WyV5tcArg3la70ec8BFO/dwY
         LjIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:wdcipoutbound
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=bW/uTGhgun7/SZdkL38wgpwO6Km0ylvPKJo0NekqdL8=;
        b=Czv+S7tIgZHlY2yTTi1Hy5vJ/dEoXRIDRcZiPuRTHa1RSe41V7WyY+narzc0PXoMFu
         SSZ86H74rkKMli0lg888bi5N1K2NxLGTPOnolIN0H47sCVGKDCe9YYbZL6tmJ7QcBJrE
         g6HG9FMraK46yR+GJEak5ZVe1FlyNc9OTVfl9+EE9ezNpaBVnyy0V9xsUf0FwW1HOxVE
         YqMZuK0qflN8OSYGuodnadZ/4xqpNP4NSjnVHPPp6ZZq47TcHtKFDySSh3iv3JEQKhEL
         rh2fcmEITNMpmdT1N7idR22lFjqlxWwbyIO47JrA4rP3x+ElecV2lKy82gSZRzIQIDXh
         ELPg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=lcJqQsa2;
       dkim=pass header.i=@sharedspace.onmicrosoft.com header.s=selector2-sharedspace-onmicrosoft-com header.b=eyy9A8G7;
       arc=pass (i=1 spf=pass spfdomain=wdc.com dkim=pass dkdomain=wdc.com dmarc=pass fromdomain=wdc.com);
       spf=pass (google.com: domain of prvs=4197e97ac=wilfred.mallawa@wdc.com designates 216.71.153.141 as permitted sender) smtp.mailfrom="prvs=4197e97ac=wilfred.mallawa@wdc.com";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=wdc.com
Return-Path: <prvs=4197e97ac=wilfred.mallawa@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com. [216.71.153.141])
        by mx.google.com with ESMTPS id y64-20020a638a43000000b004fbc985a0cesi702054pgd.637.2023.03.02.16.55.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Mar 2023 16:55:35 -0800 (PST)
Received-SPF: pass (google.com: domain of prvs=4197e97ac=wilfred.mallawa@wdc.com designates 216.71.153.141 as permitted sender) client-ip=216.71.153.141;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=lcJqQsa2;
       dkim=pass header.i=@sharedspace.onmicrosoft.com header.s=selector2-sharedspace-onmicrosoft-com header.b=eyy9A8G7;
       arc=pass (i=1 spf=pass spfdomain=wdc.com dkim=pass dkdomain=wdc.com dmarc=pass fromdomain=wdc.com);
       spf=pass (google.com: domain of prvs=4197e97ac=wilfred.mallawa@wdc.com designates 216.71.153.141 as permitted sender) smtp.mailfrom="prvs=4197e97ac=wilfred.mallawa@wdc.com";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677804935; x=1709340935;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bW/uTGhgun7/SZdkL38wgpwO6Km0ylvPKJo0NekqdL8=;
  b=lcJqQsa2+76WW8xLVur9pwgUfnHqaRzGPJ2l8lswIeCNli11sCyG/4X0
   qgqgB2WPUNeUsV/BVzrCJ6JYNPlOxKJpGfLSF4YnNvbAOom/SV2Ip58mv
   OMGjwThewj33CAO69fdmuPxVFt+RXAfRuhKHIIChtAsAhnyPtgp6ONH1Z
   tbPeJuztuZB3O1c/w52sRMvRAKuRECh+GkIhADc+7AR7f+ph2eN6ns56I
   KQcpVc8WxbELSELjTb9C6pCNXj9kVRPQNTj+aiCQGjebmQTLAj4iOCXPC
   i5wlMOhifQp8wFavbeaoWIfplEKVLf5ZmkwP21bDwE0EbhKpXz9+S9yuX
   g==;
X-IronPort-AV: E=Sophos;i="5.98,229,1673884800"; 
   d="scan'208";a="229646358"
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 08:55:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN5LaXKzkh59xyxl7LPrYrobXOCxY3XwJAGZbLq7gQ9gJwK6Ch+ibBb04CcS+OZYOY9ln92Ien+iOJocQZvDFiNAZ4fW8Pt3jesmRSwkwPbLpFFXc9JbNlW+MdPuG6w8tfr0uzFX7eoa4ksEy+OpuEp7ySQQMcewbsQ4RaBNx5AklOl3sRsF0ckjuAAqc6d3jVqaKV+kCSW7iFQMH3qLVESSDhjPOXYU/LzAJ4VMPhsOayFZnfAkqpMpE2p4RRdhISYm6jkMUMkBfv3dnbb03ad3R7BcCZ7zgbZzVhdmSBhXWDUUs2J0XXeVLqlDMcOzsx5zfuTepX1cjOOmdud7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bW/uTGhgun7/SZdkL38wgpwO6Km0ylvPKJo0NekqdL8=;
 b=FHeHd4QirfkiFMxtFc/XLqMM33GZaLle2z+m7JK1tVuE8emgEeV8GWom/nhqtiRTrPWB/49DNrN/Ci1wb3Ve2gK0+IZFmixB/CFsdkIB2DdY14+kU/DjZSNZwnfxaW46x8qGqX5ugfOinYh6vlQHYhYVdsDi+cN44cnpx246UqdmLURgyJ5Fr6NduhAD1LmuMboColSWfwY3IkXEgGeQbEv0rJUT4paM5Al606L6LGKMBCeq8HCX9Lw/jSyxPM4n4kWCT4pe+JIY3AwVURpWKy4hszosbsMMFdik0iU6+5znCBdmj/dttZ2P448F0BiVfU0cedjyZD6eaJ/3Yy2PsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW/uTGhgun7/SZdkL38wgpwO6Km0ylvPKJo0NekqdL8=;
 b=eyy9A8G7B6h3eKe7DzCfl3MI2SDX6DYtr0bR5KS8a8zZUXPmwcSnDymiUgtw4l4bfxYrapVKPSNksENEx2FkzwXzZXpeUWI9OVTzLQuthuDQJ09hNfxYA4W79oFj8PJYQWF9vGyeHKdpO5SStqqjemrWF0LcXZyZda3XcUqjeVE=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BYAPR04MB4934.namprd04.prod.outlook.com (2603:10b6:a03:4f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 00:55:30 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 00:55:30 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "berrange@redhat.com" <berrange@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thuth@redhat.com" <thuth@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "alex.bennee@linaro.org" <alex.bennee@linaro.org>, "armbru@redhat.com"
	<armbru@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"libvir-list@redhat.com" <libvir-list@redhat.com>, "reinoud@netbsd.org"
	<reinoud@netbsd.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Thread-Topic: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Thread-Index: AQHZTSSxfDGpf+NgQE2OVwO1ea+TKq7oO2mA
Date: Fri, 3 Mar 2023 00:55:30 +0000
Message-ID: <489debf829d7d4e563b3e6668d1b40bfc0332d2e.camel@wdc.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <20230302163106.465559-5-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BYAPR04MB4934:EE_
x-ms-office365-filtering-correlation-id: 9f90f66c-6aad-4286-9d49-08db1b81fc94
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 V8fwbgs7TgBgZASnW+MazunHklWb4um8XHEKMkt+id5icRF7LJAbcrijd8tpVI8RRK3lw4gv/L1n2O0DTtErcljNb3irE+vFPM8/oOsNuLF8N+ApewTjjKe8g6g/Niom9ta9UHJ/jgr2deLS5yGqlOjmiAsPnZ1AEXLFjIsAeX8wDR9YJjm61m5wX1toA0FjhGix7daNPkr2KOx0es5tPxepA2k/SdPiymbgg2zYWh78G48SC2AmHM6Rppnxub37WBmNqCxX8DPZ2Te3Vv2tZ1D9YNHksuKwsPLjG5qJiYcl+dK1A+zWlnB2fw+32tFVRDBDROEN0tCq5uldNFEwrMOEj/pJgP5ZN4Bi/gNpLa932MWzLd1mKzOdJVOpRqI1VOgN5LvGdo4w1svLlw3pG8td663DLoHGBR2NYDEIG2HMPGooHBAlv9IUSwTppGfMu6idMlX6vldpwgBHz/iCkVBGBjCT8iRra4tWt6IF3snssA0BqRK1qFnEAsJHsZBTHIMqL8XKe4eO6wBuCq845cUeUFeVF783RvdmQooHR/UeQVh/cBU0lPdWhyd+8nBySTkp2blkF9Hco6FQ87bg4E5hMoiLLxCDfQWOhH5CdGbaNtO8+TZtHJEF+f5zRLDRDTXi7MjG0sdtcOZ8OFClA9V5sjVpaDBar7t36zB9VbRYGtoGWoOL5a8rh7NC5IXf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0963.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199018)(4326008)(86362001)(8936002)(36756003)(66946007)(41300700001)(66476007)(64756008)(7416002)(8676002)(66556008)(66446008)(2906002)(5660300002)(44832011)(82960400001)(38070700005)(122000001)(38100700002)(71200400001)(91956017)(966005)(478600001)(54906003)(6486002)(316002)(2616005)(76116006)(6512007)(110136005)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0RQNm5vWmZ6NTdmSGJwMStvdWNQcktEVC8yajF5NkY4ekwybWg4VWVDak1H?=
 =?utf-8?B?cW5lcUcxK1ZYQlh1bDlsUXZrUXJNalVxbyszTTJFSSs5NTlLWnZhOFVzaXU1?=
 =?utf-8?B?S3puQWZGUVh2dFFtOEtrTmZHQ0xZOXFDVU1VOUJoRTd2cHYxZWMzbTdEU2lr?=
 =?utf-8?B?Nm9IOHBlT0xMYVNNZk1TMFhlYkNmVUY3Tks0eHIybldGcG1aSUFOdkViVHY0?=
 =?utf-8?B?WDV6VUdDNmRpTjVtalFVZTlQSmFicXBEcWhyMzZIRkh4citYaEhmaE5mYkVy?=
 =?utf-8?B?Y3FTWURKMnFZQkU4MUorT1BGa21zTEk2M2l0M3R3WGtRYm1MTDBkMGtnQmsz?=
 =?utf-8?B?Zy9Bem5EWjdsam9NYjBRVktENkt4eHJndnVTNmJJRGlOODBWOXFaRlgwcit6?=
 =?utf-8?B?S0laM3ZtOSt3T3BRdTErTDBvajBpQ2RITklaR05SVDdtUVdENVY3K3RxVitH?=
 =?utf-8?B?VDBFZmQvTmxLSFJGU0pteXVrSHlmS2lKRkozWncybGxEak5SU25zQXhtNmhJ?=
 =?utf-8?B?d3FPdFBXUWdQRlA2TFArSVFxSWNGSjQ3NTY1TER6bEp1c2FsTCt3SHZzZ3V5?=
 =?utf-8?B?MkJvSlV3bURINE4zZ1gyeWoyUkRjNXVsS3d3MUlhMFpFTExYTHN3Yjc2QUlM?=
 =?utf-8?B?V3JtNGozeXVNOHVFZG1ZVlhBTjFmQ3orQnoxbG5HRU55cXVMeVNjUTVRa08z?=
 =?utf-8?B?SlVPUjZRa1ZNdGNiclRCK2R3UndQYVIrdng2cWxtQ3BHdXprTzFmWEx6anlW?=
 =?utf-8?B?d2pENDN0Y2g4a3lMQXBWaU5PWUJqN2N1ZUh1aHM3T05rWTFvRDNLd25veG8y?=
 =?utf-8?B?WUl6eFl1dmZINVd3UlZjV3NKSjY0VFhuMlROQnlLcVBxZGVzMGFIa25qNjJQ?=
 =?utf-8?B?RDZBdmQ2MGx6bGM3REl0b20rUGhEaTFNRHg3Q1VYRnpjYXlyQWEzSklLVWdi?=
 =?utf-8?B?R2x4bVZzcm8vcFVrVGpDK1JxZHFjSFdGTXB0VG9oak9rb05GQ0lMd3RHMjlU?=
 =?utf-8?B?dy9pUkppemt0SVpiTXFFazZXSHppR2x6THF6QVFDZUZJT0NuSGxWVWMzdEhO?=
 =?utf-8?B?NTQzR3BkV2ptT1pSL3p5d1MwZjU2WkpjVk9MT1RuZTUzbk1lKzVTY0pWcGFy?=
 =?utf-8?B?RnFRTkd3YWtDVEUvREhlbmZsNmxvMG0zcXlqUWl1Rzl5MmhVK0x5THB6bm1u?=
 =?utf-8?B?dzY3TFpXQ1BZUFptc2RuK25sTFpuZ01QT1ZOSWt1MjhCZFQ5ZVN0azJqL2x3?=
 =?utf-8?B?bjFUZjkzNVJtajQ1QlBRcGFUbWFUcUFjZkd5aDN0ZjdBSGxLRzgycHVSSFF1?=
 =?utf-8?B?QmJNNlJWOTVOcjlVanFBU3ZyNXZ5cHJycWZ5S3lja2UvUDBPS0JtRnVZbUZB?=
 =?utf-8?B?M1FGdzM1VTMzS2s4ZklUdEF3aEhVVldDTlVOK1FTWCt2UWU4L21maDR5VFpN?=
 =?utf-8?B?aTNQblBUVkgrcVJEZFdVTW5pMzM4Q0NhRGJPeC90TDI1U05yc1BWWWhmYmxr?=
 =?utf-8?B?MDdtQ2c1NkxuMjI1bW91NkZaMW5ZZlBJUGszRmo5TTZuaTBjbXBYZWY1ODZn?=
 =?utf-8?B?U1AwMDUxUWlVK0xIUTFOSTBmQmh6SjRFQ2IxNGk4V0lqY2RxN2ZSVXU5ZThi?=
 =?utf-8?B?UzRMTVZJbEY3UHlKUHB5Nlk4SlJNSTU2Y2szRThFVEFYZUlVNW1rRytXZFo1?=
 =?utf-8?B?d3d4OHhjeE1PZnp6Tnd1SjFtUEhGZC9zMC96RHV4bDF0RVZ0T21ZZlo5NmtD?=
 =?utf-8?B?VWdzWWxYK3o3QUMxUWlwVXVvWFRIZVREcFRhbDl4SW1jMStyQm9rQW4rbUJG?=
 =?utf-8?B?S0Q5bm03R2U1MVBCSWF6QlhHeC9FWVB3SDEwTkVLMjl2VjgzRkxGb3BkTERJ?=
 =?utf-8?B?U2JPZVdXUGIyeGZ5b0R2R1k2TWd2NmJma2lFYjZMUDdEeUFaNitTSGZ5bTVB?=
 =?utf-8?B?ejcyb0tGOVBPczdhK24xUVpOaVhldlZtbkFldEN6TlBPVHBkOFhWaHdoYktD?=
 =?utf-8?B?djQxWmJLaEg4UGl4S1FOTVEvV1hJNGdualltRFdlazFRWVVQT2FENDNXL1JL?=
 =?utf-8?B?bGkxU0dnQkZ6UFJ1bDVrdHY2YUh3c2hMU2xZR3huZW9YdXB2WlcyaVpIb2xt?=
 =?utf-8?B?dFNHMmNOQmhHSVZWb0ZFOTBaUGM3UXRoL3dUUWJMaVNUN0FuRDZRS1pCSHhI?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <505B39B60C353D45A69E2BB72CA1718A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ecUfadddHZ9gmNcEW05BYVk3C7mh6qudML5EWD7J1ctpE4j3nTEvl6ClGdyIE+YZcsBF7+IdtsebGjXyYDWdV/f28YJf3HrafNUU3xe+MNeYmPfKZlIJLa0n4QRPbzsqU2Ll+3NeuTdO5TpwXY/S103MfX5jcF9uZdoSRnRmswyHtcEd9iTPSEf+V6lQ5nhUqR4kKNUPN+jz3Hl0coBegUbluKSptSEdFrST87Y6aeU1bIWVnXpmChR4Z7PB4WUk/8DsbWZAsY+3zPzf7QwHBgzNb338d1GTFInPluafFVsST57tbrUKUz/hNxS4CbGbSK1Xjo6rBCe91mx5SSfiWfZ+0rNLyVLMZPImikWab01QpH9bETJeVJJ5WJFPbx12BDpV5WPGWu3pmwDJRyxSbZiP+hNyNrduSdcxMZB4e24qW9oASMY13PWodoWSd9R/lzKMP1WXEM0S0AHEwsRoRCUKCEgTjMuJAmWKAz9xkz3aHajM4do4dchidwezrOB0SJWSZmSzkbzINo1uHofO1ND08RizFSlr9lMRH7kcIMqSz9YiB9F12OCIBRdGUyjm3LPpufFdqGQvp7OgHRvmS+RBo2vdJxe/KLfBqz+DhS+32NHwv4+Eu5ezJd3Mc+ji4tApqIML+oHUA0jOAi0pCCzVNIMysdRFmQJ4TMr5bJMRRDwzmzW8v/92uXtjAnHovEtTt7bjgS9WRmL2W4nW4dMeewwiTAwiFD36+h3BiGLP1ZdYre2xh3HoBbfbSzC90T+spL4rs8G5eq9beovmwLFLPw+05xkWTXbpj9CFPS0s7ZDQhTMpcfseN+HMlCiRuF53949bo7Fc9lUlcSSq7nktMwS7fzj/9IdDev7vb6ClwSx6qUMaz87TzrjLYfI7RZejGDteHcPi4cxPIr/0HhZAxaRuCRbdVvqwIC+RGMo=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f90f66c-6aad-4286-9d49-08db1b81fc94
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 00:55:30.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNfNKAgQX112mUXMCETyOF2tjkPjiVYbf+pIPphPrNSMTa3UZmTOfmNtuTGr4MyNPs8JLKGwbT9QVdXekmtiIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4934
X-TUID: OUDDXBzvWbEx

T24gVGh1LCAyMDIzLTAzLTAyIGF0IDE3OjMxICswMTAwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4g
cWVtdS1zeXN0ZW0tYWFyY2g2NCBpcyBhIHByb3BlciBzdXBlcnNldCBvZiBxZW11LXN5c3RlbS1h
cm0sDQo+IGFuZCB0aGUgbGF0dGVyIHdhcyBtYWlubHkgc3RpbGwgcmVxdWlyZWQgZm9yIDMyLWJp
dCBLVk0gc3VwcG9ydC4NCj4gQnV0IHRoaXMgMzItYml0IEtWTSBhcm0gc3VwcG9ydCBoYXMgYmVl
biBkcm9wcGVkIGluIHRoZSBMaW51eA0KPiBrZXJuZWwgYSBjb3VwbGUgb2YgeWVhcnMgYWdvIGFs
cmVhZHksIHNvIHdlIGRvbid0IHJlYWxseSBuZWVkDQo+IHFlbXUtc3lzdGVtLWFybSBhbnltb3Jl
LCB0aHVzIGRlcHJlY2F0ZWQgaXQgbm93Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEh1
dGggPHRodXRoQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiDCoGRvY3MvYWJvdXQvZGVwcmVjYXRlZC5y
c3QgfCAxMCArKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykN
ClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0K
PiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QgYi9kb2NzL2Fib3V0
L2RlcHJlY2F0ZWQucnN0DQo+IGluZGV4IGEzMGFhOGRmZGYuLjIxY2U3MGI1YzkgMTAwNjQ0DQo+
IC0tLSBhL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QNCj4gKysrIGIvZG9jcy9hYm91dC9kZXBy
ZWNhdGVkLnJzdA0KPiBAQCAtNDUsNiArNDUsMTYgQEAgcnVuIDMyLWJpdCBndWVzdHMgYnkgc2Vs
ZWN0aW5nIGEgMzItYml0IENQVSBtb2RlbCwNCj4gaW5jbHVkaW5nIEtWTSBzdXBwb3J0DQo+IMKg
b24geDg2XzY0IGhvc3RzLiBUaHVzIHVzZXJzIGFyZSByZWNvbW1lbmRlZCB0byByZWNvbmZpZ3Vy
ZSB0aGVpcg0KPiBzeXN0ZW1zDQo+IMKgdG8gdXNlIHRoZSBgYHFlbXUtc3lzdGVtLXg4Nl82NGBg
IGJpbmFyeSBpbnN0ZWFkLg0KPiDCoA0KPiArYGBxZW11LXN5c3RlbS1hcm1gYCBiaW5hcnkgKHNp
bmNlIDguMCkNCj4gKycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnDQo+ICsN
Cj4gK2BgcWVtdS1zeXN0ZW0tYWFyY2g2NGBgIGlzIGEgcHJvcGVyIHN1cGVyc2V0IG9mIGBgcWVt
dS1zeXN0ZW0tYXJtYGAuDQo+IFRoZQ0KPiArbGF0dGVyIHdhcyBtYWlubHkgYSByZXF1aXJlbWVu
dCBmb3IgcnVubmluZyBLVk0gb24gMzItYml0IGFybSBob3N0cywNCj4gYnV0DQo+ICt0aGlzIDMy
LWJpdCBLVk0gc3VwcG9ydCBoYXMgYmVlbiByZW1vdmVkIHNvbWUgeWVhcnMgYWdvIGFscmVhZHkN
Cj4gKHNlZToNCj4gKw0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tDQo+IG1pdC8/aWQ9NTQxYWQwMTUwY2E0DQo+
ICspLiBUaHVzIHRoZSBRRU1VIHByb2plY3Qgd2lsbCBkcm9wIHRoZSBgYHFlbXUtc3lzdGVtLWFy
bWBgIGJpbmFyeSBpbg0KPiBhDQo+ICtmdXR1cmUgcmVsZWFzZS4gVXNlIGBgcWVtdS1zeXN0ZW0t
YWFyY2g2NGBgIGluc3RlYWQuDQo+ICsNCj4gwqANCj4gwqBTeXN0ZW0gZW11bGF0b3IgY29tbWFu
ZCBsaW5lIGFyZ3VtZW50cw0KPiDCoC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQoNCg==
