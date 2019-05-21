Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1085875wrg;
        Tue, 21 May 2019 00:27:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGcsWOyUvTtkidn8xxmLe/Vl0oHfe61E7axI1p3SEAAsCYP9yJJrFQUiHjY3+J1/z23k4W
X-Received: by 2002:a50:982f:: with SMTP id g44mr81439692edb.278.1558423658864;
        Tue, 21 May 2019 00:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558423658; cv=none;
        d=google.com; s=arc-20160816;
        b=esHqInvdrXqNUeFumNiHFGf9V81xPWiXlOIKSN1rwOLcjpv+9e4FJVqFxN+x6eNX+7
         Z3WCNHCFswu2viNmCb4v8BjSL81hqYXarqtQrVz/ZTFldpk0O8wN+88DRfkwapobxYe4
         m4e+TZRNPeF4ag3dp+JabTIYzw1pafJ9eCNQgnnd9jdLuoY6Jn/i7dNzv16SfRorgw3u
         LK17JwZa0GA1AtqZsGG7bc2jKc5wPOVyJ2bS2ZFuVwDlAAgXp00v+wbL/RMHathg07y8
         4ktg3IqpJiUUukS96t4nRiii7614zTak2ZNHy66LgBxdEEksfYdg2SuWnDB88MdLovzR
         /05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:dkim-signature;
        bh=CzT8Co39mEFzGYDt/cuJo1yardRv23aflTQ4l2JQRWk=;
        b=t7+ZDnSopGy9+fxKbcB9pbmh/Rlkh8m4AgwvqZFpaFhyv7Bbanx6BuN85dchw75Iep
         GZwr0Y/HEr4hf1B9b4QL/P+L4gjJWO2jnDJ1aPD5j3DP/qdwLYxDNe9rfsvPw1Z0Jc+5
         pqyyhAS2BsxiCTE7D2paWn6OmxTWg2iW9X9WJp4XxhskJIz/5kH7e6DXQcIzHFNTSkvb
         Ssy0xHwKa37uKYQSSQbFVy/9PcAxuqwKIaySzOeo00WW2ESmqyRVVwp+dOVwGuzdggYC
         ZS74VXAp83aWKeiNDzYsovRofpAf81noRWF8qVL2X8GRUTzRbE+aptH4j3CGSJJ2E5wg
         BKmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kpnmail.nl header.s=kpnmail01 header.b=T4ovA8nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eltan.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si3024568ejq.153.2019.05.21.00.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 00:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kpnmail.nl header.s=kpnmail01 header.b=T4ovA8nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eltan.com
Received: from localhost ([127.0.0.1]:48175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSzBR-0004js-V2
	for alex.bennee@linaro.org; Tue, 21 May 2019 03:27:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>) id 1hSzBI-0004ix-9U
	for qemu-arm@nongnu.org; Tue, 21 May 2019 03:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>) id 1hSzBH-0007B4-6z
	for qemu-arm@nongnu.org; Tue, 21 May 2019 03:27:28 -0400
Received: from cpsmtpb-ews01.kpnxchange.com ([213.75.39.4]:59494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wvervoorn@eltan.com>)
	id 1hSzBC-00077J-H2; Tue, 21 May 2019 03:27:23 -0400
Received: from cpsps-ews26.kpnxchange.com ([10.94.84.192]) by
	cpsmtpb-ews01.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
	Tue, 21 May 2019 09:27:18 +0200
