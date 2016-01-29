Received: by 10.25.159.19 with SMTP id i19csp742054lfe;
        Thu, 28 Jan 2016 20:42:15 -0800 (PST)
X-Received: by 10.140.95.111 with SMTP id h102mr8198066qge.2.1454042534901;
        Thu, 28 Jan 2016 20:42:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si15817448qgd.93.2016.01.28.20.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 20:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:59707 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP0sw-00061b-EQ
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 23:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aP0st-0005xt-KA
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:42:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aP0ss-0004MC-N8
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 23:42:11 -0500
Received: from mail-by2on0117.outbound.protection.outlook.com
	([207.46.100.117]:16450
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aP0so-0004Lu-1P; Thu, 28 Jan 2016 23:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RtdP5VLM8k7y84Ib91qtSB37xPquu1KwGaFgrsgyMlE=;
	b=M1whrKgXL8Pp6TPrkleGXrjhwbZhAFhfMgTU//3Hvh45XJci19SNFr6eM2rlW54RGCH+ci9pOkZeYTReFKvqjWXLDmnB/hhxi4pfMQ86V+ufwYlhofjh8brDTJiCSl2j21CiOHoOJDwQCDvqgtlkJ1AmGSOObr/RmRJ+WPSoknY=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 04:42:01 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0390.016; Fri, 29 Jan 2016 04:42:01 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v4 5/8] bcm2836_control: add bcm2836 ARM control logic
Thread-Index: AQHRT/DEXJISFmMDoUyt4myBgQgPJZ8R/b8AgAAAY+A=
Date: Fri, 29 Jan 2016 04:42:01 +0000
Message-ID: <BLUPR0301MB20349F06EDF3669231BD47609EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-6-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rmcqq4Vzi_JVUYXJ=sAdepTwYmME4BKveQXytMfTqi2w@mail.gmail.com>
In-Reply-To: <CAPokK=rmcqq4Vzi_JVUYXJ=sAdepTwYmME4BKveQXytMfTqi2w@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [50.46.154.109]
x-ms-office365-filtering-correlation-id: ba43b20d-6e7b-4cdb-cfa6-08d3286687ad
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:iqGhdzbO4Inf0AYJcJ9anB0T5gKzBm2+eC0NWAW+SrV6f7aQXHM1aQ5C0TXVRRD7lMqv9aj0+40qTBHIhWe0u5VM6J21M2mLGlo+jreMvx3gD2EESvFSz/n9wE8V2AVy0H1VaLGvgH8KodJgeT5khA==;
	24:oS7kyabYObcOpoIBdWN+NT3FP4sOF5ixe0LarfgGCNLn/KAVSTjRvW4+3ESkn6uYBttmuS4C+TOOsQPQQcxMRcAJk/rfe8iOV0GOsAO+WPM=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB2034656698AB3440A9F694FD9EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 083691450C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(377454003)(24454002)(51914003)(6116002)(11100500001)(40100003)(5008740100001)(5005710100001)(1096002)(3470700001)(5003600100002)(3846002)(102836003)(76576001)(3660700001)(586003)(3280700002)(74316001)(92566002)(122556002)(4326007)(1220700001)(33656002)(2906002)(110136002)(19580405001)(76176999)(8990500004)(19580395003)(54356999)(86612001)(10290500002)(5002640100001)(87936001)(10090500001)(77096005)(5004730100002)(10400500002)(99286002)(86362001)(189998001)(66066001)(106116001)(50986999)(2950100001)(1411001)(5001960100002)(2900100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2016 04:42:01.4962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.117
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [Qemu-arm] [PATCH v4 5/8] bcm2836_control: add bcm2836 ARM
	control logic
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
X-TUID: ZQ6LWmdRAn5o

SGkgUGV0ZXIsDQoNCj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0
ZXBldGVyQGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIDI4IEphbnVhcnkgMjAxNiAyMDoz
OA0KPiANCj4gT24gRnJpLCBKYW4gMTUsIDIwMTYgYXQgMzo1OCBQTSwgQW5kcmV3IEJhdW1hbm4N
Cj4gPEFuZHJldy5CYXVtYW5uQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiA+IFRoaXMgbW9kdWxl
IGlzIHNwZWNpZmljIHRvIHRoZSBiY20yODM2IChQaTIpLiBJdCBpbXBsZW1lbnRzIHRoZSB0b3AN
Cj4gPiBsZXZlbCBpbnRlcnJ1cHQgY29udHJvbGxlciwgYW5kIG1haWxib3hlcyB1c2VkIGZvciBp
bnRlci1wcm9jZXNzb3INCj4gPiBzeW5jaHJvbmlzYXRpb24uDQpbLi4uXQ0KPiA+ICsgICAgZm9y
IChpID0gMDsgaSA8IEJDTTI4MzZfTkNPUkVTOyBpKyspIHsNCj4gPiArICAgICAgICAvKiBoYW5k
bGUgbG9jYWwgdGltZXIgaW50ZXJydXB0cyBmb3IgdGhpcyBjb3JlICovDQo+ID4gKyAgICAgICAg
aWYgKHMtPnRpbWVyaXJxc1tpXSkgew0KPiA+ICsgICAgICAgICAgICBhc3NlcnQocy0+dGltZXJp
cnFzW2ldIDwgKDEgPDwgSVJRX01BSUxCT1gwKSk7IC8qIHNhbml0eSBjaGVjayAqLw0KPiA+ICsg
ICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgSVJRX01BSUxCT1gwOyBqKyspIHsNCj4gDQo+IEkg
dGhpbmsgPD0gSVJRX0NOVFZJUlEgaXMgY2xlYW5lciwgYXMgaXQga2VlcHMgIk1BSUxCT1giIG91
dCBvZiB0aGUgdGltZXINCj4gY29kZS4NCg0KT2suDQoNClsuLi5dDQo+ID4gK3R5cGVkZWYgc3Ry
dWN0IEJDTTI4MzZDb250cm9sU3RhdGUgew0KPiA+ICsgICAgLyo8IHByaXZhdGUgPiovDQo+ID4g
KyAgICBTeXNCdXNEZXZpY2UgYnVzZGV2Ow0KPiA+ICsgICAgLyo8IHB1YmxpYyA+Ki8NCj4gPiAr
ICAgIE1lbW9yeVJlZ2lvbiBpb21lbTsNCj4gPiArDQo+IA0KPiA+ICsgICAgLyogaW50ZXJydXB0
IHN0YXR1cyByZWdpc3RlcnMgKG5vdCBkaXJlY3RseSB2aXNpYmxlIHRvIHVzZXIpICovDQo+ID4g
KyAgICBib29sIGdwdV9pcnEsIGdwdV9maXE7DQo+ID4gKyAgICB1aW50OF90IHRpbWVyaXJxc1tC
Q00yODM2X05DT1JFU107DQo+ID4gKw0KPiANCj4gVGhpcyAuLi4NCj4gDQo+ID4gKyAgICAvKiBt
YWlsYm94ZXMgKi8NCj4gPiArICAgIHVpbnQzMl90IG1haWxib3hlc1tCQ00yODM2X05DT1JFUyAq
IEJDTTI4MzZfTUJQRVJDT1JFXTsNCj4gPiArDQo+ID4gKyAgICAvKiBpbnRlcnJ1cHQgcm91dGlu
Zy9jb250cm9sIHJlZ2lzdGVycyAqLw0KPiA+ICsgICAgdWludDhfdCByb3V0ZV9ncHVfaXJxLCBy
b3V0ZV9ncHVfZmlxOw0KPiA+ICsgICAgdWludDMyX3QgdGltZXJjb250cm9sW0JDTTI4MzZfTkNP
UkVTXTsNCj4gPiArICAgIHVpbnQzMl90IG1haWxib3hjb250cm9sW0JDTTI4MzZfTkNPUkVTXTsN
Cj4gPiArDQo+IA0KPiA+ICsgICAgLyogaW50ZXJydXB0IHNvdXJjZSByZWdpc3RlcnMsIHBvc3Qt
cm91dGluZyAodmlzaWJsZSkgKi8NCj4gPiArICAgIHVpbnQzMl90IGlycXNyY1tCQ00yODM2X05D
T1JFU107DQo+ID4gKyAgICB1aW50MzJfdCBmaXFzcmNbQkNNMjgzNl9OQ09SRVNdOw0KPiA+ICsN
Cj4gDQo+IEFuZCB0aGlzIGFyZSBhYnNlbnQgZnJvbSB0aGUgVk1TRCwgYnV0IGFmdGVyIHNvbWUg
dGhvdWdodCB0aGV5IGRvbid0DQo+IG5lZWQgdG8gYmUgYXMgdGhleSBhcmUgcHVyZSBmdW5jdGlv
bnMgb2YgdGhlIGlucHV0IHBpbiBzdGF0ZSB0aGF0IGlzDQo+IGFsd2F5cyByZWZyZXNoYWJsZSBm
cm9tIG90aGVyIHN0YXRlIG5vPyBJIHdvdWxkIHRoZXNlIHRvZ2V0aGVyIHdpdGggYQ0KPiBicmll
ZiBjb21tZW50IGFzIHRvIHRoZSBhYm92ZSwgYW5kIGtlZXAgdGhlIG1pZ3JhdGFibGUgc3RhdGUg
KGdlbnVpbmUNCj4gZGV2aWNlIHN0YXRlKSBhbGwgdG9nZXRoZXIuDQoNClllcywgdGhhdCB3YXMg
ZXhhY3RseSB0aGUgaW50ZW50aW9uLiBJJ2xsIGNvbW1lbnQvcmV2aXNlIGFzIHlvdSBzdWdnZXN0
Lg0KDQo+IFJldmlld2VkLWJ5OiBQZXRlciBDcm9zdGh3YWl0ZSA8Y3Jvc3Rod2FpdGUucGV0ZXJA
Z21haWwuY29tPg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcsDQpBbmRyZXcNCg0K
