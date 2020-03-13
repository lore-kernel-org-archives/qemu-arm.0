Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1487664lfc;
        Thu, 12 Mar 2020 19:09:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vus5SqviDOkGP19SVVOGU+7ldVhFfzNzPlPX+gHft/WfzOt+xqZvEuGfMqP6cWaXIAjxWIY
X-Received: by 2002:a0c:c20f:: with SMTP id l15mr10296184qvh.157.1584065346244;
        Thu, 12 Mar 2020 19:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584065346; cv=none;
        d=google.com; s=arc-20160816;
        b=srTNtn22EjKdFP7LszDsDT26jrhZnJr1DxQDmrMU5DHuHIQP/li8o0c/Foy2qxcy1z
         w6UiL1QmCGuW6BbjM5CFwO4u4lKyXkb1zT39r/v6lG1M3TmEtYK71AcsZMI3KOqy5D0z
         ncbVUHPKVl7kSKYzmBh+kTYeetGKCjzbqZ6wuwuYrw4vkfDaXf6jZNFQXNDH6RBiG9LA
         uomHs+K/2EsKLKnmeMMCoRgIpwkI/S7ACyCh5q7RCfcrIz62wTsKuF+2ltJMlmi29g3x
         0DhT7vSN725rPEq/UEWvZeWglEKDfhs1Cdyd7Jzju/q88rBXCIw2689XmlNwpr9ytzNU
         USvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=lQkd0K2pLbZg8mbYtWSsHUQadHSizz1gDwDZQpRil6s=;
        b=ymtjFhEYFlxAPnbUm+BDM5HMBIaPoX1YtnnMj+X7F8S7Wb56Lq0NQxxLHjSHMcm7a8
         TFxFg05ZbmvF+oLbp4W7WHjAFRxVpL7Jb1lqhCy5dwr4jmgd9Z43XpeCz3hgFMz+eqrC
         QBlYCxnOPzfYt4rAkgoqLLo+dcZveP84V38G7VLEVJG9fCU4rsemA+H6rYYXVU2J6TtE
         OKAlE833XteyG1RtDl+UTLuIrUa/XwczTZCWtRy9A4RTGjuG5vFPWL3jClI2E6x0T7Rk
         +ELfCLfSdfqHN1qeJDJnj31mH+AxNrFawz2vZR28Bb22vhWpv5ifjDoaxAI+XU5qWzIK
         J+AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si3022901qtc.348.2020.03.12.19.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 19:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCZl3-0007Tn-Lt
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 22:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jCZks-0007Lt-FR
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 22:08:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jCZkr-0000tJ-97
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 22:08:54 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:57146 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jCZkq-0000Zb-U8; Thu, 12 Mar 2020 22:08:53 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 9E4DC39F7A909A71E33F;
 Fri, 13 Mar 2020 10:08:46 +0800 (CST)
