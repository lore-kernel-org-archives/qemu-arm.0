Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp989208wrt;
        Tue, 27 Nov 2018 00:43:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WQuWxuEnygCouHNxTezQPwnGFgkcIiMcn8N51khxHUGBdSg5pzh9v+PLcnmW4/T9rj6YQW
X-Received: by 2002:a25:c7cd:: with SMTP id w196-v6mr32914723ybe.136.1543308208933;
        Tue, 27 Nov 2018 00:43:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543308208; cv=none;
        d=google.com; s=arc-20160816;
        b=v+QYg9OsG5yRoa5D4jqIXn1gmJA6myU1q0epLucmcIEvFsI+wPo01y6OM4mgkiT8nS
         ltjvHQloRgbuTgUW0pFHLv1xQSkJafXSveu/x1leCX9M9oYRdvA/9PjBnC7wfFBzFemH
         5w5kQIl/mq6rlvOhZ8D6tK+7FLe9BheVnWg15wjo5A2YL2HKhQmDbK+s1l3uELWNKBC5
         H45qDIIwOL95eAwwryiqmy+ADoAcVw08n6RuxY8WvBF17/ELVO61vLHgOw99V2U1IH1k
         +YbdxZO2tli0DaPt/nx8OIZpzGPePyT/iM8mkMRjdrJIfs/VRQ9iCPt2GEXRUmFQrG3T
         sZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=Z3ajRFtgqKVQWgHQEbCG95pE979uA6pMCwAWHZcBX6A=;
        b=Q+R5Qm4TWteqjmOM/Til44DdRNNseb5lwq/HNVCEbws56ofjBZPzUl7D01NINb5t9Z
         et6x3qiM0dckw6rw1Zh0r+aU9LIxXQFmdkc0rOMbSbb0bwjERvkmGEn8iXxHOtwpAA2F
         SshfKxLjzpczSfzkmC9MPUNvnA05TdAi36x66Ci8RGZMAUoH428p2Ic6Wi0EP+B8V+Bu
         bBbjE8XtrYQHW9cFFk409jcEGdrIMx92PwXjDp7Syjsv9TGU3GSUedCDWOWhFVP5FdxN
         q7k/iJrMuzQcLZr4f+OfFCOE65kogdfqdr4IR6qAeAifz3otIgzfvKTCd94PnqDj3lL5
         g84g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=LKz2OCZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n188si2135744ywc.221.2018.11.27.00.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 00:43:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com header.s=selector1-nokia-com header.b=LKz2OCZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:40700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRYxs-0007Xq-Cw
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 03:43:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRYxg-0007Wu-H9
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 03:43:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ricardo.perez_blanco@nokia.com>) id 1gRYxY-0000Od-Vu
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 03:43:14 -0500
Received: from mail-eopbgr30123.outbound.protection.outlook.com
	([40.107.3.123]:21808
	helo=EUR03-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ricardo.perez_blanco@nokia.com>)
	id 1gRYxY-0000NT-P6; Tue, 27 Nov 2018 03:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Z3ajRFtgqKVQWgHQEbCG95pE979uA6pMCwAWHZcBX6A=;
	b=LKz2OCZfEOcw58MR0Y6DyOgdmYzMMtEa9Dm9lXOQmgtWTgOrQRp8OVzHso8UPUgvTSeQpa2lzGYxu086ICHeYonQInG305xNiIaMo6ctDuz7s3P79rok8pNKu+8MVUdLww/br2mw37DjDKjkzVaX0/3g8foaPWGRR7Fjlm2RVsY=
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com (20.177.199.157) by
	AM6PR07MB5495.eurprd07.prod.outlook.com (20.178.89.88) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.6; Tue, 27 Nov 2018 08:43:06 +0000
Received: from AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f]) by AM6PR07MB5368.eurprd07.prod.outlook.com
	([fe80::983:19fd:7bdd:792f%4]) with mapi id 15.20.1382.012;
	Tue, 27 Nov 2018 08:43:06 +0000
From: "Perez Blanco, Ricardo (Nokia - BE/Antwerp)"
	<ricardo.perez_blanco@nokia.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH] [PATCH] Allow AArch64 processors to boot from a kernel
	placed over 4GB.
