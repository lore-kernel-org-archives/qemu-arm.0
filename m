Received: by 10.182.158.201 with SMTP id ww9csp132092obb;
        Wed, 25 Nov 2015 10:15:10 -0800 (PST)
X-Received: by 10.55.74.200 with SMTP id x191mr35031653qka.28.1448475310721;
        Wed, 25 Nov 2015 10:15:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m82si22058762qki.10.2015.11.25.10.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 10:15:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:47032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1eb0-0008MW-AY
	for alex.bennee@linaro.org; Wed, 25 Nov 2015 13:15:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1eay-0008IH-9E
	for qemu-arm@nongnu.org; Wed, 25 Nov 2015 13:15:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1eax-0006Ke-6l
	for qemu-arm@nongnu.org; Wed, 25 Nov 2015 13:15:08 -0500
Received: from mail-by2on0114.outbound.protection.outlook.com
	([207.46.100.114]:21584
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a1eaq-0006Dp-SQ; Wed, 25 Nov 2015 13:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3HWx/ktiZ4i2e/edWxuSIzJcj/DWnX/xsGIGMDbzZlk=;
	b=H5b1Me37PZGZDrqI4hjAZ0sB3TZ9lbgGcTkXcxtHu8WDE0gKfE6iKqxQ538tTqNi8gwTeXoJrEZAH2Z0xemvhTtrsreTpmM4fFv+X3RFDZE/PSEuLN32sdKpsEVK5XRXjdWVUmNsHpbQ+AuqEZZw5NqUTy3fkRwSj1EYZV9/ILs=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Wed, 25 Nov 2015 18:14:58 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0331.023; Wed, 25 Nov 2015 18:14:58 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQDOg3SAABS0aqAAA+N6AAEDWg8QAEBZ1YAABojOgAAStxVw
Date: Wed, 25 Nov 2015 18:14:58 +0000
Message-ID: <BLUPR0301MB2034372751CF518EE0A3067B9E050@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
	<BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
	<CAPokK=p6yG3JHPR0zcd14xTAE-JNk9ezVSr5hriX9xWpiOaV5A@mail.gmail.com>
	<CAFEAcA86U8yuTA7w_M5OsJOGdYm49+MqtXP7y09QDXTzKyVzkA@mail.gmail.com>
In-Reply-To: <CAFEAcA86U8yuTA7w_M5OsJOGdYm49+MqtXP7y09QDXTzKyVzkA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:b::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:yEL0Nuouh2f6awVGeUf2EAhh5c5zb8yL9VrDinf3GfakEEb678jRG280ZYSyAQwjTy2O9NtsvjUyZocPYeYCPswmxnHSYN+ILA1Qj3x/rbddhYkkjluqHiqt0y3J+6b1pQMA7LXR/ngjmqqW73Uk4Q==;
	24:fDAZficUEl1GvdBtgBffwQz9SeTt38SE86ppKn5WpdguM7nGZCFfHYHlfyaBM6vUl1SwQOWgpHu1s5q+Ds3FQyPm1e7UVySNpL8eHxo6CLY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB2035A15E55D316B2B6AC75C99E050@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(108003899814671);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046)(61426024)(61427024);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 0771670921
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(164054003)(24454002)(377454003)(199003)(230783001)(87936001)(5001960100002)(5001770100001)(40100003)(189998001)(81156007)(97736004)(11100500001)(92566002)(5007970100001)(5004730100002)(5008740100001)(19580395003)(19580405001)(10290500002)(93886004)(5005710100001)(10090500001)(74316001)(5003600100002)(10400500002)(86362001)(8990500004)(99286002)(77096005)(2950100001)(2900100001)(105586002)(5002640100001)(106356001)(33656002)(122556002)(6116002)(102836003)(76176999)(54356999)(586003)(101416001)(76576001)(50986999)(1220700001)(86612001)(7059030)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2015 18:14:58.3772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.114
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>, Stefan
	Weil <sw@weilnetz.de>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paolo
	Bonzini <pbonzini@redhat.com>
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
X-TUID: 0ntnrPODoQQ1

PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBXZWRuZXNkYXksIDI1IE5vdmVtYmVyIDIwMTUgMDE6MTENCj4gT24gMjUgTm92ZW1i
ZXIgMjAxNSBhdCAwNjowNCwgUGV0ZXIgQ3Jvc3Rod2FpdGUNCj4gPGNyb3N0aHdhaXRlcGV0ZXJA
Z21haWwuY29tPiB3cm90ZToNCj4gPiBPbiBUdWUsIE5vdiAyNCwgMjAxNSBhdCA0OjAwIFBNLCBB
bmRyZXcgQmF1bWFubg0KPiA+IDxBbmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPiB3cm90ZToN
Cj4gPj5JbiBnZW5lcmFsLCB3aGF0J3MgdGhlIGd1aWRhbmNlIG9uIHdoYXQgYmVsb25ncyBpbiBv
YmplY3QgaW5pdCB2cy4gdGhlDQo+IHJlYWxpemUgbWV0aG9kPw0KPiA+DQo+ID4gSWYgaXQgZG9l
c24ndCBkZXBlbmQgb24gcHJvcGVydHkgdmFsdWVzLCBpdCBnb2VzIGluIGluaXQuIElmIGl0IGRv
ZXMNCj4gPiByZWFsaXplLiBUb3AgbGV2ZWwgY29ubmVjdGl2aXR5IChlLmcuIGNvbm5lY3Rpbmcg
dG8gVUFSVHMgYXJlIGluaXRpbmcNCj4gPiBkcml2ZXMpIGdlbmVyYWxseSBhcmUgcmVhbGl6ZS4N
Cj4gDQo+IEFsc28sIHJlYWxpemUgaGFzIGEgbWVjaGFuaXNtIGZvciByZXBvcnRpbmcgZXJyb3Jz
ICh0aGUgRXJyb3IqKiBhcmd1bWVudCkNCj4gYW5kIGluc3RhbmNlIGluaXQgZG9lcyBub3QsIHNv
IGFueXRoaW5nIHRoYXQgbWlnaHQgZmFpbCBtdXN0IGdvIGluDQo+IHJlYWxpemUuDQoNCkhvdyBk
b2VzIHRoaXMgd29yayBvdXQgd2l0aCBvYmplY3RfcHJvcGVydHlfYWRkX2FsaWFzPyBJdCBjYW4g
ZmFpbCBhbmQgcmV0dXJucyBhbiBlcnJvciwgc28gaXQgc2hvdWxkIGJlIGNhbGxlZCBmcm9tIHJl
YWxpemUsIGJ1dCBpdCBhZGRzIGEgbmV3IHByb3BlcnR5IG9uIHRoZSBvYmplY3QsIHNvIHRoZSBw
cm9wZXJ0eSB3b24ndCBiZSB1c2VmdWwgaWYgaXQgY2FuIG9ubHkgYmUgc2V0IGFmdGVyIHJlYWxp
emUgaGFzIGFkZGVkIGl0Lg0KDQpJdCBzZWVtcyBsaWtlIGV2ZXJ5b25lIGNhbGxpbmcgb2JqZWN0
X3Byb3BlcnR5X2FkZF9hbGlhcyBwYXNzZXMgJmVycm9yX2Fib3J0LCBzbyBJIHN1cHBvc2UgdGhh
dCBpcyB0aGUgZ2V0LW91dC1vZi1qYWlsIGNhcmQgZm9yIHJlcG9ydGluZyBlcnJvcnMgZnJvbSBp
bml0Li4uDQoNClRoYW5rcywNCkFuZHJldw0K
