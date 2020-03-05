Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2771231lfi;
        Thu, 5 Mar 2020 03:05:16 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtOKpSlb/KcIZb6zFh70dw5fDj86CreElFh/x2xd7J9v6BiQryBWvoljct0YIwOQwKVVIGa
X-Received: by 2002:ac8:5484:: with SMTP id h4mr6572180qtq.209.1583406315597;
        Thu, 05 Mar 2020 03:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583406315; cv=none;
        d=google.com; s=arc-20160816;
        b=sxXtxsCSPgwyHazdWPVPAwBHffSkmSm1rm68SnTGFx1Tu8rQey7THueBL2Eqb5K3BK
         tnGD98Qc64NxkolD58ZME8LQnRKhc08a9e5/VeE+1aBZtEAds5Jh30njJY1FHcZPb4mp
         3jcPdEBZKK/opiLQ6fONCBNZQlB6H029oxSdsmg8s2AQ3XeVkAOjXptRXm2GNENnVMJl
         gMm6gu0j9kNbM9WQbfQ26of97vDsfAKDUv4Mx1a9LH0rW0rQ0q6CnniRiH/IG/z3getu
         roAK/1zO/BfEqQXmXWlmSgRBbJ1OHMEfZnc2u5Zc38EF2YLUTKZM5EbEsrYl4F1IZqMW
         vAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=DZdqMh4lkKUPXZUiVFm3HTy2SG0x3qjZye+yTYMwsw0=;
        b=s5Vk8N4bqrHSx6isEN6sjqqYNEwW3JUQdvLzFv4ZKM2092wYxk4U7zIvwyKhs/7oh5
         nsd4siidmcGJYhgi9+8n79EdKVsYU8+RP1HxN5g0EdsOUcFwv1Dpe2F51ZEMmSf8F8BM
         uM+TRziu4g6zq4uSu8Sx62XAt1KlceibMxxSNy9Ml9QSZHXd1rRysjPJONnSQzXnS//I
         3pscDySc02RQH4huXSvwwCBgYJwKR8Rbkui+ErMkVNp+sYB7lVgbb5B3Dxs5Gqrb8+av
         +qmd9p7NgIHNrgIx0hc/A05/I/f74qNYuUTDIwyXkCAUkLva5BRQoUL6jvP+LTNnMnqi
         0AJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si1697257qto.125.2020.03.05.03.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 03:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9oJW-0006Oc-Uq
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 06:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j9oJN-0006OI-VM
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 06:05:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j9oJM-0002cE-CI
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 06:05:05 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:51302 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j9oJM-0002Xb-2E; Thu, 05 Mar 2020 06:05:04 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 54C90AAAFE4961260910;
 Thu,  5 Mar 2020 19:04:58 +0800 (CST)
Received: from DGGEMM424-HUB.china.huawei.com (10.1.198.41) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 5 Mar 2020 19:04:57 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.163]) by
 dggemm424-hub.china.huawei.com ([10.1.198.41]) with mapi id 14.03.0439.000;
 Thu, 5 Mar 2020 19:04:47 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Topic: [PATCH v2] hw/net/imx_fec: write TGSR and TCSR3 in
 imx_enet_write()
