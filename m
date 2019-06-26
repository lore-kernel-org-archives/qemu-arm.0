Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp330587wru;
        Wed, 26 Jun 2019 10:58:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2bPyFXKX3USyc2P3Wds3uvqdW0VM/bs2pyJD74ya21JTncx5wvOjJsSeKdsTQD8ZOaCqm
X-Received: by 2002:a17:906:4717:: with SMTP id y23mr5355300ejq.150.1561571903000;
        Wed, 26 Jun 2019 10:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561571902; cv=none;
        d=google.com; s=arc-20160816;
        b=ChJHwMdnk/ntrvUjdjvhT/+H8zeCsWodKEZ6M11bexGBovf2PbkFgCQqDGaDbceL0q
         BssjzaPDTGT+6y56OBe0E5vWM7QsYD2yeSOxQtf02MMC62rm1nOsZqgG2muB4WO0xH/E
         UHkp+vxF9FlxeBpjni70e/cSItnqYhKTRX6ilCEBJTcU1f0U9Yfnk/ejystBjMTikDoP
         93H1/dwupGSZxWX3W/gyHGxhisgQZ3tYQykt2U4PAYSH15VrwyvwCEHWtvsTksEdW+8c
         m15+9Wmy+HXqATuY8+Hc0EmJNERnqgHmoOtfz+TJXBS6N7s5n5qoDmwZpiPNw1uZE4Nb
         cB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=IParPa9e+GIEcyUba7VL6/ad2EU+dBjr3qtQBVIu9xU=;
        b=nzHW6Vf5tuutxUXFf5+CXLB5MDouryi55cK/qCPq8zUAMOBuau53VxJAaB1OKKvC+M
         iOdD2cvt45ljWEonCp6G3N78dXvhuYnMIt/Zd9YbSxuTy7sFfrE8qaURzVzBXCgqrSaW
         QD3iO9LmhT/NJ0KfSoA2gYg1l0YvuksjSZskEE5iE8SA4P2qa+qNzaWsodrZjsUUYEym
         igoDW5cIvppGVyJtNL8JnSdNezreqIi2Dvpb8c8qnVjfQpu9Rmll437jn74spuHDBNoz
         TWFt84TGgB3UVqZNdiy0civQUfBWkpza7YxSkrFFdRcIhVWH6i+3Gsfmmx5h/FAvCS//
         SkmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si3279126eju.370.2019.06.26.10.58.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 10:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hgCBa-0004aZ-5H
	for alex.bennee@linaro.org; Wed, 26 Jun 2019 13:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=1080e03e91=alexander.bensch@parsons.com>)
 id 1hgCBS-0004aH-85
 for qemu-arm@nongnu.org; Wed, 26 Jun 2019 13:58:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1080e03e91=alexander.bensch@parsons.com>)
 id 1hgCBQ-0001bq-Uc
 for qemu-arm@nongnu.org; Wed, 26 Jun 2019 13:58:14 -0400
Received: from txdal11mx02.parsons.com ([206.219.199.110]:40630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <prvs=1080e03e91=alexander.bensch@parsons.com>)
 id 1hgCBQ-000171-O6
 for qemu-arm@nongnu.org; Wed, 26 Jun 2019 13:58:12 -0400
Received: from pps.filterd (txdal11mx02.parsons.com [127.0.0.1])
 by txdal11mx02.parsons.com (8.16.0.27/8.16.0.27) with SMTP id x5QHs3k5007398; 
 Wed, 26 Jun 2019 12:57:18 -0500
Received: from txdal11exch02.parsons.com (txdal11exch02.parsons.com
 [172.21.212.128])
 by txdal11mx02.parsons.com with ESMTP id 2tcdef01ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2019 12:57:18 -0500
Received: from ALHUN12EXCH01.Parsons.com (10.62.8.71) by
 TXDAL11EXCH02.Parsons.com (172.21.212.128) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Wed, 26 Jun 2019 12:57:17 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 ALHUN12EXCH01.Parsons.com (10.62.8.71) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Wed, 26 Jun 2019 12:57:13 -0500
Received: from ALHUN12EXCH02.Parsons.com ([10.62.8.72]) by
 ALHUN12EXCH02.Parsons.com ([10.62.8.72]) with mapi id 15.00.1473.003; Wed, 26
 Jun 2019 12:57:13 -0500
From: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [EXTERNAL] Re: [Qemu-arm] Custom machine: Forcing initial boot
 address
