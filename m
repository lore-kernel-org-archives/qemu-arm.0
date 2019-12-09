Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3793069lff;
        Sun, 8 Dec 2019 18:15:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMmSSA9EeGS3M2V0tFsTb7uVy5nts/vNee8NoyVrSqYP820xK4jQkxHocbqiHXspJLblEg
X-Received: by 2002:a37:b602:: with SMTP id g2mr25522799qkf.174.1575857718866;
        Sun, 08 Dec 2019 18:15:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575857718; cv=none;
        d=google.com; s=arc-20160816;
        b=J8Grg3RlBCUDTQUVKRTZ3uJa64GOxvH0I8x8if400UloTGl4eus9Ai4sT4v8Lp5dfz
         yK5Qlhz72v7fISgeVknYdjcCXQ4zgn6zMsQC403SAnkIAnUFaeYO+mdMP5zoLJDC+NPk
         SteSHStK/uWCfURRJ/HmC+xH2phfIHTAPzijE4oyEDE3gguQvZxaS/ePdiQiYbTP8M4F
         QfD1oDzO/GGXWomT6HTCq+TmyjEmG4ftrlxlOjN78hMmY0pCkBg1AU68NWO6LmJOCN0q
         XNY5t7CYPNHPWWdvSxV4JbZCzNw3gyBP8+pEbV+44/NZ+7tXNp6Dtf1w7JdQMXTF1vv3
         HBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=W6TwJJXAs5vYNQEmQHdYVgZWbjVepBfpqLe3f0ROeM4=;
        b=zz/UPL4c4zYFYAVOVdbd517u+abb0pgdeRS3C00gPPEqGKBja4exHDlkDutHUuujRY
         OQOADjktQoD6KYnLf9ajSgshl0NnQCa6SqKWSPY8t21QDyBNgoxvK9yY3m0rFlCzMXC+
         OROD/ulp+MhYCVVVm81rZ9/Uzrxi76gWiB6FFzJPZZoxzkjB2zSCYaIS1Uyy7Ns0+yGx
         9A0N2pNcXQ3SPYDzuY9Awp7rX2y7XBnCsW9lgosFfB2KnDiZcwn8vW1+S/MFDtXL3DEn
         +wmdwyCUyEONsACB4lehBFc3In4Jp8UK8zDuwGl/Kdg+xBC/KYzEW4ij4mmnnVXAOvva
         CMgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si13083668qtu.200.2019.12.08.18.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 18:15:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ie8Zy-0001va-7g
	for alex.bennee@linaro.org; Sun, 08 Dec 2019 21:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prime.zeng@hisilicon.com>) id 1ie8ZD-0001vB-Nx
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:14:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prime.zeng@hisilicon.com>) id 1ie8ZC-0006u4-Dy
 for qemu-devel@nongnu.org; Sun, 08 Dec 2019 21:14:31 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2049 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prime.zeng@hisilicon.com>)
 id 1ie8Z8-0006dy-FO; Sun, 08 Dec 2019 21:14:26 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 3AF42E8A1B330D45BAC3;
 Mon,  9 Dec 2019 10:14:15 +0800 (CST)
Received: from DGGEMM526-MBX.china.huawei.com ([169.254.8.101]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0439.000;
 Mon, 9 Dec 2019 10:14:09 +0800
From: "Zengtao (B)" <prime.zeng@hisilicon.com>
To: Andrew Jones <drjones@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: RE: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
 topology support
Thread-Topic: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
 topology support
Thread-Index: AdQTlaRpUFkm+EncK0mrDnlTRz6dtGan2sPQ
Date: Mon, 9 Dec 2019 02:14:09 +0000
Message-ID: <678F3D1BB717D949B966B68EAEB446ED3405A26F@dggemm526-mbx.china.huawei.com>
References: <20180704124923.32483-1-drjones@redhat.com>
In-Reply-To: <20180704124923.32483-1-drjones@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.74.221.187]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.189
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "wei@redhat.com" <wei@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 huangdaode <huangdaode@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nccl7SPQXo44

