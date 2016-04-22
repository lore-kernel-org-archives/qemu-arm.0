Received: by 10.25.208.194 with SMTP id h185csp706722lfg;
        Fri, 22 Apr 2016 04:30:33 -0700 (PDT)
X-Received: by 10.140.132.68 with SMTP id 65mr22234403qhe.13.1461324632932;
        Fri, 22 Apr 2016 04:30:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si3223508qkb.7.2016.04.22.04.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 04:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atZI8-0000TU-Em
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 07:30:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZI5-0000Qh-JH
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1atZI1-0006e7-CX
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 07:30:29 -0400
Received: from mail-bn1on0144.outbound.protection.outlook.com
	([157.56.110.144]:14363
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1atZI1-0006e1-84; Fri, 22 Apr 2016 07:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QlNuPoz6frwrmxb2zbjhQLzgeIp0B8n5yflTa6v/Hbo=;
	b=Gp4MI51sNpSzX7Op+1n6v3hqsgbyaXxehBBZibrKx6GvyWIfNaqGYnS/DT8cwe0fy+GqpFuB0A5kX+GY1SBljQdxm0LoXBiJZ9IedyzcaNnbxIbyzV6ypywFjiMjsi6mjubivqyRlcrZyEbMa75faZ8g++s3mbuBkRpOrXpnBvg=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.466.19; Fri, 22 Apr 2016 11:30:23 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0466.023; Fri, 22 Apr 2016 11:30:24 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Thread-Topic: [Qemu-devel] [PATCH] bcm2835_property: use cached values when
	querying framebuffer
Thread-Index: AQHRm7rAwTQCsYYe8ka5xOiKXwkpeJ+V2eUQgAACZYCAAABFAA==
Date: Fri, 22 Apr 2016 11:30:23 +0000
Message-ID: <BLUPR0301MB203485DA67E205999C1F0AC49E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<BLUPR0301MB20342C97DD66FA58E3462B889E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<19E314DF-2836-4020-94F1-4D1B39CD6E6C@sylvaingarrigues.com>
In-Reply-To: <19E314DF-2836-4020-94F1-4D1B39CD6E6C@sylvaingarrigues.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sylvaingarrigues.com; dkim=none (message not signed)
	header.d=none;sylvaingarrigues.com; dmarc=none action=none
	header.from=microsoft.com;
x-originating-ip: [82.50.189.71]
x-ms-office365-filtering-correlation-id: 3126be0c-bcc0-4149-1114-08d36aa17eec
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:1aY5PJgUx6k7oVsAOuRk9mmdV8maiWmatTgpdd6UgxY6Z8+zIwebOQ96CxEcFKJHjfF4JiG5VCSNda/1aVzsEBRnHbJ70I0A+wEyNd/e7WGM8i+m70YUnIk6syGyeTK1Sd+4NIt2Y1YKN71oB6eonAoevSXMJN55rJREnYg+ekr5D3pyhE4sfj2VJSemJY+Q;
	24:3JdFjVyzjrznJH3DcqC7HKUj+YuNuKKPnIUP7KPa0lb+j8xgQCFZKtZd9rCerahT+F4JME5nziFh/FOcY58Q22BrQg+xUjL0XlBl9YGWPUg=;
	7:AmnL4sBkDJvfYcZoedRdRHEcrBunHgBjcR1/TX4aDSh6x3xoLMVloeyb0Jzjm7sWi7EVumq5fwMn+H5PejlgBDm36ros2UfvJBmjjPn+SmjzRfBtdo13WJZygO89MFxRMLim9iK/zZl6mKvkBe/uUb+NiylE85ct67FoSa8DW/gPIhjHYAoZBieciushUyg7w0zXVIO9SkxdrjhAJqezyym/nwrGsgku68KnhbMP8LtgIQePuODpvvrRZ1fUS9GB
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB2036624032A602EF7EA6DF559E6F0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(9101521026)(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(52044002)(86612001)(54356999)(77096005)(19580395003)(66066001)(5004730100002)(2900100001)(5003600100002)(2950100001)(19580405001)(106116001)(86362001)(74316001)(87936001)(122556002)(50986999)(33656002)(76176999)(586003)(4326007)(189998001)(10090500001)(9686002)(6116002)(5008740100001)(3846002)(102836003)(10400500002)(92566002)(10290500002)(5005710100001)(81166005)(1220700001)(3280700002)(2906002)(1096002)(110136002)(5002640100001)(3660700001)(15760500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2016 11:30:23.9800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 62nmFxWJ3DJ1

PiBGcm9tOiBTeWx2YWluIEdhcnJpZ3VlcyBbbWFpbHRvOnN5bHZhaW5Ac3lsdmFpbmdhcnJpZ3Vl
cy5jb21dDQo+IFNlbnQ6IEZyaWRheSwgMjIgQXByaWwgMjAxNiAxMzoyNw0KPiANCj4gTGUgMjIg
YXZyLiAyMDE2IMOgIDEzOjIyLCBBbmRyZXcgQmF1bWFubg0KPiA8QW5kcmV3LkJhdW1hbm5AbWlj
cm9zb2Z0LmNvbT4gYSDDqWNyaXQgOg0KPiA+PiArICAgICAgICAgICAgc3RsX2xlX3BoeXMoJnMt
PmRtYV9hcywgdmFsdWUgKyAxNiwgdG1wX3hyZXMgKiB0bXBfeXJlcw0KPiA+PiArICogKHRtcF9i
cHAgPj4gMykpOw0KPiA+DQo+ID4gUGVyc29uYWwgc3R5bGUgbml0OiBJIHByZWZlciAqIDggcmF0
aGVyIHRoYW4gPj4gMywgYmVjYXVzZSBpdCdzIG1vcmUgaW1tZWRpYXRlbHkNCj4gb2J2aW91cyB3
aGF0IHlvdSdyZSBjb21wdXRpbmcsIGEgdHJpdmlhbCBvcHRpbWlzYXRpb24gZm9yIHRoZSBjb21w
aWxlciwgYW5kIGluDQo+IHRoaXMgc3BlY2lmaWMgZXhhbXBsZSB3b3VsZG4ndCBuZWVkIHRoZSBi
cmFja2V0cyB0byBlbnN1cmUgdGhlIGNvcnJlY3Qgb3BlcmF0b3INCj4gcHJlY2VkZW5jZS4NCj4g
Pg0KPiA+IEJ1dCBpbiBhbnkgY2FzZSwNCj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEJhdW1hbm4g
PEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+DQo+IA0KPiANCj4gVGhhbmtzISBJdCBpcyBh
Y3R1YWxseSAvIDgsIGJ1dCBJIHVzZWQgPj4gMyB0byByZW1haW4gY29uc2lzdGVudCB3aXRoIHdo
YXQgSSByZWFkDQo+IGluIGh3L2Rpc3BsYXkvYmNtMjgzNV9mYi5jLiBGZWVsIGZyZWUgdG8gYWRh
cHQuDQoNCkR1aCwgeWVzIHNvcnJ5IGl0J3Mgb2J2aW91c2x5IC84LiBUaGUgX2ZiIGNvZGUgd2Fz
IHByb2JhYmx5IGxpa2UgdGhhdCBpbiB0aGUgb3JpZ2luYWwgdmVyc2lvbi4NCg0KQnV0IEkgd29u
J3QgYmUgbWVyZ2luZyB0aGlzIHBhdGNoIChob3BlZnVsbHkgUGV0ZXIgY2FuIGRvIHRoYXQ/KSwg
c28gaXQncyBwcm9iYWJseSBiZXN0IGlmIHlvdSBtYWtlIHRoZSB0d2VhayBhbmQgcmVzZW5kIHdp
dGggbXkgUmV2aWV3ZWQtYnkuDQoNCkFuZHJldw0K
