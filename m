Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1637150wrx;
        Fri, 29 Mar 2019 02:41:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWMw/JR0I97oJ0RfM0TDAgpId9W+IuvYnlnTrvPIiQZjK+CbtrbukCjg2DujnZ1P6h+Xvh
X-Received: by 2002:a24:4d12:: with SMTP id l18mr3628634itb.66.1553852493477;
        Fri, 29 Mar 2019 02:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553852493; cv=none;
        d=google.com; s=arc-20160816;
        b=Lerr7uxo0MmpwonBX/uxcR/h3NEof5gP8xh0Y+DK0lZ0eKeWDmZ4LidxddkPYCY60H
         SEz+WpvUue4E3lh7Mf7NAt9SIJHlFNKYqXDY64s1LSe5AJZAHDaZYMMMDl+2v8DK5rDL
         0jUrzN9g2sj4A8gzpzxoFXY/gJZUVH9mr7tx4BITS1phvGOeeYBhcTgHKUltVH9NxBot
         m/HTcPwKQ5eHG+Nc4mcwF0nk/EPqIsZ+VDRf6c8tNVnP2+jablnusqWmP/Zr4OAhtfI8
         NLyRD3oNyxkCyY2kDn3uE/+uXL4unRvJCsPTypuYxQQhVb/WxlXTfN2VjAsWayOAEPrh
         cYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=7Hs8JamLPEIUWuuZZpzS/IsELkGgYRLidbNaaY0FDks=;
        b=pb/E5U1WhbkFi/QRR/tNvcuJ2uJzI2/v8tjltLV1J4B5q0A2NHNnAJEm3rA/yQGjnn
         KbUqdTPqZyHLrW0aUQtomJKwWFDYgFG9C04LTeiXdT3hfMYtvXk5IVosqORvAIaU85Gr
         QPBrgcVA4jaS822dSfVylnS7BnAPWMl8zy4arU9DP5wBbtXkGQF58WH4vzQSVsRczhO7
         jHsrthB4BrgUSkH0yxw1pECQIxfeWGPlWU+jSJ+swYORlIGUSNOa0y27gSWhipb85eic
         jB2rjjyIUFQob2mM96+ihXwE42+YCYORPctGrRqoPABwJFqLHfrbjPKAes50YGWQDBqR
         gztw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b203si840550itc.8.2019.03.29.02.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 02:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9o0y-0002s2-Mr
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 05:41:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9o0k-0002qQ-PR
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9o0j-0004mJ-7T
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:41:18 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45375 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9o0i-0004h8-Uf; Fri, 29 Mar 2019 05:41:17 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 5D108307B13D1E878140;
	Fri, 29 Mar 2019 09:41:12 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.165]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Fri, 29 Mar 2019 09:41:04 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>
