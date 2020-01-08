Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp913609lff;
        Wed, 8 Jan 2020 07:57:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMuBpZov2t7vEclU/jrSXY3iN7SY2yHU4A5uhdIgt5XM2mPOZot3udQSvYSwn2lSKKSUsy
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr5470929ejd.312.1578499074214;
        Wed, 08 Jan 2020 07:57:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578499074; cv=pass;
        d=google.com; s=arc-20160816;
        b=uRNSpJdhjFoJtLDG9u6u4G7a4T71svplg4vl6abzXVmaKQFhsML+P9cV3W4I3vcMmz
         LiZxwvEntkpi/3mtc268Do2vTIRDLocbROzW+S85acHlmWITum7tCHvnU+zOjzaGAMUt
         CVtB+cv4k2uF5Vxkd8D6pN+qD1zYP+2N2mAQj6Ij5ZVXrUSwaWNWy2Li8AHeVx+EGyth
         j4dY7wVvBoAdZYaDN1XgkyF1jjo2KJzzFhE/XSgZgj0x0aT2QsBap/1m9hy5PCqfY6mA
         xH84bRaMxl1URysLms4CkWbSAJF8juKHGbo04LWmhqvbEulL5673u6c/9gkECkcyYTMt
         sRDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Tf9kQo4TT5v7q3qsVeIdtwy2+gIaO1T1JOikIwafFHQ=;
        b=vJ4yEmWdUfmeUwe5JdZodSnuCGqXPkKFKdlyiveXY89Ap+owFIgUObd8UNi/HpyK42
         +29aBpXrn8vFibxrSLQ8is7c5vYIXwnlig9NJK0RigIX1J0JXmWSAIhOmBA7A/BBwmrz
         0380fE2G3oqYrTOLvcbYSHIe3Mn9rBT7QT0ILJGrE+Ci4WqLj6/fp5NYMRbiM318GBfp
         Xu6OQYpLGwHIrFTwivKIbZjSJBaedzi9z2qMQcWVlZKGDBMeYzs2jnB2xJTsRhP0En07
         /buVC4X+q6ByTM4jVImyw8eSSql6WfdGskqZ0H9i5/TP9xj9jKK9l6i8ysrWVuWK6lth
         JR4Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PVpOvjXV;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PVpOvjXV;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of alan.hayward@arm.com designates 40.107.0.83 as permitted sender) smtp.mailfrom=Alan.Hayward@arm.com
Return-Path: <Alan.Hayward@arm.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00083.outbound.protection.outlook.com. [40.107.0.83])
        by mx.google.com with ESMTPS id f1si2424895edn.275.2020.01.08.07.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 07:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of alan.hayward@arm.com designates 40.107.0.83 as permitted sender) client-ip=40.107.0.83;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PVpOvjXV;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PVpOvjXV;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of alan.hayward@arm.com designates 40.107.0.83 as permitted sender) smtp.mailfrom=Alan.Hayward@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf9kQo4TT5v7q3qsVeIdtwy2+gIaO1T1JOikIwafFHQ=;
 b=PVpOvjXVaqluvsiyEXEp9w1gxUWYJvQCBKtcdYGteIFor0E53ZjpTEviogK+vk3M8XU1didfTQDDa3posbPMTK0nLRTSB0U3XV+wMCuK5NDQRw9m31Tebwj2j7kONJ+0zYkE84RXqm7N2IW3zrjyZ7kI6EUAuRlC1Em7qNRb8ig=
