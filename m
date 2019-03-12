Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp695792wrs;
        Tue, 12 Mar 2019 09:47:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL4WDXvgQwzqciVabgAfOapMCXT06GZtF79cYryfNXU6Zr6oIv/cNPcgMsbaU3rpWFkGsv
X-Received: by 2002:a5b:34c:: with SMTP id q12mr32666311ybp.55.1552409228189;
        Tue, 12 Mar 2019 09:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552409228; cv=none;
        d=google.com; s=arc-20160816;
        b=DCAK1ZjTJASqNhciGwdlNeolVA2hj+EEZ/ypBD3nmQwZ+Qlpt6MLShcSCYnEAK7LoW
         optxbjyvWR2hR/5sw2YethpcZ9sMFVv97IbUZWU9zYuWwpMIH3VO28hi5nbkYPiAVpny
         BDC70thfEq3is+MnuXL1avTbP5s9hAKhdgMJvzlHp2LmOoO0E14g+JC+qVktn1fWLQrk
         vMyvjGNW0gay3K1R5FZxUcy3h3aTTmXgbn019I4/p+TF0UNBWIDxUvkFhNal+UfIIayF
         XVd5RK7NjWLIHuouOnrMxHi8VXtUn6Q2AGVTPICcIFwSWRYy0amVJvRV1opzhwFEGRJZ
         PMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=RSIXKBUQLM0FM073QJ0kvjLMqxpSS6w5bDksMR9nq50=;
        b=VEiGJaGIVfO86q2gGP/RfNWVcPp5kVrPZ4ZRC1e/nPFq89fRPZhFdiu+qTapeiTZkD
         whekLgUYSXdnSL9tLSpwIR/ZMpcVdHEOVOq2xjR+WwYwTzxn7LRyxCPZsBWqtuHvtIYw
         SRMnwzDZQNxJPSPLhbodL928v65NAAYAqgWvNwDbF4riGE0w7DC98xRxq3Kv67h9k4y9
         u2KB530Bb4GPcjyMwhAh0A4YjUSf2eeBR08HXFp8BIcJz78buhGLXo/CZCin67oj7JQ4
         yQntqTqVBUJTqP4DhLVuN5fiIm07a6BD+EGogRaxygn6jg7I3YDq/B+YCsO5hUQbD7Q5
         Q8ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d83si5014176ywd.120.2019.03.12.09.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 09:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3kYV-0004kL-Kf
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 12:47:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3kRC-0006JT-K2
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3kRB-0008TK-BD
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:39:34 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45364 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3kRA-0008Rn-Vq; Tue, 12 Mar 2019 12:39:33 -0400
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 265F96EC3DD01C724D3E;
	Tue, 12 Mar 2019 16:39:30 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	lhreml701-cah.china.huawei.com ([10.201.108.42]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 16:39:22 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM
	nodes in the DT
Thread-Index: AQHU1aRx9hViP7MrKUKDA7jHJKP06KYGip6AgAGSmyCAAAqwgIAAD+hA
Date: Tue, 12 Mar 2019 16:39:22 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839305F81@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
	<640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
In-Reply-To: <640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.84.144]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose
 the PC-DIMM nodes in the DT
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XXvWlOsXEhfq

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMTIgTWFyY2ggMjAxOSAxNTozOA0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gSWdvciBNYW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4NCj4g
Q2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgc2FtZW9AbGludXguaW50ZWwuY29tOw0KPiBz
aGFubm9uLnpoYW9zbEBnbWFpbC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgTGludXhhcm0N
Cj4gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBxZW11LWFybUBub25nbnUub3JnOyB4dXdlaSAoTykN
Cj4gPHh1d2VpNUBodWF3ZWkuY29tPjsgc2ViYXN0aWVuLmJvZXVmQGludGVsLmNvbQ0KPiBTdWJq
ZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2MiAwOC8xMV0gaHcvYXJtL2Jvb3Q6IEV4cG9z
ZSB0aGUNCj4gUEMtRElNTSBub2RlcyBpbiB0aGUgRFQNCj4gDQo+IEhpIFNoYW1lZXIsDQo+IA0K
PiBPbiAzLzEyLzE5IDQ6MTMgUE0sIFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgd3JvdGU6DQo+
ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBJZ29y
IE1hbW1lZG92IFttYWlsdG86aW1hbW1lZG9AcmVkaGF0LmNvbV0NCj4gPj4gU2VudDogMTEgTWFy
Y2ggMjAxOSAxNDo1OQ0KPiA+PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVl
cmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPg0KPiA+PiBDYzogcWVtdS1kZXZlbEBub25n
bnUub3JnOyBxZW11LWFybUBub25nbnUub3JnOw0KPiA+PiBlcmljLmF1Z2VyQHJlZGhhdC5jb207
IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gPj4gc2hhbm5vbi56aGFvc2xAZ21haWwuY29t
OyBzYW1lb0BsaW51eC5pbnRlbC5jb207DQo+ID4+IHNlYmFzdGllbi5ib2V1ZkBpbnRlbC5jb207
IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPjsgeHV3ZWkgKE8pDQo+ID4+IDx4dXdlaTVA
aHVhd2VpLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwOC8xMV0gaHcvYXJtL2Jv
b3Q6IEV4cG9zZSB0aGUgUEMtRElNTSBub2RlcyBpbg0KPiB0aGUNCj4gPj4gRFQNCj4gPj4NCj4g
Pj4gT24gRnJpLCA4IE1hciAyMDE5IDExOjQyOjE1ICswMDAwDQo+ID4+IFNoYW1lZXIgS29sb3Ro
dW0gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4+DQo+
ID4+PiBUaGlzIHBhdGNoIGFkZHMgbWVtb3J5IG5vZGVzIGNvcnJlc3BvbmRpbmcgdG8gUEMtRElN
TSByZWdpb25zLg0KPiA+Pj4NCj4gPj4+IE5WRElNTSBhbmQgQUNQSV9OVkRJTU0gY29uZmlncyBh
cmUgbm90IHlldCBzZXQgZm9yIEFSTSBzbyB3ZQ0KPiA+Pj4gZG9uJ3QgbmVlZCB0byBjYXJlIGFi
b3V0IE5WRElNTSBhdCB0aGlzIHN0YWdlLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFNo
YW1lZXIgS29sb3RodW0NCj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT4N
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4N
Cj4gPj4+IC0tLQ0KPiA+Pj4gIGh3L2FybS9ib290LmMgfCA0MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9ody9hcm0vYm9vdC5jIGIvaHcvYXJt
L2Jvb3QuYw0KPiA+Pj4gaW5kZXggYTgzMDY1NS4uNGNhYWY5MSAxMDA2NDQNCj4gPj4+IC0tLSBh
L2h3L2FybS9ib290LmMNCj4gPj4+ICsrKyBiL2h3L2FybS9ib290LmMNCj4gPj4+IEBAIC0xOSw2
ICsxOSw3IEBADQo+ID4+PiAgI2luY2x1ZGUgInN5c2VtdS9udW1hLmgiDQo+ID4+PiAgI2luY2x1
ZGUgImh3L2JvYXJkcy5oIg0KPiA+Pj4gICNpbmNsdWRlICJody9sb2FkZXIuaCINCj4gPj4+ICsj
aW5jbHVkZSAiaHcvbWVtL21lbW9yeS1kZXZpY2UuaCINCj4gPj4+ICAjaW5jbHVkZSAiZWxmLmgi
DQo+ID4+PiAgI2luY2x1ZGUgInN5c2VtdS9kZXZpY2VfdHJlZS5oIg0KPiA+Pj4gICNpbmNsdWRl
ICJxZW11L2NvbmZpZy1maWxlLmgiDQo+ID4+PiBAQCAtNTIyLDYgKzUyMyw0MSBAQCBzdGF0aWMg
dm9pZCBmZHRfYWRkX3BzY2lfbm9kZSh2b2lkICpmZHQpDQo+ID4+PiAgICAgIHFlbXVfZmR0X3Nl
dHByb3BfY2VsbChmZHQsICIvcHNjaSIsICJtaWdyYXRlIiwgbWlncmF0ZV9mbik7DQo+ID4+PiAg
fQ0KPiA+Pj4NCj4gPj4+ICtzdGF0aWMgaW50IGZkdF9hZGRfaG90cGx1Z2dhYmxlX21lbW9yeV9u
b2Rlcyh2b2lkICpmZHQsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgYWNlbGxzLA0KPiA+PiB1aW50MzJfdCBzY2VsbHMpIHsNCj4g
Pj4+ICsgICAgTWVtb3J5RGV2aWNlSW5mb0xpc3QgKmluZm8sICppbmZvX2xpc3QgPSBxbXBfbWVt
b3J5X2RldmljZV9saXN0KCk7DQo+ID4+PiArICAgIE1lbW9yeURldmljZUluZm8gKm1pOw0KPiA+
Pj4gKyAgICBpbnQgcmV0ID0gMDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgZm9yIChpbmZvID0gaW5m
b19saXN0OyBpbmZvICE9IE5VTEw7IGluZm8gPSBpbmZvLT5uZXh0KSB7DQo+ID4+PiArICAgICAg
ICBtaSA9IGluZm8tPnZhbHVlOw0KPiA+Pj4gKyAgICAgICAgc3dpdGNoIChtaS0+dHlwZSkgew0K
PiA+Pj4gKyAgICAgICAgY2FzZSBNRU1PUllfREVWSUNFX0lORk9fS0lORF9ESU1NOg0KPiA+Pj4g
KyAgICAgICAgew0KPiA+Pj4gKyAgICAgICAgICAgIFBDRElNTURldmljZUluZm8gKmRpID0gbWkt
PnUuZGltbS5kYXRhOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgICAgIHJldCA9IGZkdF9hZGRf
bWVtb3J5X25vZGUoZmR0LCBhY2VsbHMsIGRpLT5hZGRyLA0KPiA+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2NlbGxzLCBkaS0+c2l6ZSwgZGktPm5vZGUpOw0KPiA+
Pj4gKyAgICAgICAgICAgIGlmIChyZXQpIHsNCj4gPj4+ICsgICAgICAgICAgICAgICAgZnByaW50
ZihzdGRlcnIsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgImNvdWxkbid0IGFkZCBQ
Q0RJTU0NCj4gL21lbW9yeUAlIlBSSXg2NCINCj4gPj4gbm9kZVxuIiwNCj4gPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBkaS0+YWRkcik7DQo+ID4+PiArICAgICAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPiA+Pj4gKyAgICAgICAgICAgIH0NCj4gPj4+ICsgICAgICAgICAgICBicmVhazsNCj4g
Pj4+ICsgICAgICAgIH0NCj4gPj4+ICsgICAgICAgIGRlZmF1bHQ6DQo+ID4+PiArICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICIlcyBtZW1vcnkgbm9kZXMgYXJlIG5vdCB5ZXQNCj4gc3VwcG9y
dGVkXG4iLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgTWVtb3J5RGV2aWNlSW5mb0tpbmRf
c3RyKG1pLT50eXBlKSk7DQo+ID4+PiArICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsNCj4gPj4+
ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+ICsgICAgICAgIH0NCj4gPj4+ICsgICAgfQ0K
PiA+Pj4gK291dDoNCj4gPj4+ICsgICAgcWFwaV9mcmVlX01lbW9yeURldmljZUluZm9MaXN0KGlu
Zm9fbGlzdCk7DQo+ID4+PiArICAgIHJldHVybiByZXQ7DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+
Pj4gIGludCBhcm1fbG9hZF9kdGIoaHdhZGRyIGFkZHIsIGNvbnN0IHN0cnVjdCBhcm1fYm9vdF9p
bmZvICpiaW5mbywNCj4gPj4+ICAgICAgICAgICAgICAgICAgIGh3YWRkciBhZGRyX2xpbWl0LCBB
ZGRyZXNzU3BhY2UgKmFzKQ0KPiA+Pj4gIHsNCj4gPj4+IEBAIC02MjEsNiArNjU3LDEyIEBAIGlu
dCBhcm1fbG9hZF9kdGIoaHdhZGRyIGFkZHIsIGNvbnN0IHN0cnVjdA0KPiA+PiBhcm1fYm9vdF9p
bmZvICpiaW5mbywNCj4gPj4+ICAgICAgICAgIH0NCj4gPj4+ICAgICAgfQ0KPiA+Pj4NCj4gPj4+
ICsgICAgcmMgPSBmZHRfYWRkX2hvdHBsdWdnYWJsZV9tZW1vcnlfbm9kZXMoZmR0LCBhY2VsbHMs
IHNjZWxscyk7DQo+ID4+IEFjY29yZGluZyB0byBFcmljJ3MgdGVzdCwgZ3Vlc3Qga2VybmVsIHBp
Y2tzIHRoaXMgdXAuIFNvIGl0IHByb2JhYmx5DQo+ID4+IHNob3VsZCBiZSBhbiBvcHQtaW4gZmVh
dHVyZSB0byBhdm9pZCBjb25mbGljdCB3aXRoIEFDUEkgZGVmaW5pdGlvbiBpbiBEU0RULg0KPiA+
DQo+ID4gT2suIE15IHRha2UgYXdheSBmcm9tIHRoYXQgZGlzY3Vzc2lvbiB3YXMgdGhhdCBpZiB3
ZSBwcm9wZXJseSBkZXNjcmliZSB0aGUNCj4gPiBQTlAwQzgwICh3aGljaCBpcyB3aGF0ICMwNiBv
ZiB0aGlzIHNlcmllcyBkb2VzKSB0aGVuIHdlIGRvbid0IGhhdmUgdG8gd29ycnkNCj4gPiBhYm91
dCBEVCBlbnRyaWVzIGFzIEFDUEkgd2lsbCAib3ZlcnJpZGUiIGl0LiAgQnV0IGl0IGxvb2tzIGxp
a2UgdGhhdCBpcyBub3QgdGhlDQo+IGNhc2UNCj4gPiBhbmQgZGVzY3JpYmluZyBEVCB3aWxsIGFu
eXdheSBjYXVzZSB0aGUgbWVtb3J5IGJlaW5nIGVuZCB1cCBpbiBVRUZJDQo+ID4gR2VUTWVtb3J5
TWFwKCkgYW5kIHJlc3VsdHMgaW4gYmVpbmcgdXNlZCBhcyBub3JtYWwgbWVtb3J5IGVhcmx5IGF0
IGJvb3QuDQo+ID4NCj4gPiBIaSBFcmljLA0KPiA+DQo+ID4gSG93IGRvIHdlIHZlcmlmeSB0aGF0
IHRoaXMgaXMgYWN0dWFsbHkgaGFwcGVuaW5nPyBJIHRyaWVkIHJ1bm5pbmcgdGhlDQo+IC9wcm9j
L21lbWluZm8NCj4gPiBvbiBhIFFlbXUgYnVpbGQgdXB0byAjMDYgb2YgdGhpcyBzZXJpZXMsIGFu
ZCBpdCByZXBvcnRlZCBtZW1vcnkgaW5jbHVkaW5nIHRoZQ0KPiA+IGNvbGQgcGx1Z2dlZCBkaW1t
IG1lbW9yeS4NCj4gPg0KPiA+IEJ1dCBub3Qgc3VyZSBob3cgdG8gdmVyaWZ5IHRoYXQgdGhpcyBk
aW1tIG1lbSBpcyBiZWluZyB0cmVhdGVkIGFzIG5vcm1hbA0KPiBtZW0gb24NCj4gPiBib290IHRp
bWUgb3Igbm90PyBQbGVhc2UgbGV0IG1lIGtub3cuDQo+IA0KPiBBdCB0aGUgdGltZSBJIHRlc3Rl
ZCBJIGRpZCBub3QgaGF2ZSBQTlAwQzgwIGJ1aWxkLiBJIGNvbmZpcm0gdGhhdCBpZiB5b3UNCj4g
cmVtb3ZlIHRoZSBkdCBkZXNjcmlwdGlvbiBpbiBBQ1BJIG1vZGUsIC9wcm9jL21lbWluZm8gZG9l
cyBub3QgcmVwb3J0DQo+IHRoZSBESU1Ncy4gTm93IHRoYXQgeW91IGhhdmUgIzA2LCBpZiB5b3Ug
cmVtb3ZlIHRoZSBEVCAgaG90cGx1Z2dhYmxlcw0KPiBtZW1vcnkgbW9kZSBnZW5lcmF0aW9uIGlu
IEFDUEkgbW9kZSwgeW91IHNob3VsZCBzZWUgdGhlbSBhbmQgaWYgSQ0KPiB1bmRlcnN0YW5kIGNv
cnJlY3RseSB0aGlzIGlzIHdoYXQgeW91IGNvbmZpcm0uIEkgaGF2ZSBub3QgdGVzdGVkDQo+IGFu
eXRoaW5nIGVsc2UgYXQgdGhlIG1vbWVudC4NCg0KWWVzLCB0aGF0IGlzIHdoYXQgSSBjb25maXJt
ZWQuIEJ1dCB0aGUgY29uY2VybiBub3cgaXMgaGF2aW5nIERUIG1lbW9yeSBub2RlDQpnZW5lcmF0
aW9uIHdpbGwgcmVzdWx0IGluIHRoZSBwcm9ibGVtIGRlc2NyaWJlZCBhYm92ZSAtIFVFRkkgR2V0
TWVtb3J5TWFwKCkuDQoNCkkgd2FzIGxvb2tpbmcgZm9yIGEgd2F5IHRvIGNoZWNrIHRoYXQgaXMg
YSB2YWxpZCBpc3N1ZSBvciBub3QuIEkgd2lsbCB0cnkgdG8gbG9vayBmb3IgDQphIHdheSB0byB2
ZXJpZnkgdGhhdC4gUGxlYXNlIHVwZGF0ZSBpZiB5b3UgY29tZSBhY3Jvc3MgYW55dGhpbmcuDQoN
ClRoYW5rcywNClNoYW1lZXINCg0KPiBUaGFua3MNCj4gDQo+IEVyaWMNCj4gPg0KPiA+IFRoYW5r
cywNCj4gPiBTaGFtZWVyDQo+ID4NCj4gPg0KPiA+Pj4gKyAgICBpZiAocmMgPCAwKSB7DQo+ID4+
PiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImNvdWxkbid0IGFkZCBob3RwbHVnZ2FibGUgbWVt
b3J5IG5vZGVzXG4iKTsNCj4gPj4+ICsgICAgICAgIGdvdG8gZmFpbDsNCj4gPj4+ICsgICAgfQ0K
PiA+Pj4gKw0KPiA+Pj4gICAgICByYyA9IGZkdF9wYXRoX29mZnNldChmZHQsICIvY2hvc2VuIik7
DQo+ID4+PiAgICAgIGlmIChyYyA8IDApIHsNCj4gPj4+ICAgICAgICAgIHFlbXVfZmR0X2FkZF9z
dWJub2RlKGZkdCwgIi9jaG9zZW4iKTsNCj4gPg0KPiA+DQo=
