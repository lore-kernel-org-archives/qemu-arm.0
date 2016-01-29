Received: by 10.25.159.19 with SMTP id i19csp1195494lfe;
        Fri, 29 Jan 2016 14:28:52 -0800 (PST)
X-Received: by 10.140.231.137 with SMTP id b131mr14843848qhc.63.1454106532138;
        Fri, 29 Jan 2016 14:28:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b110si120198qgf.45.2016.01.29.14.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHX9-0007ui-KX
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:28:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHX6-0007sV-OX
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:28:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHX5-00082N-RJ
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 17:28:48 -0500
Received: from mail-by2on0145.outbound.protection.outlook.com
	([207.46.100.145]:11776
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHWz-0007zC-Rp; Fri, 29 Jan 2016 17:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9QbLha254eLbfEzvJOsbhCaI+5YwwJbNBK2+MQXnCss=;
	b=iuRL6oHObY76qN0FyvC2+bHH9heAzBx2S0K1xZb/qHMSPJdF0HkrPfHd9V+nqAnAjXvGs4tLE6Mp7KxO5R8q7P2Xd38kobRrkdIAFUOBP9qvfxGV2WL5CcjSn+vAq3EjTsMbQUItSTJdHXwz523w+NWxpATQjn8jA47E4MdnF6c=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:28:39 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.017; Fri, 29 Jan 2016 22:28:39 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v4 8/8] raspi: add raspberry pi 2 machine
Thread-Index: AQHRT/DG10Xdqk9Vq0G0qXu0O32qRp8SLiwAgADtG8CAAAv3gIAAAGJQ
Date: Fri, 29 Jan 2016 22:28:39 +0000
Message-ID: <BLUPR0301MB2034C0FA82D60BAF82916E779EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-9-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=ory3pnNPsBgde12BqGGW_L3QOG0OVdtLNJomK0QhxxYQ@mail.gmail.com>
	<BLUPR0301MB2034170EF1FBCB3856E044FB9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pLw9OVv3_FHedk12byTu0gjGFy80UT1T1TUFTewi5kpg@mail.gmail.com>
In-Reply-To: <CAPokK=pLw9OVv3_FHedk12byTu0gjGFy80UT1T1TUFTewi5kpg@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:2::2e3]
x-ms-office365-filtering-correlation-id: 2519deab-a561-4f57-f9d0-08d328fb8967
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:pRhqjKP12xOHDVz02ZRTOEmWzNx9mtojkbkcKHh3j/KJPbyS0LvvU1hzMPgEXZXXu4ISsfDWb7x0zglJFqDCYJZ91yJu9qhcVLDItb5jaaf5M24AbZmi3un8/UJFExfDFDqjnO68c9WCZfgMtZxN0Q==;
	24:0V/Qa4HjmQDKDZtnqjzUxsW4TpTv/LmzMSInseS1lxeZPOyhGezXk42nTOjr7Eui/ZsEybQljuKWA2EWbnhTe2V9IIrjJyPGhJBtpYlfWxc=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB2035E16592B0901D6BBF548E9EDB0@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 083691450C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(1220700001)(2950100001)(102836003)(6116002)(99286002)(1096002)(3470700001)(5001960100002)(122556002)(15975445007)(1411001)(3280700002)(110136002)(86362001)(86612001)(2900100001)(189998001)(50986999)(76176999)(54356999)(93886004)(5003600100002)(586003)(76576001)(74316001)(5002640100001)(92566002)(3660700001)(4326007)(33656002)(10290500002)(40100003)(5008740100001)(87936001)(10090500001)(106116001)(8990500004)(5004730100002)(5005710100001)(77096005)(19580395003)(19580405001)(11100500001)(2906002)(10400500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2016 22:28:39.3910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.145
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 8/8] raspi: add raspberry pi 2 machine
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
X-TUID: bWHBPKSQO+Ui

