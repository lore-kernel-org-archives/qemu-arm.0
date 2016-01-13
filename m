Received: by 10.25.159.19 with SMTP id i19csp804943lfe;
        Tue, 12 Jan 2016 16:09:14 -0800 (PST)
X-Received: by 10.140.146.198 with SMTP id 189mr147532686qhs.76.1452643753944;
        Tue, 12 Jan 2016 16:09:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 100si13224321qgx.37.2016.01.12.16.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 16:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:34658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ8zx-0004yP-9o
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 19:09:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ8zv-0004vZ-2Z
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 19:09:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ8zu-0002EF-0m
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 19:09:11 -0500
Received: from mail-by2on0142.outbound.protection.outlook.com
	([207.46.100.142]:45024
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aJ8zp-0002DC-Bp; Tue, 12 Jan 2016 19:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=p78ZfIoQERJzL9U4hFbM+TFHZ8QX7KzA5P1p7AnYJZk=;
	b=jN2fY6tboPScvWx0pKg5V0mhx5Ppu0ciDEnuTSQD0d8cvxlh89/0pfVVvmW01wifvzYBcvjI4JOZSv+HG2jTkf9ltrIYuis7Lm+sr8D7hTSwMmABSSUJaQVyO29JokvY+9fdFMn4aO5gYfV2S4lIma5OoJoj+0RnFDy9kpoeK7c=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 13 Jan 2016 00:09:03 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.022; Wed, 13 Jan 2016 00:09:03 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v3 6/7] bcm2836: add bcm2836 soc device
Thread-Index: AQHRRCvQIPEuTVmAsEC1AOoPDIhrcJ73UiqAgAEZ3hCAACmiAIAADokQ
Date: Wed, 13 Jan 2016 00:09:02 +0000
Message-ID: <BLUPR0301MB2034170ADB88F21D467120BF9ECB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-7-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035645.GC3308@pcrost-box>
	<BLUPR0301MB20349F632BDD3C52631961259ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=rT2LcLQk0JwpXrBNJ-v418asBZjzz+zjS_OzwhfONVZw@mail.gmail.com>
In-Reply-To: <CAPokK=rT2LcLQk0JwpXrBNJ-v418asBZjzz+zjS_OzwhfONVZw@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2033;
	5:6r+8Hh9ref/l3q33nIAcjT6uMHKKqteqnbARojuR70P1eMXOg9b6hLWjgyyhJkmqnhPxqn7Pz84CF80+OB/47eNhfG1OhpqnTwsAshwqxAy/H61VIrBOtJKVdGQH6jmVgWZ6wl9nJNjfIZaijTJ1RQ==;
	24:Z30MvvHEFcMPMIjsnqzmd82TJK/fE62ZusyWNwp1QF4rarMZhacTzaEagghweRc9CZq8RV4GdxYetxa9nM+SdZp1vbwXqmx/zBia+WZ6958=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
