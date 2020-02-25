Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1462322lfg;
        Tue, 25 Feb 2020 02:02:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTe9bU8oaiNsnzgCsC6m3yPJRewr7sN3Es+87l7li9FSPOKHcJFSnU0+5R3Vx4Y9hsQ629
X-Received: by 2002:a0c:ea8b:: with SMTP id d11mr32368211qvp.5.1582624921755;
        Tue, 25 Feb 2020 02:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582624921; cv=none;
        d=google.com; s=arc-20160816;
        b=RbAxRZUktYVEqJMdL98o3prPSMn9pgL3hprO2/UXQv8PAKOOdjUaqUFN9bSYx4JD2C
         4fPt9deBptldZTVYTjek92wTFXa845HIHPwN00qEABIgmRtCV7renMAi3F4Dmj1kGI2/
         5tEsG6eW5N0LZ6U0NCGUpfr+Tdu+boCR04ZA8I6Nszs4uXamh9dHEhBOGO1ZCEsBRXmQ
         fF9NOK9UWNt77QVi+JttKqBA4fIXUpiZb/ytt0AA5MHAPSLEGUTwN24HjCl9QfyVYha0
         sDGsOVZIf5GTVmrM6NGxq2vQuz/C4qSZdaHocOrYkJKpd1hO7mmTqaLCZhA2IpOgA7p5
         MKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=9t+wdj1vO3WXzSuVuEW7/RRUr/aiWHxuVc50zubJ3Bc=;
        b=a9DdXwHb+v288w11jU20JNm/kgwVX6IC3m9GO4NndcSighvAK5ppH2RwEpPgIFT8C6
         k9qDxc6DFVxa+K9DeKCtUd70viW3j4SR6G/kFeDsnPiv2Q2Umoy05CNqbMdKmEJnc33v
         tL9lpTKRvn9yPhQH4keFv/EPVGP8HTAmYbClJSOCMAUAcPJ9IAW5TiG6AhE+U/IkU88f
         AzUm1qPWfy2fuPQ9uy6nDAR3ewVrY0dEKPvqH+ZUTXjvUy38h4OcrfRub3M3etH9m2DT
         qS300UBEbmfRDilJble0XTIqUoBq062OWOtGyBhknNMnIV8Sp/tfa/8P7XnL1H72d7kL
         NeMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27si7191139qtv.19.2020.02.25.02.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 02:02:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6X2P-0005A4-6j
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 05:02:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6X2D-000563-1F
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:01:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6X2B-0002uI-Qo
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 05:01:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2451 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6X2B-0002ru-GC; Tue, 25 Feb 2020 05:01:47 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 42BDE44CDF6A51AB9C93;
 Tue, 25 Feb 2020 18:01:43 +0800 (CST)
Received: from DGGEMM422-HUB.china.huawei.com (10.1.198.39) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Feb 2020 18:01:42 +0800
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.163]) by
 dggemm422-hub.china.huawei.com ([10.1.198.39]) with mapi id 14.03.0439.000;
 Tue, 25 Feb 2020 18:01:35 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Thread-Topic: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Thread-Index: AQHV64DJX5oKQCUBD0CAP5e60Hgha6grIPsAgACILuA=
Date: Tue, 25 Feb 2020 10:01:35 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83B661BD7@dggemm531-mbx.china.huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-10-kuhn.chenqun@huawei.com>
 <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