Thread-Topic: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAAfUA=
Date: Fri, 29 Mar 2019 09:41:04 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839338308@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
In-Reply-To: <98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
 feature "fdt"
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
Cc: Leif Lindholm <Leif.Lindholm@arm.com>, Laszlo
	Ersek <lersek@redhat.com>, Linuxarm <linuxarm@huawei.com>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFUUHldWJP5O

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAyOSBNYXJjaCAyMDE5
IDA5OjMyDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtYXJt
QG5vbmdudS5vcmc7IGltYW1tZWRvQHJlZGhhdC5jb207DQo+IHBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZzsgc2hhbm5vbi56aGFvc2xAZ21haWwuY29tOw0KPiBzYW1lb0BsaW51eC5pbnRlbC5jb207
IHNlYmFzdGllbi5ib2V1ZkBpbnRlbC5jb20NCj4gQ2M6IExpbnV4YXJtIDxsaW51eGFybUBodWF3
ZWkuY29tPjsgeHV3ZWkgKE8pIDx4dXdlaTVAaHVhd2VpLmNvbT47DQo+IExhc3psbyBFcnNlayA8
bGVyc2VrQHJlZGhhdC5jb20+OyBBcmQgQmllc2hldXZlbA0KPiA8YXJkLmJpZXNoZXV2ZWxAbGlu
YXJvLm9yZz47IExlaWYgTGluZGhvbG0gPExlaWYuTGluZGhvbG1AYXJtLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MyAwNy8xMF0gaHcvYXJtL3ZpcnQ6IEludHJvZHVjZSBvcHQtaW4gZmVh
dHVyZSAiZmR0Ig0KPiANCj4gSGkgU2hhbWVlciwNCj4gDQo+IFsgKyBMYXN6bG8sIEFyZCwgTGVp
ZiBdDQo+IA0KPiBPbiAzLzIxLzE5IDExOjQ3IEFNLCBTaGFtZWVyIEtvbG90aHVtIHdyb3RlOg0K
PiA+IFRoaXMgaXMgdG8gZGlzYWJsZS9lbmFibGUgcG9wdWxhdGluZyBEVCBub2RlcyBpbiBjYXNl
DQo+ID4gYW55IGNvbmZsaWN0IHdpdGggYWNwaSB0YWJsZXMuIFRoZSBkZWZhdWx0IGlzICJvZmYi
Lg0KPiBUaGUgbmFtZSBvZiB0aGUgb3B0aW9uIHNvdW5kcyBtaXNsZWFkaW5nIHRvIG1lLiBBbHNv
IHdlIGRvbid0IHJlYWxseQ0KPiBrbm93IHRoZSBzY29wZSBvZiB0aGUgZGlzYWJsZW1lbnQuIEF0
IHRoZSBtb21lbnQgdGhpcyBqdXN0IGFpbXMgdG8NCj4gcHJldmVudCB0aGUgaG90cGx1Z2dhYmxl
IGR0IG5vZGVzIGZyb20gYmVpbmcgYWRkZWQgaWYgd2UgYm9vdCBpbiBBQ1BJIG1vZGUuDQoNClll
cywgSSB3YXMgbm90IHZlcnkgaGFwcHkgd2l0aCB0aGUgbmFtZSAiZmR0Ii4gSWYgdGhpcyBpcyBu
b3QgdXNlZnVsIG90aGVyIHRoYW4NCnRoaXMgZGV2aWNlIG1lbW9yeSBjb25mbGljdCBjYXNlLCB0
aGVuIHdlIGNhbiBiZSBtb3JlIHNwZWNpZmljLiBCdXQgSSBhbSBub3Qgc3VyZQ0Kd2UgbWlnaHQg
bmVlZCB0aGlzIGZvciBhbnkgb3RoZXIgZnV0dXJlIGNvbmZsaWN0cywgaGVuY2UgYSBtb3JlIGdl
bmVyaWMgbmFtZS4gDQoNCk1heSBiZSAiZm9yY2VfZmR0IiBvciAiZGltbV9mZHQiPyBJIGFtIG9w
ZW4gdG8gc3VnZ2VzdGlvbnMuDQoNCj4gPg0KPiA+IFRoaXMgd2lsbCBiZSB1c2VkIGluIHN1YnNl
cXVlbnQgcGF0Y2ggd2hlcmUgY29sZCBwbHVnDQo+ID4gZGV2aWNlLW1lbW9yeSBzdXBwb3J0IGlz
IGFkZGVkIGZvciBEVCBib290Lg0KPiBJIGFtIGNvbmNlcm5lZCBhYm91dCB0aGUgZmFjdCB0aGF0
IGluIGR0IG1vZGUsIGJ5IGRlZmF1bHQsIHlvdSB3b24ndCBzZWUNCj4gYW55IFBDRElNTSBub2Rl
cy4NCg0KVHJ1ZS4gQnV0IGlzIHRoZXJlIGFueSBvdGhlciB3YXkgdG8gZGV0ZWN0IHRoYXQgdGhl
IEd1ZXN0IGlzIHVzaW5nIERUPw0KDQpUaGFua3MsDQpTaGFtZWVyDQoNCj4gPiBJZiBEVCBtZW1v
cnkgbm9kZSBzdXBwb3J0IGlzIGFkZGVkIGZvciBjb2xkLXBsdWdnZWQgZGV2aWNlDQo+ID4gbWVt
b3J5LCB0aG9zZSBtZW1vcnkgd2lsbCBiZSB2aXNpYmxlIHRvIEd1ZXN0IGtlcm5lbCB2aWENCj4g
PiBVRUZJIEdldE1lbW9yeU1hcCgpIGFuZCBnZXRzIHRyZWF0ZWQgYXMgZWFybHkgYm9vdCBtZW1v
cnkuDQo+IERvbid0IHdlIGhhdmUgYW4gaXNzdWUgaW4gVUVGSSB0aGVuLiBOb3JtYWxseSB0aGUg
U1JBVCBpbmRpY2F0ZXMgd2hldGhlcg0KPiB0aGUgc2xvdHMgYXJlIGhvdHBsdWdnYWJsZSBvciBu
b3QuIFNob3VsZG4ndCB0aGUgVUVGSSBjb2RlIGxvb2sgYXQgdGhpcw0KPiBpbmZvLg0KPiA+IEhl
bmNlIG1lbW9yeSBiZWNvbWVzIG5vbiBob3QtdW4tdW5wbHVnZ2FibGUgZXZlbiBpZiBHdWVzdA0K
PiA+IGlzIGJvb3RlZCBpbiBBQ1BJIG1vZGUuDQo+IA0KPiANCj4gDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBTaGFtZWVyIEtvbG90aHVtIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdl
aS5jb20+DQo+ID4gLS0tDQo+ID4gIGh3L2FybS92aXJ0LmMgICAgICAgICB8IDIzICsrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvaHcvYXJtL3ZpcnQuaCB8ICAxICsNCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
aHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMNCj4gPiBpbmRleCAxM2RiMGU5Li5iNjAyMTUx
IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9ody9hcm0vdmlydC5j
DQo+ID4gQEAgLTE3MTcsNiArMTcxNywyMCBAQCBzdGF0aWMgdm9pZCB2aXJ0X3NldF9oaWdobWVt
KE9iamVjdCAqb2JqLCBib29sDQo+IHZhbHVlLCBFcnJvciAqKmVycnApDQo+ID4gICAgICB2bXMt
PmhpZ2htZW0gPSB2YWx1ZTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBib29sIHZpcnRfZ2V0
X2ZkdChPYmplY3QgKm9iaiwgRXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+ID4gKyAgICBWaXJ0TWFj
aGluZVN0YXRlICp2bXMgPSBWSVJUX01BQ0hJTkUob2JqKTsNCj4gPiArDQo+ID4gKyAgICByZXR1
cm4gdm1zLT51c2VfZmR0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB2aXJ0X3Nl
dF9mZHQoT2JqZWN0ICpvYmosIGJvb2wgdmFsdWUsIEVycm9yICoqZXJycCkNCj4gPiArew0KPiA+
ICsgICAgVmlydE1hY2hpbmVTdGF0ZSAqdm1zID0gVklSVF9NQUNISU5FKG9iaik7DQo+ID4gKw0K
PiA+ICsgICAgdm1zLT51c2VfZmR0ID0gdmFsdWU7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRp
YyBib29sIHZpcnRfZ2V0X2l0cyhPYmplY3QgKm9iaiwgRXJyb3IgKiplcnJwKQ0KPiA+ICB7DQo+
ID4gICAgICBWaXJ0TWFjaGluZVN0YXRlICp2bXMgPSBWSVJUX01BQ0hJTkUob2JqKTsNCj4gPiBA
QCAtMjAwNSw2ICsyMDE5LDE1IEBAIHN0YXRpYyB2b2lkIHZpcnRfaW5zdGFuY2VfaW5pdChPYmpl
Y3QgKm9iaikNCj4gPiAgICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfZGVzY3JpcHRpb24ob2JqLCAi
Z2ljLXZlcnNpb24iLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
U2V0IEdJQyB2ZXJzaW9uLiAiDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJWYWxpZCB2YWx1ZXMgYXJlIDIsIDMgYW5kIGhvc3QiLA0KPiBOVUxMKTsNCj4gPiArICAg
IC8qIGZkdCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0ICovDQo+ID4gKyAgICB2bXMtPnVzZV9mZHQg
PSBmYWxzZTsNCj4gPiArICAgIG9iamVjdF9wcm9wZXJ0eV9hZGRfYm9vbChvYmosICJmZHQiLCB2
aXJ0X2dldF9mZHQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmlydF9zZXRf
ZmR0LCBOVUxMKTsNCj4gPiArICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfZGVzY3JpcHRpb24ob2Jq
LCAiZmR0IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlNldCBv
bi9vZmYgdG8gZW5hYmxlL2Rpc2FibGUNCj4gZGV2aWNlIHRyZWUgIg0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAibm9kZXMgaW4gY2FzZSBhbnkgY29uZmxpY3Qgd2l0
aA0KPiBBQ1BJIg0KPiBpbiBjYXNlIG9mDQo+IA0KPiBUaGFua3MNCj4gDQo+IEVyaWMNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIihlZzogZGV2aWNlIG1lbW9yeSBu
b2RlKSIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOw0K
PiA+DQo+ID4gICAgICB2bXMtPmhpZ2htZW1fZWNhbSA9ICF2bWMtPm5vX2hpZ2htZW1fZWNhbTsN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FybS92aXJ0LmggYi9pbmNsdWRlL2h3
L2FybS92aXJ0LmgNCj4gPiBpbmRleCBjNWU0Yzk2Li4xNGIyZTBhIDEwMDY0NA0KPiA+IC0tLSBh
L2luY2x1ZGUvaHcvYXJtL3ZpcnQuaA0KPiA+ICsrKyBiL2luY2x1ZGUvaHcvYXJtL3ZpcnQuaA0K
PiA+IEBAIC0xMTksNiArMTE5LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiA+ICAgICAgYm9vbCBo
aWdobWVtX2VjYW07DQo+ID4gICAgICBib29sIGl0czsNCj4gPiAgICAgIGJvb2wgdmlydDsNCj4g
PiArICAgIGJvb2wgdXNlX2ZkdDsNCj4gPiAgICAgIGludDMyX3QgZ2ljX3ZlcnNpb247DQo+ID4g
ICAgICBWaXJ0SU9NTVVUeXBlIGlvbW11Ow0KPiA+ICAgICAgc3RydWN0IGFybV9ib290X2luZm8g
Ym9vdGluZm87DQo+ID4NCg==
