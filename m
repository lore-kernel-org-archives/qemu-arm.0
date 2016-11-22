Received: by 10.25.150.194 with SMTP id y185csp2267441lfd;
        Tue, 22 Nov 2016 14:34:38 -0800 (PST)
X-Received: by 10.55.185.133 with SMTP id j127mr23840434qkf.39.1479854078432;
        Tue, 22 Nov 2016 14:34:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4si17664131qkc.59.2016.11.22.14.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Nov 2016 14:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9Je9-0004IU-2Y
	for alex.bennee@linaro.org; Tue, 22 Nov 2016 17:34:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9JbJ-00028E-Nk
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 17:31:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c9JbE-0005zQ-NF
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 17:31:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1c9JbE-0005yj-DU
	for qemu-devel@nongnu.org; Tue, 22 Nov 2016 17:31:36 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAMMT7eV023803
	for <qemu-devel@nongnu.org>; Tue, 22 Nov 2016 17:31:34 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
	by mx0a-001b2d01.pphosted.com with ESMTP id 26vuqfqjry-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 22 Nov 2016 17:31:34 -0500
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 23 Nov 2016 08:31:32 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 23 Nov 2016 08:31:29 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 092552CE8056;
	Wed, 23 Nov 2016 09:31:29 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAMMVTN954984884; Wed, 23 Nov 2016 09:31:29 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAMMVSTs009605; Wed, 23 Nov 2016 09:31:28 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAMMVSch009602; Wed, 23 Nov 2016 09:31:28 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DF0D3A0283;
	Wed, 23 Nov 2016 09:31:27 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
	<clg@kaod.org>, qemu-arm@nongnu.org
Date: Wed, 23 Nov 2016 09:31:27 +1100
In-Reply-To: <3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
References: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
	<1479357400-17441-3-git-send-email-alastair@au1.ibm.com>
	<debe3f9c-d3ec-aad0-0424-7228bf60765b@kaod.org>
	<3888651b-fd60-e827-a9f8-575a8f01be72@redhat.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112222-0044-0000-0000-00000204868C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112222-0045-0000-0000-00000606F663
Message-Id: <1479853887.11116.95.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-22_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611220380
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-001b2d01.pphosted.com id
	uAMMT7eV023803
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [PATCH 2/4] qtest: Support named interrupts
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yQQLKLh9BVeX

T24gVHVlLCAyMDE2LTExLTIyIGF0IDE4OjI0ICswMTAwLCBQYW9sbyBCb256aW5pIHdyb3Rl
Og0KDQo+IA0KPiBPbiAyMi8xMS8yMDE2IDE4OjIyLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToNCj4gPiANCj4gPiA+IA0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqBnX2Fz
c2VydCh3b3Jkc1sxXSk7IC8qIGRldmljZSAqLw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqBn
X2Fzc2VydCh3b3Jkc1syXSk7IC8qIGdwaW8gbGlzdCAqLw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqBnX2Fzc2VydCh3b3Jkc1szXSk7IC8qIGdwaW8gbGluZSBpbiBsaXN0ICovDQo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoGdfYXNzZXJ0KHdvcmRzWzRdKTsgLyogbGV2ZWwgKi8NCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgZGV2ID0gREVWSUNFKG9iamVjdF9yZXNvbHZlX3BhdGgo
d29yZHNbMV0sIE5VTEwpKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgaWYgKCFkZXYpIHsN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxdGVzdF9zZW5kX3ByZWZpeChjaHIp
Ow0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF0ZXN0X3NlbmQoY2hyLCAiRkFJ
TCBVbmtub3duIGRldmljZVxuIik7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiArDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoGlycV9udW0gPSBhdG9pKHdvcmRzWzNdKTsNCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgbGV2ZWwgPSBhdG9pKHdvcmRzWzRdKTsNCj4gPiA+ICsNCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgUUxJU1RfRk9SRUFDSChuZ2wsICZkZXYtPmdwaW9zLCBub2RlKSB7DQo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHN0cmNtcCh3b3Jkc1syXSwgbmds
LT5uYW1lKSA9PSAwICYmIG5nbC0+bnVtX2luDQo+ID4gPiA+IGlycV9udW0pIHsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlycSA9IG5nbC0+aW5baXJxX251
bV07DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqB9DQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoGlmIChpcnEgPT0g
TlVMTCkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF0ZXN0X3NlbmRfcHJl
Zml4KGNocik7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXRlc3Rfc2VuZChj
aHIsICJGQUlMIFVua25vd24gSVJRXG4iKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm47DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ICsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgcWVtdV9zZXRfaXJxKGlycSwgbGV2ZWwpOw0KPiANCj4gVGhp
cyBzZWVtcyB3cm9uZy7CoMKgVGhlIElSUSBzaG91bGQgbm90IGJlIG1vZGlmaWFibGUgYnkg
dGhlIHRlc3QuDQo+IA0KPiBQYW9sbw0KPsKgDQoNClRoYW5rcyBQYW9sbywgY291bGQgeW91
IHBsZWFzZSBhZHZpc2UgYXMgdG8gd2h5IHRoYXQgaXM/DQoNClRoZSBzaXR1YXRpb24gSSBh
bSBhZGRyZXNzaW5nIGlzIHRoYXQgSSBkZXZpY2UgdW5kZXIgdGVzdCB0aGF0IGNoYW5nZXMN
CmJlaGF2aW91ciB3aGVuIGEgR1BJTyBsaW5lIGlzIHJhaXNlZC4gSXMgdGhlcmUgYW5vdGhl
ciB3YXkgSSBzaG91bGQgYmUNCnJhaXNpbmcgdGhhdCBsaW5lIGZyb20gd2l0aGluIHF0ZXN0
Pw0KDQotLSANCkFsYXN0YWlyIEQnU2lsdmENCk9wZW4gU291cmNlIERldmVsb3Blcg0KTGlu
dXggVGVjaG5vbG9neSBDZW50cmUsIElCTSBBdXN0cmFsaWENCm1vYjogMDQyMyA3NjIgODE5
DQoNCg==
