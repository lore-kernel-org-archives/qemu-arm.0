Received: by 10.25.0.144 with SMTP id 138csp955642lfa;
        Mon, 10 Apr 2017 10:05:16 -0700 (PDT)
X-Received: by 10.55.149.70 with SMTP id x67mr20047665qkd.48.1491843916878;
        Mon, 10 Apr 2017 10:05:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i61si13951741qtd.212.2017.04.10.10.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxckc-0000F5-AL
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:05:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cxckU-0000CY-0Y
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1cxckQ-0004lP-09
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:05:06 -0400
Received: from mail-sn1nam02on0121.outbound.protection.outlook.com
	([104.47.36.121]:11776
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1cxckP-0004l0-Jo
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Ga0WAL1iGk2taxdb1STsxDFQeA+hEuzl9bBy9sR0Z8o=;
	b=ob9iw6c4bItu7wH9CCMQis/ngM0+E+fETTmQlvPu+SI9sAnfwWLz5CDXi0HYs47DfV5KSRX/GMXldeW3qKj2Lz8OEZUZCARg0kMtCtqoalIR6OEOSyKJun2jf0taWFS/TZ4xmO0GkmIGBMEqwngh+7P5vXxmGUm3/70BZFd+1pw=
Received: from DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) by
	DM2PR21MB0057.namprd21.prod.outlook.com (10.161.140.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.0; Mon, 10 Apr 2017 17:04:58 +0000
Received: from DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) by
	DM2PR21MB0060.namprd21.prod.outlook.com ([10.161.140.26]) with mapi id
	15.01.1047.000; Mon, 10 Apr 2017 17:04:58 +0000
To: Omar Rizwan <omar.rizwan@gmail.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH] raspi: Add Raspberry Pi 1 support
Thread-Index: AQHSsCsTEf3dQbLwekqJsp96j8QypKG69+5QgAAGKQCAA9Cy8A==
Date: Mon, 10 Apr 2017 17:04:57 +0000
Message-ID: <DM2PR21MB00607B40448D581BDE2DA7D99E010@DM2PR21MB0060.namprd21.prod.outlook.com>
References: <20170408054318.19830-1-omar.rizwan@gmail.com>
	<DM2PR21MB00601A5A86C3F935CCCBAC0D9E0F0@DM2PR21MB0060.namprd21.prod.outlook.com>
	<CAJ=RBN+VF1ysQ39NELKY7dK75aMGcB-iDDGy_sFooC6pTf1rBw@mail.gmail.com>
In-Reply-To: <CAJ=RBN+VF1ysQ39NELKY7dK75aMGcB-iDDGy_sFooC6pTf1rBw@mail.gmail.com>
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
	7:C2UC8CblkFuzs4iDnTa6d8N5qOQjfqX+MZiWjbluKJhMmtFmkrnTu/bwSgwxzhwTkT79K51th2TmlFhE1TbCY7+hEnr42DMHY8+X/wbwFhIKKfRmSr2x3GGM2daIovl+tfTdzIV7rK4ity9/cQhX7bdCq4HYe92u2SqDADG6uAgShJAaMysO3SMB69MJXI7WjauVgOER123H7odzDx8IypOkCIm7gItVch3vY/3SVvj6SvM0PpCHi09B/HlNkyhwrK3iXlwmLI/ATdr18f+UAjDLlvcNLsxkXigeilH8nf2Ko3T8NynRvTiIxkgsLk07CgIXT0m4fX3ecOSQuZzIFEcByW2S/qyeu10LfdgCqww=
