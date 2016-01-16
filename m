Received: by 10.25.159.19 with SMTP id i19csp770608lfe;
        Fri, 15 Jan 2016 16:04:25 -0800 (PST)
X-Received: by 10.140.132.212 with SMTP id 203mr16765585qhe.102.1452902663885;
        Fri, 15 Jan 2016 16:04:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si16067159qka.44.2016.01.15.16.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKELv-00044h-A5
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:04:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKELr-0003z4-TB
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 19:04:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKELq-0002Uo-MW
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 19:04:19 -0500
Received: from mail-bn1bon0133.outbound.protection.outlook.com
	([157.56.111.133]:26294
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKELk-0002U1-J1; Fri, 15 Jan 2016 19:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=s0f+OAHfBBXGZhTYaW/w8DtqpEVlCrof9P8lAsd8vT0=;
	b=mqo5wTVtna2Q4rejFHjRGMcb+IFfxJpAWDjSl/krYsa2KgzRmUIxvS/jmM7x+JtVpFSBmHMR/acLIsZ45B+tCOo4bMRtp+7CDbbRGgikKa623XX9DE7Ew6qnEUeYbtIuaJaElxTh/sdMCFj+2L5tMKp6G2UW479VoPJsXP/UpDU=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Sat, 16 Jan 2016 00:04:11 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.023; Sat, 16 Jan 2016 00:04:11 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v3 7/7] raspi: add raspberry pi 2 machine
Thread-Index: AQHRRCvQrdqc5QRVI0SWrS1zLOHRB573UnuAgAFA88CAABsYgIAEqsWg
Date: Sat, 16 Jan 2016 00:04:11 +0000
Message-ID: <BLUPR0301MB2034F58833ECB5A9F9B00B299ECE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
	<BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
In-Reply-To: <CAPokK=o8x9fRw7K-nfdhSVB=8De9bMi9tZiUq54cevvjNSDP2A@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:4::494]
x-ms-office365-filtering-correlation-id: ae997cb1-08db-498a-961f-08d31e088ffd
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:kBpWd0Ua5iGMrPIgwwDh8Kapf6gSDs7h89XAvy66ZCG6LDeTGbOYA+Ca7aq6VBXR65UaaZwsfkk3luQ6wTsLwRtANKz2T+FPF9L4UmCBinyFKZ4mch8vSzhiExM6OZPRRVKHlZ6aZaAw4h514HLKUg==;
	24:wFVTN7FZqnVH+IM39f1J7a1+Qp+adDHPTgX3U2bzwsEd8tpjyLpNS3tQu3L+8D25DCGAIcqsVTm57DfFW7catgB+xSGFVtbtwz6jSsZSjrs=
x-exchange-antispam-report-test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; UriScan:; 
x-microsoft-antispam-prvs: <BLUPR0301MB2034DAD774F16A1E2EEE8E749ECE0@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(520078)(5005006)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 0823A5777B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(164054003)(199003)(189002)(40100003)(1411001)(97736004)(76576001)(105586002)(74316001)(99286002)(106116001)(87936001)(106356001)(93886004)(5005710100001)(110136002)(5002640100001)(10290500002)(19580405001)(1220700001)(8990500004)(5001960100002)(4326007)(50986999)(122556002)(189998001)(2906002)(19580395003)(102836003)(81156007)(6116002)(10400500002)(1096002)(5004730100002)(586003)(2900100001)(11100500001)(86362001)(77096005)(2950100001)(15975445007)(54356999)(10090500001)(5003600100002)(33656002)(86612001)(101416001)(5008740100001)(76176999)(92566002)(3826002);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2016 00:04:11.1048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.133
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
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
X-TUID: wy6WRtp95MMS

