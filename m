Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12499161lfc;
        Mon, 2 Dec 2019 02:05:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPxW5NYYRNZO/eh9Wj4JX2j62S1IkzKxuugD+tiGE7e4tCICOAYnGSolcmAzdcofsZY0ab
X-Received: by 2002:a05:6402:2d7:: with SMTP id b23mr30278619edx.272.1575281154375;
        Mon, 02 Dec 2019 02:05:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575281154; cv=pass;
        d=google.com; s=arc-20160816;
        b=flKpK2Q49tZfWDfYFYkTEH0skHvH9ZYS8dVNY8d7JUQ4o+AQtR0PwdTN8qGKF0dsuS
         OsMvUoyPSsTzpBrEZ+EvP8mKMlao7cbg35GGnlYiyVmx8fUBjSj69Lt54Nx6olmY4Jde
         2src9UeTVyGtZEfdx6PRXVYS8XFt9KwPDK+Z6idOvcHXisPoei4n7oxDG6fH5sT8DpZ5
         HHEMRVv4QopmjWUDyKEMyA3aR6WIMahjdESBzBqwGoYg5Vm//nx1Qipmym0gxv6VWaKo
         VvbuQsFQoZv+w+S6M7ttQs/xLE4bbDoeXJBeHmSSEGiakVgjVyqwtr36R2fYhKi+3gCN
         kIsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=nodisclaimer:original-authentication-results:mime-version
         :content-transfer-encoding:content-id
         :authentication-results-original:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature:dkim-signature;
        bh=WbpXiavto7WlF+PW20qrrUoF0nbKX5dh+9AB32r0UNU=;
        b=NlTjHiEKzfyoTJwPcSQnRjsJWoQ+Oahjme+XbliNoIoBUhT0z5r9GrX0nEKUurmN6A
         YS4eAQtpc2wnyG2Lg0ihZwidZmYcW9sAjYvCUefxC1cg6nfZDcOPbQdrqTjrjSjXEXRU
         4uGmqVV8kbnz7Mu7tqDv+JcUkp8r6FDWtVl6NcQZSwW+bYHByaN6c+JrxBGx+vrdscKI
         ORpWal5t//1kRseLf57axq04mZk0zlOLieJwp7P2/BsLiOp7KBegGBZdxYJ0AOXCqlgV
         7LZT5o7AiNpHBDneYphlGzKvWazGo3ORrnAUzkSTtCn9jycRRr3BD0ve7IG7v/yZa3/g
         JYzA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="s+oD/9cs";
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="s+oD/9cs";
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of alan.hayward@arm.com designates 2a01:111:f400:fe0e::601 as permitted sender) smtp.mailfrom=Alan.Hayward@arm.com
Return-Path: <Alan.Hayward@arm.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0601.outbound.protection.outlook.com. [2a01:111:f400:fe0e::601])
        by mx.google.com with ESMTPS id q11si23478288edi.162.2019.12.02.02.05.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2019 02:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of alan.hayward@arm.com designates 2a01:111:f400:fe0e::601 as permitted sender) client-ip=2a01:111:f400:fe0e::601;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="s+oD/9cs";
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="s+oD/9cs";
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of alan.hayward@arm.com designates 2a01:111:f400:fe0e::601 as permitted sender) smtp.mailfrom=Alan.Hayward@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbpXiavto7WlF+PW20qrrUoF0nbKX5dh+9AB32r0UNU=;
 b=s+oD/9cssuc/hfm2m/B6O3TBM7+rIP46mMD15PZzeWKYR5HmRTRucuOPgDQZbi7DD3hp48ywTR8YItfv+O4xOVm4NTafKJjqMgKyRZNGDA6sAYVU0xYC4uatS/5akjk2NxBJFfywxbpdxGlJJwbr0iMaSdEr6WhWQ2C02x36pxY=
