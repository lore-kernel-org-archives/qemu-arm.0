Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1652379wrx;
        Fri, 29 Mar 2019 03:00:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAxqkMkHx7GWTkE5Sa/lj7fDPX90ksjKqcRXxNcLbKHuQfrSD7ROiv4uUWv3P7+KrWlbC4
X-Received: by 2002:a02:6610:: with SMTP id k16mr34891569jac.40.1553853612330;
        Fri, 29 Mar 2019 03:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553853612; cv=none;
        d=google.com; s=arc-20160816;
        b=p92We2RAwXxFha8PZTsHSnb8+bqbLpa94Z6WqFBBKAepWXgS1hAHh/IKuDVjlWMLFL
         ievPvJSuNDYeeLTXOa0+SIL2qQWHIOxsZbSKvE4nnVIHPDpem/xxiV3xLdm5obNfoZvy
         Aru4eFaYnMoBZNNN4ng1GXGlaZonlBr5sGdpw7eu32N3QIXsX+L4gNxIiwuXRAaXoa1M
         WTS4tfWrdARDBdbvHc1RU28Xzu1q6mjn2vMjZoV0EiYAbgx/M6GJrBqA8Z6WgodYsBtr
         pjSItpJlU1NwPSIoJ56Y0zA4v7Ja999S7lTxOlrZaDfn13AIqEKx4nK29miV6QYDEaC/
         6RVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=tpJGDz+UWaCliWgRiG3Jgdt3s2nrbUMkz/ykgDMSV9U=;
        b=cPMT2eIYoGLJyr+5Pz9azI+xZiEWFYA6xBrk3du+63zGjxm/0zLlulXST1Qa1oSm42
         JBREIszmPSPT3Fq/SEHbHbvDBmo8z0IwtEEgSXBvkQf45qSpKt2HTQDe4c9nbOjE277C
         FXvXB6YpT5tnIevj45O4l7HiHvVrNPYl4FGGKC5KD1XVxR9U1NjvwA+SkewKsywgjCwL
         n1XYqoLX6NpVKsPstuqJGQRxpv1inudih9UDWDrE4BbnSOr7zxUTNP9BgmvHMO4mJY3X
         Cf/bpSLGzBCzQSUmnXL3Rz9bIfbxsH3HmAGfJHBEJIASg1oWVnTGqi/kwRXIFpQMWkvg
         kQcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si818500jab.18.2019.03.29.03.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 03:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9oJ1-0001gW-L4
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 06:00:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9oIs-0001g4-IS
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 06:00:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9oIr-0005mX-42
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 06:00:02 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45376 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9oIq-0005lb-QG; Fri, 29 Mar 2019 06:00:01 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 5459AFA6CB8A857ADEFA;
	Fri, 29 Mar 2019 09:59:58 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.165]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Fri, 29 Mar 2019 09:59:49 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAFAfA=
