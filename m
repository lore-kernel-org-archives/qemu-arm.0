Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2602891wrg;
        Mon, 17 Jun 2019 08:01:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzy/a74DdiZRlZNOfaG08l7yV/DNzJii+TkkmpUE4REu9kUquGzDCb7QZUW7eRWyBcetoBQ
X-Received: by 2002:a50:9422:: with SMTP id p31mr78485739eda.127.1560783712067;
        Mon, 17 Jun 2019 08:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560783712; cv=none;
        d=google.com; s=arc-20160816;
        b=SgI0bJDR7NYFo5bNfzJ1/JxARyTvcpSiqts0+e/ELXUkVVkWqtZCPihbJBPRPib8cf
         Q72IxMP2IuMStWVelKF3JCmDpIN0fVJpBV4Qn9HtAvG1WWY/xD6tTJr9FEyH+e74dI5f
         sjr8WP3+zKof5561Vmg2/91K89oyDVuVLJk8Yyy1+KF/jl9NdMvb3VDcnQlcvOB6bsBP
         DqlvlB8CYwAfmP/qrXtI2IiBKDbbqDCWIb8EG1Qa+nRY+34vodzFEB5DlbOT32w53p3B
         3uzMjyAY1I3OWK1qQmaLsume8u6NyzmvJ41e6d3akvf88a6ajxDFJ1+q4+socvi5Rop2
         z2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=+A2GKah5xqZQzcz7Fr4b+TBQfuDS7WL8AXzZ86IECSM=;
        b=lRmz9pR5UNtVsbiFpH7YvShZ1fj4EBcg27Q95zfz5erSUIynTrZzOvhBqUZ7z3Y90M
         jVeeICSDXa/g5HNL7+P8SIh4pguW1L/ygUc+kT+EUgU2UMGKtehoeA7vr7pl3XeSLtpD
         jPrKNc1xllT7Zlj+1WQKz9zJvcckL6vkzSoCli9yD28k7YzPLPgoVVBbvBmA/XXyHbc1
         0X/o/fZmGglga7/voxZ74TRxDcJRHuGCmrxnjAn7OI2jQ8PYp5mvZVj+uxkvn+oF/WT+
         HryDlUdPCxufZH1S3jw3Z0iO+DkOa57Ajz7jLU+QNOdHdvDrQXpNnksNUXH2/q+P7kTZ
         6e3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si8135628edi.266.2019.06.17.08.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 08:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=parsons.com
Received: from localhost ([::1]:48254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hct8p-0003hg-2K
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 11:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47561)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcslD-0005we-Te
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcslA-0001cm-M7
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:37:27 -0400
Received: from txdal11mx03.parsons.com ([206.219.199.111]:48568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <prvs=10717ad0aa=alexander.bensch@parsons.com>)
 id 1hcsl2-0001Q4-MA
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 10:37:19 -0400
Received: from pps.filterd (txdal11mx03.parsons.com [127.0.0.1])
 by txdal11mx03.parsons.com (8.16.0.27/8.16.0.27) with SMTP id x5HEYgjI011045; 
 Mon, 17 Jun 2019 09:36:52 -0500
Received: from txdal11exch03.parsons.com (txdal11exch03.parsons.com
 [172.21.212.129])
 by txdal11mx03.parsons.com with ESMTP id 2t6basgb5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2019 09:36:52 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 TXDAL11EXCH03.Parsons.com (172.21.212.129) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Mon, 17 Jun 2019 09:36:51 -0500
Received: from ALHUN12EXCH02.Parsons.com (10.62.8.72) by
 ALHUN12EXCH02.Parsons.com (10.62.8.72) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 17 Jun 2019 09:36:47 -0500
Received: from ALHUN12EXCH02.Parsons.com ([10.62.8.72]) by
 ALHUN12EXCH02.Parsons.com ([10.62.8.72]) with mapi id 15.00.1473.003; Mon, 17
 Jun 2019 09:36:47 -0500
From: "Bensch, Alexander" <Alexander.Bensch@parsons.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [EXTERNAL] Re: [Qemu-arm] Custom machine: Forcing initial boot
 address
