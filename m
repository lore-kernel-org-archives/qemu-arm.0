Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp680547wre;
        Fri, 1 Jun 2018 07:17:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKxwTTuloe8cjI40AFCzJATbH8QP4MmJnKtsc5+gIJWGMWt771C7+DIqrll/tM/3f9q4o7O
X-Received: by 2002:a0c:d19d:: with SMTP id e29-v6mr10671889qvh.129.1527862664755;
        Fri, 01 Jun 2018 07:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527862664; cv=none;
        d=google.com; s=arc-20160816;
        b=ty9GLYUuE94/powp2J8sxaGE5EnZSnqFXhvnO+ygNAepdYt1IHSHSoqkQSZrTT+3az
         9qh6QIod6eeh+25O4tR7rIKGSC/4LwGe5uYrlBa8Tnh/JyADLwy39+7kVOJENX7auL5G
         gVsrxcuQyGw5NfqE04mDIwCbCMmk08j0kTB5mDr0xqKaEWCjl2KUoHloYDEfdRC5Cump
         W1/lNxdPvds297TyJurVlrGSxenkdnyTNxUuAEzT6XpJ43K5RW62v13f7f8HyALxjGnz
         OoTOqrrQtSRrZ4jgqMz9prKIvpiNMRxT8mklr9wkLstOAv88Uf1KTcqsEpaZjio07FpG
         h9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from
         :arc-authentication-results;
        bh=jwuEEvh7gkgCpWEjKG68lgGS+41rBkyd/ZtbnuC/zxU=;
        b=xN3MnQpvIJkAnOnATpiOWXo7kcSDY1SN6mlXczS/gfpCrFXtFZ6hnP4sTNnXdYdtEr
         3sXhTdqSuh/IEh6Py2wXD2gcj9XT2kiUhgZlFZ3bVbVL3TebT7Ecl3Xm5OBhfUN5YtqX
         t+fxNRLeaE4GVtKZQCvS2UaVxZYI+SYW8A1YGHYlWJkQkgeWEYE3qNP0YE97PBjKrzAl
         kKaabpikNyfoX4oPyEVg/+3w+XZK3rQh8QAwrTSNFwHxW6oP9i0b+5EGRukuNodGzcLC
         L7COTP1k3oQ6mh6+Rsll1g00boCYQsEFZ3o3zjLq2UCKO+zoCiWOaj1DmeNP+SCUzWrV
         NALA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8-v6si5236644qtc.341.2018.06.01.07.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 07:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOksC-0002ZA-4j
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 10:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOkr7-0002KR-Il
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 10:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOkr6-00055z-DC
	for qemu-devel@nongnu.org; Fri, 01 Jun 2018 10:16:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2328 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOkr0-0004yT-Eq; Fri, 01 Jun 2018 10:16:30 -0400
Received: from DGGEMA406-HUB.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id 438C6E6969708;
	Fri,  1 Jun 2018 22:16:14 +0800 (CST)
Received: from DGGEMA503-MBX.china.huawei.com ([169.254.1.111]) by
	DGGEMA406-HUB.china.huawei.com ([10.3.20.47]) with mapi id
	14.03.0382.000; Fri, 1 Jun 2018 22:16:08 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH RESEND v1 0/3] add support for VCPU event
	states
Thread-Index: AdP5soBfHoyOTl2SRgiJeJ99I9KliA==
Date: Fri, 1 Jun 2018 14:16:08 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201CAF085@DGGEMA503-MBX.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.53.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-devel] [PATCH RESEND v1 0/3] add support for VCPU event
 states
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "famz@redhat.com" <famz@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WaGDJPKifhXT

