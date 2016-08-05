Received: by 10.25.21.156 with SMTP id 28csp2032040lfv;
        Fri, 5 Aug 2016 14:48:57 -0700 (PDT)
X-Received: by 10.55.133.197 with SMTP id h188mr14878612qkd.58.1470433737860;
        Fri, 05 Aug 2016 14:48:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si12759158qta.121.2016.08.05.14.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 14:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVmzB-00059o-4w
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 17:48:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVmz5-00056H-HR
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 17:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVmz1-0006XO-D6
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 17:48:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:7543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bVmz1-0006X8-2U; Fri, 05 Aug 2016 17:48:47 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 05 Aug 2016 14:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,475,1464678000"; d="scan'208";a="1030600073"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2016 14:48:46 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 5 Aug 2016 14:48:45 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	SHSMSX104.ccr.corp.intel.com ([169.254.5.116]) with mapi id
	14.03.0248.002; Sat, 6 Aug 2016 05:48:43 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
	<shannon.zhao@linaro.org>
Thread-Topic: [PATCH] debugcon: Add -debugport option to allow changing
	debug console port number
Thread-Index: AQHR7wL4V1YYDepyhEaeEKGeQ9GwZKA5wfMAgAEmGfA=
Date: Fri, 5 Aug 2016 21:48:42 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0AB10@SHSMSX101.ccr.corp.intel.com>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
	<92ca7f37-9417-e122-a3cf-d3d85a1b89f7@redhat.com>
In-Reply-To: <92ca7f37-9417-e122-a3cf-d3d85a1b89f7@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODlhODM0YWItNzdmYi00ODZlLWIzNmUtODNjNWI4OTAxYTAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6InVUek1TMUZHb0o5NDlJWHZyb3c2QU5TMVpHWEpzV21hSW9HVlFnN1NDdjQ9In0=
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-arm] [PATCH] debugcon: Add -debugport option to allow
 changing debug console port number
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
X-TUID: X4Q7UpvH3Wa2

