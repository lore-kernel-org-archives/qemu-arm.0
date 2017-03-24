Received: by 10.25.15.230 with SMTP id 99csp47310lfp;
        Fri, 24 Mar 2017 06:37:43 -0700 (PDT)
X-Received: by 10.55.43.23 with SMTP id r23mr7003820qkh.147.1490362663565;
        Fri, 24 Mar 2017 06:37:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m81si1909515qke.65.2017.03.24.06.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 06:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crPPT-0001eh-1R
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 09:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Ori.Chalak@huawei.com>) id 1crL4c-0006uG-4K
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 04:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Ori.Chalak@huawei.com>) id 1crL4Z-0003Pg-3z
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 04:59:54 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:8967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <Ori.Chalak@huawei.com>) id 1crL4Y-0003Mp-RR
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 04:59:51 -0400
Received: from 172.18.7.190 (EHLO LHREML714-CAH.china.huawei.com)
	([172.18.7.190])
	by lhrrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDK36462; Fri, 24 Mar 2017 08:59:40 +0000 (GMT)
Received: from LHREML501-MBB.china.huawei.com ([10.201.109.51]) by
	LHREML714-CAH.china.huawei.com ([10.201.108.37]) with mapi id
	14.03.0301.000; Fri, 24 Mar 2017 08:59:30 +0000
From: "Ori Chalak (A)" <Ori.Chalak@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Wangjintang
	<wangjintang@huawei.com>
Thread-Topic: [Qemu-arm] about armv8's prefetch decode
Thread-Index: AQHRj1R6bYMlriGS4E2IOsFES6FMxKGfZpSAgAVp24CAAQac8A==
Date: Fri, 24 Mar 2017 08:59:29 +0000
Message-ID: <3B0B2400D2B396429D11484104997A761A6932BD@lhreml501-mbb>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
	<CAFEAcA-AjxQ-wCu3Uh8AiunbQk8LSgs7T=ymbd3_QkgZAa2TUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-AjxQ-wCu3Uh8AiunbQk8LSgs7T=ymbd3_QkgZAa2TUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.201.116.158]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.58D4DFFD.0545, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: efee53c2e1467add968b4e32b66c22fa
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 194.213.3.17
X-Mailman-Approved-At: Fri, 24 Mar 2017 09:36:33 -0400
Subject: Re: [Qemu-arm] about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rnceE0TvdBPl

SGkgUGV0ZXIsDQoNCkluZGVlZCwgcHJlZmV0Y2ggaW5zdHJ1Y3Rpb24gYWZmZWN0cyBvbmx5IHRo
ZSBtaWNybyBhcmNoaXRlY3R1cmUsIGFuZCBoZW5jZSBub3QgbmVlZGVkIGZvciBydW5uaW5nIGNv
cnJlY3RseSB0aGUgZ2VuZXJhdGVkIGNvZGUuDQpIb3dldmVyLCB3ZSBkZXZlbG9wZWQgYSBwZXJm
b3JtYW5jZSBzaW11bGF0b3IgZm9yIGEgZGV0YWlsZWQgQVJNdjggQ1BVIG1vZGVsLCBhbmQgdXNl
IFFlbXUgdG8gcmVzb2x2ZSB0aGUgZnVuY3Rpb25hbGl0eS4NCkFuZCBmb3IgdGhpcyBwdXJwb3Nl
IHdlIG5lZWQgdG8gdHJhbnNsYXRlIGFsbCBpbnN0cnVjdGlvbnMgdGhhdCBtYXkgYWZmZWN0IHRo
ZSBwaXBlbGluZSBiZWhhdmlvciwgY2FjaGVzLCBldGMuDQoNClRoaXMgaXMgbm90IHRoZSBtYWpv
ciB1c2FnZSBvZiBRZW11LCBob3dldmVyIHRoZXJlIG1heSBiZSBvdGhlcnMgZG9pbmcgdGhpcyBh
bmQgaXQgbWF5IGhlbHAgdGhlbS4NCmh0dHA6Ly93d3cubGludXgta3ZtLm9yZy9pbWFnZXMvNC80
NS8wMXgwOS1DaHJpc3RvcGhlcl9Db3Zpbmd0b24tVXNpbmdfVXBzdHJlYW1fUUVNVV9mb3JfQ0FT
Uy5wZGYNCg0KDQpSZWdhcmRzLA0KDQpPcmkgQ2hhbGFrDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnXSANClNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMywgMjAxNyA3OjA1IFBNDQpUbzogV2FuZ2pp
bnRhbmcNCkNjOiBxZW11LWFybTsgU2hsb21vIFBvbmdyYXR6IChBKTsgT3JpIENoYWxhayAoQSkN
ClN1YmplY3Q6IFJlOiBbUWVtdS1hcm1dIGFib3V0IGFybXY4J3MgcHJlZmV0Y2ggZGVjb2RlDQoN
Ck9uIDIwIE1hcmNoIDIwMTcgYXQgMDY6MzUsIFdhbmdqaW50YW5nIDx3YW5namludGFuZ0BodWF3
ZWkuY29tPiB3cm90ZToNCj4gICAgICAgICBXZSBzZWUgdGhhdCBhcm12OCdzIHByZWZldGNoIGlu
c3RydWN0aW9uIGRlY29kZSBoYXZlIGJlZW4gDQo+IHNraXBwZWQgaW4gcWVtdS4gRm9yIHNvbWUg
dXNlciwgdGhleSBuZWVkIHByZWZldGNoIGluc3RydWN0aW9uLCBmb3IgDQo+IGV4YW1wbGUsIHRo
ZXkgdXNlIHFlbXUgdG8gZ2VuZXJhdGUgdGhlIGluc3RydWN0aW9uIHRyYWNlLg0KPiBXZSB3YW50
IHRvIG1lcmdlIHRoaXMgcGF0Y2ggdG8gY29tbXVuaXR5LCBpdCdzIG9rIG9yIG5vdD8gIFRoYW5r
cy4NCg0KSXQgd291bGQgYmUgaGVscGZ1bCBpZiB5b3UgY291bGQgYmUgbW9yZSBwcmVjaXNlIGFi
b3V0IHdoYXQgaXMgbWlzc2luZyBhbmQgd2hhdCBnb2VzIHdyb25nIChlZyB3aGljaCBpbnN0cnVj
dGlvbnMgd2UgbWlzaGFuZGxlKS4gSW4gZ2VuZXJhbCBJIGJlbGlldmUgdGhhdCB3ZSBkbyBjb3Jy
ZWN0bHkgaGFuZGxlIHRoZSB2YXJpb3VzIHByZWZldGNoIGluc3RydWN0aW9ucy4gVGhleSBkb24n
dCBuZWVkIHRvIGdlbmVyYXRlIGFueSBpbnRlcm1lZGlhdGUgY29kZSwgb2YgY291cnNlLCBiZWNh
dXNlIHByZWZldGNoIGlzIGp1c3QgYSBoaW50LiBJdCdzIHBvc3NpYmxlIHdlIGdvdCB0aGUgZGVj
b2RlIHdyb25nIGZvciBzb21lIHN1YnNldCBvZiB0aGVtLg0KDQp0aGFua3MNCi0tIFBNTQ0K
