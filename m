Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2121137njb;
        Mon, 23 Sep 2024 02:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWhxSWv2LuxQhTwniZEhHQw4yychnnh8p2zhCgzgkkdzqUlIExxlHhbW17AnvKFRMbfC36NRaAUjOFTVA==@linaro.org
X-Google-Smtp-Source: AGHT+IH4BA3R54pdgCRqifBMzlAFwxdhnn/A/ZaYLS+s9f7GN/nAEVxO3CMm+OPijwuxLEwS0XJg
X-Received: by 2002:a05:6214:3d87:b0:6c9:7864:e726 with SMTP id 6a1803df08f44-6c97864f192mr4014276d6.48.1727085575853;
        Mon, 23 Sep 2024 02:59:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727085575; cv=pass;
        d=google.com; s=arc-20240605;
        b=gv4RpE5r/PQ8vzFejo06fLlVzyW1yamD37fNjA+GQ+omns12wdvW6WULHtkGqaeM3r
         E9vk4vJv6bzRBOiod3dsSRIcnV96Yql5jhe3zTtvkUF3SUuIGRztFkQnk66S74aFMTuT
         vuczj68SRc0o6PPVf8ikbu2YGRLvlJKVkq/AgFsvScvvvVHui085Gc4c+pKky2whIcWi
         Z1u2pK37YUohBF4/yCmP8oU2qds7QC57/KkWZ8byWvBv/5uqoXnjT9pH9D+6TEv+H0NV
         6YR6yQsKEMwRjI11zDZxbESiCXFYK6U3MABYku1giwOjTE1RFa3oBHCKwDH/+la0eU2f
         7lHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=FJbYEXLyGwdwQK9/bT+f2uf3VVy37cotEWJgrT9+5+c=;
        fh=eTwnxs1+FGJOqVDFLH1kB1mWPDr0VkCjxPAOj/Y+/ac=;
        b=cAGRHZXLRwCMV/emWhaVO5vVJinOsw1/cy1Ll5s5WYPDv+lb4Y526cIL363mZHNNem
         7f6X5fzO94jGkt4TFljvIofsY5cw146aUQVM2zRDbtAJuLrHqIk+LuFOh+IOs1zOiOBz
         aWyoz2Dkx4cVVDZ5uo/dTjMuNEogflxLAIh+pV2LYz+COyT9yoeGqs7Y6m1MuXI7ynDQ
         aWNF/SRqgZX7iJ1+lHcVuIonZjnOncLpzpkxFCVf4v7BySk4HjLLw3XnT2CbJVJCVSqb
         QfWH8D/LNduGRBTIF8vuQarKAwZ2nYKW/WnljYN4tJi+mEhVFrlj3ZOdjAo/N0cYBpOw
         u+bw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=A2FvJgv0;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e47cfe7si102635766d6.165.2024.09.23.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=A2FvJgv0;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfql-0001KM-M7; Mon, 23 Sep 2024 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfqk-0001EA-7G; Mon, 23 Sep 2024 05:59:22 -0400