Received: from DB6PR0801CA0060.eurprd08.prod.outlook.com (2603:10a6:4:2b::28)
 by HE1PR0801MB1835.eurprd08.prod.outlook.com (2603:10a6:3:7c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 10:05:52 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by DB6PR0801CA0060.outlook.office365.com
 (2603:10a6:4:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Mon, 2 Dec 2019 10:05:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; linaro.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;linaro.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 10:05:52 +0000
Received: ("Tessian outbound 54081306375c:v37"); Mon, 02 Dec 2019 10:05:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 489143afd3908e66
X-CR-MTA-TID: 64aa7808
Received: from 705f231e3107.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 65C77B36-9D6A-44D4-98D2-359C7D694CFE.1;
	Mon, 02 Dec 2019 10:05:46 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 705f231e3107.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Dec 2019 10:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlV3xwoV7L+wXv/rH3jucTz+kBTY5vWpAWQHEC6gbMOLNK5HsSx+mwohMvP+CZrVA4nC1Z2IG38rw3gHo3bNT4HddxEBafcIH1aN2GaJn7lIExAwQw+x59WoNUw5S0X8pe2G/k8KXgTlw2GrXewBFjzq8RaG1IWcmh4NcSTUpe5ikybbQWr8Qb27bCzV48WhBsjTk3bv/1gHqjAn9cR7dvVYoKHI6KVJEirgTUNswTSYxkZy4dz5fdHEti6K/Sljsy2Gx//1fPRFx6eZX02XGu3LnFwnjPRoFGJwMjONI9XHYtvg4bbg/oJWiDtWok4IsV8HGqHKiI7we0faGpzYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbpXiavto7WlF+PW20qrrUoF0nbKX5dh+9AB32r0UNU=;
 b=Lfh4PwXClU+CS1Yy+ZQDpDEuJAI08xzfKTdYG1jnACkC+IGgZkCbraQHNe6w1sy8Y9mCbajk5uhiDas5H8yRGL02978BtfYywLOhW961NWeFcYgGFOr689tXX3sFky2bfbdU77i1sxDq/quwcF7Tn8PdCjgai2V38gLjtyUHmx8Kn6Ru+f/ogywCHuRNte4WDay7A2fx4cUJI9d/nEKPz8nD79lKXfeHKhWZoRwZyGCfD1Je+S4ZDOFqYZcLtyVUxGFlDfhy1ZHZaOjJym5sNlMcYtxW1OSTxSNb7icHisgp+IS/uee7cKJdPL3fA95hjF0ahdZt/2Y6R8cjIxnlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbpXiavto7WlF+PW20qrrUoF0nbKX5dh+9AB32r0UNU=;
 b=s+oD/9cssuc/hfm2m/B6O3TBM7+rIP46mMD15PZzeWKYR5HmRTRucuOPgDQZbi7DD3hp48ywTR8YItfv+O4xOVm4NTafKJjqMgKyRZNGDA6sAYVU0xYC4uatS/5akjk2NxBJFfywxbpdxGlJJwbr0iMaSdEr6WhWQ2C02x36pxY=
Received: from DB8PR08MB5004.eurprd08.prod.outlook.com (10.255.19.224) by
 DB8PR08MB4025.eurprd08.prod.outlook.com (20.179.10.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 10:05:44 +0000
Received: from DB8PR08MB5004.eurprd08.prod.outlook.com
 ([fe80::ad17:d322:720e:3ac0]) by DB8PR08MB5004.eurprd08.prod.outlook.com
 ([fe80::ad17:d322:720e:3ac0%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 10:05:44 +0000
From: Alan Hayward <Alan.Hayward@arm.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"damien.hedde@greensocs.com" <damien.hedde@greensocs.com>, Peter Maydell
	<peter.maydell@linaro.org>, Luis Machado <luis.machado@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "open list:ARM
 TCG CPUs" <qemu-arm@nongnu.org>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
	<philmd@redhat.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2 06/14] target/arm: use gdb_get_reg helpers
Thread-Topic: [PATCH v2 06/14] target/arm: use gdb_get_reg helpers
Thread-Index: AQHVqIKv65Q7cbxEuk+QAo74emkk/6emnxkA
Date: Mon, 2 Dec 2019 10:05:44 +0000
Message-ID: <42017B4E-E961-494C-A505-FCDA74EFB265@arm.com>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-7-alex.bennee@linaro.org>
 <987465d3-3b13-e675-9622-c13e2d5205c2@redhat.com>
In-Reply-To: <987465d3-3b13-e675-9622-c13e2d5205c2@redhat.com>
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
X-MS-Office365-Filtering-Correlation-Id: 689db253-2b20-43b5-a03e-08d7770f36c7
X-MS-TrafficTypeDiagnostic: DB8PR08MB4025:|HE1PR0801MB1835:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1835E2926D9B28EB6306749D97430@HE1PR0801MB1835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 0239D46DB6
X-Forefront-Antispam-Report-Untrusted:
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(14444005)(14454004)(66574012)(8936002)(256004)(6486002)(305945005)(33656002)(50226002)(7736002)(966005)(6916009)(6436002)(478600001)(25786009)(99286004)(3846002)(6116002)(6246003)(316002)(8676002)(71190400001)(6512007)(6306002)(54906003)(186003)(5660300002)(66066001)(4326008)(2906002)(66946007)(229853002)(66446008)(71200400001)(66556008)(64756008)(2616005)(26005)(91956017)(76116006)(11346002)(446003)(76176011)(102836004)(66476007)(36756003)(6506007)(55236004)(53546011)(86362001)(81166006)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB4025;H:DB8PR08MB5004.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wgYeFrYpxdOMj6rmPMWBMWKJLV/xf4HhpD/XMWPuxWywW04YYbVB6L3dwELW7LMTK+TaIqTw5xXdxIyO5rnmvQx5WWkL0zodGmjz0Rst7Gh+Ch9NWhLoow7oxEeeDzEJkyeV/yhGgUqwxLb3n4esF6Ff8jrE3xn39Eyzce+eK6qQQJRPt7nb+vjl1kWcrMKztGc6SxLepewnuNfOTUZIAD8b6cBs4BID9xyiLoK4o/fEdrMeMntYKshhB6NFFrZrMhyt+CCVvRQH+QqxqP5No8+1y1JNMDyPoEfaMvtiOh6TFLb/R9b3Q5qpSSHbHQfTxiu0JPAPNZAAFpSM5Eqp8IGcOlRhHCa8X1DvkdGBsqBIHnpvbmJNi84fu7cA36Inn+mYWHXTDmYWyFzi3Unw4kxfQfLRrpU3FzG3sYLkBxxkgFMkoUztVKnD6liowkhGZoh2+JSl9SjvUy/R26EKXi70Bk9AoE16Mxybmh3jdbk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A5533DF681C394798C0330437CA4B49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4025
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alan.Hayward@arm.com; 
Return-Path: Alan.Hayward@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(966005)(22756006)(106002)(229853002)(66066001)(6486002)(47776003)(76130400001)(50226002)(6246003)(14454004)(6116002)(50466002)(2906002)(8676002)(450100002)(70586007)(4326008)(86362001)(70206006)(26005)(53546011)(336012)(446003)(54906003)(66574012)(26826003)(436003)(478600001)(11346002)(186003)(3846002)(8936002)(33656002)(14444005)(81166006)(81156014)(6306002)(6512007)(23676004)(2486003)(2616005)(102836004)(6506007)(76176011)(5660300002)(36756003)(356004)(316002)(6916009)(99286004)(7736002)(305945005)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB1835;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f878f1cf-acd0-4e42-caf2-08d7770f3246
NoDisclaimer: True
X-Forefront-PRVS: 0239D46DB6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Q2qn0z04QD4vfzImhJMHDzoH9yROjI5aqJpRiTosUscMgfIO19pUTBuU4QsDNQp/PwgzLFLN1/NZ9LSonFArZ3kP7bG/tonXp3cE+5RwuqfXl3nQQFT/1Vptp/w6P/xYQOf9gpSmK2oaDqh4OEiPEuGmMO/n8jtk8FfBsSjvJWInzaN7sSwXRs5mOP7fsc9nE2kSUeyW5jUbhG0n87TM08AyS+jkdfBen5maxITQ/6zl/4Qeph9dMKuF6eFOmkWBXsXxXLrcvp9C0M0boJQ6cBVNYM9q6l+rpZ8bT1im5HScfAs0T1YdRIir/fYjPLrSRotSJ+5hljM2OIMadEB0Ci8f4fMc9v/51r/KH6YwIuyk4LnfFArNWMUyUqnUjR92W3qAobugvJABarbLTxas6htWc2VMWtjKnRLKmvD8rjH/OuECyKmAW3d0kbtD5dwgtRBuFCHMb9yhTO2ONTGa/1OmihpvRCKURe/dpUEQJU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 10:05:52.2430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689db253-2b20-43b5-a03e-08d7770f36c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1835
X-TUID: ZiXPtQ1yHBb0

DQoNCj4gT24gMSBEZWMgMjAxOSwgYXQgMjA6MDUsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxMS8zMC8xOSA5OjQ1IEFNLCBBbGV4
IEJlbm7DqWUgd3JvdGU6DQo+PiBUaGlzIGlzIGNsZWFuZXIgdGhhbiBwb2tpbmcgbWVtb3J5IGRp
cmVjdGx5IGFuZCB3aWxsIG1ha2UgbGF0ZXINCj4+IGNsZWFuLXVwcyBlYXNpZXIuDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+PiAtLS0N
Cj4+IHYyDQo+PiAgIC0gbWFrZSBzdXJlIHdlIHBhc3MgaGkvbG8gY29ycmVjdGx5IGFzIHF1YWRz
IGFyZSBzdG9yZWQgaW4gTEUgb3JkZXINCj4+IC0tLQ0KPj4gIHRhcmdldC9hcm0vaGVscGVyLmMg
fCAxOCArKysrKysrLS0tLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2hlbHBlci5j
IGIvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4gaW5kZXggMGJmOGY1M2Q0YjguLjBhYzk1MGQ2Yzcx
IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4gKysrIGIvdGFyZ2V0L2Fy
bS9oZWxwZXIuYw0KPj4gQEAgLTEwNSwyMSArMTA1LDE3IEBAIHN0YXRpYyBpbnQgYWFyY2g2NF9m
cHVfZ2RiX2dldF9yZWcoQ1BVQVJNU3RhdGUgKmVudiwgdWludDhfdCAqYnVmLCBpbnQgcmVnKQ0K
Pj4gIHsNCj4+ICAgICAgc3dpdGNoIChyZWcpIHsNCj4+ICAgICAgY2FzZSAwIC4uLiAzMToNCj4+
IC0gICAgICAgIC8qIDEyOCBiaXQgRlAgcmVnaXN0ZXIgKi8NCj4+IC0gICAgICAgIHsNCj4+IC0g
ICAgICAgICAgICB1aW50NjRfdCAqcSA9IGFhNjRfdmZwX3FyZWcoZW52LCByZWcpOw0KPj4gLSAg
ICAgICAgICAgIHN0cV9sZV9wKGJ1ZiwgcVswXSk7DQo+PiAtICAgICAgICAgICAgc3RxX2xlX3Ao
YnVmICsgOCwgcVsxXSk7DQo+PiAtICAgICAgICAgICAgcmV0dXJuIDE2Ow0KPj4gLSAgICAgICAg
fQ0KPj4gKyAgICB7DQo+PiArICAgICAgICAvKiAxMjggYml0IEZQIHJlZ2lzdGVyIC0gcXVhZHMg
YXJlIGluIExFIG9yZGVyICovDQo+IA0KPiBPaCwgdGhpcyB3YXMgYWx3YXlzIHdyb25nIG9uIEJF
IDooDQoNCkFtIEkgcmlnaHQgaW4gdGhpbmtpbmcgdGhpcyBwYXRjaCBjb3JyZWN0bHkgbWF0Y2hl
cyB0aGUgU1ZFIEJFIGNoYW5nZXMgZnJvbSBKdW5lPw0KDQpTcGVjaWZpY2FsbHksIHRoaXMgcGF0
Y2g6DQpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJtLWtlcm5l
bC8yMDE5LUp1bmUvNjU3ODI2Lmh0bWwNCg0KDQpBbGFuLg0KDQo+IA0KPiBSZXZpZXdlZC1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPg0KPiANCj4+ICsgICAg
ICAgIHVpbnQ2NF90ICpxID0gYWE2NF92ZnBfcXJlZyhlbnYsIHJlZyk7DQo+PiArICAgICAgICBy
ZXR1cm4gZ2RiX2dldF9yZWcxMjgoYnVmLCBxWzFdLCBxWzBdKTsNCj4+ICsgICAgfQ0KPj4gICAg
ICBjYXNlIDMyOg0KPj4gICAgICAgICAgLyogRlBTUiAqLw0KPj4gLSAgICAgICAgc3RsX3AoYnVm
LCB2ZnBfZ2V0X2Zwc3IoZW52KSk7DQo+PiAtICAgICAgICByZXR1cm4gNDsNCj4+ICsgICAgICAg
IHJldHVybiBnZGJfZ2V0X3JlZzMyKGJ1ZiwgdmZwX2dldF9mcHNyKGVudikpOw0KPj4gICAgICBj
YXNlIDMzOg0KPj4gICAgICAgICAgLyogRlBDUiAqLw0KPj4gLSAgICAgICAgc3RsX3AoYnVmLCB2
ZnBfZ2V0X2ZwY3IoZW52KSk7DQo+PiAtICAgICAgICByZXR1cm4gNDsNCj4+ICsgICAgICAgIHJl
dHVybiBnZGJfZ2V0X3JlZzMyKGJ1Zix2ZnBfZ2V0X2ZwY3IoZW52KSk7DQo+PiAgICAgIGRlZmF1
bHQ6DQo+PiAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgICAgfQ0KDQo=
