Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2496105wrg;
        Mon, 17 Jun 2019 06:20:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8uF3X+ADcfnJ5EFYKM/nS2fTYUm8ThU9uVp4KsUUbxKJzAsbnWjkPn9/+J7sTNLBmbW9E
X-Received: by 2002:a17:906:76c8:: with SMTP id q8mr91766177ejn.229.1560777612344;
        Mon, 17 Jun 2019 06:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560777612; cv=none;
        d=google.com; s=arc-20160816;
        b=Um306uSLxa2d9+FQx7+Kq3tI92Txycj37i2QSkZJ6396DheBmDe+QbXGq5XTq/5L5i
         ygHn542yUcnTjVsrb8G3qBR7FIeZAG+92MHnaZnNKKyX3+/JMrsCTEXW/srTggisJZpH
         scNXfiiiLYuYfxisgnTiWkI+l70vz0JbUTwNSHpPLZ16bVxttmA+ZCM9N4xBhimeUhuz
         vQjdSFxflIpRSeuv2Td4x2S54BndOt6uCR5qAIY2XYhQ3bDUKCrcU6xL1b5fqsITnhRn
         Ubpb0ipAaqR9B1KryyrSn15LyvptDEoFzODR0pFk1zRvKDEaLNE9wTPYuPfo1Pd2SHJB
         lnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=cc24OnuQDcXu839mH9neVweEmntNJlRTB68gYawp+R8=;
        b=CVTVLNixh9J1cVYbkJS+SUk7/IiLuTMnY5nabK3/okF8Hhg1zUiPNQpdE3pNs9q9bx
         7uEgljxg1OYToYkOQgeWdP4etL2qCKwp/0+C/iEHZqL74j2mL16Cj1lZUlwNFjscYzuq
         sLXsOuTgQbcIE0a9IUOwWx3m428DU7HJtNN8dMQTttHOe5eHo+OWNhtc4FzLbPdZuZuX
         psxygBRTgTiOVfOlfNXVbxuW2JtZZXm9RKMBc1Y7FWCOvd9mATg67Qxku1uRX4QpnJOi
         5xJi+m1H1EEuQR9mUbgkc7/aydVtiIxe1c/MQLiWinsBzURfq59kIfuUfxDMkDNTKUOV
         rVsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j42si8499377eda.80.2019.06.17.06.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 06:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Received: from localhost ([::1]:47450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcrYQ-0001IS-Rn
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 09:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcrUh-0000Pv-HS
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcrUc-0006HA-HY
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:16:16 -0400
Received: from txdal11mx05.parsons.com ([206.219.199.115]:54378)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcrUW-00064F-T7
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 09:16:11 -0400
Received: from pps.filterd (txdal11mx05.parsons.com [127.0.0.1])
 by txdal11mx05.parsons.com (8.16.0.27/8.16.0.27) with SMTP id x5HDEiOZ008371; 
 Mon, 17 Jun 2019 08:15:47 -0500
Received: from txdal11exch02.parsons.com (txdal11exch02.parsons.com
 [172.21.212.128])
 by txdal11mx05.parsons.com with ESMTP id 2t5rnr28tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2019 08:15:47 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 TXDAL11EXCH02.Parsons.com (172.21.212.128) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Mon, 17 Jun 2019 08:15:46 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 ALHUN12EXCH02.Parsons.com (10.62.8.72) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 17 Jun 2019 08:15:44 -0500
Received: from ALHUN12EXCH02.Parsons.com ([10.62.8.72]) by
 ALHUN12EXCH02.Parsons.com ([10.62.8.72]) with mapi id 15.00.1473.003; Mon, 17
 Jun 2019 08:15:44 -0500
From: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [EXTERNAL] Re: [Qemu-arm] Custom machine: Forcing initial boot
 address
Thread-Index: AdUi4C/IbWVCrokzTPSV7EVz0baf/wCOzMSAAAOpMzA=
Date: Mon, 17 Jun 2019 13:15:44 +0000
Message-ID: <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
In-Reply-To: <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Enabled=True;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SiteId=8d088ff8-7e52-4d0f-8187-dcd9ca37815a;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Owner=Alexander.Bensch@parsons.com;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SetDate=2019-06-17T13:10:38.3589880Z;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Name=Public;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Extended_MSFT_Method=Manual;
 Sensitivity=Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.212.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 206.219.199.115
Subject: Re: [Qemu-arm] [EXTERNAL] Re: Custom machine: Forcing initial boot
 address
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QeM4opVgpVXD

SXQncyBhbHdheXMgZnVuIHRvIGdldCBpbiBvbiBhIE1vbmRheSBtb3JuaW5nIGFuZCBpbW1lZGlh
dGVseSByZWFsaXplIEknbSBhbiBpZGlvdCEgRGlzcmVnYXJkIHRoZSAnU2Vuc2l0aXZlIC8gUHJv
cHJpZXRhcnknOyB0aGF0IHdhcyBqdXN0IGEgY29tcGxldGUgZ29vZiBieSBtZSB3aGVuIHNlbGVj
dGluZyB0aGUgZW1haWwgc2Vuc2l0aXZpdHkuIEV2ZXJ5dGhpbmcgaW4gbXkgb3JpZ2luYWwgcXVl
c3Rpb24gaXMgYWxyaWdodCB0byBkaXNjdXNzLg0KDQpTb3JyeSBmb3IgbWlzc2luZyBzb21lIG9m
IHRoZSBkZXRhaWxzLCBhcyB3ZWxsLiBUaGUgQ1BVIEknbSBjdXJyZW50bHkgdHJ5aW5nIHRvIGJh
c2UgbXkgZW11bGF0aW9uIG9mZiBvZiB0aGUgQ29ydGV4LU0zLCBhbHRob3VnaCBJJ20gbm90IGFj
dHVhbGx5IHN1cmUgd2hldGhlciB0aGUgZGV2aWNlIEknbSBhdHRlbXB0aW5nIHRvIGVtdWxhdGUg
aXMgYW4gTTMgb3IgTTQuIEZyb20gd2hhdCBJJ3ZlIHJlYWQgdGhlIG9ubHkgcmVhbCBkaWZmZXJl
bmNlIGlzIHNvbWUgVGh1bWIgc3VwcG9ydCBhbmQgYSBEU1AgbW9kdWxlLCBuZWl0aGVyIG9mIHdo
aWNoIEkgbmVlZCBob3BlZnVsbHkuDQoNClRoZSByZWdpc3RlciB0aGF0IEkgd2FzIHJlZmVycmlu
ZyB0byB3YXMgY29udHJvbCByZWdpc3RlciAxNSwgd2hpY2ggaW4gdGhlIGRvY3MgSSBoYXZlIGlz
IHJlZmVycmVkIHRvIHNpbXBseSBhcyAiQ1BVIGNvbnRyb2wgcmVnaXN0ZXIuIiBNeSB2ZXJzaW9u
IG9mIFFFTVUgKHdoaWNoIEkgd2lsbCB0cnkgdXBkYXRpbmcgYXMgeW91IHN1Z2dlc3RlZCkgcmVm
ZXJzIHRvICdjcDE1Lm12YmFyJyBhbmQgJ2NwMTUudmJhcicsIHdoaWNoIEkgaGF2ZSBiZWVuIGlu
dmVzdGlnYXRpbmcgYXMgdGhlIGxpa2VseSBiYXNlIGFkZHJlc3MgZm9yIGV4ZWN1dGlvbi4NCg0K
WW91IG1lbnRpb24gdjhNLiBJIGhhdmVuJ3QgbG9va2VkIGludG8gdGhhdCB2ZXJzaW9uIG9mIHRo
ZSBhcmNoLCBidXQgY291bGQgaXQgYmUgcG9zc2libGUgdG8gZXhlY3V0ZSB2N00gaW5zdHJ1Y3Rp
b25zIG9uIGEgdjhNIENQVT8gSSdkIGxpa2UgdG8gYXZvaWQgbW9kaWZ5aW5nIFFFTVUgYXMgbXVj
aCBhcyBwb3NzaWJsZSwgc28gaWYgdGhlcmUncyBhbnkgd29ya2Fyb3VuZHMgbGlrZSB0aGF0IEkn
bSByZWNlcHRpdmUgdG8gdGhlbS4NCg0KVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBkZXRhaWxl
ZCByZXNwb25zZSENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NClNlbnQ6IE1vbmRheSwgSnVuZSAxNywg
MjAxOSA1OjQ2IEFNDQpUbzogQmVuc2NoLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5CZW5zY2hAcGFy
c29ucy5jb20+DQpDYzogcWVtdS1hcm1Abm9uZ251Lm9yZw0KU3ViamVjdDogW0VYVEVSTkFMXSBS
ZTogW1FlbXUtYXJtXSBDdXN0b20gbWFjaGluZTogRm9yY2luZyBpbml0aWFsIGJvb3QgYWRkcmVz
cw0KDQpPbiBTYXQsIDE1IEp1biAyMDE5IGF0IDAyOjE3LCBCZW5zY2gsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkJlbnNjaEBwYXJzb25zLmNvbT4gd3JvdGU6DQo+DQo+IFNlbnNpdGl2ZSAvIFByb3By
aWV0YXJ5DQoNCkVyLCB5b3UganVzdCBzZW50IHRoaXMgdG8gYSBwdWJsaWMgbWFpbGluZyBsaXN0
Li4uDQoNCj4gSSBhbSBjdXJyZW50bHkgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgTVBTMiBib2FyZCB0
byBlbXVsYXRlIGFuIEFSTXY3bSBkZXZpY2UgSSBhbSB3b3JraW5nIG9uLCBhcyBub25lIG9mIHRo
ZSBpbmNsdWRlZCBtYWNoaW5lcyBwcm92aWRlIGFuIGVudmlyb25tZW50IGNsb3NlIGVub3VnaCB0
byB3aGF0IEnigJltIHdvcmtpbmcgb24gdG8gYmUgc3VmZmljaWVudC4gSSBhbSBydW5uaW5nIGlu
dG8gYW4gaXNzdWUgaW4gd2hpY2ggSSBjYW5ub3QgZ2V0IHRoZSBtYWNoaW5lIHRvIGV4ZWN1dGUg
dGhlIGJvb3RST00gZnJvbSBhZGRyZXNzIDB4RkZGRjAwMDAuIFRoZSBzcGVjcyBmb3IgdGhlIHNw
ZWNpZmljIGRldmljZSBJIGhhdmUgKGNhbm5vdCBzaGFyZSB0aGUgZGV2aWNlIG1vZGVsLCB1bmZv
cnR1bmF0ZWx5KSBzdGF0ZSB0aGF0IHRoZXJlIGlzIGEgY29udHJvbCByZWdpc3RlciB0aGF0IEkg
YXNzdW1lIGlzIHByZXNlbnQgaW4gYWxsIHY3bSBjaGlwcyB0aGF0IHNlbGVjdHMgd2hldGhlciB0
byBib290IGF0IDB4MCBvciAweEZGRkYwMDAwLiBJIGNhbiBhbHNvIHNlZSBldmlkZW5jZSBvZiB0
aGlzIHJlZ2lzdGVyIGJlaW5nIGVtdWxhdGVkIGluIFFFTVUgaW4g4oCYdGFyZ2V0L2FybS9jcHUu
Y+KAmS4NCg0KSXQgd291bGQgaGVscCBpZiB5b3Ugc2FpZCB3aGF0IHRoZSByZWdpc3RlciBuYW1l
IHdhcyEgIkFSTXY3TSIgaXMgYW4gYXJjaGl0ZWN0dXJlIGZhbWlseSwgd2hpY2ggY292ZXJzIHNv
bWUgdGhpbmdzIHdoaWNoIG11c3QgYmUgaW1wbGVtZW50ZWQsIGFuZCBhbGxvd3Mgc29tZSBvdGhl
ciB0aGluZ3MgdG8gYmUgaW1wbGVtZW50YXRpb24gZGVmaW5lZC4gVGhlcmUgYXJlIHZhcmlvdXMg
Q1BVcyB0aGF0IGltcGxlbWVudCBBUk12N00sIGxpa2UgdGhlIENvcnRleC1NMy4gVGhlbiB0aGVz
ZSBDUFVzIGNhbiBiZSBmb3VuZCBpbiBTb0NzIChsaWtlIHRoZSBzdG0zMmYyMDUsIGZvciBleGFt
cGxlKSwgd2hpY2ggYWRkIGV4dHJhIG1lbW9yeSBtYXBwZWQgZGV2aWNlcyB3aXRoIHRoZWlyIG93
biByZWdpc3RlcnMuDQoNCj5Ib3dldmVyLCBzaW5jZSB0aGVyZSBpcyBsaXR0bGUgQVBJIGRvY3Vt
ZW50YXRpb24gSSBoYXZlIGJlZW4gYWJsZSB0byBmaW5kLCBJ4oCZdmUgZWZmZWN0aXZlbHkgYmVl
biByZXZlcnNlLWVuZ2luZWVyaW5nIFFFTVUgdG8gZmlndXJlIG91dCB3aGF0IG5lZWRzIHRvIGJl
IHNldC4gU28gZmFyLCBhbGwgb2YgbXkgYXR0ZW1wdHMgdG8gbW9kaWZ5IGNvbnRyb2wgcmVnaXN0
ZXJzIGFuZCBhZGRyZXNzZXMgZGlyZWN0bHkgaGF2ZSByZXN1bHRlZCBpbiB1bmV4cGVjdGVkIGJl
aGF2aW9yIGFuZCBwYXJ0aWFsIGltcGxlbWVudGF0aW9uIG9mIG15IGdvYWxzLiBJIGhhdmUgaGFk
IHN1Y2Nlc3MgaW4gZm9yY2luZyB0aGUgUk9NIHRvIGxvYWQgYXQgdGhlIGRlc2lyZWQgYWRkcmVz
cywgYW5kIHdpdGggR0RCIEkgY2FuIGZvcmNlIHRoZSBQQyBhbmQgU1AgdG8gd2hlcmUgSSB3YW50
LCBidXQgdGhlIElWVCBtdXN0IGJlIGF0IDB4MCBieSBkZWZhdWx0LiBJIHdhcyBob3Bpbmcgc29t
ZW9uZSBrbmV3IGhvdyB0byBlbmFibGUgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgdGhhdCBzZXRzIHRo
ZSBib290IGFkZHJlc3Mgc28gdGhhdCB0aGUgSVZUIGNhbiBiZSBsb2FkZWQgZnJvbSBhIGRpZmZl
cmVudCBhZGRyZXNzLg0KDQpBcmNoaXRlY3R1cmFsbHkgdGhlIHZlY3RvciB0YWJsZSBzdGFydHMg
YXQgdGhlIGFkZHJlc3Mgc3BlY2lmaWVkIGJ5IHRoZSBDUFUncyBWVE9SIHJlZ2lzdGVyICgiVmVj
dG9yIFRhYmxlIE9mZnNldCBSZWdpc3RlciIpLiBRRU1VIGRvZXMgaW1wbGVtZW50IHRoaXMsIGJ1
dCB3ZSBkb24ndCBjdXJyZW50bHkgcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYWxsb3dpbmcgYW4g
U29DIG1vZGVsIG9yIGJvYXJkIG1vZGVsIHRvIHNwZWNpZnkgYSByZXNldCB2YWx1ZSBmb3IgaXQg
b3RoZXIgdGhhbiB6ZXJvIChiZWNhdXNlIGZvciBhbGwgdGhlIGJvYXJkcyB3ZSBtb2RlbCB0aGV5
IHVzZSBhIHplcm8gcmVzZXQgdmFsdWUsIHNvIHdlIGRpZG4ndCBuZWVkIGl0KS4NCldlIGRvIHBy
b3ZpZGUgdGhpcyBtZWNoYW5pc20gZm9yIHRoZSB2OE0gc2VjdXJlLWJhbmtlZCBWVE9SIC0tIHRo
aXMgaXMgZXhwb3NlZCB0byB0aGUgcmVzdCBvZiBRRU1VIHZpYSB0aGUgImluaXQtc3Z0b3IiIHFk
ZXYgcHJvcGVydHksIHdoaWNoIHRoZSBib2FyZCBjYW4gdGhlbiBzZXQuIFNvIGZvciBhIHY3TSBD
UFUgeW91IHdvdWxkIG5lZWQgdG8gYWRkIHNvbWV0aGluZyBzaW1pbGFyIGZvciAiaW5pdC12dG9y
Ig0KdG8gc2V0IHRoZSBub24tc2VjdXJlIFZUT1IgcmVzZXQgdmFsdWUuIFRoZW4gdGhlIENQVSB3
b3VsZCBjb21lIG91dCBvZiByZXNldCBieSBsb2FkaW5nIHRoZSBQQyBhbmQgU1AgZnJvbSB0aGUg
dmVjdG9yIHRhYmxlIGF0IHRoYXQgYWRkcmVzcy4NCg0KPiBJIGFtIHJ1bm5pbmcgUUVNVSB2ZXJz
aW9uIDIuMTEuDQoNCklmIHlvdSdyZSBtb2RpZnlpbmcgUUVNVSB5b3Ugc2hvdWxkIHN0YXJ0IHdp
dGggYSBtdWNoIG5ld2VyIHZlcnNpb24gdGhhbiB0aGF0LiBUaGVyZSBoYXZlIGJlZW4gYSBsb3Qg
b2YgTS1wcm9maWxlIHJlbGF0ZWQgYnVnZml4ZXMgc2luY2UgdGhlbi4gR2VuZXJhbGx5IGZvciBk
ZXZlbG9wbWVudCBvZiBRRU1VIHdlIHJlY29tbWVuZCB3b3JraW5nIHdpdGggdGhlIGhlYWQgb2Yg
Z2l0Lg0KDQp0aGFua3MNCi0tIFBNTQ0KDQpOT1RJQ0U6IFRoaXMgZW1haWwgbWVzc2FnZSBhbmQg
YWxsIGF0dGFjaG1lbnRzIHRyYW5zbWl0dGVkIHdpdGggaXQgbWF5IGNvbnRhaW4gcHJpdmlsZWdl
ZCBhbmQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLCBhbmQgaW5mb3JtYXRpb24gdGhhdCBpcyBw
cm90ZWN0ZWQgYnksIGFuZCBwcm9wcmlldGFyeSB0bywgUGFyc29ucyBDb3Jwb3JhdGlvbiwgYW5k
IGlzIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgYWRkcmVzc2VlIGZvciB0aGUg
c3BlY2lmaWMgcHVycG9zZSBzZXQgZm9ydGggaW4gdGhpcyBjb21tdW5pY2F0aW9uLiBJZiB0aGUg
cmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91
IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgcmVhZGluZywgZGlzc2VtaW5hdGlvbiwgZGlz
dHJpYnV0aW9uLCBjb3B5aW5nLCBvciBvdGhlciB1c2Ugb2YgdGhpcyBtZXNzYWdlIG9yIGl0cyBh
dHRhY2htZW50cyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLCBhbmQgeW91IHNob3VsZCBkZWxldGUg
dGhpcyBtZXNzYWdlIGFuZCBhbGwgY29waWVzIGFuZCBiYWNrdXBzIHRoZXJlb2YuIFRoZSByZWNp
cGllbnQgbWF5IG5vdCBmdXJ0aGVyIGRpc3RyaWJ1dGUgb3IgdXNlIGFueSBvZiB0aGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGhlcmVpbiB3aXRob3V0IHRoZSBleHByZXNzIHdyaXR0ZW4gYXV0aG9y
aXphdGlvbiBvZiB0aGUgc2VuZGVyLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2Ug
aW4gZXJyb3IsIG9yIGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMgcmVnYXJkaW5nIHRoZSB1c2Ug
b2YgdGhlIHByb3ByaWV0YXJ5IGluZm9ybWF0aW9uIGNvbnRhaW5lZCB0aGVyZWluLCBwbGVhc2Ug
Y29udGFjdCB0aGUgc2VuZGVyIG9mIHRoaXMgbWVzc2FnZSBpbW1lZGlhdGVseSwgYW5kIHRoZSBz
ZW5kZXIgd2lsbCBwcm92aWRlIHlvdSB3aXRoIGZ1cnRoZXIgaW5zdHJ1Y3Rpb25zLg0K
