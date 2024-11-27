Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp668155njb;
        Wed, 27 Nov 2024 02:22:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPgIaipPKveu6WDKz5YCKYRzJWw4P3kwscJM1D67lw8mXoV4vvcWvoJ8RD13L1NXNCdweZdfvPgt4AKw==@linaro.org
X-Google-Smtp-Source: AGHT+IFTUsmpMeMvvBHrwoIqOodD26q8vAwAToZnRvTeF6VLC2+xaR9j65Wtu1hDMYYpD2n1ndI4
X-Received: by 2002:a05:6102:1614:b0:4af:4d47:7e0a with SMTP id ada2fe7eead31-4af4d47815amr929958137.12.1732702932272;
        Wed, 27 Nov 2024 02:22:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732702932; cv=none;
        d=google.com; s=arc-20240605;
        b=N4MsRohwA7jfOve+QJjSKu/33flEJ+A0B6GfPuxVge/LmdDzAivn3Ny3phOV+570AN
         Ua6eHc6t5ItL2VuCiC2guRLF6LEXZAz8fxuGb4fv4rp7cNJovahouQjNK0ib7B+wB+9v
         V4oAm5f8TJxA5Xtw7eD+HtMD0yxcQwIrgaipootQMM31ZpIDdTDbmfHMhOHWXFxc3deX
         gwEnqsv3QzTTL7ZsI18Pm7ZYRT/rnjpEmSVfzNlhRqT+DiusvDcr3cafr24v3ADLBEQc
         AxnpfV6enNVCCaPdKNaqloKIvvZdyKFzF4MZg8bCW5dM8O0cbXh7fwZd0KT6tzLEJ8S6
         IRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=Bxx0zt10Z2X/ARnE04n5gYdOrPcCF8taX2TZCwAbF/4=;
        fh=IsUa3cpLlymRbFPDt/PmMslJUFUvfDRRBuvRG7LWfHA=;
        b=chqvC1KQ/ZYxaxwVhWMZyazkNhydCt3BPkU7aXBhHWsmfWSsPZfgS0rox5P79/iiz4
         NSZo8dClSWptWpLQ6ztp0ByvUApidQkF/9fbXMFN9RzFJD/gpaoHzAKbNzZ0+pDFGfqC
         qwbXao09G9X4NnRfIp9AHB2pQCG34LyeeYw7XNPDk6d2+Svt3icngzhjRBxlCM2iQYDY
         XvmGVeOvGk110B29WzlCoxfswVAu+4sMLL9qumN5xvE/OshRejWMpe5y6JsGmpkeF7qy
         sZwQL/cF9KLMMjZ7qyiZsJC8/0HIo27MFVueE21ecF2INWLBz4WmQCdoZocKTy88X5yL
         Pysg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466aca2bc0csi31237041cf.425.2024.11.27.02.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 02:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGFB0-0001FX-Ci; Wed, 27 Nov 2024 05:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tGFAx-0001F4-Rp; Wed, 27 Nov 2024 05:21:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tGFAv-0003UI-H3; Wed, 27 Nov 2024 05:21:39 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XywQH6ptlz6GD9c;
 Wed, 27 Nov 2024 18:18:47 +0800 (CST)
