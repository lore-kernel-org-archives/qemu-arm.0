Received: by 10.25.15.230 with SMTP id 99csp1118970lfp;
        Fri, 24 Mar 2017 00:55:31 -0700 (PDT)
X-Received: by 10.237.42.98 with SMTP id k31mr6828186qtf.232.1490342131269;
        Fri, 24 Mar 2017 00:55:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k126si1164626qkc.96.2017.03.24.00.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 00:55:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crK4I-0004PM-RU
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 03:55:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1crK4C-0004PE-NL
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 03:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1crK49-0006tO-Mh
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 03:55:24 -0400
Received: from [45.249.212.187] (port=3012 helo=dggrg01-dlp.huawei.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangjintang@huawei.com>) id 1crK48-0006sX-Uv
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 03:55:21 -0400
Received: from 172.30.72.57 (EHLO DGGEMA404-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ALJ10217; Fri, 24 Mar 2017 15:54:57 +0800 (CST)
Received: from DGGEMA504-MBX.china.huawei.com ([169.254.4.180]) by
	DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id
	14.03.0301.000; Fri, 24 Mar 2017 15:54:47 +0800
From: Wangjintang <wangjintang@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] about armv8's prefetch decode
Thread-Index: AQHSo/eux5c5C7FGr0WVMMqwyZ/RZaGjg+xw
Date: Fri, 24 Mar 2017 07:54:46 +0000
Message-ID: <C94A741879221447B4FC9B607EB4FFCD79EA7C46@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
	<CAFEAcA-AjxQ-wCu3Uh8AiunbQk8LSgs7T=ymbd3_QkgZAa2TUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-AjxQ-wCu3Uh8AiunbQk8LSgs7T=ymbd3_QkgZAa2TUQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.25.122]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.58D4D0D2.018C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.4.180,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8f596a3057ff9a436ff8afe7d163b73a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
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
	"Wanghaibin \(Benjamin\)" <benjamin.wanghaibin@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, "Ori Chalak \(A\)" <Ori.Chalak@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9pnqhk/crT9T

