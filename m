Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2414128dye;
        Mon, 30 Jun 2025 04:54:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVBLJt9Qud/WLRayq60JKkgWLxj8XI93gRFXn5i/MtLc/tR+v4QE6Vz7SnRRZ+Jn33/VdVZ+KDGU44duQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1sCe0JHaszx8DTBeinPLtZvTA+qBc6vsBHz4Bvp/uB1B7O/gum8BmBD82kt/mhxlzlGPl
X-Received: by 2002:a05:6214:4506:b0:6fb:f03:6b24 with SMTP id 6a1803df08f44-700031c84c6mr243872966d6.40.1751284454026;
        Mon, 30 Jun 2025 04:54:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1751284454; cv=pass;
        d=google.com; s=arc-20240605;
        b=WlF6RsJF8TSE+tIRnb5blqRzo2IfdcAsG3fLKd3eGPEKlVNlPaWztVEWfGgDKKnNiC
         qZHGfoVq4RcOfaC5/LPB8SJUrz/8ajSeO5tPbCkIYrkW0ZzR3vc+xwGj2LkM9oaSEzCa
         DnWcEqg9cG9uEPRwUYgOTfPTjbNyiIJAjcwUlmkv/tAnSRhkVxsjKL1nfk4VVPnpw/pm
         iWCB/ZN3F08LABDz8J20eebg8REAse3pxgH4BgKWWwAs8tCp3gWuHzsFbX1uLxHB2s1t
         ouVRL7Bhl7feeW/UoE5l23Vvqej9Sh2gCFV59roCjUSORdyMPR3wYjYy1Ew0IjT+VXM5
         U+AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id;
        bh=/ne25TJiOpr9Nbp6K/ym0tgFrD0mscERQKrBJyVKPNU=;
        fh=X08e5pPzGxtJ7uZHyPn3Nzh4ah3/b7442ZP2UP9w4V8=;
        b=ckyWAFbna0iLT/bu8RXCwKzAreqtg169K2q03hxXFu/lbOuGfMaATug7ugvZPe73f2
         V3qGj+IzsMc0ZHbdMJL4ieJaxup8V3bwZnjj8Ic7kU1NNqiYKNqQ1/tcWQI9j3BfNus3
         k0XLFBDACN/ZqMAhLiDX0C6rymVHSh4Dvz9ltoVuT9pgnu2PyywvUJZLKnXEf1SWmBb5
         LikJ8D2CG4FCUhUhgueRT4OwHpUvopsJKo0k7Rtraf2V7L0jkpXh7+aNNqlOdY/l+lci
         OY5TiOZJ4/K4FnuiZ1A2Gn79py3duT2h8GDZaV2RbXQXxKkdmZbNXIrVsRqahHvSUcVH
         Jm/g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=siewert.io dkim=pass dkdomain=siewert.io dmarc=pass fromdomain=siewert.io);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773547f1si98897886d6.170.2025.06.30.04.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 04:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=siewert.io dkim=pass dkdomain=siewert.io dmarc=pass fromdomain=siewert.io);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWD5F-0000do-4u; Mon, 30 Jun 2025 07:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tan@siewert.io>)
 id 1uWD5A-0000dM-AJ; Mon, 30 Jun 2025 07:53:56 -0400
