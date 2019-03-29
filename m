Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1914328wrx;
        Fri, 29 Mar 2019 07:09:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwJfQAadwbjxNot0JwgvTBue9vGthVHhZ35DFhl2a08Bx1vyf+myy7/rENvZtVBoek3jiu
X-Received: by 2002:a6b:4419:: with SMTP id r25mr32485838ioa.12.1553868556931;
        Fri, 29 Mar 2019 07:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553868556; cv=none;
        d=google.com; s=arc-20160816;
        b=WUVburIwpxeOwLMhmUbnFx4cY648duQ+00MkOcmHXgCH1Ct53wAqUlyC+ANHPmWrLc
         VOOr5VexxtKaRIcv8Yf+cgJC9Vy3zinmFU3RXD6x9IR8n5eURk/iVXqSWXpeUPr38uli
         MEnCYTIkh9osIY4bmAaNDaUXYcxkdjA7EVSAj2rYKTerjyHrRwYLKQXhU5PhU768mj1f
         EOrkgSa6heiCx9Vf/czRYKe43O91TxSRr/SFQQVXIypBdHPqd4cdmDSXsyeuO/W9f1XK
         CWHVH0fMVvnDj0jV43LeW5GpmvojWcAlzJx/KY7Auo8G0kybMddYHgULwg7d5XpgJ4H9
         cQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=OOTcDyY5NrFldL4p7cGRbjUoM4DnEryb8ghBpL4Zj+Q=;
        b=RogRRDoC9fiBRX9/mfZ0p7AZPcnURWMUNqqwrHwcu7Mhqfq3o7klvKjgLS2YSz3bCb
         eYbebZpyLMP1uAetN2vZqoK4ljsNP+t/DOPRTngV/c+HOF/jW1VPbewreoHYb5/MEhd7
         BstjTN0ECpkqajc2fB0KBl+nbwtTw+Kdyl6D4aEPlTM2gr2VQSzL4+1fWEV0Hy6sf3EP
         ldQuISQySaYfugi1knlfXlc73wvxLbGjQfhkOeuMcF1c+J0ozqgebd72TZAZjRzCNPE6
         PbzZ1MGI6c4nPfD2+f/q5s0WB8iQjoU6M3hnJ6wgkCJ5VdZ5tvSoVxuk4lqTDO/Z8yLD
         fSnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si1155039iog.63.2019.03.29.07.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 07:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:53654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9sC4-00058s-5i
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 10:09:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9sBu-00058N-HF
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 10:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9sBt-0006ll-02
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 10:09:06 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45381 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9sBs-0006ki-Le; Fri, 29 Mar 2019 10:09:04 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 97D262B682516683A115;
	Fri, 29 Mar 2019 14:09:01 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.165]) by
	lhreml709-cah.china.huawei.com ([10.201.108.32]) with mapi id
	14.03.0415.000; Fri, 29 Mar 2019 14:08:55 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
	feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAFAfCAADi+gIAAAGKAgAALywCAAAJcEA==