Received: from frapeml100005.china.huawei.com (unknown [7.182.85.132])
 by mail.maildlp.com (Postfix) with ESMTPS id 89F341400CA;
 Wed, 27 Nov 2024 18:21:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100005.china.huawei.com (7.182.85.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 11:21:24 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 27 Nov 2024 11:21:24 +0100
To: Donald Dutile <ddutile@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Topic: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Index: AQHbMeWSJ83HnnIr30KCqoK78hZMsLK1adCAgAAO0ACAFHTOgIABDrKg
Date: Wed, 27 Nov 2024 10:21:24 +0000
Message-ID: <d8fbaa677771425dac985438b4b1db59@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
In-Reply-To: <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.158.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.931, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BtEMJHkero+x

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG9uYWxkIER1dGlsZSA8
ZGR1dGlsZUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNiwgMjAyNCA2
OjI5IFBNDQo+IFRvOiBOaWNvbGluIENoZW4gPG5pY29saW5jQG52aWRpYS5jb20+OyBFcmljIEF1
Z2VyDQo+IDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IENjOiBTaGFtZWVyYWxpIEtvbG90aHVt
IFRob2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBxZW11LWFy
bUBub25nbnUub3JnOw0KPiBxZW11LWRldmVsQG5vbmdudS5vcmc7IHBldGVyLm1heWRlbGxAbGlu
YXJvLm9yZzsgamdnQG52aWRpYS5jb207DQo+IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29t
PjsgV2FuZ3pob3UgKEIpDQo+IDx3YW5nemhvdTFAaGlzaWxpY29uLmNvbT47IGppYW5na3Vua3Vu
IDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsNCj4gSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4u
Y2FtZXJvbkBodWF3ZWkuY29tPjsNCj4gemhhbmdmZWkuZ2FvQGxpbmFyby5vcmcNCj4gU3ViamVj
dDogUmU6IFtSRkMgUEFUQ0ggMi81XSBody9hcm0vc21tdXYzOiBBZGQgaW5pdGlhbCBzdXBwb3J0
IGZvcg0KPiBTTU1VdjMgTmVzdGVkIGRldmljZQ0KPiANCj4gDQo+IA0KPiBPbiAxMS8xMy8yNCAx
OjA1IFBNLCBOaWNvbGluIENoZW4gd3JvdGU6DQo+ID4gSGkgRXJpYywNCj4gPg0KPiA+IE9uIFdl
ZCwgTm92IDEzLCAyMDI0IGF0IDA2OjEyOjE1UE0gKzAxMDAsIEVyaWMgQXVnZXIgd3JvdGU6DQo+
ID4+IE9uIDExLzgvMjQgMTM6NTIsIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6DQo+ID4+PiBAQCAt
MTgxLDYgKzE4MSw3IEBAIHN0YXRpYyBjb25zdCBNZW1NYXBFbnRyeSBiYXNlX21lbW1hcFtdID0g
ew0KPiA+Pj4gICAgICAgW1ZJUlRfUFZUSU1FXSA9ICAgICAgICAgICAgIHsgMHgwOTBhMDAwMCwg
MHgwMDAxMDAwMCB9LA0KPiA+Pj4gICAgICAgW1ZJUlRfU0VDVVJFX0dQSU9dID0gICAgICAgIHsg
MHgwOTBiMDAwMCwgMHgwMDAwMTAwMCB9LA0KPiA+Pj4gICAgICAgW1ZJUlRfTU1JT10gPSAgICAg
ICAgICAgICAgIHsgMHgwYTAwMDAwMCwgMHgwMDAwMDIwMCB9LA0KPiA+Pj4gKyAgICBbVklSVF9T
TU1VX05FU1RFRF0gPSAgICAgICAgeyAweDBiMDAwMDAwLCAweDAxMDAwMDAwIH0sDQo+ID4NCj4g
Pj4gSSBhZ3JlZSB3aXRoIE1vc3RhZmEgdGhhdCB0aGUgX05FU1RFRCB0ZXJtaW5vbG9neSBtYXkg
bm90IGJlIHRoZSBiZXN0DQo+ID4+IGNob2ljZS4NCj4gPj4gVGhlIG1vdGl2YXRpb24gYmVoaW5k
IHRoYXQgbXVsdGktaW5zdGFuY2UgYXR0ZW1wdCwgYXMgaW50cm9kdWNlZCBpbg0KPiA+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvWkVjVCUyRjdlcmtoSERhTnZEQEFzdXJhZGEtTnZpZGlh
Lw0KPiA+PiB3YXM6DQo+ID4+IC0gU01NVXMgd2l0aCBkaWZmZXJlbnQgZmVhdHVyZSBiaXRzDQo+
ID4+IC0gc3VwcG9ydCBvZiBWQ01EUSBIVyBleHRlbnNpb24gZm9yIFNNTVUgQ01EUQ0KPiA+PiAt
IG5lZWQgZm9yIHNlcGFyYXRlIFMxIGludmFsaWRhdGlvbiBwYXRocw0KPiA+Pg0KPiA+PiBJZiBJ
IHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoaXMgaXMgbW9zdGx5IHdhbnRlZCBmb3IgVkNNRFEgaGFu
ZGxpbmc/IGlmDQo+ID4+IHRoaXMgaXMgY29ycmVjdCB3ZSBtYXkgaW5kaWNhdGUgdGhhdCBzb21l
aG93IGluIHRoZSB0ZXJtaW5vbG9neS4NCj4gPj4NCj4gPj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJl
Y3RseSBWQ01EUSB0ZXJtaW5vbG9neSBpcyBOVmlkaWEgc3BlY2lmaWMgd2hpbGUNCj4gPj4gRUNN
RFEgaXMgdGhlIGJhc2VsaW5lICg/KS4NCj4gPg0KPiA+IFZDTURRIG1ha2VzIGEgbXVsdGktdlNN
TVUtaW5zdGFuY2UgZGVzaWduIGEgaGFyZCByZXF1aXJlbWVudCwgeWV0DQo+ID4gdGhlIHBvaW50
ICgzKSBmb3Igc2VwYXJhdGUgaW52YWxpZGF0aW9uIHBhdGhzIGFsc28gbWF0dGVycy4gSmFzb24N
Cj4gPiBzdWdnZXN0ZWQgVk1NIGluIGJhc2UgY2FzZSB0byBjcmVhdGUgbXVsdGkgdlNNTVUgaW5z
dGFuY2VzIGFzIHRoZQ0KPiA+IGtlcm5lbCBkb2MgbWVudGlvbmVkIGhlcmU6DQo+ID4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC0NCj4g
bmV4dC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvaW9tbXVmZC5yc3Qjbjg0
DQo+ID4NCj4gPiBXLnIudCBuYW1pbmcsIG1heWJlIHNvbWV0aGluZyByZWxhdGVkIHRvICJoYXJk
d2FyZS1hY2NlbGVyYXRlZCI/DQo+ID4NCj4gR2l2ZW4gdGhhdCAnYWNjZWwnIGhhcyBiZWVuIHVz
ZWQgZm9yIGh3LWFjY2VsZXJhdGlvbiBlbHNld2hlcmUsIHRoYXQgc2VlbXMNCj4gbGlrZSBhIHJl
YXNvbmFibGUgJ21vZGUnLg0KPiBCdXQsIGl0IG5lZWRzIGEgcGFyYW1hdGVyIHRvIHN0YXRlIHdh
cyBpcyBiZWluZyBhY2NlbGVyYXRlZC4NCj4gaS5lLiwgdGhlIG1vcmUgZ2xvYmFsICdhY2NlbD1r
dm0nIGhhcyAna3ZtJy4NCg0KSSB3YXMgdGhpbmtpbmcgbW9yZSBsaWtlIGNhbGxpbmcgdGhpcyBo
dyBhY2NlbGVyYXRlZCBuZXN0ZWQgU01NVXYzIGVtdWxhdGlvbg0KYXMgJ3NtbXV2My1hY2NlbCcu
ICBUaGlzIGF2b2lkcyBjb25mdXNpb24gd2l0aCB0aGUgYWxyZWFkeSBleGlzdGluZyANCidpb21t
dT1zbW11djMnIHRoYXQgYWxzbyBoYXMgYSBuZXN0ZWQgZW11bGF0aW9uIHN1cHBvcnQuIA0KDQpp
ZSwNCi1kZXZpY2UgYXJtLXNtbXV2My1hY2NlbCxpZD1zbW11djEsYnVzPXBjaWUuMSBcDQoNCj4g
DQo+IEZvciBTTU1VdjMsIE5WSURJQS1zcGVjaWZpYyB2Q01EUSwgaXQgbmVlZHMgYSBwYXJhbWV0
ZXIgdG8gc3RhdGUgdGhhdA0KPiBzcGVjaWZpY2FsbHksDQo+IHNpbmNlIEknbSBjb25jbHVkaW5n
IGZyb20gcmVhZGluZyB0aGUgU01NVXYzIHZlcnNpb24gRy5hIHNwZWMsIHRoYXQNCj4gRUNNRFEg
d2FzIGFkZGVkDQo+IHRvIGJlIGFibGUgdG8gYXNzaWduIGFuIEVDTURRIHRvIGEgVk0sDQoNCk5v
dCBzdXJlIHRoZSBpbnRlbnRpb24gb2YgRUNNRFEgYXMgcGVyIHRoYXQgc3BlY2lmaWNhdGlvbiBp
cyB0byBhc3NpZ24NCml0IHRvIGEgVk0uIEkgdGhpbmsgdGhlIG1haW4gaWRlYSBiZWhpbmQgaXQg
aXMgdG8gaGF2ZSBvbmUgQ29tbWFuZCBRdWV1ZSANCnBlciBob3N0IENQVSB0byBlbGltaW5hdGUg
bG9jayBjb250ZW50aW9uIHdoaWxlIHN1Ym1pdHRpbmcgY29tbWFuZHMNCnRvIFNNTVUuDQoNCkFG
QUlLIGl0IGlzIG5vdCBzYWZlIHRvIGFzc2lnbiBvbmUgb2YgdGhlIEVDTURRIHRvIGd1ZXN0IHll
dC4gSSB0aGluayB0aGVyZSBpcyBubw0Kd2F5IHlvdSBjYW4gYXNzb2NpYXRlIGEgVk1JRCB3aXRo
IEVDTURRLiBTbyB0aGVyZSBpcyBubyBwbGFuIHRvDQpzdXBwb3J0IEFSTSBFQ01EUSBub3cuDQoN
Ck5WSURJQSBWQ01EUSBpcyBhIGNvbXBsZXRlbHkgdmVuZG9yIHNwZWNpZmljIG9uZS4gUGVyaGFw
cyBBUk0gbWF5IGNvbWUNCnVwIHdpdGggYW4gYXNzaWduYWJsZSBDTURRIGluIGZ1dHVyZSB0aG91
Z2guDQoNCiBhbmQgbGV0IHRoZSBWTSBkbyBDTURRIGRyaXZlbg0KPiBpbnZhbGlkYXRpb25zIHZp
YQ0KPiBhIHNpbWlsYXIgbWVjaGFuaXNtIGFzIGFzc2lnbmVkIFBDSS1kZXZpY2UgbW1pbyBzcGFj
ZSBpbiBhIFZNLg0KPiBTbywgaG93IHNob3VsZCB0aGUgUUVNVSBpbnZvY2F0aW9uIHNlbGVjdCB3
aGF0IHBhcnRzIHRvICdhY2NlbCcgaW4gdGhlDQo+IHZTTU1VdjMgZ2l2ZW4NCj4gdG8gdGhlIFZN
PyAgLi4uIGFuZCBnaXZlbiB0aGUgaGlzdG9yeSBvZiBody1iYXNlZCwgdmlydC1hY2NlbGVyYXRp
b24sIEkgY2FuDQo+IG9ubHkgZ3Vlc3MNCj4gbW9yZSBTTU1VdjMgYWNjZWwgdHdlYWtzIHdpbGwg
YmUgZm91bmQvZGVzaXJlZC9pbXBsZW1lbnRlZC4NCj4gDQo+IFNvLCBnaXZlbiB0aGVyZSBpcyBh
biBOVklESUEtc3BlY2lmaWMvbGlrZSBFQ01EUSwgYnV0IGRpZmZlcmVudCwgdGhlIGFjY2VsDQo+
IHBhcmFtZXRlcg0KPiBjaG9zZW4gaGFzIHRvIGNvbnNpZGVyICduYW1lLXNwYWNlIGNvbGxpc2lv
bicsIGkuZS4sIGFjY2VsPW52LXZjbWRxICBhbmQNCj4gYWNjZWw9ZWNtZHEsDQo+IHVubGVzcyBz
dyBjYW4gYmUgbWFkZSB0byBzbWFydGx5IHByb2JlIGFuZCBkZXRlcm1pbmUgdGhlIHVuZGVybHlp
bmcNCj4gZGlmZnMsIGFuZCBoYXZlDQo+IGVxdWl2YWxlbnQgZnVuY3Rpb25hbGl0eSwgaW4gd2hp
Y2ggY2FzZSwgYSBzaW1wbGVyICdhY2NlbD12Y21kcScgY291bGQgYmUNCj4gdXNlZC4NCj4gDQoN
ClllcC4gUHJvYmFibHkgd2UgY291bGQgYWJzdHJhY3QgdGhhdCBmcm9tIHRoZSB1c2VyIGFuZCBo
YW5kbGUgaXQgd2l0aGluDQpRZW11IHdoZW4gdGhlIGtlcm5lbCByZXBvcnRzIHRoZSBjYXBhYmls
aXR5IGJhc2VkIG9uIHBoeXNpY2FsIFNNTVV2My4NCg0KPiBGaW5hbGx5LCB3cnQgbGlidmlydCwg
aG93IGRvZXMgaXQga25vdy90ZWxsIHdoYXQgY2FuIGFuZCBzaG91bGQgYmUgdXNlZD8NCj4gRm9y
IEVDTURRLCBzb21ldGhpbmcgdW5kZXIgc3lzZnMgZm9yIGFuIFNNTVV2MyBjb3VsZCBleHBvc2Ug
aXRzDQo+IHByZXNlbmNlL2NhcGFiaWxpdHkvYXZhaWxhYmlsaXR5DQo+ICh0YWcgZm9yIHVzZS9h
bGxvYydkIGZvciBhIFZNKSwgb3IgYW4gaW9jdGwvY2RldiBpL2YgdG8gdGhlIFNNTVV2My4NCj4g
QnV0IGhvdyBkb2VzIG9uZSBrbm93IHRvZGF5IHRoYXQgdGhlcmUncyBOVklESUEtdkNNRFEgc3Vw
cG9ydCBvbiBpdHMNCj4gU01NVXYzPyAtLSBpcyBpdA0KPiBleHBvc2VkIGluIHN5c2ZzLCBpb2N0
bCwgY2Rldj8NCg0KSSB0aGluayB0aGUgY2FwYWJpbGl0eSB3aWxsIGJlIHJlcG9ydGVkIHRocm91
Z2ggYSBJT0NUTC4gIE5pY29saW4gPw0KDQo+IC4uLiBhbmQgYWxsIG5lZWRzIHRvIGJlIHBlci1p
bnN0YW5jZSAuLi4uDQo+IC4uLiBsaWJ2aXJ0ICAob3IgYW55IG90aGVyIFZNTSBvcmNoZXN0cmF0
b3IpIHdpbGwgbmVlZCB0byBkZXRlcm1pbmUNCj4gY29tcGF0aWJpbGl0eSBmb3INCj4gICAgICBs
aXZlIG1pZ3JhdGlvbi4gZS5nLiwgY2FuIG9uZSBsaXZlIG1pZ3JhdGUgYW4gYWNjZWw9bnYtdmNt
ZHEtYmFzZWQgVk0gdG8NCj4gYSBob3N0IHdpdGgNCj4gICAgICBhY2NlbD1lY21kcSBzdXBwb3J0
PyAgb25seSBudi12Y21kcT8gIHdoYXQgaWYgdGhlcmUgYXJlIHZlcnNpb24gZGlmZnMgb2YNCj4g
bnYtdmNtZHEgb3ZlciB0aW1lPw0KPiAgICAgIC0tIGFwb2xvZ2llcywgYnV0IEkgZG9uJ3Qga25v
dyB0aGUgbWludXRlIGRldGFpbHMgb2YgbnYtdmNtZHEgdG8NCj4gZGV0ZXJtaW5lIGlmIHRoYXQn
cyB1bmxpa2VseSBvciBub3QuDQoNClllcy4gVGhpcyByZXF1aXJlIG1vcmUgdGhvdWdodC4gQnV0
IG91ciBmaXJzdCBhaW0gaXMgZ2V0IHRoZSBiYXNpYyBzbW11djMtYWNjZWwNCnN1cHBvcnQuDQoN
ClRoYW5rcywNClNoYW1lZXINCg0K