SGkgQW5kcmV3Og0KDQpBbnkgdXBkYXRlIGZvciB0aGlzIHBhdGNoIHNlcmllcz8gSSBoYXZlIG1l
dCB0aGUgc2FtZSBpc3N1ZSwgYW5kIGlmIHRoZSANCnRvcG9sb2d5IGd1ZXNzZWQgYnkgbGludXgg
TVBJRFIgY29uZmxpY3RzIHdpdGggcWVtdSBzcGVjaWZpZWQgbnVtYSwgaXQNCndpbGwgZmFpbGVk
IHRvIGJvb3QgKHNjaGVkIGRvbWFpbiBpbml0aWFsaXphdGlvbiB3aWxsIGZhbGwgaW50byBkZWFk
bG9vcCkuDQoNClRoYW5rcy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBRZW11LWRldmVsDQo+IFttYWlsdG86cWVtdS1kZXZlbC1ib3VuY2VzK2luY29taW5nPXBhdGNo
d29yay5vemxhYnMub3JnQG5vbmdudS5vcg0KPiBnXSBPbiBCZWhhbGYgT2YgQW5kcmV3IEpvbmVz
DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDA1LCAyMDE4IDQ6NDkgQU0NCj4gVG86IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZw0KPiBDYzogd2VpQHJlZGhhdC5jb207
IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgZXJpYy5hdWdlckByZWRoYXQuY29tOw0KPiBpbWFt
bWVkb0ByZWRoYXQuY29tDQo+IFN1YmplY3Q6IFtRZW11LWRldmVsXSBbUkZDIFBBVENIIDAvNl0g
aHcvYXJtL3ZpcnQ6IEludHJvZHVjZSBjcHUNCj4gdG9wb2xvZ3kgc3VwcG9ydA0KPiANCj4gVGhp
cyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgYm9vdGluZyBtYWNoLXZpcnQgbWFjaGluZXMg
d2l0aA0KPiBub24tZmxhdCBjcHUgdG9wb2xvZ3ksIGkuZS4gZW5hYmxpbmcgdGhlIGV4dGVuZGVk
IG9wdGlvbnMgb2YgdGhlDQo+ICctc21wJyBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIChzb2NrZXRz
LGNvcmVzLHRocmVhZHMpLiBCb3RoIERUIGFuZA0KPiBBQ1BJIGRlc2NyaXB0aW9uIGdlbmVyYXRv
cnMgYXJlIGFkZGVkLiBXZSBvbmx5IGFwcGx5IHRoZSBuZXcgZmVhdHVyZQ0KPiB0byAzLjEgYW5k
IGxhdGVyIG1hY2hpbmUgdHlwZXMsIGFzIHRoZSBjaGFuZ2UgaXMgZ3Vlc3QgdmlzaWJsZSwgZXZl
bg0KPiB3aGVuIG5vIGNvbW1hbmQgbGluZSBjaGFuZ2UgaXMgbWFkZS4gVGhpcyBpcyBiZWNhdXNl
IHRoZSBiYXNpYw0KPiAnLXNtcCA8Tj4nIHBhcmFtZXRlciBtYWtlcyB0aGUgYXNzdW1wdGlvbiB0
aGF0IDxOPiByZWZlcnMgdG8gdGhlDQo+IG51bWJlciBvZiBzb2NrZXRzLCBidXQgd2hlbiBubyB0
b3BvbG9neSBkZXNjcmlwdGlvbiBpcyBwcm92aWRlZCwNCj4gTGludXggd2lsbCB1c2UgdGhlIE1Q
SURSIHRvIGd1ZXNzLiBOZWl0aGVyIHRoZSBNUElEUiBleHBvc2VkIHRvDQo+IHRoZSBndWVzdCB3
aGVuIHJ1bm5pbmcgd2l0aCBLVk0gbm9yIFRDRyBjdXJyZW50bHkgcHJvdmlkZXMgc29ja2V0DQo+
IGluZm9ybWF0aW9uLCBsZWF2aW5nIExpbnV4IHRvIGFzc3VtZSBhbGwgcHJvY2Vzc2luZyBlbGVt
ZW50cyBhcmUNCj4gY29yZXMgaW4gdGhlIHNhbWUgc29ja2V0LiBGb3IgZXhhbXBsZSwgYmVmb3Jl
IHRoaXMgc2VyaWVzICctc21wIDQnDQo+IHdvdWxkIHNob3cgdXAgaW4gdGhlIGd1ZXN0IGFzDQo+
IA0KPiAgQ1BVKHMpOiAgICAgICAgICAgICAgICA0DQo+ICBPbi1saW5lIENQVShzKSBsaXN0OiAg
IDAtMw0KPiAgVGhyZWFkKHMpIHBlciBjb3JlOiAgICAxDQo+ICBDb3JlKHMpIHBlciBzb2NrZXQ6
ICAgIDQNCj4gIFNvY2tldChzKTogICAgICAgICAgICAgMQ0KPiANCj4gYW5kIGFmdGVyIGl0IHNo
b3dzIHVwIGFzDQo+IA0KPiAgQ1BVKHMpOiAgICAgICAgICAgICAgICA0DQo+ICBPbi1saW5lIENQ
VShzKSBsaXN0OiAgIDAtMw0KPiAgVGhyZWFkKHMpIHBlciBjb3JlOiAgICAxDQo+ICBDb3JlKHMp
IHBlciBzb2NrZXQ6ICAgIDENCj4gIFNvY2tldChzKTogICAgICAgICAgICAgNA0KPiANCj4gSXQn
cyBub3QgZXhwZWN0ZWQgdGhhdCB0aGlzIHNob3VsZCBiZSBhIHByb2JsZW0sIGJ1dCBpdCdzIHdv
cnRoDQo+IGNvbnNpZGVyaW5nLiBUaGUgb25seSB3YXkgdG8gYXZvaWQgdGhlIHNpbGVudCBjaGFu
Z2UgaXMgZm9yIFFFTVUgdG8NCj4gcHJvdmlkZSBib2FyZHMgYSB3YXkgdG8gb3ZlcnJpZGUgdGhl
IGRlZmF1bHQgJy1zbXAnIHBhcnNpbmcgZnVuY3Rpb24uDQo+IE90aGVyd2lzZSwgaWYgYSB1c2Vy
IHdhbnRzIHRvIGF2b2lkIGEgZ3Vlc3QgdmlzaWJsZSBjaGFuZ2UsIGJ1dCBzdGlsbA0KPiB1c2Ug
YSAzLjEgb3IgbGF0ZXIgbWFjaC12aXJ0IG1hY2hpbmUgdHlwZSwgdGhlbiB0aGV5IG11c3QgZW5z
dXJlIHRoZQ0KPiBjb21tYW5kIGxpbmUgc3BlY2lmaWVzIGEgc2luZ2xlIHNvY2tldCwgZS5nLiAn
LXNtcCBzb2NrZXRzPTEsY29yZXM9NCcNCj4gDQo+IFRoYW5rcywNCj4gZHJldw0KPiANCj4gDQo+
IEFuZHJldyBKb25lcyAoNik6DQo+ICAgaHcvYXJtL3ZpcnQ6IEFkZCB2aXJ0LTMuMSBtYWNoaW5l
IHR5cGUNCj4gICBkZXZpY2VfdHJlZTogYWRkIHFlbXVfZmR0X2FkZF9wYXRoDQo+ICAgaHcvYXJt
L3ZpcnQ6IERUOiBhZGQgY3B1LW1hcA0KPiAgIGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IGRpc3Rp
bmd1aXNoIHBvc3NpYmxlIGFuZCBwcmVzZW50IGNwdXMNCj4gICB2aXJ0LWFjcGktYnVpbGQ6IGFk
ZCBQUFRUIHRhYmxlDQo+ICAgaHcvYXJtL3ZpcnQ6IGNwdSB0b3BvbG9neTogZG9uJ3QgYWxsb3cg
dGhyZWFkcw0KPiANCj4gIGRldmljZV90cmVlLmMgICAgICAgICAgICAgICAgfCAyNCArKysrKysr
KysrKysrDQo+ICBody9hY3BpL2FtbC1idWlsZC5jICAgICAgICAgIHwgNTAgKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gIGh3L2FybS92aXJ0LWFjcGktYnVpbGQuYyAgICAgfCAyNSArKysr
KysrKysrLS0tDQo+ICBody9hcm0vdmlydC5jICAgICAgICAgICAgICAgIHwgNjkNCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBpbmNsdWRlL2h3L2FjcGkvYW1sLWJ1
aWxkLmggIHwgIDIgKysNCj4gIGluY2x1ZGUvaHcvYXJtL3ZpcnQuaCAgICAgICAgfCAgMSArDQo+
ICBpbmNsdWRlL3N5c2VtdS9kZXZpY2VfdHJlZS5oIHwgIDEgKw0KPiAgNyBmaWxlcyBjaGFuZ2Vk
LCAxNjIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo=
