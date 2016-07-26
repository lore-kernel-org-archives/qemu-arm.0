Received: by 10.25.21.156 with SMTP id 28csp1543413lfv;
        Mon, 25 Jul 2016 23:33:08 -0700 (PDT)
X-Received: by 10.55.217.89 with SMTP id u86mr27429664qki.114.1469514788409;
        Mon, 25 Jul 2016 23:33:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z186si20141607qke.27.2016.07.25.23.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 23:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRvvP-0004dt-Nm
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 02:33:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bRvvJ-0004bf-Mq
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 02:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bRvvH-0000Zn-Mp
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 02:33:00 -0400
Received: from exvmail4.skhynix.com ([166.125.252.92]:48129
	helo=invmail4.hynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bRvvA-0000ZU-Pj; Tue, 26 Jul 2016 02:32:53 -0400
X-AuditID: a67dfc5b-f79386d000007ffb-0f-5797040d9929
Received: from nmail01.hynixad.com (10.156.98.81) by nmail05.hynixad.com
	(10.156.98.85) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Tue, 26 Jul 2016 15:32:39 +0900
Received: from nmail01.hynixad.com ([::1]) by nmail01.hynixad.com
	([fe80::b401:ed0f:ec2d:533c%24]) with mapi id 15.00.0847.030;
	Tue, 26 Jul 2016 15:32:39 +0900
From: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
Thread-Index: AQHR4iCy2E+tnayAQkKaa+cF88CEZqAowfCAgAGE4VA=
Date: Tue, 26 Jul 2016 06:32:39 +0000
Message-ID: <eef1f2e11f704d4a86ee15143c333f21@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA-GZpj-Rb_zU4guGVsdAXYekQc+Yix0yfc8xCA9BtO=ZQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-GZpj-Rb_zU4guGVsdAXYekQc+Yix0yfc8xCA9BtO=ZQ@mail.gmail.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.92.132.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsXCNUdUSZeXZXq4wZLNChYN90ItFq5axmxx
	+mgHs8X/X69YLfZv+8dqMefMAxaLBd0L2SyO9+5gsZh26g6rxdNlv1kt5m14weTA7dFy5C2r
	x51re9g85p0M9HhybTOTx/t9V9k8+qZ/YA5gi+KySUnNySxLLdK3S+DKOH7wNUtBk3TFkxVn
	WRsYV0h1MXJySAiYSExvusMOYYtJXLi3nq2LkYtDSGANo8SzXe+YIJzFjBIXjv1gBaliEzCU
	2HtrH5gtIqAjceX6ZrAiZoFPzBJXdi5jAkkIC3hI/Lk8iR2iyFNi6/3vQGM5gGwriYkbnEDC
	LAKqEt8v32MBsXkFnCSezN4F1iok0MUo0X8oHKScUyBQ4uExQRCTUUBW4uo1GZAKZgFxicVf
	rzFD3CwgsWTPeShbVOLl43+sELaixLfX39lBWpkFNCXW79KHaFWUmNL9kB1iqaDEyZlPWCDK
	JSUOrrjBMoFRfBaSDbMQumch6Z6FpHsBI8sqRpHMvLLcxMwcE73i7IzKvMwKveT83E2MwGhe
	Vvsnegfjkr8ehxgFOBiVeHgnuE4LF2JNLCuuzD3EKMHBrCTC2/QfKMSbklhZlVqUH19UmpNa
	fIhRmoNFSZz32/++cCGB9MSS1OzU1ILUIpgsEwenVAPjNpd5xV/27pxTu7lD8l7L6wm/zU1q
	j3amh17cu0N98ZptD0sb5j56eiYlr+H9yd9WB50Z6z7G5LaXXOcV21P5JkX2/QPb+c9WC089
	kiRQttyKaX1YE58daw3bGv7shm/npKvcIu4tvr8r5O7r6cYbFzFfWHuvIn35iTblziDBI5b7
	N+3U2ST2SomlOCPRUIu5qDgRADU0hrDiAgAA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.92
Subject: Re: [Qemu-arm] [RFC PATCH 0/3] add nvdimm support on AArch64 virt
 platform
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
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3/qEjAc6bOq

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgeW91ciBraW5kIGNvbW1lbnQhIEkgZGVzY3JpYmVkIGFi
b3V0IE5WRElNTSBicmllZmx5IGJlbG93Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFBldGVyIE1heWRlbGwgW21haWx0bzpwZXRlci5tYXlkZWxsQGxpbmFyby5vcmdd
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjYsIDIwMTYgMTowNyBBTQ0KPiBUbzog7J206rSR7Jqw
KExFRSBLV0FOR1dPTykgTVMgU1cNCj4gQ2M6IFhpYW8gR3Vhbmdyb25nOyBNaWNoYWVsIFMuIFRz
aXJraW47IElnb3IgTWFtbWVkb3Y7IFBhb2xvIEJvbnppbmk7IFJpY2hhcmQgSGVuZGVyc29uOyBF
ZHVhcmRvDQo+IEhhYmtvc3Q7IFNoYW5ub24gWmhhbzsgU2hhbm5vbiBaaGFvOyBRRU1VIERldmVs
b3BlcnM7IHFlbXUtYXJtOyDsoJXsmrDshJ0oQ0hVTkcgV09PIFNVSykgTVMgU1c7IOq5gO2YhOyy
oChLSU0NCj4gSFlVTkNIVUwpIE1TIFNXDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAvM10g
YWRkIG52ZGltbSBzdXBwb3J0IG9uIEFBcmNoNjQgdmlydCBwbGF0Zm9ybQ0KPiANCj4gT24gMjAg
SnVseSAyMDE2IGF0IDAxOjQ5LCBLd2FuZ3dvbyBMZWUgPGt3YW5nd29vLmxlZUBzay5jb20+IHdy
b3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZCBhbiBldmFsdWF0aW9uIGVudmlyb25tZW50
IG9mIE5WRElNTSBvbiBBQXJjaDY0DQo+ID4gdmlydCBwbGF0Zm9ybS4gVGhyZWUgcGFydHMgbmVl
ZCB0byBiZSBpbXBsZW1lbnRlZCB0byBtYWtlIHRoaXMgZmVhdHVyZQ0KPiA+IHdvcmtpbmcgcHJv
cGVybHkuDQo+ID4NCj4gPiAxLiBtZW1vcnkgaG90cGx1ZyBvbiBhcm0gdmlydCBwbGF0Zm9ybQ0K
PiA+IDIuIGNvbmZpZ3VyYWJsZSBBQ1BJIElPIGJhc2UgYW5kIHNpemUgYm90aCBmb3IgaTM4NiBh
bmQgYXJtIHBsYXRmb3JtDQo+ID4gMy4gZW5hYmxlIE5WRElNTSBvbiBhcm0gdmlydCBwbGF0Zm9y
bQ0KPiA+DQo+ID4gVGhlIG1lbW9yeSBob3RwbHVnIGlzIHJlcXVpcmVkIHRvIHJlY29nbml6ZSBE
SU1NIHR5cGUgbWVtb3J5IGFuZCB0aGlzDQo+ID4gaXMgYWxzbyB1c2VkIGZvciBOVkRJTU0gZGV2
aWNlIHJlY29nbml0aW9uLg0KPiA+DQo+ID4gVGhlIEFDUEkgSU8gYmFzZSBhbmQgc2l6ZSBuZWVk
IHRvIGJlIGNoYW5nZWQgb24gY3JlYXRpbmcgQUNQSSBORklUDQo+ID4gYmVjYXVzZSBhcm0gcGxh
dGZvcm0gdXNlcyBtZW1vcnktbWFwcGVkIElPIHdoaWNoIGlzIGRpZmZlcmVudCBmcm9tDQo+ID4g
aTM4NiBwbGF0Zm9ybS4gVGh1cywgdGhpcyBwYXRjaCBzZXQgaW5jbHVkZXMgdGhlIGNoYW5nZXMg
b2Ygc2V0dGluZw0KPiA+IEFDUEkgSU8gYmFzZSBhbmQgc2l6ZSBkdXJpbmcgTlZESU1NIGluaXRp
YWxpemF0aW9uLg0KPiA+DQo+ID4gVGhlIGxhc3QgcGFydCBlbmFibGVzIE5WRElNTSBvbiBhcm0g
dmlydCBwbGF0Zm9ybS4gVGhlIGZlYXR1cmUgaXMNCj4gPiBkaXNhYmxlZCBieSBkZWZhdWx0LiBT
byBleHBsaWNpdCBvcHRpb24gLSBudmRpbW09b24gLSBpcyByZXF1aXJlZCB0bw0KPiA+IGVuYWJs
ZSB0aGUgZmVhdHVyZS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhpcyBwYXRjaHNldC4gQ291bGQgeW91
IHByb3ZpZGUgYSBicmllZiBzdW1tYXJ5IG9mDQo+IHdoeSB0aGlzIGlzIGludGVyZXN0aW5nL3Vz
ZWZ1bCBmb3IgdGhlIGJlbmVmaXQgb2YgcGVvcGxlIHdobyBkb24ndA0KPiBrbm93IHdoYXQgYW4g
TlZESU1NIGlzLCBwbGVhc2U/DQoNCk5WRElNTSBzdGFuZHMgZm9yIE5vbi1Wb2xhdGlsZSBESU1N
IHdoaWNoIGhhcyBESU1NIGZvcm0gZmFjdG9yIGxpa2UgUEMtRElNTQ0KKE1lbW9yeSBNb2R1bGUg
dXNlZCBpbiBQQykgYW5kIGNhbiBiZSB1c2VkIGxpa2UgYSBtZW1vcnksIGJ1dCB0aGUgc3RvcmVk
IGRhdGENCmlzIHByZXNlcnZlZCBvbiBwb3dlciBmYWlsdXJlLiBTbyBpdCBjYW4gYmUgdXNlZCBh
cyBhIG1lbW9yeSwgYSBzdG9yYWdlLCBvcg0KYmFja3VwIG1lbW9yeSBvbiBwb3dlciBmYWlsdXJl
Lg0KDQpOVkRJTU0tTiBpcyBhbHJlYWR5IG91dCBpbiB0aGUgbWFya2V0IGFuZCBJbnRlbCwgSFBF
LCBhbmQgb3RoZXIgY29tcGFuaWVzDQphY3RpdmVseSBkZXZlbG9waW5nIHJlbGF0ZWQgc29mdHdh
cmUuIEluIExpbnV4IGtlcm5lbCwgc2V2ZXJhbCB1c2FnZXMgZXhpc3QNCmxpa2UgUE1FTSwgQkxL
LWFwZXJ0dXJlLCBhbmQgbWl4ZWQgbW9kZS4gVGhleSBhcmUgYWN0aXZlbHkgdW5kZXIgZGV2ZWxv
cGluZy4NCg0KSW4gUUVNVSwgTlZESU1NIGhhcyBiZWVuIGVtdWxhdGVkIG9uIGkzODYgcGxhdGZv
cm0uIE15IHBhdGNoIHNlcmllcyB0cmllcyB0bw0KZW5hYmxlIHRoZSBlbnZpcm9ubWVudCBpbiBB
QXJjaDY0IHBsYXRmb3JtLiBSZWxhdGVkIExpbnV4IGtlcm5lbCBwYXRjaGVzIHdlcmUNCnBvc3Rl
ZCBpbnRvIHRoZSBtYWlsaW5nIGxpc3QgYW5kIHRoZXkgYXJlIHVuZGVyIHJldmlldy9yZXZpc2Ug
cHJvY2VzcyBjdXJyZW50bHkuDQoNCj4gdGhhbmtzDQo+IC0tIFBNTQ0KDQpCZXN0IFJlZ2FyZHMs
DQpLd2FuZ3dvbyBMZWUNCg==