Thread-Index: AQHVJRG68mGyP1fYhEaWCVh+7AmTaaaf6MIg
Date: Mon, 17 Jun 2019 14:36:47 +0000
Message-ID: <826f48411ef4496e95ce0fcb42ac3e83@ALHUN12EXCH02.Parsons.com>
References: <7757fcde65574754a8123d473be4b8a2@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA9KYsqTcXTTkPmL+x97i7v5X9J2gOPNg-P0oFVNoTFzfg@mail.gmail.com>
 <4ca9467fcfa649ad8ef1f1f5f1bdf701@ALHUN12EXCH02.Parsons.com>
 <CAFEAcA81YHFkDvsjWLiY6EoqgQSoeDKFAxNrGB6_m_B0cwaCFA@mail.gmail.com>
In-Reply-To: <CAFEAcA81YHFkDvsjWLiY6EoqgQSoeDKFAxNrGB6_m_B0cwaCFA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Enabled=True;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SiteId=8d088ff8-7e52-4d0f-8187-dcd9ca37815a;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_Owner=Alexander.Bensch@parsons.com;
 MSIP_Label_79ae2783-b6e8-45ab-9e71-54c07b2dade0_SetDate=2019-06-17T14:36:46.2424145Z;
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
X-Received-From: 206.219.199.111
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
X-TUID: 2KmCjqPM73J/

