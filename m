Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3846007wrx;
        Sun, 31 Mar 2019 04:14:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwV+kACX4rXZ9hFJD1S2zZ+Sx+7cW0BtDcTqBO2hhpAhTdaHoISHt2FFAEzl/njGaAws0cN
X-Received: by 2002:a25:a28d:: with SMTP id c13mr13592345ybi.436.1554030898690;
        Sun, 31 Mar 2019 04:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554030898; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5mteEd72QmqtoucEzQCSc4cUGLDbDeJ9v0vBNg9q69abVgUQntwFoFmMohVxsaJox
         FhOHLHuD97tvxNs+7wnOjhkXNUBX5O2Ravz5k8a3RsHW0dD+wvPbteYtWveeNAx7tbNV
         1wAemLva/Iie//Cet4Z0NTLfMM8099xe+sPEb76gxq0ZDU93p6aUtFZ82z3G4sfNjpTJ
         uK5dCglFraLLIEyTT8OFcyMMZNu6fMlE1mJhdRad5sJUiYV7deng7/xFPnj8RVDlfyy1
         0yFyqiNdfAAhnULVYqdpEhFNuGwxGLzmQbI2F88uA0XYsILtyxTT0I0J1UGkXHcsBIqk
         8fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=9Os75TrWib+8p+/3z8udTC1ZidrjGnMvRcsF2Y4ikzA=;
        b=Urr0ve5NSnibMV5wIg4C7wR5uSgrs2OFodlSHvca7oVshsRadeh1m2QHwfdiGJumgG
         CxuB1dJ7MCLWT0ZJ9CcH4L8c9QIcObF9ArqkOTH2qMpYzA1bUsUqfyMnq+zGZfmAb8KG
         zd7c180720CN5ey6vvcsDHE2y2PjmqAdk2rWymjiBybXMJN2DwpRGdV4klvl5tFC7Fh/
         AfWtvnmnAYkY17rIAlRWsOXFkt5eRRCIs0xmGlVC1rBf7WdfjyNXc103Vb3SZkHThuhK
         DpQwyHsyiFt4VjM7w8U3lShm92kpGrHKLCySV0j0H95dIG3o+hSsOBhIlto+UCXQjYhT
         3PQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@deepvisionio.onmicrosoft.com header.s=selector1-deepvision-io header.b=f5ED+mhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h81si165613ywh.201.2019.03.31.04.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Mar 2019 04:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@deepvisionio.onmicrosoft.com header.s=selector1-deepvision-io header.b=f5ED+mhF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:56000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAYQU-0006pf-6F
	for alex.bennee@linaro.org; Sun, 31 Mar 2019 07:14:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ratna@deepvision.io>) id 1hAYQL-0006nY-Oj
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ratna@deepvision.io>) id 1hAYQK-0004Gf-Jx
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:14:49 -0400
Received: from mail-eopbgr730043.outbound.protection.outlook.com
	([40.107.73.43]:20480
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ratna@deepvision.io>) id 1hAYQK-00044w-2y
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deepvisionio.onmicrosoft.com; s=selector1-deepvision-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Os75TrWib+8p+/3z8udTC1ZidrjGnMvRcsF2Y4ikzA=;
	b=f5ED+mhFFOeSUqzNqkWzYnKdneNRQBrGFamn9YI79Aef97W1E4WVMFdlFbxpiPT3Tu2qHwKDqNL9oyoF1loImWyzDEF/YA8ZskDI6pPGQ2x9wz6p29MmWZ6QCii0BN7pvvK1eQxL+1WoFggZefQc42MGEAwN+bisOKYiAeUhej0=
Received: from BYAPR04MB5000.namprd04.prod.outlook.com (52.135.233.17) by
	BYAPR04MB5094.namprd04.prod.outlook.com (52.135.235.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Sun, 31 Mar 2019 11:14:31 +0000
Received: from BYAPR04MB5000.namprd04.prod.outlook.com
	([fe80::d80a:60fd:9a49:106f]) by
	BYAPR04MB5000.namprd04.prod.outlook.com
	([fe80::d80a:60fd:9a49:106f%3]) with mapi id 15.20.1750.017;
	Sun, 31 Mar 2019 11:14:31 +0000
From: ratna manoj <ratna@deepvision.io>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] Panic when PCI trying to read secure mem area.
Thread-Index: AQHU50bHpMHVlXNbqk2jp6ll1fBhLKYlVqyAgACcywA=
Date: Sun, 31 Mar 2019 11:14:31 +0000
Message-ID: <4B7E6FD4-D4C7-44FC-BC23-D30D26478E4B@deepvision.io>
References: <E280E863-EBA4-4011-A4EF-499FBF6219D5@deepvision.io>
	<CAFEAcA_q6-fTmSTAR-wGp0FSzzTOyQHEzU4VoYtfhgmFShgwaw@mail.gmail.com>
