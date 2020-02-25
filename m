Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1487921lfg;
        Tue, 25 Feb 2020 02:26:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmnHu0L2fx7xrDcPRn7LnAB3H0J1gvsE2HCE/X8ya6SfsdAhaJrNc/E/8e+GUdbaM86409
X-Received: by 2002:ae9:e8c4:: with SMTP id a187mr12207758qkg.243.1582626380430;
        Tue, 25 Feb 2020 02:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582626380; cv=none;
        d=google.com; s=arc-20160816;
        b=WuHMmTgtaCYhuzFB58Fu9QpDTYwZ9LUqYkrcZKFs9cDcQWUn+/9ZR5SByZ0BkEipEG
         TKerw3YMospO8pI4YADe6YJFdMkyUhHwjQqEkYpLGeEa+G/4XS201FsBdthFEfPmmKzd
         zC09s6donZFt5cClO9KqZYDU706IJJkfozzhJQQkZ/+u7MAPMFk6Eep3c/PhbYzkzMn5
         dBtKQqNleoBeobE4shIn0aHrgA/LWAYlQ5GcBPmhSyrB8eowRxXE+JWJAh8kl36Lj6vS
         tzBIFCZ1yCg7Yx+rsx0WWJnP2L7RY6AGbFqIvLcfLgJEz2q3VpnPr/HFO+n8HKcG1UIZ
         KQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=QkVErps+Z2fcgtM0lyZCja1Yw+ViI6FKprW8QSTAnyQ=;
        b=mk6uUo5K5ZT0QqAMqyDpz3MP4dt1K+2D1Lt004cBWcyHg7YDYBcuwRd4r+hK8UasNA
         RyjE/1ZAQMhIq1XTCnKepf5pvdIJmD6e2TRp7BjR81SM1Nqjv/ThKzUp0iVf8Z+IVJDY
         W3ct+pNZABSpgm76raOlIKt4UDv4P7P2o4+ULItZ35MafcE85EvglqvmbtZ7QEWnoy6c
         c5S64la7iBGkVC2TnAd0yS8NA4Ol7lGjOZjnuFh198TSmuW3DM2VeoXDGu7BRC2+I9em
         sM82QRDTx5A6HkfSVYIY2oaLsdTOEArYOO4eXmk+at595WF4oX725iXc82ZCAooXyQ0a
         wKrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si7556787qkk.69.2020.02.25.02.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 02:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6XPv-0002GJ-SD
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 05:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6XPm-0002G5-NW
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:26:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6XPl-0006Fx-AR
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:26:10 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:39366 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6XPk-0006ED-PB; Tue, 25 Feb 2020 05:26:09 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 92BFCEE6EE1832367D8B;
 Tue, 25 Feb 2020 18:26:02 +0800 (CST)
Received: from DGGEMM424-HUB.china.huawei.com (10.1.198.41) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 18:26:02 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.163]) by
 dggemm424-hub.china.huawei.com ([10.1.198.41]) with mapi id 14.03.0439.000;
 Tue, 25 Feb 2020 18:25:51 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Thread-Topic: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Thread-Index: AQHV64DJX5oKQCUBD0CAP5e60Hgha6grIPsAgACILuD//4G4AIAAh5mQ
Date: Tue, 25 Feb 2020 10:25:51 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B661C30@dggemm531-mbx.china.huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-10-kuhn.chenqun@huawei.com>
 <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
 <7412CDE03601674DA8197E2EBD8937E83B661BD7@dggemm531-mbx.china.huawei.com>
 <8ceb7ecc-8edc-0ced-8171-6200ded0dd05@redhat.com>