SGksDQoNCj4gRnJvbTogUGFvbG8gQm9uemluaSBbbWFpbHRvOnBhb2xvLmJvbnppbmlAZ21haWwu
Y29tXSBPbiBCZWhhbGYgT2YgUGFvbG8NCj4gQm9uemluaQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkZWJ1Z2NvbjogQWRkIC1kZWJ1Z3BvcnQgb3B0aW9uIHRvIGFsbG93IGNoYW5naW5nDQo+IGRl
YnVnIGNvbnNvbGUgcG9ydCBudW1iZXINCj4gDQo+IA0KPiANCj4gT24gMDUvMDgvMjAxNiAxMjox
OSwgTHYgWmhlbmcgd3JvdGU6DQo+ID4gQ2hhbmdpbmcgZGVidWdjb24gcG9ydCB0byAweDQwMiBh
bGxvd3MgdGhlIHNlYWJpb3MgQU1MIHRhYmxlIHByZS0NCj4gZGVmaW5lZA0KPiA+IERCVUcoKSBj
b250cm9sIG1ldGhvZCB0byBiZSBhYmxlIHRvIGR1bXAgdGhlIEFNTCBkZWJ1Z2dpbmcNCj4gaW5m
b3JtYXRpb24gdG8NCj4gPiB0aGUgcmUtZGlyZWN0ZWQgZGVidWdnaW5nIGNvbnNvbGUuDQo+ID4N
Cj4gPiBJZiB0aGUgZGVidWcgcG9ydCBudW1iZXIgaXMgY29uZmlndXJhYmxlLCB1c2VycyBjYW4g
ZnVydGhlciBzcGVjaWZ5IGENCj4gPiBwcm9wZXIgSU8gcG9ydCBudW1iZXIgZm9yIGl0IHRvIG1h
a2UgZXh0ZXJuYWwgQklPUydzIGRlYnVnZ2luZw0KPiA+IGZhY2lsaXR5IGZ1bmN0aW9uaW5nLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPGx2LnpoZW5nQGludGVsLmNvbT4NCj4g
DQo+IFlvdSBjYW4gZG8gdGhpcyB3aXRoDQo+IA0KPiAgICAtZ2xvYmFsIGlzYS1kZWJ1Z2Nvbi5p
b2Jhc2U9MHg0MDINCltMdiBaaGVuZ10gDQpUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4gOikN
Cg0KQmVzdCByZWdhcmRzDQpMdg0KDQoNCj4gDQo+IFBhb2xvDQo+IA0KPiA+IC0tLQ0KPiA+ICBo
dy9jaGFyL2RlYnVnY29uLmMgICAgICB8ICAgIDQgKysrKw0KPiA+ICBody9pMzg2L2FjcGktYnVp
bGQuYyAgICB8ICAgIDMgKystDQo+ID4gIGluY2x1ZGUvc3lzZW11L3N5c2VtdS5oIHwgICAgMSAr
DQo+ID4gIHFlbXUtb3B0aW9ucy5oeCAgICAgICAgIHwgICAgOSArKysrKysrKysNCj4gPiAgdmwu
YyAgICAgICAgICAgICAgICAgICAgfCAgIDE1ICsrKysrKysrKysrKysrKw0KPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9ody9jaGFyL2RlYnVnY29uLmMgYi9ody9jaGFyL2RlYnVnY29uLmMNCj4gPiBpbmRl
eCBlN2YwMjVlLi5mOTY2YTA5IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2NoYXIvZGVidWdjb24uYw0K
PiA+ICsrKyBiL2h3L2NoYXIvZGVidWdjb24uYw0KPiA+IEBAIC0xMDUsNiArMTA1LDEwIEBAIHN0
YXRpYyB2b2lkIGRlYnVnY29uX2lzYV9yZWFsaXplZm4oRGV2aWNlU3RhdGUNCj4gKmRldiwgRXJy
b3IgKiplcnJwKQ0KPiA+ICAgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnIpOw0KPiA+
ICAgICAgICAgIHJldHVybjsNCj4gPiAgICAgIH0NCj4gPiArICAgIGlmIChkZWJ1Z19wb3J0ICE9
IDB4ZTkpIHsNCj4gPiArICAgICAgICBxZGV2X3Byb3Bfc2V0X3VpbnQzMihkZXYsICJpb2Jhc2Ui
LCBkZWJ1Z19wb3J0KTsNCj4gPiArICAgICAgICBxZGV2X3Byb3Bfc2V0X3VpbnQzMihkZXYsICJy
ZWFkYmFjayIsIGRlYnVnX3BvcnQpOw0KPiA+ICsgICAgfQ0KPiA+ICAgICAgbWVtb3J5X3JlZ2lv
bl9pbml0X2lvKCZzLT5pbywgT0JKRUNUKGRldiksICZkZWJ1Z2Nvbl9vcHMsIHMsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9JU0FfREVCVUdDT05fREVWSUNFLCAxKTsNCj4g
PiAgICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbihpc2FfYWRkcmVzc19zcGFjZV9pbyhk
KSwNCj4gPiBkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgYi9ody9pMzg2L2FjcGkt
YnVpbGQuYw0KPiA+IGluZGV4IGEyNmE0YmIuLjE0YzYyMjQgMTAwNjQ0DQo+ID4gLS0tIGEvaHcv
aTM4Ni9hY3BpLWJ1aWxkLmMNCj4gPiArKysgYi9ody9pMzg2L2FjcGktYnVpbGQuYw0KPiA+IEBA
IC0xNDQyLDcgKzE0NDIsOCBAQCBzdGF0aWMgdm9pZCBidWlsZF9kYmdfYW1sKEFtbCAqdGFibGUp
DQo+ID4gICAgICBBbWwgKmlkeCA9IGFtbF9sb2NhbCgyKTsNCj4gPg0KPiA+ICAgICAgYW1sX2Fw
cGVuZChzY29wZSwNCj4gPiAtICAgICAgIGFtbF9vcGVyYXRpb25fcmVnaW9uKCJEQkciLCBBTUxf
U1lTVEVNX0lPLCBhbWxfaW50KDB4MDQwMiksDQo+IDB4MDEpKTsNCj4gPiArICAgICAgIGFtbF9v
cGVyYXRpb25fcmVnaW9uKCJEQkciLCBBTUxfU1lTVEVNX0lPLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYW1sX2ludChkZWJ1Z19wb3J0KSwgMHgwMSkpOw0KPiA+ICAgICAgZmll
bGQgPSBhbWxfZmllbGQoIkRCRyIsIEFNTF9CWVRFX0FDQywgQU1MX05PTE9DSywNCj4gQU1MX1BS
RVNFUlZFKTsNCj4gPiAgICAgIGFtbF9hcHBlbmQoZmllbGQsIGFtbF9uYW1lZF9maWVsZCgiREJH
QiIsIDgpKTsNCj4gPiAgICAgIGFtbF9hcHBlbmQoc2NvcGUsIGZpZWxkKTsNCj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zeXNlbXUvc3lzZW11LmggYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaA0K
PiA+IGluZGV4IGVlN2M3NjAuLjllMGEzMGIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9zeXNl
bXUvc3lzZW11LmgNCj4gPiArKysgYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaA0KPiA+IEBAIC0x
NjcsNiArMTY3LDcgQEAgZXh0ZXJuIHVpbnQ4X3QgcWVtdV9leHRyYV9wYXJhbXNfZndbMl07DQo+
ID4gIGV4dGVybiBRRU1VQ2xvY2tUeXBlIHJ0Y19jbG9jazsNCj4gPiAgZXh0ZXJuIGNvbnN0IGNo
YXIgKm1lbV9wYXRoOw0KPiA+ICBleHRlcm4gaW50IG1lbV9wcmVhbGxvYzsNCj4gPiArZXh0ZXJu
IHVpbnQzMl90IGRlYnVnX3BvcnQ7DQo+ID4NCj4gPiAgI2RlZmluZSBNQVhfTk9ERVMgMTI4DQo+
ID4gICNkZWZpbmUgTlVNQV9OT0RFX1VOQVNTSUdORUQgTUFYX05PREVTDQo+ID4gZGlmZiAtLWdp
dCBhL3FlbXUtb3B0aW9ucy5oeCBiL3FlbXUtb3B0aW9ucy5oeA0KPiA+IGluZGV4IGE3MWFhZjgu
LjA1YWVkY2UgMTAwNjQ0DQo+ID4gLS0tIGEvcWVtdS1vcHRpb25zLmh4DQo+ID4gKysrIGIvcWVt
dS1vcHRpb25zLmh4DQo+ID4gQEAgLTMxMjMsNiArMzEyMywxNSBAQCBUaGUgZGVmYXVsdCBkZXZp
Y2UgaXMgQGNvZGV7dmN9IGluIGdyYXBoaWNhbA0KPiBtb2RlIGFuZCBAY29kZXtzdGRpb30gaW4N
Cj4gPiAgbm9uIGdyYXBoaWNhbCBtb2RlLg0KPiA+ICBFVEVYSQ0KPiA+DQo+ID4gK0RFRigiZGVi
dWdwb3J0IiwgSEFTX0FSRywgUUVNVV9PUFRJT05fZGVidWdwb3J0LCBcDQo+ID4gKyAgICAiLWRl
YnVncG9ydCBuICAgICBTcGVjaWZ5IGRlYnVnIElPIHBvcnQgbnVtYmVyXG4iLA0KPiA+ICsgICAg
UUVNVV9BUkNIX0FMTCkNCj4gPiArU1RFWEkNCj4gPiArQGl0ZW0gLWRlYnVncG9ydCBAdmFye259
DQo+ID4gK0BmaW5kZXggLWRlYnVncG9ydA0KPiA+ICtTcGVjaWZ5IHRoZSBkZWJ1ZyBJTyBwb3J0
IG51bWJlciwgZGVmYXVsdCBpcyAweGU5Lg0KPiA+ICtFVEVYSQ0KPiA+ICsNCj4gPiAgREVGKCJw
aWRmaWxlIiwgSEFTX0FSRywgUUVNVV9PUFRJT05fcGlkZmlsZSwgXA0KPiA+ICAgICAgIi1waWRm
aWxlIGZpbGUgICB3cml0ZSBQSUQgdG8gJ2ZpbGUnXG4iLCBRRU1VX0FSQ0hfQUxMKQ0KPiA+ICBT
VEVYSQ0KPiA+IGRpZmYgLS1naXQgYS92bC5jIGIvdmwuYw0KPiA+IGluZGV4IGU3YzJjNjIuLjcx
MGUxNGQgMTAwNjQ0DQo+ID4gLS0tIGEvdmwuYw0KPiA+ICsrKyBiL3ZsLmMNCj4gPiBAQCAtMTc4
LDYgKzE3OCw3IEBAIGJvb2wgYm9vdF9zdHJpY3Q7DQo+ID4gIHVpbnQ4X3QgKmJvb3Rfc3BsYXNo
X2ZpbGVkYXRhOw0KPiA+ICBzaXplX3QgYm9vdF9zcGxhc2hfZmlsZWRhdGFfc2l6ZTsNCj4gPiAg
dWludDhfdCBxZW11X2V4dHJhX3BhcmFtc19md1syXTsNCj4gPiArdWludDMyX3QgZGVidWdfcG9y
dCA9IDB4ZTk7DQo+ID4NCj4gPiAgaW50IGljb3VudF9hbGlnbl9vcHRpb247DQo+ID4NCj4gPiBA
QCAtMjU4NCw2ICsyNTg1LDE3IEBAIHN0YXRpYyBpbnQgZGVidWdjb25fcGFyc2UoY29uc3QgY2hh
cg0KPiAqZGV2bmFtZSkNCj4gPiAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3Rh
dGljIHZvaWQgZGVidWdjb25fcGFyc2VfcG9ydChjb25zdCBjaGFyICphcmcpDQo+ID4gK3sNCj4g
PiArICAgIHVpbnQzMl90IHBvcnQ7DQo+ID4gKw0KPiA+ICsgICAgcG9ydCA9IHN0cnRvdWwoYXJn
LCBOVUxMLCAwKTsNCj4gPiArICAgIGlmIChwb3J0KSB7DQo+ID4gKyAgICAgICAgcHJpbnRmKCJS
ZS1hc3NpZ24gZGVidWcgY29uc29sZSB0byBwb3J0IDB4JTA4eC5cbiIsIHBvcnQpOw0KPiA+ICsg
ICAgICAgIGRlYnVnX3BvcnQgPSBwb3J0Ow0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+ID4gKw0KPiA+
ICBzdGF0aWMgZ2ludCBtYWNoaW5lX2NsYXNzX2NtcChnY29uc3Rwb2ludGVyIGEsIGdjb25zdHBv
aW50ZXIgYikNCj4gPiAgew0KPiA+ICAgICAgY29uc3QgTWFjaGluZUNsYXNzICptYzEgPSBhLCAq
bWMyID0gYjsNCj4gPiBAQCAtMzU4MCw2ICszNTkyLDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2LCBjaGFyICoqZW52cCkNCj4gPiAgICAgICAgICAgICAgY2FzZSBRRU1VX09QVElP
Tl9kZWJ1Z2NvbjoNCj4gPiAgICAgICAgICAgICAgICAgIGFkZF9kZXZpY2VfY29uZmlnKERFVl9E
RUJVR0NPTiwgb3B0YXJnKTsNCj4gPiAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAg
ICAgICAgICBjYXNlIFFFTVVfT1BUSU9OX2RlYnVncG9ydDoNCj4gPiArICAgICAgICAgICAgICAg
IGRlYnVnY29uX3BhcnNlX3BvcnQob3B0YXJnKTsNCj4gPiArICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiA+ICAgICAgICAgICAgICBjYXNlIFFFTVVfT1BUSU9OX2xvYWR2bToNCj4gPiAgICAgICAg
ICAgICAgICAgIGxvYWR2bSA9IG9wdGFyZzsNCj4gPiAgICAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+DQo=
