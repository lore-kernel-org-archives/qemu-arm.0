Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp674697njj;
        Tue, 29 Oct 2024 19:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWpEYZB0OC4zjZNc1W7wzavBEhLd6qhx1jQljwl62DsinrRtDuMuJv+M/MA/7BgsIQiAQfetwpINKGOkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG84KykrCMrnxAqgC7oJCKmaxLzJDEEvg2FWWIBWWAix5/omNAlHC2BBjRntFLHzOVzmv0C
X-Received: by 2002:a05:622a:1312:b0:460:b5ac:c263 with SMTP id d75a77b69052e-4613c197af7mr203334801cf.53.1730255538955;
        Tue, 29 Oct 2024 19:32:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1730255538; cv=pass;
        d=google.com; s=arc-20240605;
        b=Uy6WhIZ0SVhB8X+b6BSt+auX6+g9nSN9grido2jI/GgewGv+BPO3Sv2HPFPfya70zZ
         n0XNPbprjG0bRwu19foTdWodtv8ymjvyHsgfX/P4XrHcUsbbw93X2/T1tmViFj0NPXl5
         cQfbVO2nRGv8OLUjrmnQy9zCrpKx9KU98fDPHPGCqLlM4kQo4pqSUwEs0uYRxhCzqHm+
         ekkdLASngCzvuX9qkS5E5sZGERh0+9YijoNQSs9OXfb7oVQjjfAUT2ypOCF6HVjWJD3S
         30WAjKDyYkEVU5lhGmkuv8tu/YF+5uJi4w5vrmcgMjnrN8c1AtF4JBarIvRXtqUdMlSf
         nobQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=WIg2zVG4lcRWL0nIi3AhIqKTQoJBf5ikjeVnGdnab7k=;
        fh=z85enYEQT5PfBtX5BDh/hZshvMDTzfCt/uwPyWvpynE=;
        b=ee59eJfbr+yQAZrOF20QhBcS3P0eCKGpcSgyR9HUHhyPh8o0xEdtFaYTW0C4ffRb6N
         cwaDjOD7BFEqZJ7SnTww6Ev+tLc7yJh06by0h59VpKRqj/Fh58GUtg3LTlcb+9sZlEqZ
         fsgJC4IKdd7KWgat4K3ic8Myu72qM4gYNRB9T6tnqsKTIwuAWFL40bYKQW+DX7ND7mip
         go6CNkF1UxYTcKfHTApuyDE01BxRsxgRAVNS6pzAfN+fnbn2puJ4VcpBjAVMXsasM/DR
         3dhV1OILFzj2Ksv4i1xARCY9UrB3vHzrxUSiIeZoNoSBT/ELJa8vcgtiBfdRzwSnpme9
         3zCQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=M7jMJsHo;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d321b2asi1242302585a.310.2024.10.29.19.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 19:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=M7jMJsHo;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5yVC-0002UY-Ra; Tue, 29 Oct 2024 22:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5yV9-0002U9-MT; Tue, 29 Oct 2024 22:32:03 -0400
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com
 ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5yV7-00061L-At; Tue, 29 Oct 2024 22:32:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNSN5W0bcjtNGzDgX9tr/NfQ4gHcy0p6srwmY+tgXzH9BWaZemf9rXcNJ60eN6hwQLrWiY6PY0eO5vLmdZvb/ZdBwcwtZ6LJthSbIjiqd6iw3agMKVIM/1zlMQ7nno2rTg4Vg5BFNWjHo7bYBAoVPN0eqaCIfPGrlp3rr7N+jhMKTlhx9np1EmXIxz7gi+qydu8FHMGaL9Ds87s7iYHKYXLjker2zk0F4odhdOHGOR4+iPSsxpn3t3Ug+GShCQA2/eqHPnHqCq9ggbdK70v5AyLk1Pv5jpsbUmiIyEe+FjSogkdINK3Arj3x1hKgoj75kwmgV6uEU7eYvF9QVG8hKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIg2zVG4lcRWL0nIi3AhIqKTQoJBf5ikjeVnGdnab7k=;
 b=hStMsWMdI1uyys3t/4yiui0YGHJKQ7RhtNTZjXCptNkeUo3F74wqcVbzCUthcgocgKxmy13Kd6zSuRmtkstc1xjQI3H/FtZkxxW747Imyo/40efTcfkcMTwDZVi9nyXbKCEcMCUjA6rf9hvBfQet1k3TP79K/kyD37BUKw+XCBSPV7eeKHj3hsVT5Rga3wbKMHctFx1wmXUIzopiFkhOGeH3jGee4WTqTsSGV7/u3dg2ekI6xf8+TnMB2SGkh00sXDgIWZnql9qUCHoywriEzZhVauJ6OaUCahvV/4KI9LCHsadVgd30YU7p+ebXkGhvNEln1x0uR1XTwTlMWMfzbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIg2zVG4lcRWL0nIi3AhIqKTQoJBf5ikjeVnGdnab7k=;
 b=M7jMJsHojGQKKYIHh+KEgjbV6+ni9PxQ+UOkxvjeAuTgoAYEyp1DB7riqsy0G0Q/o0B0w367j1ntMcBKdly5HRQ/lpme/xiqu2cDk4H3BvY6UnIf6Hy5Jwg6jjn4ezmpkkykK6xrTn+KP1qbnIj0WgY8ggTmEa40qbmQbUlgzwJu9fOW5gJnBEzw9s86SfFo+YjS/QchnCB8gc8/qGbXHHUHdx2eIfxIT/sadGN+tL/T4ts3XSVb1CvRHwLAIoJ9EBDchsyvx11+spcZVtGkxBuIt6uYbG5GbiQRNR1eRGafwQKoVwTYzw+iPsj/mSwB1kIDyCvtUKpohXDdyKrQNw==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEYPR06MB6335.apcprd06.prod.outlook.com (2603:1096:101:13c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.15; Wed, 30 Oct 2024 02:31:49 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 02:31:49 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Bin Meng
 <bmeng.cn@gmail.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:SD (Secure
 Card)" <qemu-block@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>
Subject: RE: [PATCH v1 7/8] hw/arm/aspeed: Invert sdhci write protected pin
 for AST2600 and AST2500 EVBs
Thread-Topic: [PATCH v1 7/8] hw/arm/aspeed: Invert sdhci write protected pin
 for AST2600 and AST2500 EVBs
Thread-Index: AQHbKeNrXQX2oYiH5U6yrCsbg24cbrKebz0AgAAkQvA=
Date: Wed, 30 Oct 2024 02:31:49 +0000
Message-ID: <SI2PR06MB50414C9ED2B489859B1ECEB3FC542@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
 <20241029091729.3317512-8-jamin_lin@aspeedtech.com>
 <c834ae3efff1cd5f51499b5852a49e5332b796a1.camel@codeconstruct.com.au>
In-Reply-To: <c834ae3efff1cd5f51499b5852a49e5332b796a1.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEYPR06MB6335:EE_
x-ms-office365-filtering-correlation-id: 7f801a8d-f7d3-41c6-a6ab-08dcf88b01ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?RzBQc3lhQ3ZzR1MrVG1oRTlXNHRVY0tjUzhtelBsOUNOb0NkeDFiUlcyUjYw?=
 =?utf-8?B?TFFTY3FMSnMyL3RKcHJkMWpnT1doZGkyMkErUzE2VElOMVhQakhSOG9Kallk?=
 =?utf-8?B?bjNudE11NFlwT3c2eXRqazV6UGVnd21Fc3U4YnVaUi9rMTZzcjJiRUdwdEJ0?=
 =?utf-8?B?VkNPNTlJb2UzTzNNT1B1MDVVaFRNWkd0Ykt0dmNhSFFLSkkwdm44SExsYUY1?=
 =?utf-8?B?Rzh3bktlNm85dEZ6ek93Vk52MXNRaUtpRGlSYnZucEhUaERFMWV1TlQ2UHQ3?=
 =?utf-8?B?VFNjTkpYM2h3bG56akRPMU50UjJ0S3pzalZ1ZElMZEl6QWZSeHBpRCsybW5S?=
 =?utf-8?B?Qzd1SW0zNEFjYkhVUnpYdmo3QXV4ZHVxVWV6SjlXZE5sTi9NblpGWHdWWUtN?=
 =?utf-8?B?bXhPOUkwZTh0RFhiL2dmbkY2RGp4MEQwOGRWaGpXRUFwa1lrQzdWVmlCOVUy?=
 =?utf-8?B?QUJ2bDhGcGRiZHZqZlYza0JrSWNZL0FTbVhuT0FtYnBNV1BTUjFiOWNSWkR3?=
 =?utf-8?B?V2dDYkpwSWZ1c004Q3g1UGVwUHBVV3FhdlpXTHJwVEp2c2RTMjJkSHN4OGoy?=
 =?utf-8?B?dnd6UkNqaWlsYlU2SFNtNVlpT0tIRnN4c3ZrbjdnOXArTjNvVFh4SEpsK0tm?=
 =?utf-8?B?ZURVclI5ZkkyVWJmTjh5clRTL3JUT1ZhMndaeUZ3a3p2SWtuYlBaYlZBYVlQ?=
 =?utf-8?B?RTlYQ2QxNjFtYXNPMDFWQzJVTXV0VTUxZmY1Y0lDb2M0Q09RR1AwK1FoMkd6?=
 =?utf-8?B?ZW5HeHZhTUwzbEZNRXhNSEtwWmFBRGFFNEUyYW5QUTFFQTk3NkJRUExzV0ln?=
 =?utf-8?B?WmJHbTQzckpPY0FLRmZXejZCODEyTE9VL3N5Q05aaXJ6ZHA2eTQwRUVGeXox?=
 =?utf-8?B?TjFsSWhPVndTcWt5N21SS3RHQXFKZ1BLMUN1T2t5U3BHNmtObmNJcVZXZ2Fk?=
 =?utf-8?B?SjJycUJUUjJjWlQ0MU8wVHZjQm5mNXpqcDV3dHAxOG41ZHVCdklIdExWZXRx?=
 =?utf-8?B?NTJVUEJYSFB4bkRYR2NSSGxBVnBEdndiam5JNkJWdkRLcktlRG9qNkFqRDA5?=
 =?utf-8?B?UldKWXpHbWRtWHpVajlDZktvMTJDR1FPd2ZkQkV1aUtsQzdwL3orYXd4VjQy?=
 =?utf-8?B?VG1PU1U1RU1iSlNGTVluTTQ1a1dsNGc4L2FzejVCRW1TU3NQOFp3ZEZObHNI?=
 =?utf-8?B?TDhCS1VBV2JSbkYzMWpyQWUyZnBQMlFCQ3dwNDY5MFFOOUZVT1V4WDZQWC9Y?=
 =?utf-8?B?SENCdzlqUDdmVEt0akNNbDYrNE5lelBhQ010dGdHOVdvSjV5alNzWUkwUHNt?=
 =?utf-8?B?MWRJTVFzTDJvQlpBTHAwVnFHbENOMkJ0Y2l1dStSWi9TOUdCRG9WQXhZY3hO?=
 =?utf-8?B?NCt2aG1UR0FwYmV5MWVzYnRWdmNEZUJSZFNMWXR2MUhJNE5KUTUxT3hPVjJw?=
 =?utf-8?B?YXFzM29QSW91SFgzWTJYcTBoKzEvck0xWVg3OUJaaDVQcGZDN0VldXRpWXFN?=
 =?utf-8?B?Nnd1anQxV0lRU3BSTjBoVldBQWpjT0RNdjVOOE5xcGZqQmhHV00xZ2ZyaXNR?=
 =?utf-8?B?VnFQeDdQaG9JYVU2UzJLdWs2Z3o0R2lNaW9Jejd5TmpKYXUzMSs0NXl4T2xn?=
 =?utf-8?B?UnpJSUNlaDZvTHI0eWx1eTgxZWkzZlVZSWZDdk5sNlI0M0FRbklvWi9mNzRm?=
 =?utf-8?B?VzYybjFzL2lDNWxtbGkvL1owNi9qZEZyM1JwL3ZiSzkwK2VITlh0bXdvOVBM?=
 =?utf-8?B?aTNxSFhwdm5yemgzZktsZEQzRUJ4c3VOVkpOamRxS3FJRUxqR1RhbHZvSXdt?=
 =?utf-8?B?UDdrRUxHSzlDcW96V1FDSG04YmZwYlNZbmd1UWpPZ0U2cGI4SmdWYzZPYW5I?=
 =?utf-8?Q?7m6hnzulBDBLJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SI2PR06MB5041.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmFNL0xzTmN1NFVQNVhZL2tKRVczUUZCNGtzK2tsazBSUjE2cllDdmZsMmJ6?=
 =?utf-8?B?MHVoRDNaVHpKYXA0WENLeXNNd043QzZtYzh5cWxHcXpaejY2d0dlamJwRTNX?=
 =?utf-8?B?dDdGaHBDbzI3UHZ2WFRMTWJWNHFYamtINzRvZnl1M056VGNqdmlaNDRiSkhT?=
 =?utf-8?B?N01HOU5Yam5OdGpkV3U3Sm9iVzdXNTdiZ2tlUzJMV1h6VzliRGFyNnZSb3hW?=
 =?utf-8?B?dk0yNDU2RzFqQUdmWWpQQmZsV3lEaEFrZ2xoaU1MMzBpMmhRZ0R1TEtJNWhn?=
 =?utf-8?B?S0tlVzRLdjIrQXY1T1pzTGk4UlVrMGJiZjJiY2Vvb29NeWFBc2hJcDJ2RjRP?=
 =?utf-8?B?czArNklwempuODlsQzJZbnBUNWFwS01GWmw5alpBZ1hiL0E5cEh5SDROS25H?=
 =?utf-8?B?bEJKUlBqREM5NG91VmVXK3grYWFEVHJ2WWJSZ0I3YTNoWjZ5SC94OWlZdmhm?=
 =?utf-8?B?ZzZCS3h0WlFGTHl5YSs3VHVJUk9rV1UxT0wyb3JBd3E0dkc4T3A2RE53OEdR?=
 =?utf-8?B?aVdzZ2NHWlIxTmlMb01kdVZqa3NkNXlXVnIzMGZJQlFaREhmWW9EVGh4YkJW?=
 =?utf-8?B?Yk85c1RYTFkzOEZqWVRYREh3MHpsanJSNkdObjRMWEhzaXppc2gwd2t0KzJp?=
 =?utf-8?B?S0gwbzBjMTUvZXVJOTVTdVlWZGxFM2cweWVzNW1XamtWeDNaUmZORVY4elRC?=
 =?utf-8?B?SFVaQVQ0TmNBd2lqcGU2M0FTWWdVbXNlU0NpeFluTlB2SWlSRXNPTzV1STNs?=
 =?utf-8?B?M2ZtbzBJcHlybnZOU0hJTFhuS0xMRm5zT01SdXpiYUx3ejFORUJ3c29TVDFs?=
 =?utf-8?B?dm5QUFRETHJ0L2JKdXJ4aDVxRFJkaENEWmRUS0VWWkhhSEdiSmdVdGhoMWJh?=
 =?utf-8?B?YTJiNldESjh2cDZRbjlZQzZrSFYvWURhUGlKMFBWMXkvK0dRcnVDNHpvclQx?=
 =?utf-8?B?dE9hSmZvSXFYN1VRek1qMEVQcHZuV1lqckIxbGZSZFkrNGxGMURRZ1dwTS9U?=
 =?utf-8?B?Uy9zU3pseE9kbk9CbjJoWjl4VGdFdTR5a2d1NTdXc0xqSHFGZHNoOXdZaFRy?=
 =?utf-8?B?a0E3RUZndGl4Z1hiOUthR3FlMTdybjFTN0lKL2gwamh6dnZPWEJNdmI2ZjlK?=
 =?utf-8?B?ZnFCVWNNc084M003VkQyOW5NQ25pLzJHdEdmUWVSL3JFTWtQM0dDN3Btblk5?=
 =?utf-8?B?ZGtoMmtjRFZ4ek5abjBWbm84R05uKysyOWxRelBaL1FjVmdja3BWUXN6b0Ey?=
 =?utf-8?B?dzd4eXlRY28zb0lyVHlDTXo3OWZnaFlGUW52SHZlbkJZTzZWa3VHbDZCTGxP?=
 =?utf-8?B?VEJIODB4a1JkT1oxanJrakEvUVZjcjByYUFmcS9CMVNGMHdQSHFsQWlFOCsw?=
 =?utf-8?B?RnJIZlN4MlI3WU9YSm1nWmJnRXI4d1NYM2tjdkJrb2dFdmhxV2JhL2k4R0F1?=
 =?utf-8?B?aFhiY1NVRHovV3A5WjhxYmh0LzBUeVZuRkRCYVhyQ0xhamRqamRFRm1MQVls?=
 =?utf-8?B?TStIL1k2NXJsMndlVFMxQ1Zsb0pxc09jaTVLS3ltTS9qUmJ3bzQzUkZPa0pt?=
 =?utf-8?B?WWlzMWlYdDBXNE5FRDBHcFVMakFrN1VqSWZEaVM4TVdpMlJLL3Q3Z3M4NFdM?=
 =?utf-8?B?QVRzYVVaTDA4SUxDeks2TTgyU3QwYnVaOXRXZzNGdjRZNmlva294VXllVXEx?=
 =?utf-8?B?OUlSYmprK2NWRG5RR2VRY2FxNXV6aE81anFycWQrdkdoWlkyUHlkK2pyOWIr?=
 =?utf-8?B?eGpsY25qYjYvWWxKbHdqSnk0cVBJT3UvbHVGK0lwQ0lab0J2VXJRaXBNNVpK?=
 =?utf-8?B?MjF2V2ZacXdESmx2NGJiMVU3SHBxeGFxa2Rkb01zQ0M5K1hvN1R5SERlWEZC?=
 =?utf-8?B?dUZtSE5xbE04a1BBTmg5RjlwaHFEc0RHUE1XdTJ2bHEzc2VCUlE3Z0hqSzVE?=
 =?utf-8?B?djg5Q3cvdmJPMDF3eFY5Q0t0YVpVSE44cW5aOUJnSGJLU1M2VFlxT3IzVmhu?=
 =?utf-8?B?TjBDUGpzM0JhRERyYmhBMkQ3VVNNZEloaHFrRmUwdDQ1ZnRVQjQwRCt5NmFR?=
 =?utf-8?B?UGhqb2ZoYTZPMHNZZU5tb25JeGNYRkJKZFRtKzV5U3kvUnkwMUFyK0dpWG9z?=
 =?utf-8?Q?N5VT4BUOtbfrys7vOGMMVAPKX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f801a8d-f7d3-41c6-a6ab-08dcf88b01ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2024 02:31:49.1799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CA4VlsLotQBGZ37xeVmsRz2poLIL4RXB14NbCr0HCTaaSu7DhuW3mmGae7Zv8Fy+wQsNww6I32TAiNs5NWPo4DMZCE8+InGYc940piVj+lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6335
Received-SPF: pass client-ip=2a01:111:f403:c400::2;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=HK3PR03CU002.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-TUID: rBuNeOr5s0Sm

SGkgQW5kcmV3LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgNy84XSBody9hcm0vYXNwZWVk
OiBJbnZlcnQgc2RoY2kgd3JpdGUgcHJvdGVjdGVkIHBpbg0KPiBmb3IgQVNUMjYwMCBhbmQgQVNU
MjUwMCBFVkJzDQo+IA0KPiBPbiBUdWUsIDIwMjQtMTAtMjkgYXQgMTc6MTcgKzA4MDAsIEphbWlu
IExpbiB3cm90ZToNCj4gPiBUaGUgV3JpdGUgUHJvdGVjdCBwaW4gb2YgU0RIQ0kgbW9kZWwgaXMg
ZGVmYXVsdCBhY3RpdmUgbG93IHRvIG1hdGNoDQo+ID4gdGhlIFNESENJIHNwZWMuIFNvLCB3cml0
ZSBlbmFibGUgdGhlIGJpdCAxOSBzaG91bGQgYmUgMSBhbmQgd3JpdGUNCj4gPiBwcm90ZWN0ZWQg
dGhlIGJpdCAxOSBzaG91bGQgYmUgMCBhdCB0aGUgUHJlc2VudCBTdGF0ZSBSZWdpc3RlciAoMHgy
NCkuDQo+ID4NCj4gPiBBY2NvcmRpbmcgdG8gdGhlIGRlc2lnbiBvZiBBU1QyNTAwIGFuZCBBU1Qy
NjAwIEVWQnMsIHRoZSBXcml0ZQ0KPiA+IFByb3RlY3RlZCBwaW4gaXMgYWN0aXZlIGhpZ2ggYnkg
ZGVmYXVsdC4gVG8gc3VwcG9ydCBpdCwgaW50cm9kdWNlcyBhDQo+ID4gbmV3IHNkaGNpX3dwX2lu
dmVydCBwcm9wZXJ0eSBpbiBBU1BFRUQgTUFDSElORSBzdGF0ZSBhbmQgc2V0IGl0IHRydWUNCj4g
PiBmb3IgQVNUMjUwMCBhbmQNCj4gPiBBU1QyNjAwIEVWQnMNCj4gPiBhbmQgc2V0ICJ3cF9pbnZl
cnQiIHByb3BlcnR5IHRydWUgb2Ygc2RoY2ktZ2VuZXJpYyBtb2RlbC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0K
PiA+IMKgaHcvYXJtL2FzcGVlZC5jwqDCoMKgwqDCoMKgwqDCoCB8IDggKysrKysrKysNCj4gPiDC
oGluY2x1ZGUvaHcvYXJtL2FzcGVlZC5oIHwgMSArDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWQuYyBiL2h3
L2FybS9hc3BlZWQuYyBpbmRleA0KPiA+IGI0YjFjZTllZmIuLjA0Njg2MDJkOTUgMTAwNjQ0DQo+
ID4gLS0tIGEvaHcvYXJtL2FzcGVlZC5jDQo+ID4gKysrIGIvaHcvYXJtL2FzcGVlZC5jDQo+ID4g
QEAgLTQwMyw2ICs0MDMsMTIgQEAgc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfaW5pdChNYWNo
aW5lU3RhdGUNCj4gPiAqbWFjaGluZSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9CSkVDVChnZXRfc3lzdGVtX21lbW9yeSgN
Cj4gKSksDQo+ID4gJmVycm9yX2Fib3J0KTsNCj4gPiDCoMKgwqDCoCBvYmplY3RfcHJvcGVydHlf
c2V0X2xpbmsoT0JKRUNUKGJtYy0+c29jKSwgImRyYW0iLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT0JKRUNUKG1hY2hpbmUt
PnJhbSksDQo+ICZlcnJvcl9hYm9ydCk7DQo+ID4gK8KgwqDCoCBpZiAoYW1jLT5zZGhjaV93cF9p
bnZlcnQpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGJtYy0+c29jLT5z
ZGhjaS5udW1fc2xvdHM7IGkrKykgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9iamVj
dF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJmJtYy0+c29jLQ0KPiA+ID5zZGhjaS5zbG90c1tp
XSksDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAid3AtaW52ZXJ0IiwgdHJ1ZSwNCj4gPiAmZXJyb3Jf
YWJvcnQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ID4gK8KgwqDCoCB9DQo+ID4gwqDCoMKg
wqAgaWYgKG1hY2hpbmUtPmtlcm5lbF9maWxlbmFtZSkgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAg
LyoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgKiBXaGVuIGJvb3Rpbmcgd2l0aCBhIC1rZXJuZWwg
Y29tbWFuZCBsaW5lIHRoZXJlIGlzIG5vIHUtDQo+ID4gYm9vdCBAQCAtMTMwOCw2ICsxMzE0LDcg
QEAgc3RhdGljIHZvaWQNCj4gPiBhc3BlZWRfbWFjaGluZV9hc3QyNTAwX2V2Yl9jbGFzc19pbml0
KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4gPiDCoMKgwqDCoCBhbWMtPmZtY19tb2Rl
bCA9ICJteDI1bDI1NjM1ZSI7DQo+ID4gwqDCoMKgwqAgYW1jLT5zcGlfbW9kZWwgPSAibXgyNWwy
NTYzNWYiOw0KPiA+IMKgwqDCoMKgIGFtYy0+bnVtX2NzwqDCoMKgID0gMTsNCj4gPiArwqDCoMKg
IGFtYy0+c2RoY2lfd3BfaW52ZXJ0ID0gdHJ1ZTsNCj4gPiDCoMKgwqDCoCBhbWMtPmkyY19pbml0
wqAgPSBhc3QyNTAwX2V2Yl9pMmNfaW5pdDsNCj4gPiDCoMKgwqDCoCBtYy0+ZGVmYXVsdF9yYW1f
c2l6ZcKgwqDCoMKgwqDCoCA9IDUxMiAqIE1pQjsNCj4gPiDCoMKgwqDCoCBhc3BlZWRfbWFjaGlu
ZV9jbGFzc19pbml0X2NwdXNfZGVmYXVsdHMobWMpOw0KPiA+IEBAIC0xNDA5LDYgKzE0MTYsNyBA
QCBzdGF0aWMgdm9pZA0KPiA+IGFzcGVlZF9tYWNoaW5lX2FzdDI2MDBfZXZiX2NsYXNzX2luaXQo
T2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPiA+IMKgwqDCoMKgIGFtYy0+bnVtX2NzwqDC
oMKgID0gMTsNCj4gPiDCoMKgwqDCoCBhbWMtPm1hY3NfbWFzayA9IEFTUEVFRF9NQUMwX09OIHwg
QVNQRUVEX01BQzFfT04gfA0KPiBBU1BFRURfTUFDMl9PTg0KPiA+IHwNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNQRUVEX01BQzNfT047DQo+ID4gK8Kg
wqDCoCBhbWMtPnNkaGNpX3dwX2ludmVydCA9IHRydWU7DQo+ID4gwqDCoMKgwqAgYW1jLT5pMmNf
aW5pdMKgID0gYXN0MjYwMF9ldmJfaTJjX2luaXQ7DQo+ID4gwqDCoMKgwqAgbWMtPmRlZmF1bHRf
cmFtX3NpemUgPSAxICogR2lCOw0KPiA+IMKgwqDCoMKgIGFzcGVlZF9tYWNoaW5lX2NsYXNzX2lu
aXRfY3B1c19kZWZhdWx0cyhtYyk7DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvYXJtL2Fz
cGVlZC5oIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkLmggaW5kZXgNCj4gPiBjYmVhY2IyMTRjLi44
NzliZGI5NmVlIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvaHcvYXJtL2FzcGVlZC5oDQo+ID4g
KysrIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkLmgNCj4gPiBAQCAtMzksNiArMzksNyBAQCBzdHJ1
Y3QgQXNwZWVkTWFjaGluZUNsYXNzIHsNCj4gPiDCoMKgwqDCoCB1aW50MzJfdCBtYWNzX21hc2s7
DQo+ID4gwqDCoMKgwqAgdm9pZCAoKmkyY19pbml0KShBc3BlZWRNYWNoaW5lU3RhdGUgKmJtYyk7
DQo+ID4gwqDCoMKgwqAgdWludDMyX3QgdWFydF9kZWZhdWx0Ow0KPiA+ICvCoMKgwqAgYm9vbCBz
ZGhjaV93cF9pbnZlcnQ7DQo+IA0KPiBPdGhlciB0aGFuIGFsc28gY2FsbGluZyB0aGlzIGBzZGhj
aV93cF9pbnZlcnRlZGAgdG8gbWF0Y2ggbXkgY29tbWVudCBvbiB0aGUNCj4gZWFybGllciBwYXRj
aCBhYm91dCB0aGUgbW9kZWwgcHJvcGVydHkgYW5kIGRldmljZXRyZWUgYmluZGluZ3MsDQo+IA0K
VGhhbmtzIGZvciByZXZpZXcgYW5kIHN1Z2dlc3Rpb24uDQpXaWxsIHVwZGF0ZSBpdCB0byAic2Ro
Y2lfd3BfaW52ZXJ0ZWQiDQoNCkphbWluDQo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8
YW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0K