Received: from
 mail-germanywestcentralazlp170120004.outbound.protection.outlook.com
 ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tan@siewert.io>)
 id 1uWD57-0008LO-R5; Mon, 30 Jun 2025 07:53:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSv8X/4byEwWcu7IMT9EjkUr+K8oaXs/XMuxdW5tDEenPAoHHVQDvCbM8TsWFNL2aE1ovSRxp6sXsTtnUgQRNLO/tRc3+DOrSKFKvmhn3+SdcG6vSOP0WXLRiV4Mh6f2W33+YzU7PY4+DG4tFgB/3LBzZyxFhB1SggpvWJGkSqmZANoUBV6W5BarJkoMFHXidHeQVSiYyxnaaAWvqGWHHZT15xeWQxHOQ9KQsJuDmIlpLN0KBIjwY14Zw756Jpk89LxLLRFyVSn0KRLriNL0V3/IsQr6yURKEXiPNa1Uxvycw2TP3zNbxXPlWGBccPI8UWcmcKEyMMCdhdLuvBAUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ne25TJiOpr9Nbp6K/ym0tgFrD0mscERQKrBJyVKPNU=;
 b=dJb2UbTtMNp3n6VU9hirUrUGSzmKPUOdYI9jMbX2yPhub0FlMfgjElCSzFMbBkoZEa9EYIgFVarx3QCX8bGfLWt/BIRQoeHSULMLLxnlc75HCyBBB/Yhk4WhZVVKWG581G7ss/TNY2j4bLapfnMYvH4u1wL7VKElgJ1HPa2fmsV2s+XW9pNaGyU6o9T9NPcJpAm5zYQig/uFsM1eBfQ25joWKvWfQLy2FWDrqvai/qmhlqERfZKH1Icr7oI2HDmgKh1X75vE/cBrSL+4BdAH740YFC1H7WrbxqH+zfXunaCtnhM7LOAtJ+hjXdN3CaFur/wwn1G3KXrTkBj8v6oV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b18::65f)
 by FR2P281MB0284.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 11:53:48 +0000
