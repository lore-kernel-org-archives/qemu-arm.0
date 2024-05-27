Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp2999465ejb;
        Sun, 26 May 2024 23:49:19 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVN3gBVXuH1aSGHF8iCCvvysOIW2Fb8Gnf672H9EhiUZ7UQDvTD9Zaa48ogqFc9iAPTt/3YPH+Fgaf9MOUT7cPInUvENuFY
X-Google-Smtp-Source: AGHT+IEg2FOi1a34Ua45fcAGAWElR3ykvr+Lwne5l8CekHmH4r6zz0ShKpBlOG2AFfKZsriK6Xjm
X-Received: by 2002:a05:622a:646:b0:43e:41d9:e2f2 with SMTP id d75a77b69052e-43fb0e9496emr85431901cf.35.1716792559380;
        Sun, 26 May 2024 23:49:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716792559; cv=pass;
        d=google.com; s=arc-20160816;
        b=NA69CLcX+sEcC4jEV1aXjOJCnssfo3zSR0z+IdRk7EHYf5OUDrQ+TwZ2peluZPaeOB
         /0DO5aGdO8/FR2LttUcBBQMuYUVcFHB+eV3vKqaao3VguX1WcB/MrMpQ0pOpYUlPCOsT
         1MA+DaP3PkZdOxfoN35V9Q0ctkvwayWS6+nyXPO0AE4ZIgQy7YKVqOO/XlN+PhKZ9ZPA
         anylqqfs5dgbpVDpQbXzETlm5WS/UT7z+bO34PJvfC7DgC5iFtOP5gVMZ6tJpVOAAac+
         8/Ap8CM+s+7zrr3nGPBgmBMPbi/ppMbEZ7UUK6Ex8tA+ORVLgPrkT+ZlV88rAp4+4eIQ
         Gu9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=sQ1GTGPwgMkGVnGca6s0oKxK5lSvVwlliMsNGW8XyFQ=;
        fh=3ArcXSI5j7omDmfQlP9q9XqO1Vxix/X8bxfSQl8iRkM=;
        b=hB32zIRuxt19aAosNSSKD8CgprUP8/XKHSSmqrNj5ys8XFtvbK7S/bf4lm7ofYPugi
         hH/oqbHoeINWZCuJ5fzcuNYZPVBwJqjhrDvQC0XQ6hVZJg/eNKI16h2U7znmBraoNsCx
         zOxuUGEU0N8+ZCL0T/tMAvsAHY+hwF8vWcLuyW+IPE6jqZsv/Kblhp2pa+NsGZfUZk3w
         sJ4jCIspGyCo8PyBK+TcuXxVzfD47pderynfvje2yjp9t2Sj4sZbz0XA3PM6JlnmiL10
         l/i/7k5LK8Nhx4K7PxJHUpUPu3xRmcJ0Dvb/FYdOnCWwMerv1kZ4uoHckHqgySMjR3EF
         45bw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=WxMe3W+9;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb609bb9bsi72266471cf.419.2024.05.26.23.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2024 23:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=WxMe3W+9;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBUAW-0001nN-0o; Mon, 27 May 2024 02:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBUAS-0001go-PM; Mon, 27 May 2024 02:49:13 -0400