SGkgUGV0ZXIsDQoNCj4gDQo+IE9uIDEgSnVuZSAyMDE4IGF0IDE0OjE3LCBnZW5nZG9uZ2ppdSA8
Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4gSGkgUGV0ZXIsDQo+ID4+IFRoaXMg
c2VyaWVzIGZhaWxlZCBidWlsZCB0ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBk
ZXRhaWxzIGJlbG93Lg0KPiANCj4gPj4gL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWh3c24z
d3NsL3NyYy9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2QuYzogSW4gZnVuY3Rpb24g4oCYdmlyZ2xf
Y21kX2dldF9jYXBzZXRfaW5mb+KAmToNCj4gPj4gL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1w
LWh3c24zd3NsL3NyYy9ody9kaXNwbGF5L3ZpcnRpby1ncHUtM2QuYzozDQo+ID4+IDY2OjI2OiBl
cnJvcjog4oCYVklSVElPX0dQVV9DQVBTRVRfVklSR0wy4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVz
ZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFZJUlRJT19HUFVfQ0FQU0VUX1ZJ
UkdM4oCZPw0KPiA+PiAgICAgICAgICByZXNwLmNhcHNldF9pZCA9IFZJUlRJT19HUFVfQ0FQU0VU
X1ZJUkdMMjsNCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBWSVJUSU9fR1BVX0NBUFNF
VF9WSVJHTA0KPiA+PiAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtaHdzbjN3c2wvc3JjL2h3
L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jOjMNCj4gPj4gNjY6MjY6IG5vdGU6IGVhY2ggdW5kZWNs
YXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3INCj4gPj4gZWFjaCBmdW5j
dGlvbiBpdCBhcHBlYXJzIGluDQo+ID4+IC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC1od3Nu
M3dzbC9zcmMvaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmM6IEluIGZ1bmN0aW9uIOKAmHZpcnRp
b19ncHVfdmlyZ2xfZ2V0X251bV9jYXBzZXRz4oCZOg0KPiA+PiAvdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtaHdzbjN3c2wvc3JjL2h3L2Rpc3BsYXkvdmlydGlvLWdwdS0zZC5jOjYNCj4gPj4g
NDY6MzI6IGVycm9yOiDigJhWSVJUSU9fR1BVX0NBUFNFVF9WSVJHTDLigJkgdW5kZWNsYXJlZCAo
Zmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYVklSVElPX0dQVV9D
QVBTRVRfVklSR0zigJk/DQo+IA0KPiA+IFRoaXMgYnVpbGQgZmFpbHVyZSBpcyBkdWUgdG8ga2Vy
bmVsIG1pc3NpbmcgdGhlIGRlZmluaXRpb24gb2YNCj4gPiAiVklSVElPX0dQVV9DQVBTRVRfVklS
R0wyIiwgSSBzeW5jIHRoZSBtYWlubGluZSBrZXJuZWwgdHJlZSBoZWFkZXIgZmlsZSB0byB0aGUg
bWFpbmxpbmUgUUVNVSB1c2luZyB0aGUgc2NyaXB0c1sxXSwgU28gaGFwcGVuIHRoaXMNCj4gZmFp
bHVyZSwgSXQgZG9lcyBub3QgcmVsYXRlZCB3aXRoIG15c2VsZiBwYXRjaCwgc28gY2FuIEkgZGlz
Y2FyZCB0aGUgcGF0Y2ggWzFdIG9yIGFkZCB0aGUg4oCYVklSVElPX0dQVV9DQVBTRVRfVklSR0wy
4oCZIGRlZmluaXRpb24gdG8NCj4gbWFpbmxpbmUga2VybmVsIHRyZWU/DQo+IA0KPiBUaGlzIGlz
IGEga25vd24gaXNzdWUgd2l0aCB0aGUga2VybmVsIGhlYWRlcnMgKGhvcGVmdWxseSBzb21lYm9k
eSB3aWxsIGZpeCB0aGVtKS4gVGhlcmUgYXJlIHNldmVyYWwgbml0cyBhbmQgYWxzbyBidWdzIGlu
IHRoZSB1cGRhdGUtaGVhZGVycw0KPiBzY3JpcHQgdGhhdCBJIHNlbnQgYSBwYXRjaHNldCB0byBm
aXggcmVjZW50bHk6DQo+ICBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUt
ZGV2ZWwvMjAxOC0wNS9tc2cwNTgwMy5odG1sDQo+IA0KPiBZb3Ugc2hvdWxkIHdhaXQgZm9yIHRo
YXQgdG8gZ2V0IGludG8gbWFzdGVyIChpdCBpcyBpbiBQYW9sbydzIG1vc3QgcmVjZW50IHBhdGNo
c2V0IGJ1dCB0aGF0IGhhcyBhbiBpc3N1ZSB3aXRoIGEgZGlmZmVyZW50IHBhdGNoLCBzbyBpcyB3
YWl0aW5nIG9uDQo+IFBhb2xvIHRvIGRvIGEgcmVzcGluKS4gVGhlbiB5b3UgY2FuIGJhc2Ugb24g
dGhhdC4gQXQgdGhhdCBwb2ludCBhIHNpbXBsZSBzY3JpcHQgdXBkYXRlIHNob3VsZCB3b3JrIGZp
bmUgKGlmIHlvdSBuZWVkIGFueXRoaW5nIGluIHJjNyB0aGF0DQo+IHdhc24ndCBpbiByYzYpLg0K
DQpPaywgZ290IGl0LiBUaGFua3MgYSBsb3QgZm9yIHRoZSBleHBsYW5hdGlvbiwgSSB3aWxsIHdh
aXQgZm9yIHlvdXIgcGF0Y2hbMV0gbWVyZ2UgaW50byBtYXN0ZXIgYW5kIGJhc2VkIG9uIGl0LiAN
Cg0KWzFdIGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE4
LTA1L21zZzA1ODAzLmh0bWwNCg0KPiANCj4gdGhhbmtzDQo+IC0tIFBNTQ0K
