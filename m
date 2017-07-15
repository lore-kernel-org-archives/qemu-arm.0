Received: by 10.25.44.15 with SMTP id s15csp1613652lfs;
        Fri, 14 Jul 2017 17:15:18 -0700 (PDT)
X-Received: by 10.55.174.66 with SMTP id x63mr13962566qke.137.1500077718811;
        Fri, 14 Jul 2017 17:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500077718; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvGLPfuCZOqHxehs++ynAex1ntA8t/D31seo7zEUL0YbxZeCA6+RUPGhZkKoS5o+vR
         150lpp8QvS92eB9bSUFpRdn6K3q7Ycl1hGxxXDxiWvEr04Ckomvv1fgbDmCDz2MEb0Me
         r4qwZ11IFAZXbFQPyG5XMCdhbmdr41yA+IaKF7fxUia//feLFYNKEMdzXoJ8Ed2MKFYg
         U/FUpz4s2chdP1l7uFqYt1ejSNlM2hcEUg9N1r4KPxB4olDJy1em9GMHfLNPZnHGom4K
         lIqOlO7XRN66ntLzwerugTwP8yJU0+fAK/9YMh63cJlT7xwZa2u4gdGmImtVhbB7mej7
         Nr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=lGJQFf+uBVIuOawbGhbpZS3bvck+c1yHnE8/R/QSQNU=;
        b=wfTUsNuqrJ+K5PPFXm1S3vzG36psYb8pzeQ+sifTw2hczQ6KtSzIMwOQZC8NM9gAk/
         WZDj4+H3eMcWG0AeKYzeL6dyO68PgGJRQO2CFakIGNBbJoueDduwPzM919FZhmx03N4H
         sl+2aQbUbppqnoV2vmvMqxI4Ae/8C5yE6AC5e6LsQV6/shc16k0maEwHym4TgFOt/0AK
         zlAqXLnQVpcWE37kJVRWrRvdxfaACUzJpsu+M7PT9pDn8weNFrnhdyPferBZFuKrd34i
         4UItx6xwX3EkyzT/nSsQa6hJC/7mRnTBa8E4NPUExl2hPABxyQj97BdGDw7Rm+/zngzy
         zZcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si9242305qki.120.2017.07.14.17.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 17:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWAjs-0005Rk-71
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 20:15:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dWAjo-0005RS-MA
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 20:15:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dWAjl-0001yM-HL
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 20:15:12 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dWAjk-0001ti-NJ; Fri, 14 Jul 2017 20:15:09 -0400
Received: from 172.30.72.53 (EHLO DGGEMA403-HUB.china.huawei.com)
	([172.30.72.53])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ASC61800; Sat, 15 Jul 2017 08:14:52 +0800 (CST)
Received: from DGGEMA503-MBS.china.huawei.com ([169.254.2.48]) by
	DGGEMA403-HUB.china.huawei.com ([10.3.20.44]) with mapi id
	14.03.0301.000; Sat, 15 Jul 2017 08:14:43 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI structures and
	macros
Thread-Index: AdL8/1i3wXlI2eBPQQ+8MHAOFoTKEw==
Date: Sat, 15 Jul 2017 00:14:43 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F2014F2C8A@DGGEMA503-MBS.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.52.253]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.59695E7E.003D, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.2.48,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ff5a70503495e6eb5b5fcb3bc4704061
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/3] ACPI: Add new ACPI
 structures and macros
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Wuquanming <wuquanming@huawei.com>, "famz@redhat.com" <famz@redhat.com>,
	"Zhengqiang \(turing\)" <zhengqiang10@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Gaozhihui <zhihui.gao@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	Huangshaoyu <huangshaoyu@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47MEmCv7vQlj