In-Reply-To: <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
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
X-Received-From: 45.249.212.187
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
X-TUID: /DpoU1Lv6/N5

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIFttYWlsdG86cGhpbG1kQHJlZGhhdC5jb21dDQo+U2VudDogVHVlc2RheSwgRmVicnVh
cnkgMjUsIDIwMjAgNTozNiBQTQ0KPlRvOiBDaGVucXVuIChrdWhuKSA8a3Vobi5jaGVucXVuQGh1
YXdlaS5jb20+OyBxZW11LQ0KPmRldmVsQG5vbmdudS5vcmc7IHFlbXUtdHJpdmlhbEBub25nbnUu
b3JnDQo+Q2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgWmhhbmdoYWlsaWFuZw0KPjx6aGFu
Zy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpckBh
bGlzdGFpcjIzLm1lPjsNCj5xZW11LWFybUBub25nbnUub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCAwOS8xM10gZG1hL3hsbngtemRtYTogUmVtb3ZlIHJlZHVuZGFudCBzdGF0ZW1lbnQgaW4NCj56
ZG1hX3dyaXRlX2RzdCgpDQo+DQo+T24gMi8yNS8yMCAzOjA5IEFNLCBrdWhuLmNoZW5xdW5AaHVh
d2VpLmNvbSB3cm90ZToNCj4+IEZyb206IENoZW4gUXVuIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNv
bT4NCj4+DQo+PiBDbGFuZyBzdGF0aWMgY29kZSBhbmFseXplciBzaG93IHdhcm5pbmc6DQo+PiBo
dy9kbWEveGxueC16ZG1hLmM6Mzk5OjEzOiB3YXJuaW5nOiBWYWx1ZSBzdG9yZWQgdG8gJ2RzdF90
eXBlJyBpcyBuZXZlcg0KPnJlYWQNCj4+ICAgICAgICAgICAgICBkc3RfdHlwZSA9IEZJRUxEX0VY
MzIocy0+ZHNjX2RzdC53b3Jkc1szXSwNCj5aRE1BX0NIX0RTVF9EU0NSX1dPUkQzLA0KPj4gICAg
ICAgICAgICAgIF4NCj5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+DQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IEV1bGVyIFJvYm90IDxldWxlci5yb2Jv
dEBodWF3ZWkuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBRdW4gPGt1aG4uY2hlbnF1bkBo
dWF3ZWkuY29tPg0KPj4gLS0tDQo+PiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxp
c3RhaXIyMy5tZT4NCj4+IENjOiAiRWRnYXIgRS4gSWdsZXNpYXMiIDxlZGdhci5pZ2xlc2lhc0Bn
bWFpbC5jb20+DQo+PiBDYzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3Jn
Pg0KPj4gQ2M6IHFlbXUtYXJtQG5vbmdudS5vcmcNCj4+IC0tLQ0KPj4gICBody9kbWEveGxueC16
ZG1hLmMgfCAyIC0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9ody9kbWEveGxueC16ZG1hLmMgYi9ody9kbWEveGxueC16ZG1hLmMgaW5k
ZXgNCj4+IDhmYjgzZjViMDcuLjQ1MzU1YzVkNTkgMTAwNjQ0DQo+PiAtLS0gYS9ody9kbWEveGxu
eC16ZG1hLmMNCj4+ICsrKyBiL2h3L2RtYS94bG54LXpkbWEuYw0KPj4gQEAgLTM5Niw4ICszOTYs
NiBAQCBzdGF0aWMgdm9pZCB6ZG1hX3dyaXRlX2RzdChYbG54WkRNQSAqcywgdWludDhfdA0KPipi
dWYsIHVpbnQzMl90IGxlbikNCj4+ICAgICAgICAgICAgICAgemRtYV9sb2FkX2Rlc2NyaXB0b3Io
cywgbmV4dCwgJnMtPmRzY19kc3QpOw0KPj4gICAgICAgICAgICAgICBkc3Rfc2l6ZSA9IEZJRUxE
X0VYMzIocy0+ZHNjX2RzdC53b3Jkc1syXSwNCj5aRE1BX0NIX0RTVF9EU0NSX1dPUkQyLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0laRSk7DQo+PiAtICAgICAgICAg
ICAgZHN0X3R5cGUgPSBGSUVMRF9FWDMyKHMtPmRzY19kc3Qud29yZHNbM10sDQo+WkRNQV9DSF9E
U1RfRFNDUl9XT1JEMywNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQ
RSk7DQo+DQo+TWF5YmUgbW92ZSBkc3RfdHlwZSB0byB0aGlzIGlmKCkgc3RhdGVtZW50IG5vdz8N
Cj4NClNvcnJ5LCBJIGRvbid0IGZvbGxvdyB5b3UuICAgSSBkaWRuJ3QgZmluZCB3aGVyZSBJIGNv
dWxkIG1vdmUgZHN0X3R5cGUuDQpEbyB5b3UgbWVhbiB0byBtb3ZlIHRoZSBmaXJzdCBkc3RfdHlw
ZSB0byB0aGUgaWYoKS4gIA0KTW9kaWZ5IGl0IGxpa2UgdGhpczoNCiAgICB3aGlsZSAobGVuKSB7
DQogICAgICAgIGRzdF9zaXplID0gRklFTERfRVgzMihzLT5kc2NfZHN0LndvcmRzWzJdLCBaRE1B
X0NIX0RTVF9EU0NSX1dPUkQyLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0laRSk7
DQogICAgICAgIGlmIChkc3Rfc2l6ZSA9PSAwICYmIHB0eXBlID09IFBUX01FTSkgew0KICAgICAg
ICAgICAgdWludDY0X3QgbmV4dDsNCiAgICAgICAgICAgIGRzdF90eXBlID0gRklFTERfRVgzMihz
LT5kc2NfZHN0LndvcmRzWzNdLCBaRE1BX0NIX0RTVF9EU0NSX1dPUkQzLA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVFlQRSk7DQogICAgICAgICAgICBuZXh0ID0gemRtYV91cGRhdGVf
ZGVzY3JfYWRkcihzLCBkc3RfdHlwZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFJfWkRNQV9DSF9EU1RfQ1VSX0RTQ1JfTFNCKTsNCiAgICAgICAgICAgIHpkbWFf
bG9hZF9kZXNjcmlwdG9yKHMsIG5leHQsICZzLT5kc2NfZHN0KTsNCiAgICAgICAgICAgIGRzdF9z
aXplID0gRklFTERfRVgzMihzLT5kc2NfZHN0LndvcmRzWzJdLCBaRE1BX0NIX0RTVF9EU0NSX1dP
UkQyLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNJWkUpOw0KICAgICAgICB9
DQogICAgICAgLi4uDQogICB9DQoNClRoYW5rcy4NCj4+ICAgICAgICAgICB9DQo+Pg0KPj4gICAg
ICAgICAgIC8qIE1hdGNoIHdoYXQgaGFyZHdhcmUgZG9lcyBieSBpZ25vcmluZyB0aGUgZHN0X3Np
emUgYW5kDQo+PiBvbmx5IHVzaW5nDQo+Pg0KDQo=
