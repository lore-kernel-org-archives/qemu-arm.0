Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp36695njb;
        Mon, 3 Feb 2025 22:51:30 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCV0hk8HP+o5EKuA/EIme8zBwp5oJRACnBk/a3BLQbcof2v7F8YQjr7f7dIvb9GCXIQOq205dsuiqCXAOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG6egC+xvWJhEL/T/puV5Keue4u2M9Pg/uURuttW5wlSuvFBaJLK7ARpYkNGNb3TcDCGUCQ
X-Received: by 2002:a05:620a:1920:b0:7b6:dd89:d86f with SMTP id af79cd13be357-7c02ec832c5mr371044785a.24.1738651889959;
        Mon, 03 Feb 2025 22:51:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738651889; cv=pass;
        d=google.com; s=arc-20240605;
        b=DBSUL/GmP7dlIvRN6T87kSeAW8XBii0/EUvV24H7P7wqglLOnP/nTPbaX3fIHdXbjT
         +APS/T9JC7fqYOJL86OC+biy/yWAq9eJ7DHoCPUEflXR67/6XH3dAgZ/tBnQ3lVHpuLw
         RY6hnZkWyWn4IMtxsOnfOp+0coaj6Ilc9PTRNEqxB/YmN27JXqY/KjSiIZCCC3/ARvaB
         IQR1UW2HEpZHnrsdfB5kQVzIaFMwjpyWRfSA1WV8+eMNelaEGjYBsXzCN9PKgYcXgzNt
         VFGlhp/RT4u/xu1Exy6quq4gv5HwzQ4U/1a/SWrkScJ4OYWDPK3/4jmifTmU9+yGklPW
         WL5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=Z+pTp2MVwTPRV8Y7qwnhBld60PBxN2se37aL5obBgTk=;
        fh=Di+GWwPrN92aEJsOIkbgJfzXV8JTtAd2+TRiI5c9dNM=;
        b=AntZx0NBFnoSVtHalN0QK59qG2X6RT1ow7T/UaIiIj/gYgkF+C3V3QqDQUS4bb2oBl
         K0CzqquF4wNB0xJE36S1ur1TvbJUuNiELTpFi/Hjx3IKmTC256UohktCdKdPeUXPSLiD
         CFkR+J36fEotosrv+Xj3p+S8iJm9ub6+xnJbJ+4Tpz6nj2N5muXbjsCzT1H7EIiMrTYs
         wEKsIuZy3WQpZthcWYueP5nUVy4i5y3ykNm0n1tpUK9Q6r2wQnk2RAVi7W3JQ1M6I4xu
         aoIxx6EPpeImKh0YnGk8gH6rZy4vHGIEBVHTNbVsDqFeW+ZqZA42H8SLxu7KP0MhJPCE
         +5vQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=rVLKmSys;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db627f4si202856385a.157.2025.02.03.22.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2025 22:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=rVLKmSys;
       arc=pass (i=1 spf=pass spfdomain=aspeedtech.com dkim=pass dkdomain=aspeedtech.com dmarc=pass fromdomain=aspeedtech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=aspeedtech.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfCmB-0007Sj-21; Tue, 04 Feb 2025 01:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfCm6-0007ST-Kk; Tue, 04 Feb 2025 01:51:11 -0500
Received: from mail-tyzapc01on20719.outbound.protection.outlook.com
 ([2a01:111:f403:2011::719]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfCm1-0005F1-6G; Tue, 04 Feb 2025 01:51:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTNKm8njo6vwLtEX3dFy+CziXC954WTrFd/tw8zWsUv0e2jLK7Y+74dq+IsGuBNpHrVBHwLvDqh9p/44hxIAPdFQntb5IlmF4B3oAkktn0s4Yor72R52ZJPUIQiPwm17Ujxcdd8XAiXJtGDEWXlieTjOOq10jSKvDYe0vdhNIdBEutoZWBt+TaDZnKuvOcdfcGA6KN85XBbBN+aczvIuFNyp/fU4WYM7RxslMw54tnIWdR4YVeQUfHceEcg+8myub6vkpDXBKguU2+DvprN9WdcIDmV9Qv8EMQMXYklyaXvQMs83W/os3hh+G9z/qeOasN9BrPd1n+F7RCGhRFvvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+pTp2MVwTPRV8Y7qwnhBld60PBxN2se37aL5obBgTk=;
 b=JJqClXKZDenhw2lIWsdGr+dn3G49IY8HU4S5aE4zGuIFZXUxypSCP81RjUIwHDqrtSz9X8BKEslWg4JUTt+rJJZ2a07L0YWWpvqRumZYCG5h0hMGt6CcYb3T1+84BYkQ185fVHQfgJP8yB4Z32ca8UHFvysLwfAAOinDmsbIODWpsyb9JYWwN9/dxpKEo0ElhetsOiXAyzMfxF+RTdx/zSRmqCQ6m0e+9Jor0Xr04bVt7Kw8vry/r8HNlBENsFb4mG9379jSJXkpFVmjZtVgH1MHE6s5ar9g+WeE+3kQ9vcEQKJ+7JI2I/jAD199Rq9goCW0/lQdCkIJwbJfUwfWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+pTp2MVwTPRV8Y7qwnhBld60PBxN2se37aL5obBgTk=;
 b=rVLKmSys6Dezx3suP1W/rd0MaxcBVWADPTIfQH0ZPjtMCRde1uicAKZ7Gt+M2zkVXWdFkLFJk8kS+cHQb5/OG+rw9G4soAU2/Mbw0gd7VVwCu6tfYjoCMfi2fBaP0SvhRj7/lqBg/9SaiQd2pVGTxgC+MAVPN72WjaPx7wFUwY6mC4ScsOGJUO6jmYzbE7T+o75huXCsAAtXxQlh5lyx5Scy6O35c4uy4vq9BKe18iE4A2yfMyKl8TdtLD/p3WnO+OglFzMVGb9105UdUensHcXXQESFjqhcoYfrkpmHYa8S/IudAWohxAvY1zz/W4kTmS6pwXgClnj1TOLjbx0b/Q==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TYZPR06MB6828.apcprd06.prod.outlook.com (2603:1096:405:1d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.8; Tue, 4 Feb 2025 06:50:56 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%5]) with mapi id 15.20.8422.005; Tue, 4 Feb 2025
 06:50:55 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang
 <yunlin.tang@aspeedtech.com>
Subject: RE: [PATCH v1 01/18] hw/intc/aspeed: Rename INTC to INTC0
Thread-Topic: [PATCH v1 01/18] hw/intc/aspeed: Rename INTC to INTC0
Thread-Index: AQHba9K4YfoMx8rChEaxoKZIUrwsxrMuB+MAgACswYCACBWzUA==
Date: Tue, 4 Feb 2025 06:50:55 +0000
Message-ID: <SI2PR06MB504109C5631AD551E2542802FCF42@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <20250121070424.2465942-2-jamin_lin@aspeedtech.com>
 <2d9247ab-34dd-4dde-a9c0-c04c2d8a1a18@kaod.org>
 <d9575d2cec122e41e11d84667f4d7cc63848b3ce.camel@codeconstruct.com.au>
In-Reply-To: <d9575d2cec122e41e11d84667f4d7cc63848b3ce.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TYZPR06MB6828:EE_
x-ms-office365-filtering-correlation-id: b39602eb-3e89-4eb3-d375-08dd44e84627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aDdyenRvOFo1UDBNanFEbVZPRWF3RzdwQTRsZUxqMnZzU0lZN0paVFNaRHZP?=
 =?utf-8?B?a1lVSCtjSm1OSW5jVHc3K3M5R0I3OENMdHR1ZWovNHlhMDlYYjFZVzJra0RV?=
 =?utf-8?B?TFJqNXlrKzVDL0ZIL0NhcHRIYXdKYm5iVElGZEg3ZWpUU0hpSFhDTEk0WlBR?=
 =?utf-8?B?LzVDUDgwWUo4Q1daRGdpZDVzQ3VBajlQNy9Dekh4RVl0Um1HNzlpSWxvem51?=
 =?utf-8?B?VXBLMmMrNG8vdlNuS0cxbGVleE9FMVJCaHJlU2lnVEp5R3FrekxzbXk2QXlQ?=
 =?utf-8?B?cU9WaytDR3lzY3pndncvbmNLK1JScXJhWFJlc21QMXJHaXVlcWhXTXBzWUEw?=
 =?utf-8?B?aXo5WlNGSklEMkhORXlRVUFUS200dGRmaWZBcWlVNGVONEQ5ZmdHMnQydWti?=
 =?utf-8?B?MFJyVjJaK1lIZDRBTGU0SkZURUdOUlg1cExudHlNbDhia2hjZmx5YjZVYlR4?=
 =?utf-8?B?dVBBdGVKMXE4N0lmTjVrUlZJZFUycml3S3I2OUc0N0Y3K1h1MVIva2ErZFJ2?=
 =?utf-8?B?dTlWcGZSeE9zb1FuZUgwWTMwYzQxTFRYaGZCNTZLR0VYM0pIVGp4aHlEYkVn?=
 =?utf-8?B?VVlxakM0WlhUdW5RTnhKQTcrUDBXallod3pNT2d6N1BZUTBDYXBveUlMYlYv?=
 =?utf-8?B?dGIzVGVkZk00YktPU1BTMTdOTnpUZ2o0ZlljeS80WEJrT09waFprVkNHL0lp?=
 =?utf-8?B?SVVQY1k3b2Nsb0JUV2xBZU12N2czcHM4amx0SCtTZmdTZTZRMC8xMm1xYTVj?=
 =?utf-8?B?UE1Wc3BybW9CSGFRRXpLRmZFYVppT2ErdUFwaFFrSGxGa0VkNk5XQXZqandM?=
 =?utf-8?B?ak1aMm55VHpXTEt0WXVzUzZCL2l0TlVGTUFBRmd2dm5SMlYwblhDblFQTHZI?=
 =?utf-8?B?ZENCczMzT0s3YnNSWDBlQTFVZ29yeEU3YUtYbHRaTCtrRml0dTRVRmVYL1du?=
 =?utf-8?B?S3JsQTZPaVJwQ2ErUlV4OHZ2UEFmQnRKZDZlUGx1Tm5wdXhsSUIzK3BaRzFX?=
 =?utf-8?B?RDEyMUFVNWFzZEN1YTVHNEFDOUF3VzZod0gyako2ZndkWWthNmxPQngwM0tK?=
 =?utf-8?B?VkNOakhha3VVZ2dlbTJWSzhuVlFLdWR2VjZnKzZ1ZmpRTXkrWHVSaTV0Z3R0?=
 =?utf-8?B?Q0hDZHBORE00OFVqQlgxYlJnbjYwWllOenpTeEJBU0NreDhOTithenZGVTBH?=
 =?utf-8?B?SnBrRzJYUENVblRoWURpcE5vbSsvNkhpajVXWVBZM2NLbVAwVVM0N1M3bERU?=
 =?utf-8?B?NkJFTTlqOHNrcGhQeUl6WEYzMVNIOUlHWTh0V1hxWS8xZ0hZVkZ2SExhT0F6?=
 =?utf-8?B?WVYvdlFOWFRTNHVGNTJVaXYzRjJzclh3SkcrUXJJOHNMc0U2eXovVGpDSTUx?=
 =?utf-8?B?dlpBajhIWGd3YVUyM1RYaGk5ZFMvZjlNUVVjRk1xTWk2ZDR4cDF5eHVaYVZi?=
 =?utf-8?B?QU42bWRKV0NtcEMxeUozUTlDdk1lWWhUWFdLbThsTWYweHVSdzNUbTVRR2hL?=
 =?utf-8?B?NGpVenFjL3htZjNXeFdjUUd3MkJpVXB5UEpxR050aW1YOG5DUHZtY1NyQ2xy?=
 =?utf-8?B?MWZxam5wcFlxcmoydkl4d2lXRko3WG0zYXNjTUhxVkJISTU4cER1SW5BaXYz?=
 =?utf-8?B?U3haN0JTU1pDYzVKUmRkb3pLNXdwbThNcmNQeURHZTltRGlyUnQwd1dieXND?=
 =?utf-8?B?aXdTUzNmMHJDK3VGSS9oYURINGwvMGVJSFpZNldod21XQ3hhVC9ra1VTVU56?=
 =?utf-8?B?NnlTeXI4MDNVcUFMNFpoSFFOaXBEajVsTHdMRTJ2SnRTV052R0pQM081SGFD?=
 =?utf-8?B?SmZDc2JiRzVYMUdjUUl1SWNMR2hPWFBqNURnQ2hLY1V0RXJseUxMZ2E0R0l2?=
 =?utf-8?B?WkNsbmdMQ2w4RFl0ZHRmK3JHWVJMQ0dWSCtqTTVhZ3NMR3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SI2PR06MB5041.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmJ5c3VFeU9GWnBwandFbXJmSFZ0TGdoZ0xXY29idFliMlRDL0pTN0NOZkY4?=
 =?utf-8?B?Wm1WQUU0ald6VG14WVplMXh4YnA0QSt5ZllCRFA2L3lVWWlhWXl2QlgramNq?=
 =?utf-8?B?QzEwWWtadlpUM3dKeURIVk1CRzVnUHNyK2VZUzlsemlHc2FnS2JGd0JRZG0z?=
 =?utf-8?B?T2p2Zy9QamtqQUtOTmFTMVpuWGdaUC8yWmtiaEJlUVJBRUVmdVY0WVRoVkdl?=
 =?utf-8?B?M29iOGcyTXdvbVpPYXgzbXlVMHhESE5yV1pHekM0ZXh5VlhjV0xVdGVxRnla?=
 =?utf-8?B?bC9LWDAzaDdOdWt1Qm81eEF2dEVIMkVYNlpRVnZOZHBHWFU5NDBweS9nanU2?=
 =?utf-8?B?Mjc2SUVlZXRMRkJESjNlRFdjdTd1cm5yZ1hMdUF3R3pGOExWbmdCU1ZNdTVS?=
 =?utf-8?B?MnZZSFc2SDRCaG13S0lwTmVLTXZVNzgxWjBRKzZiTTJQU3ZwdVB5enlCV1hW?=
 =?utf-8?B?NlIxakJ1aVVSd2FHRElyWkZZeTZYRWJ3eC90Q3VGUEh0U1ZLZUJkU3VySXpo?=
 =?utf-8?B?dUl6ZlVidFZkM3pHRjFlK2NWWGV3a1gydHlINEw3MFBjSnZvZUJ5VXg5clZp?=
 =?utf-8?B?dWl5ZVJCSmVObS83SFN4UTJmL3NVbGU2U0tUWVFKZm9NR3A4QVNzN3gvOTB0?=
 =?utf-8?B?MVJyMFV4NnVtVTRLa1JOZTBmbVkzY05wdEozYm41b0gwOThLakwyVThKWTly?=
 =?utf-8?B?bU53NlJ0Y0NOZFlBOEpabU5ZNk1lMDRBYzl4cFVTak5KZ2duWktxYTRFOU1Y?=
 =?utf-8?B?L3BrdU4yVHVvNkV5RWR5NzNWSVdmRC8zMWpvamExZG1ybHdXWXplMmtKengx?=
 =?utf-8?B?N3VlMG53aUIrbTBqN1NkUk0zdTA2Wk9VbE9Ib1NjbnozcXArV1VXMm1obHRW?=
 =?utf-8?B?S0tZcWsybEF5S21wVGNOMVBwSDBjRTZXTUYxMnNKNC9MUzlxdlRzcW1yN2NK?=
 =?utf-8?B?WVRMZGJiYnA1WU1EYUxGd0RPM3p6WkZBK2pLYXhqVnRQUk9CbFBDRHZZSmRI?=
 =?utf-8?B?RGpVZXZBdlZaK1IyZVJPL3d5MTBTb1RYdFJjRjA1T1U2cGlodXRJNENDNVlu?=
 =?utf-8?B?R0k4elV6dFRGVnNwbzJRa1BlMmYrVVNUdTV4NThWaVp2K3RKRjdKYk5ucnc2?=
 =?utf-8?B?TXYrZjg2MUFXdEN3R210RHVVN2tCWXkyb0dRdUJyZXZWZThSdVoyampvK25Z?=
 =?utf-8?B?NHhjRGE1SXdiUDk1aUZMZk1NazRtYzVtSDI4KzNhaUtGa3NjZGgyc2Nwc0hi?=
 =?utf-8?B?cFFIMXIwbUhlRWovbHFMTkhHZlh3VXc3Z0psMXV3S1NvVWJnS2t6QkJSR3BW?=
 =?utf-8?B?L3A5ZTdZdGU4N0ZZMHJVU3Mvb292OGEra29ESkFXWnJDeXN0ZkhPa2o0OTkw?=
 =?utf-8?B?WUVoSDBMdG0xWDk4RVRRSEdyZmMzaEdyaFp6TndNeThpSG5weVBsOXNpejMx?=
 =?utf-8?B?ZHhsU2pSQnNoc2grN0FaTTN6UThJRWYvV091NGd5Slh5bFdYdzJYTUlrUmRp?=
 =?utf-8?B?TWNYcG1jYW5RRGx6b1lWdmNIaC85L01JWGgwRFk0dzJoY2czb3pkWlVJdU96?=
 =?utf-8?B?YzZ1RDhEbWpuMjZjT1FkdGVOZllwYXcycEJ2S3VFa2ZpUDFqOG9pUGFid2ZI?=
 =?utf-8?B?clJvWEdQUkVjak0zdUtpMnVqMW1CUFBEMldtaHhTKzZuTFkyNlJxckhQM3dU?=
 =?utf-8?B?UG15YzZGVjNjSFA4NFdZRXJmQW5kdkpPMHYxcmsrVjZ0T2tPeW5Da3gwWkln?=
 =?utf-8?B?WFBhQWtGMUVyZ21pbUk3Q2VvTGcwUkJ1NTJ5ejd1VklSSFdUbUM1OWpDR1hJ?=
 =?utf-8?B?bldYUnd3N0UrUVFuSDJCdVZ3MnJqRXRiK2pmOTRhNVNlS0l1d250UzQ0NEd4?=
 =?utf-8?B?bGthN09VWUFyVFBpbXhRMWJYazFVcVZ0c3RMb3ZNR2dNZ1NaMTVMYmZSV0Nn?=
 =?utf-8?B?Sk54MmZrZmVzNWNCREQvRWQyTFE4eUdmOXZqckcrSGc1V1Y2TEQxaE8ydFc2?=
 =?utf-8?B?clk4WER1RWpmUHgyYURyT3hhdTRubkIxbHJpZFA2dnBKYTE5SWRqcDJEeVNJ?=
 =?utf-8?B?eE8yN3FVai9PT1czdGRmMExXcnd3WVU5TkdPODViU1FTa0ZvME9jay8vL0ZT?=
 =?utf-8?Q?vx+tnHsZKY8GvC/INpy7jLhmU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39602eb-3e89-4eb3-d375-08dd44e84627
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 06:50:55.6156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilPT9pBGQb9ULRNHBIhU4aikvjw+dhINcnaDkjGEvSGxIofN9ULLHxAF26Aaa+QZab/qFSdMELcQOTW0N0nDja/3EFeJKSsgsljpB4aOGGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6828
Received-SPF: pass client-ip=2a01:111:f403:2011::719;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
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
X-TUID: J+Z8GfFUW8VE

SGkgQ2VkcmljLCBBbmRyZXcNCg0KPiBGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGNvZGVj
b25zdHJ1Y3QuY29tLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAzMCwgMjAyNSAxMToy
MiBBTQ0KPiBUbzogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz47IEphbWluIExpbiA8
amFtaW5fbGluQGFzcGVlZHRlY2guY29tPjsNCj4gUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPjsgU3RldmVuIExlZQ0KPiA8c3RldmVuX2xlZUBhc3BlZWR0ZWNoLmNvbT47
IFRyb3kgTGVlIDxsZWV0cm95QGdtYWlsLmNvbT47IEpvZWwgU3RhbmxleQ0KPiA8am9lbEBqbXMu
aWQuYXU+OyBvcGVuIGxpc3Q6QVNQRUVEIEJNQ3MgPHFlbXUtYXJtQG5vbmdudS5vcmc+OyBvcGVu
DQo+IGxpc3Q6QWxsIHBhdGNoZXMgQ0MgaGVyZSA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBD
YzogVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPjsgWXVubGluIFRhbmcNCj4gPHl1
bmxpbi50YW5nQGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIDAxLzE4
XSBody9pbnRjL2FzcGVlZDogUmVuYW1lIElOVEMgdG8gSU5UQzANCj4gDQo+IE9uIFdlZCwgMjAy
NS0wMS0yOSBhdCAxODowMyArMDEwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+ID4gT24g
MS8yMS8yNSAwODowNCwgSmFtaW4gTGluIHdyb3RlOg0KPiA+ID4gVGhlIGRlc2lnbiBvZiB0aGUg
SU5UQyBoYXMgc2lnbmlmaWNhbnQgY2hhbmdlcyBpbiB0aGUgQVNUMjcwMCBBMS4NCj4gPiA+IElu
IHRoZQ0KPiA+ID4gQVNUMjcwMCBBMCwgdGhlcmUgd2FzIG9uZSBJTlRDIGNvbnRyb2xsZXIsIHdo
ZXJlYXMgaW4gdGhlIEFTVDI3MDANCj4gPiA+IEExLCB0aGVyZSB3ZXJlIHR3byBJTlRDIGNvbnRy
b2xsZXJzOiBJTlRDMCAoQ1BVIERJRSkgYW5kIElOVEMxIChJL08NCj4gPiA+IERJRSkuDQo+ID4g
Pg0KPiA+ID4gVGhlIHByZXZpb3VzIElOVEMgbW9kZWwgb25seSBzdXBwb3J0ZWQgdGhlIEFTVDI3
MDAgQTAgYW5kIHdhcw0KPiA+ID4gaW1wbGVtZW50ZWQgZm9yIHRoZSBJTlRDMCAoQ1BVIERJRSku
IFRvIHN1cHBvcnQgdGhlIGZ1dHVyZSBJTlRDMQ0KPiA+ID4gKEkvTyBESUUpIG1vZGVsLCByZW5h
bWUgSU5UQyB0byBJTlRDMC4NCj4gPg0KPiA+DQo+ID4gV2h5IG5vdCBpbnRyb2R1Y2UgZGVmaW5p
dGlvbnMgd2l0aCBfSU5UQ19JT18gYW5kIGxlYXZlIGFsb25lIHRoZQ0KPiA+IGN1cnJlbnQgaW5z
dGVhZCA/IERvIHdlIGV4cGVjdCB0byBoYXZlIG1vcmUgdGhhbiAyIElOVEMgY29udHJvbGxlcnMg
Pw0KPiA+DQo+IA0KPiBUaGVyZSB3YXMgc2ltaWxhciBkaXNjdXNzaW9uIG9uIHRoZSBkZXZpY2V0
cmVlIGJpbmRpbmdzIGZvciB0aGUgU0NVIGENCj4gd2hpbGUgYmFjazoNCj4gDQo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC85NGVmYzJkNGZmMjgwYTExMmI4NjkxMjRmYzlkN2UzNWFjMDMx
NTk2LmNhbQ0KPiBlbEBjb2RlY29uc3RydWN0LmNvbS5hdS8NCj4gDQo+IFJ5YW4gZGlkbid0IGxp
a2UgZGV2aWF0aW5nIGZyb20gdGhlaXIgaW50ZXJuYWwgZG9jdW1lbnRhdGlvbiA6KA0KPiANCj4g
QW5kcmV3DQoNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQoNCkxhc3QgeWVhciwgVHJv
eSBhbmQgSSBpbXBsZW1lbnRlZCB0aGUgU0NVKENQVSBEaWUpIGFuZCBTQ1VfSU8oSU8gRGllKSBt
b2RlbHMgdG8gc3VwcG9ydCB0aGUgQVNUMjcwMC4NCmh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3Fl
bXUvYmxvYi9tYXN0ZXIvaHcvbWlzYy9hc3BlZWRfc2N1LmMjTDEwNzMgIA0KaHR0cHM6Ly9naXRo
dWIuY29tL3FlbXUvcWVtdS9ibG9iL21hc3Rlci9ody9taXNjL2FzcGVlZF9zY3UuYyNMMTA4MCAN
Cg0KSSBhbSBmaW5lIHdpdGgga2VlcGluZyB0aGUgSU5UQyhDUFUgRGllKSBuYW1pbmcgYW5kIGNy
ZWF0aW5nIGEgbmV3IElOVENfSU8oSU8gRGllKSBtb2RlbCB0byBzdXBwb3J0IHRoZSBBU1QyNzAw
IEExLg0KDQpJIGhhdmUgYSBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIElOVENfSU8gbW9kZWwgaW1w
bGVtZW50YXRpb246DQpDYW4gSSBkZWZpbmUgc2VwYXJhdGUgImludGNfaW9fY2xhc3NfaW5pdCIg
YW5kICJpbnRjaW9fY2xhc3NfcmVhbGl6ZSIgZnVuY3Rpb25zIGZvciBJTlRDX0lPLCBzaW1pbGFy
IHRvIHRoZSBTQ1UvU0NVX0lPIG1vZGVscz8NCklmIHllcywgSSB0aGluayB0aGUgcGF0Y2gg4oCc
MiBTdXBwb3J0IGRpZmZlcmVudCBtZW1vcnkgcmVnaW9uIG9wc+KAnSBjYW4gYmUgb21pdHRlZC4N
CkFkZGl0aW9uYWxseSwgSSBzdWdnZXN0IHRoYXQgYm90aCBJTlRDIGFuZCBJTlRDX0lPIGhhdmUg
dGhlaXIgb3duIE1NSU8gY2FsbGJhY2sgZnVuY3Rpb25zLCBhcyB0aGVpciByZWdpc3RlciBhZGRy
ZXNzZXMgYXJlIGRpZmZlcmVudC4NCg0KVGhhbmtzLUphbWluDQoNCg==
