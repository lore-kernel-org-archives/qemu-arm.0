Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3098359lfq;
        Mon, 14 Dec 2020 18:39:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo5jBsRQqiKHAVzSSoOFSW3v3MPIib4EZb+WfGzmRX/N99M8v9pdhxgqYJ86//XpJqqIjx
X-Received: by 2002:a5b:f4e:: with SMTP id y14mr39638673ybr.515.1607999966927;
        Mon, 14 Dec 2020 18:39:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607999966; cv=none;
        d=google.com; s=arc-20160816;
        b=Zv9MB0tnaz7m9xNNErjvFRWKjcvi8n1bZYm8NBruwGWZPGAs89AvWGn5Rru0SlUge1
         4iDX7pcu8Gd8K86Aw91SPbFmLZcDneQMa0TSfFyWudUcwtNOOOOZaJIu0I6WfgDFldSL
         aZsfYlpmqhcM1J2lxGPjAZBYJrWFhyYTstup8HIRovC0kxI5KGW04Qiw3uNCzaXZHzVs
         KTJm6ZCD9cubCqYfqYOuwsA+u+P7cWdwx26oFe2qdqCWMGdUPZelVYaxvtopUACvO3gQ
         VdzVl2FXqeeea//5MeKhm9g27RtWQMaSwIB4PVeWM/ahfbd5XwjKwu4W7uFs0XXtfAHV
         7K/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=0mY4sq/HvWjTxQQ/PiOPtgXnht+sFI6clJRofZlKZf0=;
        b=uAlgbzb91aWh+JZdP0WVdN2nXmQtfur3yBeHDdR9N03NLbQOAYj/k6P2CJacvQieqb
         HQUjgBoFiqE4Gp8z0rlYWDmcgysZF8+3MEjSQp5oQ68fTzZVOnoKJm7MNVxQFS7swpPE
         AKibyJfHBLjf+Iawf85SGmY0cTEePqVP5ZFP7b+yMWC1/Y1O7mFaX7BQqV/JVhqYA04s
         Ymwcf2ENhDu86EiTGvi8/O5EL9c2BUYvzUR4Gmskc5ktJv+mZRBWBfNiooAV0EWPFUdG
         QH0an6tb1J3VnfLDzv0z99CLEtYs4fJ8TC37JLFm0ueBgfkKq81UF6MH+XJj4VOcplLL
         M/MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si17660551ybo.429.2020.12.14.18.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 18:39:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp0FE-0001SN-PU
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 21:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kp0Eh-0001SE-MI; Mon, 14 Dec 2020 21:38:47 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kp0Eb-00025Z-2G; Mon, 14 Dec 2020 21:38:47 -0500
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Cw2Tt1Tsxz13TWC;
 Tue, 15 Dec 2020 10:37:22 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.165]) by
 dggemi401-hub.china.huawei.com ([10.3.17.134]) with mapi id 14.03.0487.000;
 Tue, 15 Dec 2020 10:38:13 +0800
From: ganqixin <ganqixin@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the
 finalize function to avoid memleaks
Thread-Topic: [PATCH 1/7] allwinner-a10-pit: Use ptimer_free() in the
 finalize function to avoid memleaks
Thread-Index: AQHWxI2HjKgbhI9ZF0iY+1sxKZ3D/an2VeKAgAAE7ACAAS/pAA==
Date: Tue, 15 Dec 2020 02:38:13 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065F5F11@DGGEMI525-MBS.china.huawei.com>
References: <20201127071803.2479462-1-ganqixin@huawei.com>
 <20201127071803.2479462-2-ganqixin@huawei.com>
 <CAFEAcA-UKFOeMhYpq7d+4igF_R584vKgvfuzGU0mT-vcEASFig@mail.gmail.com>
 <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
