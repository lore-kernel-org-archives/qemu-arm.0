Received: by 10.25.21.156 with SMTP id 28csp2043927lfv;
        Tue, 26 Jul 2016 19:23:57 -0700 (PDT)
X-Received: by 10.237.45.135 with SMTP id i7mr45367881qtd.30.1469586237262;
        Tue, 26 Jul 2016 19:23:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66si2649913qkc.257.2016.07.26.19.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 19:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSEVo-0005YE-Q0
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 22:23:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bSEVj-0005Xx-W3
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 22:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bSEVf-0001zb-N3
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 22:23:50 -0400
Received: from exvmail3.hynix.com ([166.125.252.90]:51172
	helo=invmail3.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bSEVf-0001z8-5e; Tue, 26 Jul 2016 22:23:47 -0400
X-AuditID: a67dfc59-f790b6d000004b07-00-57981b2d30c1
Received: from nmail01.hynixad.com (10.156.98.81) by nmail06.hynixad.com
	(10.156.98.86) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Wed, 27 Jul 2016 11:23:41 +0900
Received: from nmail01.hynixad.com ([::1]) by nmail01.hynixad.com
	([fe80::b401:ed0f:ec2d:533c%24]) with mapi id 15.00.0847.030;
	Wed, 27 Jul 2016 11:23:41 +0900
From: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RFC PATCH 3/3] hw/arm/virt: add nvdimm emulation support
Thread-Index: AQHR4iC2/8Vb8R+DvU6EnFjQmQGcEqAowaUAgAGPh9D//4GggIABwnqQ
Date: Wed, 27 Jul 2016 02:23:40 +0000
Message-ID: <8d362b93c76c429d864594b86efad123@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-4-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA-_MMatknCSDDRX-V7MiM1rJzvWHYwc_Eurt1b_xyajaQ@mail.gmail.com>
	<7b410430974a47af9750f1666ac37d70@nmail01.hynixad.com>
	<CAFEAcA_OqPCjnyU=oB+ncUCPiycjj3x0SK4duov2Wu3ThtYoUw@mail.gmail.com>
In-Reply-To: <CAFEAcA_OqPCjnyU=oB+ncUCPiycjj3x0SK4duov2Wu3ThtYoUw@mail.gmail.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.92.132.196]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsXCNUdUSVdPeka4we317BYN90ItFq5axmxx
	+mgHs8X/X69YLfZv+8dqMefMAxaLBd0L2SyO9+5gsZh26g6rxdNlv1kt5m14weTA7dFy5C2r
	x51re9g85p0M9HhybTOTx/t9V9k8+qZ/YA5gi+KySUnNySxLLdK3S+DKuPdsJXvBEYGKyXO6
	WBoYewS6GDk4JARMJF59Vu1i5AQyxSQu3FvP1sXIxSEksIZR4v+fk8wQzmJGicbrd9lAqtgE
	DCX23trHCmKLCOhIXLm+mQmkiFngE7PElZ3LmEASwgJuEhtWHmCEKHKXuLp+LRPINhGg+KMv
	YSBhFgFVid0bu8FKeAWcJM6taoRadoRJ4uLhfYwg9ZwCgRKXrxSCmIwCshJXr8mAlDMLiEss
	/nqNGeJoAYkle85D2aISLx//Y4WwFSW+vf7ODtLKLKApsX6XPkSrosSU7ofsEFsFJU7OfMIC
	US4pcXDFDZYJjOKzkGyYhdA9C0n3LCTdCxhZVjGKZOaV5SZm5hjrFWdnVOZlVugl5+duYgRG
	87LaP5E7GHta9Q8xCnAwKvHwWu6aHi7EmlhWXJl7iFGCg1lJhHeL5IxwId6UxMqq1KL8+KLS
	nNTiQ4zSHCxK4rzf/veFCwmkJ5akZqemFqQWwWSZODilGhjLPmzaMGVmvdzfipOTV1t4brEz
	YVrVzmDfEScWafZOc43EbjdXrntdf77wrW6atq8h5wmfxZYjTCvXKa3b46vv1jHvY7Kh6gyV
	rokO8kJKSxNENJQb7y8X28+y+WCG5tH2RCPFva/ehNz0DRT+J+I1qbt9m+v9ELcHa8r+vlDb
	oqlitOjtzDIlluKMREMt5qLiRADK2z8g4gIAAA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.90