Thread-Index: AQHUhbxnS9dtkA7x9k+jVDOL/dG4DaVig6QAgADKvyA=
Date: Tue, 27 Nov 2018 08:43:06 +0000
Message-ID: <AM6PR07MB536866E0CCDADD411210C7EBB3D00@AM6PR07MB5368.eurprd07.prod.outlook.com>
References: <20181126191454.9455-1-ricardo.perez_blanco@nokia.com>
	<CAFEAcA8MZD1nBPqtPEX91v97si5_MgjXUCPOiJd-tzBg5KvF8g@mail.gmail.com>
In-Reply-To: <CAFEAcA8MZD1nBPqtPEX91v97si5_MgjXUCPOiJd-tzBg5KvF8g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ricardo.perez_blanco@nokia.com; 
x-originating-ip: [135.245.212.63]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR07MB5495;
	6:bqpToRI9oUHb95OR9402+sMJyTrtxpclWjJue3LOZVWaJt0rIWINju9TL4jMEmXYtwyQAScf7gtgtxwLPX/kSGAMKFBXSzCSldyZBCC2d9P8txX2uH+Lw1x1S/DECzK2sNBnnRY0yNdWTiaaASz6vlgAx/M5n9vzCxBxGimWWvFkO0ugs08X/gLmiV7v2wbm4vT19utqXrGvB1edqJOGhMsbiWmpde8qxuXHUP49GL1MLPNPOfXOfNyTzn0N09Cyc8oHfa35gGSt5jejSlb4YaCb7YIDOO8ZtyoGCfJYKT/ltuRZ3rTasQnCsFkAX2MOtgmwR46wKKJ6bzEkoxGRPzUi21LgT5N+a6+7U6Bez3JUkJ3IFLYMWPipBe2O+l5q6zB4Z30tDU8q3Pi7Cr8YacEbGx4b/lOwSypw49ekjNdJhCRXy40sOIxJ8gKpVCGXIud9NkfkLXtL8fF042L3+A==;
	5:Gg65Yk46MXMcNslsY6RDHr7pxURXXuaUTdGlOVPrlPZljYxqh2/LlZ0+YQ8qomeFindFZvTR9soTdZLA7Svy3whDmuhHG6AmgN2BWwgnkTPNPgX2Sh548u+ujR+IKdj4WPckYjGAK5E9CWeQU+sEeDkbxcr98APTGQtyuW1D92o=;
	7:doxoTsi7kYriH3yUM5pCXQeePcUDzWFhjikUDOs2LTuSS8sz/7kzTlLYTN1n5UU2RvBM/itRax5pg9JPYYb62ODzWgJNaTGxv2FngcfL/zjrVZkjUGI6vSWe+jm5rQrV1vxfT0hRZ1XAm4VcN54Gbg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0394ca60-bd83-4c46-3b2c-08d654445a23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR07MB5495; 