PiBGcm9tOiBQZXRlciBDcm9zdGh3YWl0ZSBbbWFpbHRvOmNyb3N0aHdhaXRlcGV0ZXJAZ21haWwu
Y29tXQ0KPiBTZW50OiBGcmlkYXksIDI5IEphbnVhcnkgMjAxNiAxNDoyMw0KPiANCj4gT24gRnJp
LCBKYW4gMjksIDIwMTYgYXQgMTo1MCBQTSwgQW5kcmV3IEJhdW1hbm4NCj4gPEFuZHJldy5CYXVt
YW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4gVGhhbmtz
IGZvciBhbGwgdGhlIHJldmlld3MuIEkgc2hvdWxkIGhhdmUgYSByZXNwdW4gdmVyc2lvbiBvbiB0
aGUgbGlzdCBzaG9ydGx5Lg0KPiBUaGVyZSdzIG9uZSBtaW5vciBjaGFuZ2UgdG8gdGhpcyBsYXN0
IHBhdGNoOg0KPiA+DQo+ID4+IEZyb206IFBldGVyIENyb3N0aHdhaXRlIFttYWlsdG86Y3Jvc3Ro
d2FpdGVwZXRlckBnbWFpbC5jb21dDQo+ID4+IFNlbnQ6IFRodXJzZGF5LCAyOCBKYW51YXJ5IDIw
MTYgMjM6MzENCj4gPj4gPiBPbiBGcmksIEphbiAxNSwgMjAxNiBhdCAzOjU4IFBNLCBBbmRyZXcg
QmF1bWFubg0KPiA8QW5kcmV3LkJhdW1hbm5AbWljcm9zb2Z0LmNvbT4gd3JvdGU6DQo+ID4gIFsu
Li5dDQo+ID4+ID4gK3R5cGVkZWYgc3RydWN0IFJhc3BpU3RhdGUgew0KPiA+Pg0KPiA+PiBBIHF1
aWNrIGdvb2dsZSBzZWFyY2gsIEkgc2VlIHRoZSBjYW1lbCBjYXNlIGZvcm0gZm9yIHJwaSBpcyB1
c3VhbGx5DQo+ID4+ICJSYXNQaSIuIFNob3VsZCB3ZSBmb2xsb3c/DQo+ID4NCj4gPiBPay4NCj4g
Pg0KPiA+PiA+ICsgICAgdW5pb24gew0KPiA+Pg0KPiA+PiB1bmlvbiBub3QgbmVlZGVkLg0KPiA+
DQo+ID4gSSBrbm93IGl0J3Mgbm90IG5lZWRlZCBub3csIGJ1dCBpdCB3aWxsIGJlIGFzIHNvb24g
YXMgd2UgYWRkIHBpMSwgd2hpY2ggSQ0KPiBob3BlIHRvIGFkZHJlc3MgaW4gdGhlIG5leHQgcGF0
Y2ggc2VyaWVzLiBJdCB3aWxsIG1ha2UgdGhhdCBkaWZmIGNsZWFuZXIgaWYgd2UNCj4ga2VlcCB0
aGlzIGhlcmUgbm93LCBzbyBJJ20gZ29pbmcgdG8gbGVhdmUgaXQgYXMtaXMuIEkgaG9wZSB0aGF0
J3Mgb2sgd2l0aCB5b3UuDQo+ID4NCj4gDQo+IEl0IHNvdW5kcyBsaWtlIHlvdSBhcmUgaW1wbGVt
ZW50aW5nIGFuIGluaGVyaXRhbmNlIG91dHNpZGUgUU9NLiBJJ20NCj4gbm90IHN1cmUgYWJvdXQg
dGhpcywgY2FuIHdlIGp1c3QgZHJvcCB0aGUgdW5pb24gYW5kIGZpZ3VyZSBpdCBvdXQgb24NCj4g
dGhlIG5leHQgc2VyaWVzPw0KDQpJdCdzIG5vdGhpbmcgbmVhcmx5IHRoYXQgY2xldmVyL2NvbXBs
aWNhdGVkLiBTZWUgaHR0cHM6Ly9naXRodWIuY29tLzB4YWJ1L3FlbXUvYmxvYi9yYXNwaS9ody9h
cm0vcmFzcGkuYyNMMTE2DQoNCiAgICBzd2l0Y2ggKHZlcnNpb24pIHsNCiAgICBjYXNlIDE6DQog
ICAgICAgIG9iamVjdF9pbml0aWFsaXplKCZzLT5zb2MucGkxLCBzaXplb2Yocy0+c29jLnBpMSks
IFRZUEVfQkNNMjgzNSk7DQogICAgICAgIGJyZWFrOw0KICAgIGNhc2UgMjoNCiAgICAgICAgb2Jq
ZWN0X2luaXRpYWxpemUoJnMtPnNvYy5waTIsIHNpemVvZihzLT5zb2MucGkyKSwgVFlQRV9CQ00y
ODM2KTsNCiAgICAgICAgYnJlYWs7DQogICAgfQ0KDQpBbmQgdGhlbiBsYXRlciwgd2UgYWx3YXlz
IHJlZmVyIHNpbXBseSB0byBPQkpFQ1QoJnMtPnNvYykuIEkgc3VwcG9zZSBJIGNvdWxkIHVzZSBh
IGdlbmVyaWMgT2JqZWN0IHBvaW50ZXIgaW5zdGVhZCwgYW5kIGFsbG9jYXRlIHRoZSBzb2Mtc3Bl
Y2lmaWMgdHlwZSBlbHNld2hlcmUsIGJ1dCBpdCBzZWVtZWQgc2ltcGxlciB3aXRoIHRoZSB1bmlv
bi4NCg0KQW5kcmV3DQo=