X-Brand: 7abm2Q==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
	te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=RugU0xuK c=1 sm=1 tr=0 cx=a_idp_e
	a=WB5lYbMG1jvHJ1f8o08CVQ==:117 a=WB5lYbMG1jvHJ1f8o08CVQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
	a=xqWC_Br6kY4A:10 a=E5NmQfObTbMA:10 a=aow-egSQAAAA:8 a=20KFwNOVAAAA:8
	a=KKAkSRfTAAAA:8 a=X5F7dNyOAAAA:8 a=69wJf7TsAAAA:8
	a=rz7K1-tS9dIF2Q5L5vwA:9 a=Qi8iTSwQ1jAtfPGZ:21 a=dNiXiHrTzfZl5jbE:21
	a=QEXdDO2ut3YA:10 a=gFNbaldVC-z-bsjSTzMo:22 a=cvBusfyB2V15izCimMoJ:22
	a=pS7LufLo7ZPxIL5li5Lt:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.14]) by cpsps-ews26.kpnxchange.com
	over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384);
	Tue, 21 May 2019 09:27:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:content-type:message-id:date:subject:to:from;
	bh=CzT8Co39mEFzGYDt/cuJo1yardRv23aflTQ4l2JQRWk=;
	b=T4ovA8nurR1ieWeuQV35O66Q93VyE9kPEAQomE048eSrjEjAwG8M3SRrYUnQfkWZzpsRHA1OLky0Q
	NRuBbDL3FnoowVLfeX9frSBumZKnlVn5E32+81GIIC0F254dia8kjhl4F2tDDlFfAKHmrsSQ78jA0a
	0TWFvA1W4/IMewfU=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
	by smtp.kpnmail.nl (Halon) with ESMTPS
	id dd01405b-7b99-11e9-aeb7-00505699d6e5;
	Tue, 21 May 2019 09:27:18 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
	(192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32;
	Tue, 21 May 2019 09:27:11 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
	Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
	15.00.0847.040; Tue, 21 May 2019 09:26:54 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Jason Wang
	<jasowang@redhat.com>
Thread-Topic: [PATCH] ftgmac100: do not link to netdev
Thread-Index: AQHVDzeM3eYrciCzgECTQUdGproJhqZ1Ll9Q
Date: Tue, 21 May 2019 07:26:53 +0000
Message-ID: <ce3a871593c44d248a30320febd649fd@Eltsrv03.Eltan.local>
References: <20190520181111.20407-1-clg@kaod.org>
In-Reply-To: <20190520181111.20407-1-clg@kaod.org>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 21 May 2019 07:27:18.0226 (UTC)
	FILETIME=[9EE78B20:01D50FA6]
X-RcptDomain: nongnu.org
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 213.75.39.4
Subject: Re: [Qemu-arm] [PATCH] ftgmac100: do not link to netdev
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SysOjBXHSL8P

SGVsbG8gQ8OpZHJpYywNCg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGhlbHAuIEl0IGlzIHdvcmtp
bmcgbm93IQ0KDQpCZXN0IFJlZ2FyZHMsDQpXaW0gVmVydm9vcm4NCg0KDQoNCiJUSElTIE1FU1NB
R0UgQ09OVEFJTlMgQ09ORklERU5USUFMIElORk9STUFUSU9OLiBVTkxFU1MgWU9VIEFSRSBUSEUg
SU5URU5ERUQgUkVDSVBJRU5UIE9GIFRISVMgTUVTU0FHRSwgQU5ZIFVTRSBPRiBUSElTIE1FU1NB
R0UgSVMgU1RSSUNUTFkgUFJPSElCSVRFRC4gSUYgWU9VIEhBVkUgUkVDRUlWRUQgVEhJUyBNRVNT
QUdFIElOIEVSUk9SLCBQTEVBU0UgSU1NRURJQVRFTFkgTk9USUZZIFRIRSBTRU5ERVIgQlkgVEVM
RVBIT05FICszMS0oMCk3My01OTQ0NjY0IE9SIFJFUExZIEVNQUlMLCBBTkQgSU1NRURJQVRFTFkg
REVMRVRFIFRISVMgTUVTU0FHRSBBTkQgQUxMIENPUElFUy4iwqANCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEPDqWRyaWMgTGUgR29hdGVyIFttYWlsdG86Y2xnQGthb2Qub3Jn
XSANClNlbnQ6IE1vbmRheSwgTWF5IDIwLCAyMDE5IDg6MTEgUE0NClRvOiBKYXNvbiBXYW5nIDxq
YXNvd2FuZ0ByZWRoYXQuY29tPg0KQ2M6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGlu
YXJvLm9yZz47IFdpbSBWZXJ2b29ybiA8d3ZlcnZvb3JuQGVsdGFuLmNvbT47IEFuZHJldyBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBDw6lkcmljIExlIEdvYXRl
ciA8Y2xnQGthb2Qub3JnPg0KU3ViamVjdDogW1BBVENIXSBmdGdtYWMxMDA6IGRvIG5vdCBsaW5r
IHRvIG5ldGRldg0KDQpxZGV2X3NldF9uaWNfcHJvcGVydGllcygpIGlzIGFscmVhZHkgdXNlZCBp
biB0aGUgQXNwZWVkIFNvQyBsZXZlbCB0byBiaW5kIHRoZSBmdGdtYWMxMDAgZGV2aWNlIHRvIHRo
ZSBuZXRkZXYuDQoNClRoaXMgaXMgZml4aW5nIHN1cHBvcnQgZm9yIG11bHRpcGxlIG5ldCBkZXZp
Y2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0K
LS0tDQogaHcvbmV0L2Z0Z21hYzEwMC5jIHwgMiAtLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvaHcvbmV0L2Z0Z21hYzEwMC5jIGIvaHcvbmV0L2Z0Z21h
YzEwMC5jIGluZGV4IDc5MDQzMDM0NmI1MS4uZDk5ODZjNmJhYTkyIDEwMDY0NA0KLS0tIGEvaHcv
bmV0L2Z0Z21hYzEwMC5jDQorKysgYi9ody9uZXQvZnRnbWFjMTAwLmMNCkBAIC0xMDE2LDggKzEw
MTYsNiBAQCBzdGF0aWMgdm9pZCBmdGdtYWMxMDBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBF
cnJvciAqKmVycnApDQogICAgIHN5c2J1c19pbml0X2lycShzYmQsICZzLT5pcnEpOw0KICAgICBx
ZW11X21hY2FkZHJfZGVmYXVsdF9pZl91bnNldCgmcy0+Y29uZi5tYWNhZGRyKTsNCiANCi0gICAg
cy0+Y29uZi5wZWVycy5uY3NbMF0gPSBuZF90YWJsZVswXS5uZXRkZXY7DQotDQogICAgIHMtPm5p
YyA9IHFlbXVfbmV3X25pYygmbmV0X2Z0Z21hYzEwMF9pbmZvLCAmcy0+Y29uZiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKGRldikpLCBERVZJ
Q0UoZGV2KS0+aWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICBzKTsNCi0tDQoyLjIwLjEN
Cg0KDQoNCg==
