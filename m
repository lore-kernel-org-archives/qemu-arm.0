Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8535808wrx;
        Fri, 8 Mar 2019 08:00:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8CaPN/n2Tj+BLNDvMawk7Q6LMSbD7HwmxSxVUFFBsSWaxcrTfP3Vn0qa2nyYltYC7gWrU
X-Received: by 2002:a81:7084:: with SMTP id l126mr14452042ywc.203.1552060856601;
        Fri, 08 Mar 2019 08:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552060856; cv=none;
        d=google.com; s=arc-20160816;
        b=zs8E8QQZYVPUF/qBlRdgNe4z2Oc82SwOYZVx66PxhVGHpp403oSKgKMI57nivKQnxU
         46bQYg8CxvvAmVJ6+mxDPMgbDdK6SSfjyJhtV667TGiF8UWGOETUQzdTJ/wOtD+nHYpJ
         GugLzQhaKFEmsq0IDiPtjWmt5p+1pQpKKSuC6vhv0tcWnpyBaYcHXrneu6aGkVyAyjeH
         H0jDH8EixGiXGexkGCWOco21K9IkKXj9Ypkf67rORe3EUKCEnbAC+ZA86/juaO3s+lp9
         JkOHU2jnpMnbiSzBvK86R/ifSST4fn8lk2bxtkCsJZW8ymSGakr4hD3Out2iNvZjW2xZ
         GfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=QoDk510vH7IV46HU2RD8fXv4hVxf8xpOtQwySoAwPak=;
        b=Xj3XrrygF69GnYTbkO1EUi5tX/k0PfUajHGnrje2jhuCiZHOgPJwpSMn+o9avo4T/A
         +qYBamPB/Ksn42rmLRn0KHp8AUWj7x6qxYqb//kW6O89bInH1izBbE3ifRHMdHV/WHXF
         3vwDpBLiYyAm3lE0NE52h2FkvFaq/kfKr2xDMOvwR+pLsPLe2oG1cVvZANlIHySd9Mba
         2PPWHoJTs0Me1exwC9y9VbgztmG3Tp0vI3mNJPS2KTCnCYg3n54+uGOuF+qqpwlNeGAi
         QUGUvlLzkwj+x2tMUfpHmnsBn2aobz/t6ozXHWiHqtr6Ce45OaFmOl4Llc5aY1ZZ/23c
         pCOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p192si4959317ywh.50.2019.03.08.08.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 08:00:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:46092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Hvc-0003AO-31
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 11:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2HvJ-00038b-AH
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2HvH-0002CY-Ul
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:00:37 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45358 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2HvH-000260-NA; Fri, 08 Mar 2019 11:00:35 -0500
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 8D492D8117181819BE11;
	Fri,  8 Mar 2019 16:00:23 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.141]) by
	lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id
	14.03.0415.000; Fri, 8 Mar 2019 16:00:17 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v2 00/11] ARM virt: ACPI memory hotplug support