SGkgUGV0ZXIsDQoNCj4gRnJvbTogUGV0ZXIgQ3Jvc3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0
ZXBldGVyQGdtYWlsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgMTIgSmFudWFyeSAyMDE2IDE2OjQ0
DQo+IE9uIFR1ZSwgSmFuIDEyLCAyMDE2IGF0IDM6NTMgUE0sIEFuZHJldyBCYXVtYW5uDQo+IDxB
bmRyZXcuQmF1bWFubkBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPj4gRnJvbTogUGV0ZXIgQ3Jv
c3Rod2FpdGUgW21haWx0bzpjcm9zdGh3YWl0ZXBldGVyQGdtYWlsLmNvbV0NCj4gPj4gU2VudDog
TW9uZGF5LCAxMSBKYW51YXJ5IDIwMTYgMTk6NTgNCj4gPiBbLi4uXQ0KPiA+PiA+ICtzdGF0aWMg
dm9pZCB3cml0ZV9ib2FyZF9zZXR1cChBUk1DUFUgKmNwdSwgY29uc3Qgc3RydWN0DQo+IGFybV9i
b290X2luZm8NCj4gPj4gKmluZm8pDQo+ID4+DQo+ID4+IFRoaXMgaXMgYWxtb3N0IGlkZW50aWNh
bCB0byBIaWdoYmFuaywgSSdtIGd1ZXNzaW5nIHlvdSBhcmUgc3R1YmJpbmcgbW9uaXRvcg0KPiA+
PiBmaXJtd2FyZSB3aGVyZSB5b3UgZ2V0IGF3YXkgd2l0aCBub3BwaW5nIGFsbCB0aGUgU01Dcz8g
TWF5YmUgd2UNCj4gc2hvdWxkDQo+ID4+IHNwbGl0DQo+ID4+IEhpZ2hiYW5rcyB2ZXJzaW9uIG9m
ZiB0byBjb21tb24gY29kZSwgYW5kIHBhcmFtZXRlcmlzZSB0aGUgZmV3DQo+ID4+IGRpZmZlcmVu
Y2VzLg0KPiA+Pg0KPiA+PiB3cml0ZV9ib2FyZF9zZXR1cF9kdW1teV9tb25pdGlvcihBUk1DUFUg
KmNwdSAuLi4sIHVpbnQzMl90DQo+IHNjcl9mbGFncyk7DQo+ID4+DQo+ID4+IG9yIHNvbWV0aGlu
ZyBsaWtlIGl0LiBNYWtlcyBzZW5zZSB0byBiZSBpbiBhcm0vYm9vdC5jIC4NCj4gPg0KPiA+IEFj
dHVhbGx5LCBJIGFkZGVkIHRoaXMgb25seSB0byBtYWtlIExpbnV4IGhhcHB5IChhbmQgeWVzLCBp
dCB3YXMgZGVyaXZlZA0KPiBmcm9tIGhpZ2hiYW5rKS4gV2l0aG91dCBpdCwgSSB3YXMgc2VlaW5n
IGNvbXBsYWludHMgYWJvdXQ6DQo+ID4gSWdub3JpbmcgYXR0ZW1wdCB0byBzd2l0Y2ggQ1BTUl9B
IGZsYWcgZnJvbSBub24tc2VjdXJlIHdvcmxkIHdpdGgNCj4gU0NSLkFXIGJpdCBjbGVhcg0KPiA+
IElnbm9yaW5nIGF0dGVtcHQgdG8gc3dpdGNoIENQU1JfRiBmbGFnIGZyb20gbm9uLXNlY3VyZSB3
b3JsZCB3aXRoIFNDUi5GVw0KPiBiaXQgY2xlYXINCj4gPg0KPiA+IEkgZG9uJ3QgYmVsaWV2ZSBh
bnl0aGluZyBhY3R1YWxseSB1c2VzIHRoZSBTTUMgaGFuZGxlciBhZnRlciBib290LiBJIHRoaW5r
IGl0J3MNCj4ganVzdCBhbiBhcmNoaXRlY3R1cmFsIHJlcXVpcmVtZW50IHRvIGZsdXNoIHRoZSBj
aGFuZ2UgdG8gbm9uLXNlY3VyZSBtb2RlLg0KPiA+DQo+ID4gSSB3b3VsZCBwcmVmZXIgbm90IHRv
IHRvdWNoIGhpZ2hiYW5rLCBiZWNhdXNlIEkgZG9uJ3Qga25vdyBob3cgdG8gdGVzdCBpdC4NCj4g
SXMgaXQgYmV0dGVyIHRvIHN1Ym1pdCB0aGlzIHBhdGNoIHdpdGhvdXQgdGhlIGJvYXJkIHNldHVw
Pw0KPiA+DQo+IA0KPiBJIGNhbiB0ZXN0IEhpZ2hiYW5rIGZvciB5b3UsIG9yIHlvdSBjYW4gdXNl
IHRoaXMgcHJvamVjdDoNCj4gDQo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwv
cWVtdS1kZXZlbC8yMDE1LTEwL21zZzAwNzU1Lmh0bWwNCj4gDQo+IFRoZSBidWlsZCB0YWtlcyBh
IHdoaWxlIGFuZCBjb3N0cyBhYm91dCA1MEdCIG9mIGRpc2sgc3BhY2UsIGJ1dCB0aGUNCj4gYW1v
dW50IG9mIHNldHVwIG5lZWRlZCBzaG91bGQgYmUgcHJldHR5IGxvdy4NCj4gDQo+IEZXSVcsIHRo
YXQgd2FzIHRoZSB0ZXN0IHN5c3RlbSB0aGF0IGZvdW5kIHRoZSBuZWVkIGZvciB0aGlzIEZXIGlu
IEhCLg0KDQpJZiBpdCdzIGVhc3kgZm9yIHlvdSwgSSdkIHByZWZlciBpZiB5b3UgY291bGQgdGVz
dCB3aXRoIEhpZ2hiYW5rLiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gYXBwbHkgcGF0Y2ggNy84IGZy
b20gdjQgb2YgdGhlIHNlcmllcyAoc2VudCBqdXN0IG5vdykgaW5kZXBlbmRlbnRseS4gVGhlIGNo
YW5nZXMgYXJlIG1pbm9yIGJ1dCBzaWduaWZpY2FudDogbW9zdGx5IGF2b2lkaW5nIGFybXY3IGlu
c3RydWN0aW9ucyBsaWtlIG1vdncsIGFuZCBsb2FkaW5nIHRoZSB2ZWN0b3JzIGFuZCBzZXR1cCBj
b2RlIGFzIHNlcGFyYXRlIFJPTSBibG9icy4gT3ZlcmFsbCwgSSdtIHN0aWxsIGEgbGl0dGxlIHdv
cnJpZWQgYWJvdXQgdGhlIGxvbmctdGVybSBtYWludGFpbmFiaWxpdHkgb2YgdGhpcyBhcHByb2Fj
aCB2ZXJzdXMgc2VwYXJhdGUgY29waWVzLi4uDQoNClRoYW5rcywNCkFuZHJldw0K