In-Reply-To: <CAFEAcA_q6-fTmSTAR-wGp0FSzzTOyQHEzU4VoYtfhgmFShgwaw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ratna@deepvision.io; 
x-originating-ip: [202.133.53.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d049e77-78a5-471d-2235-08d6b5ca0c4f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600127)(711020)(4605104)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5094; 
x-ms-traffictypediagnostic: BYAPR04MB5094:
x-microsoft-antispam-prvs: <BYAPR04MB50943A028215C255E5D97A71AA540@BYAPR04MB5094.namprd04.prod.outlook.com>
x-forefront-prvs: 0993689CD1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(136003)(396003)(366004)(39830400003)(346002)(376002)(189003)(199004)(6506007)(83716004)(36756003)(71190400001)(26005)(508600001)(2906002)(71200400001)(81156014)(81166006)(106356001)(316002)(8676002)(305945005)(33656002)(86362001)(7736002)(8936002)(3846002)(86152003)(68736007)(6512007)(14454004)(4326008)(6116002)(105586002)(53936002)(11346002)(6436002)(446003)(74482002)(82746002)(229853002)(76176011)(102836004)(256004)(6486002)(476003)(14444005)(99286004)(6246003)(2616005)(486006)(97736004)(66066001)(25786009)(5660300002)(6916009)(186003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR04MB5094;
	H:BYAPR04MB5000.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: deepvision.io does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DaCQsfsfAfYZMwuuqozFZM2pdDc3MDR/TJOEdLID9vP4bbhyBUyBN4LiBhOl+30iXW2P+E+DUlgKHIq4Bq3dNbdbWL5mqbsxUsr9NeVzRYybx4QwSZ0cx2GlBz1kqShf3wTGaW5VrFklhwrFSVB0wViJfvq9CKJGmMLO4fRFjDpL23MkRC1RDLhlUySQ6t/777PCiRF6JyFg8tCTw480wBIYj4Ox39a4zVKdOXRpkhONa9ubwkW4kgkQGSeNs3LFYT0MfisNa5AEcQ3O6WX7mW9Zv43De0RTjCL0sdzU/yGao0DTR9JHAR+lqujhRGoJ5ohDcng4/8FPanHlxzFf1yPglXF7Tf/+yNjwPhYw5P5NoSoHohMasnLk80n1zPzT0RM+p/JHW9ohiZjuOR0tK7Hry72oivAfIDIO+gR4igw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41CAEEAB7AD91F48A68FA80D042F3A7E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: deepvision.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d049e77-78a5-471d-2235-08d6b5ca0c4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2019 11:14:31.3277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1acf142f-18b1-451f-9734-4db9cf7f227e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.43
Subject: Re: [Qemu-arm] Panic when PCI trying to read secure mem area.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uI+4kkt1dWOA

SSBhbSB1c2luZyBsaW51eCBrZXJuZWwgNC40LjE1LiBVc2luZyBMUEFFIGNvbmZpZ3VyZWQga2Vy
bmVsIHJlc29sdmVkIHRoZSBpc3N1ZS4gDQpNYXkgYmUgd2UgbmVlZCB0byBzZXQgTFBBRSBpbiBs
aW51eC9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZy4NCg0KVGhhbmtzLg0KDQrv
u79PbiAzMS8wMy8xOSwgMTI6NTMgUE0sICJQZXRlciBNYXlkZWxsIiA8cGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnPiB3cm90ZToNCg0KICAgIE9uIFN1biwgMzEgTWFyIDIwMTkgYXQgMDU6MjIsIHJh
dG5hIG1hbm9qIDxyYXRuYUBkZWVwdmlzaW9uLmlvPiB3cm90ZToNCiAgICA+IEkgYW0gZ2V0dGlu
ZyBhIGtlcm5lbCBwYW5pYyB3aGVuIFBDSSBpcyB0cnlpbmcgdG8gcmVhZCBhdCAweGUwODgwMDAw
IGluIFZJUlRfU0VDVVJFX01FTSBhcmVhLiAoW1ZJUlRfU0VDVVJFX01FTV0gPSB7IDB4MGUwMDAw
MDAsIDB4MDEwMDAwMDAgfSkNCiAgICANCiAgICBIaS4gVGhlIGFkZHJlc3MgMHhlMDg4MDAwMCBp
cyBub3QgaW4gdGhlIHJhbmdlIHN0YXJ0aW5nIGF0DQogICAgICAgICAgICAgICAgICAgIDB4MGUw
MDAwMDANCiAgICAtLSBJIHN1c3BlY3QgeW91J3ZlIG1pc2NvdW50ZWQgeW91ciB6ZXJvZXMuIFNv
IHdoYXRldmVyIGlzIGdvaW5nDQogICAgd3JvbmcsIGl0J3MgcHJvYmFibHkgbm90IHRoZSBmYXVs
dCBvZiB0aGUgVklSVF9TRUNVUkVfTUVNIGJsb2NrLg0KICAgIA0KICAgIEkgc2VlIHlvdSd2ZSBh
bHJlYWR5IGZpZ3VyZWQgb3V0IHRoYXQgdGhlIGFuc3dlciBpcyB0byBwYXNzDQogICAgLW1hY2hp
bmUgaGlnaG1lbT1vZmYuIEJ5IGRlZmF1bHQgdGhlIHZpcnQgYm9hcmQgY3JlYXRlcw0KICAgIFBD
SSB3aW5kb3dzIGluIGFyZWFzIG9mIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgYWJvdmUgdGhlIDRH
QiBtYXJrDQogICAgYW5kIGFkdmVydGlzZXMgdGhlbSBpbiB0aGUgZGV2aWNlIHRyZWUuIFNvbWUg
b2xkZXIga2VybmVsIHZlcnNpb25zDQogICAgYXJlIGJ1Z2d5IHdoZW4gY29uZmlndXJlZCB3aXRo
b3V0IExQQUUgc3VwcG9ydCwgYW5kIGluc3RlYWQgb2YNCiAgICBjb3JyZWN0bHkgaWRlbnRpZnlp
bmcgdGhhdCB0aGV5IGNhbid0IHJlYWNoIHRoZXNlIFBDSSB3aW5kb3dzDQogICAgYW5kIGlnbm9y
aW5nIHRoZW0sIHRoZXkgdHJ1bmNhdGUgdGhlIGFkZHJlc3NlcyB0byAzMiBiaXRzIGFuZA0KICAg
IHRyeSB0byBhY2Nlc3MgUENJIGF0IGJvZ3VzIGFkZHJlc3Nlcy4gVGhlIG90aGVyIHdheXMgdG8g
Zml4IHRoaXMNCiAgICBhcmUgdG8gYnVpbGQgeW91ciBndWVzdCBrZXJuZWwgd2l0aCBMUEFFIHN1
cHBvcnQgZW5hYmxlZCwgb3IgdG8NCiAgICB1c2UgYSBuZXcgZW5vdWdoIGtlcm5lbCB0aGF0IGhh
cyB0aGUgYnVnIGZpeGVkLg0KICAgIA0KICAgIFBTOiBJIHJlY29tbWVuZCBhZ2FpbnN0IHVzaW5n
ICdzZWN1cmU9b24nIHVubGVzcyB5b3UgaGF2ZSBhDQogICAgc3BlY2lmaWMgc3Ryb25nIHJlYXNv
biB0byB3YW50IHRvIHJ1biBpbiB0aGUgU2VjdXJlIHdvcmxkLg0KICAgIFRoZSBleHBlY3RlZCBh
bmQgbW9yZSB0ZXN0ZWQgY29uZmlndXJhdGlvbiBmb3IgIkkganVzdCB3YW50DQogICAgdG8gYm9v
dCBhIExpbnV4IGd1ZXN0IiBpcyB0aGUgZGVmYXVsdCAoc2VjdXJlPW9mZikuDQogICAgDQogICAg
dGhhbmtzDQogICAgLS0gUE1NDQogICAgDQoNCg==
