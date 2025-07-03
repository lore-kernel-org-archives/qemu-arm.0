Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp393863dyc;
        Thu, 3 Jul 2025 01:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+3TFih+SSAaIbRLN1wy6VzQg8tzvU6BnSLM+XUV6lIoQy6A4CHx5ROLSwwRlhcPn0Q0tPyi9iJntZOg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7vhOX/BlTZOqVmjKyGAJPvFLTXOKv4Ow/2c0a+h44HVWMzrle9zD9Z1iYLnsU6uuWSnAe
X-Received: by 2002:a17:90b:2547:b0:313:1769:eb49 with SMTP id 98e67ed59e1d1-31a90b342bbmr9013604a91.8.1751532807797;
        Thu, 03 Jul 2025 01:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751532807; cv=none;
        d=google.com; s=arc-20240605;
        b=Ho5A8aTD+erLC0ltwLB06A+wy5PSTcB9i+g5gjko1VS8T2nS0TJuvXgQukVkuNCZJS
         BeoYaRs0fgCDK3qg2klEhaC63k6F4x3eudMAqxLwqcmjfkMKBWiR94R7i2Yy71HZ6Bxu
         Vj87/0Xb8Y+DJfk/tnB5I3smhqcY8KXJK2SqB1zLtgEow7Q9A2IzQdfqGMr7PcCHwhSA
         lGcplA7zi2XAtgBTJxyn2c/x7jryxSnwPdWKskExB9oOxJ9udenO/Ep5Zm5HC5Kukccc
         QgDjNjvPbT+UfnDNSbIUc9nZSq0toegZeQnnuLoUU8j3VkWNWnC2YiL/L2CFedha2JX4
         pTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=XJVik+IF+CdbGH74LLfocMUagCsaDV9TqlbhLqvITPk=;
        fh=Qc7v90z1+o3yQ/29DTmWnc/Po+VgiM9vrZbD6joHDWQ=;
        b=NFis2G25dkK/pUyG8B2PZ0qyIImlJNRrUD82Hv263cvNIvOyjBc6lKKWD8tMZfn6Ig
         cqRF9OfblocovFev33vinSy+yOySQlrHYsMMNESs+ahyKFlpgx0uYRNJ18eHI4eB/lql
         ucMNYFdERKtaQ6VAh9zh9m55uXHjUz/41iGxtKCb469ADfEps4zEyKeW6E2m5zXOnyFU
         sPmCA7DXfkZThxtEbhE0qZCnlBwj5b/BYYFPjFYwUnZnZt8sAGQYOc3OkU82Na3DBsVz
         oHj9rUIS94yiRLnerKAUCpdemLWFV8XLaGXs/TD3Mr4pb9c5XT4w3CtWc+U5VUUUwj/8
         y3uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=shameerali.kolothum.thodi@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <shameerali.kolothum.thodi@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-31a9cc521easi2204935a91.4.2025.07.03.01.53.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=shameerali.kolothum.thodi@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bXrB22kwfz6M56l;
	Thu,  3 Jul 2025 16:52:26 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
	by mail.maildlp.com (Postfix) with ESMTPS id 3D63F140371;
	Thu,  3 Jul 2025 16:53:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Jul 2025 10:53:23 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 3 Jul 2025 10:53:23 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "mst@redhat.com" <mst@redhat.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "udo@hypervisor.org" <udo@hypervisor.org>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "imammedo@redhat.com"
	<imammedo@redhat.com>, "anisinha@redhat.com" <anisinha@redhat.com>