In-Reply-To: <CAFEAcA8pc+vCBj9fk+8jwXV6H0H3xOe2Q0HY2=irfkTRfwOVTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=ganqixin@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4gQ5Wc0E+LX5

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAx
NSwgMjAyMCAxMjoyMCBBTQ0KPiBUbzogZ2FucWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+DQo+
IENjOiBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47IFFFTVUgRGV2ZWxvcGVycw0KPiA8
cWVtdS1kZXZlbEBub25nbnUub3JnPjsgQ2hlbnF1biAoa3VobikNCj4gPGt1aG4uY2hlbnF1bkBo
dWF3ZWkuY29tPjsgWmhhbmdoYWlsaWFuZw0KPiA8emhhbmcuemhhbmdoYWlsaWFuZ0BodWF3ZWku
Y29tPjsgRXVsZXIgUm9ib3QNCj4gPGV1bGVyLnJvYm90QGh1YXdlaS5jb20+OyBCZW5pYW1pbm8g
R2FsdmFuaSA8Yi5nYWx2YW5pQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzdd
IGFsbHdpbm5lci1hMTAtcGl0OiBVc2UgcHRpbWVyX2ZyZWUoKSBpbiB0aGUNCj4gZmluYWxpemUg
ZnVuY3Rpb24gdG8gYXZvaWQgbWVtbGVha3MNCj4gDQo+IE9uIE1vbiwgMTQgRGVjIDIwMjAgYXQg
MTY6MDIsIFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gd3JvdGU6
DQo+ID4NCj4gPiBPbiBGcmksIDI3IE5vdiAyMDIwIGF0IDA3OjE5LCBHYW4gUWl4aW4gPGdhbnFp
eGluQGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IFdoZW4gcnVubmluZyBkZXZpY2Ut
aW50cm9zcGVjdC10ZXN0LCBhIG1lbW9yeSBsZWFrIG9jY3VycmVkIGluIHRoZQ0KPiA+ID4gYTEw
X3BpdF9pbml0IGZ1bmN0aW9uLCBzbyB1c2UgcHRpbWVyX2ZyZWUoKSBpbiB0aGUgZmluYWxpemUg
ZnVuY3Rpb24gdG8NCj4gYXZvaWQgaXQuDQo+ID4gPg0KPiA+ID4gQVNBTiBzaG93cyBtZW1vcnkg
bGVhayBzdGFjazoNCj4gPiA+DQo+ID4gPiBJbmRpcmVjdCBsZWFrIG9mIDI4OCBieXRlKHMpIGlu
IDYgb2JqZWN0KHMpIGFsbG9jYXRlZCBmcm9tOg0KPiA+ID4gICAgICMwIDB4ZmZmZmFiOTdlMWYw
IGluIF9faW50ZXJjZXB0b3JfY2FsbG9jDQo+ICgvbGliNjQvbGliYXNhbi5zby41KzB4ZWUxZjAp
DQo+ID4gPiAgICAgIzEgMHhmZmZmYWIyNTY4MDAgaW4gZ19tYWxsb2MwICgvbGliNjQvbGliZ2xp
Yi0yLjAuc28uMCsweDU2ODAwKQ0KPiA+ID4gICAgICMyIDB4YWFhYmY1NTVkYjg0IGluIHRpbWVy
X25ld19mdWxsDQo+IC9xZW11L2luY2x1ZGUvcWVtdS90aW1lci5oOjUyMw0KPiA+ID4gICAgICMz
IDB4YWFhYmY1NTVkYjg0IGluIHRpbWVyX25ldw0KPiAvcWVtdS9pbmNsdWRlL3FlbXUvdGltZXIu
aDo1NDQNCj4gPiA+ICAgICAjNCAweGFhYWJmNTU1ZGI4NCBpbiB0aW1lcl9uZXdfbnMNCj4gL3Fl
bXUvaW5jbHVkZS9xZW11L3RpbWVyLmg6NTYyDQo+ID4gPiAgICAgIzUgMHhhYWFiZjU1NWRiODQg
aW4gcHRpbWVyX2luaXQgL3FlbXUvaHcvY29yZS9wdGltZXIuYzo0MzMNCj4gPiA+ICAgICAjNiAw
eGFhYWJmNTc0MTVlOCBpbiBhMTBfcGl0X2luaXQNCj4gL3FlbXUvaHcvdGltZXIvYWxsd2lubmVy
LWExMC1waXQuYzoyNzgNCj4gPiA+ICAgICAjNyAweGFhYWJmNjMzOWY2YyBpbiBvYmplY3RfaW5p
dGlhbGl6ZV93aXRoX3R5cGUNCj4gL3FlbXUvcW9tL29iamVjdC5jOjUxNQ0KPiA+ID4gICAgICM4
IDB4YWFhYmY2MzNjYTA0IGluIG9iamVjdF9pbml0aWFsaXplX2NoaWxkX3dpdGhfcHJvcHN2DQo+
IC9xZW11L3FvbS9vYmplY3QuYzo1NjQNCj4gPiA+ICAgICAjOSAweGFhYWJmNjMzY2MwOCBpbiBv
YmplY3RfaW5pdGlhbGl6ZV9jaGlsZF93aXRoX3Byb3BzDQo+IC9xZW11L3FvbS9vYmplY3QuYzo1
NDcNCj4gPiA+ICAgICAjMTAgMHhhYWFiZjViOTQ2ODAgaW4gYXdfYTEwX2luaXQNCj4gL3FlbXUv
aHcvYXJtL2FsbHdpbm5lci1hMTAuYzo0OQ0KPiA+ID4gICAgICMxMSAweGFhYWJmNjMzOWY2YyBp
biBvYmplY3RfaW5pdGlhbGl6ZV93aXRoX3R5cGUNCj4gL3FlbXUvcW9tL29iamVjdC5jOjUxNQ0K
PiA+ID4gICAgICMxMiAweGFhYWJmNjMzYTFlMCBpbiBvYmplY3RfbmV3X3dpdGhfdHlwZQ0KPiA+
ID4gL3FlbXUvcW9tL29iamVjdC5jOjcyOQ0KPiA+ID4NCj4gPiA+IFJlcG9ydGVkLWJ5OiBFdWxl
ciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdh
biBRaXhpbiA8Z2FucWl4aW5AaHVhd2VpLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gQ2M6IEJlbmlh
bWlubyBHYWx2YW5pIDxiLmdhbHZhbmlAZ21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgaHcv
dGltZXIvYWxsd2lubmVyLWExMC1waXQuYyB8IDIxICsrKysrKysrKysrKysrKystLS0tLQ0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9ody90aW1lci9hbGx3aW5uZXItYTEwLXBpdC5jDQo+ID4g
PiBiL2h3L3RpbWVyL2FsbHdpbm5lci1hMTAtcGl0LmMgaW5kZXggZjg0ZmMwZWEyNS4uYmUyMTE5
ODNiMA0KPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2h3L3RpbWVyL2FsbHdpbm5lci1hMTAtcGl0LmMN
Cj4gPiA+ICsrKyBiL2h3L3RpbWVyL2FsbHdpbm5lci1hMTAtcGl0LmMNCj4gPiA+IEBAIC0yNzks
NiArMjc5LDE2IEBAIHN0YXRpYyB2b2lkIGExMF9waXRfaW5pdChPYmplY3QgKm9iaikNCj4gPiA+
ICAgICAgfQ0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiArc3RhdGljIHZvaWQgYTEwX3BpdF9maW5h
bGl6ZShPYmplY3QgKm9iaikgew0KPiA+ID4gKyAgICBBd0ExMFBJVFN0YXRlICpzID0gQVdfQTEw
X1BJVChvYmopOw0KPiA+ID4gKyAgICBpbnQgaTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgZm9yIChp
ID0gMDsgaSA8IEFXX0ExMF9QSVRfVElNRVJfTlI7IGkrKykgew0KPiA+ID4gKyAgICAgICAgcHRp
bWVyX2ZyZWUocy0+dGltZXJbaV0pOw0KPiA+ID4gKyAgICB9DQo+ID4gPiArfQ0KPiA+ID4gKw0K
PiA+ID4gIHN0YXRpYyB2b2lkIGExMF9waXRfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3Ms
IHZvaWQgKmRhdGEpICB7DQo+ID4gPiAgICAgIERldmljZUNsYXNzICpkYyA9IERFVklDRV9DTEFT
UyhrbGFzcyk7IEBAIC0yOTAsMTEgKzMwMCwxMg0KPiBAQA0KPiA+ID4gc3RhdGljIHZvaWQgYTEw
X3BpdF9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkgIH0NCj4gPiA+
DQo+ID4gPiAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIGExMF9waXRfaW5mbyA9IHsNCj4gPiA+IC0g
ICAgLm5hbWUgPSBUWVBFX0FXX0ExMF9QSVQsDQo+ID4gPiAtICAgIC5wYXJlbnQgPSBUWVBFX1NZ
U19CVVNfREVWSUNFLA0KPiA+ID4gLSAgICAuaW5zdGFuY2Vfc2l6ZSA9IHNpemVvZihBd0ExMFBJ
VFN0YXRlKSwNCj4gPiA+IC0gICAgLmluc3RhbmNlX2luaXQgPSBhMTBfcGl0X2luaXQsDQo+ID4g
PiAtICAgIC5jbGFzc19pbml0ID0gYTEwX3BpdF9jbGFzc19pbml0LA0KPiA+ID4gKyAgICAubmFt
ZSAgICAgICAgICAgICAgPSBUWVBFX0FXX0ExMF9QSVQsDQo+ID4gPiArICAgIC5wYXJlbnQgICAg
ICAgICAgICA9IFRZUEVfU1lTX0JVU19ERVZJQ0UsDQo+ID4gPiArICAgIC5pbnN0YW5jZV9zaXpl
ICAgICA9IHNpemVvZihBd0ExMFBJVFN0YXRlKSwNCj4gPiA+ICsgICAgLmluc3RhbmNlX2luaXQg
ICAgID0gYTEwX3BpdF9pbml0LA0KPiA+ID4gKyAgICAuaW5zdGFuY2VfZmluYWxpemUgPSBhMTBf
cGl0X2ZpbmFsaXplLA0KPiA+ID4gKyAgICAuY2xhc3NfaW5pdCAgICAgICAgPSBhMTBfcGl0X2Ns
YXNzX2luaXQsDQo+ID4gPiAgfTsNCj4gPg0KPiA+IFBsZWFzZSBkb24ndCBtYWtlIHVucmVsYXRl
ZCB3aGl0ZXNwYWNlIGNoYW5nZXMgbGlrZSB0aGlzIGluIGEgcGF0Y2guDQo+ID4gV2UgZG9uJ3Qg
bGluZSB1cCB0aGUgYXNzaWdubWVudHMgaW4gdGhpcyBzb3J0IG9mIHN0cnVjdCAtLSB0aGlzIGlz
DQo+ID4gZGVsaWJlcmF0ZSwgc28gdGhhdCBpZiBhIG5ldyBsaW5lIGlzIGFkZGVkIHdob3NlIGZp
ZWxkIG5hbWUgaGFwcGVucyB0bw0KPiA+IGJlIGxvbmdlciB0aGFuIHRob3NlIHVzZWQgYWxyZWFk
eSwgdGhlIHBhdGNoIGRvZXMgbm90IGhhdmUgdG8gdG91Y2gNCj4gPiBhbGwgdGhlIGxpbmVzIGlu
IHRoZSBzdHJ1Y3QgdG8gbWFpbnRhaW4gdGhlIGZvcm1hdHRpbmcuDQo+ID4gSW5zdGVhZCB5b3Ug
Z2V0IGEgcmVhZGFibGUgZGlmZiB3aGVyZSBvbmx5IHRoZSBuZXcgbGluZSBjaGFuZ2VzLCBub3QN
Cj4gPiBhbGwgdGhlIG90aGVycy4NCj4gDQo+IEhtbS4gSGF2aW5nIHNhaWQgdGhhdCBJIHNlZSB0
aGF0IHRoZSBvdGhlciA2IGRldmljZXMgdG91Y2hlZCBieSB0aGlzIHNlcmllcw0KPiBkaWQgdXNl
IHRoZSBsaW5lLXVwLXRoZS1hc3NpZ25tZW50cyBzdHlsZS4NCj4gQW55d2F5LCB0aGUgc3R5bGUg
dGhpcyBkZXZpY2Ugd2FzIHVzaW5nIGlzIHRoZSByaWdodCBvbmUuDQoNClRoYW5rcyBmb3IgeW91
ciByZXBseSwgSSB3aWxsIHJlc2VuZCB0aGlzIHBhdGNoLiBCeSB0aGUgd2F5LCBkbyB3ZSBuZWVk
IHRvIGtlZXANCnRoZSBvdGhlciA2IGRldmljZXMgaW4gdGhlIHNhbWUgc3R5bGUgYXMgdGhpcyBk
ZXZpY2U/DQoNCkdhbiBRaXhpbg0K
