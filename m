Received: by 10.182.158.201 with SMTP id ww9csp8675937obb;
        Thu, 31 Dec 2015 10:23:50 -0800 (PST)
X-Received: by 10.140.18.136 with SMTP id 8mr58727151qgf.64.1451586230053;
        Thu, 31 Dec 2015 10:23:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32si81883155qgu.71.2015.12.31.10.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 10:23:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:56489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEht7-00082f-Mz
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 13:23:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEht5-0007zf-0S
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:23:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEht3-0002th-F4
	for qemu-arm@nongnu.org; Thu, 31 Dec 2015 13:23:46 -0500
Received: from mail-bn1on0115.outbound.protection.outlook.com
	([157.56.110.115]:43793
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEhsx-0002rg-61; Thu, 31 Dec 2015 13:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XnWOip9x/Kv3HseHrpJ8Lp0p+7Zkr0tIjGx37lOsI8I=;
	b=ACNN6d5wfWurhf1wPMhAtF9eZZXzJui7Dgss9CFErCiAuSsBIlvi6k7BUlw9pjdta0urCq84B35Ew41Z03Fj3gd2cblhosrWkY9yfoyyIE0yA5fskphTWopnDyviI7/5VOaOY46T/rvSf3QFQjQjY0fcgEmjFpJplvY1hzqLag8=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 31 Dec 2015 18:23:37 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0361.006; Thu, 31 Dec 2015 18:23:37 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, Alistair Francis
	<alistair.francis@xilinx.com>
Thread-Topic: [PATCH v2 4/7] bcm2835_peripherals: add rollup device for
	bcm2835 peripherals
Thread-Index: AQHRPeGmlS5jyQnzZkiQH18Kwg+dqZ7kcTUAgAD/OLA=
Date: Thu, 31 Dec 2015 18:23:36 +0000
Message-ID: <BLUPR0301MB2034E25137FEDAC50C56E9919EFE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1450916731-5968-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=pA9CFqkk5=hAqcqf=fV2Mx7PX_QtruyLESaT6Z07Ds+Q@mail.gmail.com>
In-Reply-To: <CAPokK=pA9CFqkk5=hAqcqf=fV2Mx7PX_QtruyLESaT6Z07Ds+Q@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:5::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:PgK2qJaPttZdtDk+XzgAW+5iketwUQVcJsXRIX1/qZFtDryGnExUDPHOcsmHgjg5gtPzxDJGqBAPR399ZO/5Rcjroz5IfsS6IaDOU0pibA8rpUmoT7NNm+QnvMnpnSaSH8x9KwBc+DA2JeBhEzTuzQ==;
	24:4ofgGKGh9EXrkv0RzNiG1fCUzY3gvdizRUIXTqWAnmT2kWHFO1WShFkrqmg03Bk1lR9zptTsOEKxBHbPW4sp+Z+xkzBW4G+pxo6LWsYL7Xo=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034F88FEA534AFC2ABC2C859EFE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08076ABC99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(24454002)(189002)(377454003)(101416001)(189998001)(86362001)(92566002)(5002640100001)(99286002)(1096002)(106116001)(102836003)(586003)(11100500001)(19580395003)(1220700001)(106356001)(19580405001)(97736004)(33656002)(5005710100001)(50986999)(76576001)(105586002)(81156007)(10290500002)(5004730100002)(5003600100002)(74316001)(122556002)(10400500002)(40100003)(86612001)(10090500001)(54356999)(5008740100001)(77096005)(15975445007)(2950100001)(2900100001)(5001770100001)(5001960100002)(4326007)(6116002)(8990500004)(87936001)(76176999)(7059030)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2015 18:23:36.9510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.115
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 4/7] bcm2835_peripherals: add rollup
 device for bcm2835 peripherals
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
X-TUID: qRjsxPPs8zF1

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBXZWRuZXNkYXksIDMwIERlY2VtYmVyIDIwMTUgMTg6NTQNCj4gT24gV2Vk
LCBEZWMgMjMsIDIwMTUgYXQgNDoyNSBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVt
YW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+IFRoaXMgZGV2aWNlIG1haW50YWlucyBhbGwg
dGhlIG5vbi1DUFUgcGVyaXBoZXJhbHMgb24gYmNtMjgzNSAoUGkxKQ0KPiA+IHdoaWNoIGFyZSBh
bHNvIHByZXNlbnQgb24gYmNtMjgzNiAoUGkyKS4gSXQgYWxzbyBpbXBsZW1lbnRzIHRoZQ0KPiA+
IHByaXZhdGUgYWRkcmVzcyBzcGFjZSB1c2VkIGZvciBETUEuDQpbLi4uXQ0KPiA+ICsgICAgc3lz
YnVzX2luaXRfbW1pbyhTWVNfQlVTX0RFVklDRShzKSwgJnMtPnBlcmlfbXIpOw0KPiA+ICsNCj4g
PiArICAgIC8qIEludGVybmFsIG1lbW9yeSByZWdpb24gZm9yIHBlcmlwaGVyYWwgYnVzIGFkZHJl
c3NlcyAobm90IGV4cG9ydGVkKQ0KPiAqLw0KPiA+ICsgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lv
KCZzLT5ncHVfYnVzX21yLCBPQkpFQ1QocyksIE5VTEwsIHMsDQo+ICJiY20yODM1X2dwdV9idXMi
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50NjRfdCkxIDw8IDMyKTsNCj4g
DQo+IFlvdSBhbHJlYWR5IGhhdmUgb2JqIGZvciB0aGUgT0JKRUNUIGNhc3RlZCB2ZXJzaW9uIG9m
IHMuDQo+IA0KPiBXaHkgZG8geW91IHVzIG1lbW9yeV9yZWdpb25faW5pdF9pbyB0aG91Z2ggaW5z
dGVhZCBvZg0KPiBtZW1vcnlfcmVnaW9uX2luaXQ/IFRoaXMgbG9va3MgbGlrZSBhIGNvbnRhaW5l
ciBNUiB3aGljaCBpcyB3aGF0DQo+IHVucXVhbGlmaWVkIG1lbW9yeV9yZWdpb25faW5pdCBwcm92
aWRlcy4NCg0KSG1tLCBwcm9iYWJseSBqdXN0IGNvcHktYW5kLXBhc3RlLiBJZiBtZW1vcnlfcmVn
aW9uX2luaXQgd29ya3MsIEknbGwgdXNlIHRoYXQuDQoNCj4gPiArICAgIG9iamVjdF9wcm9wZXJ0
eV9hZGRfY2hpbGQob2JqLCAiZ3B1X2J1cyIsIE9CSkVDVCgmcy0+Z3B1X2J1c19tciksDQo+IE5V
TEwpOw0KPiA+ICsNCj4gPiArICAgIC8qIEludGVybmFsIG1lbW9yeSByZWdpb24gZm9yIGNvbW11
bmljYXRpb24gb2YgbWFpbGJveCBjaGFubmVsIGRhdGENCj4gKi8NCj4gPiArICAgIG1lbW9yeV9y
ZWdpb25faW5pdF9pbygmcy0+bWJveF9tciwgT0JKRUNUKHMpLCBOVUxMLCBzLA0KPiAiYmNtMjgz
NV9tYm94IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBNQk9YX0NIQU5fQ09VTlQg
PDwgNCk7DQo+ID4gKw0KPiANCj4gU2FtZSBoZXJlLiBBbHRob3VnaCB0aGlzIGNvbnRhaW5lciBz
ZWVtcyB0byBoYXZlIG9ubHkgb25lIHN1YnJlZ2lvbiBhdA0KPiBvZmZzZXQgMCAodGhlIHByb3Bl
cnR5IGRldmljZSkuIExvbmcgdGVybSwgd2lsbCB0aGlzIE1SIGhhdmUgbW9yZQ0KPiBzdHVmZiBp
biBpdCBvciB3aWxsIGFsd2F5cyBiZSBqdXN0IHRoZSBwcm9wZXJ0eT8NCg0KWWVzLCB0aGVyZSBh
cmUgYSBjb3VwbGUgbW9yZSBzdWNoIGRldmljZXMgdG8gY29tZS4gU2VlOg0KaHR0cHM6Ly9naXRo
dWIuY29tLzB4YWJ1L3FlbXUvYmxvYi9yYXNwaS9ody9hcm0vYmNtMjgzNV9wZXJpcGhlcmFscy5j
I0wyNjMNCg0KWy4uLl0NCj4gPiArICAgIC8qIFhYWDogYXNzdW1lIHRoYXQgUkFNIGlzIGNvbnRp
Z3VvdXMgYW5kIG1hcHBlZCBhdCBzeXN0ZW0gYWRkcmVzcw0KPiB6ZXJvICovDQo+ID4gKyAgICBy
YW0gPSBtZW1vcnlfcmVnaW9uX2ZpbmQoZ2V0X3N5c3RlbV9tZW1vcnkoKSwgMCwgMSkubXI7DQo+
IA0KPiBOb3Qgc3VyZSBhYm91dCB0aGlzLiBBbGlzdGFpciAoZnJvbSBYaWxpbngpIGhhcyBhIHNp
bWlsYXIgcHJvYmxlbQ0KPiB3aGVyZSB0aGUgU29DIG5lZWRlZCB0byBkbyBhIGNvbXBsZXggc3Bs
aXQgb2YgdGhlIHNpbmdsZSBERFIgaW50bw0KPiBtdWx0aXBsZSBzeXN0ZW0gYWRkcmVzcyByZWdp
b25zLiBJIGNjJ2QgeW91IG9uIGEgcGF0Y2guIEZvbGxvd2luZw0KPiBBbGlzdGFpcidzIHBhdGNo
IGluIHRoZSBYaWlueCBlcDEwOC96eW5xbXAgd29yaywgdGhlIHN5c3RlbV9tZW1vcnkNCj4gcmVn
aW9uIGlzIG5vdyBmdWxseSBvd25lZCBieSB0aGUgU29DIGxldmVsIGFuZCBkaXN1c2VkIGJ5IHRo
ZQ0KPiBtYWNoaW5lL2JvYXJkIGxldmVsLiBJIHdvdWxkIHN1Z2dlc3Qgc29tZXRoaW5nIHNpbWls
YXIgaGVyZS4gVGhlIGJvYXJkDQo+IGlzIHJlc3BvbnNpYmxlIGZvciBjcmVhdGluZyAoYW5kIG1h
aW5seSBzaXppbmcpIHRoZSBSQU0sIGFuZCBsaW5rcyAob3INCj4gY29uc3QtbGluaydzKSB0aGUg
UkFNIHRvIHRoZSBTb0Mgd2hlcmUgaXQgY2FuIGJlIHN1YnJlZ2lvbmVkIGFzLWlzDQo+IHdpdGhv
dXQgdGhpcyBzZWFyY2guIEFzIHlvdSBhbHJlYWR5IGhhdmUgU29DIGxldmVsIG1lbW9yeSByZWdp
b25zIGZvcg0KPiB5b3VyIG11bHRpcGxlIGFkZHJlc3Mgc3BhY2VzLCB5b3UgbWF5IGFjdHVhbGx5
IGVuZCB1cCB3aXRoDQo+IHN5c3RlbV9tZW1vcnkgYmVpbmcgY29tcGxldGVseSB1bnVzZWQgKGFu
ZCB0aGF0IGlzIE9LKS4NCg0KT2suIFRoZXJlIGFyZSBkaWZmZXJlbnQgUGkgYm9hcmRzIHdpdGgg
ZGlmZmVyZW50IHJhbSBzaXplcywgc28gaXQgc2VlbXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlz
IGFsbG9jYXRlIHRoZSByYW0gYXMgSSBhbHJlYWR5IGRvIGF0IHRoZSBib2FyZCBsZXZlbCwgYnV0
IHRoZW4gcGFzcyBpdCB2aWEgYSBsaW5rIHByb3BlcnR5IHRvIHRoZSBTb0MgKGFzIEFsaXN0YWly
IGRvZXMpIGFuZCBub3QgYm90aGVyIHdpdGggc3lzdGVtX21lbW9yeS4NCg0KPiA+ICsgICAgYXNz
ZXJ0KHJhbSAhPSBOVUxMICYmIG1lbW9yeV9yZWdpb25fc2l6ZShyYW0pID49IDEyOCAqIDEwMjQg
Kg0KPiAxMDI0KTsNCj4gDQo+IFdoYXQgaXMgaXMgdGhlIHNpZ25pZmljYW5jZSBvZiB0aGUgMTI4
TUIgbG93ZXIgY2xhbXA/IFRoaXMgc2hvdWxkDQo+IHByb2JhYmx5IGJlIGEgd2Vha2VyIGVycm9y
IHRoYW4gYXNzZXJ0LiBEZXBlbmRpbmcgb24gdGhlIHJlYXNvbiBmb3INCj4gdGhlIGVycm9yLCBp
dCBjb3VsZCBiZSBsb2NhdGVkIGluIGEgbnVtYmVyIG9mIGRpZmZlcmVudCBwbGFjZXMuIElmIHRo
ZQ0KPiBTb0MgY2Fubm90IGZ1bmN0aW9uIHdpdGhvdXQgMTI4TUIgZm9yIHNvbWUgcmVhc29uIHRo
aXMgaXMgdGhlIHJpZ2h0DQo+IHBsYWNlLg0KDQpUaGlzIHdhcyBqdXN0IGEgcGFyYW5vaWQgY2hl
Y2sgdG8gbWFrZSBzdXJlIHRoYXQgbXkgZnJhZ2lsZSBzZWFyY2ggZm9yIHRoZSBzeXN0ZW0gbWVt
b3J5IGZvdW5kIHRoZSByaWdodCB0aGluZyAtLSAxMjhNQiB3YXMganVzdCBhIGxvd2VyIGJvdW5k
IG9uIGEgc2FuZSBtZW1vcnkgc2l6ZS4gSXQgY2FuIGdvIGF3YXkuDQoNClsuLi5dDQo+ID4gKyAg
ICAvKiBQcm9wZXJ0eSBjaGFubmVsICovDQo+IA0KPiBUaGVzZSBhcmUgYWxsIHNlbGYtZG9jdW1l
bnRlZCBieSB0aGUgYWxyZWFkeS13ZWxsLW5hbWVkIHMtPiBmaWVsZHMsIHNvDQo+IHlvdSBjYW4g
ZHJvcCB0aGVzZSBjb21tZW50cyBpbmRpY2F0aW5nIHdoYXQgeW91IGFyZSByZWFsaXppbmcuDQoN
CipzaHJ1ZyogSSBmaW5kIHRoZW0gcXVpdGUgaGVscGZ1bCB3aGVuIG5hdmlnYXRpbmcgdGhlIGNv
ZGUuIFBsdXMgSSBuZXZlciByZWFsbHkgc2VlIHRoZSBwb2ludCBvZiBkZWxldGluZyAoYWNjdXJh
dGUsIG5vbi1kaXN0cmFjdGluZykgY29tbWVudHMuDQoNClsuLi5dDQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL2luY2x1ZGUvaHcvYXJtL3Jhc3BpX3BsYXRmb3JtLmgNCj4gPiBAQCAtMCww
ICsxLDE2MSBAQA0KPiA+ICsvKg0KPiA+ICsgKiBiY20yNzA4IGFrYSBiY20yODM1LzI4MzYgYWth
IFJhc3BiZXJyeSBQaS9QaTIgU29DIHBsYXRmb3JtIGRlZmluZXMNCj4gPiArICoNCj4gPiArICog
VGhlc2UgZGVmaW5pdGlvbnMgYXJlIGRlcml2ZWQgZnJvbSB0aG9zZSBpbiBMaW51eCBhdA0KPiA+
ICsgKiBhcmNoL2FybS9tYWNoLXtiY20yNzA4LGJjbTI3MDl9L2luY2x1ZGUvbWFjaC9wbGF0Zm9y
bS5oDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgaW4gdGhlIHNhbWUgYmFza2V0IGFzIHRoZSBoZWFk
ZXIgZnJvbSBQMS4gV2Ugc2hvdWxkDQo+IGNoZXJyeSBwaWNrIG91dCB0aGUgZGVmcyB0aGF0IHdl
IGNhcmUgYWJvdXQgKG9yIGFyZSBsaWtlbHkgdG8gY2FyZQ0KPiBhYm91dCBpbiBuZWFyIHRlcm0g
Zm9sbG93IHVwKS4gSSdtIGd1ZXNzaW5nIHRoaXMgaXMgc291cmNlZCBmcm9tIHRoZQ0KPiBzYW1l
IExpbnV4IGZvcmsgYXMgYmVmb3JlPw0KDQpZZXMuIEkgY2FuIGRyb3Agc29tZSBvZiB0aGUgZGVm
cyAoZS5nLiByZWR1bmRhbnQgaW50ZXJydXB0cyk7IGhvd2V2ZXIsIGFzc3VtaW5nIHRoYXQgd2Un
bGwgZXZlbnR1YWxseSBoYXZlIGEgZnVsbC1mbGVkZ2VkIGVtdWxhdGlvbiwgbW9zdCBvZiB0aGVt
IHdpbGwgZW5kIHVwIGJlaW5nIG5lZWRlZCwgc28gSSdkIHByZWZlciBub3QgdG8gaGF2ZSB0byB0
aHJvdyB0aGVtIGFsbCBhd2F5IGFuZCB0aGVuIHJlLWFkZCB0aGVtIGluIGxhdGVyIHBhdGNoZXMu
DQoNClsuLi5dDQo+ID4gKyNkZWZpbmUgQVJNX0lSUTJfQkFTRSAgICAgICAgICAgICAgICAgIDMy
DQo+IA0KPiBDYW4geW91IGp1c3Qga2VlcCBpdCBhcyBvbmUgYmlnIDY0LWxvbmcgbGlzdD8gSSBk
b24ndCB0aGluayB3ZSBuZWVkDQo+IHRoZSBfQkFTRSBkZWZzIGF0IGFsbCBhbnltb3JlLg0KDQpZ
ZXMsIHdlIGNvdWxkLCBidXQgdGhpcyBoZWxwcyBkaWZmLWFiaWxpdHkgYWdhaW5zdCB0aGUgb3Jp
Z2luYWwgZmlsZSwgYW5kIEkgcmVhbGx5IGRvbid0IHRoaW5rIGl0J3MgdGhhdCBoYXJkIHRvIHBh
cnNlLg0KDQpbLi4uXQ0KPiA+ICsjZGVmaW5lIEFSTV9JUlEwX0JBU0UgICAgICAgICAgICAgICAg
ICA2NA0KPiANCj4gVGhpcyA2NCBzaG91bGRuJ3QgYmUgbmVlZGVkIGFueW1vcmUgd2l0aCB0aGUg
YXJtX2lycXMgbm93IGluIHRoZWlyIG93bg0KPiBlbnVtZXJhdGlvbiBzcGFjZS4gSXQgc2hvdWxk
IGp1c3QgY291bnQgZnJvbSAwIGFnYWluIChhbmQgSSB0aGluayB0aGUNCj4gb25seSB1c2FnZXMg
eW91IGhhdmUgb2YgdGhlc2Ugc3VidHJhY3Qgb2ZmIEFSTV9JUlEwX0JBU0UpLg0KDQpBZ3JlZWQu
IEkgd2FzIHBsYW5uaW5nIHRvIGFkZHJlc3MgdGhpcyBieSBzZXR0aW5nIEFSTV9JUlEwX0JBU0Ug
dG8gMCAoYWdhaW4gdG8ga2VlcCB0aGUgZGlmZiBlYXNpbHkgcmVhZGFibGUpLg0KDQo+ID4gKyNk
ZWZpbmUgSU5URVJSVVBUX0FSTV9USU1FUiAgICAgICAgICAgIChBUk1fSVJRMF9CQVNFICsgMCkN
Cj4gPiArI2RlZmluZSBJTlRFUlJVUFRfQVJNX01BSUxCT1ggICAgICAgICAgKEFSTV9JUlEwX0JB
U0UgKyAxKQ0KPiA+ICsjZGVmaW5lIElOVEVSUlVQVF9BUk1fRE9PUkJFTExfMCAgICAgICAoQVJN
X0lSUTBfQkFTRSArIDIpDQo+ID4gKyNkZWZpbmUgSU5URVJSVVBUX0FSTV9ET09SQkVMTF8xICAg
ICAgIChBUk1fSVJRMF9CQVNFICsgMykNCj4gPiArI2RlZmluZSBJTlRFUlJVUFRfVlBVMF9IQUxU
RUQgICAgICAgICAgKEFSTV9JUlEwX0JBU0UgKyA0KQ0KPiA+ICsjZGVmaW5lIElOVEVSUlVQVF9W
UFUxX0hBTFRFRCAgICAgICAgICAoQVJNX0lSUTBfQkFTRSArIDUpDQo+ID4gKyNkZWZpbmUgSU5U
RVJSVVBUX0lMTEVHQUxfVFlQRTAgICAgICAgIChBUk1fSVJRMF9CQVNFICsgNikNCj4gPiArI2Rl
ZmluZSBJTlRFUlJVUFRfSUxMRUdBTF9UWVBFMSAgICAgICAgKEFSTV9JUlEwX0JBU0UgKyA3KQ0K
PiANCj4gVGhlIGRlZnMgYWZ0ZXIgaGVyZSBhcmUgY29uZnVzaW5nLiBBcmUgdGhleSBmb3IgYSBk
aWZmZXJlbnQgU29DPyBJDQo+IHRob3VnaHQgdGhlIFNvQyB3YXMgbGltaXRlZCB0byA4IEFSTV8g
aXJxcz8NCg0KVGhpcyBzZWVtcyB0byBiZSBhbiBhcnRpZmFjdCBvZiB0aGUgd2F5IExpbnV4IG1h
bmFnZXMgdGhlIGludGVycnVwdCBjb250cm9sbGVyLiBTb21lIG9mIHRoZSBHUFUgSVJRcyBvbiB0
aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgYXJlIGFsaWFzZWQgaW50byBhbm90aGVyIHNldCBvZiBz
dGF0dXMgYml0cyB3aGVyZSB0aGV5IGNhbiBiZSBjaGVja2VkIGluIHRoZSBzYW1lIHJlYWQgYXMg
dGhlIEFSTSBJUlFzLiBJdCBsb29rcyBsaWtlIExpbnV4IHRyZWF0cyB0aG9zZSBhcyB0b3RhbGx5
IGRpZmZlcmVudCBpbnRlcnJ1cHRzLiBJJ2xsIGp1c3QgZGVsZXRlIHRoZW0gZnJvbSB0aGlzIGZp
bGUuDQoNCkFuZHJldw0K