Subject: RE: [PATCH v6 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
Thread-Topic: [PATCH v6 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
Thread-Index: AQHb6GdIluK/HKdfpEOOBoHhxk8xYLQehR/wgAGZgoA=
Date: Thu, 3 Jul 2025 08:53:22 +0000
Message-ID: <b5c3eff0b98f4292907c1e66f7486d17@huawei.com>
References: <20250628195722.977078-1-gustavo.romero@linaro.org>
 <20250628195722.977078-9-gustavo.romero@linaro.org>
 <07a913cbe5ed461eab8951e4a8c4d17f@huawei.com>
In-Reply-To: <07a913cbe5ed461eab8951e4a8c4d17f@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: G98pSgpCP/6V

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhbWVlcmFsaSBLb2xv
dGh1bSBUaG9kaQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMiwgMjAyNSA5OjM0IEFNDQo+IFRv
OiAnR3VzdGF2byBSb21lcm8nIDxndXN0YXZvLnJvbWVyb0BsaW5hcm8ub3JnPjsgcWVtdS0NCj4g
ZGV2ZWxAbm9uZ251Lm9yZzsgZXJpYy5hdWdlckByZWRoYXQuY29tOyBwaGlsbWRAbGluYXJvLm9y
ZzsNCj4gbXN0QHJlZGhhdC5jb20NCj4gQ2M6IHFlbXUtYXJtQG5vbmdudS5vcmc7IGFsZXguYmVu
bmVlQGxpbmFyby5vcmc7IHVkb0BoeXBlcnZpc29yLm9yZzsNCj4gYWpvbmVzQHZlbnRhbmFtaWNy
by5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsg
YW5pc2luaGFAcmVkaGF0LmNvbQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY2IDgvOV0gaHcvYXJt
L3ZpcnQtYWNwaS1idWlsZDogRml4IEFDUEkgSU9SVCBhbmQgTUFEVA0KPiB0YWJsZXMgd2hlbiBp
dHM9b2ZmDQo+IA0KPiBIaSBHdXN0YXZvLA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IHFlbXUtZGV2ZWwtDQo+ID4gYm91bmNlcytzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpPWh1YXdlaS5jb21Abm9uZ251Lm9yZyA8cWVtdS0NCj4gPiBkZXZlbC1ib3VuY2Vz
K3NoYW1lZXJhbGkua29sb3RodW0udGhvZGk9aHVhd2VpLmNvbUBub25nbnUub3JnPg0KPiBPbg0K
PiA+IEJlaGFsZiBPZiBHdXN0YXZvIFJvbWVybw0KPiA+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDI4
LCAyMDI1IDg6NTcgUE0NCj4gPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBlcmljLmF1Z2Vy
QHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOw0KPiA+IG1zdEByZWRoYXQuY29tDQo+
ID4gQ2M6IHFlbXUtYXJtQG5vbmdudS5vcmc7IGFsZXguYmVubmVlQGxpbmFyby5vcmc7DQo+ID4g
Z3VzdGF2by5yb21lcm9AbGluYXJvLm9yZzsgdWRvQGh5cGVydmlzb3Iub3JnOw0KPiA+IGFqb25l
c0B2ZW50YW5hbWljcm8uY29tOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7DQo+ID4gaW1hbW1l
ZG9AcmVkaGF0LmNvbTsgYW5pc2luaGFAcmVkaGF0LmNvbQ0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2
NiA4LzldIGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IEZpeCBBQ1BJIElPUlQgYW5kIE1BRFQNCj4g
PiB0YWJsZXMgd2hlbiBpdHM9b2ZmDQo+ID4NCj4gPiBDdXJyZW50bHksIHRoZSBJVFMgR3JvdXAg
bm9kZXMgaW4gdGhlIElPUlQgdGFibGUgYW5kIHRoZSBHSUMgSVRTIFN0cnVjdA0KPiA+IGluIHRo
ZSBNQURUIHRhYmxlIGFyZSBhbHdheXMgZ2VuZXJhdGVkLCBldmVuIGlmIEdJQyBJVFMgaXMgbm90
IGF2YWlsYWJsZQ0KPiA+IG9uIHRoZSBtYWNoaW5lLg0KPiA+DQo+ID4gVGhpcyBjb21taXQgZml4
ZXMgaXQgYnkgbm90IGdlbmVyYXRpbmcgdGhlIElUUyBHcm91cCBub2Rlcywgbm90IG1hcHBpbmcN
Cj4gPiBhbnkgb3RoZXIgbm9kZSB0byB0aGVtLCBhbmQgbm90IGFkdmVydGlzaW5nIHRoZSBHSUMg
SVRTIGluIHRoZSBNQURUDQo+ID4gdGFibGUsIHdoZW4gR0lDIElUUyBpcyBub3QgYXZhaWxhYmxl
IG9uIHRoZSBtYWNoaW5lLg0KPiA+DQo+ID4gU2luY2UgdGhlIGZpeCBjaGFuZ2VzIHRoZSBNQURU
IGFuZCBJT1JUIHRhYmxlcywgYWRkIHRoZSBibG9icyBmb3IgdGhlDQo+ID4gIml0cz1vZmYiIHRl
c3QgdG8gdGhlIGFsbG93IGxpc3QgYW5kIHVwZGF0ZSB0aGVtIGluIHRoZSBuZXh0IGNvbW1pdC4N
Cj4gPg0KPiA+IFRoaXMgY29tbWl0IGFsc28gcmVuYW1lcyB0aGUgc21tdV9pZG1hcHMgYW5kIGl0
c19pZG1hcHMgdmFyaWFibGVzIGluDQo+ID4gYnVpbGRfaW9ydCgpIHRvIHJjX3NtbXVfaWRtYXBz
IGFuZCByY19pdHNfaWRtYXBzLCByZXNwZWN0aXZlbHksIHRvIG1ha2UNCj4gPiBpdCBjbGVhcmVy
IHdoaWNoIG5vZGVzIGFyZSBpbnZvbHZlZCBpbiB0aGUgbWFwcGluZ3MgYXNzb2NpYXRlZCB3aXRo
DQo+ID4gdGhlc2UgdmFyaWFibGVzLg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFVkbyBTdGVpbmJl
cmcgPHVkb0BoeXBlcnZpc29yLm9yZz4NCj4gPiBSZXNvbHZlczogaHR0cHM6Ly9naXRsYWIuY29t
L3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzI4ODYNCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdXN0
YXZvIFJvbWVybyA8Z3VzdGF2by5yb21lcm9AbGluYXJvLm9yZz4NCj4gPiBDby1hdXRob3JlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiA+IC0tLQ0K
PiA+ICBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMgICAgICAgICAgICAgICAgICAgIHwgMTQyICsr
KysrKysrKysrKy0tLS0tLS0tDQo+ID4gIHRlc3RzL3F0ZXN0L2Jpb3MtdGFibGVzLXRlc3QtYWxs
b3dlZC1kaWZmLmggfCAgIDIgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkwIGluc2VydGlvbnMo
KyksIDU0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LWFj
cGktYnVpbGQuYyBiL2h3L2FybS92aXJ0LWFjcGktYnVpbGQuYw0KPiA+IGluZGV4IDA2ODM4M2Y5
ODIuLmVmZjBkNjk4ZGYgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5j
DQo+ID4gKysrIGIvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+ID4gQEAgLTI2Nyw3ICsyNjcs
NyBAQCBzdGF0aWMgaW50IGlvcnRfaWRtYXBfY29tcGFyZShnY29uc3Rwb2ludGVyIGEsDQo+ID4g
Z2NvbnN0cG9pbnRlciBiKQ0KPiA+ICB9DQo+ID4NCj4gPiAgLyogQ29tcHV0ZSBJRCByYW5nZXMg
KFJJRHMpIGZyb20gUkMgdGhhdCBhcmUgZGlyZWN0ZWQgdG8gdGhlIElUUyBHcm91cA0KPiA+IG5v
ZGUgKi8NCj4gPiAtc3RhdGljIHZvaWQgY3JlYXRlX2l0c19pZG1hcHMoR0FycmF5ICppdHNfaWRt
YXBzLCBHQXJyYXkNCj4gKnNtbXVfaWRtYXBzKQ0KPiA+ICtzdGF0aWMgdm9pZCBjcmVhdGVfcmNf
aXRzX2lkbWFwcyhHQXJyYXkgKml0c19pZG1hcHMsIEdBcnJheQ0KPiA+ICpzbW11X2lkbWFwcykN
Cj4gPiAgew0KPiA+ICAgICAgQWNwaUlvcnRJZE1hcHBpbmcgKmlkbWFwOw0KPiA+ICAgICAgQWNw
aUlvcnRJZE1hcHBpbmcgbmV4dF9yYW5nZSA9IHswfTsNCj4gPiBAQCAtMzE0LDggKzMxNCw4IEBA
IGJ1aWxkX2lvcnQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsDQo+ID4g
VmlydE1hY2hpbmVTdGF0ZSAqdm1zKQ0KPiA+ICAgICAgaW50IGksIG5iX25vZGVzLCByY19tYXBw
aW5nX2NvdW50Ow0KPiA+ICAgICAgc2l6ZV90IG5vZGVfc2l6ZSwgc21tdV9vZmZzZXQgPSAwOw0K
PiA+ICAgICAgdWludDMyX3QgaWQgPSAwOw0KPiA+IC0gICAgR0FycmF5ICpzbW11X2lkbWFwcyA9
IGdfYXJyYXlfbmV3KGZhbHNlLCB0cnVlLA0KPiA+IHNpemVvZihBY3BpSW9ydElkTWFwcGluZykp
Ow0KPiA+IC0gICAgR0FycmF5ICppdHNfaWRtYXBzID0gZ19hcnJheV9uZXcoZmFsc2UsIHRydWUs
DQo+ID4gc2l6ZW9mKEFjcGlJb3J0SWRNYXBwaW5nKSk7DQo+ID4gKyAgICBHQXJyYXkgKnJjX3Nt
bXVfaWRtYXBzID0gZ19hcnJheV9uZXcoZmFsc2UsIHRydWUsDQo+ID4gc2l6ZW9mKEFjcGlJb3J0
SWRNYXBwaW5nKSk7DQo+ID4gKyAgICBHQXJyYXkgKnJjX2l0c19pZG1hcHMgPSBnX2FycmF5X25l
dyhmYWxzZSwgdHJ1ZSwNCj4gPiBzaXplb2YoQWNwaUlvcnRJZE1hcHBpbmcpKTsNCj4gPg0KPiA+
ICAgICAgQWNwaVRhYmxlIHRhYmxlID0geyAuc2lnID0gIklPUlQiLCAucmV2ID0gMywgLm9lbV9p
ZCA9IHZtcy0+b2VtX2lkLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAub2VtX3RhYmxl
X2lkID0gdm1zLT5vZW1fdGFibGVfaWQgfTsNCj4gPiBAQCAtMzI0LDIyICszMjQsMzggQEAgYnVp
bGRfaW9ydChHQXJyYXkgKnRhYmxlX2RhdGEsIEJJT1NMaW5rZXINCj4gKmxpbmtlciwNCj4gPiBW
aXJ0TWFjaGluZVN0YXRlICp2bXMpDQo+ID4NCj4gPiAgICAgIGlmICh2bXMtPmlvbW11ID09IFZJ
UlRfSU9NTVVfU01NVVYzKSB7DQo+ID4gICAgICAgICAgb2JqZWN0X2NoaWxkX2ZvcmVhY2hfcmVj
dXJzaXZlKG9iamVjdF9nZXRfcm9vdCgpLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpb3J0X2hvc3RfYnJpZGdlcywgc21tdV9pZG1hcHMpOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb3J0X2hvc3RfYnJpZGdlcywgcmNf
c21tdV9pZG1hcHMpOw0KPiA+DQo+ID4gICAgICAgICAgLyogU29ydCB0aGUgc21tdSBpZG1hcCBi
eSBpbnB1dF9iYXNlICovDQo+ID4gLSAgICAgICAgZ19hcnJheV9zb3J0KHNtbXVfaWRtYXBzLCBp
b3J0X2lkbWFwX2NvbXBhcmUpOw0KPiA+ICsgICAgICAgIGdfYXJyYXlfc29ydChyY19zbW11X2lk
bWFwcywgaW9ydF9pZG1hcF9jb21wYXJlKTsNCj4gPg0KPiA+ICAJLyoNCj4gPiAgCSAqIEtub3dp
bmcgdGhlIElEIHJhbmdlcyBmcm9tIHRoZSBSQyB0byB0aGUgU01NVSwgaXQncyBwb3NzaWJsZSB0
bw0KPiA+ICAJICogZGV0ZXJtaW5lIHRoZSBJRCByYW5nZXMgZnJvbSBSQyB0aGF0IGFyZSBkaXJl
Y3RlZCB0byB0aGUgSVRTLg0KPiA+ICAJICovDQo+ID4gLSAgICAgICAgY3JlYXRlX2l0c19pZG1h
cHMoaXRzX2lkbWFwcywgc21tdV9pZG1hcHMpOw0KPiA+ICsgICAgICAgIGNyZWF0ZV9yY19pdHNf
aWRtYXBzKHJjX2l0c19pZG1hcHMsIHJjX3NtbXVfaWRtYXBzKTsNCj4gDQo+IEhtbS4uLm5vdCBz
dXJlIHdoeSB3ZSBzdGlsbCBuZWVkIHRoZSBhYm92ZSBub3cgYXMgdGhpcyBpcyBiZWluZyBtb3Zl
ZA0KPiBkb3duDQo+IGZvciB2bXMtPml0cyBpcyBzZXQgY2FzZS4NCj4gDQo+IEkgaGFkIGEgbG9v
ayBhdCB2NSwgd2hpY2ggc2VlbXMgdG8gYmUgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nLg0KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjUwNjIzMTM1NzQ5LjY5MTEzNy05LQ0K
PiBndXN0YXZvLnJvbWVyb0BsaW5hcm8ub3JnLw0KPiANCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZyBoZXJlPw0KDQpJIGhhdmUgaW5jbHVkZWQgYSBmaXggZm9yIHRoZSBhYm92ZSBpbiBteSBT
TU1VdjMgZGV2IHNlcmllcyBoZXJlLA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZl
bC8yMDI1MDcwMzA4NDY0My44NTc0MC0yLXNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2Vp
LmNvbS8NCg0KUGxlYXNlIHRha2UgYSBsb29rIGFuZCBsZXQgbWUga25vdyBpZiBpdCBkb2Vzbid0
IG1ha2Ugc2Vuc2UuDQoNClRoYW5rcywNClNoYW1lZXINCg0K