Received: from BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5c4:893c:2523:a442]) by BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM
 ([fe80::5c4:893c:2523:a442%3]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 11:53:47 +0000
Message-ID: <439ec678-88da-4b71-abdf-2d70c4b26177@siewert.io>
Date: Mon, 30 Jun 2025 13:53:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/qtest: Add test for ASPEED SCU
Content-Language: en-GB
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20250630112646.74944-1-tan@siewert.io>
 <8fd8738e-8ecf-4fcc-adbe-9af8ba51b0b4@kaod.org>
From: Tan Siewert <tan@siewert.io>
In-Reply-To: <8fd8738e-8ecf-4fcc-adbe-9af8ba51b0b4@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::13) To BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b18::65f)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1PPF7DB70B163:EE_|FR2P281MB0284:EE_
X-MS-Office365-Filtering-Correlation-Id: 598b560f-9e7c-4649-9345-08ddb7ccc5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDdmY3g2UzhrN2tTVW80dmtZcnI1M0tqTEN2eENRKzJPTUVxdUh3ZGlsbXlJ?=
 =?utf-8?B?VExZd0JuU3ZpUDdqRWFJSnhCOFNtME5MaWZmVW1QSktIZU02ZFFUTm5zaTd4?=
 =?utf-8?B?ZDA0dXZuSUpHNDdZcnVTSnJLbEIrTk0venZNQmMrcHhoUkEvaTU1dnFtYzVN?=
 =?utf-8?B?Sjk4UkNocnJlQkRLWDlWbUh5aUlRekk3RUtuVGY1NGg5aXhnTm1lSHJEV1ZD?=
 =?utf-8?B?cG9WWHVobDg5OEV4REwwQ1pTTWtRandrd2Z1WjQxTm9rVFpTT0hacUd4L0Vx?=
 =?utf-8?B?QURISzc5RFEwRUtpdWJUN1ZYN0M0S2ZzVG5HN25CcG9XN0JSazFpbzZJWXFM?=
 =?utf-8?B?b3Fyempqc0FVUWFlbTV5V0J3bkJtMTdEUFlwQjMwQUlsRnY3MmhOQ3YrY2pS?=
 =?utf-8?B?bnQ2ZS9lQ1pVS2FweWdLdmxkY1VUckJCbnRwbUVmL2ZaYXA3U2hRenV1dHpJ?=
 =?utf-8?B?NTF1RkU4ZitrVGNKN1oxbEJQTnZYZmlxbGxDT0lVK2Q1UWlEeXREOFMyRHo4?=
 =?utf-8?B?a1p4ajZ2ZGJyMjBHS3JhR0gxUHl4OWZJdWN1RlFDaUtGMm1jWGFteFZHVWpp?=
 =?utf-8?B?c0hqdmdNZG1GdVBFanJaNmhEYUxIL3hRaU9mQ3FHNWI4ZWlxVGxXV2taS3g2?=
 =?utf-8?B?dWFKOXBUUXRNUytoV2Z6bm5CbHNnaTR4WjlOUFNlZmI5eTU2ZkFscXEwS3JX?=
 =?utf-8?B?emkrSFNsR1R1Z2xmaTdRTGxuM2t2MUNWaEhlZjVpNzFqOUkxM0ZSd3dlaXVk?=
 =?utf-8?B?MlcxNjFxcjhPMnh4MmpxYVdOMlhXT0ZOUzA4bDlYVExObER2cWFRQ2h5d1Zu?=
 =?utf-8?B?QUxlYXMycmYzeno1bjFPSUFTa2dnVzkvUk4wWFE2cjB2VlkybnJRc0ZhTXFy?=
 =?utf-8?B?K09lY1NZR0xSdmJGY0pnTnFXV3JwaVZBY1VmRk9GeHlmRnkrWnhFYjIyRCsy?=
 =?utf-8?B?UXp1KzczdVowY3JMV1R3UlBlV2M5V1IxUERta0FiZldOQzZMcTQ5OWx6ck0r?=
 =?utf-8?B?U1VZMHpnT0liRWlkQXlGUjVXbFFFbENCUVJDM1pkOWFDTS83UmE4aHNabklM?=
 =?utf-8?B?RzE4djZGVEV6M1pFQ1hYczE3SnlRemk2dm9haGFFcGRGOERZS25DbEJnN21Z?=
 =?utf-8?B?RlNtM0d1ZDdEY1Z6djNUVzVueGVPTkwvWTY2YklLRzR4NlV2SGNoTHFvRVFC?=
 =?utf-8?B?SkQycStyZTA4MmJZK2VLb09RckdmVzBvZU9uUHlIZ0pNWXpYY01uOTYyQ2JR?=
 =?utf-8?B?ZGRHcmQ2bTVUdWFLMUROc1k5Q2Y4UEJKTnV3dy9JRkthSllSMHk4N2FLMWM0?=
 =?utf-8?B?eVJBbTdpUXlVTUhOdTZsTlRSd1FHUGlodXZkRm40WldtZERhSjNTZU4vbCtC?=
 =?utf-8?B?VXZsWE4rQTVvRlg3U1ZTcVpkdVFOelQ4OE9uZEJsOXpMVXQ2UDlUY2I1Lzh0?=
 =?utf-8?B?aDBLVlhQdWtFNmVhWVFwbkx6dmV5MWx5RFVlYUovaloxdVFKSWtEbHM1UFpZ?=
 =?utf-8?B?QXFBSWxtaytDbFYvOXFvazVZZkgvbngwQmpNOG44RkovaU9SeGQwdHJxaE5E?=
 =?utf-8?B?bC9rcEtXU3FwUFpwd1BmOE1jMlpYTnBUU3B3RFEyM2t5RktuemRIYmN1ZVd5?=
 =?utf-8?B?VGx5OThySUdGb3RQcko2aDlVTXhvTXVVc0pIL1V3ajFObzM4YXluNzcrTGky?=
 =?utf-8?B?Sm9HbHZadk1kREhYUm1BbTFkQTN3RDNQQzdSTTlUbWl5enNRSHgyQjFEbnow?=
 =?utf-8?B?aHpESExvMUlDaDhOTFVVbU42WjlBZTYyQzBQRGxhZUZzRmF0TmxYbkh2VU11?=
 =?utf-8?B?UGpwcFByVVB2VzU1S3V4VHJTN1ZCaDZLVEMrSkFGU2xsVWo2dDkzVk9aQlBs?=
 =?utf-8?B?UXJGQjVpclc4V2tET1pOV3dPaXh3SHZxZnJwZFRTa2kxdiswMThZcjcwRVFj?=
 =?utf-8?B?UlZzajE2YTVNdEl2ZldWMHZpQzY4a0dmR2hwc2M3dllYcjJyTHQ0dWFFVlF6?=
 =?utf-8?B?dUVoRXRHcmhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDVXL1J1eEFwZGM2UHVKcXVhNjZRMGIwbTJHdUIrTnFYRzVJb1kwYlRiZnM0?=
 =?utf-8?B?ODZydmU2eTgzRHpRVHhLOGtzR0NzZW41Tm9LdzhpSThiUlBtUXNJZENNY3NJ?=
 =?utf-8?B?U0dzelpGUHNGNC9RcGxHektGWGFGaUszSmJRdVhUZDI3YzJVT1pwU0pGbm5t?=
 =?utf-8?B?VDdTdi9XTlhUWUxaTEtzZGdPOS9NNERia3g2QmxJTW1wV2VvRDN5Zmtub0d0?=
 =?utf-8?B?VzBEVUFPQTZ0OUN3UUlxUU4xbUpRbjZGWmVqS1lzcldsdUNyREpvTHJLSldH?=
 =?utf-8?B?cDhnQ3dRMDJlSnVLcmcrUHN5T0JkRE1DZTBrak5kcXNDVzNkVDA4Z2lBYjJO?=
 =?utf-8?B?dUFpK3dPSzVzQ3IwdE05ZjJ2NGlvRFM5UlROOWtoc2Y3OWwva2tWcks4cFNk?=
 =?utf-8?B?YUNnQkdQeGJsMWRzN2hnd1FIZEdLSkRPejBzeDN0SlZhVWJMa3I3RVBDcWxZ?=
 =?utf-8?B?YUpaUW91dmZvRktqU1p2OEhuWk1wMFFFeHVKbTJReXVTclNrc2M2c1JnVmlU?=
 =?utf-8?B?anE4NVdieFp5RkZYZFFyVFlUY3VFZTh3VUpoMkZ2cjZ4WVAwUzI0M2NyeG54?=
 =?utf-8?B?MXBJM3U3U0J5cjJ5bndNb0ExZU5qRTZRcWRCbCtCSmNGVTRSdzlOUE4xeG5a?=
 =?utf-8?B?Uy9LMzVDMEVsV0tFbTZtNWdYK1NiNEwzOVA1UVZxbzlQVnVYZk1Yd1hGcitj?=
 =?utf-8?B?dTA2bnRIR1V2WG1kV3VvWEljV3kvQkFkVnRaL2RLUGN1eG9uMEsvRGlDTEJ6?=
 =?utf-8?B?QS9uREJLa3RucWtOWkJsdURwWC9zc1dnZzgvUTJzMlozeE50aFMrMjNYNmc1?=
 =?utf-8?B?WkFtT2NoWk14SHg1aUZwZENUWUpGMU9LeThHSE5PZHlOcUZJS2RiOEJ3YTVk?=
 =?utf-8?B?dlQvZk9xRVdNU0s1TVBzTGx3aU56MFg0TVh3K1c0RzAzSDhkMmFKS2grSE1Y?=
 =?utf-8?B?ZU9HRERocE1sTGNPYkc3ZEFJQndZdDl4WlZ2OElHK3ZjeExDZFJEOUNud0hw?=
 =?utf-8?B?OHFqdWpSRFdrNEJXaWpBdzRqam5rSnZ6Y1BzczFRYnQzUVFGdWV3WHdsN0No?=
 =?utf-8?B?cThnMnNkbjFKV0tCMWRScXdLVEIrYUp3ejJyR1dsNDlURHFiUm5mTXZTNkdt?=
 =?utf-8?B?ME1SVHo0T1JMMEM1NjQrYnUrUHh2L0dlNlFnL3pVUUV4Y3dpVkRuWjlJMTB6?=
 =?utf-8?B?NzhYc0JiOUJDWWFuOEoyd3NpQkk1SktDV1BOSkpoLzh2eVd4OHpPdzIwNGdi?=
 =?utf-8?B?UDYvVFFZdzZoWDBYWVFWTmF2NEU1QU5JOE5sdFRZSGZVR1dQMUVBa0daWnhG?=
 =?utf-8?B?NXJtMXF5by8xYW1IZU9HVVZ1SG0zTlJXOUZFVlVObWZEME5DZXlGRjdzTm55?=
 =?utf-8?B?ZXdLM1kxcGw0UnE0U1h6cXQ0aUpFZS9yZTNhWGRIYWUxS3RFQStPbVd2YUdt?=
 =?utf-8?B?N1MwUktLZGkwckdYcU95YldYMjRLNFFJYmVXVnp3OFJRT1hEVkRlNUtiTnVy?=
 =?utf-8?B?MGtLZHJXMkZDWDhtVzRaVE0ycGpjRndpbzFvSFRlaGdSZjdKL0phMS9VN0VE?=
 =?utf-8?B?bHNOakdIVVFFZ1daNFJwNi80bW1OSnVpWWNnQ3lvbG1PdzVtdk1mRW1mSncv?=
 =?utf-8?B?TVA0clBMbzlxaEEvb0pRRElqWGVnTWUrTVZ1Q253c3FjUW9lNk9RbkU2UEc3?=
 =?utf-8?B?MzZDSW9NY2p5WURlYzN1UVhQTlNkVHJBVjE4amR4WWloU2wwUlg1UXNHRjdO?=
 =?utf-8?B?UmZiSTRSdysvWUNwZUFDcWMrbFpIWDlaVkJEcTBiMDlvSzZWK0MxcTFYRkcw?=
 =?utf-8?B?T1F4NXZZcjc0d3RLYk5qdm5zQkZjOGhvMDFlaUNIVjlUTWZ2YXoydDFya0FR?=
 =?utf-8?B?aGw1YkwzSkwxbHhob1M4cm9yUGFCb0xpSktJK0FFYTFoOUJWYlRSYi9ObUph?=
 =?utf-8?B?NEJVcm9WRnlQeG1BYktKNnlkWDdZaU9YdXJxanorbE4zV3A3MmJtSi94Qms0?=
 =?utf-8?B?a1lIeDU3UzcrWW43eDBqR2huYWZocmEzV2ZveHNUUVdlald5QzFYbjBLOUFB?=
 =?utf-8?B?ZC9UbHlrdmhzRVhyYnIrc3IxLzY5K1JsV201MVIxUnd1WW9qN044WFNwZ1pQ?=
 =?utf-8?Q?b1k4=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 598b560f-9e7c-4649-9345-08ddb7ccc5b6
X-MS-Exchange-CrossTenant-AuthSource: BE1PPF7DB70B163.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:53:47.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRql2j0BKk7EJ8ZkvGKvBZWd2SkYR2qkBrGD/AvqoOnYewypWb3rMcbWdnbaowNc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB0284
Received-SPF: pass client-ip=2a01:111:f403:c20c::4;
 envelope-from=tan@siewert.io;
 helo=FR4P281CU032.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-TUID: MQmDoJdjSmC2

On 30.06.25 13:47, Cédric Le Goater wrote:
> On 6/30/25 13:26, Tan Siewert wrote:
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 8ad849054f..8c5fcc4fc1 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -215,7 +215,8 @@ qtests_npcm8xx = \
>>   qtests_aspeed = \
>>     ['aspeed_gpio-test',
>>      'aspeed_hace-test',
>> -   'aspeed_smc-test']
>> +   'aspeed_smc-test',
>> +   'aspeed_scu-test']
> 
> Sorry I should have mentioned that :/ Could you please maintain the
> alphabetic order ?


Yikes, could this may be fixed on apply instead of sending a v3? I 
didn't notice that too.

> With that,
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks, Cédric!

Cheers,
Tan
