Received: by 10.25.159.131 with SMTP id i125csp572105lfe;
        Wed, 30 Nov 2016 16:42:33 -0800 (PST)
X-Received: by 10.55.169.87 with SMTP id s84mr31067029qke.216.1480552953655;
        Wed, 30 Nov 2016 16:42:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si31654024qts.263.2016.11.30.16.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 16:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCFSK-00024O-C7
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 19:42:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCFSD-00022G-HE
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 19:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCFS8-0002T1-Kz
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 19:42:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCFS8-0002SZ-C7
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 19:42:20 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB10dAKQ032324
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 19:42:19 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2727vyc2wa-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 19:42:19 -0500
Received: from localhost
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 1 Dec 2016 10:42:16 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 1 Dec 2016 10:42:14 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 05D2B2CE8046;
	Thu,  1 Dec 2016 11:42:14 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB10gD8153084238; Thu, 1 Dec 2016 11:42:13 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB10gDPI002798; Thu, 1 Dec 2016 11:42:13 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB10gD76002791; Thu, 1 Dec 2016 11:42:13 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C7736A0183;
	Thu,  1 Dec 2016 11:42:12 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org
Date: Thu, 01 Dec 2016 11:42:12 +1100
In-Reply-To: <3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.1 (3.22.1-2.fc25) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120100-0052-0000-0000-000001F6EADD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120100-0053-0000-0000-00000755B475
Message-Id: <1480552932.2452.30.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612010010
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-001b2d01.pphosted.com id
	uB10dAKQ032324
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [PATCH v2 1/6] arm: Uniquely name imx25 I2C buses.
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AtgKlWOicVq

T24gV2VkLCAyMDE2LTExLTMwIGF0IDA5OjE4ICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3
cm90ZToNCj4gT24gMTEvMzAvMjAxNiAwNjozNiBBTSwgQWxhc3RhaXIgRCdTaWx2YSB3cm90
ZToNCj4gPiBGcm9tOiBBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz4N
Cj4gPiANCj4gPiBUaGUgaW14MjUgY2hpcCBwcm92aWRlcyAzIGkyYyBidXNlcywgYnV0IHRo
ZXkgaGF2ZSBhbGwgYmVlbiBuYW1lZA0KPiA+ICJpMmMiLCB3aGljaCBtYWtlcyBpdCBkaWZm
aWN1bHQgdG8gcHJlZGljdCB3aGljaCBidXMgYSBkZXZpY2Ugd2lsbA0KPiA+IGJlIGNvbm5l
Y3RlZCB0byB3aGVuIHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZCBsaW5lLg0KPiA+IA0KPiA+
IFRoaXMgcGF0Y2ggYWRkcmVzc2VzIHRoZSBpc3N1ZSBieSBuYW1pbmcgdGhlIGJ1c2VzIHVu
aXF1ZWx5Og0KPiA+IMKgIGkyYy4wIGkyYy4xIGkyYy4yDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+DQo+ID4gLS0t
DQo+ID4gwqBody9hcm0vaW14MjVfcGRrLmMgfCA0ICstLS0NCj4gPiDCoGh3L2kyYy9pbXhf
aTJjLmPCoMKgwqB8IDYgKysrKystDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJt
L2lteDI1X3Bkay5jIGIvaHcvYXJtL2lteDI1X3Bkay5jDQo+ID4gaW5kZXggMDI1YjYwOC4u
YzZmMDRkMyAxMDA2NDQNCj4gPiAtLS0gYS9ody9hcm0vaW14MjVfcGRrLmMNCj4gPiArKysg
Yi9ody9hcm0vaW14MjVfcGRrLmMNCj4gPiBAQCAtMTM4LDkgKzEzOCw3IEBAIHN0YXRpYyB2
b2lkIGlteDI1X3Bka19pbml0KE1hY2hpbmVTdGF0ZQ0KPiA+ICptYWNoaW5lKQ0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgKiBXZSBhZGQgaXQgaGVyZSAob25seSBvbiBxdGVzdCB1c2Fn
ZSkgdG8gYmUgYWJsZSB0byBkbyBhDQo+ID4gYml0DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAqIG9mIHNpbXBsZSBxdGVzdC4gU2VlICJtYWtlIGNoZWNrIiBmb3IgZGV0YWlscy4NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCovDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqBpMmNfY3Jl
YXRlX3NsYXZlKChJMkNCdXMgKilxZGV2X2dldF9jaGlsZF9idXMoREVWSUNFKCZzLQ0KPiA+
ID5zb2MuaTJjWzBdKSwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgImkyYyIpLA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJkczEzMzgiLCAweDY4KTsNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoGkyY19jcmVhdGVfc2xhdmUocy0+c29jLmkyY1swXS5idXMsICJk
czEzMzgiLCAweDY4KTsNCj4gPiDCoMKgwqDCoMKgfQ0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4g
ZGlmZiAtLWdpdCBhL2h3L2kyYy9pbXhfaTJjLmMgYi9ody9pMmMvaW14X2kyYy5jDQo+ID4g
aW5kZXggMzdlNWE2Mi4uN2JlMTBmYiAxMDA2NDQNCj4gPiAtLS0gYS9ody9pMmMvaW14X2ky
Yy5jDQo+ID4gKysrIGIvaHcvaTJjL2lteF9pMmMuYw0KPiA+IEBAIC0zMDUsMTIgKzMwNSwx
NiBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uDQo+ID4gaW14X2kyY192bXN0
YXRlID0gew0KPiA+IMKgc3RhdGljIHZvaWQgaW14X2kyY19yZWFsaXplKERldmljZVN0YXRl
ICpkZXYsIEVycm9yICoqZXJycCkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgSU1YSTJDU3Rh
dGUgKnMgPSBJTVhfSTJDKGRldik7DQo+ID4gK8KgwqDCoMKgc3RhdGljIGludCBidXNfY291
bnQ7DQo+IA0KPiBobW0sIHRoZSBzdGF0aWMgaXMgdWdseSA6L8KgDQo+IA0KPiBJc24ndCB0
aGVyZSBvdGhlciB3YXlzIHRvIGFjaGlldmUgdGhpcyBuYW1pbmcgP8KgDQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiBDLsKgwqANCj4gDQoNCkknbSBub3Qgc2VlaW5nIGFuIG9idmlvdXMgd2F5
IGFyb3VuZCBpdC4gVGhlIGJ1c3NlcyBhcmUgcmVhbGl6ZWQNCmluZGVwZW5kZW50bHkgKHNv
IEkgY2FuJ3QgaW1wbGVtZW50IHdoYXQgd2UgZG8gd2l0aCB0aGUgYXNwZWVkIGkyYw0KYnVz
c2VzKSwgYW5kIGl0IGlzIG5hbWVkIGJlZm9yZSBmc2wtaW14MjU6ZnNsX2lteDI1X3JlYWxp
emUoKSBjYW4gYXBwbHkNCnNwZWNpZmljIHByb3BlcnRpZXMgdG8gdGhlIGJ1cy4NCg0KSWYg
eW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zLCBJJ20gYWxsIGVhcnMuDQoNCg0KLS3CoA0KQWxh
c3RhaXIgRCdTaWx2YQ0KT3BlbiBTb3VyY2UgRGV2ZWxvcGVyDQpMaW51eCBUZWNobm9sb2d5
IENlbnRyZSwgSUJNIEF1c3RyYWxpYQ0KbW9iOiAwNDIzIDc2MiA4MTkNCg0K