x-ms-traffictypediagnostic: AM6PR07MB5495:
x-microsoft-antispam-prvs: <AM6PR07MB5495A61DA1B6CDF84AFDD249B3D00@AM6PR07MB5495.eurprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231443)(11241501185)(806100)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR07MB5495; BCL:0; PCL:0; RULEID:; SRVR:AM6PR07MB5495; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(136003)(39860400002)(376002)(366004)(13464003)(199004)(189003)(6436002)(229853002)(76176011)(316002)(102836004)(66066001)(86362001)(6916009)(97736004)(6506007)(2906002)(53546011)(54906003)(26005)(186003)(478600001)(53936002)(476003)(25786009)(55016002)(4326008)(6246003)(33656002)(9686003)(11346002)(106356001)(105586002)(7696005)(99286004)(446003)(39060400002)(6116002)(486006)(3846002)(5660300001)(81156014)(71190400001)(81166006)(71200400001)(305945005)(68736007)(7736002)(256004)(8676002)(8936002)(74316002)(14454004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB5495;
	H:AM6PR07MB5368.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: YcyJLd44dyYpRcQPB5bazC9g78qH9gXr3E9ORPMk78+tOwgxgEv6ziJl6XgmhdtIxkR1eWktOaRRn/bt59cKkmHNhQVJpDnYKAlQpYgTFxwk2dI4dFjncEpWEXFW+2B9huRsFv7sh28MBWsXVlB8sP8D8zQKiIK90YcBpLpNgOpaoA+0boy1sFxmX1jHX5cPdjU/HN7qqTroi2vu6d9TP9HrpHY2esUW/GZ0sEfgpivUYQtFmbZARGh/Lw6CBqVxsHEZDdYIFdlYB+JIcsiuEXipchtUTDb/uz4vSimWQT5C4cPoYwUg20m6r4R/zpEUSbaoP6iXml3QJOnGDtItdj2dHlN6+TcSPKg3RH9J8CY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0394ca60-bd83-4c46-3b2c-08d654445a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 08:43:06.5541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5495
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.3.123
Subject: Re: [Qemu-arm] [PATCH] [PATCH] Allow AArch64 processors to boot
 from a kernel placed over 4GB.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "ricardoperezblanco@gmail.com" <ricardoperezblanco@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IybdilKyeXPc

SGkgUGV0ZXIsDQoNCkFGQUlLLCB0aGVyZSBpcyBubyBib2FyZCBpbiBRRU1VIHRoYXQgaGFzIGl0
cyBtZW1vcnkgb3ZlciA0R2lCLCBob3dldmVyLCB3ZSBhcmUgd29ya2luZyBpbiBzb21lIHByb3Rv
dHlwZXMgYW5kIHByb29mIG9mIGNvbmNlcHRzIG9mIGJvYXJkcyB3aXRoIG1lbW9yeSBvdmVyIDRH
aUIuDQoNCktpbmQgcmVnYXJkcywNCg0KUmljYXJkbw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4N
Cj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyNiwgMjAxOCA5OjM1IFBNDQo+IFRvOiBQZXJleiBC
bGFuY28sIFJpY2FyZG8gKE5va2lhIC0gQkUvQW50d2VycCkNCj4gPHJpY2FyZG8ucGVyZXpfYmxh
bmNvQG5va2lhLmNvbT4NCj4gQ2M6IHJpY2FyZG9wZXJlemJsYW5jb0BnbWFpbC5jb207IHFlbXUt
YXJtIDxxZW11LWFybUBub25nbnUub3JnPjsNCj4gUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVs
QG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtQQVRDSF0gQWxsb3cgQUFyY2g2
NCBwcm9jZXNzb3JzIHRvIGJvb3QgZnJvbSBhIGtlcm5lbA0KPiBwbGFjZWQgb3ZlciA0R0IuDQo+
IA0KPiBPbiBNb24sIDI2IE5vdiAyMDE4IGF0IDE5OjE1LCBQZXJleiBCbGFuY28sIFJpY2FyZG8g
KE5va2lhIC0NCj4gQkUvQW50d2VycCkgPHJpY2FyZG8ucGVyZXpfYmxhbmNvQG5va2lhLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBTb21lIG1hY2hpbmUgYmFzZWQgb24gQUFyY2g2NCBjYW4gaGF2ZSBp
dHMgbWFpbiBtZW1vcnkgb3ZlciA0R0JzLiBXaXRoDQo+ID4gdGhlIGN1cnJlbnQgcGF0aCwgdGhl
c2UgbWFjaGluZXMgY2FuIHN1cHBvcnQgIi1rZXJuZWwiIGluIHFlbXUNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFJpY2FyZG8gUGVyZXogQmxhbmNvIDxyaWNhcmRvLnBlcmV6X2JsYW5jb0Bub2tp
YS5jb20+DQo+IA0KPiBEb2VzIHRoaXMgZml4IGFuIGlzc3VlIHdpdGggb25lIG9mIHRoZSBjdXJy
ZW50IGJvYXJkcyB3ZSBoYXZlIGluIFFFTVU/IEkgdGhpbmsNCj4gdGhleSBhbGwgaGF2ZSBSQU0g
YmVsb3cgNEdCLi4uDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=