x-ms-office365-filtering-correlation-id: 926023d7-ee72-403c-ae0b-08d31badbec1
x-microsoft-antispam-prvs: <BLUPR0301MB20332C729CBC334DEEC4E0F69ECB0@BLUPR0301MB2033.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(520078)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
x-forefront-prvs: 08200063E9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(199003)(377454003)(189002)(106356001)(586003)(2906002)(106116001)(5004730100002)(2950100001)(93886004)(4326007)(101416001)(5003600100002)(11100500001)(5002640100001)(110136002)(189998001)(2900100001)(33656002)(81156007)(86362001)(87936001)(97736004)(19580395003)(5001960100002)(1411001)(122556002)(1220700001)(76576001)(8990500004)(10290500002)(76176999)(6116002)(10400500002)(86612001)(77096005)(19580405001)(1096002)(40100003)(50986999)(102836003)(74316001)(92566002)(54356999)(10090500001)(105586002)(99286002)(5005710100001)(5008740100001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2016 00:09:02.8184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.142
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 6/7] bcm2836: add bcm2836 soc device
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
X-TUID: Zkc6dSh7UTS2

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBUdWVzZGF5LCAxMiBKYW51YXJ5IDIwMTYgMTU6MTUNCj4gT24gVHVlLCBK
YW4gMTIsIDIwMTYgYXQgMjo1NiBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVtYW5u
QG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFp
bHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwuY29tXQ0KPiA+PiBTZW50OiBNb25kYXksIDExIEph
bnVhcnkgMjAxNiAxOTo1Nw0KPiA+PiBPbiBUaHUsIERlYyAzMSwgMjAxNSBhdCAwNDozMTozM1BN
IC0wODAwLCBBbmRyZXcgQmF1bWFubiB3cm90ZToNCj4gPj4gPiArICAgIC8qIFRPRE86IHByb2Jh
Ymx5IHNob3VsZG4ndCBiZSB1c2luZyBzbXBfY3B1cyBoZXJlICovDQo+ID4+DQo+ID4+IEkgYWdy
ZWUuIEkgaGF2ZSBzdGFydGVkIGlnbm9yaW5nIHNtcF9jcHVzIGNvbXBsZXRlbHkgZm9yIG5ldyBB
Uk0gU29DcywNCj4gPj4gYXMgaWYgeW91IGNoYW5nZSB0aGUgbnVtYmVyIG9mIENQVXMgZm9yIGEg
U29DLCBpdCBpcyBub3QgdGhhdCBTb0MNCj4gPj4gYW55bW9yZS4gVGhlIHZpcnQgcGxhdGZvcm0g
aXMgc3VpdGFibGUgZm9yIENQVSBzY2FsYWJpbGl0eSwgd2hlcmVhcw0KPiA+PiB3aXRoIEFSTSBT
b0NzLCBjcHUgIyB2YXJpYXRpb24gaXMgaW52YWxpZC4NCj4gPj4NCj4gPj4gPiArICAgIGFzc2Vy
dChzbXBfY3B1cyA8PSBCQ00yODM2X05DUFVTKTsNCj4gPj4gPiArICAgIGZvciAobiA9IDA7IG4g
PCBzbXBfY3B1czsgbisrKSB7DQo+ID4+DQo+ID4+IFNvIGNhbiB3ZSBqdXN0IHVzZSBCQ00yODM2
X05DUFVTIGhlcmUgYXMgdGhlIGxvb3AgYm91bmQ/IEFueQ0KPiA+PiBjb25kaXRpb25hbHMgb3V0
IHRoZXJlIGNoZWNrIHRoZSBleGlzdGFuY2Ugb2YgQ1BVcyBjYW4gYmUgcmVtb3ZlZCBvcg0KPiA+
PiBwcm9tb3RlZCB0byBhc3NlcnQoKSBhcyBhIEJDTTI4MzYgbXVzdCBhbHdheXMgaGF2ZSA0IENQ
VXMuDQo+ID4NCj4gPiBJJ2QgbG92ZSB0byBkbyB0aGF0LCBidXQgdGhlcmUncyBhdCBsZWFzdCBv
bmUgZ29vZCByZWFzb24gdG8gcmVzcGVjdCB0aGUgLXNtcA0KPiBwYXJhbWV0ZXIgYW5kIG5vdCBz
dGFydCBhbGwgdGhlIENQVXM6IHdpdGggZnVsbC1zeXN0ZW0gZW11bGF0aW9uLCBxZW11IGlzDQo+
IG5vdGljZWFibHkgZmFzdGVyIGVtdWxhdGluZyBhIHNpbmdsZS1jb3JlIHRhcmdldCB0aGFuIG11
bHRpLWNvcmUuIEUuZy4sIExpbnV4DQo+IGJvb3RzIGZpbmUgd2l0aCAtc21wIDEgKGl0IGZhaWxz
IHRvIHN0YXJ0IHRoZSBvdGhlciBDUFVzIGJ1dCBwcm9jZWVkcyB3aXRoIGp1c3QNCj4gb25lKSwg
YW5kIG1hbnkgdXNlcnMgd2lsbCBiZSBiZXR0ZXIgb2ZmIHJ1bm5pbmcgaXQgdGhpcyB3YXksIHNv
IEkgZGVmaW5pdGVseQ0KPiBkb24ndCB3YW50IHRvIGJyZWFrIHRoYXQuDQo+ID4NCj4gDQo+IFdo
YXQgYXJlIHRoZSBzZWNvbmRhcnkgQ1BVcyBkb2luZyBpbiB0aGlzIGNhc2U/IEluIG1vc3Qgc3lz
dGVtcyB0aGV5DQo+IGVuZCB1cCBwZW5uaW5nIG9uIGEgV0ZJL1dGRS4gSXMgTGludXggYWN0dWFs
bHkgdHJ5aW5nIHRvIGRvIHRoZSBTTVANCj4gYnJpbmd1cCAtIGFyZSB5b3UgYXJlIGdldHRpbmcg
YSBzZWNvbmRhcnkgZW50cnkgcG9pbnQ/DQo+IA0KPiBJZiBub3QgYW5kIGl0IGlzIGp1c3QgYSBi
dXN5IHdhaXQga2lsbGluZyBwZXJmLCBzdGFydC1wb3dlcmVkLW9mZg0KPiBwcm9wZXJ0eSBtaWdo
dCBoZWxwLiBJcyB0aGUgZmlybXdhcmUgcmVzcG9uc2libGUgZm9yIHNlY29uZGFyeS1wZW5uaW5n
DQo+IGFuIGFjdHVhbCBidXN5LXdhaXQgb3IgZG9lcyBpdCBpbnZvbHZlIHBvd2VyLWNvbnRyb2wg
cGVyaXBocyBldGM/DQoNClllcywgaXQgaXMgYSBidXN5LXdhaXQgaW4gbXkgc21wYm9vdCBibG9i
LiAoSSBzdXBwb3NlIEkgY291bGQgZmlndXJlIG91dCBob3cgdG8gcmVwbGFjZSBpdCB3aXRoIGFu
IGludGVycnVwdC1kcml2ZW4gdmVyc2lvbiwgYnV0IGl0IHNlZW1lZCBsaWtlIGEgbG90IG9mIHBv
aW50bGVzcyB3b3JrIGNvbXBhcmVkIHRvIG5vdCBzdGFydGluZyB0aGUgQ1BVLikgT24gYSBmaXJz
dCBxdWljayB0ZXN0LCB0aGF0IHByb3BlcnR5IHNlZW1zIHRvIGRvIHRoZSB0cmljaywgdGhhbmtz
Lg0KDQpBbmRyZXcNCg==
