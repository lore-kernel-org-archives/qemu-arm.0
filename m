Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5716345wrx;
        Wed, 10 Apr 2019 01:49:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxurni6eUBk6nRHClmgn3JfV0MmemO9oM9wBRQSiFSvuERwCXRNs6hF1PPfhTY6o8Zo83Oa
X-Received: by 2002:adf:cf05:: with SMTP id o5mr24908914wrj.8.1554886188765;
        Wed, 10 Apr 2019 01:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554886188; cv=none;
        d=google.com; s=arc-20160816;
        b=qx7BT9NgwzKGGtBNCpUk184RNhrCKWN98owCsYctvafFFPUXwzq6wdYzvEemXOJAJ2
         Ww8MmaoHKCUmcXH6GvdzvZ1M2aTi5jriOEjCBJnAhj9SD98QC2OWHLfkPSH6vbOKpoAw
         scbIeZmGg+Huo2dsLAYFemvD+M1VTCIN4n+ckjWy8Gkiy651rMfkGGb+NaIf+4wf4NR0
         sXO1i6RmldwSPlIMgUyiqfQcoobkERcX9uEktQBYHYuqYzsFducnasa6UzfGMt2htwot
         13MBtvDnCqCv6xB9RxCnjJJcTwPuikM/geQr1z9GEJ4PCeRh/3bxZkZAUxaG0En+GG75
         BhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=ZFyZp382ssmAcFEsHsO5N1aX5/NzMx5fQ5DIXvsctCE=;
        b=RRaMnI4lhnqvthdYv0LwvXGviJjDrmeI7vOOrVjq9TVtbjgpm1yVPRhjIlqE6eKPwH
         NmCSEmYMEUTEvHBAqVRFn1B52IEFRuYFIWlo0CqNP0/NZTUDMUVdVBk+LRYwXFULVAT8
         ZxII5ljE4UkRsCmlkvSTm54Oxf+shBBqSeYD6epEfUksMh8AuNFoeJ4YYVdLcpAnzIAi
         kH7rMBw5pzIvRUHgYvcavuAMbDrliiaj+3WEv/pVRDRZZeh3WygP4Sl2Ias0KyWdjSKw
         YcaN9+a2WQIwqFazcPt1vRzZ/W1UcIWVV4PwbX5t/kU80S0zB4O4GDDdBVa+c1me177I
         Uqgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f124si1039836wmf.115.2019.04.10.01.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Apr 2019 01:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hE8vT-0005ZB-O8
	for alex.bennee@linaro.org; Wed, 10 Apr 2019 04:49:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hE8vD-0005X0-Ek
	for qemu-arm@nongnu.org; Wed, 10 Apr 2019 04:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hE8vC-0005tJ-38
	for qemu-arm@nongnu.org; Wed, 10 Apr 2019 04:49:31 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45389 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hE8vB-0005sB-NY; Wed, 10 Apr 2019 04:49:30 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 57EB8246EBB18D93D814;
	Wed, 10 Apr 2019 09:49:27 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.229]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Wed, 10 Apr 2019 09:49:21 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Laszlo Ersek <lersek@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "imammedo@redhat.com"
	<imammedo@redhat.com>
Thread-Topic: [PATCH v4 8/8] hw/arm/boot: Expose the PC-DIMM nodes in the DT
Thread-Index: AQHU7r+FHRV2RRXA40+Yjk9QZW2DraYz3gyAgAE0oHA=
Date: Wed, 10 Apr 2019 08:49:20 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83935D360@lhreml524-mbs.china.huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-9-shameerali.kolothum.thodi@huawei.com>
	<4f3df83f-8d45-09d0-ec9e-0ddf843fd3a4@redhat.com>