In-Reply-To: <8ceb7ecc-8edc-0ced-8171-6200ded0dd05@redhat.com>
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
 Alistair Francis <alistair@alistair23.me>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: boHdxDUk/8b5

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIFttYWlsdG86cGhpbG1kQHJlZGhhdC5jb21dDQo+U2VudDogVHVlc2RheSwgRmVicnVh
cnkgMjUsIDIwMjAgNjoxMiBQTQ0KPlRvOiBDaGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1
YXdlaS5jb20+OyBxZW11LQ0KPmRldmVsQG5vbmdudS5vcmc7IHFlbXUtdHJpdmlhbEBub25nbnUu
b3JnDQo+Q2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgWmhhbmdoYWlsaWFuZw0KPjx6aGFu
Zy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBh
bGlzdGFpcjIzLm1lPjsNCj5xZW11LWFybUBub25nbnUub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCAwOS8xM10gZG1hL3hsbngtemRtYTogUmVtb3ZlIHJlZHVuZGFudCBzdGF0ZW1lbnQgaW4NCj56
ZG1hX3dyaXRlX2RzdCgpDQo+DQo+T24gMi8yNS8yMCAxMTowMSBBTSwgQ2hlbnF1biAoa3Vobikg
d3JvdGU6DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSBbbWFpbHRvOnBoaWxtZEByZWRoYXQuY29tXQ0KPj4+IFNlbnQ6IFR1
ZXNkYXksIEZlYnJ1YXJ5IDI1LCAyMDIwIDU6MzYgUE0NCj4+PiBUbzogQ2hlbnF1biAoa3Vobikg
PGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPjsgcWVtdS0NCj5kZXZlbEBub25nbnUub3JnOw0KPj4+
IHFlbXUtdHJpdmlhbEBub25nbnUub3JnDQo+Pj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9y
ZzsgWmhhbmdoYWlsaWFuZw0KPj4+IDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBB
bGlzdGFpciBGcmFuY2lzDQo+Pj4gPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+OyBxZW11LWFybUBu
b25nbnUub3JnDQo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOS8xM10gZG1hL3hsbngtemRtYTog
UmVtb3ZlIHJlZHVuZGFudCBzdGF0ZW1lbnQNCj4+PiBpbg0KPj4+IHpkbWFfd3JpdGVfZHN0KCkN
Cj4+Pg0KPj4+IE9uIDIvMjUvMjAgMzowOSBBTSwga3Vobi5jaGVucXVuQGh1YXdlaS5jb20gd3Jv
dGU6DQo+Pj4+IEZyb206IENoZW4gUXVuIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT4NCj4+Pj4N
Cj4+Pj4gQ2xhbmcgc3RhdGljIGNvZGUgYW5hbHl6ZXIgc2hvdyB3YXJuaW5nOg0KPj4+PiBody9k
bWEveGxueC16ZG1hLmM6Mzk5OjEzOiB3YXJuaW5nOiBWYWx1ZSBzdG9yZWQgdG8gJ2RzdF90eXBl
JyBpcw0KPj4+PiBuZXZlcg0KPj4+IHJlYWQNCj4+Pj4gICAgICAgICAgICAgICBkc3RfdHlwZSA9
IEZJRUxEX0VYMzIocy0+ZHNjX2RzdC53b3Jkc1szXSwNCj4+PiBaRE1BX0NIX0RTVF9EU0NSX1dP
UkQzLA0KPj4+PiAgICAgICAgICAgICAgIF4NCj4+PiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4+DQo+Pj4+IFJlcG9ydGVkLWJ5OiBF
dWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hlbiBRdW4gPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2M6IEFs
aXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+DQo+Pj4+IENjOiAiRWRnYXIg
RS4gSWdsZXNpYXMiIDxlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20+DQo+Pj4+IENjOiBQZXRlciBN
YXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+Pj4+IENjOiBxZW11LWFybUBub25n
bnUub3JnDQo+Pj4+IC0tLQ0KPj4+PiAgICBody9kbWEveGxueC16ZG1hLmMgfCAyIC0tDQo+Pj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0
IGEvaHcvZG1hL3hsbngtemRtYS5jIGIvaHcvZG1hL3hsbngtemRtYS5jIGluZGV4DQo+Pj4+IDhm
YjgzZjViMDcuLjQ1MzU1YzVkNTkgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3L2RtYS94bG54LXpkbWEu
Yw0KPj4+PiArKysgYi9ody9kbWEveGxueC16ZG1hLmMNCj4+Pj4gQEAgLTM5Niw4ICszOTYsNiBA
QCBzdGF0aWMgdm9pZCB6ZG1hX3dyaXRlX2RzdChYbG54WkRNQSAqcywgdWludDhfdA0KPj4+ICpi
dWYsIHVpbnQzMl90IGxlbikNCj4+Pj4gICAgICAgICAgICAgICAgemRtYV9sb2FkX2Rlc2NyaXB0
b3IocywgbmV4dCwgJnMtPmRzY19kc3QpOw0KPj4+PiAgICAgICAgICAgICAgICBkc3Rfc2l6ZSA9
IEZJRUxEX0VYMzIocy0+ZHNjX2RzdC53b3Jkc1syXSwNCj4+PiBaRE1BX0NIX0RTVF9EU0NSX1dP
UkQyLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0laRSk7DQo+
Pj4+IC0gICAgICAgICAgICBkc3RfdHlwZSA9IEZJRUxEX0VYMzIocy0+ZHNjX2RzdC53b3Jkc1sz
XSwNCj4+PiBaRE1BX0NIX0RTVF9EU0NSX1dPUkQzLA0KPj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFRZUEUpOw0KPj4+DQo+Pj4gTWF5YmUgbW92ZSBkc3RfdHlwZSB0byB0
aGlzIGlmKCkgc3RhdGVtZW50IG5vdz8NCj4+Pg0KPj4gU29ycnksIEkgZG9uJ3QgZm9sbG93IHlv
dS4gICBJIGRpZG4ndCBmaW5kIHdoZXJlIEkgY291bGQgbW92ZSBkc3RfdHlwZS4NCj4+IERvIHlv
dSBtZWFuIHRvIG1vdmUgdGhlIGZpcnN0IGRzdF90eXBlIHRvIHRoZSBpZigpLg0KPj4gTW9kaWZ5
IGl0IGxpa2UgdGhpczoNCj4+ICAgICAgd2hpbGUgKGxlbikgew0KPj4gICAgICAgICAgZHN0X3Np
emUgPSBGSUVMRF9FWDMyKHMtPmRzY19kc3Qud29yZHNbMl0sDQo+WkRNQV9DSF9EU1RfRFNDUl9X
T1JEMiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTSVpFKTsNCj4+ICAgICAg
ICAgIGlmIChkc3Rfc2l6ZSA9PSAwICYmIHB0eXBlID09IFBUX01FTSkgew0KPj4gICAgICAgICAg
ICAgIHVpbnQ2NF90IG5leHQ7DQo+PiAgICAgICAgICAgICAgZHN0X3R5cGUgPSBGSUVMRF9FWDMy
KHMtPmRzY19kc3Qud29yZHNbM10sDQo+WkRNQV9DSF9EU1RfRFNDUl9XT1JEMywNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBFKTsNCj4+ICAgICAgICAgICAgICBuZXh0ID0g
emRtYV91cGRhdGVfZGVzY3JfYWRkcihzLCBkc3RfdHlwZSwNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBSX1pETUFfQ0hfRFNUX0NVUl9EU0NSX0xTQik7DQo+
PiAgICAgICAgICAgICAgemRtYV9sb2FkX2Rlc2NyaXB0b3IocywgbmV4dCwgJnMtPmRzY19kc3Qp
Ow0KPj4gICAgICAgICAgICAgIGRzdF9zaXplID0gRklFTERfRVgzMihzLT5kc2NfZHN0LndvcmRz
WzJdLA0KPlpETUFfQ0hfRFNUX0RTQ1JfV09SRDIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNJWkUpOw0KPj4gICAgICAgICAgfQ0KPj4gICAgICAgICAuLi4NCj4+ICAg
ICB9DQo+DQo+Tm8sIGxpa2UgdGhpczoNCj4NCj4tLSA+OCAtLQ0KPkBAIC0zNzMsNyArMzczLDcg
QEAgc3RhdGljIHVpbnQ2NF90IHpkbWFfdXBkYXRlX2Rlc2NyX2FkZHIoWGxueFpETUENCj4qcywg
Ym9vbCB0eXBlLA0KPiAgc3RhdGljIHZvaWQgemRtYV93cml0ZV9kc3QoWGxueFpETUEgKnMsIHVp
bnQ4X3QgKmJ1ZiwgdWludDMyX3QgbGVuKQ0KPiAgew0KPiAgICAgIHVpbnQzMl90IGRzdF9zaXpl
LCBkbGVuOw0KPi0gICAgYm9vbCBkc3RfaW50ciwgZHN0X3R5cGU7DQo+KyAgICBib29sIGRzdF9p
bnRyOw0KPiAgICAgIHVuc2lnbmVkIGludCBwdHlwZSA9IEFSUkFZX0ZJRUxEX0VYMzIocy0+cmVn
cywgWkRNQV9DSF9DVFJMMCwNCj5QT0lOVF9UWVBFKTsNCj4gICAgICB1bnNpZ25lZCBpbnQgcndf
bW9kZSA9IEFSUkFZX0ZJRUxEX0VYMzIocy0+cmVncywgWkRNQV9DSF9DVFJMMCwNCj5NT0RFKTsN
Cj4gICAgICB1bnNpZ25lZCBpbnQgYnVyc3RfdHlwZSA9IEFSUkFZX0ZJRUxEX0VYMzIocy0+cmVn
cywNCj5aRE1BX0NIX0RBVEFfQVRUUiwgQEAgLTM4NywxNyArMzg3LDE3IEBAIHN0YXRpYyB2b2lk
DQo+emRtYV93cml0ZV9kc3QoWGxueFpETUEgKnMsIHVpbnQ4X3QgKmJ1ZiwgdWludDMyX3QgbGVu
KQ0KPiAgICAgIHdoaWxlIChsZW4pIHsNCj4gICAgICAgICAgZHN0X3NpemUgPSBGSUVMRF9FWDMy
KHMtPmRzY19kc3Qud29yZHNbMl0sDQo+WkRNQV9DSF9EU1RfRFNDUl9XT1JEMiwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFNJWkUpOw0KPi0gICAgICAgIGRzdF90eXBlID0gRklF
TERfRVgzMihzLT5kc2NfZHN0LndvcmRzWzNdLA0KPlpETUFfQ0hfRFNUX0RTQ1JfV09SRDMsDQo+
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEUpOw0KPiAgICAgICAgICBpZiAoZHN0
X3NpemUgPT0gMCAmJiBwdHlwZSA9PSBQVF9NRU0pIHsNCj4gICAgICAgICAgICAgIHVpbnQ2NF90
IG5leHQ7DQo+KyAgICAgICAgICAgIGJvb2wgZHN0X3R5cGU7DQo+Kw0KPisgICAgICAgICAgICBk
c3RfdHlwZSA9IEZJRUxEX0VYMzIocy0+ZHNjX2RzdC53b3Jkc1szXSwNCj5aRE1BX0NIX0RTVF9E
U0NSX1dPUkQzLA0KPisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRSk7DQo+
ICAgICAgICAgICAgICBuZXh0ID0gemRtYV91cGRhdGVfZGVzY3JfYWRkcihzLCBkc3RfdHlwZSwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJfWkRNQV9DSF9E
U1RfQ1VSX0RTQ1JfTFNCKTsNCj4gICAgICAgICAgICAgIHpkbWFfbG9hZF9kZXNjcmlwdG9yKHMs
IG5leHQsICZzLT5kc2NfZHN0KTsNCj4gICAgICAgICAgICAgIGRzdF9zaXplID0gRklFTERfRVgz
MihzLT5kc2NfZHN0LndvcmRzWzJdLA0KPlpETUFfQ0hfRFNUX0RTQ1JfV09SRDIsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0laRSk7DQo+LSAgICAgICAgICAgIGRzdF90
eXBlID0gRklFTERfRVgzMihzLT5kc2NfZHN0LndvcmRzWzNdLA0KPlpETUFfQ0hfRFNUX0RTQ1Jf
V09SRDMsDQo+LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBFKTsNCj4gICAg
ICAgICAgfQ0KSG1tLCAgdGhpcyBpcyBiZXR0ZXIuIA0KSSB3aWxsIG1vZGlmeSBpdCBsYXRlciBp
biBWMi4NCg0KVGhhbmtzLg0KPi0tLQ0KDQo=