Thread-Index: AQHV8txXWFydji2esEaJwP7bouY1uqg507VQ
Date: Thu, 5 Mar 2020 11:04:46 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B66DA01@dggemm531-mbx.china.huawei.com>
References: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200305105325.31264-1-kuhn.chenqun@huawei.com>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gJ0bpkBz+oXd

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hlbnF1biAoa3VobikNCj5TZW50
OiBUaHVyc2RheSwgTWFyY2ggNSwgMjAyMCA2OjUzIFBNDQo+VG86IHFlbXUtZGV2ZWxAbm9uZ251
Lm9yZzsgcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCj5DYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnOyBaaGFuZ2hhaWxpYW5nDQo+PHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT47IGph
c293YW5nQHJlZGhhdC5jb207DQo+cGV0ZXIuY2h1YmJAbmljdGEuY29tLmF1OyBxZW11LWFybUBu
b25nbnUub3JnOyBDaGVucXVuIChrdWhuKQ0KPjxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT47IEV1
bGVyIFJvYm90IDxldWxlci5yb2JvdEBodWF3ZWkuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCB2Ml0g
aHcvbmV0L2lteF9mZWM6IHdyaXRlIFRHU1IgYW5kIFRDU1IzIGluDQo+aW14X2VuZXRfd3JpdGUo
KQ0KPg0KPlRoZSBjdXJyZW50IGNvZGUgY2F1c2VzIGNsYW5nIHN0YXRpYyBjb2RlIGFuYWx5emVy
IGdlbmVyYXRlIHdhcm5pbmc6DQo+aHcvbmV0L2lteF9mZWMuYzo4NTg6OTogd2FybmluZzogVmFs
dWUgc3RvcmVkIHRvICd2YWx1ZScgaXMgbmV2ZXIgcmVhZA0KPiAgICAgICAgdmFsdWUgPSB2YWx1
ZSAmIDB4MDAwMDAwMGY7DQo+ICAgICAgICBeICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fg0KPmh3
L25ldC9pbXhfZmVjLmM6ODY0Ojk6IHdhcm5pbmc6IFZhbHVlIHN0b3JlZCB0byAndmFsdWUnIGlz
IG5ldmVyIHJlYWQNCj4gICAgICAgIHZhbHVlID0gdmFsdWUgJiAweDAwMDAwMGZkOw0KPiAgICAg
ICAgXiAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn4NCj4NCj5BY2NvcmRpbmcgdG8gdGhlIGRlZmlu
aXRpb24gb2YgdGhlIGZ1bmN0aW9uLCB0aGUgdHdvIOKAnHZhbHVl4oCdIGFzc2lnbm1lbnRzDQo+
c2hvdWxkIGJlIHdyaXR0ZW4gdG8gcmVnaXN0ZXJzLg0KPg0KPlJlcG9ydGVkLWJ5OiBFdWxlciBS
b2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj5TaWduZWQtb2ZmLWJ5OiBDaGVuIFF1biA8
a3Vobi5jaGVucXVuQGh1YXdlaS5jb20+DQo+LS0tDQo+djEtPnYyOg0KPiAgVGhlIHJlZ2lzdGVy
ICdFTkVUX1RHU1InIHdyaXRlLTEtdG8tY2xlYXIgdGltZXIgZmxhZy4NCj4gIFRoZSByZWdpc3Rl
ciAnRU5FVF9UQ1NSbicgN2JpdChURikgd3JpdGUtMS10by1jbGVhciB0aW1lciBmbGFnLg0KPi0t
LQ0KPiBody9uZXQvaW14X2ZlYy5jIHwgNiArKysrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvaHcvbmV0L2lteF9m
ZWMuYyBiL2h3L25ldC9pbXhfZmVjLmMgaW5kZXgNCj42YTEyNGExNTRhLi4zMjJjYmRjYzE3IDEw
MDY0NA0KPi0tLSBhL2h3L25ldC9pbXhfZmVjLmMNCj4rKysgYi9ody9uZXQvaW14X2ZlYy5jDQo+
QEAgLTg1NSwxMyArODU1LDE1IEBAIHN0YXRpYyB2b2lkIGlteF9lbmV0X3dyaXRlKElNWEZFQ1N0
YXRlICpzLA0KPnVpbnQzMl90IGluZGV4LCB1aW50MzJfdCB2YWx1ZSkNCj4gICAgICAgICBicmVh
azsNCj4gICAgIGNhc2UgRU5FVF9UR1NSOg0KPiAgICAgICAgIC8qIGltcGxlbWVudCBjbGVhciB0
aW1lciBmbGFnICovDQo+LSAgICAgICAgdmFsdWUgPSB2YWx1ZSAmIDB4MDAwMDAwMGY7DQo+KyAg
ICAgICAgcy0+cmVnc1tpbmRleF0gXj0gcy0+cmVnc1tpbmRleF0gJiB2YWx1ZTsNCj4rICAgICAg
ICBzLT5yZWdzW2luZGV4XSAmPSAweDAwMDAwMDBmOw0KPg0KSW4gImkuTVggNkR1YWwvNlF1YWQg
QXBwbGljYXRpb25zIFByb2Nlc3NvciBSZWZlcmVuY2UgTWFudWFsIiBkb2N1bWVudGF0aW9uLCAg
DQp0aGUgcmVnaXN0ZXIgICdFTkVUX1RHU1InICBhbGwgIGZpZWxkcyBURm4gIGlzIHdyaXRlLTEt
dG8tY2xlYXIuIA0KSXQgaXMgZGVzY3JpYmVkIGluIGRldGFpbCBhcyBmb2xsb3dz77yaDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpGaWVs
ZCAgICAgICAgICBEZXNjcmlwdGlvbg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KMzHigJM0ICAgICAgICAgVGhpcyBmaWVsZCBpcyByZXNl
cnZlZC4gIA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KMyAgICAgICAgICAgICAgQ29weSBPZiBUaW1lciBGbGFnIEZvciBDaGFubmVsIDMN
ClRGMyAgICAgICAgIDAgVGltZXIgRmxhZyBmb3IgQ2hhbm5lbCAzIGlzIGNsZWFyDQogICAgICAg
ICAgICAgICAgMSBUaW1lciBGbGFnIGZvciBDaGFubmVsIDMgaXMgc2V0DQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoyICAgICAgICAgICAg
IENvcHkgT2YgVGltZXIgRmxhZyBGb3IgQ2hhbm5lbCAyDQpURjIgICAgICAgICAwIFRpbWVyIEZs
YWcgZm9yIENoYW5uZWwgMiBpcyBjbGVhcg0KICAgICAgICAgICAgICAgIDEgVGltZXIgRmxhZyBm
b3IgQ2hhbm5lbCAyIGlzIHNldA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KMSAgICAgICAgICAgICAgQ29weSBPZiBUaW1lciBGbGFnIEZv
ciBDaGFubmVsIDENClRGMSAgICAgICAgIDAgVGltZXIgRmxhZyBmb3IgQ2hhbm5lbCAxIGlzIGNs
ZWFyDQogICAgICAgICAgICAgICAgMSBUaW1lciBGbGFnIGZvciBDaGFubmVsIDEgaXMgc2V0DQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQow
ICAgICAgICAgICAgICBDb3B5IE9mIFRpbWVyIEZsYWcgRm9yIENoYW5uZWwgMA0KVEYwICAgICAg
ICAgMCBUaW1lciBGbGFnIGZvciBDaGFubmVsIDAgaXMgY2xlYXINCiAgICAgICAgICAgICAgICAx
IFRpbWVyIEZsYWcgZm9yIENoYW5uZWwgMCBpcyBzZXQNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgICAgICAgIGJyZWFrOw0KPiAgICAg
Y2FzZSBFTkVUX1RDU1IwOg0KPiAgICAgY2FzZSBFTkVUX1RDU1IxOg0KPiAgICAgY2FzZSBFTkVU
X1RDU1IyOg0KPiAgICAgY2FzZSBFTkVUX1RDU1IzOg0KPi0gICAgICAgIHZhbHVlID0gdmFsdWUg
JiAweDAwMDAwMGZkOw0KPisgICAgICAgIHMtPnJlZ3NbaW5kZXhdID0gKHZhbHVlICYgMHgwMDAw
MDA4MCkgPyAoMHgwMDAwMDA3ZCAmIHZhbHVlKSA6DQo+KyAgICAgICAgICAgICAgICAgICAgICAg
ICAodmFsdWUgJiAweDAwMDAwMGZkKTsNCj4NClRoZSBFTkVUX1RDU1JuIGZpZWxkIGRlc2NyaXB0
aW9uczoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCkZpZWxkICAgICAgICAgIERlc2NyaXB0aW9uDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQozMeKAkzggICAgICBUaGlzIGZpZWxk
IGlzIHJlc2VydmVkLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo3ICAgICAgICAgICAgICBUaW1lciBGbGFnDQpURiAgICAgICAgICAgIFNl
dHMgd2hlbiBpbnB1dCBjYXB0dXJlIG9yIG91dHB1dCBjb21wYXJlIG9jY3Vycy4gDQogICAgICAg
ICAgICAgICAgVGhpcyBmbGFnIGlzIGRvdWJsZSBidWZmZXJlZCBiZXR3ZWVuIHRoZSBtb2R1bGUg
Y2xvY2sgYW5kIDE1ODggY2xvY2sgZG9tYWlucy4gDQogICAgICAgICAgICAgICAgV2hlbiB0aGlz
IGZpZWxkIGlzIDEsIGl0IGNhbiBiZSBjbGVhcmVkIHRvIDAgYnkgd3JpdGluZyAxdG8gaXQuDQoN
CiAgICAgICAgICAgICAgICAgMCBJbnB1dCBDYXB0dXJlIG9yIE91dHB1dCBDb21wYXJlIGhhcyBu
b3Qgb2NjdXJyZWQNCiAgICAgICAgICAgICAgICAgMSBJbnB1dCBDYXB0dXJlIG9yIE91dHB1dCBD
b21wYXJlIGhhcyBvY2N1cnJlZA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCjYgICAgICAgICAgICAgIFRpbWVyIEludGVycnVwdCBFbmFi
bGUNClRJRSAgICAgICAgICAgMCBJbnRlcnJ1cHQgaXMgZGlzYWJsZWQNCiAgICAgICAgICAgICAg
ICAgMSBJbnRlcnJ1cHQgaXMgZW5hYmxlZA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCjItNSAgICAgICAgICAgVGltZXIgTW9kZQ0KICAg
ICAgICAgICAgICAgICAuLi4uLi4uLi4uLi4uLi4uLi4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoxICAgICAgICAgICAgICBUaGlzIGZp
ZWxkIGlzIHJlc2VydmVkLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCjAgICAgICAgICAgICAgICAgVGltZXIgRE1BIFJlcXVlc3QgRW5h
YmxlICAgDQpURFJFICAgICAgICAwIERNQSByZXF1ZXN0IGlzIGRpc2FibGVkDQogICAgICAgICAg
ICAgICAgICAgMSBETUEgcmVxdWVzdCBpcyBlbmFibGVkDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQo+ICAgICAgICAgYnJlYWs7DQo+
ICAgICBjYXNlIEVORVRfVENDUjA6DQo+ICAgICBjYXNlIEVORVRfVENDUjE6DQo+LS0NCj4yLjIz
LjANCj4NCg0K