Date: Fri, 29 Mar 2019 09:59:48 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
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
X-TUID: qQW5/hrgskIL

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMjkgTWFyY2ggMjAxOSAwOTozMg0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+Ow0KPiBMYXN6bG8gRXJzZWsgPGxlcnNla0By
ZWRoYXQuY29tPjsgQXJkIEJpZXNoZXV2ZWwNCj4gPGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc+
OyBMZWlmIExpbmRob2xtIDxMZWlmLkxpbmRob2xtQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDcvMTBdIGh3L2FybS92aXJ0OiBJbnRyb2R1Y2Ugb3B0LWluIGZlYXR1cmUgImZk
dCINCj4gDQo+IEhpIFNoYW1lZXIsDQo+IA0KPiBbICsgTGFzemxvLCBBcmQsIExlaWYgXQ0KPiAN
Cj4gT24gMy8yMS8xOSAxMTo0NyBBTSwgU2hhbWVlciBLb2xvdGh1bSB3cm90ZToNCj4gPiBUaGlz
IGlzIHRvIGRpc2FibGUvZW5hYmxlIHBvcHVsYXRpbmcgRFQgbm9kZXMgaW4gY2FzZQ0KPiA+IGFu
eSBjb25mbGljdCB3aXRoIGFjcGkgdGFibGVzLiBUaGUgZGVmYXVsdCBpcyAib2ZmIi4NCj4gVGhl
IG5hbWUgb2YgdGhlIG9wdGlvbiBzb3VuZHMgbWlzbGVhZGluZyB0byBtZS4gQWxzbyB3ZSBkb24n
dCByZWFsbHkNCj4ga25vdyB0aGUgc2NvcGUgb2YgdGhlIGRpc2FibGVtZW50LiBBdCB0aGUgbW9t
ZW50IHRoaXMganVzdCBhaW1zIHRvDQo+IHByZXZlbnQgdGhlIGhvdHBsdWdnYWJsZSBkdCBub2Rl
cyBmcm9tIGJlaW5nIGFkZGVkIGlmIHdlIGJvb3QgaW4gQUNQSSBtb2RlLg0KPiANCj4gPg0KPiA+
IFRoaXMgd2lsbCBiZSB1c2VkIGluIHN1YnNlcXVlbnQgcGF0Y2ggd2hlcmUgY29sZCBwbHVnDQo+
ID4gZGV2aWNlLW1lbW9yeSBzdXBwb3J0IGlzIGFkZGVkIGZvciBEVCBib290Lg0KPiBJIGFtIGNv
bmNlcm5lZCBhYm91dCB0aGUgZmFjdCB0aGF0IGluIGR0IG1vZGUsIGJ5IGRlZmF1bHQsIHlvdSB3
b24ndCBzZWUNCj4gYW55IFBDRElNTSBub2Rlcy4NCj4gPg0KPiA+IElmIERUIG1lbW9yeSBub2Rl
IHN1cHBvcnQgaXMgYWRkZWQgZm9yIGNvbGQtcGx1Z2dlZCBkZXZpY2UNCj4gPiBtZW1vcnksIHRo
b3NlIG1lbW9yeSB3aWxsIGJlIHZpc2libGUgdG8gR3Vlc3Qga2VybmVsIHZpYQ0KPiA+IFVFRkkg
R2V0TWVtb3J5TWFwKCkgYW5kIGdldHMgdHJlYXRlZCBhcyBlYXJseSBib290IG1lbW9yeS4NCj4g
RG9uJ3Qgd2UgaGF2ZSBhbiBpc3N1ZSBpbiBVRUZJIHRoZW4uIE5vcm1hbGx5IHRoZSBTUkFUIGlu
ZGljYXRlcyB3aGV0aGVyDQo+IHRoZSBzbG90cyBhcmUgaG90cGx1Z2dhYmxlIG9yIG5vdC4gU2hv
dWxkbid0IHRoZSBVRUZJIGNvZGUgbG9vayBhdCB0aGlzDQo+IGluZm8uDQoNClNvcnJ5IEkgbWlz
c2VkIHRoaXMgcGFydC4gWWVzLCB0aGF0IHdpbGwgYmUgYSBtb3JlIGNsZWFuZXIgc29sdXRpb24u
DQoNCkFsc28sIHRvIGJlIG1vcmUgY2xlYXIgb24gd2hhdCBoYXBwZW5zLA0KDQpHdWVzdCBBQ1BJ
IGJvb3Qgd2l0aCAiZmR0PW9uIiAsDQoNCkZyb20ga2VybmVsIGxvZywNCg0KWyAgICAwLjAwMDAw
MF0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBb
bWVtIDB4MDAwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDAwYmJmNWZmZmZdDQpbICAgIDAuMDAwMDAw
XSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBiYmY2MDAwMC0weDAwMDAwMDAwYmJmZmZmZmZd
DQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBiYzAwMDAwMC0weDAw
MDAwMDAwYmMwMmZmZmZdDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAw
MDBiYzAzMDAwMC0weDAwMDAwMDAwYmMzNmZmZmZdDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAw
OiBbbWVtIDB4MDAwMDAwMDBiYzM3MDAwMC0weDAwMDAwMDAwYmY2NGZmZmZdDQpbICAgIDAuMDAw
MDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBiZjY1MDAwMC0weDAwMDAwMDAwYmY2ZGZm
ZmZdDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBiZjZlMDAwMC0w
eDAwMDAwMDAwYmY2ZWZmZmZdDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAw
MDAwMDBiZjZmMDAwMC0weDAwMDAwMDAwYmY4MGZmZmZdDQpbICAgIDAuMDAwMDAwXSAgIG5vZGUg
ICAwOiBbbWVtIDB4MDAwMDAwMDBiZjgxMDAwMC0weDAwMDAwMDAwYmZmZmZmZmZdDQpbICAgIDAu
MDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBjMDAwMDAwMC0weDAwMDAwMDAwZmZm
ZmZmZmZdICAtLT4gVGhpcyBpcyB0aGUgaG90cGx1Z2dhYmxlIG1lbW9yeSBub2RlIGZyb20gRFQu
DQpbICAgIDAuMDAwMDAwXSBaZXJvZWQgc3RydWN0IHBhZ2UgaW4gdW5hdmFpbGFibGUgcmFuZ2Vz
OiAxMDQwIHBhZ2VzDQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4
MDAwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDAwZmZmZmZmZmZdDQoNCg0KR3Vlc3QgQUNQSSBib290
IHdpdGggImZkdD1vZmYiICwNCg0KWyAgICAwLjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZv
ciBlYWNoIG5vZGUNClsgICAgMC4wMDAwMDBdIEVhcmx5IG1lbW9yeSBub2RlIHJhbmdlcw0KWyAg
ICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwNDAwMDAwMDAtMHgwMDAwMDAw
MGJiZjVmZmZmXQ0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYmJm
NjAwMDAtMHgwMDAwMDAwMGJiZmZmZmZmXQ0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21l
bSAweDAwMDAwMDAwYmMwMDAwMDAtMHgwMDAwMDAwMGJjMDJmZmZmXQ0KWyAgICAwLjAwMDAwMF0g
ICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYmMwMzAwMDAtMHgwMDAwMDAwMGJjMzZmZmZmXQ0K
WyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYmMzNzAwMDAtMHgwMDAw
MDAwMGJmNjRmZmZmXQ0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAw
YmY2NTAwMDAtMHgwMDAwMDAwMGJmNmRmZmZmXQ0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDog
W21lbSAweDAwMDAwMDAwYmY2ZTAwMDAtMHgwMDAwMDAwMGJmNmVmZmZmXQ0KWyAgICAwLjAwMDAw
MF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYmY2ZjAwMDAtMHgwMDAwMDAwMGJmODBmZmZm
XQ0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwYmY4MTAwMDAtMHgw
MDAwMDAwMGJmZmZmZmZmXQ0KWyAgICAwLjAwMDAwMF0gWmVyb2VkIHN0cnVjdCBwYWdlIGluIHVu
YXZhaWxhYmxlIHJhbmdlczogMTA0MCBwYWdlcw0KWyAgICAwLjAwMDAwMF0gSW5pdG1lbSBzZXR1
cCBub2RlIDAgW21lbSAweDAwMDAwMDAwNDAwMDAwMDAtMHgwMDAwMDAwMGJmZmZmZmZmDQoNClRo
ZSBob3RwbHVnZ2FibGUgbWVtb3J5IG5vZGUgaXMgYWJzZW50IGZyb20gZWFybHkgbWVtb3J5IG5v
ZGVzIGhlcmUuDQoNCkFzIHlvdSBzYWlkLCBpdCBjb3VsZCBiZSBwb3NzaWJsZSB0byBkZXRlY3Qg
dGhpcyBub2RlIHVzaW5nIFNSQVQgaW4gVUVGSS4NCg0KQ2hlZXJzLA0KU2hhbWVlcg0KDQo+ID4g
SGVuY2UgbWVtb3J5IGJlY29tZXMgbm9uIGhvdC11bi11bnBsdWdnYWJsZSBldmVuIGlmIEd1ZXN0
DQo+ID4gaXMgYm9vdGVkIGluIEFDUEkgbW9kZS4NCj4gDQo+IA0KPiANCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVh
d2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvYXJtL3ZpcnQuYyAgICAgICAgIHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9ody9hcm0vdmlydC5oIHwgIDEgKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9ody9hcm0vdmlydC5jIGIvaHcvYXJtL3ZpcnQuYw0KPiA+IGluZGV4IDEzZGIwZTkuLmI2MDIx
NTEgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYXJtL3ZpcnQuYw0KPiA+ICsrKyBiL2h3L2FybS92aXJ0
LmMNCj4gPiBAQCAtMTcxNyw2ICsxNzE3LDIwIEBAIHN0YXRpYyB2b2lkIHZpcnRfc2V0X2hpZ2ht
ZW0oT2JqZWN0ICpvYmosIGJvb2wNCj4gdmFsdWUsIEVycm9yICoqZXJycCkNCj4gPiAgICAgIHZt
cy0+aGlnaG1lbSA9IHZhbHVlOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgdmlydF9n
ZXRfZmR0KE9iamVjdCAqb2JqLCBFcnJvciAqKmVycnApDQo+ID4gK3sNCj4gPiArICAgIFZpcnRN
YWNoaW5lU3RhdGUgKnZtcyA9IFZJUlRfTUFDSElORShvYmopOw0KPiA+ICsNCj4gPiArICAgIHJl
dHVybiB2bXMtPnVzZV9mZHQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHZpcnRf
c2V0X2ZkdChPYmplY3QgKm9iaiwgYm9vbCB2YWx1ZSwgRXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+
ID4gKyAgICBWaXJ0TWFjaGluZVN0YXRlICp2bXMgPSBWSVJUX01BQ0hJTkUob2JqKTsNCj4gPiAr
DQo+ID4gKyAgICB2bXMtPnVzZV9mZHQgPSB2YWx1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3Rh
dGljIGJvb2wgdmlydF9nZXRfaXRzKE9iamVjdCAqb2JqLCBFcnJvciAqKmVycnApDQo+ID4gIHsN
Cj4gPiAgICAgIFZpcnRNYWNoaW5lU3RhdGUgKnZtcyA9IFZJUlRfTUFDSElORShvYmopOw0KPiA+
IEBAIC0yMDA1LDYgKzIwMTksMTUgQEAgc3RhdGljIHZvaWQgdmlydF9pbnN0YW5jZV9pbml0KE9i
amVjdCAqb2JqKQ0KPiA+ICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9kZXNjcmlwdGlvbihvYmos
ICJnaWMtdmVyc2lvbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJTZXQgR0lDIHZlcnNpb24uICINCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIlZhbGlkIHZhbHVlcyBhcmUgMiwgMyBhbmQgaG9zdCIsDQo+IE5VTEwpOw0KPiA+ICsg
ICAgLyogZmR0IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQgKi8NCj4gPiArICAgIHZtcy0+dXNlX2Zk
dCA9IGZhbHNlOw0KPiA+ICsgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9ib29sKG9iaiwgImZkdCIs
IHZpcnRfZ2V0X2ZkdCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aXJ0X3Nl
dF9mZHQsIE5VTEwpOw0KPiA+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9kZXNjcmlwdGlvbihv
YmosICJmZHQiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiU2V0
IG9uL29mZiB0byBlbmFibGUvZGlzYWJsZQ0KPiBkZXZpY2UgdHJlZSAiDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJub2RlcyBpbiBjYXNlIGFueSBjb25mbGljdCB3
aXRoDQo+IEFDUEkiDQo+IGluIGNhc2Ugb2YNCj4gDQo+IFRoYW5rcw0KPiANCj4gRXJpYw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiKGVnOiBkZXZpY2UgbWVtb3J5
IG5vZGUpIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7
DQo+ID4NCj4gPiAgICAgIHZtcy0+aGlnaG1lbV9lY2FtID0gIXZtYy0+bm9faGlnaG1lbV9lY2Ft
Ow0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvYXJtL3ZpcnQuaCBiL2luY2x1ZGUv
aHcvYXJtL3ZpcnQuaA0KPiA+IGluZGV4IGM1ZTRjOTYuLjE0YjJlMGEgMTAwNjQ0DQo+ID4gLS0t
IGEvaW5jbHVkZS9ody9hcm0vdmlydC5oDQo+ID4gKysrIGIvaW5jbHVkZS9ody9hcm0vdmlydC5o
DQo+ID4gQEAgLTExOSw2ICsxMTksNyBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ID4gICAgICBib29s
IGhpZ2htZW1fZWNhbTsNCj4gPiAgICAgIGJvb2wgaXRzOw0KPiA+ICAgICAgYm9vbCB2aXJ0Ow0K
PiA+ICsgICAgYm9vbCB1c2VfZmR0Ow0KPiA+ICAgICAgaW50MzJfdCBnaWNfdmVyc2lvbjsNCj4g
PiAgICAgIFZpcnRJT01NVVR5cGUgaW9tbXU7DQo+ID4gICAgICBzdHJ1Y3QgYXJtX2Jvb3RfaW5m
byBib290aW5mbzsNCj4gPg0K
