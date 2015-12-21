Received: by 10.182.158.201 with SMTP id ww9csp3075581obb;
        Mon, 21 Dec 2015 15:16:04 -0800 (PST)
X-Received: by 10.55.76.140 with SMTP id z134mr28731812qka.30.1450739764561;
        Mon, 21 Dec 2015 15:16:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si31592272qgf.49.2015.12.21.15.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Dec 2015 15:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:47756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aB9gS-00032O-23
	for alex.bennee@linaro.org; Mon, 21 Dec 2015 18:16:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aB9fz-0002bc-HM
	for qemu-devel@nongnu.org; Mon, 21 Dec 2015 18:15:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aB9fv-0002Lt-7g
	for qemu-devel@nongnu.org; Mon, 21 Dec 2015 18:15:35 -0500
Received: from mail-bn1bon0117.outbound.protection.outlook.com
	([157.56.111.117]:27132
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aB9fu-0002Ld-T9
	for qemu-devel@nongnu.org; Mon, 21 Dec 2015 18:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qIDH03aVKWQjuc9gosucZkykAPHlNU/24eSznJirHdg=;
	b=DUCqxWHREWNloqKNQ5fdeUpLOL6TOTOqOVOUd+Zz2frwr6j8k35BzMjlUpeWDC6f6Om47kf40xDHYayLzw0JTv1El7GM/X/WO2fmYjCEUPmx4sNW5T5i9qOYVvznRgU14htozJ6CE6HGWGdYNoL2VR1iUBXyCXBkQOrkACkXqZU=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Mon, 21 Dec 2015 23:15:28 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Mon, 21 Dec 2015 23:15:28 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
Thread-Index: AQHRLllz7K4EEY2RuUSr8mGMJ47UG57WJvIAgAAByCA=
Date: Mon, 21 Dec 2015 23:15:28 +0000
Message-ID: <BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
In-Reply-To: <CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:oZlJvSqaygkjbYQwaSwUFvBSukvD5KHzQXXbMA+4OjNccIGbLxaFIWm/l0yxODLb676r6cekzGJvKln9hLUP4hhFlxpt6wTHyNkgCs+dyDyUhk6OPpjiCbNwzugHGAMHw9Qiprd5HCFSc2QOGpc/ag==;
	24:/4RGfw9cF4mzGh9NLnvkVS432oJlaXVlIfd1Ds7LLb0ZfNcWF9ydvKym8BhdjbApi53sb6NELgOKM2tQ9INRi1EalL8EvfzvFbCpnozLrBo=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB203462BD52204265692FAAC59EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 079756C6B9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(57704003)(164054003)(377454003)(199003)(51914003)(24454002)(86362001)(5005710100001)(99286002)(50986999)(10400500002)(1411001)(92566002)(2900100001)(33656002)(19580395003)(5002640100001)(54356999)(101416001)(74316001)(86612001)(5003600100002)(76176999)(1096002)(110136002)(1220700001)(2950100001)(105586002)(189998001)(40100003)(5008740100001)(586003)(106356001)(5001960100002)(87936001)(102836003)(81156007)(77096005)(11100500001)(10290500002)(8990500004)(10090500001)(76576001)(19580405001)(5004730100002)(106116001)(97736004)(122556002)(6116002)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2015 23:15:28.7497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.117
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IGp9Xe4ro0Q/

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KPiBGcm9tOiBQZXRlciBDcm9z
dGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiBTZW50OiBNb25k
YXksIDIxIERlY2VtYmVyIDIwMTUgMTQ6NDkNCj4gT24gVGh1LCBEZWMgMywgMjAxNSBhdCAxMDow
MSBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+IHdy
b3RlOg0KPiA+IFRoaXMgYWRkcyB0aGUgc3lzdGVtIG1haWxib3hlcyB3aGljaCBhcmUgdXNlZCB0
byBjb21tdW5pY2F0ZSB3aXRoIGENCj4gPiBudW1iZXIgb2YgR1BVIHBlcmlwaGVyYWxzIG9uIFBp
L1BpMi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBCYXVtYW5uIDxBbmRyZXcuQmF1
bWFubkBtaWNyb3NvZnQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkZWZhdWx0LWNvbmZpZ3MvYXJtLXNv
ZnRtbXUubWFrICAgICAgfCAgIDEgKw0KPiA+ICBody9taXNjL01ha2VmaWxlLm9ianMgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KPiA+ICBody9taXNjL2JjbTI4MzVfc2JtLmMgICAgICAgICAgICAg
ICAgfCAyODAgKysrKysrKysrKysrKysrKysrKysNCj4gDQo+ID4gIGluY2x1ZGUvaHcvYXJtL2Jj
bTI4MzVfYXJtX2NvbnRyb2wuaCB8IDQ4MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiANCj4gRG8gd2UgbmVlZCB0aGlzIGZpbGUgYXMgb2YgdGhpcyBwYXRjaD8NCg0K
WWVzLCBmb3IgQVJNX01DX0lIQVZFREFUQUlSUUVOIGFuZCBvdGhlciByZWxhdGVkIGRlZmluZXMu
DQoNClsuLi5dDQo+ID4gK3N0YXRpYyB2b2lkIGJjbTI4MzVfc2JtX3VwZGF0ZShCQ00yODM1U2Jt
U3RhdGUgKnMpDQo+IA0KPiBXaGF0IGRvZXMgU2JtIHN0YW5kIGZvcj8gSWYgaXQgaXMgYWNyb255
bSBpcyBzaG91bGQgYmUgYWxsIGNhcHMgaW4gY2FtZWwgY2FzZS4NCg0KSSdtIG5vdCBzdXJlIC0t
IGl0IGNvbWVzIGZyb20gR3JlZ29yeSdzIGNvZGU7IG1heWJlIGhlIGNhbiBjb21tZW50PyBXaGVy
ZSB0aGlzIGRldmljZSBnZXRzIGluc3RhbnRpYXRlZCwgdGhlcmUgaXMgYSBjb21tZW50IG9mIA0K
DQovKiBTZW1hcGhvcmVzIC8gRG9vcmJlbGxzIC8gTWFpbGJveGVzICovDQoNCi4uLiBidXQgb25s
eSBtYWlsYm94ZXMgYXJlIGltcGxlbWVudGVkIGhlcmUuIEknbSBndWVzc2luZyBtYXliZSBpdCdz
IGludGVuZGVkIGFzICJzeXN0ZW0gbWFpbGJveGVzIi4gSSBjYW4gcmVuYW1lIGl0Lg0KDQoNCj4g
PiArew0KPiA+ICsgICAgaW50IHNldDsNCj4gDQo+IGJvb2wuDQo+IA0KPiA+ICsgICAgaW50IGRv
bmUsIG47DQo+ID4gKyAgICB1aW50MzJfdCB2YWx1ZTsNCj4gPiArDQo+ID4gKyAgICAvKiBBdm9p
ZCB1bndhbnRlZCByZWN1cnNpdmUgY2FsbHMgKi8NCj4gPiArICAgIHMtPm1ib3hfaXJxX2Rpc2Fi
bGVkID0gMTsNCj4gPiArDQo+ID4gKyAgICAvKiBHZXQgcGVuZGluZyByZXNwb25zZXMgYW5kIHB1
dCB0aGVtIGluIHRoZSB2Yy0+YXJtIG1ib3ggKi8NCj4gPiArICAgIGRvbmUgPSAwOw0KPiA+ICsg
ICAgd2hpbGUgKCFkb25lKSB7DQo+ID4gKyAgICAgICAgZG9uZSA9IDE7DQo+ID4gKyAgICAgICAg
aWYgKHMtPm1ib3hbMF0uc3RhdHVzICYgQVJNX01TX0ZVTEwpIHsNCj4gPiArICAgICAgICAgICAg
LyogdmMtPmFybSBtYm94IGZ1bGwsIGV4aXQgKi8NCj4gDQo+IGJyZWFrIGhlcmUuDQo+IA0KPiA+
ICsgICAgICAgIH0gZWxzZSB7DQo+IA0KPiBzbyB5b3UgY2FuIGRyb3AgdGhlIGVsc2UgYW5kIGdl
dCBiYWNrIGEgbGV2ZWwgb2YgaW5kZW50Lg0KPiANCj4gPiArICAgICAgICAgICAgZm9yIChuID0g
MDsgbiA8IE1CT1hfQ0hBTl9DT1VOVDsgbisrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBpZiAo
cy0+YXZhaWxhYmxlW25dKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgdmFsdWUgPSBsZGxf
cGh5cygmcy0+bWJveF9hcywgbjw8NCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaWYgKHZh
bHVlICE9IE1CT1hfSU5WQUxJRF9EQVRBKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
IG1ib3hfcHVzaCgmcy0+bWJveFswXSwgdmFsdWUpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
IH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIC8qIEhtbW0uLi4gKi8NCj4g
DQo+IE5lZWRzIG1vcmUgY29tbWVudCA6KQ0KDQpHcmVnb3J5IC0tIGhlbHAhIDopDQoNClsuLi5d
DQo+ID4gKyAgICBzLT5hdmFpbGFibGVbaXJxXSA9IGxldmVsOw0KPiA+ICsgICAgaWYgKCFzLT5t
Ym94X2lycV9kaXNhYmxlZCkgew0KPiANCj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0aGlzLiBJ
TyBkZXZpY2VzIGFyZSBub3QgdGhyZWFkIHNhZmUgYW5kDQo+IGNvcmUtY29kZSBrbm93cyBpdC4g
U28geW91IGRvbid0IG5lZWQgdG8gd29ycnkgYWJvdXQgaW50ZXJydXB0aW9uIGFuZA0KPiByZS1l
bnRyeSBvZiB5b3VyIElSUSBoYW5kbGVyLg0KDQpJIHdpbGwgaGF2ZSB0byBwdXQgYSBkZWJ1Z2dl
ciBvbiB0aGlzIHRvIGNvbmZpcm0sIGJ1dCBJIHRoaW5rIHRoZSBpc3N1ZSBpcyB0aGF0IHdlIGFy
ZSB1c2luZyBhIHByaXZhdGUgbWVtb3J5IHJlZ2lvbiBhbmQgR1BJT3MgdG8gcm91dGUgbWFpbGJv
eCBkYXRhIGFuZCBpbnRlcnJ1cHRzIHRvIHRoZSByZWxldmFudCBzdWIgcGVyaXBoZXJhbHMuIFRo
ZSBsZGxfcGh5cyBpbnZva2VzIGFub3RoZXIgZGV2aWNlIGVtdWxhdGlvbiAoc3VjaCBhcyBiY20y
ODM1X3Byb3BlcnR5LmMgaW4gdGhpcyBzZXJpZXMpLCB3aGljaCBtYXkgY2F1c2UgaXQgdG8gc2ln
bmFsIGFuIGludGVycnVwdCBiYWNrIHRvIHVzIHZpYSBxZW11X3NldF9pcnEgd2hpY2ggd2lsbCBy
ZWN1cnNpdmVseSBydW4gb3VyIGhhbmRsZXIuIFdlIHdhbnQgdGhhdCBJUlEgdG8gYmUgcmVjb3Jk
ZWQgYnV0ICJzcXVhc2hlZCIuDQoNClsuLi5dDQo+ID4gKw0KPiA+ICsgICAgc3dpdGNoIChvZmZz
ZXQpIHsNCj4gPiArICAgIGNhc2UgMHg4MDogIC8qIE1BSUwwX1JFQUQgKi8NCj4gPiArICAgIGNh
c2UgMHg4NDoNCj4gPiArICAgIGNhc2UgMHg4ODoNCj4gPiArICAgIGNhc2UgMHg4YzoNCj4gDQo+
IGNhc2UgMHg4MC4uMHg4Yw0KDQpXb2FoISBJcyB0aGF0IHN0YW5kYXJkIEM/DQoNClsuLi5dDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvaHcvYXJtL2JjbTI4MzVfYXJtX2Nv
bnRyb2wuaA0KPiA+IEBAIC0wLDAgKzEsNDgxIEBADQo+ID4gKy8qDQo+ID4gKyAqICBsaW51eC9h
cmNoL2FybS9tYWNoLWJjbTI3MDgvYXJtX2NvbnRyb2wuaA0KWy4uLl0NCj4gV2hlbiB5b3UgaGF2
ZSBhIHJlZ3VsYXIgc3RydWN0dXJlIGxpa2UgdGhpcywgeW91IHNob3VsZCBjb2xsYXBzZSBpdA0K
PiBkb3duIHVzaW5nIHNvbWUgYXJpdGhtYXRpYzoNCg0KTm90aWNlIHRoYXQgdGhpcyBmaWxlIGNv
bWVzIGZyb20gTGludXguIEkga25vdyBpdCdzIG5vdCBwcmV0dHksIGJ1dCBjYW4gd2UgcGxlYXNl
IGtlZXAgaXQgYXMtaXMsIGZvciBjb21wYXJpc29uIHB1cnBvc2VzPyBJJ20gbm90IHN1cmUgdGhl
cmUncyBtdWNoIHZhbHVlIGluIGNsZWFuaW5nIGl0IHVwIGxvY2FsbHkuLi4NCg0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2h3L21pc2MvYmNtMjgzNV9zYm0uaA0KPiA+IEBA
IC0wLDAgKzEsMzcgQEANCj4gPiArLyoNCj4gPiArICogUmFzcGJlcnJ5IFBpIGVtdWxhdGlvbiAo
YykgMjAxMiBHcmVnb3J5IEVzdHJhZGUNCj4gPiArICogVGhpcyBjb2RlIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSBHTlUgR1BMdjIgYW5kIGxhdGVyLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpZm5k
ZWYgQkNNMjgzNV9TQk1fSA0KPiA+ICsjZGVmaW5lIEJDTTI4MzVfU0JNX0gNCj4gPiArDQo+ID4g
KyNpbmNsdWRlICJody9zeXNidXMuaCINCj4gPiArI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFj
ZXMuaCINCj4gPiArI2luY2x1ZGUgImh3L2FybS9iY20yODM1X21ib3guaCINCj4gPiArDQo+ID4g
KyNkZWZpbmUgVFlQRV9CQ00yODM1X1NCTSAiYmNtMjgzNV9zYm0iDQo+ID4gKyNkZWZpbmUgQkNN
MjgzNV9TQk0ob2JqKSBcDQo+ID4gKyAgICAgICAgT0JKRUNUX0NIRUNLKEJDTTI4MzVTYm1TdGF0
ZSwgKG9iaiksIFRZUEVfQkNNMjgzNV9TQk0pDQo+ID4gKw0KPiA+ICt0eXBlZGVmIHN0cnVjdCB7
DQo+ID4gKyAgICBNZW1vcnlSZWdpb24gKm1ib3hfbXI7DQo+ID4gKyAgICBBZGRyZXNzU3BhY2Ug
bWJveF9hczsNCj4gDQo+IEkgY2FuJ3Qgc2VlIHdoZXJlIHRoZXNlIHR3byBmaWVsZHMgYXJlIHVz
ZWQuIEEgcXVpY2sgc2NhbiBzaG93cyB0aGF0DQo+IHRoZSBTYm1TdGF0ZSdzIGNvcHkgaXMgdXNl
cyBmb3IgYWxsIERNQSBvcHMuIElmIHRoZXNlIGFyZSBuZWVkZWQsDQo+IG1ib3hfaW5pdCBzaG91
bGQgcGFzcyBhIHBvaW50ZXIgdG8gdGhlIHRoZSBTYm1TdGF0ZSB0aGVuIHRoaXMgc2F2ZXMNCj4g
dGhlIHBvaW50ZXIgYW5kIG5hdmlnYXRlcyBhcyBuZWVkZWQgYmFjayB0byB0aGUgY29udGFpbmVy
IHN0cnVjdHVyZSB0bw0KPiBnZXQgdGhlIEFTLg0KDQpZb3UncmUgcmlnaHQuIFRoZXkncmUgdW5p
bml0aWFsaXNlZC91bnVzZWQgZGV0cml0dXMgZnJvbSBhIHByZXZpb3VzIHJlZmFjdG9yLiBJJ2xs
IHJlbW92ZSB0aGVtLg0KDQpUaGFua3MsDQpBbmRyZXcNCg==
