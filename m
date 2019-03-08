Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8618594wrx;
        Fri, 8 Mar 2019 09:17:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwc9XecezwJ/W3G7nZd59PI+3eez6M1rXXyiBVCZxG6JYyJv1edUXAB7NKw1us0y/YfZlDt
X-Received: by 2002:a5b:60f:: with SMTP id d15mr17078387ybq.183.1552065432330;
        Fri, 08 Mar 2019 09:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552065432; cv=none;
        d=google.com; s=arc-20160816;
        b=t3T2Kxrke8PcBqhbYHI/sLv8hWeeN7YfAZlG5kGq3dScl431C7VIuWT5hjVKxe/G47
         UJoU75pxP0Xc3QrrxTjvXuNttlYsaXAHNkXWYCcAxB0khvHmxV249a1UmgRm/JFPxdob
         7ifGZ5gnBkXBsQii2KpIsg9L2aD2+os/0g0jyk6QMM2ovt2mwDXX85eLIRsa7KNT9Rnq
         B58ZnxyKs31gBXDtnPzuNpvPkXZHph7AkNV1PdwuKmabYiEH+PVzcF7ImDACQeZwMlGV
         mvO9n7iVKusbdSa73kxbe5d/MJXnfUE/8yhR1g1P51abVoGDBydOANPDowzuJ1WMwhVK
         aHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=ofsBHx9ozlrixD7BmT0FY+8eebPxuFLRuAuVr+ipWnQ=;
        b=Nztufa6iv0rIbIe/AMnJwQrQb9pJt+W7+G0NBFh3oEzvwr5+fCWGirVI9hzqPfXigN
         gOs9clGbCHCZ6ySC7aHqYX1dzYAFM4tL3+w6jsY8QVBv5jvbk1KU1DQUI2OVdvRTCeb0
         LiyqMj0xtEicKJUr0ECM+jt5hOMSNwpR/1zPjWOUrNdwF7qfWbO8dtXEMfSVA3t9JdL7
         u1R9ZUzvy7teR+LAmpHddffd4a6vk3RUfZoBomPuVnDlMcLLpZxRqrBurn4sliBoLRXM
         oHJcm64mAEvEDi6M/RzaznIprPXlN3qhVqDEBua7R+PVFoV5mTXO0V2UfJpfJp0AnTQY
         Zt1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si4766681ybz.82.2019.03.08.09.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 09:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2J7P-0002KC-Pb
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 12:17:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2J7F-0002K0-7s
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:17:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2J7E-0008Im-4F
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:17:01 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45359 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2J7D-0008HR-Qa; Fri, 08 Mar 2019 12:17:00 -0500
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 17738C2A44BB021C0E6C;
	Fri,  8 Mar 2019 17:16:57 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.141]) by
	lhreml707-cah.china.huawei.com ([10.201.108.48]) with mapi id
	14.03.0415.000; Fri, 8 Mar 2019 17:16:48 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v2 01/11] hw/acpi: Move constant definitions to header
	files
Thread-Index: AQHU1aRHxot7uqIPBUKzDQ6nfHBy+aYB50gAgAAQICA=
Date: Fri, 8 Mar 2019 17:16:47 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392F4940@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-2-shameerali.kolothum.thodi@huawei.com>
	<7490ad1c-d4a6-ad5b-ebbf-c27a674d9629@redhat.com>
