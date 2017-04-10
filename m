Received: by 10.25.0.144 with SMTP id 138csp957162lfa;
        Mon, 10 Apr 2017 10:08:50 -0700 (PDT)
X-Received: by 10.200.57.162 with SMTP id v31mr60896721qte.173.1491844130575;
        Mon, 10 Apr 2017 10:08:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y62si896577qke.290.2017.04.10.10.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxco3-0000ga-Sp
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cxcnu-0000ep-D0
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cxcnq-0005zn-Dr
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:08:38 -0400
Received: from mail-sn1nam02on0133.outbound.protection.outlook.com
	([104.47.36.133]:19960
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1cxcnq-0005zc-57
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=CRg7dxXdAhLOLKA3b7eV/YsckSGz3R7W2a8oml2kerE=;
	b=S1VEI4TUII5/lQpuUIC0jSlXDB7gcIoZlAOgolM7gOdEZX3GlCD8tqYy2B7OKX33xU8aqGtkAw41JN/sSUkYwBQ/MOF/ArkJ3aT3LSVDvQdFh0MlfYY0gWypT+KhSvhWS55S0dXD+z7EIPW1mS2N1KMMOaD2KzuzzaHixc8qmEg=
Received: from DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) by
	DM2PR21MB0057.namprd21.prod.outlook.com (10.161.140.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.0; Mon, 10 Apr 2017 17:08:27 +0000
Received: from DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) by
	DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) with mapi id
	15.01.1047.000; Mon, 10 Apr 2017 17:08:27 +0000
To: Omar Rizwan <omar.rizwan@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH] raspi: Add Raspberry Pi 1 support
Thread-Index: AQHSsCsTEf3dQbLwekqJsp96j8QypKG69+5QgAAGKQCAA9Cy8IAACoWA
Date: Mon, 10 Apr 2017 17:08:26 +0000
Message-ID: <DM2PR21MB0060B58DF1CC6FCE1C24D8149E010@DM2PR21MB0060.namprd21.prod.outlook.com>
References: <20170408054318.19830-1-omar.rizwan@gmail.com>
	<DM2PR21MB00601A5A86C3F935CCCBAC0D9E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
	<CAJ=RBN+VF1ysQ39NELKY7dK75aMGcB-iDDGy_sFooC6pTf1rBw@mail.gmail.com>
	<DM2PR21MB00607B40448D581BDE2DA7D99E010@DM2PR21MB0060.namprd21.prod.outlook.com>
In-Reply-To: <DM2PR21MB00607B40448D581BDE2DA7D99E010@DM2PR21MB0060.namprd21.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:c::340]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM2PR21MB0057;
	7:rUu7VjZpLFXW1Rtc2sgx6tBFpaB8Iw90tlzgsLUsXB6y42tlOl/g96UW/9lyS+2k7T7tLunILjKmHTZOlBHcrPDVqwRGrFsdNnbWBD3KtuGIfpu//n8OphEhA+iIO/mkeEvSci+GUyTDW2TlD2VFA2zcubr+2fZPObW+1wGb+jFO61mlWm3eR9dIlqkOAvTM5XbNv2pQ4Y/wFkmJHT3guczlIDerial3h3dcGd1JKqXk8Pzz/+3YkBFg5xW/xQ+ZsXkXLbmsaK5ByxaUjfsrjU0lCtoNF5QpXbii5s4JzIU0xVusnS+tmfENU9W4c41CuahkbCz3lZGNCwSodT571LsB3fSj37JDkFTukSNM8uo=
