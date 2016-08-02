Received: by 10.25.21.156 with SMTP id 28csp2987293lfv;
        Mon, 1 Aug 2016 22:54:57 -0700 (PDT)
X-Received: by 10.200.37.60 with SMTP id 57mr95163650qtm.82.1470117297739;
        Mon, 01 Aug 2016 22:54:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y202si678876qkb.170.2016.08.01.22.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 22:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUSfJ-0006nd-4v
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 01:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bUSfE-0006nN-Id
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 01:54:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bUSfB-0001qS-Fz
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 01:54:52 -0400
Received: from exvmail.hynix.com ([166.125.252.79]:63319
	helo=invmail.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bUSfA-0001pt-Uz; Tue, 02 Aug 2016 01:54:49 -0400
X-AuditID: a67dfc4e-f797e6d000000a40-79-57a0359ef50a
Received: from nmail01.hynixad.com (10.156.98.81) by nmail04.hynixad.com
	(10.156.98.84) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Tue, 2 Aug 2016 14:54:37 +0900
Received: from nmail01.hynixad.com ([::1]) by nmail01.hynixad.com
	([fe80::b401:ed0f:ec2d:533c%24]) with mapi id 15.00.0847.030;
	Tue, 2 Aug 2016 14:54:37 +0900
From: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
To: Igor Mammedov <imammedo@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [RFC PATCH 1/3] hw/arm/virt: add hotplug memory support
Thread-Index: AQHR4iCz63i60J7QhU+DySTPVw+aOaAvLcOAgAQZZ3D//+87gIAAB6sAgAARCoCAAfDioA==
Date: Tue, 2 Aug 2016 05:54:36 +0000
Message-ID: <7dccb23a9918449aa7e050aea37b8040@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
	<CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
	<20160801111433.2af5c013@nial.brq.redhat.com>
In-Reply-To: <20160801111433.2af5c013@nial.brq.redhat.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.92.132.196]
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsXCNUdUSXee6YJwg8bfvBYN90ItFq5axmxx
	+mgHs8X/X69YLfZv+8dqMefMAxaLBd0L2SyO9+5gsZh26g6rxdNlv1kt5m14weTA7dFy5C2r
	x51re9g85p0M9HhybTOTx/t9V9k8+qZ/YA5gi+KySUnNySxLLdK3S+DKuHDyCHPBDqmK+Ufa
	2RoYH0h2MXJySAiYSLw5tpgFwhaTuHBvPVsXIxeHkMBqRokfKzqYIJxFjBJPr91mBKliEzCU
	2HtrH2sXIweHiECwxKs3SiA1zALnmSUm/prJBhIXFnCROL5cCKLEVeLIRgOQThGBMInzV1ez
	g9gsAioSV171M4KU8Ao4Sdy+7wuxaQmzxLXfR9lAajgFrCQW7NkBNpFRQFbi6jUZkDCzgLjE
	4q/XmCFOFpBYsuc8lC0q8fLxP1YIW1Hi2+vv7BD1RhJLVs9ngrAVJaZ0PwSL8woISpyc+QTq
	dUmJgytusExgFJ+FZMUsJO2zkLTPQtK+gJFlFaNwZl5ZbmJmjl5xdkZlXmaFXnJ+7iZGYDQv
	q/3jt4PxxS+tQ4wCHIxKPLwMRfPDhVgTy4orcw8xSnAwK4nwVmsvCBfiTUmsrEotyo8vKs1J
	LT7EKM3BoiTO++1/X7iQQHpiSWp2ampBahFMlomDU6qBkVfrdIxacVXe5NfT9x67XXhDqUD2
	mHNzXdMT5dns0YWRTgU5F7j6p2Rkpb3UdRUKM8qe0piyP9Zl+clA0YlflK9M6LQK5TReeq/n
	yyq5sE16+UWnQqP9fqT/nWbhlHTcyuukWWPi1+CVofaJKjaZry/YP3njqVwzryzzzn3Dh7fd
	U25VrVdWYinOSDTUYi4qTgQAWSC1b+ICAAA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.79
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, QEMU
	Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oAy6S2lcIVHP

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGFsaWdubWVudCBpbmZvcm1hdGlvbiBhbmQgZGlzY3Vz
c2lvbiwgSWdvciBhbmQgUGV0ZXIhDQoNCkknbGwgdHJ5IHRvIGZpbmQgb3V0IHByb3BlciBhbGln
bm1lbnQgYnkgbG9va2luZyBhdCB0aGUgY29kZXMuDQoNCkJlc3QgUmVnYXJkcywNCkt3YW5nd29v
IExlZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IElnb3IgTWFtbWVk
b3YgW21haWx0bzppbWFtbWVkb0ByZWRoYXQuY29tXQ0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAw
MSwgMjAxNiA2OjE1IFBNDQo+IFRvOiBQZXRlciBNYXlkZWxsDQo+IENjOiDAzLGkv+woTEVFIEtX
QU5HV09PKSBNUyBTVzsgWGlhbyBHdWFuZ3Jvbmc7IE1pY2hhZWwgUy4gVHNpcmtpbjsgUGFvbG8g
Qm9uemluaTsgUmljaGFyZCBIZW5kZXJzb247DQo+IEVkdWFyZG8gSGFia29zdDsgU2hhbm5vbiBa
aGFvOyBTaGFubm9uIFpoYW87IFFFTVUgRGV2ZWxvcGVyczsgcWVtdS1hcm07IMGkv+y8rihDSFVO
RyBXT08gU1VLKSBNUyBTVzsgsegNCj4gx/bDtihLSU0gSFlVTkNIVUwpIE1TIFNXDQo+IFN1Ympl
Y3Q6IFJlOiBbUkZDIFBBVENIIDEvM10gaHcvYXJtL3ZpcnQ6IGFkZCBob3RwbHVnIG1lbW9yeSBz
dXBwb3J0DQo+IA0KPiBPbiBNb24sIDEgQXVnIDIwMTYgMDk6MTM6MzQgKzAxMDANCj4gUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+ID4gT24gMSBB
dWd1c3QgMjAxNiBhdCAwODo0NiwgSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4g
d3JvdGU6DQo+ID4gPiBPbiBNb24sIDEgQXVnIDIwMTYgMDA6MzU6MzUgKzAwMDANCj4gPiA+ICJr
d2FuZ3dvby5sZWVAc2suY29tIiA8a3dhbmd3b28ubGVlQHNrLmNvbT4gd3JvdGU6DQo+ID4NCj4g
PiA+PiA+ID4gKy8qIDFHQiBhbGlnbm1lbnQgZm9yIGhvdHBsdWcgbWVtb3J5IHJlZ2lvbiAqLw0K
PiA+ID4+ID4gPiArI2RlZmluZSBBUkNIX1ZJUlRfSE9UUExVR19NRU1fQUxJR04gKDFVTEwgPDwg
MzApDQo+ID4gPj4gPg0KPiA+ID4+ID4gV2hlcmUgZG9lcyB0aGUgMUdCIGFsaWdubWVudCBjb21l
IGZyb20/IFdoeSBkbyB3ZSBuZWVkIDFHQg0KPiA+ID4+ID4gYWxpZ25tZW50IGZvciB0aGUgYmFz
ZSBidXQgb25seSAxS0IgYWxpZ25tZW50IGZvciB0aGUgc2l6ZT8NCj4gPiA+Pg0KPiA+ID4+IFRo
ZSBhbGlnbm1lbnQgdmFsdWUgb2YgaG90cGx1Z19tZW1vcnkuYmFzZSByZWZlcnJlZCBmcm9tIGkz
ODYgcGMuYyBhbmQgcHBjIHNwYXByLmMuDQo+ID4gPj4gQ291bGQgeW91IHN1Z2dlc3QgYSBwcm9w
ZXIgcmFuZ2UgZm9yIHRoaXM/DQo+ID4NCj4gPiA+IEJhc2UgYWxpZ25tZW50IGNvbWVzIGZyb20g
bWF4IHN1cHBvcnRlZCBodWdlcGFnZSBzaXplLA0KPiA+DQo+ID4gTWF4IGh1Z2VwYWdlIHNpemUg
Zm9yIGFueSBob3N0PyAoaWYgc28sIHNob3VsZCBiZSBkZWZpbmVkDQo+ID4gaW4gYSBjb21tb24g
aGVhZGVyIHNvbWV3aGVyZSkNCj4gPiBNYXggaHVnZXBhZ2Ugc2l6ZSBmb3IgQVJNIGhvc3RzPyAo
aWYgc28sIHdoeSBpcyBUQ0cNCj4gPiBkaWZmZXJlbnQgZnJvbSBLVk0/LCBhbmQgc2hvdWxkIHN0
aWxsIGJlIGluIGEgY29tbW9uDQo+ID4gaGVhZGVyIHNvbWV3aGVyZSkNCj4gSXQncyB0aGUgc2Ft
ZSBmb3IgVENHIGJ1dCBpdCBwcm9iYWJseSBkb2Vzbid0IG1hdHRlciBtdWNoIHRoZXJlLA0KPiBt
YWluIHVzYWdlIGlzIHRvIHByb3ZpZGUgYmV0dGVyIHBlcmZvcm1hbmNlIHdpdGggS1ZNLg0KPiAN
Cj4gU28gSSdkIHNheSBpdCdzIGhvc3QgZGVwZW5kZWQgKGZvciB4ODYgaXQncyAxR2IpLA0KPiBw
cm9iYWJseSBvdGhlciB2YWx1ZXMgZm9yIEFSTSBhbmQgUFBDDQo+IA0KPiA+DQo+ID4gPiB3aGls
ZQ0KPiA+ID4gc2l6ZSBhbGlnbm1lbnQgc2hvdWxkIGRlcGVuZCBvbiBiYWNrZW5kJ3MgcGFnZSBz
aXplDQo+ID4NCj4gPiBXaGljaCBwYWdlIHNpemUgZG8geW91IGhhdmUgaW4gbWluZCBoZXJlPyBU
QVJHRVRfUEFHRV9TSVpFDQo+ID4gaXMgb2Z0ZW4gbm90IHRoZSByaWdodCBhbnN3ZXIsIHNpbmNl
IGl0IGRvZXNuJ3QNCj4gPiBjb3JyZXNwb25kIGVpdGhlciB0byB0aGUgYWN0dWFsIHBhZ2Ugc2l6
ZSBiZWluZyB1c2VkDQo+ID4gYnkgdGhlIGhvc3Qga2VybmVsIG9yIHRvIHRoZSBhY3R1YWwgcGFn
ZSBzaXplIHVzZWQNCj4gPiBieSB0aGUgZ3Vlc3Qga2VybmVsLi4uDQo+IGFsaWdubWVudCBjb21l
cyBmcm9tIGhlcmU6IG1lbW9yeV9yZWdpb25fZ2V0X2FsaWdubWVudCgpDQo+IA0KPiBleGVjOmMN
Cj4gICAgTUFYKHBhZ2Vfc2l6ZSwgUUVNVV9WTUFMTE9DX0FMSUdOKQ0KPiBzbyBpdCdzIGVpdGhl
ciBiYWNrZW5kJ3MgcGFnZSBzaXplIG9yIGEgbWluIGNodW5rIFFFTVUNCj4gYWxsb2NhdGVzIG1l
bW9yeSB0byBtYWtlIEtWTS92YWxncmluZC93aGF0bm90IGhhcHB5Lg0KPiANCj4gPg0KPiA+IHRo
YW5rcw0KPiA+IC0tIFBNTQ0KDQo=