In-Reply-To: <7490ad1c-d4a6-ad5b-ebbf-c27a674d9629@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v2 01/11] hw/acpi: Move constant definitions
 to header files
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
X-TUID: 8QtC6iILjwJZ

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMDggTWFyY2ggMjAxOSAxNjowOQ0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDEvMTFdIGh3L2FjcGk6IE1vdmUgY29uc3RhbnQgZGVmaW5pdGlvbnMgdG8gaGVhZGVyDQo+IGZp
bGVzDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDMvOC8xOSAxMjo0MiBQTSwgU2hhbWVlciBLb2xvdGh1
bSB3cm90ZToNCj4gPiBGcm9tOiBTZWJhc3RpZW4gQm9ldWYgPHNlYmFzdGllbi5ib2V1ZkBpbnRl
bC5jb20+DQo+ID4NCj4gPiBCeSBtb3ZpbmcgdGhlIGRlZmluaXRpb24gb2YgbWVtb3J5IGhvdHBs
dWcgcmVsYXRlZCBjb25zdGFudHMgdXNlZA0KPiA+IGJ5IEFDUEkgZm9yIGJvdGggQ1BVIGFuZCBt
ZW1vcnksIHRoaXMgY29tbWl0cyBhbGxvd3MgdGhvc2UgdG8gYmUNCj4gPiB1c2VkIGZyb20gIG90
aGVyIHBhcnRzIG9mIHRoZSBjb2RlLg0KPiANCj4gTWF5YmUgZWxhYm9yYXRlIG9uIHdoZXJlIHlv
dSBpbnRlbmQgdG8gdXNlIHRoZW0uDQoNCk9rLg0KIA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
U2ViYXN0aWVuIEJvZXVmIDxzZWJhc3RpZW4uYm9ldWZAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2Vp
LmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5jICAgICAgICAgfCAy
NiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICBpbmNsdWRlL2h3L2FjcGkvbWVtb3J5
X2hvdHBsdWcuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5jIGIvaHcvYWNwaS9tZW1vcnlfaG90cGx1
Zy5jDQo+ID4gaW5kZXggOTIxY2FkMi4uYTZiZWIxMCAxMDA2NDQNCj4gPiAtLS0gYS9ody9hY3Bp
L21lbW9yeV9ob3RwbHVnLmMNCj4gPiArKysgYi9ody9hY3BpL21lbW9yeV9ob3RwbHVnLmMNCj4g
PiBAQCAtOCwzMiArOCw2IEBADQo+ID4gICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+ID4gICNp
bmNsdWRlICJxYXBpL3FhcGktZXZlbnRzLW1pc2MuaCINCj4gPg0KPiA+IC0jZGVmaW5lIE1FTU9S
WV9TTE9UU19OVU1CRVIgICAgICAgICAgIk1ETlIiDQo+ID4gLSNkZWZpbmUgTUVNT1JZX0hPVFBM
VUdfSU9fUkVHSU9OICAgICAiSFBNUiINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9BRERSX0xP
VyAgICAgICAgICJNUkJMIg0KPiA+IC0jZGVmaW5lIE1FTU9SWV9TTE9UX0FERFJfSElHSCAgICAg
ICAgIk1SQkgiDQo+ID4gLSNkZWZpbmUgTUVNT1JZX1NMT1RfU0laRV9MT1cgICAgICAgICAiTVJM
TCINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9TSVpFX0hJR0ggICAgICAgICJNUkxIIg0KPiA+
IC0jZGVmaW5lIE1FTU9SWV9TTE9UX1BST1hJTUlUWSAgICAgICAgIk1QWCINCj4gPiAtI2RlZmlu
ZSBNRU1PUllfU0xPVF9FTkFCTEVEICAgICAgICAgICJNRVMiDQo+ID4gLSNkZWZpbmUgTUVNT1JZ
X1NMT1RfSU5TRVJUX0VWRU5UICAgICAiTUlOUyINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9S
RU1PVkVfRVZFTlQgICAgICJNUk1WIg0KPiA+IC0jZGVmaW5lIE1FTU9SWV9TTE9UX0VKRUNUICAg
ICAgICAgICAgIk1FSiINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9TTEVDVE9SICAgICAgICAg
ICJNU0VMIg0KPiA+IC0jZGVmaW5lIE1FTU9SWV9TTE9UX09TVF9FVkVOVCAgICAgICAgIk1PRVYi
DQo+ID4gLSNkZWZpbmUgTUVNT1JZX1NMT1RfT1NUX1NUQVRVUyAgICAgICAiTU9TQyINCj4gPiAt
I2RlZmluZSBNRU1PUllfU0xPVF9MT0NLICAgICAgICAgICAgICJNTENLIg0KPiA+IC0jZGVmaW5l
IE1FTU9SWV9TTE9UX1NUQVRVU19NRVRIT0QgICAgIk1SU1QiDQo+ID4gLSNkZWZpbmUgTUVNT1JZ
X1NMT1RfQ1JTX01FVEhPRCAgICAgICAiTUNSUyINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9P
U1RfTUVUSE9EICAgICAgICJNT1NUIg0KPiA+IC0jZGVmaW5lIE1FTU9SWV9TTE9UX1BST1hJTUlU
WV9NRVRIT0QgIk1QWE0iDQo+ID4gLSNkZWZpbmUgTUVNT1JZX1NMT1RfRUpFQ1RfTUVUSE9EICAg
ICAiTUVKMCINCj4gPiAtI2RlZmluZSBNRU1PUllfU0xPVF9OT1RJRllfTUVUSE9EICAgICJNVEZZ
Ig0KPiA+IC0jZGVmaW5lIE1FTU9SWV9TTE9UX1NDQU5fTUVUSE9EICAgICAgIk1TQ04iDQo+ID4g
LSNkZWZpbmUgTUVNT1JZX0hPVFBMVUdfREVWSUNFICAgICAgICAiTUhQRCINCj4gPiAtI2RlZmlu
ZSBNRU1PUllfSE9UUExVR19JT19MRU4gICAgICAgICAyNA0KPiA+IC0jZGVmaW5lIE1FTU9SWV9E
RVZJQ0VTX0NPTlRBSU5FUiAgICAgIlxcX1NCLk1IUEMiDQo+IA0KPiBEbyB3ZSByZWFsbHkgbmVl
ZCB0byBleHBvc2UgYWxsIG9mIHRoZW0uIEkganVzdCBjYW4gc2VlDQo+IE1FTU9SWV9TTE9UX1ND
QU5fTUVUSE9EIHVzZWQgaW4gaHcvYWNwaS9nZWQuYz8gTWF5YmUgSSBtaXNzZWQgc29tZQ0KPiB0
aG91Z2g/DQoNClRoYXQgaXMgcmlnaHQuIFRoaXMgd2FzIHRha2VuIGZyb20gdGhlIE5lbXUgYXBw
cm9hY2ggYW5kIEkgdGhvdWdodCBpdCBtaWdodCBiZQ0KdXNlZnVsIGluIGZ1dHVyZSBjaGFuZ2Vz
LiBCdXQgaWYgdGhlcmUgaXMgbm8gbWFqb3IgbW90aXZhdGlvbiBpbiBrZWVwaW5nIHRoaXMgaW4g
aGVhZGVyLA0KSSBtYXkgc2tpcCB0aGlzIHBhdGNoIGFuZCBqdXN0IG1vdmUgdGhlIE1FTU9SWV9T
TE9UX1NDQU5fTUVUSE9ELg0KDQo+IEFsc28gYXQgdGhlIGJlZ2lubmluZyBJIHRyaWVkIHRvIGZp
bmQgc29tZSBzcGVjaWZpY2F0aW9uIGRldGFpbHMgZm9yDQo+IHRob3NlIHN0dWZmIGJ1dCBJIGZh
aWxlZC4gSXQgd291bGQgYmUgaGVscGZ1bCBmb3IgYSBub24gc3BlY2lhbGlzdA0KPiByZWFkZXIg
dG8gYWRkIGEgY29tbWVudCB0aGF0IGhlbHBzIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyBwYXJ0IG9m
IGENCj4gc3BlY2lmaWNhdGlvbiAobGluaz8pIGFuZCB3aGF0IGlzIGFyYml0cmFyaWx5IGRlZmlu
ZWQuDQoNCk9rLiBJIGNvdWxkIG9ubHkgZmluZCB0aGlzIE5lbXUgd2lraSBkZXNjcmlwdGlvbiBo
ZXJlDQpodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbmVtdS93aWtpL01lbW9yeS1ob3RwbHVnDQoN
Ck5vdCBzdXJlIFFlbXUgb3IgQUNQSSBoYXMgYSBzaW1pbGFyIGRvY3VtZW50YXRpb24gZWxzZXdo
ZXJlLg0KDQpUaGFua3MsDQpTaGFtZWVyDQoNCj4gVGhhbmtzDQo+IA0KPiBFcmljDQo+ID4gLQ0K
PiA+ICBzdGF0aWMgdWludDE2X3QgbWVtaHBfaW9fYmFzZTsNCj4gPg0KPiA+ICBzdGF0aWMgQUNQ
SU9TVEluZm8gKmFjcGlfbWVtb3J5X2RldmljZV9zdGF0dXMoaW50IHNsb3QsIE1lbVN0YXR1cw0K
PiAqbWRldikNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9hY3BpL21lbW9yeV9ob3RwbHVn
LmgNCj4gYi9pbmNsdWRlL2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuaA0KPiA+IGluZGV4IDc3YzY1
NzYuLmZiZmNiZTYgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9ody9hY3BpL21lbW9yeV9ob3Rw
bHVnLmgNCj4gPiArKysgYi9pbmNsdWRlL2h3L2FjcGkvbWVtb3J5X2hvdHBsdWcuaA0KPiA+IEBA
IC01LDYgKzUsMzIgQEANCj4gPiAgI2luY2x1ZGUgImh3L2FjcGkvYWNwaS5oIg0KPiA+ICAjaW5j
bHVkZSAiaHcvYWNwaS9hbWwtYnVpbGQuaCINCj4gPg0KPiA+ICsjZGVmaW5lIE1FTU9SWV9TTE9U
U19OVU1CRVIgICAgICAgICAgIk1ETlIiDQo+ID4gKyNkZWZpbmUgTUVNT1JZX0hPVFBMVUdfSU9f
UkVHSU9OICAgICAiSFBNUiINCj4gPiArI2RlZmluZSBNRU1PUllfU0xPVF9BRERSX0xPVyAgICAg
ICAgICJNUkJMIg0KPiA+ICsjZGVmaW5lIE1FTU9SWV9TTE9UX0FERFJfSElHSCAgICAgICAgIk1S
QkgiDQo+ID4gKyNkZWZpbmUgTUVNT1JZX1NMT1RfU0laRV9MT1cgICAgICAgICAiTVJMTCINCj4g
PiArI2RlZmluZSBNRU1PUllfU0xPVF9TSVpFX0hJR0ggICAgICAgICJNUkxIIg0KPiA+ICsjZGVm
aW5lIE1FTU9SWV9TTE9UX1BST1hJTUlUWSAgICAgICAgIk1QWCINCj4gPiArI2RlZmluZSBNRU1P
UllfU0xPVF9FTkFCTEVEICAgICAgICAgICJNRVMiDQo+ID4gKyNkZWZpbmUgTUVNT1JZX1NMT1Rf
SU5TRVJUX0VWRU5UICAgICAiTUlOUyINCj4gPiArI2RlZmluZSBNRU1PUllfU0xPVF9SRU1PVkVf
RVZFTlQgICAgICJNUk1WIg0KPiA+ICsjZGVmaW5lIE1FTU9SWV9TTE9UX0VKRUNUICAgICAgICAg
ICAgIk1FSiINCj4gPiArI2RlZmluZSBNRU1PUllfU0xPVF9TTEVDVE9SICAgICAgICAgICJNU0VM
Ig0KPiA+ICsjZGVmaW5lIE1FTU9SWV9TTE9UX09TVF9FVkVOVCAgICAgICAgIk1PRVYiDQo+ID4g
KyNkZWZpbmUgTUVNT1JZX1NMT1RfT1NUX1NUQVRVUyAgICAgICAiTU9TQyINCj4gPiArI2RlZmlu
ZSBNRU1PUllfU0xPVF9MT0NLICAgICAgICAgICAgICJNTENLIg0KPiA+ICsjZGVmaW5lIE1FTU9S
WV9TTE9UX1NUQVRVU19NRVRIT0QgICAgIk1SU1QiDQo+ID4gKyNkZWZpbmUgTUVNT1JZX1NMT1Rf
Q1JTX01FVEhPRCAgICAgICAiTUNSUyINCj4gPiArI2RlZmluZSBNRU1PUllfU0xPVF9PU1RfTUVU
SE9EICAgICAgICJNT1NUIg0KPiA+ICsjZGVmaW5lIE1FTU9SWV9TTE9UX1BST1hJTUlUWV9NRVRI
T0QgIk1QWE0iDQo+ID4gKyNkZWZpbmUgTUVNT1JZX1NMT1RfRUpFQ1RfTUVUSE9EICAgICAiTUVK
MCINCj4gPiArI2RlZmluZSBNRU1PUllfU0xPVF9OT1RJRllfTUVUSE9EICAgICJNVEZZIg0KPiA+
ICsjZGVmaW5lIE1FTU9SWV9TTE9UX1NDQU5fTUVUSE9EICAgICAgIk1TQ04iDQo+ID4gKyNkZWZp
bmUgTUVNT1JZX0hPVFBMVUdfREVWSUNFICAgICAgICAiTUhQRCINCj4gPiArI2RlZmluZSBNRU1P
UllfSE9UUExVR19JT19MRU4gICAgICAgICAyNA0KPiA+ICsjZGVmaW5lIE1FTU9SWV9ERVZJQ0VT
X0NPTlRBSU5FUiAgICAgIlxcX1NCLk1IUEMiDQo+ID4gKw0KPiA+ICAvKioNCj4gPiAgICogTWVt
U3RhdHVzOg0KPiA+ICAgKiBAaXNfcmVtb3Zpbmc6IHRoZSBtZW1vcnkgZGV2aWNlIGluIHNsb3Qg
aGFzIGJlZW4gcmVxdWVzdGVkIHRvIGJlDQo+IGVqZWN0ZWQuDQo+ID4NCg==
