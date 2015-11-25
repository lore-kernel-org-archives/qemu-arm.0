Received: by 10.182.158.201 with SMTP id ww9csp2389555obb;
        Tue, 24 Nov 2015 16:00:13 -0800 (PST)
X-Received: by 10.31.21.213 with SMTP id 204mr29510367vkv.29.1448409613771;
        Tue, 24 Nov 2015 16:00:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m78si20864441vke.187.2015.11.24.16.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 16:00:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:42105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1NVN-0005NO-AS
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 19:00:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1NVK-0005Fn-E2
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:00:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1a1NVJ-00011e-8x
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 19:00:10 -0500
Received: from mail-bn1on0145.outbound.protection.outlook.com
	([157.56.110.145]:21245
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1a1NVE-0000uZ-DL; Tue, 24 Nov 2015 19:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FzmFH8nJ00jLNnW4X21WxIwvDh+yV4qKIOhwOA0wCqo=;
	b=QahlTs86n4MNKqlsWACup3nKPHtelZW9Pk4LOQgWcdrAxlfKQDguFFJqOZzzOCwT8wSVtpCnMgejQOXV5NIwSWdpqbC73ELXluixmwYIpOxUc/RaF5a7log0R2YRq+Zib9jSsqy6M48P4Za965PWEaDPQxnDzA7v7FAOxUHqgtw=
Received: from BY2PR0301MB2040.namprd03.prod.outlook.com (10.163.196.154) by
	BY2PR0301MB2039.namprd03.prod.outlook.com (10.163.196.153) with
	Microsoft
	SMTP Server (TLS) id 15.1.331.20; Wed, 25 Nov 2015 00:00:01 +0000
Received: from BY2PR0301MB2040.namprd03.prod.outlook.com ([10.163.196.154]) by
	BY2PR0301MB2040.namprd03.prod.outlook.com ([10.163.196.154]) with
	mapi id 15.01.0331.023; Wed, 25 Nov 2015 00:00:01 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
Thread-Index: AdEem9sZHjs9/bX/Q4+JMP7QmdOAYQDOg3SAABS0aqAAA+N6AAEDWg8Q
Date: Wed, 25 Nov 2015 00:00:01 +0000
Message-ID: <BY2PR0301MB20409F279E0D56AA4DCDCC1F9E050@BY2PR0301MB2040.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
In-Reply-To: <CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7::724]
x-microsoft-exchange-diagnostics: 1; BY2PR0301MB2039;
	5:GthLaqqzse9x/nmwVebqwhfiLcUqi4oMN7ZngX3tesFNrWb+UG8kU1idfQzOffhWQJT4HLG4TJnZbhKmRAGk8hI4YigUbtvWZri5pzxDtusRlKStx9v4s8UtxQDaVTfJaY8OuRcHUct1axfMhYxgTg==;
	24:Sjav07Yf0mkmPNWhjLLImJqxEBLtlH+RnOqhHI0k1vv0yY57ksCIG+4YsjgeVphYilnsK5Vri6sih3iByprmSZDh1odXECMLHdjCNDNllyo=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB2039;
x-microsoft-antispam-prvs: <BY2PR0301MB20394E7AD5DF830E0C61BFF49E050@BY2PR0301MB2039.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425024)(601004)(2401047)(5005006)(8121501046)(520078)(3002001)(10201501046)(61426024)(61427024);
	SRVR:BY2PR0301MB2039; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB2039; 
