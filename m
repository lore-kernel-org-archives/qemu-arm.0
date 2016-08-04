Received: by 10.25.21.156 with SMTP id 28csp1524030lfv;
        Thu, 4 Aug 2016 16:30:44 -0700 (PDT)
X-Received: by 10.55.146.2 with SMTP id u2mr9743239qkd.54.1470353444649;
        Thu, 04 Aug 2016 16:30:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si7204146qkj.86.2016.08.04.16.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 16:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVS68-0001nA-1V
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 19:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bVS65-0001n2-6N
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 19:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bVS60-0001zV-5K
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 19:30:41 -0400
Received: from exvmail.hynix.com ([166.125.252.79]:51555
	helo=invmail.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bVS5z-0001yY-KR; Thu, 04 Aug 2016 19:30:36 -0400
X-AuditID: a67dfc4e-f797e6d000000a40-0d-57a3d0158ea7
Received: from nmail01.hynixad.com (10.156.98.81) by nmail08.hynixad.com
	(10.156.98.88) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Fri, 5 Aug 2016 08:30:29 +0900
Received: from nmail01.hynixad.com ([::1]) by nmail01.hynixad.com
	([fe80::b401:ed0f:ec2d:533c%24]) with mapi id 15.00.0847.030;
	Fri, 5 Aug 2016 08:30:29 +0900
From: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
To: Igor Mammedov <imammedo@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
	support
Thread-Index: AQHR4iCz63i60J7QhU+DySTPVw+aOaAvLcOAgAQZZ3D//+87gIAAB6sAgAARCoCAAX1wAIAASD2AgAR1XiA=
Date: Thu, 4 Aug 2016 23:30:28 +0000
Message-ID: <3f8bffbf6bb94905a7575acb4ae39114@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
	<CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
	<20160801111433.2af5c013@nial.brq.redhat.com>
	<CAFEAcA9cbsq5oWCABMww3EWkV8cPsaGJrO0NyPyc4Ph7aA_MQg@mail.gmail.com>
	<20160802141819.406aa754@nial.brq.redhat.com>
In-Reply-To: <20160802141819.406aa754@nial.brq.redhat.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.92.132.196]
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsXCNUdUSVf0wuJwg0NHjCwa7oVaLFy1jNni
	9NEOZov/v16xWuzf9o/VYs6ZBywWC7oXslkc793BYjHt1B1Wi6fLfrNazNvwgsmB26PlyFtW
	jzvX9rB5zDsZ6PHk2mYmj/f7rrJ59E3/wBzAFsVlk5Kak1mWWqRvl8CVMefHK5aCdeoVu3ZO
	YW9gXKPWxcjJISFgIrHvdAsjhC0mceHeerYuRi4OIYHVjBI3Ln9ghXAWMUosXbuBBaSKTcBQ
	Yu+tfUAJDg4RgWCJV2+UQGqYBc4yS6z5+ogNpEYYKP7+0jGwehGBEImG+5NZIewkiR2tXUwg
	vSwCKhJPZ/qBhHkFnCTe7DgPViIkMJtFYt7SQBCbU8BKYt6vZcwg5YwCshJXr8mAhJkFxCUW
	f73GDHGzgMSSPeehbFGJl4//sULYihLfXn9nh6g3kliyej4ThK0oMaX7ITvEWkGJkzOfsEDU
	S0ocXHGDZQKj+CwkK2YhaZ+FpH0WkvYFjCyrGIUz88pyEzNz9IqzMyrzMiv0kvNzNzEC43lZ
	7R+/HYwvfmkdYhTgYFTi4a2IXxwuxJpYVlyZe4hRgoNZSYS3+zxQiDclsbIqtSg/vqg0J7X4
	EKM0B4uSOO+3/33hQgLpiSWp2ampBalFMFkmDk6pBkb1PzM//pEW/LVjZuC1fd94b6z5lX3R
	3OCavV/eeTuuDUpbL7m8s2zYcdfuoY7YHwGtL97NDWoPO6TWsVWpq10r8ezYHMmxQ3jLjLl2
	TcdnVG+dFc+2Lf3SH939pg7XnQ64Tzzz9fqXCQw77gtcW/d3uhHjI9c3WVXstqLyJzpdwt02
	TuDekcKpxFKckWioxVxUnAgAhrOlouMCAAA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.79
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 1/3] hw/arm/virt: add
 hotplug memory support
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pCHVRQlxLZgo

SGkgSWdvciwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGd1aWRlIHRvIHNwbGl0IHRoZSBob3RwbHVn
IHBhdGNoLg0KQ3VycmVudGx5IEknbSBsb29raW5nIGF0IHRoZSBMaW51eCBrZXJuZWwgY29kZXMg
cmVsYXRlZCB3aXRoIGh1Z2UgcGFnZSBzaXplLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IElnb3IgTWFtbWVkb3YgW21haWx0bzppbWFtbWVkb0ByZWRoYXQuY29tXQ0K
PiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMDIsIDIwMTYgOToxOCBQTQ0KPiBUbzogUGV0ZXIgTWF5
ZGVsbA0KPiBDYzogWGlhbyBHdWFuZ3Jvbmc7IEVkdWFyZG8gSGFia29zdDsgTWljaGFlbCBTLiBU
c2lya2luOyBRRU1VIERldmVsb3BlcnM7IMGkv+y8rihDSFVORyBXT08gU1VLKSBNUyBTVzsNCj4g
cWVtdS1hcm07IFNoYW5ub24gWmhhbzsgU2hhbm5vbiBaaGFvOyBQYW9sbyBCb256aW5pOyCx6Mf2
w7YoS0lNIEhZVU5DSFVMKSBNUyBTVzsgwMyxpL/sKExFRSBLV0FOR1dPTykgTVMNCj4gU1c7IFJp
Y2hhcmQgSGVuZGVyc29uDQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1kZXZlbF0gW1JGQyBQQVRDSCAx
LzNdIGh3L2FybS92aXJ0OiBhZGQgaG90cGx1ZyBtZW1vcnkgc3VwcG9ydA0KPiANCj4gT24gVHVl
LCAyIEF1ZyAyMDE2IDA4OjU5OjQ2ICswMTAwDQo+IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+IA0KPiA+IE9uIDEgQXVndXN0IDIwMTYgYXQgMTA6MTQs
IElnb3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+ID4gT24gTW9u
LCAxIEF1ZyAyMDE2IDA5OjEzOjM0ICswMTAwDQo+ID4gPiBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+ID4+IE9uIDEgQXVndXN0IDIwMTYgYXQgMDg6
NDYsIElnb3IgTWFtbWVkb3YgPGltYW1tZWRvQHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+ID4+ID4g
QmFzZSBhbGlnbm1lbnQgY29tZXMgZnJvbSBtYXggc3VwcG9ydGVkIGh1Z2VwYWdlIHNpemUsDQo+
ID4gPj4NCj4gPiA+PiBNYXggaHVnZXBhZ2Ugc2l6ZSBmb3IgYW55IGhvc3Q/IChpZiBzbywgc2hv
dWxkIGJlIGRlZmluZWQNCj4gPiA+PiBpbiBhIGNvbW1vbiBoZWFkZXIgc29tZXdoZXJlKQ0KPiA+
ID4+IE1heCBodWdlcGFnZSBzaXplIGZvciBBUk0gaG9zdHM/IChpZiBzbywgd2h5IGlzIFRDRw0K
PiA+ID4+IGRpZmZlcmVudCBmcm9tIEtWTT8sIGFuZCBzaG91bGQgc3RpbGwgYmUgaW4gYSBjb21t
b24NCj4gPiA+PiBoZWFkZXIgc29tZXdoZXJlKQ0KPiA+ID4gSXQncyB0aGUgc2FtZSBmb3IgVENH
IGJ1dCBpdCBwcm9iYWJseSBkb2Vzbid0IG1hdHRlciBtdWNoIHRoZXJlLA0KPiA+ID4gbWFpbiB1
c2FnZSBpcyB0byBwcm92aWRlIGJldHRlciBwZXJmb3JtYW5jZSB3aXRoIEtWTS4NCj4gPiA+DQo+
ID4gPiBTbyBJJ2Qgc2F5IGl0J3MgaG9zdCBkZXBlbmRlZCAoZm9yIHg4NiBpdCdzIDFHYiksDQo+
ID4gPiBwcm9iYWJseSBvdGhlciB2YWx1ZXMgZm9yIEFSTSBhbmQgUFBDDQo+ID4NCj4gPiBXZSBw
cm9iYWJseSBkb24ndCB3YW50IHRvIG1ha2UgdGhlIG1lbW9yeSBsYXlvdXQgZGVwZW5kDQo+ID4g
b24gdGhlIGhvc3QgYXJjaGl0ZWN0dXJlLCB0aG91Z2ggOi0oDQo+IEltcG9ydGFudCBoZXJlIGlz
IG5vdCBjaGFuZ2UgaXQgZHluYW1pY2FsbHkgc28gaXQgd29uJ3QNCj4gYnJlYWsgbWlncmF0aW9u
Lg0KPiBPdGhlcndpc2UgaXQgY291bGQgYmUgYSB2YWx1ZSB0aGF0IG1ha2VzIGEgc2Vuc2UgZm9y
DQo+IHRoZSB1c2UtY2FzZSB3aGVyZSBwZXJmb3JtYW5jZSBtYXR0ZXJzIG1vc3QsIGkuZS4gS1ZN
DQo+IHdoaWNoIG1ha2VzIHVzIHRvIGRlcml2ZSB2YWx1ZSBmcm9tIG1heCBzdXBwb3J0ZWQgcGFn
ZQ0KPiBzaXplIGZvciBhIEtWTSBob3N0IChtZWFuaW5nIGd1ZXN0IGlzIHRoZSBzYW1lIGFyY2gp
DQo+IA0KPiBJbiBjYXNlIG9mIHg4NiB2YWx1ZSBpcyBjb25zdGFudCBoYXJkY29kZWQgaW4gdGFy
Z2V0DQo+IHNwZWNpZmljIGNvZGUgd2hpY2ggYXBwbGllcyB0byBib3RoIEtWTSBhbmQgVENHLg0K
PiANCj4gUGVyaGFwcyB0aGVyZSBpcyBhIGJldHRlciB3YXkgdG8gaGFuZGxlIGl0IHdoaWNoIEkg
anVzdA0KPiBkb24ndCBzZWUuDQo+IA0KPiA+DQo+ID4gPj4NCj4gPiA+PiA+IHdoaWxlDQo+ID4g
Pj4gPiBzaXplIGFsaWdubWVudCBzaG91bGQgZGVwZW5kIG9uIGJhY2tlbmQncyBwYWdlIHNpemUN
Cj4gPiA+Pg0KPiA+ID4+IFdoaWNoIHBhZ2Ugc2l6ZSBkbyB5b3UgaGF2ZSBpbiBtaW5kIGhlcmU/
IFRBUkdFVF9QQUdFX1NJWkUNCj4gPiA+PiBpcyBvZnRlbiBub3QgdGhlIHJpZ2h0IGFuc3dlciwg
c2luY2UgaXQgZG9lc24ndA0KPiA+ID4+IGNvcnJlc3BvbmQgZWl0aGVyIHRvIHRoZSBhY3R1YWwg
cGFnZSBzaXplIGJlaW5nIHVzZWQNCj4gPiA+PiBieSB0aGUgaG9zdCBrZXJuZWwgb3IgdG8gdGhl
IGFjdHVhbCBwYWdlIHNpemUgdXNlZA0KPiA+ID4+IGJ5IHRoZSBndWVzdCBrZXJuZWwuLi4NCj4g
PiA+IGFsaWdubWVudCBjb21lcyBmcm9tIGhlcmU6IG1lbW9yeV9yZWdpb25fZ2V0X2FsaWdubWVu
dCgpDQo+ID4gPg0KPiA+ID4gZXhlYzpjDQo+ID4gPiAgICBNQVgocGFnZV9zaXplLCBRRU1VX1ZN
QUxMT0NfQUxJR04pDQo+ID4gPiBzbyBpdCdzIGVpdGhlciBiYWNrZW5kJ3MgcGFnZSBzaXplIG9y
IGEgbWluIGNodW5rIFFFTVUNCj4gPiA+IGFsbG9jYXRlcyBtZW1vcnkgdG8gbWFrZSBLVk0vdmFs
Z3JpbmQvd2hhdG5vdCBoYXBweS4NCj4gPg0KPiA+IFNpbmNlIHRoYXQncyBhbHdheXMgbGFyZ2Vy
IHRoYW4gVEFSR0VUX1BBR0VfU0laRQ0KPiA+IHdoeSBhcmUgd2UgY2hlY2tpbmcgZm9yIGFuIGFs
aWdubWVudCBoZXJlIHRoYXQncw0KPiA+IG5vdCBhY3R1YWxseSBzdWZmaWNpZW50IHRvIG1ha2Ug
dGhpbmdzIHdvcms/DQo+IFlvdSBtZWFuIGZvbGxvd2luZyBodW5rOg0KPiANCj4gKyAgICAgICAg
aWYgKFFFTVVfQUxJR05fVVAobWFjaGluZS0+bWF4cmFtX3NpemUsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICBUQVJHRVRfUEFHRV9TSVpFKSAhPSBtYWNoaW5lLT5tYXhyYW1fc2l6ZSkgew0KPiAN
Cj4gSXQncyBhIGJpdCBsYXRlIHRvIGZpeCBmb3IgeDg2IHdpdGhvdXQgYnJlYWtpbmcgQ0xJLA0K
PiBzaWRlIGVmZmVjdCB3b3VsZCBiZSBpbmFiaWxpdHkgdG8gaG90cGx1ZyB1cHRvIG1heG1lbSBp
ZiBtYXhtZW0NCj4gaXMgbWlzYWxpZ25lZCB3cnQgdXNlZCBiYWNrZW5kIHBhZ2Ugc2l6ZQ0KPiAN
Cj4gQVJDSF9WSVJUX0hPVFBMVUdfTUVNX0FMSUdOIHNob3VsZCBiZSB1c2VkIGluc3RlYWQgb2Yg
VEFSR0VUX1BBR0VfU0laRQ0KPiANCj4gUFM6DQo+IEkgaGF2ZW4ndCByZXZpZXdlZCBzZXJpZXMg
eWV0LCBidXQgSSdkIHNwbGl0IHRoaXMgcGF0Y2ggaW4gMw0KPiB0byBtYWtlIHJldmlldyBlYXNp
ZXINCj4gICAxc3QgLSBpbnRyb2R1Y2UgbWFjaGluZSBsZXZlbCBob3RwbHVnIGhvb2tzDQo+ICAg
Mm5kIC0gYWRkIE1lbW9yeUhvdHBsdWdTdGF0ZSB0byBWaXJ0TWFjaGluZVN0YXRlIGFuZCBpbml0
aWFsaXplIGl0DQo+ICAgM3JkIC0gYWRkIHZpcnRfZGltbV9wbHVnKCkgaGFuZGxlcg0KDQpPSy4g
SSdsbCB0cnkgdG8gc3BsaXQgaXQuDQoNCj4gPg0KPiA+IHRoYW5rcw0KPiA+IC0tIFBNTQ0KPiA+
DQoNCkJlc3QgUmVnYXJkcywNCkt3YW5nd29vIExlZQ0K