Received: from DB6PR0802CA0027.eurprd08.prod.outlook.com (2603:10a6:4:a3::13)
 by VI1PR0802MB2445.eurprd08.prod.outlook.com (2603:10a6:800:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Wed, 8 Jan
 2020 15:57:52 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by DB6PR0802CA0027.outlook.office365.com
 (2603:10a6:4:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Wed, 8 Jan 2020 15:57:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; linaro.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Wed, 8 Jan 2020 15:57:52 +0000
Received: ("Tessian outbound 28955e0c1ca8:v40"); Wed, 08 Jan 2020 15:57:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b2c1c5d22cf72f2d
X-CR-MTA-TID: 64aa7808
Received: from 8aa5c731c618.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 66B9A792-F367-4611-BED3-B98E941AE024.1;
	Wed, 08 Jan 2020 15:57:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8aa5c731c618.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Jan 2020 15:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEwy7OdtJTt/r+Q77SU1uRoWxYL1yzJVLf7121YEe+XwMstRGQMaq9zUItVViHftYz7Z0ZDOk01r24XmlyzX8hwcYnamHUENlJW8hZ3vHm6MHz3JF/rIWPTSbq50tmq9uBEPbcj6RHXcwPOHv1pp97n5m9RCwe93S3/qP/hOwfTP5uRdflMRGROkYV/D1LDnxGFTzbFXBKBtuBNsEVbwL8bYjHrskTloCcVLXwh2uLQ8WWjem5Db+KkkGe1/c2jIE2M24TBYXZNHbyaS9IlXTYU2kPFOnOC9SjXN6+tWBHR5+f/hxTseFnjlTU1VepsPmmN8RQol5OOfhxuWjh4eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf9kQo4TT5v7q3qsVeIdtwy2+gIaO1T1JOikIwafFHQ=;
 b=VM5HpHOSfjmsfpl2btuDMv6vRN59E/MV/itIWzL2CNYUgA1WJD4lX51La85mdkdT0m0mIO4Nx1VOdd7TW2WyVZXsfN38F1OgdvhvTt2ygZxAw7hseP4R2YwcXb7RF6KuWRNu50JsQaUWHmptLmagpaA/iZUSOpyNg0SVoPZw+npwMrEN1HFFHTrzA4IbAPtmu/JBowBPoLKSy0niKhFMgse8XF/r51RmGmrgfLlmLJtVAZrhQk2zLaxm3017pYaTTMhSRESO8x+0xoIZo2yizTMtPxmhR3qKU4eUuMVhddkOnQemIZKlv1jrYwg0Gl49poc923SqI0SMnF2JmOFuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf9kQo4TT5v7q3qsVeIdtwy2+gIaO1T1JOikIwafFHQ=;
 b=PVpOvjXVaqluvsiyEXEp9w1gxUWYJvQCBKtcdYGteIFor0E53ZjpTEviogK+vk3M8XU1didfTQDDa3posbPMTK0nLRTSB0U3XV+wMCuK5NDQRw9m31Tebwj2j7kONJ+0zYkE84RXqm7N2IW3zrjyZ7kI6EUAuRlC1Em7qNRb8ig=
Received: from AM0PR08MB5330.eurprd08.prod.outlook.com (52.132.212.151) by
 AM0PR08MB3522.eurprd08.prod.outlook.com (20.177.108.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Wed, 8 Jan 2020 15:57:45 +0000
Received: from AM0PR08MB5330.eurprd08.prod.outlook.com
 ([fe80::89cf:a33e:c415:d30]) by AM0PR08MB5330.eurprd08.prod.outlook.com
 ([fe80::89cf:a33e:c415:d30%6]) with mapi id 15.20.2602.017; Wed, 8 Jan 2020
 15:57:45 +0000
From: Alan Hayward <Alan.Hayward@arm.com>
To: Luis Machado <luis.machado@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "damien.hedde@greensocs.com"
	<damien.hedde@greensocs.com>, Peter Maydell <peter.maydell@linaro.org>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>, nd <nd@arm.com>
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
Thread-Topic: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
Thread-Index: AQHVsJOQIYDu1ADPkUWmebg7MmByhqfB4DMAgAEUkQCAABjpgIAAATkAgB4Iq4A=
Date: Wed, 8 Jan 2020 15:57:45 +0000
Message-ID: <889CE29C-C705-4EB4-B52A-62F88A6121A2@arm.com>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org> <87k16sdt4d.fsf@linaro.org>
 <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org> <87eewzdtqg.fsf@linaro.org>
 <81e43d43-29f8-ec56-5270-bb90dd1bc077@linaro.org>
In-Reply-To: <81e43d43-29f8-ec56-5270-bb90dd1bc077@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3601.0.10)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Alan.Hayward@arm.com; 
x-originating-ip: [213.86.15.71]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13d79c60-d753-40c9-ce42-08d79453849f
X-MS-TrafficTypeDiagnostic: AM0PR08MB3522:|VI1PR0802MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB24450623A533DD531A3DD833973E0@VI1PR0802MB2445.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 02760F0D1C
X-Forefront-Antispam-Report-Untrusted:
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(316002)(54906003)(110136005)(86362001)(8936002)(186003)(53546011)(91956017)(81166006)(2616005)(81156014)(66476007)(478600001)(66574012)(66946007)(71200400001)(6512007)(6486002)(6506007)(66446008)(64756008)(66556008)(76116006)(8676002)(21480400003)(33656002)(2906002)(5660300002)(26005)(4326008)(55236004)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3522;H:AM0PR08MB5330.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nVE4CNCvOq4rJ+THwmLT0evOIZT8NogLbeFuo41ELXNIeLZtaueiI358IlgtCrpaNxGiEoGbTyDLpTTospganK9ZyEC25SlsCxA5yx5C20tErtSu+RuJnmpMZIxAZyKKLeWZzkOivncfATmYXAyCa3+k4Ss4szDbysDBA6XSPkhJ93JPRzH5Jk6nO7dSpQJCcxgHEbr9qpboMSAc1TQ7fFWngF8Ucb9JIn+Acnm3tV9t+lWdh/cjqPAkgvNoJyBeCG+VsuY69GjKqaGJ24/kMHBYtki+sS9boDWppsMPRt4xUpDIohGB3xaEpXc4IViMhBNg3IUJjgkQH3nFKfPZR5i4FNaUtJ/YIag6xoesnzESsdMR1ff3EDr4OuCNntUvS6UhFZLvJNWept9oUiRpxg8aOc6l+QIQMvMiIm0LOvBhv2IoVxtHurkYucnD6IyT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8742C2B25BD9AB47A3707A3FB952F631@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3522
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alan.Hayward@arm.com; 
Return-Path: Alan.Hayward@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(6506007)(450100002)(81156014)(186003)(478600001)(8676002)(81166006)(5660300002)(316002)(53546011)(8936002)(70586007)(36906005)(33656002)(70206006)(2906002)(2616005)(336012)(21480400003)(4326008)(36756003)(26005)(66574012)(6512007)(26826003)(110136005)(356004)(86362001)(6486002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0802MB2445;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	77807269-193c-43f0-ed56-08d79453805a
X-Forefront-PRVS: 02760F0D1C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZJ1eT8Fu4D1Pa1X+IKQNGItN0X2uIQpXk9QwCWutSQ17UFxSF7CjzXzOTY9+Fx8jB2aG9yoGOl7DcW99h7wf61D/1Vwf/LXzxmwY8PDjpuZdSA4qTsnzR71g066K89BOMclECR32302Sf1oxFEy4iazqqZB6bexQ1UyNCJXbZMnnSZIXr2Og9n0Q6ZrI3ko9bDu+pX09X0wJS3w02000h6KE+HdcjIj2DvniPG+ToXFtZ0k0xuIEeA+vZXbvqMoiozQUuLw5r29OfcY+o114UWLbGg0UYaWaUuLJuv4cQa1AXOPQGZNpulIiqrw6drLm5AZHfXkDKWAziJ0Z62TI28S6NtX6gt9ENtfCQjcRsZEudbtfzrMFYYj9rAhM6QnP8I32akEhniHASUnk/Y3YwhZG8K9VC9tI8FpmATHxTUKLPnKIm0BhgV4yYCRMWFRC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2020 15:57:52.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d79c60-d753-40c9-ce42-08d79453849f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2445
X-TUID: qY3cCySqIFhB

DQoNCj4gT24gMjAgRGVjIDIwMTksIGF0IDEzOjE4LCBMdWlzIE1hY2hhZG8gPGx1aXMubWFjaGFk
b0BsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IE9uIDEyLzIwLzE5IDEwOjE0IEFNLCBBbGV4IEJl
bm7DqWUgd3JvdGU6DQo+PiBMdWlzIE1hY2hhZG8gPGx1aXMubWFjaGFkb0BsaW5hcm8ub3JnPiB3
cml0ZXM6DQo+Pj4gT24gMTIvMTkvMTkgNDoxNSBQTSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4+
PiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4gd3JpdGVz
Og0KPj4+PiANCj4+Pj4+IE9uIDEyLzExLzE5IDk6MDUgQU0sIEFsZXggQmVubsOpZSB3cm90ZToN
Cj4+Pj4+PiArc3RhdGljIHN0cnVjdCBUeXBlU2l6ZSB2ZWNfbGFuZXNbXSA9IHsNCj4+Pj4+IA0K
Pj4+Pj4gY29uc3QuDQo+Pj4+PiANCj4+Pj4+PiArICAgIGNhc2UgNTE6DQo+Pj4+Pj4gKyAgICAg
ICAgcmV0dXJuIGdkYl9nZXRfcmVnNjQoYnVmLCAoY3B1LT5lbnYudmZwLnpjcl9lbFsxXSAmIDB4
ZikgKyAxKTsNCj4+Pj4+IA0KPj4+Pj4gWW91IG5lZWQgdG8gdXNlIHN2ZV96Y3JfbGVuX2Zvcl9l
bCB0byBnZXQgdGhlIGVmZmVjdGl2ZSB2cS4NCj4+Pj4+IEFsc28sIEkgdGhvdWdodCB2ZyA9PSAy
ICogdnEuDQo+Pj4+PiAgID4gKyAgICBjYXNlIDUxOg0KPj4+Pj4+ICsgICAgew0KPj4+Pj4+ICsg
ICAgICAgIHVpbnQ2NF90IHZhbCA9ICoodWludDY0X3QgKikgYnVmOw0KPj4+Pj4+ICsgICAgICAg
IGNwdS0+ZW52LnZmcC56Y3JfZWxbMV0gPSAodmFsIC0gMSkgJiAweGY7DQo+Pj4+PiANCj4+Pj4+
IFlvdSBjYW5ub3QgaGFyZC1jb2RlIEVMMSB3aXRob3V0IGlmZGVmIENPTkZJR19VU0VSX09OTFku
ICBJZiB0aGUgZWZmZWN0aXZlIHZxDQo+Pj4+PiBkZWNyZWFzZXMsIHlvdSBtdXN0IGNhbGwgYWFy
Y2g2NF9zdmVfbmFycm93X3ZxLiAgWW91IG11c3QgY2FsbCBhcm1fcmVidWlsZF9oZmxhZ3MuDQo+
Pj4+IEknbSBqdXN0IGdvaW5nIHRvIGRyb3AgdmcgKGFuZCB0aGVyZWZvciB0aGUgYWJpbGl0eSB0
byBzZXQgaXQpIGZyb20NCj4+Pj4gdGhlDQo+Pj4+IHJlZ3NldC4gSXQgd2FzIG9ubHkgbWVhbnQg
dG8gYmUgYW4gaW5kaWNhdG9yIGFuZCBnZGIgZG9lc24ndCBhY3R1YWxseQ0KPj4+PiBsb29rIHRv
IGl0IHRvIHNpemUgaXQncyBvdXRwdXQuIFRoZSBsaWtlbHkgZHluYW1pYyBleHRlbnNpb24gd2ls
bCBqdXN0DQo+Pj4+IHJlLXRyYW5zbWl0IHRoZSB3aG9sZSBYTUwgd2hlbiBhIGNoYW5nZSBvY2N1
cnMuDQo+Pj4+IA0KDQpbLi4ucmVib290aW5nIHNlbGYgYWZ0ZXIgZmVzdGl2ZSBicmVha10NCg0K
WWVzLCB3aGVuIHVzaW5nIGEgZ2RiIHN0dWIsIGNoYW5nZXMgdG8gdGhlIFZHIHZhbHVlIHNob3Vs
ZCBiZSBzaWxlbnRseSBpZ25vcmVkIGJ5IHRoZQ0Kc3R1Yi4NCkluIGFkZGl0aW9uLCBpZiB0aGUg
dmVjdG9yIGxlbmd0aCBvbiB0aGUgc3lzdGVtIGRvZXMgbWFnaWNhbGx5IGNoYW5nZSB3aGlsc3Qg
dGhlIHByb2dyYW0NCmlzIHJ1bm5pbmcsIHRoZW4gdGhlIHN0dWIgc2hvdWxkIGNvbnRpbnVlIHRv
IHVzZSB0aGUgcmVnaXN0ZXIgc2l6ZXMgZm9yIHRoZSBvcmlnaW5hbGx5DQp0cmFuc21pdHRlZCBY
TUwsIHRydW5jYXRpbmcvZXh0ZW5kaW5nIHRoZSByZWdpc3RlciB2YWx1ZXMgYXMgcmVxdWlyZWQu
DQoNCldoeT8gQmVjYXVzZSBvbmNlIHRoZSBzdHViIGhhcyBzZW50IHRoZSBYTUwgZGVzY3JpcHRp
b24gdG8gR0RCIG9uIHByb2dyYW0gc3RhcnQsIHRoZW4gR0RCDQphc3N1bWVzIHRoZSBYTUwgZGVz
Y3JpcHRpb24gd2lsbCBuZXZlciBjaGFuZ2UuIEdEQiB3aWxsIGVycm9yIGlmIHNlbnQgcGFja2V0
cyB3aXRoIGRpZmZlcmVudA0KcmVnaXN0ZXIgbGVuZ3Rocy4NCg0KDQo+Pj4gDQo+Pj4gSSdkIHZl
cmlmeSB3aXRoIEdEQiBmaXJzdCBpZiB2ZyBpc24ndCBhY3R1YWxseSByZXF1aXJlZC4NCj4+IEl0
IHdvcmtzIHdpdGggbXkgdGVzdHMgYnV0IHBlcmhhcHMgd2UgdXNlIG91ciBvd24gbmFtZXNwYWNl
ZCBYTUwgcmF0aGVyDQo+PiB0aGFuIHRoZSBnZGJzdHViIFhNTC4NCg0KWWVhaCwgaWYgeW91ciBn
ZGIgc3R1YiBpcyBwcm92aWRpbmcgYW4gWE1MIGRlc2NyaXB0aW9uLCB0aGVuIGVzc2VudGlhbGx5
IGl0IGNhbg0KcHJvdmlkZSB3aGF0ZXZlciByZWdpc3RlcnMgaXQgd2FudHMgdG8gaW4gdGhlIFhN
TCwgYW5kIG1vc3Qgc3R1ZmYgd2lsbCBqdXN0IHdvcmsuDQpXaGVuIHVzaW5nIGEgZ2RiIHN0dWIs
IG5vdGhpbmcgKGFzIGZhciBhcyBJIGNhbiByZWNhbGwpIGluIEdEQiBpcyByZWx5aW5nIG9uIFZH
IGV4aXN0aW5nDQpvciB1c2luZyBpdHMgdmFsdWUuDQoNCg0KPj4+IEZyb20gbG9va2luZyBhdCBH
REIncyBjb2RlLCBpdCBkb2VzIHNldCB2ZyBhcyBvbmUgb2YgdGhlIHJlZ2lzdGVyDQo+Pj4gbmFt
ZXMsIGFuZCB0aGlzIGlzIHJlZ2FyZGxlc3Mgb2YgYW55IFhNTCBpbnB1dC4gSXQgZG9lcyByZWZl
cmVuY2UgVkcNCj4+PiBoZXJlIGFuZCB0aGVyZSBpbiB0aGUgY29kZSwgZXZlbiB0aG91Z2ggaXQg
bWF5IG5vdCB1c2UgaXQgdG8gc2l6ZSBpdHMNCj4+PiBvdXRwdXQuDQoNCldoZW4gdXNpbmcgR0RC
IGEgcmVhbCBTVkUgTGludXggYm94IHdpdGhvdXQgYSBzdHViL2dkYnNlcnZlciwgdGhlbjoNCg0K
KkJlZm9yZSBkb2luZyBhbnl0aGluZyB3aXRoIHRoZSB0YXJnZXQgZGVzY3JpcHRpb24gKGZvciBl
eGFtcGxlIGFmdGVyIGV2ZXJ5IGJyZWFrcG9pbnQpLA0KR0RCIGFsd2F5cyBhc2tzIHRoZSB0YXJn
ZXQgKGllIHRoZSBHREIgYWFyY2g2NCBwb3J0KSBmb3IgdGhlIFhNTCBkZXNjcmlwdGlvbiBhZ2Fp
bi4gVGhpcw0KZnVuY3Rpb24gcmUtcmVhZHMgdGhlIHZlY3RvciBsZW5ndGg7IGlmIHRoZSBsZW5n
dGggaGFzIGNoYW5nZWQgdGhlbiBpdCBjb25zdHJ1Y3RzIGENCm5ldyBYTUwgZGVzY3JpcHRpb24g
YW5kIGZvcmNlcyB0aGUgcmVnaXN0ZXJzIHRvIGJlIHJlLXJlYWQuDQoNCipXaGVuIHdyaXRpbmcg
dGhlIHJlZ2lzdGVycyBiYWNrLCB0aGUgYWFyY2g2NCB0YXJnZXQgY2hlY2tzIHRoZSBWRyB2YWx1
ZSBhbmQgaWYgY2hhbmdlZA0Kd3JpdGVzIHRoYXQgZmlyc3QuIFRoaXMgY2FuIGZhaWwgKHdpdGgg
YW4gZXJyb3IgcHJpbnRlZCB0byB0aGUgb3V0cHV0KS4gVGhlIHJlc3Qgb2YgdGhlDQpyZWdpc3Rl
cnMgYXJlIHRoZW4gc2NhbGVkIGFuZCB3cml0dGVuIGFjY29yZGluZyB0byB0aGUgbmV3IHNpemUu
IFRoZXJlIGlzIG5vIG5lZWQgdG8NCmNoYW5nZSB0aGUgeG1sIGF0IHRoaXMgc3RhZ2UgYXMgaXTi
gJlsbCBiZSBkb25lIHRoZSBuZXh0IHRpbWUgR0RCIHVzZXMgdGhlIGRlc2NyaXB0aW9uLg0KDQpC
bGluZGx5IGVuYWJsaW5nIHRoZSBhYm92ZSB3aGVuIHVzaW5nIGEgc3R1YiByZXN1bHRzIGluIGlu
IEdEQiAqY29uc3RhbnRseSogYXNraW5nIHRoZQ0Kc3R1YiBmb3IgYSBuZXcgWE1MIGRlc2NyaXB0
aW9uLCBzcGFtbWluZyB0aGUgcGlwZSwgc28gdGhpcyBuZWVkcyBzb21ldGhpbmcgbW9yZSBudWFu
Y2VkLiANCg0KSSBwbGFuIG9uIHNlbmRpbmcgTHVpcyBteSBpZGVhcyBJIGhhZCBmb3IgVkcgY2hh
bmdpbmcgd2hlbiB1c2luZyBhIHN0dWIuDQoNCg0KPj4gQnV0IHRoaXMgaXMgYWxsIHNwZWNpYWwg
Y2FzaW5nIGZvciBmZWF0dXJlDQo+PiBuYW1lPSJvcmcuZ251LmdkYi5hYXJjaDY0LnN2ZSIgcmln
aHQ/DQo+IA0KPiBZZXMsIHZnIGlzIG9ubHkgYXZhaWxhYmxlIGlmIGZlYXR1cmUgb3JnLmdudS5n
ZGIuYWFyY2g2NC5zdmUgaXMgYXZhaWxhYmxlLg0KDQpOb2QuDQoNCg0KDQpBbGFuLg0KDQoNCg0K
DQoNCg==