SGkgTWljaGFlbA0KICBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gLS0tLS3pgq7ku7bl
jp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IE1pY2hhZWwgUy4gVHNpcmtpbiBbbWFpbHRvOm1zdEBy
ZWRoYXQuY29tXQ0KPiDkuLvpopg6IFJlOiBbUWVtdS1kZXZlbF0gW1BBVENIIHY1IDEvM10gQUNQ
STogQWRkIG5ldyBBQ1BJIHN0cnVjdHVyZXMgYW5kDQo+IG1hY3Jvcw0KPiANCj4gT24gVGh1LCBK
dWwgMTMsIDIwMTcgYXQgMDg6MDA6MjZQTSArMDgwMCwgZ2VuZ2RvbmdqaXUgd3JvdGU6DQo+ID4g
ICAgTGFzemxvLCBJIHBhc3RlZCBNaWNoYWVsJ3MgY29tbWVudHMgaGVyZSwgYXMgc2hvd24gYmVs
b3cuIE1pY2hhZWwNCj4gPiBzYWlkIHRoZSBkZWZpbml0aW9uIHNob3VsZCB1c2UgYnVpbGRfYXBw
ZW5kX2ludF9ub3ByZWZpeCB0byBhZGQgZGF0YS4NCj4gPiBidXQgSSB0aGluayBpdCBtYXkgbm90
IGdvb2QsIGJlY3Vhc2UgdGhlIHNlY3Rpb24NCj4gPiAiVUVGSV9DUEVSX1NFQ19QTEFURk9STV9N
RU0iIGlzIHJ1bnRpbWUgcmVjb3JkZWQgYXMgQ1BFUiwNCj4gDQo+IE9uZSB0aGluZyBJIHdhbnRl
ZCB0byB1bmRlcnN0YW5kIGlzIGhvdyBhcmUgcmFjZXMgYXZvaWRlZC4gRS5nLiB3aGF0IGlmIHlv
dSBhcmUNCj4gaW4gdGhlIHByb2Nlc3Mgb2Ygd3JpdGluZyBvdXQgQ1BFUiBhbmQgZ3Vlc3QgcmVh
ZHMgaXQuDQo+IEkgdHJpZWQgdG8gZmluZCB3aGVyZSBpcyB0aGlzIGZ1bmN0aW9uIHdyaXRpbmcg
Q1BFUiBjYWxsZWQgYW5kIGNvdWxkbid0Lg0KPiBDYW4geW91IGNsYXJpZnkgcGxzPw0KDQpNaWNo
YWVsLCBJIHVuZGVyc3RhbmQgeW91ciBpZGVhLiBZb3Ugd2FudCB0byBzZWUgdGhlIHJlYWQtd3Jp
dGUgcmFjZSBjb25kaXRpb24uDQp0aGlzIGZ1bmN0aW9uIHdyaXRpbmcgQ1BFUiBpcyBjYWxsZWQg
aW4gYW5vdGhlciBzZXJpZXMgb2YgcGF0Y2hlcy4gQmVjYXVzZSB0aGV5IGFyZSBuZWVkZWQNCnRv
IGJlIHJldmlldyB0b2dldGhlciB3aXRoIEtWTSBrZXJuZWwsIHNvIEkgcHV0IGl0IGluIGFub3Ro
ZXIgc2VyaWVzLg0KSSBjbGFyaWZ5IHRoZSBtZXRob2QgdG8gYXZvaWQgdGhlIHJlYWQtd3JpdGUg
cmFjZSBjb25kaXRpb24NCg0KQUNQSSA2LjEsICJHZW5lcmljIEhhcmR3YXJlIEVycm9yIFNvdXJj
ZSB2ZXJzaW9uIDIgKEdIRVN2MiAtIFR5cGUgMTApIiBoYXMgbWVudGlvbmVkIHRoZSBhdm9pZCBt
ZXRob2QuDQpGb3IgR0hFU3YyIGVycm9yIHNvdXJjZXMsIHRoZSBPUyBtdXN0IGFja25vd2xlZGdl
IHRoZSBjb25zdW1wdGlvbiBvZiB0aGUgRXJyb3IgU3RhdHVzIEJsb2NrIGJ5IHdyaXRpbmcgdG8g
dGhlIOKAnFJlYWQgQWNrIFJlZ2lzdGVy4oCdIGxpc3RlZCBpbiB0aGUgR0hFU3YyIHN0cnVjdHVy
ZQ0KDQpUaGVzZSBhcmUgdGhlIHN0ZXBzIHRoZSBPUyBtdXN0IHRha2Ugb25jZSBkZXRlY3Rpbmcg
YW4gZXJyb3IgZnJvbSBhIHBhcnRpY3VsYXIgR0hFU3YyIGVycm9yIHNvdXJjZToNCuKAoiBPUyBk
ZXRlY3RzIGVycm9yICh2aWEgaW50ZXJydXB0L2V4Y2VwdGlvbiBvciBwb2xsaW5nIHRoZSBibG9j
ayBzdGF0dXMpDQrigKIgT1MgY29waWVzIHRoZSBlcnJvciBzdGF0dXMgYmxvY2sNCuKAoiBPUyBj
bGVhcnMgdGhlIGJsb2NrIHN0YXR1cyBmaWVsZCBvZiB0aGUgZXJyb3Igc3RhdHVzIGJsb2NrDQri
gKIgT1MgYWNrbm93bGVkZ2VzIHRoZSBlcnJvciB2aWEgUmVhZCBBY2sgcmVnaXN0ZXIuIEZvciBl
eGFtcGxlOg0K4oCUT1MgcmVhZHMgdGhlIFJlYWQgQWNrIHJlZ2lzdGVyIO+DqCBYDQrigJRPUyB3
cml0ZXMg74OoICgoIFggJiBSZWFkQWNrUHJlc2VydmUpIHwgUmVhZEFja1dyaXRlKQ0KDQpTbyBp
biB0aGUgUWVtdSwgYmVmb3JlIFFlbXUgd3JpdGVzIHRoZSBuZXh0IENQRVIsIGl0IG5lZWRzIHRv
IGNoZWNrIHRoZSAiUmVhZCBBY2sgcmVnaXN0ZXIiLiBJZiB0aGUgIlJlYWQgQWNrIFJlZ2lzdGVy
IiBkb2VzIG5vdCBiZWVuIHdyaXR0ZW4gd2l0aCB0aGUgcmVzcG9uc2UsIFFlbXUgd2lsbCB3YWl0
IHVudGlsIA0KT1MgcmVzcG9uZHMgdGhlICJSZWFkIEFjayBSZWdpc3RlciIsIHNvIGNhbiBhdm9p
ZCB0aGUgcmVhZC13cml0ZSByYWNlIGNvbmRpdGlvbi4NCg0KSW4gbXkgcGF0Y2gsIGl0IG1pc3Nl
cyB0aGUgY2hlY2sgdG8gIlJlYWQgQWNrIFJlZ2lzdGVyIiB0byBhdm9pZCB0aGUgcmVhZC13cml0
ZSByYWNlIGNvbmRpdGlvbi4gSSB3aWxsIGFkZCB0aGUgY29kZSBpbiB0aGUgbmV4dCBjb2RlIHZl
cnNpb24uIA0KPiANCj4gPiBub3QgYSBBQ1BJL0hFU1QNCj4gPiB0YWJsZSBtZW1iZXIsIHNvIGl0
IGlzIG5vdCBnZW5lcmF0ZWQgd2hlbiBzeXN0ZW0gYm9vdCB1cC4gT24gdGhlIG90aGVyDQo+ID4g
aGFuZCxVRUZJX0NQRVJfU0VDX1BMQVRGT1JNX01FTSBkZWZpbml0aW9uIGlzIGZyb20gVUVGSSBz
cGVjIDIuNiwNCj4gTi4yLjIgU2VjdGlvbiBEZXNjcmlwdG9yOiB7MHhBNUJDMTExNCwgMHg2RjY0
LCAweDRFREUsIHsweEI4LCAweDYzLCAweDNFLA0KPiAweDgzLCAweEVELCAweDdDLCAweDgzLCAw
eEIxfX0uDQo+ID4gaWYgdXNlICBidWlsZF9hcHBlbmRfaW50X25vcHJlZml4IHRvIGFkZCwgbWF5
IGNvbmZ1c2Ugb3RoZXJzLg0KPiANCj4gUmlnaHQgYnV0IEFDUEkvSEVTVCBnZW5lcmF0aW9uIGNv
dWxkIHVzZSBjbGVhbnVwLCBhbmQNCj4gYnVpbGRfYXBwZW5kX2ludF9ub3ByZWZpeCB3b3VsZCBi
ZSBhIG5pY2Ugd2F5IHRvIGRvIGl0Lg0KDQpPaywgSSB3aWxsIGZvbGxvdyB5b3VyIG1ldGhvZCB0
byBkbyBpdC4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCg0KDQo+IA0KPiAtLQ0KPiBNU1QN
Cg==