Received: from mail-tyzapc01on20723.outbound.protection.outlook.com
 ([2a01:111:f403:2011::723]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfqf-0001Y3-MP; Mon, 23 Sep 2024 05:59:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OU3oEdEy7sdnD0yj89gZVLbCuNCjrOtSHWUuopWZbHDFv44pAEFY+Oeh5B/YBXsAIqzJXEMevd4c7FmLD/gkJ22JbVngMQBjJmEZ+5onDCn/3znWAH5VCUAKpMtg54pjIvI83eQp+FHiN1DTelMhuqsIKmltaHiaPpTgwWy3QSQNVzfzsbo968h82IbxjxmMcaY/+oYWrjSRPHhy7rfvo9Nx1WrqFrfNfTlgtCAFe+U/YSCA9d1Kv72jl+/KW+W3sZisVXkU8n7UzONb7Doj8zABUisAGqyMLovxipae96IYCNge7QFULzn+tTZfgW1g/eaBw5vSPBKvS1wkx3eSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJbYEXLyGwdwQK9/bT+f2uf3VVy37cotEWJgrT9+5+c=;
 b=A70KjUQjX+gvDBKIXflE0m9cdox6sshxp8RM3p55SgtWds/YJMKOs+Vth3Nwk3cF+BC92aqQ6QBEVSJ4a/cQJpVKMc8DqjD3gLiSRT46ylH66Y3rd9UOj4+Z4MnW5Le9Bdl+sChhGw5zrJBaYSAkMHaWtPnj9UUpxzJxnCEGf70htwV1SLzgBLMGub/cc50gfJluAAuHeVgyNLObjz21kFylyvp4sPOF9EhBZKRsts0I08slPpdOHH/vtcQu9ZTpROOmSlyFlUk4hALBQpSMDg/0Y7qr545VmzDhvkfvxGZQTjo8qky2CqgxMVfGNJ9FnbyZuPuBu/iFYtcdUYU6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJbYEXLyGwdwQK9/bT+f2uf3VVy37cotEWJgrT9+5+c=;
 b=A2FvJgv0yL+gxaP1WamQaTHpVYe/RftTYOMZAelzslJUsbV6vyPMQUUo3CUAgY24DtPo0DDV4yw3IdRqoEP+IBV7mCTUpNSzk8e7FBtZF8Jc2TngBX4PXKHlHkwmyocgxuXoE+p6RuKSVqRXrVz4z/L3UPp7wAkXi04CnXUD9/5ilZ8pJhKu+Y5MOCpnjAVrPygcQNdKoTNitkPHsx864fhE1ZQgc9vqDdbl8+mX6nVt7ztbc0DE63E0u/8PA8AllGilCGiz0nofUHRc+PZMBTkrQjztZnTXPoOR3gvG/sgaULdr/4f7WXHJToMsJdNw0TsTkk+RYKnA7AUgN9uBCQ==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB5368.apcprd06.prod.outlook.com (2603:1096:101:64::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.25; Mon, 23 Sep 2024 09:59:05 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%6]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 09:59:05 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel
 Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>
Subject: RE: [SPAM] [PATCH v3 00/11] support I2C for AST2700
Thread-Topic: [SPAM] [PATCH v3 00/11] support I2C for AST2700
Thread-Index: AQHa/dxA7Q2YMqG9Y0mc3Ke+FSE3BLJGGq4AgACzhRCAAG5FAIAAAOUQgB4E4fA=
Date: Mon, 23 Sep 2024 09:59:04 +0000
Message-ID: <SI2PR06MB5041B80E7475A1C2B17BF407FC6F2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
 <00aac81e-ff43-4526-960c-782e27ae043f@kaod.org>
 <SI2PR06MB50418DD956AC152E4E0911CDFC9C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <c418168b-eb5c-459c-85b1-c7766102e558@kaod.org>
 <SI2PR06MB50412AF41EFDEBB0938E7F97FC9C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB50412AF41EFDEBB0938E7F97FC9C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB5368:EE_
x-ms-office365-filtering-correlation-id: 64f0c224-825b-4752-fa5a-08dcdbb65bc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018|217643003; 
x-microsoft-antispam-message-info: =?utf-8?B?LzVOV2lGODBTUEdQczVKY3BXNFp5eGs3YnhuaUJlM0Q5azVGaGtLV1ZKRC9H?=
 =?utf-8?B?WWJqT0ZkSWdmVnQyNDZHUklRNVUyaEtaVW9SNDdhRDMrQjJMaHVFVG5NT0JX?=
 =?utf-8?B?SExFQmNkV29NU1pCWnB0TzFkMDBQTG4ySzNZZldBelhDRDVVdUdLMFJ5THEx?=
 =?utf-8?B?YnJQbVozNmdxWnd2UnhrQUVTY04vNU9YN3NyKy9YcVJ0bUMrd3hlNmVGQlB3?=
 =?utf-8?B?VUowdkxKbk9idXdFMmZCYWJWZGh1S2hVZExIdFNMMlNCV2lYZFQ5VVVFL2p5?=
 =?utf-8?B?OStzWEIvcHgrL3FaTGZ3eDljVnN0eU8wdGxTUzFvRUJGZkNpRmdzejVGQnZs?=
 =?utf-8?B?aFlsV3MxVHUwTTJ2cXFLNlFuU3Q0VVNSNHl2L3NWQjh5M0paTUFXeTRLaEJM?=
 =?utf-8?B?N1FqMzNxSmJBK0lzWFhSNW5DcnErTjZ4N2N2cUhVejVqWk1SeTgrVkg4cm9K?=
 =?utf-8?B?bTNkTFh4UE1BaENkbGV2RlFwUWNpMlFKd0t2NWFzSjlFTC95N043NWFEM1V3?=
 =?utf-8?B?VXJLOStCZ1poYUJ1UDNLWkEzK3czT1owUnhKM2crTnVLTUFIeXFBaFZyWkhW?=
 =?utf-8?B?czg5bVZsR08vNnk5Z1lwL1p5Q08vZlRURkNtZVU0c0ZrK3JhN0srZUZjTTBV?=
 =?utf-8?B?MFdjbE5FcVNzUTY5dTV0dS9ydVF2QXc3ZlJWR3JSSk9LQ2VGOEg2Ym01c0lI?=
 =?utf-8?B?OEZhd0YvYm5MRDNReVV5TTR6V1BPbk82akJtaWxIcXdDYnk1OTVnUHYxWFB1?=
 =?utf-8?B?NU1oZXNDYmw5b1hUZHdHQk8vbTRaQWgzdkJGRWowaFFQQzBJQ0huaGtxS2Vj?=
 =?utf-8?B?RGFpazlnbHB3SVhneTZ3NGlqNWhKRG1UQmNtSTN3c0dGVGdEQUhjRk9tSTFs?=
 =?utf-8?B?QjdFZm5kM0VJeHNoa25WbVVUZkd1bmMxY2FhdDFQem5nSFU5VUNVeWdJMGNY?=
 =?utf-8?B?cWxjR0RKMk1OY3dacFJyQU5PTmdvcEpHVWVFaTYybkdXQ25qN1UwL1dVUWlM?=
 =?utf-8?B?eTdQZjlHMndEZmxHbjZXMk5TTGpydTZUeWFrOXBSaVJpZE9kMlZrM25kVDRa?=
 =?utf-8?B?SHhLSU55MTQxZDVlOXNyY3ZPNTVvR0Q0Y3doWlJIZ29WRWZDN1BLVjZRN0RR?=
 =?utf-8?B?VWZXVmIyWCsrSGNFaHA0MnU0V245TmN6dDVRTVJoS1RsUDByOC8wTHlCTWhq?=
 =?utf-8?B?QWlpb3ZqQ3JPeURRRC9FczFCRkxobHdmYjBkM20yakp4QUFnR3ZTNWIzNm9V?=
 =?utf-8?B?UWlHcVZ2YWU0eHkyVHN2aGZMOVVvM3N3NEwrdVVIQnpLMkk5N1BmTFRZRUc3?=
 =?utf-8?B?ZkFiYThZcmZFblhTc1N0UllXaW9BckxaWmVGQW4xTUJzek5NZTc1SmdwUERy?=
 =?utf-8?B?OGdaV0JYbTdSZDI3djRwNVZnaVAvei9acFdNOXR2NE5ybzg3T09QT0xDZTBm?=
 =?utf-8?B?Q2dqUDRuMXMxTlVJUzd1WHVvYUdWcllpK3BCa0YySThHTC9vRkZ2eVUzMU5m?=
 =?utf-8?B?UDZXU2pCQTJmVEVMU3NHRGkwZENvRHZOWDY2b0Z3L0VFK2tHZ2hyKzBjZUhV?=
 =?utf-8?B?bEphQmQzdG40TUdYS1R0b25VVVpXOXQwbEczc09zVXBCSUxBMFBhWDJ2SWZG?=
 =?utf-8?B?MEVhdzEvQnJVcGkrdWtZNGhkZXhRdTZXeXJacE1VMjVMLzl2bzVBdncvYWhJ?=
 =?utf-8?B?L1FRcDJiSGFhRFFEb3NZSm9XZ2lYM2E5UjhRY2YrdXhkeEp1K2ErZ1lVQU00?=
 =?utf-8?B?cHRiL0NrSDhCaWRJVjhPemRlTk85WDB3cTl5dXJOQlpvT1dpZ2l0d09BenR3?=
 =?utf-8?B?alE5YU1zVzJQWlIzM2hwc3BoRUxhQzk1eG16SkRTRXllb1ZYUGZORVQ1amtF?=
 =?utf-8?Q?8wvFcZHbmdMAX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SI2PR06MB5041.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018)(217643003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXVSZlk4UnJiVlpQTXFCekxubjhnNkhRd1g4elF5NlUrVkpiQ3FIY3lYSHkv?=
 =?utf-8?B?cEU4aVVOdHZGTklMNE9mblIzaWxTQVdrMW9MdUFhZ014Q0ZnZ3duY0tJa3RN?=
 =?utf-8?B?TzMvNEF2MTdOYVBLV09rWTFlSzdTaDJMSW5oQnpndXJJOS9jY29jSFltclM4?=
 =?utf-8?B?K0ZaRGMrQlJDSElnM01uMGFod3ExbUVwY2pZWjlWK3BWNEY5djFwMksvcDVr?=
 =?utf-8?B?VWU0Yy9sSWc4dkhOSmpNYVFDb3RXTnlkVk9wNTFvcS96MWtKaURvUmxMcEdU?=
 =?utf-8?B?MENzZlZDNmdlS0p4REluZStVVGd6SHJ6YWY0NWZYRUVnWko2THIvaUZDNHBO?=
 =?utf-8?B?V0oxOVJLK0R1VmlmTUg3NTV6Zk10ZmlVMVYrTHFwaUVIWklqaGpNbXNyTWlV?=
 =?utf-8?B?NVpjeDRURTFUbFlRREMweFIxMklzNjdXRnRVQkdzWmpWeTFkNGhwQ29SNTVF?=
 =?utf-8?B?TkRKTzBWN1cwa3RyVzc2bGNIUFlaOGl5MGdmS2NjYUpXL3RBcXE3dDQyeDAr?=
 =?utf-8?B?SjBzYW9uNkJIMFZIbG5NTVFiUkxQM05IS084dDZsbUVsV05CelVQeER6aUJE?=
 =?utf-8?B?TGVhVGluN0N2RnN3YThtQkwzWkRxdHlyM0d4UUI0WkdTdisrMm9OcS9kcGFt?=
 =?utf-8?B?SGtPcTRkZ2g4dVFSS1U4Nmc2aUdpa21jZnViZk51UFg2QkIwMTBMVlBPMDRO?=
 =?utf-8?B?ZlkvSU9sNjlkMDlKNFRzVm1vUWR1WmluYWNQYVBWMUUvakxrbHQvbHZNVVFl?=
 =?utf-8?B?TmNQMWc4MCtwQ1JzdkhPWmU5anZyTDZibDNiZnBBVnUweTBMVExoYWlvNk5R?=
 =?utf-8?B?V3ZyZDV3czhxbkZJVUdVa09NVkFGdlpBVnRmL2NnNVJzZGRIYnMzYmpJbFZa?=
 =?utf-8?B?bitFZ2dlL2dBTlVZK0Q4elEyRzVGd054eG5xdWhXSlE1NndnNWdkdmdPYS9J?=
 =?utf-8?B?ZGp1UzNKSXAvNVB6ZjIweDF2UnkrNjl0eTNnOU1Wc0JkeU5ZQjFHS3dCcnRl?=
 =?utf-8?B?VjRXcy9EYWFDWDJnODMyN3FSR2lVZnVFbS9EQXcvc1U4ejZpOWQweVNzdG1R?=
 =?utf-8?B?MVdRbDF3M3dsWFoxVWd0TzFTSTZFWllWNDV5eDFnTzJBTXFuZ0NBbXdDbkY4?=
 =?utf-8?B?QUk5RU5qVWlIdk5WcU9SSm1ZNkVDY3FabkZ1QXBqcnQwQ3djMytweWVGNmtB?=
 =?utf-8?B?SzNZL1JxNnJMdGJuQTRmNmo1TzFxSkhiMFQ4bnRpUlh2b0g0UVhLTVNIZ2l0?=
 =?utf-8?B?WUNDNDRBZllNMGFyNmtkdjNJQS9oN3B1dmlkSjM0Q1RXU0R0ODhRMlpMcnBs?=
 =?utf-8?B?N1pNL2dNQXV1ZGk1RjFrOWlvVTR5dWdscHJML1Y4cWtkOWtqY1RGejRGbVRJ?=
 =?utf-8?B?VjVIWWcrS2NwS0NLdnlGNk1BRzRxZStQQm5PMTdTTkFSZGpPZUlUdWFjV0tk?=
 =?utf-8?B?cmZPdXZ5K0ltdW1yYVZ0Y1g4cktFbnduQ2tmN0xwNU8vdlBvaW9qR1orOWlo?=
 =?utf-8?B?RENuTWIzSWI0YkdRVmd4eWZUeWhNTXovNk9JdDFOZ2RBV0FSRWJUcmRVc0VH?=
 =?utf-8?B?MDMvT25JL2xGVEtGSGtGcGdlV3RDeXhsSUFKaFNrUkhRZGY0aXdFUkk1ckFx?=
 =?utf-8?B?TnNmQjFOd0s3UzFPeGhOVnViTnppajE4R1VUMWM3Ym9IdEtWMFUwQ1VqaklF?=
 =?utf-8?B?eCtxM2N6ODlNNmV5bkFOZmY3VkZJVTBLdEZxWUtrVzJCZ1VUNGNVa21idVlU?=
 =?utf-8?B?L3VZNFJRaDN4WFkyY2hleVloMXlCSXBET3NaWitvS3hieDhNWkd6V3pPcnpZ?=
 =?utf-8?B?bHN3ODB2d1ZrVEhyM3FJeFh5dHN1aDNzRGZFQUJzUE5pSXM1aVNRRXluZ3VP?=
 =?utf-8?B?TThOV3VZYUdRWVZha2J3a0lSWmJYUnJWWFdydGFxWjZLaDl2UE81YXQ0WWs5?=
 =?utf-8?B?OC9SU1U3ODlkalRsWkR6ckk3Ung4Rm92Wi8zcnpqS1hkSzYzNnhLUWJObHla?=
 =?utf-8?B?K2pJQW16cUFVN3k5QTVKcS8zdTU4blVPdURHdGVvZmVHeFZURDN5dEJQRHB2?=
 =?utf-8?B?MDdTVmZCazlaQTdmZENVV0F3RW1CNm92amZQVWN4SDlhdHhubUZoWmk5Qnp2?=
 =?utf-8?Q?xv8FpDbbbc38DI4TeIE05nzbV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f0c224-825b-4752-fa5a-08dcdbb65bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 09:59:04.9778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: op1OxDE7axX0hEbUI63Ru345TjJblr8OPPNhf2aeTBLqlk44WsjGEVoyEHFii2x8JVx5eBKvuC1lmqFpC94lodkBfzUzfjb74105voEg0Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5368
Received-SPF: pass client-ip=2a01:111:f403:2011::723;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bWm7lriZiBvc

SGkgQ2VkcmljLA0KDQo+IFN1YmplY3Q6IFJFOiBbU1BBTV0gW1BBVENIIHYzIDAwLzExXSBzdXBw
b3J0IEkyQyBmb3IgQVNUMjcwMA0KPiANCj4gSGkgQ2VkcmljLA0KPiANCj4gPiBTdWJqZWN0OiBS
ZTogW1NQQU1dIFtQQVRDSCB2MyAwMC8xMV0gc3VwcG9ydCBJMkMgZm9yIEFTVDI3MDANCj4gPg0K
PiA+IEhlbGxvIEphbWluLA0KPiA+DQo+ID4gPiBKdXN0IHdhbnQgeW91IHRvIGtub3cgdGhhdCBJ
IGFuZCBUcm95IGFyZSB3b3JraW5nIG9uIHRoZSBmb2xsb3dpbmcNCj4gPiA+IHRhc2tzIGZvcg0K
PiA+IEFTVDI3MDAuDQo+ID4gPiAxLiBTdXBwb3J0IGJvb3QgZnJvbSBib290bWN1KHJpc2N2MzIp
IGluc3RlYWQgb2YgdS1ib290KENvcnRleC1BMzUpDQo+ID4NCj4gPiBPaCBuaWNlLiBUaGlzIGlz
IGEgZ29vZCB0b3BpYyBmb3IgaGV0ZXJvZ2VuZW91cyBtYWNoaW5lcyAhDQo+ID4NCj4gPiA+IDIu
IFN1cHBvcnQgR1BJTy4NCj4gPiA+DQo+ID4gPiBBZnRlciB3ZSBmaW5pc2ggYWJvdmUgdGFza3Ms
IHdlIHdpbGwgdXBzdHJlYW0gUUVNVSBhbmQgc2VuZCBvdXIgcGF0Y2hlcy4NCj4gPg0KPiA+DQo+
ID4gVGhlcmUgaXMgYWxzbyB0aGlzIGlzc3VlIHdlIGRpc2N1c3NlZCBwcml2YXRlbHkgb24gU1BJ
IHdyaXRlDQo+ID4gdHJhbnNhY3Rpb25zIGZhaWxpbmcgb24gdGhlIEFTVDI3MDAwLiBJdCBsb29r
ZWQgcmVsYXRlZCB0bw0KPiA+IGFzcGVlZF9zbWNfZG9fc25vb3AoKSBidXQgd2UgZG9uJ3QgaGF2
ZSBhIGdvb2QgZml4IHlldC4NCj4gPg0KPiA+IFdoZW4gdGltZSBwZXJtaXRzLCBjb3VsZCB5b3Ug
cGxlYXNlIG9wZW4gYSBnaXRsYWIgaXNzdWUgd2l0aCB5b3VyDQo+ID4gZmluZGluZ3MgYW5kIGxv
Z3MsIHNvIHRoYXQgd2UgZG9uJ3QgZm9yZ2V0Lg0KPiA+DQo+IFRoYW5rcyBmb3IgcmVtaW5kaW5n
Lg0KPiANCj4gT2theS4gSSB3aWxsIG9wZW4gYW4gaXNzdWUgaGVyZSwgaHR0cHM6Ly9naXRsYWIu
Y29tL3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzDQo+IFRoYW5rcy1KYW1pbg0KPiA+DQoNCg0K
U29ycnksIER1ZSB0byBteSBQVE8uIEkgd2lsbCBvcGVuIGFuIG5ldyBpc3N1ZSBhbmQgc2VuZCBh
IHBhdGNoIHRvIGZpeCB0aGlzIGlzc3VlLCBzb29uLg0KVGhhbmtzLUphbWluDQoNCj4gPiBUaGFu
a3MsDQo+ID4NCj4gPiBDLg0KPiA+DQoNCg==