Thread-Index: AQHU1aRJtggXJmVick+SChUw+TRXJKYB4xcAgAABj8A=
Date: Fri, 8 Mar 2019 16:00:17 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392F47F7@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<7cb625b1-626d-e105-63a7-5c89ef3452ff@redhat.com>
In-Reply-To: <7cb625b1-626d-e105-63a7-5c89ef3452ff@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v2 00/11] ARM virt: ACPI memory hotplug
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
Cc: Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /z6f5Es6ky2V

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMDggTWFyY2ggMjAxOSAxNTo1NA0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDAvMTFdIEFSTSB2aXJ0OiBBQ1BJIG1lbW9yeSBob3RwbHVnIHN1cHBvcnQNCj4gDQo+IEhpIFNo
YW1lZXIsDQo+IE9uIDMvOC8xOSAxMjo0MiBQTSwgU2hhbWVlciBLb2xvdGh1bSB3cm90ZToNCj4g
PiBUaGlzIHNlcmllcyBpcyBhbiBhdHRlbXB0IHRvIHByb3ZpZGUgZGV2aWNlIG1lbW9yeSBob3Rw
bHVnIHN1cHBvcnQgb24NCj4gPiBBUk0gdmlydCBwbGF0Zm9ybS4gVGhpcyBpcyBiYXNlZCBvbiBF
cmljJ3MgcmVjZW50IHdvcmtzIGhlcmVbMV0gYW5kDQo+ID4gY2FycmllcyBzb21lIG9mIHRoZSBw
Yy1kaW1tIHJlbGF0ZWQgcGF0Y2hlcyBkcm9wcGVkIGZyb20gaGlzIHNlcmllcy4NCj4gPg0KPiA+
IFRoZSBrZXJuZWwgc3VwcG9ydCBmb3IgYXJtNjQgbWVtb3J5IGhvdCBhZGQgd2FzIGFkZGVkIHJl
Y2VudGx5IGJ5DQo+ID4gUm9iaW4gYW5kIGhlbmNlIHRoZSBndWVzdCBrZXJuZWwgc2hvdWxkIGJl
ID0+IDUuMC1yYzEuDQo+ID4NCj4gPiBOVkRJTSBzdXBwb3J0IGlzIG5vdCBpbmNsdWRlZCBjdXJy
ZW50bHkgYXMgd2Ugc3RpbGwgaGF2ZSBhbiB1bnJlc29sdmVkDQo+IHMvTlZESU0vTlZESU1NDQo+
ID4gaXNzdWUgd2hpbGUgaG90IGFkZGluZyBOVkRJTU1bMl0uIEhvd2V2ZXIgTlZESU1NIGNvbGQg
cGx1ZyBwYXRjaGVzIGNhbg0KPiA+IGJlIGluY2x1ZGVkLCBidXQgbm90IGRvbmUgZm9yIG5vdywg
Zm9yIGtlZXBpbmcgaXQgc2ltcGxlLg0KPiA+DQo+ID4gVGhpcyBtYWtlcyB1c2Ugb2YgR0VEIGRl
dmljZSB0byBzZW50IGhvdHBsdWcgQUNQSSBldmVudHMgdG8gdGhlIEd1ZXN0Lg0KPiA+IEdFRCBj
b2RlIGlzIGJhc2VkIG9uIE5lbXUuIFRoYW5rcyB0byB0aGUgZWZmb3J0cyBvZiBTYW11ZWwgYW5k
DQo+ID4gU2ViYXN0aWVuIHRvIGFkZCB0aGUgaGFyZHdhcmUtcmVkdWNlZCBzdXBwb3J0IHRvIE5l
bXUgdXNpbmcgR0VEDQo+ID4gZGV2aWNlWzNdLiAoUGxlYXNlIHNob3V0IGlmIEkgZ290IHRoZSBh
dXRob3Ivc2lnbmVkLW9mZiB3cm9uZyBmb3INCj4gPiB0aG9zZSBwYXRjaGVzIG9yIG1pc3NlZCBh
bnkgbmFtZXMpLg0KPiA+DQo+ID4gVGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgb24gdG9wIG9m
IEVyaWMncyBicmFuY2ggaGVyZVs0XS4NCj4gPg0KPiA+IFRoaXMgaXMgc2FuaXR5IHRlc3RlZCBv
biBhIEhpU2lsaWNvbiBBUk02NCBwbGF0Zm9ybSBhbmQgYXBwcmVjaWF0ZSBhbnkNCj4gPiBmdXJ0
aGVyIHRlc3RpbmcuDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gU2hhbWVlcg0KPiA+DQo+ID4gWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA4Mzc1NjUvDQo+ID4gWzJdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTA3ODM1ODkvDQo+ID4gWzNdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9uZW11L2Jsb2IvdG9waWMvdmlydC14ODYvaHcvYWNwaS9nZWQu
Yw0KPiA+IFs0XSBodHRwczovL2dpdGh1Yi5jb20vZWF1Z2VyL3FlbXUvdHJlZS92My4xLjAtZXh0
ZW5kZWQtbWVtbWFwLXYxMg0KPiANCj4gWW91IGhhdmUgYSBtaW5vciBjb25mbGljdCB3cnQgdXBz
dHJlYW0gZHVlIHRvDQo+IA0KPiA3YzI4YjkyNWI3ICBidWlsZDogY29udmVydCBwY2kubWFrIHRv
IEtjb25maWcNCj4gDQo+IHdoaWNoIGFkZHMgQ09ORklHX0xTSV9TQ1NJX1BDST15IGluIGRlZmF1
bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsNCg0KVGhhbmtzIEVyaWMuIE5vdGVkDQoNCkNoZWVy
cywNClNoYW1lZXINCg0KPiA+DQo+ID4NCj4gPiBSRkMgLS0+IHYyDQo+ID4NCj4gPiAtVXNlIEdF
RCBkZXZpY2UgaW5zdGVhZCBvZiBHUElPIGZvciBBQ1BJIGhvdHBsdWcgZXZlbnRzLg0KPiA+IC1S
ZW1vdmVkIE5WRElNTSBzdXBwb3J0IGZvciBub3cuDQo+ID4gLUluY2x1ZGVzIGRyb3BwZWQgcGF0
Y2hlcyBmcm9tIEVyaWMncyB2OSBzZXJpZXMuDQo+ID4NCj4gPg0KPiA+IEVyaWMgQXVnZXIgKDEp
Og0KPiA+ICAgaHcvYXJtL3ZpcnQ6IEFkZCBtZW1vcnkgaG90cGx1ZyBmcmFtZXdvcmsNCj4gPg0K
PiA+IFNhbXVlbCBPcnRpeiAoMyk6DQo+ID4gICBody9hY3BpOiBEbyBub3QgY3JlYXRlIG1lbW9y
eSBob3RwbHVnIG1ldGhvZCB3aGVuIGhhbmRsZXIgaXMgbm90DQo+ID4gICAgIGRlZmluZWQNCj4g
PiAgIGh3L2FybS92aXJ0OiBBZGQgdmlydHVhbCBBQ1BJIGRldmljZQ0KPiA+ICAgaHcvYWNwaTog
QWRkIEFDUEkgR2VuZXJpYyBFdmVudCBEZXZpY2UgU3VwcG9ydA0KPiA+DQo+ID4gU2ViYXN0aWVu
IEJvZXVmICgxKToNCj4gPiAgIGh3L2FjcGk6IE1vdmUgY29uc3RhbnQgZGVmaW5pdGlvbnMgdG8g
aGVhZGVyIGZpbGVzDQo+ID4NCj4gPiBTaGFtZWVyIEtvbG90aHVtICg2KToNCj4gPiAgIGh3L2Fj
cGk6IE1ha2UgQUNQSSBJTyBhZGRyZXNzIHNwYWNlIGNvbmZpZ3VyYWJsZQ0KPiA+ICAgaHcvYXJt
L3ZpcnQ6IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIGRldmljZSBtZW1vcnkgY29sZC1wbHVnDQo+ID4g
ICBody9hcm0vdmlydC1hY3BpLWJ1aWxkOiBBZGQgUEMtRElNTSBpbiBTUkFUDQo+ID4gICBody9h
cm0vYm9vdDogRXhwb3NlIHRoZSBQQy1ESU1NIG5vZGVzIGluIHRoZSBEVA0KPiA+ICAgaHcvYXJt
L3ZpcnQ6IEFkZCBHRUQgZGV2aWNlIGNvbmZpZ3VyYXRpb24gYW5kIGJ1aWxkIGFtbA0KPiA+ICAg
aHcvYXJtL3ZpcnQ6IEFkZCBHRUQgaXJxIHJvdXRpbmcgYW5kIEVuYWJsZSBtZW1vcnkgaG90cGx1
Zw0KPiA+DQo+ID4gIGRlZmF1bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsgIHwgICA0ICsNCj4g
PiAgaHcvYWNwaS9NYWtlZmlsZS5vYmpzICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBody9hY3Bp
L2dlZC5jICAgICAgICAgICAgICAgICAgICB8IDE5OA0KPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5jICAgICAgICAg
fCAgNTggKysrKy0tLS0tLS0tDQo+ID4gIGh3L2FybS9NYWtlZmlsZS5vYmpzICAgICAgICAgICAg
IHwgICAyICstDQo+ID4gIGh3L2FybS9ib290LmMgICAgICAgICAgICAgICAgICAgIHwgIDQyICsr
KysrKysrKw0KPiA+ICBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMgICAgICAgICB8ICAzMSArKysr
KysNCj4gPiAgaHcvYXJtL3ZpcnQtYWNwaS5jICAgICAgICAgICAgICAgfCAxNjENCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBody9hcm0vdmlydC5jICAgICAgICAgICAg
ICAgICAgICB8ICA5MyArKysrKysrKysrKysrKysrKy0NCj4gPiAgaHcvaTM4Ni9hY3BpLWJ1aWxk
LmMgICAgICAgICAgICAgfCAgIDMgKy0NCj4gPiAgaW5jbHVkZS9ody9hY3BpL2dlZC5oICAgICAg
ICAgICAgfCAgNjEgKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvaHcvYWNwaS9tZW1vcnlfaG90
cGx1Zy5oIHwgIDMxICsrKysrLQ0KPiA+ICBpbmNsdWRlL2h3L2FybS92aXJ0LmggICAgICAgICAg
ICB8ICAgOCArKw0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCA2NDkgaW5zZXJ0aW9ucygrKSwgNDQg
ZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+IDEwMDY0NCBody9hY3BpL2dlZC5jICBjcmVh
dGUgbW9kZSAxMDA2NDQgaHcvYXJtL3ZpcnQtYWNwaS5jICBjcmVhdGUNCj4gPiBtb2RlIDEwMDY0
NCBpbmNsdWRlL2h3L2FjcGkvZ2VkLmgNCj4gPg0K
