Received: by 10.25.208.137 with SMTP id h131csp133543lfg;
        Thu, 28 Apr 2016 01:39:40 -0700 (PDT)
X-Received: by 10.55.135.4 with SMTP id j4mr12874022qkd.163.1461832780466;
        Thu, 28 Apr 2016 01:39:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f143si4374282qka.5.2016.04.28.01.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Apr 2016 01:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1avhU4-00054N-0c
	for alex.bennee@linaro.org; Thu, 28 Apr 2016 04:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.sande@samsung.com>) id 1avf2w-0006n6-0h
	for qemu-devel@nongnu.org; Thu, 28 Apr 2016 02:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <r.sande@samsung.com>) id 1avf2r-0001iN-6T
	for qemu-devel@nongnu.org; Thu, 28 Apr 2016 02:03:29 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:44054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.sande@samsung.com>) id 1avf2q-0001i6-Ma
	for qemu-devel@nongnu.org; Thu, 28 Apr 2016 02:03:25 -0400
Received: from epcpsbgr4.samsung.com
	(u144.gpu120.samsung.co.kr [203.254.230.144])
	by mailout3.samsung.com (Oracle Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with ESMTP id <0O6B025ULY5LQAD0@mailout3.samsung.com> for
	qemu-devel@nongnu.org; Thu, 28 Apr 2016 15:03:21 +0900 (KST)
Received: from epcpsbgx3.samsung.com ( [172.20.52.114])
	by epcpsbgr4.samsung.com (EPCPMTA) with SMTP id 23.10.04903.9A7A1275;
	Thu, 28 Apr 2016 15:03:21 +0900 (KST)
X-AuditID: cbfee690-f79056d000001327-9b-5721a7a9e6b3
Received: from epmailer02 ( [203.254.219.142])
	by epcpsbgx3.samsung.com (EPCPMTA) with SMTP id F2.64.05252.9A7A1275;
	Thu, 28 Apr 2016 15:03:21 +0900 (KST)
Date: Thu, 28 Apr 2016 06:03:21 +0000 (GMT)
From: RAVINDRA KUMAR SANDE <r.sande@samsung.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	RAVINDRA KUMAR SANDE <r.sande@samsung.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
MIME-version: 1.0
X-MTR: 20160428043852024@r.sande
Msgkey: 20160428043852024@r.sande
X-EPLocale: en_US.windows-1252
X-Priority: 3
X-EPWebmail-Msg-Type: personal
X-EPWebmail-Reply-Demand: 0
X-EPApproval-Locale: 
X-EPHeader: ML
X-MLAttribute: 
X-RootMTR: 20160428043852024@r.sande
X-ParentMTR: 
X-ArchiveUser: 
X-CPGSPASS: Y
X-ConfirmMail: N,general
Content-transfer-encoding: base64
Content-type: text/plain; charset=windows-1252
MIME-version: 1.0
Message-ID: <708585848.188261461823397987.JavaMail.weblogic@ep2mlwas06d>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWyRsSkSHflcsVwg8/fuC2O9+5gcWD0eHJt
	M1MAY5SITUpqTmZZapG+HYKVIJIxfddhxoJ5ohVTG2waGK+IdDFycAgJKEl8Oe/SxcjJISFg
	InH2SDs7hC0mceHeerYuRi6gkqWMEquW72UHqQcp2n3bHyI+h1HifMtPJpAGFgFViUfNL9hA
	bDYBQ4kj16eA2cICIRJ9Bz4ygzSICJxllPi/8wSYwyzQySQx68oTZpAqIQFZia6bdxhBbF4B
	QYmTM5+wQJyhIHHg8zKouKJEw7GZzBBxOYklUy8zQdi8EjPan7LAxKd9XQNVIy1xftYGRph3
	Fn9/DBXnlzh2ewdUr4DE1DMHoWqAPvh0GKqGT2LNwrcsMPW7Ti1nhtnVsPE3NIgkJLa2PGEF
	sZmBbpvS/ZAdwjaQOLJoDiuqXziAbA+JMzN8QX6XELjAIXFq6jemCYxKs5CUzUIyahaSUchq
	FjCyrGIUTS1ILihOSi8y0StOzC0uzUvXS87P3cQITBen/z2bsIPx3gHrQ4zqHIxSoqV5xcmJ
	eXmJSTmp8bmJOWn5RbmpKUo8vBMSFMOFWBPLiitzDzGaAuNvIrOUaHI+MIXllcQbGpsZWZia
	mBobmVuaKYnzvpb6GSwkkJ5YkpqdmlqQWhRfVJqTWnyIkYmDU6qBMTSIzWqez/cM3ta5QqyT
	rssqfrPcwsLWx8pZcm/joS6X6NnS+1NEz9x5MG3Pt+Kc3fpVCUWp2rr3Z29asWuCpUhEcwT7
	3Kq3++Znn1sWtv3gxeX/n05Qyq4tKfQVfZ/1pNmUt1LTtWbii9rGJcZLEj8++hsaOTPm15Ha
	Cd+Fz0z3rLKMPuCUqcRSnJFoqMVcVJwIAC6WT6gpAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsVy+t/tPt2VyxXDDeZuZLc43ruDxYHR48m1
	zUwBjFEFNimpOZllqUX6djYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmp
	tkouPgG6bpk5QPOVFMoSc0qBQgGJxcVKQBOK8ktLUhUy8otLbJWiDc2N9IwM9EyN9AyNY60M
	DQyMTIFqEgoypu86zFgwT7RiaoNNA+MVkS5GDg4hASWJL+ddQEwJAROJ3bf9uxg5gUwxiQv3
	1rN1MXIBVcxhlDjf8pMJJMEioCrxqPkFG4jNJmAoceT6FDBbWCBEou/AR2aQBhGBs4wS/3ee
	AHOYBTqZJGZdecIMUiUkICvRdfMOI4jNKyAocXLmExaIdQoSBz4vg4orSjQcm8kMEZeTWDL1
	MhOEzSsxo/0pC0x82tc1UDXSEudnbWCEOXvx98dQcX6JY7d3QPUKSEw9cxCqBuiDT4ehavgk
	1ix8ywJTv+vUcmaYXQ0bf7ND2BISW1uesILYzEC3Tel+yA5hG0gcWTSHFdUvHEC2h8SZGb4T
	GGVnIcnMQtI9C0k3spoFjCyrGEVTC5ILipPSK4z1ihNzi0vz0vWS83M3MYJT07PFOxj/n7c+
	xKjOwSglWppXnJyYl5eYlJMan5uYk5ZflJuaosTDOyFBMVyINbGsuDL3EKMK0KpHG1ZfYJRi
	ycvPS1US4fVaApTmTUmsrEotyo8vKs1JLT7EaAqM2YnMUqLJ+cDkm1cSb2hsbGJmYmppYmFg
	aq4kzhvwd12YkEB6YklqdmpqQWoRTB8TB6dUA2Pn3Om9rccbfs1nLn3OP7HY1zz1sMXMgz/O
	nf7hEbjbU/3fvJU8l9esaddKnBOjvMlVcUH55+QlGV1LrrFMlXFs+7R76lfTx0dkze7Um/vI
	GNz70yatpiVnvO4h9xtWwba+DIvOnTeYtn7Te6dX/PPQr9MnGtxP3Fpe/GLXjqVcGqr/Y1/t
	aapWYinOSDTUYi4qTgQA4VrS4IYDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 203.254.224.33
X-Mailman-Approved-At: Thu, 28 Apr 2016 04:38:53 -0400
Subject: Re: [Qemu-devel] [Query] Does Linux & Qemu support KVM for ARM32
 guest on ARM64 host
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
Reply-To: r.sande@samsung.com
Cc: Marc Zyngier <marc.zyngier@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RmeldLSWYZ7K
Message-ID: <20160428060321.Nnpr848BbCYahq6Z1wCHyHkwzdrpXmFp7crBs0BviVs@z>

DQo+IE9uIDIwMTYvNC8yOCA5OjUwLCBSQVZJTkRSQSBLVU1BUiBTQU5ERSB3cm90ZToNCj4gPiAN
Cj4gPiBXaGF0IEkgZGlkICA6DQo+ID4gMSkgSnVzdCBmb3IgaW52ZXN0aWdhdGlvbiwgSSB0b29r
IGEgQVJNdjggKCBPZHJvaWRDMiApIGJvYXJkDQo+ID4gMikgIEkgY29tcGlsZWQgTGludXggMy4x
NCB3aXRoIEtWTSBzdXBwb3J0IGZvciB0aGlzIEFSTXY4ICggT2Ryb2lkQzIgKQ0KPiA+IGJvYXJk
LCB3aXRoIG1vZGlmaWNhdGlvbiByZXBsYWNpbmcgbWVzb25fdGltZXIgYnkgYXJtIHRpbWVyIGlu
IGl0cyBkdHMNCj4gPiBmaWxlLg0KPiA+IFdoeSBMaW51eCAzLjE0IDogSSB0b29rIExpbnV4IDMu
MTQgYmVjYXVzZSBkaXNwbGF5IGRyaXZlcnMgZm9yIHRoaXMNCj4gPiBib2FyZCBhcmUgb2ZmaWNp
YWxseSBmb3IgdGhpcyB2ZXJzaW9uOyBhbmQgSSBhbSBpbnRlcmVzdGVkIGluIHNlZWluZw0KPiA+
IHNvbWUgTGludXggZ3Vlc3QgYm9vdGluZyB3aXRoIGRpc3BsYXkgb24uDQo+ID4gMykgIEkgc2Vl
IGZyb20gYm9vdCBsb2cgb2YgIHRoYXQgS1ZNIGlzIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseSwg
YW5kIEkNCj4gPiBjYW4gc2VlIC9kZXYva3ZtIG5vZGUuDQo+ID4gNCkgSSBidWlsdCBsYXRlc3Qg
UWVtdSB3aXRoIC0tZW5hYmxlLWt2bSBvbiB0aGlzIGJvYXJkIG5hdGl2ZWx5Lg0KPiA+IA0KPiA+
IFdoYXQgSSBmaW5kIDoNCj4gPiAxKSBydW5uaW5nICJxZW11LXN5c3RlbS1hcm0gIC1lbmFibGUt
a3ZtICAgLW1hY2hpbmUgdmV4cHJlc3MtYTkgLi4uLiINCj4gPiBnaXZlcyBlcnJvciA6ICBubyBh
Y2NlbGVyYXRvciBmb3VuZA0KPiA+IDIpIHJ1bm5pbmcgInFlbXUtc3lzdGVtLWFhcmNoNjQgLWVu
YWJsZS1rdm0gIC1tYWNoaW5lIHZleHByZXNzLWE5IC4uLi4iDQo+ID4gZ2l2ZXMgZXJyb3IgOiBr
bXZfaW5pdF92Y3B1IChJT0N0bCBvbiAvZGV2L2t2bSkgZmFpbGVkLCBndWVzdCBub3Qgc3VwcG9y
dGVkDQo+ID4gKCBJIGV4cGVyaW1lbnRlZCBzb21lIG1vZGlmaWNhdGlvbnMgYXMgd2VsbCB0byBv
dmVyY29tZSBhYm92ZSBlcnJvciwNCj4gPiBzdWNoIGFzIHJlcGxhY2luZyB2YWx1ZSBhc3NpZ25l
ZCB0byBjcHUtPmt2bV90YXJnZXQgZXRjLCBidXQgSU9DdGwgY2FsbA0KPiA+IGlzIGZhaWxpbmcp
DQo+ID4gDQo+ID4gUXVlcnk6DQo+PiAgMSkgRG9lcyBBcm02NCBMaW51eCBub3QgZW5hYmxlIEtW
TSBzdXBwb3J0IGZvciBBcm0zMiBndWVzdCA/DQo+ID4gMikgQ2FuIHFlbXUtc3lzdGVtLWFybSBu
b3QgdXNlIHRoZSBLVk0gZmVhdHVyZSBvbiBBcm02NCBob3N0ID8NCj4gPiAzKSBDYW4gcWVtdS1z
eXN0ZW0tYWFyY2g2NCBub3QgdXNlIEtWTSBmZWF0dXJlIGZvciBBcm0zMiBndWVzdCA/DQo+ID4g
DQo+IC0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tDQo+IFNlbmRlciA6IFNoYW5ub24g
Wmhhbzx6aGFvc2hlbmdsb25nQGh1YXdlaS5jb20+DQo+IA0KPiBZb3UgY2FuIHVzZSBiZWxvdyBj
b21tYW5kIHRvIGJvb3QgYSBBUk0zMiBndWVzdCBvbiBBUk02ND8NCj4gDQo+IHFlbXUtc3lzdGVt
LWFhcmNoNjQgLWVuYWJsZS1rdm0gLW1hY2hpbmUgdmlydCxrZXJuZWxfaXJxY2hpcD1vbiAtY3B1
DQo+IGhvc3QsYWFyY2g2ND1vZmYgLi4uLg0KPiANCj4gLS0gDQo+IFNoYW5ub24NCg0KDQpJIHdp
bGwgdHJ5IGFib3ZlIG9uIEFybTY0LiANCg0KSSBoYXZlIGFub3RoZXIgcXVlcnksIGZvciBBcm0z
MiBob3N0IHdpdGggS1ZNIGVuYWJsZWQuDQpJIHNlZSB0aGF0ICJxZW11LXN5c3RlbS1hcm0gIC1l
bmFibGUta3ZtICAgLW1hY2hpbmUgdmV4cHJlc3MtYTkgIC4uLiIgZ2l2ZXMgZXJyb3INCmttdl9p
bml0X3ZjcHUgKElPQ3RsIG9uIC9kZXYva3ZtKSBmYWlsZWQsIGd1ZXN0IG5vdCBzdXBwb3J0ZWQu
DQoNCklzIHRoZXJlIGFueSB3YXkgdG8gZW11bGF0ZSB2ZXhwcmVzcy1hOSAgd2l0aCAgLWVuYWJs
ZS1rdm0gICBvbiBxZW11ID8NCg0KUmVnYXJkcywNClJhdmluZHJhIFNhbmRl