Thread-Index: AQHVJRG68mGyP1fYhEaWCVh+7AmTaaaf6MIggABWVwCADf9+gA==
Date: Wed, 26 Jun 2019 17:57:13 +0000
Message-ID: <f8ce35be2a6a44339c0fa0bb342092e6@ALHUN12EXCH02.Parsons.com>
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
 <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA81YHFkDvsjWLiY6EoqgQSoeDKFAxNrGB6_m_B0cwaCFA@mail.gmail.com>
 <826f48411ef4496e95ce0fcb42ac3e83@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA8f+z1YScY7U3i2qSQZz+vma0i+Kv7tLgraFuBRadakoA@mail.gmail.com>
In-Reply-To: <CAFEAcA8f+z1YScY7U3i2qSQZz+vma0i+Kv7tLgraFuBRadakoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Enabled=True;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SiteId=8d088ff8-7e52-4d0f-8187-dcd9ca37815a;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Owner=Alexander.Bensch@parsons.com;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SetDate=2019-06-26T17:53:36.5043865Z;
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
 definitions=2019-06-26_09:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 206.219.199.110
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
X-TUID: YzkNJ4lAehtn

SSBmaW5hbGx5IGxvY2F0ZWQgc29tZSBkZXZpY2Ugc3BlY2lmaWMgZG9jdW1lbnRhdGlvbi4gSXQg
dHVybnMgb3V0IHRoZSBTb0MgSSBhbSB0YXJnZXRpbmcgaGFzIGl0cyBvd24gYm9vdHJvbSBoZWFk
ZXIgZm9ybWF0IHRoYXQgbG9va3MgZGVjZXB0aXZlbHkgc2ltaWxhciB0byBBUk12Ny1NLiBUaGUg
ZGV2aWNlIGlzIGFjdHVhbGx5IHVzaW5nIGEgQ29ydGV4LUE5LCBhbmQgaGFzIHNvbWUgaGVhZGVy
cyBhbmQgZXhlY3V0aW9uIFRodW1iIGNvZGUgYXQgYWRkcmVzcyAweDAgaW4gdGhlIGJpbmFyeSB0
aGF0IGFyZSBwcm9jZXNzZWQgYW5kIGV4ZWN1dGVkIGluIHBsYWNlIG9uIFJPTS4gSSBhbSBjdXJy
ZW50bHkgd29ya2luZyB1bmRlciB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBtYWluIGJvb3Ryb20g
Y29kZSB0aGF0IGdldHMgbG9hZGVkIGludG8gRFJBTSBhdCAweDAgaXMgY2FsbGVkIGJ5IHRoaXMg
VGh1bWIgY29kZS4NCg0KVGhlcmUncyBwcmV0dHkgbXVjaCBubyBxdWVzdGlvbiB0aGF0IEknbGwg
bmVlZCB0byBkbyBhIGN1c3RvbSBib2FyZCBmb3IgdGhpcywgYnV0IEkgaGF2ZW4ndCBiZWVuIGFi
bGUgdG8gZmluZCBhbnkgYm9hcmRzIHRoYXQgYnlwYXNzIHRoZSBidWlsdC1pbiBtaW5pLWJvb3Rs
b2FkZXIgdGhhdCBRRU1VIHVzZXMgKGRlZmluZWQgYXMgYEFybUluc25GaXh1cCBib290bG9hZGVy
W11gIGluIHFlbXUtc3JjL2h3L2FybS9ib290LmMpLiBBbHNvLCBiZWNhdXNlIEkgYW0gdW5zdXJl
IGlmIHRoaXMgYm9vdHJvbSBhZGRyZXNzZXMgc3RhdGljYWxseSwgSSBtYXkgbmVlZCB0byBmaW5k
IGEgd2F5IHRvIGV4ZWN1dGUgY29kZSBpbiBwbGFjZSB3aXRob3V0IGxvYWRpbmcgaXQgaW50byBt
ZW1vcnkgc28gdGhhdCB0aGUgZXhlY3V0aW9uIGhlYWRlciBUaHVtYiBjb2RlIGNhbiBsb2FkIGF0
IGFkZHJlc3MgMHgwIHdpdGhvdXQgaW50ZXJmZXJpbmcgd2l0aCB0aGUgcHJpbWFyeSBib290cm9t
IHNlZ21lbnQgbG9hZGluZyBpbnRvIERSQU0gYXQgMHgwLg0KDQpNeSBxdWVzdGlvbnMsIGdpdmVu
IHRoYXQgdGhlIHByZXZpb3VzIHZlY3RvciBpc3N1ZSBoYXMgYmVlbiByZXNvbHZlZCwgYXJlIHRo
ZSBmb2xsb3dpbmc6DQotIElzIHRoZXJlIGEgY2xlYW4gd2F5IGZvciBtZSB0byBieXBhc3MgdGhl
IFFFTVUgc2ltcGxlIGJvb3Rsb2FkZXIgdGhhdCBsb2FkcyBhdCBhZGRyZXNzIDB4MCB3aXRob3V0
IG1lc3Npbmcgd2l0aCB0aGUgY29yZSBBUk0gZmlsZXM/IEluIG90aGVyIHdvcmRzLCBjYW4gSSBk
byBzdWNoIGEgdGhpbmcgZnJvbSBhIGJvYXJkIGNsYXNzPw0KLSBEbyBJIG5lZWQgdG8gc3BlY2lm
eSBhbiBNVkJBUiBmb3IgUUVNVSBpZiBpdCBhcHBlYXJzIHRoYXQgdGhlIGRldmljZSBJJ20gZW11
bGF0aW5nIGRvZXMgbm90IGV4cGVjdCB0aGF0IGNvbXBvbmVudCB0byBiZSBsb2FkZWQgaW50byBt
ZW1vcnk/IEkgYmVsaWV2ZSBpdCBtYXkgYmUgZGVmaW5lZCBpbiBoYXJkd2FyZSwgYnV0IHNvIGZh
ciBkb2N1bWVudGF0aW9uIGhhcyBub3QgYmVlbiBjbGVhci4NCi0gQ2FuIEkgZXhlY3V0ZSBjb2Rl
IGluLXBsYWNlIGluIFFFTVU/IGkuZS4gY2FuIEkgcHJvdmlkZSBRRU1VIHdpdGggYSBUaHVtYiBj
b2RlIHNlZ21lbnQgYW5kIGhhdmUgaXQgZXhlY3V0ZSB0aGF0IGNvZGUgYXMgaWYgaXQgd2VyZSBw
cmVzZW50IG9uIFJPTT8NCg0KSSd2ZSB0cmllZCBmaW5kaW5nIGFuc3dlcnMgdG8gdGhlc2UgcXVl
c3Rpb25zIGluIHRoZSBRRU1VIHNvdXJjZSBidXQgaGF2ZW7igJl0IGhhZCBtdWNoIGx1Y2suIFRo
YW5rIHlvdSBhZ2FpbiBmb3IgeW91ciBwYXRpZW5jZSwgdGhpcyBpcyBhbGwgc3RpbGwgcHJldHR5
IG5ldyB0byBtZSEgTGV0IG1lIGtub3cgaWYgYW55dGhpbmcgaXMgdW5jbGVhciBhbmQgaG9wZWZ1
bGx5IEkgY2FuIGNsYXJpZnkuDQpBbGV4IEJlbnNjaA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KU2Vu
dDogTW9uZGF5LCBKdW5lIDE3LCAyMDE5IDEwOjQxIEFNDQpUbzogQmVuc2NoLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5CZW5zY2hAcGFyc29ucy5jb20+DQpDYzogcWVtdS1hcm1Abm9uZ251Lm9yZw0K
U3ViamVjdDogUmU6IFtFWFRFUk5BTF0gUmU6IFtRZW11LWFybV0gQ3VzdG9tIG1hY2hpbmU6IEZv
cmNpbmcgaW5pdGlhbCBib290IGFkZHJlc3MNCg0KT24gTW9uLCAxNyBKdW4gMjAxOSBhdCAxNToz
NywgQmVuc2NoLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5CZW5zY2hAcGFyc29ucy5jb20+IHdyb3Rl
Og0KPiBTb3VuZHMgbGlrZSBJIG5lZWQgdG8gbG9vayBvdmVyIHRoZSBkb2N1bWVudGF0aW9uIGFn
YWluLiBJIG1heSBoYXZlIG1pc2lkZW50aWZpZWQgd2hpY2ggQ1BVIHRoZSB0YXJnZXQgZGV2aWNl
IGlzIHVzaW5nIGlmIGNwMTUgaXMgb25seSBwcmVzZW50IG9uIHRoZSBBIHNlcmllcy4gQXMgYSBz
aWRlIG5vdGUsIGlzIHRoZXJlIGFuIG92ZXJ2aWV3IGZvciBpbXBsZW1lbnRpbmcgYSBuZXcgYm9h
cmQgaW4gUUVNVT8gSSd2ZSBzZWFyY2hlZCBmb3IgYSB3ZWVrIGJ1dCBoYXZlbid0IGJlZW4gYWJs
ZSB0byB0dXJuIHVwIGFueXRoaW5nIGNvbXByZWhlbnNpdmUsIGFuZCBub25lIG9mIHRoZSBjdXJy
ZW50bHkgZXhpc3RpbmcgYm9hcmRzIHNlZW0gdG8gaGF2ZSBmb2xsb3dlZCBhbnkgY2xlYXIgc3Ry
dWN0dXJlIGZvciBpbXBsZW1lbnRhdGlvbi4gUmVmZXJlbmNlIG1hdGVyaWFsIGZvciBjcmVhdGlu
ZyBhIGRldmljZSB3b3VsZCByZWFsbHkgaGVscCBtZSBvdXQuDQoNCk5vLCBJJ20gYWZyYWlkIHdl
IGRvbid0IGhhdmUgZG9jdW1lbnRhdGlvbiBmb3IgY3JlYXRpbmcgbmV3IGJvYXJkcy4NClRoZSBi
ZXN0IGFkdmljZSBpcyB0byBsb29rIGF0IG9uZSBvZiB0aGUgbW9yZSByZWNlbnRseSBhZGRlZCBl
eGlzdGluZyBib2FyZHMsIGFuZCBmb2xsb3cgdGhlIGtpbmRzIG9mIHRoaW5ncyB0aGF0IGl0IGRv
ZXMuDQpPbGRlciBib2FyZCBtb2RlbHMgYW5kIGRldmljZSBtb2RlbHMgdGVuZCB0byB1c2Ugc3R5
bGVzIG9yIEFQSXMgdGhhdCBhcmUgZGVwcmVjYXRlZCBvciBoYXZlIGJldHRlciBhcHByb2FjaGVz
IG5vd2FkYXlzLg0KDQp0aGFua3MNCi0tIFBNTQ0KDQpOT1RJQ0U6IFRoaXMgZW1haWwgbWVzc2Fn
ZSBhbmQgYWxsIGF0dGFjaG1lbnRzIHRyYW5zbWl0dGVkIHdpdGggaXQgbWF5IGNvbnRhaW4gcHJp
dmlsZWdlZCBhbmQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLCBhbmQgaW5mb3JtYXRpb24gdGhh
dCBpcyBwcm90ZWN0ZWQgYnksIGFuZCBwcm9wcmlldGFyeSB0bywgUGFyc29ucyBDb3Jwb3JhdGlv
biwgYW5kIGlzIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgYWRkcmVzc2VlIGZv
ciB0aGUgc3BlY2lmaWMgcHVycG9zZSBzZXQgZm9ydGggaW4gdGhpcyBjb21tdW5pY2F0aW9uLiBJ
ZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgeW91IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgcmVhZGluZywgZGlzc2VtaW5hdGlv
biwgZGlzdHJpYnV0aW9uLCBjb3B5aW5nLCBvciBvdGhlciB1c2Ugb2YgdGhpcyBtZXNzYWdlIG9y
IGl0cyBhdHRhY2htZW50cyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLCBhbmQgeW91IHNob3VsZCBk
ZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBhbGwgY29waWVzIGFuZCBiYWNrdXBzIHRoZXJlb2YuIFRo
ZSByZWNpcGllbnQgbWF5IG5vdCBmdXJ0aGVyIGRpc3RyaWJ1dGUgb3IgdXNlIGFueSBvZiB0aGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiB3aXRob3V0IHRoZSBleHByZXNzIHdyaXR0ZW4g
YXV0aG9yaXphdGlvbiBvZiB0aGUgc2VuZGVyLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1l
c3NhZ2UgaW4gZXJyb3IsIG9yIGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMgcmVnYXJkaW5nIHRo
ZSB1c2Ugb2YgdGhlIHByb3ByaWV0YXJ5IGluZm9ybWF0aW9uIGNvbnRhaW5lZCB0aGVyZWluLCBw
bGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIG9mIHRoaXMgbWVzc2FnZSBpbW1lZGlhdGVseSwgYW5k
IHRoZSBzZW5kZXIgd2lsbCBwcm92aWRlIHlvdSB3aXRoIGZ1cnRoZXIgaW5zdHJ1Y3Rpb25zLg0K
