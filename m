Received: by 10.25.159.131 with SMTP id i125csp1084301lfe;
        Thu, 1 Dec 2016 14:45:23 -0800 (PST)
X-Received: by 10.237.61.210 with SMTP id j18mr35783646qtf.137.1480632323011;
        Thu, 01 Dec 2016 14:45:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i203si1352237qke.67.2016.12.01.14.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 14:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCa6U-0006GW-ER
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 17:45:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCa6Q-0006GM-4C
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 17:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCa6N-0006un-2M
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 17:45:18 -0500
Received: from 001b2d01.pphosted.com ([148.163.156.1]:51524
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCa6M-0006u4-Pn
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 17:45:15 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB1MiEju036085
	for <qemu-arm@nongnu.org>; Thu, 1 Dec 2016 17:45:12 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
	by mx0a-001b2d01.pphosted.com with ESMTP id 272qjshux8-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Thu, 01 Dec 2016 17:45:12 -0500
Received: from localhost
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Fri, 2 Dec 2016 08:45:09 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2016 08:45:07 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 66B652BB0055;
	Fri,  2 Dec 2016 09:45:07 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB1Mj7HL52035740; Fri, 2 Dec 2016 09:45:07 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB1Mj6Zs007101; Fri, 2 Dec 2016 09:45:07 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB1Mj6dv007095; Fri, 2 Dec 2016 09:45:06 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4AA01A0138;
	Fri,  2 Dec 2016 09:45:06 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org
Date: Fri, 02 Dec 2016 09:45:06 +1100
In-Reply-To: <bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
	<20161130053629.23340-2-alastair@au1.ibm.com>
	<3d8a8cdf-5f33-4803-7048-203ed8195f9e@kaod.org>
	<1480552932.2452.30.camel@au1.ibm.com>
	<bc1eab8e-4cc2-1b4f-134f-650716a3796b@kaod.org>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.1 (3.22.1-2.fc25) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120122-0016-0000-0000-000001FB69B8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120122-0017-0000-0000-000005FA8C3A
Message-Id: <1480632306.16973.1.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-01_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612010365
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-001b2d01.pphosted.com id
	uB1MiEju036085
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
X-TUID: W4pM9/5P7WQ8

T24gVGh1LCAyMDE2LTEyLTAxIGF0IDEzOjMxICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3
cm90ZToNCg0KPiBPbiAxMi8wMS8yMDE2IDAxOjQyIEFNLCBBbGFzdGFpciBEJ1NpbHZhIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAxNi0xMS0zMCBhdCAwOToxOCArMDEwMCwgQ8OpZHJpYyBM
ZSBHb2F0ZXIgd3JvdGU6DQo+ID4gPiBPbiAxMS8zMC8yMDE2IDA2OjM2IEFNLCBBbGFzdGFp
ciBEJ1NpbHZhIHdyb3RlOg0KPHNuaXA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9ody9pMmMv
aW14X2kyYy5jIGIvaHcvaTJjL2lteF9pMmMuYw0KPiA+ID4gPiBpbmRleCAzN2U1YTYyLi43
YmUxMGZiIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9ody9pMmMvaW14X2kyYy5jDQo+ID4gPiA+
ICsrKyBiL2h3L2kyYy9pbXhfaTJjLmMNCj4gPiA+ID4gQEAgLTMwNSwxMiArMzA1LDE2IEBA
IHN0YXRpYyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24NCj4gPiA+ID4gaW14X2kyY192bXN0
YXRlID0gew0KPiA+ID4gPiDCoHN0YXRpYyB2b2lkIGlteF9pMmNfcmVhbGl6ZShEZXZpY2VT
dGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+ID4gPiA+IMKgew0KPiA+ID4gPiDCoMKgwqDC
oMKgSU1YSTJDU3RhdGUgKnMgPSBJTVhfSTJDKGRldik7DQo+ID4gPiA+ICvCoMKgwqDCoHN0
YXRpYyBpbnQgYnVzX2NvdW50Ow0KPiA+ID4gDQo+ID4gPiBobW0sIHRoZSBzdGF0aWMgaXMg
dWdseSA6L8KgDQo+ID4gPiANCj4gPiA+IElzbid0IHRoZXJlIG90aGVyIHdheXMgdG8gYWNo
aWV2ZSB0aGlzIG5hbWluZyA/wqANCj4gPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gDQo+
ID4gPiBDLsKgwqANCj4gPiA+IA0KPiA+IA0KPiA+IEknbSBub3Qgc2VlaW5nIGFuIG9idmlv
dXMgd2F5IGFyb3VuZCBpdC4gVGhlIGJ1c3NlcyBhcmUgcmVhbGl6ZWQNCj4gPiBpbmRlcGVu
ZGVudGx5IChzbyBJIGNhbid0IGltcGxlbWVudCB3aGF0IHdlIGRvIHdpdGggdGhlIGFzcGVl
ZCBpMmMNCj4gPiBidXNzZXMpLCBhbmQgaXQgaXMgbmFtZWQgYmVmb3JlIGZzbC1pbXgyNTpm
c2xfaW14MjVfcmVhbGl6ZSgpIGNhbg0KPiA+IGFwcGx5DQo+ID4gc3BlY2lmaWMgcHJvcGVy
dGllcyB0byB0aGUgYnVzLg0KPiA+IA0KPiA+IElmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9u
cywgSSdtIGFsbCBlYXJzLg0KPiANCj4gV2hhdCBhYm91dCB0aGF0ID/CoA0KPiANCj4gCUBA
IC0zMTAsNyArMzEwLDcgQEAgc3RhdGljIHZvaWQgaW14X2kyY19yZWFsaXplKERldmljZVN0
YXRlDQo+IAnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBJTVhfSTJDX01FTV9TSVpFKTsNCj4gCcKgwqDCoMKgwqBzeXNidXNfaW5pdF9t
bWlvKFNZU19CVVNfREVWSUNFKGRldiksICZzLT5pb21lbSk7DQo+IAnCoMKgwqDCoMKgc3lz
YnVzX2luaXRfaXJxKFNZU19CVVNfREVWSUNFKGRldiksICZzLT5pcnEpOw0KPiAJLcKgwqDC
oMKgcy0+YnVzID0gaTJjX2luaXRfYnVzKERFVklDRShkZXYpLCAiaTJjIik7DQo+IAkrwqDC
oMKgwqBzLT5idXMgPSBpMmNfaW5pdF9idXMoREVWSUNFKGRldiksIE5VTEwpOw0KPiAJIH0N
Cj4gwqANCj4gwqBzdGF0aWMgdm9pZCBpbXhfaTJjX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3Mg
KmtsYXNzLCB2b2lkICpkYXRhKQ0KPiANCj4gV2hpY2ggc2hvdWxkIG5hbWUgYXV0b21hdGlj
YWxseSB0aGUgSTJDIG9iamVjdHMgOg0KPiANCj4gCShxZW11KSBpbmZvIHFvbS10cmVlwqAN
Cj4gCS9tYWNoaW5lIChpbXgyNS1wZGstbWFjaGluZSkNCj4gCcKgwqAvcGVyaXBoZXJhbCAo
Y29udGFpbmVyKQ0KPiAJwqDCoC9zb2MgKGZzbCxpbXgyNSkNCj4gCcKgwqAvcGVyaXBoZXJh
bC1hbm9uIChjb250YWluZXIpDQo+IAnCoMKgL3VuYXR0YWNoZWQgKGNvbnRhaW5lcikNCj4g
CcKgwqDCoMKgL2RldmljZVswXSAoYXJtOTI2LWFybS1jcHUpDQo+IAnCoMKgwqDCoMKgwqAv
dW5uYW1lZC1ncGlvLWluWzFdIChpcnEpDQo+IAnCoMKgwqDCoMKgwqAvdW5uYW1lZC1ncGlv
LWluWzNdIChpcnEpDQo+IAnCoMKgwqDCoMKgwqAvdW5uYW1lZC1ncGlvLWluWzJdIChpcnEp
DQo+IAnCoMKgwqDCoMKgwqAvdW5uYW1lZC1ncGlvLWluWzBdIChpcnEpDQo+IA0KPiAJwqDC
oMKgwqAvZGV2aWNlWzE1XSAoaW14LmkyYykNCj4gCcKgwqDCoMKgwqDCoC9pbXguaTJjWzBd
IChxZW11Om1lbW9yeS1yZWdpb24pDQo+IAnCoMKgwqDCoMKgwqAvaTJjLWJ1cy4wIChpMmMt
YnVzKQ0KPiAJwqDCoMKgwqAvZGV2aWNlWzE3XSAoaW14LmkyYykNCj4gCcKgwqDCoMKgwqDC
oC9pbXguaTJjWzBdIChxZW11Om1lbW9yeS1yZWdpb24pDQo+IAnCoMKgwqDCoMKgwqAvaTJj
LWJ1cy4yIChpMmMtYnVzKQ0KPiAJwqDCoMKgwqAvZGV2aWNlWzE2XSAoaW14LmkyYykNCj4g
CcKgwqDCoMKgwqDCoC9pbXguaTJjWzBdIChxZW11Om1lbW9yeS1yZWdpb24pDQo+IAnCoMKg
wqDCoMKgwqAvaTJjLWJ1cy4xIChpMmMtYnVzKQ0KPiAJwqDCoMKgLi4uLg0KPiANCj4gDQo+
IENoZWVycywNCj4gDQo+IEMuwqANCg0KT2gsIGdyZWF0LCB0aGF0IGxvb2tzIGxpa2UgYSBt
dWNoIGJldHRlciBzb2x1dGlvbiwgdGhhbmtzIDopDQoNCi0twqANCkFsYXN0YWlyIEQnU2ls
dmHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbW9iOiAwNDIzIDc2MiA4MTkNCnNreXBlOg0KYWxh
c3RhaXJfZHNpbHZhwqDCoMKgwqANClR3aXR0ZXI6IEBFdmlsRGVlY2UNCmJsb2c6IGh0dHA6
Ly9hbGFzdGFpci5kLXNpbHZhLm9yZw0KDQo=
