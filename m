Received: by 10.25.21.156 with SMTP id 28csp1206917lfv;
        Sun, 14 Aug 2016 18:42:33 -0700 (PDT)
X-Received: by 10.200.57.34 with SMTP id s31mr28605351qtb.49.1471225353129;
        Sun, 14 Aug 2016 18:42:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u82si10832514qka.163.2016.08.14.18.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Aug 2016 18:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZ6vA-0000Qk-IJ
	for alex.bennee@linaro.org; Sun, 14 Aug 2016 21:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bZ6v6-0000Qe-8l
	for qemu-arm@nongnu.org; Sun, 14 Aug 2016 21:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bZ6v1-0002ks-U3
	for qemu-arm@nongnu.org; Sun, 14 Aug 2016 21:42:27 -0400
Received: from mga14.intel.com ([192.55.52.115]:44456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bZ6v1-0002ko-Ov; Sun, 14 Aug 2016 21:42:23 -0400
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2016 18:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,522,1464678000"; d="scan'208";a="748730042"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2016 18:42:22 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sun, 14 Aug 2016 18:42:22 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
	fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sun, 14 Aug 2016 18:42:21 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	SHSMSX152.ccr.corp.intel.com ([169.254.6.107]) with mapi id
	14.03.0248.002; Mon, 15 Aug 2016 09:42:17 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"Shannon Zhao" <shannon.zhao@linaro.org>
Thread-Topic: [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow FADT
	revision changes
Thread-Index: AQHR87PqpWpibtH/7Eqcyw5l6DvWpaBE5sWAgARcEqA=
Date: Mon, 15 Aug 2016 01:42:16 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0DC9D@SHSMSX101.ccr.corp.intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
	<955fe680-3d7f-4dd9-1aae-55d812077be5@redhat.com>
In-Reply-To: <955fe680-3d7f-4dd9-1aae-55d812077be5@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDM5Yjc1YzItYTY2Mi00YTBjLTkzNjctOTcyMTI1NDdlY2E3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6ImpRTDFWUXErNHk5Qms1YnNoZm9ucEc3dkJ3UFNKRkZicEV1NDdWcE0wWlE9In0=
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-arm] [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow
 FADT revision changes
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c6dDbx90L/k/

SGksIFBhb2xvDQoNCj4gRnJvbTogUGFvbG8gQm9uemluaSBbbWFpbHRvOnBib256aW5pQHJlZGhh
dC5jb21dDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8yXSBBQ1BJOiBBZGQgLWFjcGl0YWJs
ZSBmYWR0PSB0byBhbGxvdyBGQURUDQo+IHJldmlzaW9uIGNoYW5nZXMNCj4gDQo+IA0KPiANCj4g
T24gMTEvMDgvMjAxNiAxMTozNiwgTHYgWmhlbmcgd3JvdGU6DQo+ID4NCj4gPiAtICAgIGVycm9y
X3NldGcoZXJycCwgIictYWNwaXRhYmxlJyByZXF1aXJlcyBvbmUgb2YgJ2RhdGEnIG9yICdmaWxl
JyIpOw0KPiA+ICsgICAgdmFsID0gcWVtdV9vcHRfZ2V0KChRZW11T3B0cyAqKW9wdHMsICJmYWR0
Iik7DQo+ID4gKyAgICBpZiAodmFsKSB7DQo+ID4gKyAgICAgICAgdW5zaWduZWQgbG9uZyByZXY7
DQo+IA0KPiBEb24ndCB1c2UgcWVtdV9vcHRfZ2V0LiAgQWRkIHRoZSBmaWVsZCB0byBBY3BpVGFi
bGVPcHRpb25zIGluDQo+IHFhcGktc2NoZW1hLmpzb24sIGFuZCB0aGVuIHVzZSBoZHJzLT5oYXNf
ZmFkdCwgaGRycy0+ZmFkdC4NCg0KDQoxLiBJZiBJIGRvIHNvLCB1c2VycyBtYXkgYmUgY29uZnVz
ZWQgd2hlbiBvbmx5IC1hY3BpdGFibGUgZmFkdD0zIGlzDQogICAgc3BlY2lmaWVkIChubyB1c2Vy
IHRhYmxlcyBhcmUgcHJvdmlkZWQpLCBxZW11IG1heSBleGl0IGJlY2F1c2Ugb2YgDQogICAgImRh
dGEgb3IgZmlsZSBvcHRpb24gbWlzc2luZyIuDQoyLiBJZiB3ZSBkb2Vzbid0IHdhbnQgcWVtdSBl
eGl0IGluIHRoZSBhYm92ZSBjYXNlLCBjb2RlIGluDQogICAgYWNwaV90YWJsZV9hZGQoKSB3aWxs
IGJlIHRvbyBjb21wbGljYXRlZC4NCjMuIElmIEkgcHV0IGZhZHQgaW50byBBY3BpVGFibGVPcHRp
b25zIGluIHRoZSBzY2hlbWEsDQogICAgaGRycy0+aGFzX2ZhZHQvaGRycy0+ZmFkdCB3aWxsIGJl
Y29tZSAyIG1vcmUgdXNlbGVzcyBvcHRpb25zDQogICAgKGp1c3QgbGlrZSBoZGVycy0+ZmlsZS9o
ZHJzLT5kYXRhL2hkcnMtPmhhc19maWxlL2hkcnMtPmhhc19kYXRhLA0KICAgIHNlZSBjb21tZW50
cyBvZiBhY3BpX3RhYmxlX2luc3RhbGwoKSkgcGFzc2VkIHRvIGFjcGlfdGFibGVfaW5zdGFsbCgp
Lg0KDQpUaGF0J3Mgd2h5IEkgZW5oYW5jZWQgLWFjcGl0YWJsZSB0byBjb252ZXJ0IGl0IGludG8g
YW4gb3B0aW9uIHdpdGggMw0KbWFuZGF0b3J5IHN1Yi1vcHRpb25zOg0KLWFjcGl0YWJsZSBkYXRh
L2ZpbGUgLi4uLg0KLWFjcGl0YWJsZSBmYWR0IC4uLi4NCg0KVGhhbmtzDQpMdg0K