x-ms-office365-filtering-correlation-id: 9fa326d9-9855-4e61-ee0c-08d48033b7ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM2PR21MB0057; 
x-microsoft-antispam-prvs: <DM2PR21MB00570A8C9AB4B3EFED58CEB19E010@DM2PR21MB0057.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(6055026)(61426038)(61427038)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(6072148);
	SRVR:DM2PR21MB0057; BCL:0; PCL:0; RULEID:; SRVR:DM2PR21MB0057; 
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39860400002)(39400400002)(39850400002)(39840400002)(39450400003)(377454003)(24454002)(2950100002)(86612001)(86362001)(7696004)(2900100001)(122556002)(106356001)(6436002)(54356999)(76176999)(50986999)(25786009)(53546009)(7736002)(2501003)(39060400002)(4326008)(8990500004)(5660300001)(33656002)(74316002)(305945005)(6306002)(9686003)(55016002)(54906002)(99286003)(77096006)(6506006)(10090500001)(6246003)(38730400002)(10290500002)(5005710100001)(53936002)(8936002)(8676002)(81166006)(3660700001)(3280700002)(2906002)(6116002)(102836003)(229853002)(189998001)(12290500005)(15398625002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR21MB0057;
	H:DM2PR21MB0060.namprd21.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2017 17:04:57.7343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR21MB0057
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.121
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
X-TUID: 9i15zXIiYv7d

PiBGcm9tOiBPbWFyIFJpendhbiBbbWFpbHRvOm9tYXIucml6d2FuQGdtYWlsLmNvbV0NCj4gU2Vu
dDogRnJpZGF5LCA3IEFwcmlsIDIwMTcgMjM6MTMNCj4gT24gRnJpLCBBcHIgNywgMjAxNyBhdCAx
MDo1NyBQTSBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNvbT4g
d3JvdGU6DQo+ID4gPiBGcm9tOiBPbWFyIFJpendhbiBbbWFpbHRvOm9tYXIucml6d2FuQGdtYWls
LmNvbV0NCj4gPiA+IFNlbnQ6IEZyaWRheSwgNyBBcHJpbCAyMDE3IDIyOjQzDQoNCj4gPiBEaWQg
eW91IGRvIGFueSB0ZXN0aW5nIG9mIHRoaXM/IE9uZSBvZiB0aGUgcmVhc29ucyBJIG5ldmVyIGdv
dCBhcm91bmQgdG8NCj4gdXBzdHJlYW1pbmcgdGhpcyB3YXMgdGhhdCBJIGNvdWxkbid0IGdldCBS
YXNwYmlhbiB3b3JraW5nIHJlbGlhYmx5ICh0aGVyZSB3YXMNCj4gc29tZSBwcm9ibGVtIHdpdGgg
c3RhbGxlZCBETUEgcmVhZHMgZnJvbSB0aGUgTU1DIGNvbnRyb2xsZXIpLCBhbmQgSSBkaWRuJ3QN
Cj4gaGF2ZSB0aGUgY3ljbGVzIHRvIGRlYnVnIGl0IGZ1cnRoZXIuIEFsc28sIElJUkMgUmFzcGJp
YW4gb24gcGkxIGRlcGVuZGVkIG9uIHRoZQ0KPiBzeXN0ZW0gdGltZXIgZGV2aWNlcywgc28gaXQg
bWlnaHQgbm90IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGlzIGJvYXJkLWxldmVsDQo+IHN1cHBvcnQg
d2l0aG91dCBhZGRpbmcgdGhhdCBmaXJzdC4NCj4gDQo+IEkgZGlkIHRlc3QgUmFzcGJpYW4gb24g
dGhlIHJhc3BpIG1hY2hpbmUgYW5kIG1heWJlIGVuY291bnRlcmVkIHRoZQ0KPiBzYW1lIGlzc3Vl
IHlvdSBkaWQgKG9yLCBtb3JlIGxpa2VseSwgYSBzeXN0aW1lciByZWxhdGVkIGlzc3VlKTsNCj4g
aXQgd291bGQganVzdCBoYW5nIGluIGEgbG9vcCB3aXRoIHByb2dyYW0gY291bnRlciBhdCAweEMw
MDBBMDAwLg0KPiANCj4gQnV0IG15IHVzZSBmb3IgdGhpcyBpcyBiYXJlLW1ldGFsIGNvZGUsIHdo
aWNoIHdvcmtzIE9LLg0KPiAoSXMgdGhlcmUgc29tZSBzdGFuZGFyZCB0aGF0IHRoZSBtYWNoaW5l
IHNob3VsZCBydW4gTGludXggYmVmb3JlDQo+IGdldHRpbmcgdXBzdHJlYW1lZD8pDQoNCk5vLCBJ
IGRvbid0IGtub3cgb2Ygc3VjaCBhIHN0YW5kYXJkLCBidXQgaXQncyBwcm9iYWJseSB3b3J0aCBu
b3RpbmcgdGhlIGxpbWl0YXRpb25zIGluIHRoZSBjb21taXQgbWVzc2FnZS4gQW5kIGl0IG1pZ2h0
IGV2ZW4gYmUgd29ydGggcHV0dGluZyB0aGUgc3lzdGltZXJzIGZpcnN0Li4uDQoNCj4gSSdkIGxp
a2UgdG8gdXBzdHJlYW0gdGhlIHN5c3RlbSB0aW1lciBuZXh0LCBhbnl3YXkuDQoNClNvdW5kcyBn
b29kLg0KDQo+ID4gPiAtLS0gYS9ody9hcm0vYmNtMjgzNV9wZXJpcGhlcmFscy5jDQo+ID4gPiAr
KysgYi9ody9hcm0vYmNtMjgzNV9wZXJpcGhlcmFscy5jDQo+ID4gPiBAQCAtMzQsNiArMzQsNyBA
QCBzdGF0aWMgdm9pZCBiY20yODM1X3BlcmlwaGVyYWxzX2luaXQoT2JqZWN0ICpvYmopDQo+ID4g
PiAgICAgIC8qIEludGVybmFsIG1lbW9yeSByZWdpb24gZm9yIHBlcmlwaGVyYWwgYnVzIGFkZHJl
c3NlcyAobm90IGV4cG9ydGVkKSAqLw0KPiA+ID4gICAgICBtZW1vcnlfcmVnaW9uX2luaXQoJnMt
PmdwdV9idXNfbXIsIG9iaiwgImJjbTI4MzUtZ3B1IiwgKHVpbnQ2NF90KTENCj4gPDwNCj4gPiA+
IDMyKTsNCj4gPiA+ICAgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9jaGlsZChvYmosICJncHUtYnVz
IiwgT0JKRUNUKCZzLT5ncHVfYnVzX21yKSwNCj4gPiA+IE5VTEwpOw0KPiA+ID4gKyAgICBzeXNi
dXNfaW5pdF9tbWlvKFNZU19CVVNfREVWSUNFKHMpLCAmcy0+Z3B1X2J1c19tcik7DQo+ID4gPg0K
PiA+ID4gICAgICAvKiBJbnRlcm5hbCBtZW1vcnkgcmVnaW9uIGZvciByZXF1ZXN0L3Jlc3BvbnNl
IGNvbW11bmljYXRpb24gd2l0aA0KPiA+ID4gICAgICAgKiBtYWlsYm94LWFkZHJlc3NhYmxlIHBl
cmlwaGVyYWxzIChub3QgZXhwb3J0ZWQpDQo+ID4NCj4gPiBUaGlzIGxpbmUgbG9va3MgbGlrZSBp
dCBtaWdodCBoYXZlIHNudWNrIGluIGJ5IGFjY2lkZW50Pw0KPiANCj4gDQo+IERvIHlvdSByZWNh
bGwgd2h5IHRoYXQgbGluZSB3YXMgcmVtb3ZlZD8gYmNtMjgzNV9yZWFsaXplIGZhaWxzIHdpdGhv
dXQNCj4gaXQsIGJlY2F1c2UgdGhlIHNlY29uZCBzeXNidXNfbW1pb19tYXBfb3ZlcmxhcCBjYWxs
DQo+IA0KPiBzeXNidXNfbW1pb19tYXBfb3ZlcmxhcChTWVNfQlVTX0RFVklDRSgmcy0+cGVyaXBo
ZXJhbHMpLCAxLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg0MDAwMDAwMCwgMSk7
DQo+IA0KPiBmYWlscyB0aGlzIGFzc2VydGlvbiBpbiBzeXNidXMuYywgaW4gc3lzYnVzX21taW9f
bWFwX2NvbW1vbjoNCj4gDQo+IGFzc2VydChuID49IDAgJiYgbiA8IGRldi0+bnVtX21taW8pOw0K
PiANCj4gSSBjYW4ndCBlYXNpbHkgZmluZCBkb2N1bWVudGF0aW9uIGZvciB0aGF0IDB4NDAwMDAw
MDAgbWVtb3J5IG1hcHBpbmcsDQo+IHdoaWNoIEkgZmlndXJlZCBJJ2Qga2VlcCBpbjsgc2hvdWxk
IGl0IGp1c3QgYmUgcmVtb3ZlZCBmcm9tIGJjbTI4MzU/DQo+IEFtIEkgbWlzdW5kZXJzdGFuZGlu
ZyBzb21ldGhpbmc/DQoNClRoZSB2YXJpb3VzIG1hcHBpbmcgYWxpYXNlcyBhcmUgaW50ZW5kZWQg
dG8gaW1wbGVtZW50IHRoZSBidXMgYWRkcmVzc2VzIGZyb20gUzEuMi4zIC8gZmlndXJlIG9uIHBh
Z2UgNSBvZiB0aGlzIGRvY3VtZW50Og0KaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkub3JnL3dwLWNv
bnRlbnQvdXBsb2Fkcy8yMDEyLzAyL0JDTTI4MzUtQVJNLVBlcmlwaGVyYWxzLnBkZg0KDQpJbiBB
Uk0gQ1BVIHBoeXNpY2FsIGFkZHJlc3NlcywgdGhlIFJBTSBpcyBtYXBwZWQgYXQgMCwgYW5kIHRo
ZSBwZXJpcGhlcmFscyBhdCAweDIwMDAwMDAwDQoNCkluIFZDIENQVSBidXMgYWRkcmVzc2VzICh3
aGljaCBnZXQgdXNlZCBmb3IgRE1BKSwgUkFNIGlzIGFsaWFzZWQgZm91ciB0aW1lcywgYXQgMCAw
eDQwMDAwMDAwIDB4ODAwMDAwMDAgYW5kIDB4QzAwMDAwMDAuIFBlcmlwaGVyYWxzIGFyZSBhbHNv
IGFsaWFzZWQgZm91ciB0aW1lcyBhdCBhIGZpeGVkIG9mZnNldCBvZiAweDNlMDAwMDAwIGZyb20g
dGhlIGJhc2Ugb2YgdGhlIFJBTSBhbGlhcywgd2hpY2ggaXMgaG93IHlvdSBnZXQgdGhlIDB4N2Uw
MDAwMDAgcGVyaXBoZXJhbCBiYXNlICgweDQwMDAwMDAwICsgMHgzZTAwMDAwMCkuDQoNClRoaXMg
aXMgaW1wbGVtZW50ZWQgYXMgZm9sbG93czogYmNtMjgzNV9wZXJpcGhlcmFscyBpbXBsZW1lbnRz
L2V4cG9ydHMgb25lIG1lbW9yeSByZWdpb24gInBlcmlfbXIiIHdoaWNoIGNvbnRhaW5zIGp1c3Qg
dGhlIHBlcmlwaGVyYWxzLiBJdCBhbHNvIGJ1aWxkcyBhIHByaXZhdGUgTVIgZm9yIHRoZSBHUFUg
KCJWQyBDUFUiIGluIHRoZSBzcGVjKSBidXMgYWRkcmVzc2VzLCAiZ3B1X21yIiwgYW5kIGFsaWFz
ZXMgUkFNIGludG8gaXQgZm91ciB0aW1lcyBhbG9uZyB3aXRoIHRoZSBwZXJpcGhlcmFsIE1SIGF0
IEJDTTI4MzVfVkNfUEVSSV9CQVNFICgweDdlMDAwMDAwKS4gSXRzIHBhcmVudCwgZGV2aWNlLCBl
aXRoZXIgYmNtMjgzNSBvciBiY20yODM2LCBtYXBzIHRoZSBwZXJpcGhlcmFsIE1SIGludG8gdGhl
IGRlZmF1bHQgc3lzYnVzIG1taW8gYnVzIChpLmUuLCB0aGUgQ1BVJ3MgcGh5c2ljYWwgYWRkcmVz
cyBzcGFjZSkgYXQgdGhlIHJlbGV2YW50IENQVSBwaHlzaWNhbCBiYXNlIGFkZHJlc3MgKDB4MjAw
MDAwMDAgb24gcGkxLCAweDNGMDAwMDAwIG9uIHBpMikuDQoNCk5vdywgYXMgdG8gd2h5IHRoZSBt
YXBwaW5nIGNhbGwgZmFpbHM6IEknbSBjb25mdXNlZCB3aGVyZSB5b3Ugc2F3IHRoYXQgY2FsbCB3
aXRoIHRoZSAweDQwMDAwMDAwIGFkZHJlc3MuIFRoZSBjb2RlIGluIG15IHRyZWUgZm9yIGJjbTI4
MzUuYyBpczoNCg0KLyogUGVyaXBoZXJhbCBiYXNlIGFkZHJlc3Mgc2VlbiBieSB0aGUgQ1BVICov
DQojZGVmaW5lIEJDTTI4MzVfUEVSSV9CQVNFICAgICAgIDB4MjAwMDAwMDANCi4uLg0KICAgIHN5
c2J1c19tbWlvX21hcF9vdmVybGFwKFNZU19CVVNfREVWSUNFKCZzLT5wZXJpcGhlcmFscyksIDAs
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgQkNNMjgzNV9QRVJJX0JBU0UsIDEpOw0KDQpB
bHNvLCBub3RlIHRoYXQgdGhpcyBpcyBtYXBwaW5nIHRoZSBwZXJpcGhlcmFscyBNUiwgbm90IHRo
ZSB0aGUgZ3B1X2J1c19tciB3aGljaCBpcyBuZXZlciB1c2VkIHdpdGggYW55IHN5c2J1cyBBUElz
LCBzbyBJJ20gc3RpbGwgbm90IGNsZWFyIG9uIHdoeSB3ZSBuZWVkIHRvIGNhbGwgc3lzYnVzX2lu
aXRfbW1pbyBvbiBpdC4gSXQncyBlbnRpcmVseSBwb3NzaWJsZSBteSBjb2RlIGlzIGJyb2tlbiwg
YW5kL29yIHRoYXQgYXNzZXJ0IHdhc24ndCB0aGVyZSB3aGVuIEkgdGVzdGVkIGl0LCBidXQgeW91
IG1pZ2h0IGhhdmUgdG8gZGlnIGEgYml0IGRlZXBlciB0byBjb252aW5jZSBtZSB0aGF0IHdoYXQg
eW91J3JlIGRvaW5nIGlzIGFsc28gc2FuZSA6KQ0KDQpCVFcsIEkgc3VzcGVjdCBub2JvZHkgZWxz
ZSB3aWxsIHdhbnQgdG8gcmV2aWV3IHRoaXMgdW50aWwgYWZ0ZXIgMi45Lg0KDQpBbmRyZXcNCg==