x-forefront-prvs: 0771670921
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(199003)(164054003)(189002)(19580395003)(2950100001)(189998001)(5002640100001)(586003)(5003600100002)(77096005)(86362001)(2900100001)(110136002)(5001960100002)(101416001)(76576001)(122556002)(86612001)(93886004)(15975445007)(230783001)(87936001)(5008740100001)(11100500001)(10090500001)(1411001)(10400500002)(8990500004)(76176999)(92566002)(74316001)(5005710100001)(54356999)(106356001)(99286002)(10290500002)(50986999)(5007970100001)(105586002)(33656002)(5004730100002)(40100003)(97736004)(6116002)(81156007)(5001920100001)(102836003)(7059030)(3826002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB2039;
	H:BY2PR0301MB2040.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2015 00:00:01.3645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB2039
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.145
Cc: =?utf-8?B?R3LDqWdvcnkgRVNUUkFERQ==?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?utf-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>, Sai Pavan
	Boddu <saipava@xilinx.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] RFC: raspberry pi / pi2 /
	Windows-on-ARM support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uQg4Q8EfyxqD

SGkgUGV0ZXIgKGV0IGFsKSwNCg0KSSBhbSB3b3JraW5nIG9uIHJlZmFjdG9yaW5nIHRoZSBQaSBz
dXBwb3J0IGNvZGUgYXMgeW91IHN1Z2dlc3RlZC4gSSBoYXZlIHNwbGl0IHRoZSBQaSBTT0NzIGlu
dG8gc2VwYXJhdGUgb2JqZWN0cyAoYmNtMjgzNSBhbmQgYmNtMjgzNikgd2hpY2ggYm90aCBpbnN0
YW50aWF0ZSBhIHRoaXJkIGNvbW1vbiBiY20yODM1X3BlcmlwaGVyYWxzIGRldmljZSB0aGF0IGlu
IHR1cm4gY29udGFpbnMgYWxsIHRoZSBjb21tb24gZGV2aWNlcy4gSSBoYXZlIGFsc28gc3dpdGNo
ZWQgdGhlIGNvZGUgdG8gdXNlIG9iamVjdCBwcm9wZXJ0aWVzIHJhdGhlciB0aGFuIGdsb2JhbCB2
YXJpYWJsZXMgdG8gY29tbXVuaWNhdGUgc3RhdGUgd2hlcmUgZGV2aWNlcyBpbnRlcmFjdCB3aXRo
IGVhY2ggb3RoZXIuDQoNCkJlZm9yZSBJIGdvIGZ1cnRoZXIsIEkgd2FudGVkIHRvIGFzayBhIGNv
dXBsZSBvZiBoaWdoLWxldmVsIHF1ZXN0aW9ucyBhYm91dCB0aGUgZGVzaXJlZCBjb2RlIHN0eWxl
IGZvciBuZXcgZGV2aWNlcy4NCg0KMS4gTXVzdCBldmVyeSBuZXcgZGV2aWNlIGhhdmUgYSBoZWFk
ZXIgZmlsZSB0aGF0IGRlY2xhcmVzIGl0cyBwcml2YXRlIHN0YXRlIHN0cnVjdCwgb3IgaXMgaXQg
b2sgdG8ga2VlcCB0aG9zZSBpbiB0aGUgQyBmaWxlIGZvciBsZWFmIGRldmljZXMgYW5kIHJlZmVy
IHRvIHRoZW0gdGhyb3VnaCBvcGFxdWUgcG9pbnRlcnM/DQoyLiBXaGF0J3MgdGhlIHN0YXR1cyBv
ZiB0aGUgc3lzYnVzIEFQST8gSXQgaXMgb2J2aW91c2x5IGEgZmFpcmx5IHRoaW4gbGF5ZXIgb3Zl
ciBxZGV2L3FvbSwgYnV0IGl0J3Mgbm90IGNsZWFyIHdoZXRoZXIgdGhlIEFQSXMgYXJlIGRlcHJl
Y2F0ZWQuIENhbiBuZXcgY29kZSBpbnN0YW50aWF0ZSBjaGlsZHJlbiBvZiBUWVBFX1NZU19CVVNf
REVWSUNFIGFuZCB1c2UgdGhlIGlycS9tbWlvIGV4cG9ydCBmZWF0dXJlcyBpdCBwcm92aWRlcywg
b3Igc2hvdWxkIHdlIGJlIHN0aWNraW5nIG9ubHkgdG8gbG93ZXItbGV2ZWwgKHFkZXY/KSBBUElz
PyBJZiBzbywgd2hhdCdzIHRoZSByaWdodCB3YXkgdG8gZXhwb3J0IGludGVycnVwdHMgYW5kIG1t
aW8gc3BhY2UgZnJvbSBhIGRldmljZT8NCjMuIFNpbWlsYXJseSwgaXMgdXNpbmcgU3lzQnVzRGV2
aWNlQ2xhc3MuaW5pdCBvaywgb3Igc2hvdWxkIHdlIGJlIHVzaW5nIERldmljZUNsYXNzLnJlYWxp
emU/IEluIGdlbmVyYWwsIHdoYXQncyB0aGUgZ3VpZGFuY2Ugb24gd2hhdCBiZWxvbmdzIGluIG9i
amVjdCBpbml0IHZzLiB0aGUgcmVhbGl6ZSBtZXRob2Q/DQo0LiBJIGhhdmUgc29tZSBwcm9wZXJ0
eSB2YWx1ZXMgKGUuZy4gdmlkZW8gcmFtIHNpemUpIHRoYXQgYXJlIHNldCBpbiB0aGUgdG9wLWxl
dmVsIG1hY2hpbmUgZGVmaW5pdGlvbiBjb2RlIChyYXNwaS5jKSwgYW5kIG5lZWQgdG8gcGFzcyBk
b3duIHRocm91Z2ggc2V2ZXJhbCBsYXllcnMgb2YgYWJzdHJhY3Rpb24gKGUuZy4gcmFzcGkuYyBk
ZWNsYXJlcyB0aGUgbWFjaGluZSBjbGFzcyB3aGljaCBpbnN0YW50aWF0ZXMgYSBiY20yODM2IG9i
amVjdCB3aGljaCBpbiB0dXJuIGluc3RhbnRpYXRlcyBiY20yODM1X3BlcmlwaGVyYWxzLCB3aGlj
aCBpbiB0dXJuIGluc3RhbnRpYXRlcyBiY20yODM1X2ZiKS4gRGVmaW5pbmcgcHJvcGVydGllcyBh
dCBlYWNoIGxldmVsIGp1c3QgdG8gcGFzcyB0aGVzZSBhbG9uZyBpcyBwYWluZnVsL2ZyYWdpbGUu
IElzIHRoZXJlIGEgcHJvZ3JhbW1hdGljIHdheSB0byBoYXZlIHByb3BlcnRpZXMgdGhhdCBhcmUg
ZGVmaW5lZCBnbG9iYWxseSBhbmQgcGFzc2VkIHRocm91Z2gsIHJvdWdobHkgZXF1aXZhbGVudCB0
byAtZ2xvYmFsIG9uIHRoZSBjb21tYW5kIGxpbmU/IElzIGl0IGFjY2VwdGFibGUgdG8gdXNlIHRo
YXQ/DQoNCkZvcmdpdmUgbWUgaWYgdGhlcmUgaXMgZG9jdW1lbnRhdGlvbi9ndWlkYW5jZSBvbiB0
aGlzIHN0dWZmIGFscmVhZHkgLS0gSSBkaWRuJ3QgbWFuYWdlIHRvIGZpbmQgdmVyeSBtdWNoLg0K
DQpJZiBhbnlvbmUgd2FudHMgdG8gdGFrZSBhIGxvb2ssIG15IHdvcmtpbmcgdHJlZSBpcyBhdDoN
Cmh0dHBzOi8vZ2l0aHViLmNvbS8weGFidS9xZW11L3RyZWUvcmFzcGkNCg0KVGhlIHJlbGV2YW50
IGZpbGVzIGFyZToNCiBody9hcm0vYmNtMjgzNS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDky
ICsrKw0KIGh3L2FybS9iY20yODM1X3BlcmlwaGVyYWxzLmMgICAgICAgICB8ICAzNjggKysrKysr
KysrKysrDQogaHcvYXJtL2JjbTI4MzYuYyAgICAgICAgICAgICAgICAgICAgIHwgIDE0OSArKysr
Kw0KIGh3L2FybS9yYXNwaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyMjggKysrKysrKysN
CiBody9jaGFyL2JjbTI4MzVfYXV4LmMgICAgICAgICAgICAgICAgfCAgMjUwICsrKysrKysrDQog
aHcvZGlzcGxheS9iY20yODM1X2ZiLmMgICAgICAgICAgICAgIHwgIDQyNyArKysrKysrKysrKysr
Kw0KIGh3L2RtYS9iY20yODM1X2RtYS5jICAgICAgICAgICAgICAgICB8ICAzNjYgKysrKysrKysr
KysrDQogaHcvaW50Yy9iY20yODM1X2ljLmMgICAgICAgICAgICAgICAgIHwgIDI0OCArKysrKysr
Kw0KIGh3L2ludGMvYmNtMjgzNl9jb250cm9sLmMgICAgICAgICAgICB8ICAzNzMgKysrKysrKysr
KysrDQogaHcvbWlzYy9iY20yODM1X21waGkuYyAgICAgICAgICAgICAgIHwgIDE3NiArKysrKysN
CiBody9taXNjL2JjbTI4MzVfcG93ZXIuYyAgICAgICAgICAgICAgfCAgMTEzICsrKysNCiBody9t
aXNjL2JjbTI4MzVfcHJvcGVydHkuYyAgICAgICAgICAgfCAgNDE3ICsrKysrKysrKysrKysNCiBo
dy9taXNjL2JjbTI4MzVfc2JtLmMgICAgICAgICAgICAgICAgfCAgMzEwICsrKysrKysrKysNCiBo
dy9taXNjL2JjbTI4MzVfdmNoaXEuYyAgICAgICAgICAgICAgfCAgMTE0ICsrKysNCiBody9zZC9i
Y20yODM1X2VtbWMuYyAgICAgICAgICAgICAgICAgfCAgODQ0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KIGh3L3RpbWVyL2FybV90aW1lci5jICAgICAgICAgICAgICAgICB8ICAgMzkgKysN
CiBody90aW1lci9iY20yODM1X3N0LmMgICAgICAgICAgICAgICAgfCAgMjAxICsrKysrKysNCiBo
dy90aW1lci9iY20yODM1X3RpbWVyLmMgICAgICAgICAgICAgfCAgMjQyICsrKysrKysrDQogaHcv
dXNiL2JjbTI4MzVfdXNiLmMgICAgICAgICAgICAgICAgIHwgIDY1NSArKysrKysrKysrKysrKysr
KysrKysNCiBody91c2IvYmNtMjgzNV91c2JfcmVncy5oICAgICAgICAgICAgfCAxMDYxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2h3L2FybS9iY20yODM1Lmgg
ICAgICAgICAgICAgfCAgIDMxICsNCiBpbmNsdWRlL2h3L2FybS9iY20yODM1X2FybV9jb250cm9s
LmggfCAgNDgxICsrKysrKysrKysrKysrKw0KIGluY2x1ZGUvaHcvYXJtL2JjbTI4MzVfbWJveC5o
ICAgICAgICB8ICAgMTQgKw0KIGluY2x1ZGUvaHcvYXJtL2JjbTI4MzVfcGVyaXBoZXJhbHMuaCB8
ICAgMzUgKysNCiBpbmNsdWRlL2h3L2FybS9iY20yODM2LmggICAgICAgICAgICAgfCAgIDM0ICsr
DQogaW5jbHVkZS9ody9hcm0vcmFzcGlfcGxhdGZvcm0uaCAgICAgIHwgIDE2MCArKysrKw0KIGlu
Y2x1ZGUvaHcvZGlzcGxheS9iY20yODM1X2ZiLmggICAgICB8ICAgMjkgKw0KDQpUaGFua3MsDQpB
bmRyZXcNCg==