Subject: Re: [Qemu-arm] [RFC PATCH 3/3] hw/arm/virt: add nvdimm emulation
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
X-TUID: 5+QzHrWLSWS6

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgeW91ciBndWlkYW5jZSENCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDI2LCAyMDE2IDU6MjMgUE0NCj4g
VG86IOydtOq0keyasChMRUUgS1dBTkdXT08pIE1TIFNXDQo+IENjOiBYaWFvIEd1YW5ncm9uZzsg
TWljaGFlbCBTLiBUc2lya2luOyBJZ29yIE1hbW1lZG92OyBQYW9sbyBCb256aW5pOyBSaWNoYXJk
IEhlbmRlcnNvbjsgRWR1YXJkbw0KPiBIYWJrb3N0OyBTaGFubm9uIFpoYW87IFNoYW5ub24gWmhh
bzsgUUVNVSBEZXZlbG9wZXJzOyBxZW11LWFybTsg7KCV7Jqw7ISdKENIVU5HIFdPTyBTVUspIE1T
IFNXOyDquYDtmITssqAoS0lNDQo+IEhZVU5DSFVMKSBNUyBTVw0KPiBTdWJqZWN0OiBSZTogW1JG
QyBQQVRDSCAzLzNdIGh3L2FybS92aXJ0OiBhZGQgbnZkaW1tIGVtdWxhdGlvbiBzdXBwb3J0DQo+
IA0KPiBPbiAyNiBKdWx5IDIwMTYgYXQgMDg6MDMsIGt3YW5nd29vLmxlZUBzay5jb20gPGt3YW5n
d29vLmxlZUBzay5jb20+IHdyb3RlOg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4gUGxlYXNlLCBj
aGVjayB0aGUgY29tbWVudHMgYmVsb3cuIFRoYW5rcyBhIGxvdCENCj4gPg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWlsdG86cGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiA+PiBUaGlzIHNlZW1zIHRvIGJlIG1pc3NpbmcgY29k
ZSB0byB3cml0ZSB0aGUgZGV2aWNlIHRyZWUNCj4gPj4gaW5mb3JtYXRpb24gYWJvdXQgd2hhdGV2
ZXIgdGhpcyBkZXZpY2UgaXM/DQo+ID4NCj4gPiBJcyBpdCBPSyB0byBqdXN0IGFkZCBhIG1lbW9y
eSByZWdpb24gd2hpY2ggY2Fubm90IGJlIHVzZWQgd2l0aG91dCBBQ1BJPw0KPiA+IFRoaXMgaXMg
dW5jbGVhciB0byBtZS4gSWYgeW91IHN1Z2dlc3QgdGhhdCBpdCBpcyBiZXR0ZXIgd2F5LCBJJ2xs
IHJldmlzZQ0KPiA+IHRoaXMgcGF0Y2ggdG8gYWRkIGEgZGV2aWNlIHRyZWUgbm9kZS4gUGxlYXNl
LCBoZWxwIG1lIHRvIHVuZGVyc3RhbmQuDQo+IA0KPiBUaGV5IGRvbid0IG5lY2Vzc2FyaWx5IGJv
dGggaGF2ZSB0byBiZSBhZGRlZCBpbiB0aGUgZXhhY3Qgc2FtZSBwYXRjaA0KPiBpZiBpdCdzIGxl
c3MgY29uZnVzaW5nIHRvIHNwbGl0IGl0LCBidXQgdGhlIHNlcmllcyBhcyBhIHdob2xlDQo+IHNo
b3VsZCBzdXBwb3J0IGJvdGggRFQgYW5kIEFDUEkgKGFuZCB5b3VyIGtlcm5lbCBwYXRjaGVzIGFs
c28NCj4gb3VnaHQgdG8gaGF2ZSBib3RoIERUIGFuZCBBQ1BJIGJpbmRpbmdzIEkgdGhpbmspLg0K
DQpBbHRob3VnaCBOVkRJTU0gaXMgZGVwZW5kZW50IG9uIEFDUEkgTkZJVCB0YWJsZSBjdXJyZW50
bHksIEknbGwga2VlcA0KdGhpcyBjb21tZW50IGluIG1pbmQgYW5kIHJldmlzZSBpdCBzdGVwIGJ5
IHN0ZXAuDQoNCj4gdGhhbmtzDQo+IC0tIFBNTQ0KDQpCZXN0IFJlZ2FyZHMsDQpLd2FuZ3dvbyBM
ZWUNCg==