In-Reply-To: <4f3df83f-8d45-09d0-ec9e-0ddf843fd3a4@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v4 8/8] hw/arm/boot: Expose the PC-DIMM nodes
 in the DT
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mevht5j6QhaX

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhc3psbyBFcnNlayBbbWFp
bHRvOmxlcnNla0ByZWRoYXQuY29tXQ0KPiBTZW50OiAwOSBBcHJpbCAyMDE5IDE2OjA5DQo+IFRv
OiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1
YXdlaS5jb20+Ow0KPiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYXJtQG5vbmdudS5vcmc7
IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbQ0KPiBDYzogcGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBzaGFubm9uLnpoYW9zbEBnbWFpbC5jb207DQo+IHNhbWVv
QGxpbnV4LmludGVsLmNvbTsgc2ViYXN0aWVuLmJvZXVmQGludGVsLmNvbTsgeHV3ZWkgKE8pDQo+
IDx4dXdlaTVAaHVhd2VpLmNvbT47IGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc7IExpbnV4YXJt
DQo+IDxsaW51eGFybUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDgvOF0g
aHcvYXJtL2Jvb3Q6IEV4cG9zZSB0aGUgUEMtRElNTSBub2RlcyBpbiB0aGUNCj4gRFQNCj4gDQo+
IE9uIDA0LzA5LzE5IDEyOjI5LCBTaGFtZWVyIEtvbG90aHVtIHdyb3RlOg0KPiA+IFRoaXMgcGF0
Y2ggYWRkcyBtZW1vcnkgbm9kZXMgY29ycmVzcG9uZGluZyB0byBQQy1ESU1NIHJlZ2lvbnMuDQo+
ID4gVGhpcyB3aWxsIGVuYWJsZSBzdXBwb3J0IGZvciBjb2xkIHBsdWdnZWQgZGV2aWNlIG1lbW9y
eSBmb3IgR3Vlc3RzDQo+ID4gd2l0aCBEVCBib290Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
U2hhbWVlciBLb2xvdGh1bSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4g
PiAtLS0NCj4gPiAgaHcvYXJtL2Jvb3QuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS9ib290LmMgYi9ody9hcm0vYm9vdC5jDQo+ID4g
aW5kZXggOGM4NDBiYS4uMTUwZTFlZCAxMDA2NDQNCj4gPiAtLS0gYS9ody9hcm0vYm9vdC5jDQo+
ID4gKysrIGIvaHcvYXJtL2Jvb3QuYw0KPiA+IEBAIC0xOSw2ICsxOSw3IEBADQo+ID4gICNpbmNs
dWRlICJzeXNlbXUvbnVtYS5oIg0KPiA+ICAjaW5jbHVkZSAiaHcvYm9hcmRzLmgiDQo+ID4gICNp
bmNsdWRlICJody9sb2FkZXIuaCINCj4gPiArI2luY2x1ZGUgImh3L21lbS9tZW1vcnktZGV2aWNl
LmgiDQo+ID4gICNpbmNsdWRlICJlbGYuaCINCj4gPiAgI2luY2x1ZGUgInN5c2VtdS9kZXZpY2Vf
dHJlZS5oIg0KPiA+ICAjaW5jbHVkZSAicWVtdS9jb25maWctZmlsZS5oIg0KPiA+IEBAIC01Mzgs
NiArNTM5LDQxIEBAIHN0YXRpYyB2b2lkIGZkdF9hZGRfcHNjaV9ub2RlKHZvaWQgKmZkdCkNCj4g
PiAgICAgIHFlbXVfZmR0X3NldHByb3BfY2VsbChmZHQsICIvcHNjaSIsICJtaWdyYXRlIiwgbWln
cmF0ZV9mbik7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IGZkdF9hZGRfaG90cGx1Z2dh
YmxlX21lbW9yeV9ub2Rlcyh2b2lkICpmZHQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGFjZWxscywNCj4gdWludDMyX3Qgc2NlbGxz
KSB7DQo+ID4gKyAgICBNZW1vcnlEZXZpY2VJbmZvTGlzdCAqaW5mbywgKmluZm9fbGlzdCA9IHFt
cF9tZW1vcnlfZGV2aWNlX2xpc3QoKTsNCj4gPiArICAgIE1lbW9yeURldmljZUluZm8gKm1pOw0K
PiA+ICsgICAgaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsgICAgZm9yIChpbmZvID0gaW5mb19s
aXN0OyBpbmZvICE9IE5VTEw7IGluZm8gPSBpbmZvLT5uZXh0KSB7DQo+ID4gKyAgICAgICAgbWkg
PSBpbmZvLT52YWx1ZTsNCj4gPiArICAgICAgICBzd2l0Y2ggKG1pLT50eXBlKSB7DQo+ID4gKyAg
ICAgICAgY2FzZSBNRU1PUllfREVWSUNFX0lORk9fS0lORF9ESU1NOg0KPiA+ICsgICAgICAgIHsN
Cj4gPiArICAgICAgICAgICAgUENESU1NRGV2aWNlSW5mbyAqZGkgPSBtaS0+dS5kaW1tLmRhdGE7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICByZXQgPSBmZHRfYWRkX21lbW9yeV9ub2RlKGZkdCwg
YWNlbGxzLCBkaS0+YWRkciwgc2NlbGxzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRpLT5zaXplLCBkaS0+bm9kZSwgdHJ1ZSk7DQo+ID4gKyAgICAgICAgICAg
IGlmIChyZXQpIHsNCj4gPiArICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAiY291bGRuJ3QgYWRkIFBDRElNTSAvbWVtb3J5QCUiUFJJ
eDY0Ig0KPiBub2RlXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBkaS0+YWRkcik7
DQo+ID4gKyAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgICAgICAgICAgfQ0KPiA+
ICsgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICAgICAgZGVmYXVs
dDoNCj4gPiArICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICIlcyBtZW1vcnkgbm9kZXMgYXJl
IG5vdCB5ZXQgc3VwcG9ydGVkXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIE1lbW9yeURl
dmljZUluZm9LaW5kX3N0cihtaS0+dHlwZSkpOw0KPiA+ICsgICAgICAgICAgICByZXQgPSAtRU5P
RU5UOw0KPiA+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAg
ICB9DQo+ID4gK291dDoNCj4gPiArICAgIHFhcGlfZnJlZV9NZW1vcnlEZXZpY2VJbmZvTGlzdChp
bmZvX2xpc3QpOw0KPiA+ICsgICAgcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgaW50
IGFybV9sb2FkX2R0Yihod2FkZHIgYWRkciwgY29uc3Qgc3RydWN0IGFybV9ib290X2luZm8gKmJp
bmZvLA0KPiA+ICAgICAgICAgICAgICAgICAgIGh3YWRkciBhZGRyX2xpbWl0LCBBZGRyZXNzU3Bh
Y2UgKmFzKQ0KPiA+ICB7DQo+ID4gQEAgLTYzNyw2ICs2NzMsMTIgQEAgaW50IGFybV9sb2FkX2R0
Yihod2FkZHIgYWRkciwgY29uc3Qgc3RydWN0DQo+IGFybV9ib290X2luZm8gKmJpbmZvLA0KPiA+
ICAgICAgICAgIH0NCj4gPiAgICAgIH0NCj4gPg0KPiA+ICsgICAgcmMgPSBmZHRfYWRkX2hvdHBs
dWdnYWJsZV9tZW1vcnlfbm9kZXMoZmR0LCBhY2VsbHMsIHNjZWxscyk7DQo+ID4gKyAgICBpZiAo
cmMgPCAwKSB7DQo+ID4gKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJjb3VsZG4ndCBhZGQgaG90
cGx1Z2dhYmxlIG1lbW9yeSBub2Rlc1xuIik7DQo+ID4gKyAgICAgICAgZ290byBmYWlsOw0KPiA+
ICsgICAgfQ0KPiA+ICsNCj4gPiAgICAgIHJjID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9jaG9z
ZW4iKTsNCj4gPiAgICAgIGlmIChyYyA8IDApIHsNCj4gPiAgICAgICAgICBxZW11X2ZkdF9hZGRf
c3Vibm9kZShmZHQsICIvY2hvc2VuIik7DQo+ID4NCj4gDQo+IA0KPiBHaXZlbiBwYXRjaGVzICM3
IGFuZCAjOCwgYXMgSSB1bmRlcnN0YW5kIHRoZW0sIHRoZSBmaXJtd2FyZSBjYW5ub3QNCj4gZGlz
dGluZ3Vpc2ggaG90cGx1Z2dhYmxlICYgcHJlc2VudCwgZnJvbSBob3RwbHVnZ2FibGUgJiBhYnNl
bnQuIFRoZSBmaXJtd2FyZQ0KPiBjYW4gb25seSBza2lwIGJvdGggaG90cGx1Z2dhYmxlIGNhc2Vz
LiBUaGF0J3MgZmluZSBpbiB0aGF0IHRoZSBmaXJtd2FyZSB3aWxsIGhvZw0KPiBuZWl0aGVyIHR5
cGUgLS0gYnV0IGlzIHRoYXQgT0sgZm9yIHRoZSBPUyBhcyB3ZWxsLCBmb3IgYm90aCBBQ1BJIGJv
b3QgYW5kIERUDQo+IGJvb3Q/DQoNClJpZ2h0LiBUaGlzIG9ubHkgaGFuZGxlcyB0aGUgaG90cGx1
Z2dhYmxlLWFuZC1wcmVzZW50IGNvbmRpdGlvbi4NCg0KPiBDb25zaWRlciBpbiBwYXJ0aWN1bGFy
IHRoZSAiaG90cGx1Z2dhYmxlICYgcHJlc2VudCwgQUNQSSBib290IiBjYXNlLiBBc3N1bWluZw0K
PiB3ZSBtb2RpZnkgdGhlIGZpcm13YXJlIHRvIHNraXAgImhvdHBsdWdnYWJsZSIgYWx0b2dldGhl
ciwgdGhlIFVFRkkgbWVtbWFwDQo+IHdpbGwgbm90IGluY2x1ZGUgdGhlIHJhbmdlIGRlc3BpdGUg
aXQgYmVpbmcgcHJlc2VudCBhdCBib290LiBQcmVzdW1hYmx5LCBBQ1BJDQo+IHdpbGwgcmVmZXIg
dG8gdGhlIHJhbmdlIHNvbWVob3csIGhvd2V2ZXIuIFdpbGwgdGhhdCBub3QgY29uZnVzZSB0aGUg
T1M/DQoNCkZyb20gbXkgdGVzdGluZyBzbyBmYXIsIHdpdGhvdXQgcGF0Y2hlcyAjNyBhbmQgIzgo
aWUsIG5vIFVFRkkgbWVtbWFwIGVudHJ5KSwNCkFDUEkgYm9vdHMgZmluZS4gSSB0aGluayBBQ1BJ
IG9ubHkgcmVsaWVzIG9uIGFtbCBhbmQgU1JBVC4gDQogDQo+IFdoZW4gSWdvciByYWlzZWQgdGhp
cyBlYXJsaWVyLCBJIHN1Z2dlc3RlZCB0aGF0IGhvdHBsdWdnYWJsZS1hbmQtcHJlc2VudA0KPiBz
aG91bGQgYmUgYWRkZWQgYnkgdGhlIGZpcm13YXJlLCBidXQgYWxzbyBhbGxvY2F0ZWQgaW1tZWRp
YXRlbHksIGFzDQo+IEVmaUJvb3RTZXJ2aWNlc0RhdGEgdHlwZSBtZW1vcnkuIFRoaXMgd2lsbCBw
cmV2ZW50IG90aGVyIGRyaXZlcnMgaW4gdGhlDQo+IGZpcm13YXJlIGZyb20gYWxsb2NhdGluZyBB
Y3BpTlZTIG9yIFJlc2VydmVkIGNodW5rcyBmcm9tIHRoZSBzYW1lIG1lbW9yeQ0KPiByYW5nZSwg
dGhlIFVFRkkgbWVtbWFwIHdpbGwgY29udGFpbiB0aGUgcmFuZ2UgYXMgRWZpQm9vdFNlcnZpY2Vz
RGF0YSwgYW5kDQo+IHRoZW4gdGhlIE9TIGNhbiByZWxlYXNlIHRoYXQgYWxsb2NhdGlvbiBpbiBv
bmUgZ28gZWFybHkgZHVyaW5nIGJvb3QuDQoNCk9rLiBBZ3JlZSB0aGF0IGhvdHBsdWdnYWJsZS1h
bmQtcHJlc2VudCBjYXNlIGl0IG1heSBtYWtlIHNlbnNlIHRvIG1ha2UgdXNlIG9mDQp0aGF0IG1l
bW9yeSByYXRoZXIgdGhhbiBqdXN0IGhpZGluZyBpdCBhbHRvZ2V0aGVyLg0KDQpPbiBhbm90aGVy
IG5vdGUsIERvZXMgaG90cGx1Z2dhYmxlLWFuZC1hYnNlbnQgY2FzZSBtYWtlIGFueSB2YWxpZCB1
c2UgY2FzZSBmb3INCmEgRFQgYm9vdD8gSSBhbSBub3Qgc3VyZSBob3cgd2UgY2FuIGhvdC1hZGQg
bWVtb3J5IGluIHRoZSBjYXNlIG9mIERUIGJvb3QgbGF0ZXIuDQpJIGhhdmUgbm90IHZlcmlmaWVk
IHRoZSBzeXNmcyBwcm9iZSBpbnRlcmZhY2UgeWV0IGFuZCB0aGVyZSBhcmUgZGlzY3Vzc2lvbnMg
b2YgZHJvcHBpbmcNCnRoYXQgaW50ZXJmYWNlIGFsdG9nZXRoZXIuDQoNCj4gQnV0IHRoaXMgcmVh
bGx5IGhhcyB0byBiZSBjbGFyaWZpZWQgZnJvbSB0aGUgTGludXgga2VybmVsJ3MgZXhwZWN0YXRp
b25zLiBQbGVhc2UNCj4gZm9ybWFsaXplIGFsbCBvZiB0aGUgZm9sbG93aW5nIGNhc2VzOg0KDQpT
dXJlLiBJIHdpbGwgd2FpdCBmb3Igc3VnZ2VzdGlvbnMgaGVyZSBhbmQgd29yayBvbiBpdC4NCg0K
VGhhbmtzLA0KU2hhbWVlcg0KDQo+IE9TIGJvb3QgKERUL0FDUEkpICBob3RwbHVnZ2FibGUgJiAu
Li4gIEdldE1lbW9yeU1hcCgpIHNob3VsZCByZXBvcnQgYXMNCj4gRFQvQUNQSSBzaG91bGQgcmVw
b3J0IGFzDQo+IC0tLS0tLS0tLS0tLS0tLS0tICAtLS0tLS0tLS0tLS0tLS0tLS0gIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBEVA0K
PiBwcmVzZW50ICAgICAgICAgICAgID8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8N
Cj4gRFQNCj4gYWJzZW50ICAgICAgICAgICAgICA/ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA/DQo+IEFDUEkNCj4gcHJlc2VudCAgICAgICAgICAgICA/ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA/DQo+IEFDUEkNCj4gYWJzZW50ICAgICAgICAgICAgICA/ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA/DQo+IA0KPiBBZ2FpbiwgdGhpcyB0YWJsZSBpcyBkaWN0
YXRlZCBieSBMaW51eC4NCj4gDQo+IFRoYW5rcw0KPiBMYXN6bG8NCg==