Received: from mail-sgaapc01on20724.outbound.protection.outlook.com
 ([2a01:111:f400:feab::724]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sBUAP-0008K7-ID; Mon, 27 May 2024 02:49:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d689aO1eImBV8JfGb/A13xsmb1S/IhiTGJB9krshSrp6Nihxkts4g5pnPYKcXZFRigscEWmR72vkqR3xzBybIZ86S7/PaDThTLKipKE4HhHiYsOMR0dNuhJn6U1jkhHaB5PR2cHO/zmpEYGkrhzaJAnAdk1m5m2l+z5PmoMIz0ozGsfUShqAAW7X2QeaIuO76P4WUqJUXl3SN5AL6pree/GWm5glH9mn9Yf/DBsyUGE6l5DLAIcMxfeXw4A1BGuM+ZO1O7tAcYfuJGH04h69FS6SlgpmfYjtIcPOB2yUG+D3gN2XWYnw+22D4vGuX0OshubHhrRVOzS6imXUfvKgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ1GTGPwgMkGVnGca6s0oKxK5lSvVwlliMsNGW8XyFQ=;
 b=A5KczDQ+8M8v1Td15OLYOVQXrzb2KqKneoa9NGwpSpEG26Cl7xihQrYSm032deXq0OKlbtzWNdcCIaSjABx5Y24ucXrYZOPNu3zZjRaue08XR/TGiw231mzQCgn1Jhff5bcdTgZKXt/D7wEopi7trZK9dP0LIatEiydiW4G2fL5muN0+tCD5gDup/6Idef4xaicn6Wo5xul6Z5fdC5gDIi0QKsEkfsmHA9bPp0fbuB1vxmIfYAuxYM8cGdMTB0FFX8w8tYcfhUrK7qyq1rYgKYqMTgN3mtsppYjk+3w33JG9+BmhvWRKQiGil/huF2LwHBAACuLzyl2skXtnbPAjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ1GTGPwgMkGVnGca6s0oKxK5lSvVwlliMsNGW8XyFQ=;
 b=WxMe3W+9Il/DwLKaDYAil4jzjBQIih6W09HdABx21WsDiSFtEXb7cj/jPvBLmessw2thLaoKLolJTzJlkoa3KtzBBxjyebB4AWn7EUiyJ7rM8/bJHLBQc91LNxVEoUKKtVgB9EdSiwHh8mAf+XFsjrsa/ceT/z3luOiAmSWyBoa5XHM49SuU2uNEGfiHz6S0aqWSEHl40VDBWXC0Wl2myJ68wbKC6CooGeDVFtb+RWw2ijUHO/ofcXhr0DI/t4ed4ww3dmTivc5KiN3A29qm+EdmCsyIZSUYBP2cYXYLhamLjKJxYsOZLNBvr9HnMNoJ458AnHJ+rxp9gfhK+EHOng==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB5390.apcprd06.prod.outlook.com (2603:1096:101:65::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.29; Mon, 27 May 2024 06:48:52 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 06:48:51 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>
Subject: RE: [PATCH v3 08/16] aspeed/smc: support 64 bits dma dram address
Thread-Topic: [PATCH v3 08/16] aspeed/smc: support 64 bits dma dram address
Thread-Index: AQHaj98p56K772t3mE66L/jhh9S5M7GL84QAgAw4wpCAAxPMAIAEXS4AgAtGWYCAAABSYA==
Date: Mon, 27 May 2024 06:48:51 +0000
Message-ID: <SI2PR06MB50417434C60334124084B734FCF02@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
 <20240416091904.935283-9-jamin_lin@aspeedtech.com>
 <986d0cea-611d-46cd-a266-99bac6a62c55@kaod.org>
 <SI2PR06MB5041B10DED228B86F51909D8FCEC2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <034f139a-dc5a-499b-9c1d-8417dcf1a4f9@kaod.org>
 <SI2PR06MB5041CFE7C56A014CDD10D790FCE92@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <8ea0c423-f102-4ceb-941d-c9d64bfe8823@kaod.org>
In-Reply-To: <8ea0c423-f102-4ceb-941d-c9d64bfe8823@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB5390:EE_
x-ms-office365-filtering-correlation-id: 69d3a021-53de-449d-4232-08dc7e1911c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|7416005|1800799015|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?dlNtWW5BUVdjNytIWGpNM2JmaldBMitiMTByMEU5SkxMUWxpaVdUejZ1Ynhw?=
 =?utf-8?B?ZGZNaWNZdWVLNFVSRjJJc2ErenlnZHhtRUFIanpzcS8zOUVSWWE4Yjc5WFha?=
 =?utf-8?B?L3ZNRVNRWklkNE5CYk1mUU1jM3NobFNCTTdXTnUyUCswa1FTbFgrT2dUdmhG?=
 =?utf-8?B?NVNXZ25RcHNZVEVnMXFRVzJkbjJLK0RGaU5veG96NkNXQTMvakFBd0xxaWM2?=
 =?utf-8?B?WTRxSDNSdCtKN2RocGdWZTFwYVVlRFIxNFNiTnZMRjJCbit5Tk0vR2N0c04y?=
 =?utf-8?B?cE1PZW5MTDRHa2d4U01WaERBNHdjOW1ITmtHUXA4T1gwaDY4YmpiT0xHUWd3?=
 =?utf-8?B?UzFSR3JZNUNhRHkrZW5RNkF0UlM1T2U1Z0ZWKzZmMksycmR0ZXRSUkNPcG5I?=
 =?utf-8?B?UldrYjRjZSsxK05ZTDQveVVOM3NnMWVldFlFZHl5VEFLd2wxcUs4OGtYcFJh?=
 =?utf-8?B?V20rcS9JazhWU2U3M2czN3lrOHkrODJSeE1LdmJRcXJFaEJFRkl0aFVtbFVG?=
 =?utf-8?B?TUZqQ1VQeTV4MlBycUdMbTRBazFFNGNSanNNQkhpSUJZVEQ0MTd4QjYxaDZr?=
 =?utf-8?B?a0ZucE0yaGpBOERjOENidVAzSXhXMWFSU0NUVitSbnFGdjVZdU51Qm8xbEFZ?=
 =?utf-8?B?T1ZrcHpoWjdkL3o2UUJXei8zdlA0S1lyOFF4ZHVvVnJrYi84TUJFVDErT2dX?=
 =?utf-8?B?U0JUc29wSnRtczd4dTVGZ2s3TXh2OVI2UEVuMDRKbEtxUFNoZmZDTCtYRGFn?=
 =?utf-8?B?VVQrcXFTcTVzckNyTDJ4N1JvZkhoUXJ5Y2tBUkRKZElZa2FRVFhhNzlYZ1Bl?=
 =?utf-8?B?THl2cWNNS1BQVExrcXlaSEUvTkxiSkVVMmVxcGNTRzZURzVISzlPZ25YTHd0?=
 =?utf-8?B?VXQrQXhuYzNFVkVkOTBBajRaRStxNFkyYjUydTQ1SUhSbjNhNy9RVkQzZ0VM?=
 =?utf-8?B?Yi9sMFgzYTM2S2JvMTZiT2JkK3JUY1JDdHJxSU5JUG1SemxTbDcyWndQSzdx?=
 =?utf-8?B?V1pLQnl5TWxqZVFxcnRJMTYycncwTnUyRDU5VDhZYmtnQWorVGwwMGZsN0Zp?=
 =?utf-8?B?OWZmejB0elJGdjNQUHpzL0lyR0RDbnR0VGcvRDE3QVd2TEZnU0QzTS9SUEdX?=
 =?utf-8?B?Yi9TR2ZoOWlhWlZsUU45T00vVW13TXA0YzdxWDdIYUlmQWlIckVUaFRhbGFK?=
 =?utf-8?B?MjFDUHBEdGpxd3I4VlAwei9TNXFjbFlRWTQ1UUJRU3gxZ0VzbHNKL3lYV2Fh?=
 =?utf-8?B?SmZRZnNqQVJvNnVVRXJTQWxRd2N3ZWVhNDVvYmdCdzc3bGh1NzRpTlo1QU9x?=
 =?utf-8?B?WUgvRWZEVmVLeWh2MTJWa2swUXl1Q0Y3Z2FERU1QNTBmZ1ZjcThaejJWZW51?=
 =?utf-8?B?Zld1SUJiY3lpeTdBb2ptWnc5MjNGTEdWQkh2MDB0NDdHMHJJaXdoZXZTNFg4?=
 =?utf-8?B?Qk80blJPZ1RjbnlMZFdHNDVkOU5PTmFNN29pdzJneDc4cEFDUWRFMTgzYUJX?=
 =?utf-8?B?ZTBuSFFpKzdveDJNUCtXNmc1RGJvUVBFbENCWGd6ekNTV1V0RmxMUjZ2dU00?=
 =?utf-8?B?MjdhT01zd0U2VWRHM2M3V2pyV2VaT1JkV1libVF5L2NzazlQMGhVQis5UFNx?=
 =?utf-8?B?NS90R3BQZ3QxSFRXb1dEOVZJaFNTSWxCZ1d0dnB1R3FZbGZhamdGK3lsM1RK?=
 =?utf-8?B?TzJiYytiR3RGcWpFZ2dPeFJRRUtsbXdTWjFRc1NLTU1GY1I4QWR3YUFSMVNl?=
 =?utf-8?Q?70lQv3s/lk7RmWJFrA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SI2PR06MB5041.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnhyUGUzZWNTWEtpdWRDWCtGSkhndmhtamZEdm9uWnVlVWZJNnpCU0o5VlJU?=
 =?utf-8?B?NDJZVEsvRjB5UGRPbFE4d2YvQkZnN0l6NFlKNE9uQnpybDFrV3M1WVExeWZx?=
 =?utf-8?B?eDg2T012VzFNMWh4MktUSVhLY1FIR1c5cFhHWmE2NlRxUVhndUk1S2RrTXJS?=
 =?utf-8?B?RnJaSFUwTzR3dGxNNmxJakNjSXVPamNOOGg4VXFzanVpSmROZDQ5WDIrbFdy?=
 =?utf-8?B?SmZtQy9sNXpvYjZnN1J6d2wwaVFrTnhxandPTlBuZGhYTXhqbjJER290djNC?=
 =?utf-8?B?VEFTb1FYWUVBd08zWUJQVDZ1YWt2bExUZ3ZLQWhlRngxc3EzVklHU1JNd2dC?=
 =?utf-8?B?MFFGNEpIQW9EMGFEa2NxL3V0eC9aMGZodlBVK2VsQng3aXFoTDJYbUMwbTI5?=
 =?utf-8?B?UUlwcXhwdG16RllUbGlrSkF6VWFHeHVHd0czOVZIMm1LaHU0ckp6Qi9kaHZl?=
 =?utf-8?B?L3FRY0Yyeis3SGxnSzBDTVYwY3h3ZzQ1cnpsTytnZktKM2NIQzRyeXBPZmp3?=
 =?utf-8?B?SjZGQXNQK1ZhWGlEQUlxazYzTGtkVVBtVEd6K0g1aDd6b1NwSGo2aTR2K2Ew?=
 =?utf-8?B?L3lCek1ndGMxcktQY3U4WktRamtPOVVsYTkrRkloMkFhckpCeEFJbHpJMHIw?=
 =?utf-8?B?cEZIS2FUQmlwYzNnTWNvbTBseG10aTZibFlaZUwvOCtjajRJMm1EZE9DSjIy?=
 =?utf-8?B?VmJZM3pUYVZ5UmlXUGxKeEt1eFhkNlpDVVVHK3VXUWd0aXg5N0ZhOFZiQ3N5?=
 =?utf-8?B?RjlETUFPKzVLNVZXNld0OThlbkI3WVNDZGc1TVI3cU5TTmwyc3RoWUUrbEtU?=
 =?utf-8?B?VFlnWklLM1VJbUJzMCswNE1DVmR4WWo1K0xlWUdlYmlhNWRzSldMUlNEU0FB?=
 =?utf-8?B?ek9TRTVTZlZiOGV3SnhnUFJlU3lVQzRVMlZiSW9xeUpCMUNLaGQ0RWRLci83?=
 =?utf-8?B?U3U3bVlmMXAza2pXZzJORUxJb3B4aElHZ2k2bk9lQWxvcG55czhScDdyZ0tm?=
 =?utf-8?B?eXByZEJCZ3JLRDkzc2Q2U05CVTBCbnVBT1JGRHhRS0lpSHhLS2ZxdVlOMVRV?=
 =?utf-8?B?SU96cG5CRXRES0xKVlRkMjBNS3RBYW5LU3NvRXZ3UXplcGVZbnhvM002Wi93?=
 =?utf-8?B?OTJ0YlpxbE84ZVVLV1laMGxHQjJUU2YrVVVlWHU3NndBUmJTaDl0c2lwdHZR?=
 =?utf-8?B?alFwbGp5aUlpUXF6U3JwaFAvK0pJNDlHM2ptRHdDNmlrUUNQcFBGTUFpb0Ro?=
 =?utf-8?B?ZUM3ekFudFpIWURPSVRYVWt5Z2ZwNm5PalBYZnozNWpwTjFGVVE1MDlNL28w?=
 =?utf-8?B?K0grMmViRDUza2xqZ1puNVZabVlrbFg2bC9wendjT3JCZGNsc0pkN3JRVDJR?=
 =?utf-8?B?ZUg5aUFYOCtRa0VCV3Y2OFNRQjVIeURjM2MvWlVUeG50aEFoOTlSZjFwWFY0?=
 =?utf-8?B?VmJReDNpS0hjWUdpSWVYbnpLZ0ZWOGh0U1dEUHlEY2NlWk4rZGQxc0VHK3dD?=
 =?utf-8?B?YTlyNWU2OFFlR0RDM1hYUndmakZqeUNIWENWOUtmTm5WZFhWTXhCcTlkbnZS?=
 =?utf-8?B?ejdRdjZiQStmRUk3bkJIQllKbE5Kb244SGY0U0ErMFhveWdSdjMwWng2YTJN?=
 =?utf-8?B?Nk1hQlkwL08xMFNRVS9qUzM0SFMxVkhJRHpUeWZRdktrdFFxTlJWcEthb0FS?=
 =?utf-8?B?R1FPaFZtY0lUeTkvVHE2RjRpTzA4ZGZoeW56Vld5ME9maVVRb3pJTHNZSWtW?=
 =?utf-8?B?WHlEdWhxYWViRElRUlUyNTM4WE5rNGhCWXpHZmtKanZqdTFTUHd2azNhZm9N?=
 =?utf-8?B?UEFEWjBjWjdWVnprbXBOT3hlR2xMZzBxKzVRZk0vZ2lZMWc4anhhdnNDcFhs?=
 =?utf-8?B?UDVPTGVpamF5ODFqWXc0K01mbkx1L3VmOEJoMkJucFlhWTRrN0lXNGlSZzVP?=
 =?utf-8?B?ekVoOS9STEVqVTk1a05sVDhYWUExU3Y3SjFjWlNMYWRLRTcyTUdKMFlHSWl3?=
 =?utf-8?B?VmlCL3UrTUlvNC9GVW50M0dWNkNyM2ZtWDhGdnBFcnNyM05HdHRGaml4dS9l?=
 =?utf-8?B?OWQzNGQrWkFuelh1RDdLT3dDVjBOcDVuOXMyd2ZjaVRkYW5wbXYwMjRZSE5E?=
 =?utf-8?Q?2ocXUcLCTP4QtGNpZDcYvd2nw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d3a021-53de-449d-4232-08dc7e1911c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 06:48:51.7111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uepJ9GBmb6DsL6Aifwt/IG06YT7PqfnsYwLKo7nVvoObTfWrkBj3Rdbck51ohJ9tFMhIuYYC4WC+nWjJc83NoFUbtZOQkROzzwXp+OPmy3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5390
Received-SPF: pass client-ip=2a01:111:f400:feab::724;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hkLQQGB8D2wn

PiBIZWxsbyBKYW1pbiwNCj4gDQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+PiBTZWUgbXkgYXNwZWVk
LTkuMSBicmFuY2gsIEkgZGlkIHNvbWUgY2hhbmdlcywgbW9zdGx5IGluIHRoZSBsYXN0IHBhdGNo
Lg0KPiA+Pg0KPiA+PiAqIGFzcGVlZF9zbWNfZG1hX2xlbigpDQo+ID4+DQo+ID4+ICAgICAtIGNh
biB1c2UgUUVNVV9BTElHTl9VUCgpLiBzaW1wbGVyLg0KPiA+Pg0KPiA+PiAqIGFzcGVlZF9zbWNf
ZG1hX3J3KCk6DQo+ID4+DQo+ID4+ICAgICAtIGRyYW1fYWRkciAtPiAgZG1hX2RyYW1fb2Zmc2V0
DQo+ID4+ICAgICAtIFRoZXJlIGlzIG5vIG5lZWQgdG8gcHJvdGVjdCB1cGRhdGVzIG9mIHRoZQ0K
PiBSX0RNQV9EUkFNX0FERFJfSElHSA0KPiA+PiAgICAgICByZWdpc3RlciB3aXRoIGFzcGVlZF9z
bWNfaGFzX2RtYV9kcmFtX2FkZHJfaGlnaCgpIHNpbmNlIGl0IGlzDQo+ID4+ICAgICAgIGFscmVh
ZHkgcHJvdGVjdGVkIHdpdGggTU1JTyBhY2Nlc3Nlcy4gU2tpcCB0aGUgY2hlY2sgYW5kIHVwZGF0
ZQ0KPiA+PiAgICAgICBhbHdheXMuDQo+ID4+DQo+ID4+ICogYXNwZWVkX3NtY19kbWFfZHJhbV9h
ZGRyKCkNCj4gPj4NCj4gPj4gICAgIC0gc2FtZSBhcyBhYm92ZS4NCj4gPj4NCj4gPj4gWW91IGNh
biBtZXJnZSB0aGUgY2hhbmdlcyBpbiB0aGUgcmVzcGVjdGl2ZSBwYXRjaGVzIGlmIHlvdSBhZ3Jl
ZS4NCj4gPj4NCj4gPj4gU3RpbGwgb24gdGhlIFRPRE8gbGlzdCA6DQo+ID4+DQo+ID4+ICAgICAt
IEdJQyByZXZpZXcNCj4gPj4gICAgIC0gYXNwZWVkL3NvYzogZml4IGluY29ycmVjdCBkcmFtIHNp
emUgZm9yIEFTVDI3MDANCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+Pg0KPiA+PiBDLg0KPiA+Pg0K
PiA+IEkgbWVyZ2VkIHRoaXMgY29tbWl0IGludG8gbXkgY29kZSBiYXNlIGFuZCB0aGFua3MgZm9y
IHlvdXIga2luZGx5IHN1cHBvcnQuDQo+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29tL2xlZ29hdGVy
L3FlbXUvY29tbWl0L2QxYmMyYzc3NjQyMmE5ZDBkNmFmMmI0NDE0ZmFlDQo+IDgzZmRlMTgzMmJh
DQo+ID4NCj4gPiBBYm91dCBHSUMgc2V0dGluZ3MsIHlvdSBjYW4gcmVmZXIgdG8gb3VyIGtlcm5l
bCBEVFMgc2V0dGluZyBmb3IgZGV0YWlsLg0KPiA+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9Bc3Bl
ZWRUZWNoLUJNQy9saW51eC9ibG9iL2FzcGVlZC1tYXN0ZXItdjYuNi9hcmNoL2FybQ0KPiA2NC9i
b290L2R0cy9hc3BlZWQvYXNwZWVkLWc3LmR0c2kjTDE0My1MMTY0DQo+IA0KPiBDb3VsZCB5b3Ug
cGxlYXNlIHJlc2VuZCBhIHY0IGluY2x1ZGluZyBhbGwgdGhlIGNoYW5nZXMgd2UgZGlzY3Vzc2Vk
ID8NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPiANCk9LDQpUaGFua3MtSmFtaW4NCg0K