U291bmRzIGxpa2UgSSBuZWVkIHRvIGxvb2sgb3ZlciB0aGUgZG9jdW1lbnRhdGlvbiBhZ2Fpbi4g
SSBtYXkgaGF2ZSBtaXNpZGVudGlmaWVkIHdoaWNoIENQVSB0aGUgdGFyZ2V0IGRldmljZSBpcyB1
c2luZyBpZiBjcDE1IGlzIG9ubHkgcHJlc2VudCBvbiB0aGUgQSBzZXJpZXMuIEFzIGEgc2lkZSBu
b3RlLCBpcyB0aGVyZSBhbiBvdmVydmlldyBmb3IgaW1wbGVtZW50aW5nIGEgbmV3IGJvYXJkIGlu
IFFFTVU/IEkndmUgc2VhcmNoZWQgZm9yIGEgd2VlayBidXQgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
dHVybiB1cCBhbnl0aGluZyBjb21wcmVoZW5zaXZlLCBhbmQgbm9uZSBvZiB0aGUgY3VycmVudGx5
IGV4aXN0aW5nIGJvYXJkcyBzZWVtIHRvIGhhdmUgZm9sbG93ZWQgYW55IGNsZWFyIHN0cnVjdHVy
ZSBmb3IgaW1wbGVtZW50YXRpb24uIFJlZmVyZW5jZSBtYXRlcmlhbCBmb3IgY3JlYXRpbmcgYSBk
ZXZpY2Ugd291bGQgcmVhbGx5IGhlbHAgbWUgb3V0Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KU2Vu
dDogTW9uZGF5LCBKdW5lIDE3LCAyMDE5IDk6MzcgQU0NClRvOiBCZW5zY2gsIEFsZXhhbmRlciA8
QWxleGFuZGVyLkJlbnNjaEBwYXJzb25zLmNvbT4NCkNjOiBxZW11LWFybUBub25nbnUub3JnDQpT
dWJqZWN0OiBSZTogW0VYVEVSTkFMXSBSZTogW1FlbXUtYXJtXSBDdXN0b20gbWFjaGluZTogRm9y
Y2luZyBpbml0aWFsIGJvb3QgYWRkcmVzcw0KDQpPbiBNb24sIDE3IEp1biAyMDE5IGF0IDE0OjE1
LCBCZW5zY2gsIEFsZXhhbmRlciA8QWxleGFuZGVyLkJlbnNjaEBwYXJzb25zLmNvbT4gd3JvdGU6
DQo+IFNvcnJ5IGZvciBtaXNzaW5nIHNvbWUgb2YgdGhlIGRldGFpbHMsIGFzIHdlbGwuIFRoZSBD
UFUgSSdtIGN1cnJlbnRseSB0cnlpbmcgdG8gYmFzZSBteSBlbXVsYXRpb24gb2ZmIG9mIHRoZSBD
b3J0ZXgtTTMsIGFsdGhvdWdoIEknbSBub3QgYWN0dWFsbHkgc3VyZSB3aGV0aGVyIHRoZSBkZXZp
Y2UgSSdtIGF0dGVtcHRpbmcgdG8gZW11bGF0ZSBpcyBhbiBNMyBvciBNNC4gRnJvbSB3aGF0IEkn
dmUgcmVhZCB0aGUgb25seSByZWFsIGRpZmZlcmVuY2UgaXMgc29tZSBUaHVtYiBzdXBwb3J0IGFu
ZCBhIERTUCBtb2R1bGUsIG5laXRoZXIgb2Ygd2hpY2ggSSBuZWVkIGhvcGVmdWxseS4NCj4NCj4g
VGhlIHJlZ2lzdGVyIHRoYXQgSSB3YXMgcmVmZXJyaW5nIHRvIHdhcyBjb250cm9sIHJlZ2lzdGVy
IDE1LCB3aGljaCBpbiB0aGUgZG9jcyBJIGhhdmUgaXMgcmVmZXJyZWQgdG8gc2ltcGx5IGFzICJD
UFUgY29udHJvbCByZWdpc3Rlci4iIE15IHZlcnNpb24gb2YgUUVNVSAod2hpY2ggSSB3aWxsIHRy
eSB1cGRhdGluZyBhcyB5b3Ugc3VnZ2VzdGVkKSByZWZlcnMgdG8gJ2NwMTUubXZiYXInIGFuZCAn
Y3AxNS52YmFyJywgd2hpY2ggSSBoYXZlIGJlZW4gaW52ZXN0aWdhdGluZyBhcyB0aGUgbGlrZWx5
IGJhc2UgYWRkcmVzcyBmb3IgZXhlY3V0aW9uLg0KDQpNVkJBUiBhbmQgVkJBUiBhcmUgcmVnaXN0
ZXJzIGZvciBBLXByb2ZpbGUgQ1BVcy4gTS1wcm9maWxlIGlzIHNpZ25pZmljYW50bHkgZGlmZmVy
ZW50LiAoSW4gcGFydGljdWxhciBNLXByb2ZpbGUgZG9lcyBub3QgaGF2ZSBhICJjcDE1Ii4pIFFF
TVUgc3VwcG9ydHMgYm90aCwgYnV0IGNoYW5naW5nIHRoaW5ncyByZWxhdGVkIHRvIEEtcHJvZmls
ZSB3aWxsIGVpdGhlciBoYXZlIG5vIGVmZmVjdCBvciBiYWQgZWZmZWN0cyBvbiBlbXVsYXRpbmcg
YW4gTS1wcm9maWxlIENQVS4NCg0KTS1wcm9maWxlIGRvZXMgaGF2ZSBhIHJlZ2lzdGVyIGNhbGxl
ZCAiQ09OVFJPTCIsIGJ1dCB0aGlzIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyByZWxhdGVkIHRvIHRo
ZSB2ZWN0b3IgdGFibGUgYWRkcmVzcyBpbiBpdC4NCg0KSXMgaXQgcG9zc2libGUgdGhpcyByZWdp
c3RlciBpcyBub3QgcGFydCBvZiB0aGUgQ1BVIGJ1dCBpcyBpbiB0aGUgU29DPw0KDQpJIHdvdWxk
IGRlZmluaXRlbHkgcmVjb21tZW5kIGlmIHlvdSBkb24ndCBoYXZlIHRoZW0gYWxyZWFkeSBnZXR0
aW5nIGEgY29weSBvZiB0aGUgdjdNIGFyY2hpdGVjdHVyZSByZWZlcmVuY2UgbWFudWFsIGFuZCB0
aGUgQ29ydGV4LU0zL000IHRlY2huaWNhbCByZWZlcmVuY2UgbWFudWFscy4gVGhlbiB5b3UgY2Fu
IGNyb3NzLXJlZmVyZW5jZSBhZ2FpbnN0IHdoYXRldmVyIGRvY3MgeW91IGhhdmUgc28geW91IGNh
biBzZWUgd2hhdCdzIGFjdHVhbGx5IGFyY2hpdGVjdHVyYWwgYW5kIHdoYXQncyBzcGVjaWZpYyB0
byB0aGUgdGhpbmcgeW91J3JlIHRyeWluZyB0byBlbXVsYXRlLCBhbmQgeW91IGNhbiB1c2UgdGhl
IGFyY2hpdGVjdHVyZSdzIG5hbWVzIGZvciB0aGluZ3MgdGhhdCBhcmUgYXJjaGl0ZWN0dXJhbCwg
d2hpY2ggd2lsbCBtYWtlIHRoaXMgY29udmVyc2F0aW9uIGxlc3MgY29uZnVzaW5nIDotKQ0KDQo+
IFlvdSBtZW50aW9uIHY4TS4gSSBoYXZlbid0IGxvb2tlZCBpbnRvIHRoYXQgdmVyc2lvbiBvZiB0
aGUgYXJjaCwgYnV0IGNvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGV4ZWN1dGUgdjdNIGluc3RydWN0
aW9ucyBvbiBhIHY4TSBDUFU/DQoNCnY4TSBpcyB0aGUgbmV4dCB2ZXJzaW9uIHRoYXQgc3VwcG9y
dHMgKGFtb25nIG90aGVyIHRoaW5ncykgVHJ1c3Rab25lIGZvciBNIHByb2ZpbGUuIFlvdSB3b3Vs
ZCBzdGlsbCB3YW50IHRvIGRlYWwgd2l0aCB0aGUgdjdNIENQVXMgdGhvdWdoLiBJIG1lbnRpb24g
aXQganVzdCBiZWNhdXNlIHRoZSB2OE0gaW5pdC1zdnRvciBpbXBsZW1lbnRhdGlvbiBpcyBhIHVz
ZWZ1bCBndWlkZSB0byBpbXBsZW1lbnRpbmcgdGhlIHY3TSBpbml0LXZ0b3IuDQoNCj4gSSdkIGxp
a2UgdG8gYXZvaWQgbW9kaWZ5aW5nIFFFTVUgYXMgbXVjaCBhcyBwb3NzaWJsZSwgc28gaWYgdGhl
cmUncyBhbnkgd29ya2Fyb3VuZHMgbGlrZSB0aGF0IEknbSByZWNlcHRpdmUgdG8gdGhlbS4NCg0K
SWYgeW91IGFyZSB0cnlpbmcgdG8gZ2V0IFFFTVUgdG8gbW9kZWwgYSBib2FyZC9Tb0MgdGhhdCBp
dCBkb2VzIG5vdCBhbHJlYWR5IG1vZGVsLCB0aGVuIHlvdSBhcmUgaW5oZXJlbnRseSBsb29raW5n
IGF0IG1vZGlmeWluZyBRRU1VLCBJJ20gYWZyYWlkLiBUaGF0IGlzIHRoZSBvbmx5IHdheSB0byBh
ZGQgbmV3IGJvYXJkIG1vZGVscy4NCg0KdGhhbmtzDQotLSBQTU0NCg0KTk9USUNFOiBUaGlzIGVt
YWlsIG1lc3NhZ2UgYW5kIGFsbCBhdHRhY2htZW50cyB0cmFuc21pdHRlZCB3aXRoIGl0IG1heSBj
b250YWluIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiwgYW5kIGluZm9y
bWF0aW9uIHRoYXQgaXMgcHJvdGVjdGVkIGJ5LCBhbmQgcHJvcHJpZXRhcnkgdG8sIFBhcnNvbnMg
Q29ycG9yYXRpb24sIGFuZCBpcyBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGFk
ZHJlc3NlZSBmb3IgdGhlIHNwZWNpZmljIHB1cnBvc2Ugc2V0IGZvcnRoIGluIHRoaXMgY29tbXVu
aWNhdGlvbi4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMgbm90IHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQsIHlvdSBhcmUgaGVyZWJ5IG5vdGlmaWVkIHRoYXQgYW55IHJlYWRpbmcsIGRp
c3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgY29weWluZywgb3Igb3RoZXIgdXNlIG9mIHRoaXMg
bWVzc2FnZSBvciBpdHMgYXR0YWNobWVudHMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCwgYW5kIHlv
dSBzaG91bGQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgYWxsIGNvcGllcyBhbmQgYmFja3VwcyB0
aGVyZW9mLiBUaGUgcmVjaXBpZW50IG1heSBub3QgZnVydGhlciBkaXN0cmlidXRlIG9yIHVzZSBh
bnkgb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gd2l0aG91dCB0aGUgZXhwcmVz
cyB3cml0dGVuIGF1dGhvcml6YXRpb24gb2YgdGhlIHNlbmRlci4gSWYgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCBvciBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIHJl
Z2FyZGluZyB0aGUgdXNlIG9mIHRoZSBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiBjb250YWluZWQg
dGhlcmVpbiwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBvZiB0aGlzIG1lc3NhZ2UgaW1tZWRp
YXRlbHksIGFuZCB0aGUgc2VuZGVyIHdpbGwgcHJvdmlkZSB5b3Ugd2l0aCBmdXJ0aGVyIGluc3Ry
dWN0aW9ucy4NCg==