Received: from DGGEMM421-HUB.china.huawei.com (10.1.198.38) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 13 Mar 2020 10:08:45 +0800
Received: from DGGEMM511-MBX.china.huawei.com ([169.254.1.115]) by
 dggemm421-hub.china.huawei.com ([10.1.198.38]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 10:08:38 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Topic: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Index: AQHV8txXWFydji2esEaJwP7bouY1uqg/odiAgAHJJhCAA0i4AIABFKMA
Date: Fri, 13 Mar 2020 02:08:37 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B68BDEF@dggemm511-mbx.china.huawei.com>
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
 <CAFEAcA8fnz2oaa-CO-EEK_vQTWfPih4PrAB3i4UUgQpv9Y_4mg@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83B68019B@dggemm511-mbx.china.huawei.com>
 <CAFEAcA-q4t3yQcHaHzOGx2GpKpuW=kti51myuFK_K3aieRY3dg@mail.gmail.com>
In-Reply-To: <CAFEAcA-q4t3yQcHaHzOGx2GpKpuW=kti51myuFK_K3aieRY3dg@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.205.93]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.255
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
 QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J4utzSBkjnf+

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUGV0ZXIgTWF5ZGVsbCBbbWFpbHRv
OnBldGVyLm1heWRlbGxAbGluYXJvLm9yZ10NCj5TZW50OiBGcmlkYXksIE1hcmNoIDEzLCAyMDIw
IDE6MDEgQU0NCj5UbzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPg0K
PkNjOiBRRU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IFFFTVUgVHJpdmlh
bCA8cWVtdS0NCj50cml2aWFsQG5vbmdudS5vcmc+OyBaaGFuZ2hhaWxpYW5nIDx6aGFuZy56aGFu
Z2hhaWxpYW5nQGh1YXdlaS5jb20+Ow0KPkphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
OyBQZXRlciBDaHViYg0KPjxwZXRlci5jaHViYkBuaWN0YS5jb20uYXU+OyBxZW11LWFybSA8cWVt
dS1hcm1Abm9uZ251Lm9yZz47IEV1bGVyDQo+Um9ib3QgPGV1bGVyLnJvYm90QGh1YXdlaS5jb20+
DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gaHcvbmV0L2lteF9mZWM6IHdyaXRlIFRHU1IgYW5k
IFRDU1IzIGluDQo+aW14X2VuZXRfd3JpdGUoKQ0KPg0KPk9uIFR1ZSwgMTAgTWFyIDIwMjAgYXQg
MDg6MDgsIENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT4NCj53cm90ZToN
Cj4+DQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+ID5Gcm9tOiBQZXRlciBNYXlk
ZWxsIFttYWlsdG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPj4gPj4NCj4+ID4+IGRpZmYg
LS1naXQgYS9ody9uZXQvaW14X2ZlYy5jIGIvaHcvbmV0L2lteF9mZWMuYyBpbmRleA0KPj4gPj4g
NmExMjRhMTU0YS4uMzIyY2JkY2MxNyAxMDA2NDQNCj4+ID4+IC0tLSBhL2h3L25ldC9pbXhfZmVj
LmMNCj4+ID4+ICsrKyBiL2h3L25ldC9pbXhfZmVjLmMNCj4+ID4+IEBAIC04NTUsMTMgKzg1NSwx
NSBAQCBzdGF0aWMgdm9pZCBpbXhfZW5ldF93cml0ZShJTVhGRUNTdGF0ZSAqcywNCj4+ID51aW50
MzJfdCBpbmRleCwgdWludDMyX3QgdmFsdWUpDQo+PiA+PiAgICAgICAgICBicmVhazsNCj4+ID4+
ICAgICAgY2FzZSBFTkVUX1RHU1I6DQo+PiA+PiAgICAgICAgICAvKiBpbXBsZW1lbnQgY2xlYXIg
dGltZXIgZmxhZyAqLw0KPj4gPj4gLSAgICAgICAgdmFsdWUgPSB2YWx1ZSAmIDB4MDAwMDAwMGY7
DQo+PiA+PiArICAgICAgICBzLT5yZWdzW2luZGV4XSBePSBzLT5yZWdzW2luZGV4XSAmIHZhbHVl
Ow0KPj4gPj4gKyAgICAgICAgcy0+cmVnc1tpbmRleF0gJj0gMHgwMDAwMDAwZjsNCj4+ID4+ICAg
ICAgICAgIGJyZWFrOw0KPj4gPj4gICAgICBjYXNlIEVORVRfVENTUjA6DQo+PiA+PiAgICAgIGNh
c2UgRU5FVF9UQ1NSMToNCj4+ID4+ICAgICAgY2FzZSBFTkVUX1RDU1IyOg0KPj4gPj4gICAgICBj
YXNlIEVORVRfVENTUjM6DQo+PiA+PiAtICAgICAgICB2YWx1ZSA9IHZhbHVlICYgMHgwMDAwMDBm
ZDsNCj4+ID4+ICsgICAgICAgIHMtPnJlZ3NbaW5kZXhdID0gKHZhbHVlICYgMHgwMDAwMDA4MCkg
PyAoMHgwMDAwMDA3ZCAmIHZhbHVlKSA6DQo+PiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICh2YWx1ZSAmIDB4MDAwMDAwZmQpOw0KPj4gPj4gICAgICAgICAgYnJlYWs7DQo+PiA+PiAgICAg
IGNhc2UgRU5FVF9UQ0NSMDoNCj4+ID4+ICAgICAgY2FzZSBFTkVUX1RDQ1IxOg0KPj4gPg0KPj4g
PlRoaXMgaXNuJ3QgdGhlIHVzdWFsIHdheSB0byB3cml0ZSBXMUMgYmVoYXZpb3VyLg0KPj4gPklm
IGFsbCB0aGUgcmVsZXZhbnQgYml0cyBhcmUgVzFDLCBhcyBmb3IgVEdTUjoNCj4+ID4NCj4+ID4g
ICBzLT5yZWdzW2luZGV4XSAmPSB+KHZhbHVlICYgMHhmKTsgLyogYWxsIGJpdHMgVzFDICovDQo+
PiA+DQo+PiBZZXMsIGl0IGxvb2tzIGJldHRlci4NCj4+IEJ1dCBkbyB3ZSBuZWVkIGNsZWFyIHRo
ZSByZXNlcnZlZCBiaXQgKDMxIC0gNCBiaXRzKSBleHBsaWNpdGx5ID8NCj4NCj5Ob3QgbmVjZXNz
YXJpbHksIGJ1dCBpdCBzZWVtcyB0byBiZSBob3cgdGhlIG90aGVyIHJlZ2lzdGVycyBpbiB0aGUg
ZGV2aWNlIGhhdmUNCj5nZW5lcmFsbHkgYmVlbiBjb2RlZCwgYW5kIGl0J3MgY2xlYXJseSB3aGF0
IHRoZSBpbnRlbnQgd2FzIGhlcmUgZ2l2ZW4gdGhhdCB0aGUNCj5vcmlnaW5hbCAoYnVnZ3kpIGNv
ZGUgd2FzIG1hc2tpbmcgb3V0IHJlc2VydmVkIGJpdHMuIFNvIEkgdGhpbmsgaXQgbWFrZXMgc2Vu
c2UNCj50byBjb250aW51ZSBpbiB0aGF0IHN0eWxlLg0KPg0KT0ssIGxldCdzIGtlZXAgb3JpZ2lu
YWwgY29kZSBzdHlsZSwgYW5kIGNsZWFyIHJlc2VydmVkIGJpdC4gIEkgd2lsbCBwcm92aWRlIHYz
IHZlcnNpb24gZm9yIGl0Lg0KDQpUaGFua3MuDQo=