Date: Fri, 29 Mar 2019 14:08:54 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839338809@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
In-Reply-To: <a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
	Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sxjhdC1EHUEX

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMjkgTWFyY2ggMjAxOSAxMzo1Ng0K
PiBUbzogQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+DQo+IENjOiBw
ZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNhbWVvQGxpbnV4LmludGVsLmNvbTsNCj4gcWVtdS1k
ZXZlbEBub25nbnUub3JnOyBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFtZWVyYWxp
LmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBMaW51eGFybQ0KPiA8bGludXhhcm1AaHVhd2Vp
LmNvbT47IHNoYW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gcWVtdS1hcm1Abm9uZ251Lm9yZzsg
eHV3ZWkgKE8pIDx4dXdlaTVAaHVhd2VpLmNvbT47DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IHNl
YmFzdGllbi5ib2V1ZkBpbnRlbC5jb207IExhc3psbyBFcnNlaw0KPiA8bGVyc2VrQHJlZGhhdC5j
b20+OyBMZWlmIExpbmRob2xtIDxMZWlmLkxpbmRob2xtQGFybS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUWVtdS1kZXZlbF0gW1BBVENIIHYzIDA3LzEwXSBody9hcm0vdmlydDogSW50cm9kdWNlIG9w
dC1pbg0KPiBmZWF0dXJlICJmZHQiDQo+IA0KPiBIaSBBcmQsDQo+IA0KPiBPbiAzLzI5LzE5IDI6
MTQgUE0sIEFyZCBCaWVzaGV1dmVsIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjkgTWFyIDIwMTkgYXQg
MTQ6MTIsIEF1Z2VyIEVyaWMgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4+DQo+
ID4+IEhpIFNoYW1lZXIsDQo+ID4+DQo+ID4+IE9uIDMvMjkvMTkgMTA6NTkgQU0sIFNoYW1lZXJh
bGkgS29sb3RodW0gVGhvZGkgd3JvdGU6DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEF1Z2VyIEVyaWMgW21haWx0bzplcmljLmF1
Z2VyQHJlZGhhdC5jb21dDQo+ID4+Pj4gU2VudDogMjkgTWFyY2ggMjAxOSAwOTozMg0KPiA+Pj4+
IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRo
b2RpQGh1YXdlaS5jb20+Ow0KPiA+Pj4+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1A
bm9uZ251Lm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsNCj4gPj4+PiBwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc7IHNoYW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gPj4+PiBzYW1lb0BsaW51
eC5pbnRlbC5jb207IHNlYmFzdGllbi5ib2V1ZkBpbnRlbC5jb20NCj4gPj4+PiBDYzogTGludXhh
cm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyB4dXdlaSAoTykNCj4gPHh1d2VpNUBodWF3ZWkuY29t
PjsNCj4gPj4+PiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPjsgQXJkIEJpZXNoZXV2
ZWwNCj4gPj4+PiA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz47IExlaWYgTGluZGhvbG0gPExl
aWYuTGluZGhvbG1AYXJtLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA3LzEw
XSBody9hcm0vdmlydDogSW50cm9kdWNlIG9wdC1pbiBmZWF0dXJlICJmZHQiDQo+ID4+Pj4NCj4g
Pj4+PiBIaSBTaGFtZWVyLA0KPiA+Pj4+DQo+ID4+Pj4gWyArIExhc3psbywgQXJkLCBMZWlmIF0N
Cj4gPj4+Pg0KPiA+Pj4+IE9uIDMvMjEvMTkgMTE6NDcgQU0sIFNoYW1lZXIgS29sb3RodW0gd3Jv
dGU6DQo+ID4+Pj4+IFRoaXMgaXMgdG8gZGlzYWJsZS9lbmFibGUgcG9wdWxhdGluZyBEVCBub2Rl
cyBpbiBjYXNlDQo+ID4+Pj4+IGFueSBjb25mbGljdCB3aXRoIGFjcGkgdGFibGVzLiBUaGUgZGVm
YXVsdCBpcyAib2ZmIi4NCj4gPj4+PiBUaGUgbmFtZSBvZiB0aGUgb3B0aW9uIHNvdW5kcyBtaXNs
ZWFkaW5nIHRvIG1lLiBBbHNvIHdlIGRvbid0IHJlYWxseQ0KPiA+Pj4+IGtub3cgdGhlIHNjb3Bl
IG9mIHRoZSBkaXNhYmxlbWVudC4gQXQgdGhlIG1vbWVudCB0aGlzIGp1c3QgYWltcyB0bw0KPiA+
Pj4+IHByZXZlbnQgdGhlIGhvdHBsdWdnYWJsZSBkdCBub2RlcyBmcm9tIGJlaW5nIGFkZGVkIGlm
IHdlIGJvb3QgaW4gQUNQSQ0KPiBtb2RlLg0KPiA+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoaXMg
d2lsbCBiZSB1c2VkIGluIHN1YnNlcXVlbnQgcGF0Y2ggd2hlcmUgY29sZCBwbHVnDQo+ID4+Pj4+
IGRldmljZS1tZW1vcnkgc3VwcG9ydCBpcyBhZGRlZCBmb3IgRFQgYm9vdC4NCj4gPj4+PiBJIGFt
IGNvbmNlcm5lZCBhYm91dCB0aGUgZmFjdCB0aGF0IGluIGR0IG1vZGUsIGJ5IGRlZmF1bHQsIHlv
dSB3b24ndCBzZWUNCj4gPj4+PiBhbnkgUENESU1NIG5vZGVzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJ
ZiBEVCBtZW1vcnkgbm9kZSBzdXBwb3J0IGlzIGFkZGVkIGZvciBjb2xkLXBsdWdnZWQgZGV2aWNl
DQo+ID4+Pj4+IG1lbW9yeSwgdGhvc2UgbWVtb3J5IHdpbGwgYmUgdmlzaWJsZSB0byBHdWVzdCBr
ZXJuZWwgdmlhDQo+ID4+Pj4+IFVFRkkgR2V0TWVtb3J5TWFwKCkgYW5kIGdldHMgdHJlYXRlZCBh
cyBlYXJseSBib290IG1lbW9yeS4NCj4gPj4+PiBEb24ndCB3ZSBoYXZlIGFuIGlzc3VlIGluIFVF
RkkgdGhlbi4gTm9ybWFsbHkgdGhlIFNSQVQgaW5kaWNhdGVzIHdoZXRoZXINCj4gPj4+PiB0aGUg
c2xvdHMgYXJlIGhvdHBsdWdnYWJsZSBvciBub3QuIFNob3VsZG4ndCB0aGUgVUVGSSBjb2RlIGxv
b2sgYXQgdGhpcw0KPiA+Pj4+IGluZm8uDQo+ID4+Pg0KPiA+Pj4gU29ycnkgSSBtaXNzZWQgdGhp
cyBwYXJ0LiBZZXMsIHRoYXQgd2lsbCBiZSBhIG1vcmUgY2xlYW5lciBzb2x1dGlvbi4NCj4gPj4+
DQo+ID4+PiBBbHNvLCB0byBiZSBtb3JlIGNsZWFyIG9uIHdoYXQgaGFwcGVucywNCj4gPj4+DQo+
ID4+PiBHdWVzdCBBQ1BJIGJvb3Qgd2l0aCAiZmR0PW9uIiAsDQo+ID4+Pg0KPiA+Pj4gRnJvbSBr
ZXJuZWwgbG9nLA0KPiA+Pj4NCj4gPj4+IFsgICAgMC4wMDAwMDBdIEVhcmx5IG1lbW9yeSBub2Rl
IHJhbmdlcw0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAw
MDAwNDAwMDAwMDAtMHgwMDAwMDAwMGJiZjVmZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBu
b2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYmJmNjAwMDAtMHgwMDAwMDAwMGJiZmZmZmZmXQ0K
PiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYmMwMDAw
MDAtMHgwMDAwMDAwMGJjMDJmZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDog
W21lbQ0KPiAweDAwMDAwMDAwYmMwMzAwMDAtMHgwMDAwMDAwMGJjMzZmZmZmXQ0KPiA+Pj4gWyAg
ICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYmMzNzAwMDAtMHgwMDAw
MDAwMGJmNjRmZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAw
eDAwMDAwMDAwYmY2NTAwMDAtMHgwMDAwMDAwMGJmNmRmZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAw
MF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYmY2ZTAwMDAtMHgwMDAwMDAwMGJmNmVm
ZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAw
YmY2ZjAwMDAtMHgwMDAwMDAwMGJmODBmZmZmXQ0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gICBub2Rl
ICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYmY4MTAwMDAtMHgwMDAwMDAwMGJmZmZmZmZmXQ0KPiA+
Pj4gWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbQ0KPiAweDAwMDAwMDAwYzAwMDAwMDAt
MHgwMDAwMDAwMGZmZmZmZmZmXSAgLS0+IFRoaXMgaXMgdGhlIGhvdHBsdWdnYWJsZSBtZW1vcnkN
Cj4gbm9kZSBmcm9tIERULg0KPiA+Pj4gWyAgICAwLjAwMDAwMF0gWmVyb2VkIHN0cnVjdCBwYWdl
IGluIHVuYXZhaWxhYmxlIHJhbmdlczogMTA0MCBwYWdlcw0KPiA+Pj4gWyAgICAwLjAwMDAwMF0g
SW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbQ0KPiAweDAwMDAwMDAwNDAwMDAwMDAtMHgwMDAwMDAw
MGZmZmZmZmZmXQ0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBHdWVzdCBBQ1BJIGJvb3Qgd2l0aCAiZmR0
PW9mZiIgLA0KPiA+Pj4NCj4gPj4+IFsgICAgMC4wMDAwMDBdIE1vdmFibGUgem9uZSBzdGFydCBm
b3IgZWFjaCBub2RlDQo+ID4+PiBbICAgIDAuMDAwMDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5n
ZXMNCj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0NCj4gMHgwMDAwMDAwMDQw
MDAwMDAwLTB4MDAwMDAwMDBiYmY1ZmZmZl0NCj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAg
IDA6IFttZW0NCj4gMHgwMDAwMDAwMGJiZjYwMDAwLTB4MDAwMDAwMDBiYmZmZmZmZl0NCj4gPj4+
IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0NCj4gMHgwMDAwMDAwMGJjMDAwMDAwLTB4
MDAwMDAwMDBiYzAyZmZmZl0NCj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0N
Cj4gMHgwMDAwMDAwMGJjMDMwMDAwLTB4MDAwMDAwMDBiYzM2ZmZmZl0NCj4gPj4+IFsgICAgMC4w
MDAwMDBdICAgbm9kZSAgIDA6IFttZW0NCj4gMHgwMDAwMDAwMGJjMzcwMDAwLTB4MDAwMDAwMDBi
ZjY0ZmZmZl0NCj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0NCj4gMHgwMDAw
MDAwMGJmNjUwMDAwLTB4MDAwMDAwMDBiZjZkZmZmZl0NCj4gPj4+IFsgICAgMC4wMDAwMDBdICAg
bm9kZSAgIDA6IFttZW0NCj4gMHgwMDAwMDAwMGJmNmUwMDAwLTB4MDAwMDAwMDBiZjZlZmZmZl0N
Cj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0NCj4gMHgwMDAwMDAwMGJmNmYw
MDAwLTB4MDAwMDAwMDBiZjgwZmZmZl0NCj4gPj4+IFsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6
IFttZW0NCj4gMHgwMDAwMDAwMGJmODEwMDAwLTB4MDAwMDAwMDBiZmZmZmZmZl0NCj4gPj4+IFsg
ICAgMC4wMDAwMDBdIFplcm9lZCBzdHJ1Y3QgcGFnZSBpbiB1bmF2YWlsYWJsZSByYW5nZXM6IDEw
NDAgcGFnZXMNCj4gPj4+IFsgICAgMC4wMDAwMDBdIEluaXRtZW0gc2V0dXAgbm9kZSAwIFttZW0N
Cj4gMHgwMDAwMDAwMDQwMDAwMDAwLTB4MDAwMDAwMDBiZmZmZmZmZg0KPiA+Pj4NCj4gPj4+IFRo
ZSBob3RwbHVnZ2FibGUgbWVtb3J5IG5vZGUgaXMgYWJzZW50IGZyb20gZWFybHkgbWVtb3J5IG5v
ZGVzIGhlcmUuDQo+ID4+DQo+ID4+IE9LIHRoYW5rIHlvdSBmb3IgdGhlIGV4YW1wbGUgaWxsdXN0
cmF0aW5nIHRoZSBjb25jZXJuLg0KPiA+Pj4NCj4gPj4+IEFzIHlvdSBzYWlkLCBpdCBjb3VsZCBi
ZSBwb3NzaWJsZSB0byBkZXRlY3QgdGhpcyBub2RlIHVzaW5nIFNSQVQgaW4gVUVGSS4NCj4gPj4N
Cj4gPj4gTGV0J3Mgd2FpdCBmb3IgRURLMiBleHBlcnRzIG9uIHRoaXMuDQo+ID4+DQo+ID4NCj4g
PiBIYXBweSB0byBjaGltZSBpbiwgYnV0IEkgbmVlZCBhIGJpdCBtb3JlIGNvbnRleHQgaGVyZS4N
Cj4gPg0KPiA+IFdoYXQgaXMgdGhlIHByb2JsZW0sIGhvdyBkb2VzIHRoaXMgcGF0aCB0cnkgdG8g
c29sdmUgaXQsIGFuZCB3aHkgaXMNCj4gPiB0aGF0IGEgYmFkIGlkZWE/DQo+ID4NCj4gU3VyZSwg
c29ycnkuDQo+IA0KPiBUaGlzIHNlcmllczoNCj4gLSBbUEFUQ0ggdjMgMDAvMTBdIEFSTSB2aXJ0
OiBBQ1BJIG1lbW9yeSBob3RwbHVnIHN1cHBvcnQsDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvY292ZXIvMTA4NjMzMDEvDQo+IA0KPiBhaW1zIHRvIGludHJvZHVjZSBQQ0RJTU0gc3Vw
cG9ydCBpbiBxZW11LiBJbiBBQ1BJIG1vZGUsIGl0IGJ1aWxkcyB0aGUNCj4gU1JBVCBhbmQgRFNE
VCBwYXJ0cyBhbmQgcmVsaWVzIG9uIEdFRCB0byB0cmlnZ2VyIHRoZSBob3RwbHVnLg0KPiANCj4g
V2Ugbm90aWNlZCB0aGF0IGlmIHdlIGJ1aWxkIHRoZSBob3RwbHVnZ2FibGUgbWVtb3J5IGR0IG5v
ZGVzIG9uIHRvcCBvZg0KPiB0aGUgYWJvdmUgQUNQSSB0YWJsZXMsIHRoZSBESU1NIHNsb3RzIGFy
ZSBpbnRlcnByZXRlZCBhcyBub3QNCj4gaG90cGx1Z2dhYmxlIG1lbW9yeSBzbG90cyAoYXQgbGVh
c3Qgd2UgdGhpbmsgc28pLg0KPiANCj4gV2UgdGhpbmsgdGhlIEVESzIgR2V0TWVtb3J5TWFwKCkg
dXNlcyB0aGUgZHQgbm9kZSBpbmZvIGFuZCBpZ25vcmVzIHRoZQ0KPiBmYWN0IHRoYXQgdGhvc2Ug
c2xvdHMgYXJlIGV4cG9zZWQgYXMgaG90cGx1Z2dhYmxlIGluIHRoZSBTUkFUIGZvciBleGFtcGxl
Lg0KPiANCj4gU28gaW4gdGhpcyBzZXJpZXMsIHdlIGFyZSBmb3JjZWQgdG8gbm90IGdlbmVyYXRl
IHRoZSBob3RwbHVnZ2FibGUgbWVtb3J5DQo+IGR0IG5vZGVzIGlmIHdlIHdhbnQgdGhlIERJTU0g
c2xvdHMgdG8gYmUgZWZmZWN0aXZlbHkgcmVjb2duaXplZCBhcw0KPiBob3RwbHVnZ2FibGUuDQo+
IA0KPiBDb3VsZCB5b3UgY29uZmlybSB3ZSBoYXZlIGEgY29ycmVjdCB1bmRlcnN0YW5kaW5nIG9m
IHRoZSBFREsyIGJlaGF2aW91cg0KPiBhbmQgaWYgc28sIHdvdWxkIHRoZXJlIGJlIGFueSBzb2x1
dGlvbiBmb3IgRURLMiB0byBhYnNvcmIgYm90aCB0aGUgRFQNCj4gbm9kZXMgYW5kIHRoZSByZWxl
dmFudCBTUkFUL0RTRFQgdGFibGVzIGFuZCBtYWtlIHRoZSBzbG90cyBob3RwbHVnZ2FibGUuDQo+
IA0KPiBBdCBxZW11IGxldmVsLCBkZXRlY3Rpbmcgd2UgYXJlIGJvb3RpbmcgaW4gQUNQSSBtb2Rl
IGFuZCBwdXJwb3NlbHkNCj4gcmVtb3ZpbmcgdGhlIGFib3ZlIG1lbnRpb25lZCBEVCBub2RlcyBk
b2VzIG5vdCBsb29rIHN0cmFpZ2h0Zm9yd2FyZC4NCj4gDQo+IEhvcGUgdGhpcyBjbGFyaWZpZXMN
Cg0KVGhhbmtzIEVyaWMgZm9yIHRoaXMuIEFuZCB0aGlzIGlzIHdoZXJlIHlvdSBjYW4gZmluZCB0
aGUgaW5pdGlhbCBkaXNjdXNzaW9uIG9uIHRoaXMsDQoNCmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2
ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3JnL21zZzU5OTA3Ni5odG1sDQoNClRoYW5rcywNClNo
YW1lZXINCg0K
