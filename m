Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4649325lff;
        Mon, 16 Dec 2019 06:56:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwDU2MGWFaeV6Kdd6igUxRzjlrUdIwKaKtCJmL9UxUYA0CyyKelVJ8IxugCmqLDoJ3ESxUQ
X-Received: by 2002:ae9:e887:: with SMTP id a129mr26509304qkg.465.1576508204610;
        Mon, 16 Dec 2019 06:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576508204; cv=none;
        d=google.com; s=arc-20160816;
        b=KcBZhXvhrcN2sNzfs2epW+vLhdrhcwhbpuyrol6HngjpCfoXt8nX5crRezoh9jfjTd
         WCVwq+/FkTpyzfwGmTlwNeG63ylfZjy94577CcyGNzgpbJod9H+bsDTsNNaETRAq06f8
         9MzShwroBSwzTwLruAlGa+cRfDnEkbfKaxMmin2sAklpT4AiR8pNwGGLGApV2uhIbz+t
         UGHZrhv+HMS9St40nuQwmsdTsWzpdwLWN10tTK5Tuko84yamqe0/izHgPJ+3PYgORhoy
         4qIHL2ruBJoes7s5fRPB2MqaSh9ILHtqEukRISMA+AlySgTfjr3wCC2bd2E8mGFXBsbj
         BxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:content-id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=fsUpwpEZ/J/zAUOCl/OybCv/6wXahmN5L4niDYBQ4iA=;
        b=Mk+hQ78WXsX7xZHIZAm7zTwqwylMZ0bP+Wwz0XJuEOUHO41SRJNCwBhnTsWCytMic8
         798XvSEHi5tg68WCe6Kswe+eKY08esjmGGOW6WufjgAUQ68JRQJndG1iWlDr0WTotJ/k
         Hcs3OVSP12Rerk36EfzCHP8A+2Pzmrhhh1YAGu0SW2oNuurtAwIT/+LsOaGnHy0mneMv
         0pmJ9UyBjUb+LX/+UfErAF6JL/YUx8FKDzEjmujwwVtU6N32Vp65ygA6ycCjtVIfXP+f
         yftphXIoeRpAWjKJ5vKka3ZFmsW6aIb8foBywj+Lq+C14UWOWXaPbxSoglHAZ6NqgEiy
         O+4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=q0q3RHwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l90si9699699qtd.153.2019.12.16.06.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 06:56:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=q0q3RHwH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igrng-0000Js-0k
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 09:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=24629a80a=sveith@amazon.de>) id 1igrnY-0000Ji-PE
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 09:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=24629a80a=sveith@amazon.de>) id 1igrnX-0000NA-Nu
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 09:56:36 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:27175)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=24629a80a=sveith@amazon.de>)
 id 1igrnX-0000Kt-E7; Mon, 16 Dec 2019 09:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576508196; x=1608044196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=fsUpwpEZ/J/zAUOCl/OybCv/6wXahmN5L4niDYBQ4iA=;
 b=q0q3RHwHgu3keSsFVmIfXzrSl1JxqHpW/CDsffjUSXSLOC9PLUkwSi8z
 1nmdk6kGyvJ0f2vZXDp/P5XRewfhqRd8g828bz9+tYp5BgbUt+I2OyMKj
 2ZYHlAI8dIZWrCC/korQMnFvv8A9Gya++Ief4ACzVptVs2h2egle/rKCW U=;
IronPort-SDR: e7Y4Ql8Nj1IXYrRrq5Dpc5izbJ5/0bHzdXL3QH4qPArt8JMbOcILdf8odWQ6VyZ6JUJ4FTPCf2
 AOf9IeQX5G7A==
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; d="scan'208";a="15157566"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Dec 2019 14:56:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4D354A21E7; Mon, 16 Dec 2019 14:56:23 +0000 (UTC)
Received: from EX13D18EUC001.ant.amazon.com (10.43.164.108) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 14:56:22 +0000
Received: from EX13D18EUC002.ant.amazon.com (10.43.164.50) by
 EX13D18EUC001.ant.amazon.com (10.43.164.108) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 14:56:22 +0000
Received: from EX13D18EUC002.ant.amazon.com ([10.43.164.50]) by
 EX13D18EUC002.ant.amazon.com ([10.43.164.50]) with mapi id 15.00.1367.000;
 Mon, 16 Dec 2019 14:56:21 +0000
From: "Veith, Simon" <sveith@amazon.de>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
Thread-Topic: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event
 address handling
Thread-Index: AQHVsDNp2fogltgw+E+ej3y1KKrruae83nUAgAADFwA=
Date: Mon, 16 Dec 2019 14:56:21 +0000
Message-ID: <1576508180.11214.4.camel@amazon.de>
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
 <CAFEAcA-Zz+Ape9z39s8uHEGUN3nOH3-o9t=EEJsm9M+oeDuebQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Zz+Ape9z39s8uHEGUN3nOH3-o9t=EEJsm9M+oeDuebQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.222]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7E2C316EFBA97458F7C7324B932FDF5@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.190.10
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 15RL9CKKVSFR

T24gTW9uLCAyMDE5LTEyLTE2IGF0IDE0OjQ1ICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0K
PiBTb21ldGhpbmcgZnVubnkgc2VlbXMgdG8gaGF2ZSBoYXBwZW5lZCB3aGVuIHRoaXMgc2VyaWVz
IGdvdA0KPiBzZW50IG91dDogcGF0Y2hlcyAxLDIsMyBhcmUgY29ycmVjdGx5IGZvbGxvd3VwcyB0
byB0aGUgY292ZXINCj4gbGV0dGVyLCBidXQgNCw1LDYgYXJlIGZvbGxvd3VwcyB0byBwYXRjaCAz
Lg0KDQpZb3UgYXJlIGNvcnJlY3Q7IEkgaGFkIGZpeGVkIHVwIG9uZSBvZiB0aGUgcGF0Y2hlcyBh
cyBJIHdhcyBzZW5kaW5nDQp0aGVtIG91dCwgYW5kIHRob3VnaCBJIGhhZCB0aGVuIGFkZGVkIC0t
aW4tcmVwbHktdG8gcG9pbnRpbmcgdG8gdGhlDQpjb3ZlciBsZXR0ZXIsIGdpdC1zZW5kLWVtYWls
IHNlZW1zIHRvIGhhdmUgYWRkZWQgYW5vdGhlciBsZXZlbCBvZg0KdGhyZWFkaW5nLiBTb3JyeSBh
Ym91dCB0aGF0LiBJJ2xsIHJlc2VuZCB0aGUgc2VyaWVzIGFnYWluLg0KDQpSZWdhcmRzDQpTaW1v
bgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAz
OAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBK
b25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=

