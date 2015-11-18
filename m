Received: by 10.182.158.201 with SMTP id ww9csp1497226obb;
        Wed, 18 Nov 2015 10:16:48 -0800 (PST)
X-Received: by 10.31.159.87 with SMTP id i84mr139449vke.18.1447870608582;
        Wed, 18 Nov 2015 10:16:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i191si162017vkd.37.2015.11.18.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 10:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zz7Hj-0006Hf-Va
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 13:16:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1Zz7Hf-0006BQ-4g
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 13:16:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1Zz7He-00005D-0I
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 13:16:43 -0500
Received: from mail-bl2on0116.outbound.protection.outlook.com
	([65.55.169.116]:43680
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1Zz7HW-0008Vu-84; Wed, 18 Nov 2015 13:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SjLvNIbbg4dO6uQdl7Ou03nwfCPSjbTDkl/XW/FZjeA=;
	b=URz7wC5VNFxebT0zAnE56XtobN/EMuFeWBgwwe9lgR5EXF4ECF4IalESIc79q3RJkXqQCZwfSgEKpZjQv4KySN7/Y3bJRNI4hiJ+E0QuC+MiLOcOpaJxg+gvjGdwDD2d48WeKiyhgvfp+/WmyLhBw3waVffnm3hBvXNyUGXaR7I=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Wed, 18 Nov 2015 18:16:32 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0325.019; Wed, 18 Nov 2015 18:16:32 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQDOg3SAABS0aqA=
Date: Wed, 18 Nov 2015 18:16:32 +0000
Message-ID: <BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
In-Reply-To: <CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:3::709]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:RyfWF0uGcemuEXXCWaUfkPAvk9fwne2Th3+RCzZyS/HQROgBxQuX14hk8BUfWi8VFwZMt7cxp9bPMFyZh2Ip1QIYdV97f8dIXJZ05X6GxPmm98CfcFI5D1DDp8BqOwsvcViss718A4sT5BvKAqGlXw==;
	24:0QT1AKfQYwIStw92ROxjmoZgi9OxcX03r2Ngo307HXdwCMUKA93zXLeZSHlF+4NfOYoackUncUCN9vkOjzkVicGVM+fbqEPxBqS/80SNdDk=;
	20:l3/r1enSg7KVz7X4/RHP0Mj4nJF1N+lckRfDFNdBLy1nglCKVkRJSxlPWvyvQZ2n7EDDNsPbl72GmtllxD5FkA==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203435526BD7386EE86FDEAE9E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001)(61426024)(61427024);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0764C4A8CD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(189002)(199003)(99286002)(50986999)(8990500004)(2900100001)(2950100001)(230783001)(86612001)(106356001)(105586002)(10290500002)(5004730100002)(102836003)(6116002)(10400500002)(76576001)(74316001)(122556002)(575784001)(10090500001)(87936001)(11100500001)(5005710100001)(40100003)(77096005)(86362001)(5001920100001)(5008740100001)(5007970100001)(189998001)(7520500002)(97736004)(5001960100002)(76176999)(1411001)(101416001)(33656002)(5002640100001)(586003)(54356999)(5003600100002)(81156007)(110136002)(19580405001)(92566002)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2015 18:16:32.1166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.116
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] RFC: raspberry pi / pi2 /
	Windows-on-ARM support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qail6pqWiE2V

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KRnJvbTogUGV0ZXIgQ3Jv
c3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NClNlbnQ6IFR1ZXNk
YXksIDE3IE5vdmVtYmVyIDIwMTUgMjM6NTENCj4gSSBoYXZlbid0IGxvb2tlZCBiZXlvbmQgdGhl
IGRpZmZzdGF0IHlldCwgYnV0IGEgdG9wIGxldmVsDQo+IGFyY2hpdGVjdHVyYWwgY29tbWVudCwg
SSBvbmx5IHNlZSB0aGUgb25lIGZpbGUgaW4gaHcvYXJtLiBXZSBhcmUNCj4gcHJvbW90aW5nIHRo
ZSBzcGxpdCBvZiBib2FyZCBhbmQgU29DIG5vdyBhcyB0d28gc2VwYXJhdGUgb2JqZWN0cy4gRWFj
aA0KPiBvZiB0aGUgcGF0Y2ggc2VyaWVzIGxpbmtlZCBhYm92ZSBkZW1vbnN0cmF0ZXMgdGhpcy4g
VGhlIEJDTSBTb0Mgd291bGQNCj4gYmUgYW4gb2JqZWN0IGluIGl0cyBvd24gcmlnaHQsIHRoZW4g
dGhlIGJvYXJkIGluc3RhbnRpYXRlcyB0aGUgU29DIGFzDQo+IGEgY29tcG9zaXRlIGRldmljZS4N
Cg0KSSB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUgaGVyZSwgYnV0IGlzIHRoZXJlIG11Y2ggdmFs
dWUgcHVyc3VpbmcgdGhpcyBmb3IgdGhlIFBpPyBBcyBmYXIgYXMgSSBrbm93LCB0aGUgUGkxLzIg
U09DcyAoYmNtMjgzNSBhbmQgMjgzNikgYXJlIG9uZS1vZmYgZGVzaWducyB1c2VkIG9ubHkgaW4g
dGhlIFBpLiBNb3Jlb3ZlciwgdGhlIDI4MzYgaXMgYmFzaWNhbGx5IGEgY29weSBvZiB0aGUgMjgz
NSB3aXRoIHRoZSBhZGRpdGlvbiBvZiBhIG5ldyBibG9jayBmb3IgYSBtdWx0aS1jb3JlIGludGVy
cnVwdCBjb250cm9sbGVyIGFuZCBtYWlsYm94ZXMsIHNvIHRyeWluZyB0byBzcGxpdCB0aG9zZSBv
dXQgaW50byB0d28gc2VwYXJhdGUgU09DIGRlZmluaXRpb24gZmlsZXMgd291bGQgcmVxdWlyZSBl
aXRoZXIgbG90cyBvZiBkdXBsaWNhdGlvbiwgb3IgYSB0aWdodCBjb3VwbGluZyBiZXR3ZWVuIHRo
ZSB0d28uIEZpbmFsbHksIHRoZXJlIGlzIGJhc2ljYWxseSBub3RoaW5nIG9uIHRoZSBib2FyZCBi
ZXNpZGVzIHRoZSBTb0MgYW5kIFJBTSAoanVzdCBhIFVTQi1FdGhlcm5ldCBhZGFwdGVyKSwgc28g
dGhlIGFjdHVhbCBib2FyZCBkZWZpbml0aW9uIGZpbGVzIHdvdWxkIGJlIGFsbW9zdCBlbXB0eS4g
QXMgaXQgaXMsIEkndmUgYWxyZWFkeSBmYWN0b3JlZCBvdXQgYWxsIHRoZSBjb21tb24gZGV2aWNl
cyB3aXRoaW4gaHcvYXJtL3Jhc3BpLmMgLS0gbXkgZmVlbGluZyBpcyB0aGF0IHRoaXMgaXMgYSBj
bGVhbmVyIHdheSB0byBkbyBpdCBmb3IgdGhlIFBpLg0KDQo+IEl0IGlzIGJpZy4gV29yayBvZiB0
aGlzIG1hZ25pdHVkZSBpcyBnZW5lcmFsbHkgYmV0dGVyIG1hbmFnZWQgYXMNCj4gbXVsdGlwbGUg
c2VyaWVzIChlYWNoIG9mIG11bHRpcGxlIHBhdGNoZXMpLiBBIGdlbmVyYWwgYXBwcm9hY2ggd2l0
aA0KPiBuZXcgQVJNIGJvYXJkcyBpcyB0aGUgZmlyc3Qgc2VyaWVzIGlzIHRoZSBiYXJlIG1pbmlt
dW0gbmVlZGVkIHRvIGdldCBhDQo+IGxpbnV4IGJvb3Qgb3ZlciB0aGUgVUFSVCBjb25zb2xlLiBU
aGlzIHVzdWFsbHkgbWVhbnMgYW55IENQVQ0KPiBjdXN0b21pc2F0aW9ucywgdGltZXIsIFVBUlQs
IGludGMsIFNvQyBhbmQgYm9hcmRzLCBtYXliZSB0aGUNCj4gc3lzdGVtL3Bvd2VyIGNvbnRyb2xs
ZXJzIChpZiB0aGUga2VybmVsIHRvdWNoZXMgdGhlbSBpbiBib290KSBhbmQNCj4gb3B0aW9uYWxs
eSBuZXR3b3JrIG9yIGVtbWMuIFdpdGggbmV0d29yayB5b3UgY2FuIGRvIGFuIE5GUyByb290ICh0
aGlzDQo+IHdhcyB0aGUgb25seSBvcHRpb24gb24gQWxsd2lubmVyL2N1YmllYm9hcmQgZm9yIHF1
aXRlIHNvbWUgdGltZSkgYW5kDQo+IHdpdGggZW1tYyB5b3UgY2FuIGRvIHlvdXIgcm9vdD0vZGV2
L21tY2JsazBwMiBzdHlsZSBib290IGFzIG5vcm1hbC4gSWYNCj4geW91IGFyZSB1c2luZyBleGlz
dGluZyBsYW45MTE4LCBuZXR3b3JrIGZpcnN0IG1pZ2h0IGJlIGEgY2xlYXIgd2luLA0KPiBhbHRo
b3VnaCBlbW1jIGlzIG1vcmUgcmVhbGlzdGljLiBDYW4gYWx3YXlzIGRvIGJvdGguDQo+IA0KPiBU
aGUgeW91IGNhbiBmb2xsb3cgdXAgd2l0aCB0aGUgVVNCLCBETUEsIEFVWCwgLi4uIGVhY2ggaW5k
ZXBlbmRlbnRseQ0KPiBvciBhcyBhIGZvbGxvdyB1cCBzZXJpZXMnLg0KPiANCj4gQW55IGNvcmUg
Y29kZSBhbmQgQVJNIENQVSB3b3JrIHRoYXQgaXMgYSBidWdmaXggb3Igc3RhbmRzIGluIGl0cyBv
d24NCj4gcmlnaHQsIHlvdSBzaG91bGQgc2VuZCBzdHJhaWdodCB1cCBhcyBhIHNlcGFyYXRlIHdv
cmsuDQoNCk9rLCB1bmRlcnN0b29kLiBFdmVuIGZvbGxvd2luZyB0aGlzIGd1aWRhbmNlLCB0aGUg
Zmlyc3QgcGF0Y2ggd2lsbCBiZSBiaWcgLS0gUGkgaGFzIGN1c3RvbSBpbnRlcnJ1cHQgYW5kIERN
QSBjb250cm9sbGVycywgYW5kIHRoZSBHUFUgZ2V0cyBpdHNlbGYgaW52b2x2ZWQgaW4gdGhlIGJv
b3QgcHJvY2Vzcy4gSSB0aGluayB3ZSBjb3VsZCBwcm9iYWJseSBsZWF2ZSBvdXQgZmIvdXNiIGFu
ZCBtYXliZSBhbHNvIGRtYSwgbXBoaSwgdmNoaXEgYW5kIHBvd2VyLCBidXQgbW9zdCBvZiB0aGUg
cmVzdCB3aWxsIGJlIG5lZWRlZCB0byBib290IGFueXRoaW5nLg0KDQpCVFcsIEkgdXNlZCBsYW45
MTE4IGFzIGEga2x1ZGdlIGZvciBXaW5kb3dzLCBidXQgaXQgaXNuJ3QgcHJlc2VudCBvbiBhIHJl
YWwgUGksIGFuZCB0aGUgZGV2aWNlIGRlZmluaXRpb24gbm8gbG9uZ2VyIGluc3RhbnRpYXRlcyBp
dC4gQXQgcHJlc2VudCwgdGhlcmUgaXMgbm8gdXNhYmxlIG5ldHdvcmsgZGV2aWNlLg0KDQo+IEN1
cmlvdXMsIGRvZXMgclBpIGtlcm5lbCBzdXBwb3J0IGRldmljZSB0cmVlIGJvb3Q/IFRoaXMgd291
bGQgYmUgbmljZQ0KPiBmb3IgdGVzdGluZyB3aXRoIGEgZ2VuZXJpYyBrZXJuZWwuDQoNCkkgYmVs
aWV2ZSBpdCBkb2VzIG9uIHJlY2VudCBSYXNwYmlhbiBpbWFnZXMgKEkgc2VlIGEgbnVtYmVyIG9m
IGR0YiBmaWxlcyBpbiBSYXNwYmlhbidzIGJvb3QgcGFydGl0aW9uKSwgYnV0IEkgaGF2ZW4ndCB0
cmllZCB0byBmaWd1cmUgb3V0IGhvdyB0byB1c2UgdGhlbS4gSW4gZ2VuZXJhbCwgd2UgaGF2ZSBs
aW1pdGF0aW9ucyB3aGVyZSB0aGUgYm9vdGxvYWRlciBpcyBjb25jZXJuZWQuIE9uIFBpIEhXLCB0
aGUgYm9vdCBwcm9jZXNzIGlzIGRyaXZlbiBieSB0aGUgR1BVLCB3aGljaCByZWFkcyBhIHBsZXRo
b3JhIG9mIG9wdGlvbnMgZnJvbSBjb25maWcgZmlsZXMgKGNvbmZpZy50eHQgYW5kIGNtZGxpbmUu
dHh0KSBvbiB0aGUgYm9vdCBwYXJ0aXRpb24uIFdlIGRvbid0IGVtdWxhdGUgYW55IG9mIHRoYXQg
c3R1ZmYuLi4gaW5zdGVhZCwgdGhlIHByZXZpb3VzIHJhc3BpIGNvZGUgZGlkIGp1c3QgZW5vdWdo
IHRvIGJvb3QgTGludXggdXNpbmcgcWVtdSdzIExpbnV4IGxvYWRlciBzdXBwb3J0LCBhbmQgSSBm
aWd1cmVkIG91dCBob3cgdG8gbWFrZSBVRUZJIGhhcHB5IG9uIHJhc3BpMiBzbyBpdCBjYW4gYm9v
dCBXaW5kb3dzLCBidXQgdGhhdCdzIGFib3V0IGFsbC4NCg0KSSB3aWxsIHRha2UgYSBsb29rIGF0
IHRoZSBwYXRjaGVzIHlvdSByZWZlcnJlZCB0bywgYW5kIHRyeSB0byByZWZhY3RvciB0aGUgZGV2
aWNlcyBhY2NvcmRpbmdseS4NCg0KQlRXLCBteSBtYWluIGdvYWwgaGVyZSBpcyBXaW5kb3dzIHN1
cHBvcnQgKHN1cnByaXNlISA6KSwgc28gaWYgYW55b25lIGVsc2UgaXMgd2lsbGluZyB0byBoZWxw
IG91dCB3aXRoIExpbnV4IHRoYXQgd291bGQgYmUgbXVjaCBhcHByZWNpYXRlZC4gVGhlIGtlcm5l
bCBjdXJyZW50bHkgbGltcHMgaW50byBlYXJseSB1c2Vyc3BhY2UgYmVmb3JlIGNyYXNoaW5nIG9u
IGEgU0VURU5EIGluc3RydWN0aW9uLCBhbmQgaXMgY2xlYXJseSBub3QgYXMgaGFwcHkgYXMgaXQg
d2FzIHdoZW4gdGhlIG9yaWdpbmFsIFBpMSBzdXBwb3J0IHdhcyBiZWluZyBhY3RpdmVseSBkZXZl
bG9wZWQgfjIgeWVhcnMgYWdvLg0KDQpUaGFua3MsDQpBbmRyZXcNCg==