SGkgUGV0ZXIsDQoNCglBdCBmaXJzdCB0aGFua3MgeW91ciByZXBseS4NCkkgYWRkIGRldGFpbCBp
bGx1c3RyYXRpb24gYXQgYmVsb3c6DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUGV0ZXIgTWF5ZGVsbCBbbWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj4g
U2VudDogRnJpZGF5LCBNYXJjaCAyNCwgMjAxNyAxOjA1IEFNDQo+IFRvOiBXYW5namludGFuZw0K
PiBDYzogcWVtdS1hcm07IFNobG9tbyBQb25ncmF0eiAoQSk7IE9yaSBDaGFsYWsgKEEpDQo+IFN1
YmplY3Q6IFJlOiBbUWVtdS1hcm1dIGFib3V0IGFybXY4J3MgcHJlZmV0Y2ggZGVjb2RlDQo+IA0K
PiBPbiAyMCBNYXJjaCAyMDE3IGF0IDA2OjM1LCBXYW5namludGFuZyA8d2FuZ2ppbnRhbmdAaHVh
d2VpLmNvbT4NCj4gd3JvdGU6DQo+ID4gICAgICAgICBXZSBzZWUgdGhhdCBhcm12OCdzIHByZWZl
dGNoIGluc3RydWN0aW9uIGRlY29kZSBoYXZlIGJlZW4NCj4gPiBza2lwcGVkIGluIHFlbXUuIEZv
ciBzb21lIHVzZXIsIHRoZXkgbmVlZCBwcmVmZXRjaCBpbnN0cnVjdGlvbiwNCj4gPiBmb3IgZXhh
bXBsZSwgdGhleSB1c2UgcWVtdSB0byBnZW5lcmF0ZSB0aGUgaW5zdHJ1Y3Rpb24gdHJhY2UuDQo+
ID4gV2Ugd2FudCB0byBtZXJnZSB0aGlzIHBhdGNoIHRvIGNvbW11bml0eSwgaXQncyBvayBvciBu
b3Q/ICBUaGFua3MuDQo+IA0KPiBJdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjb3VsZCBiZSBt
b3JlIHByZWNpc2UgYWJvdXQgd2hhdA0KPiBpcyBtaXNzaW5nIGFuZCB3aGF0IGdvZXMgd3Jvbmcg
KGVnIHdoaWNoIGluc3RydWN0aW9ucyB3ZQ0KPiBtaXNoYW5kbGUpLiBJbiBnZW5lcmFsIEkgYmVs
aWV2ZSB0aGF0IHdlIGRvIGNvcnJlY3RseSBoYW5kbGUNCj4gdGhlIHZhcmlvdXMgcHJlZmV0Y2gg
aW5zdHJ1Y3Rpb25zLiBUaGV5IGRvbid0IG5lZWQgdG8gZ2VuZXJhdGUNCj4gYW55IGludGVybWVk
aWF0ZSBjb2RlLCBvZiBjb3Vyc2UsIGJlY2F1c2UgcHJlZmV0Y2ggaXMganVzdA0KPiBhIGhpbnQu
IEl0J3MgcG9zc2libGUgd2UgZ290IHRoZSBkZWNvZGUgd3JvbmcgZm9yIHNvbWUgc3Vic2V0DQo+
IG9mIHRoZW0uDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQoNCiAgWW91J3JlIHJpZ2h0LiBGb3Ig
ZnVuY3Rpb24gbW9kZWwgZG9uJ3QgbmVlZCBnZW5lcmF0ZSANCmludGVybWVkaWF0ZSBjb2RlIGZv
ciBwcmVmZXRjaCBpbnN0cnVjdGlvbnMuIEJ1dCBmb3Igc2ltdWxhdG9yIHVzZXIsIA0KdGhleSBu
ZWVkIGVudGlyZWx5IEFybXY4J3MgaW5zdHJ1Y3Rpb24gYW5kIGxkL3N0IGluc3RydWN0aW9uJ3Mg
bWVtb3J5IGFkZHJlc3MuDQpDdXJyZW50IGNvZGUgdGhhdCBza2lwIGdlbmVyYXRlIHByZWZldGNo
IGluc3RydWN0aW9ucycgaW50ZXJtZWRpYXRlIGNvZGUsIA0Kc28gZm9yIHNpbXVsYXRvciB1c2Vy
LCB0aGV5IGNhbid0IGdldCB0aGUgcHJlZmV0Y2ggaW5zdHJ1Y3Rpb24gcmVsYXRpdmUgDQptZW1v
cnkgYWRkcmVzcy4gDQogIFRoZSBwYXRjaCBpcyBmb3IgdGhpcyBjYXNlLiBHZW5lcmF0ZSBpbnRl
cm1lZGlhdGUgY29kZSBmb3IgcHJlZmV0Y2ggDQppbnN0cnVjdGlvbiBjb2RlLCBhdCB0aGUgc2Ft
ZSB0aW1lIGRvbid0IGVmZmVjdCB0aGUgdmFsdWUgaW4gcm0vcnQgcmVnaXN0ZXIuICAgDQoNCkJl
c3QgUmVnYXJkcywNCldhbmcgamludGFuZyAvIEplZA0KDQpIdWF3ZWkgVGVjaG5vbG9naWVzIENv
LiwgTHRkLiANCkVtYWlsOiB3YW5namludGFuZ0BodWF3ZWkuY29tDQpCdWlsZGluZyBaOCwgSHVh
d2VpIFImRCBjZW50ZXIsIEppYW5nc2h1IFJkIDM2MCwgQmluamlhbmcgRGlzdHJpY3QsSGFuZ3po
b3UgMzEwMDUxLCBQLlIuQ2hpbmENCmh0dHA6Ly93d3cuaHVhd2VpLmNvbQ0K