x-ms-office365-filtering-correlation-id: c1d281aa-2946-4f4a-61ca-08d48034344f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM2PR21MB0057; 
x-microsoft-antispam-prvs: <DM2PR21MB00571E0FE9F39B4FE4F2B5EE9E010@DM2PR21MB0057.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(6055026)(61426038)(61427038)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:DM2PR21MB0057; BCL:0; PCL:0; RULEID:; SRVR:DM2PR21MB0057; 
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39860400002)(39400400002)(39850400002)(39840400002)(39450400003)(2950100002)(86612001)(86362001)(7696004)(2900100001)(122556002)(93886004)(106356001)(6436002)(54356999)(76176999)(50986999)(25786009)(7736002)(2501003)(39060400002)(4326008)(8990500004)(5660300001)(33656002)(74316002)(305945005)(6306002)(9686003)(55016002)(54906002)(99286003)(77096006)(6506006)(10090500001)(6246003)(38730400002)(10290500002)(5005710100001)(53936002)(8936002)(8676002)(81166006)(3660700001)(3280700002)(2906002)(6116002)(102836003)(229853002)(189998001)(12290500005)(15398625002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR21MB0057;
	H:DM2PR21MB0060.namprd21.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2017 17:08:26.8011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR21MB0057
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.133
Subject: Re: [Qemu-arm] [PATCH] raspi: Add Raspberry Pi 1 support
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: txKPPRTHcRZ6

PiBGcm9tOiBBbmRyZXcgQmF1bWFubg0KPiBTZW50OiBNb25kYXksIDEwIEFwcmlsIDIwMTcgMTA6
MDUNCj4gPiBGcm9tOiBPbWFyIFJpendhbiBbbWFpbHRvOm9tYXIucml6d2FuQGdtYWlsLmNvbV0N
Cj4gPiBTZW50OiBGcmlkYXksIDcgQXByaWwgMjAxNyAyMzoxMw0KDQo+ID4gSSBjYW4ndCBlYXNp
bHkgZmluZCBkb2N1bWVudGF0aW9uIGZvciB0aGF0IDB4NDAwMDAwMDAgbWVtb3J5IG1hcHBpbmcs
DQo+ID4gd2hpY2ggSSBmaWd1cmVkIEknZCBrZWVwIGluOyBzaG91bGQgaXQganVzdCBiZSByZW1v
dmVkIGZyb20gYmNtMjgzNT8NCj4gPiBBbSBJIG1pc3VuZGVyc3RhbmRpbmcgc29tZXRoaW5nPw0K
PiANCj4gVGhlIHZhcmlvdXMgbWFwcGluZyBhbGlhc2VzIGFyZSBpbnRlbmRlZCB0byBpbXBsZW1l
bnQgdGhlIGJ1cyBhZGRyZXNzZXMgZnJvbQ0KPiBTMS4yLjMgLyBmaWd1cmUgb24gcGFnZSA1IG9m
IHRoaXMgZG9jdW1lbnQ6DQo+IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLm9yZy93cC1jb250ZW50
L3VwbG9hZHMvMjAxMi8wMi9CQ00yODM1LUFSTS0NCj4gUGVyaXBoZXJhbHMucGRmDQo+IA0KPiBJ
biBBUk0gQ1BVIHBoeXNpY2FsIGFkZHJlc3NlcywgdGhlIFJBTSBpcyBtYXBwZWQgYXQgMCwgYW5k
IHRoZSBwZXJpcGhlcmFscyBhdA0KPiAweDIwMDAwMDAwDQo+IA0KPiBJbiBWQyBDUFUgYnVzIGFk
ZHJlc3NlcyAod2hpY2ggZ2V0IHVzZWQgZm9yIERNQSksIFJBTSBpcyBhbGlhc2VkIGZvdXIgdGlt
ZXMsDQo+IGF0IDAgMHg0MDAwMDAwMCAweDgwMDAwMDAwIGFuZCAweEMwMDAwMDAwLiBQZXJpcGhl
cmFscyBhcmUgYWxzbyBhbGlhc2VkDQo+IGZvdXIgdGltZXMgYXQgYSBmaXhlZCBvZmZzZXQgb2Yg
MHgzZTAwMDAwMCBmcm9tIHRoZSBiYXNlIG9mIHRoZSBSQU0gYWxpYXMsDQo+IHdoaWNoIGlzIGhv
dyB5b3UgZ2V0IHRoZSAweDdlMDAwMDAwIHBlcmlwaGVyYWwgYmFzZSAoMHg0MDAwMDAwMCArDQo+
IDB4M2UwMDAwMDApLg0KPiANCj4gVGhpcyBpcyBpbXBsZW1lbnRlZCBhcyBmb2xsb3dzOiBiY20y
ODM1X3BlcmlwaGVyYWxzIGltcGxlbWVudHMvZXhwb3J0cyBvbmUNCj4gbWVtb3J5IHJlZ2lvbiAi
cGVyaV9tciIgd2hpY2ggY29udGFpbnMganVzdCB0aGUgcGVyaXBoZXJhbHMuIEl0IGFsc28gYnVp
bGRzIGENCj4gcHJpdmF0ZSBNUiBmb3IgdGhlIEdQVSAoIlZDIENQVSIgaW4gdGhlIHNwZWMpIGJ1
cyBhZGRyZXNzZXMsICJncHVfbXIiLCBhbmQNCj4gYWxpYXNlcyBSQU0gaW50byBpdCBmb3VyIHRp
bWVzIGFsb25nIHdpdGggdGhlIHBlcmlwaGVyYWwgTVIgYXQNCj4gQkNNMjgzNV9WQ19QRVJJX0JB
U0UgKDB4N2UwMDAwMDApLiBJdHMgcGFyZW50LCBkZXZpY2UsIGVpdGhlciBiY20yODM1IG9yDQo+
IGJjbTI4MzYsIG1hcHMgdGhlIHBlcmlwaGVyYWwgTVIgaW50byB0aGUgZGVmYXVsdCBzeXNidXMg
bW1pbyBidXMgKGkuZS4sIHRoZQ0KPiBDUFUncyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlKSBhdCB0
aGUgcmVsZXZhbnQgQ1BVIHBoeXNpY2FsIGJhc2UgYWRkcmVzcw0KPiAoMHgyMDAwMDAwMCBvbiBw
aTEsIDB4M0YwMDAwMDAgb24gcGkyKS4NCj4gDQo+IE5vdywgYXMgdG8gd2h5IHRoZSBtYXBwaW5n
IGNhbGwgZmFpbHM6IEknbSBjb25mdXNlZCB3aGVyZSB5b3Ugc2F3IHRoYXQgY2FsbA0KPiB3aXRo
IHRoZSAweDQwMDAwMDAwIGFkZHJlc3MuIFRoZSBjb2RlIGluIG15IHRyZWUgZm9yIGJjbTI4MzUu
YyBpczoNCj4gDQo+IC8qIFBlcmlwaGVyYWwgYmFzZSBhZGRyZXNzIHNlZW4gYnkgdGhlIENQVSAq
Lw0KPiAjZGVmaW5lIEJDTTI4MzVfUEVSSV9CQVNFICAgICAgIDB4MjAwMDAwMDANCj4gLi4uDQo+
ICAgICBzeXNidXNfbW1pb19tYXBfb3ZlcmxhcChTWVNfQlVTX0RFVklDRSgmcy0+cGVyaXBoZXJh
bHMpLCAwLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQkNNMjgzNV9QRVJJX0JBU0Us
IDEpOw0KDQpPaywgSSBqdXN0IGxvb2tlZCBhdCB5b3VyIHBhdGNoLCBhbmQgaXQgbG9va3MgbGlr
ZSB5b3UgYWRkZWQgdGhlIDB4NDAwMDAwMDAgbWFwcGluZy4gSXQncyBkZWZpbml0ZWx5IG5vdCBp
biBteSB0cmVlIChodHRwczovL2dpdGh1Yi5jb20vMHhhYnUvcWVtdS9ibG9iL3Jhc3BpL2h3L2Fy
bS9iY20yODM1LmMpLiBJIHdvdWxkIHN1Z2dlc3QgdGFraW5nIGl0IGJhY2sgb3V0IGFnYWluIGFu
ZCBzYW5pdHktY2hlY2tpbmcgeW91ciBwYXRjaCBhZ2FpbnN0IHRoZSBjb2RlIGluIG15IHRyZWUg
Zm9yIGFueSBvdGhlciBzcHVyaW91cyBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgc251Y2sgaW4uLi4N
Cg0KQW5kcmV3DQo=
