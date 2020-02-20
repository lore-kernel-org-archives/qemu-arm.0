Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp592328lfg;
        Thu, 20 Feb 2020 05:56:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2zO/zaEB+7VA5TFNnBsDBKr8RpDK4duDFPjfxElopylC8OJHPmImv2aAS7DH/eFynayoR
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr9970779oto.177.1582206999380;
        Thu, 20 Feb 2020 05:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582206999; cv=none;
        d=google.com; s=arc-20160816;
        b=GzZwff4E6Jj9hsPkiM+vp55vAA1S4nX4GowYDTn+pEbWMOgCE1GEtee1rldB95CAc/
         HuhE9WknOin3Hi7VybWt/cxwUqHKD3aqBKUHz2LQMytdK2ofF8LDzjWi+IQWzl0jGZRk
         UBniatzeCQ/FKoXGfPiryGbOJ5tqCBpIFDLj0x8k8E3BKqc6URHz3T3273yjuGbZrrUV
         VjK+/mO6hAMGE0Bi0YW0YA7dfZ7I/ZKdNG1lkZIslqn5WatMIDGnMPYQc2lOJz9+/PWw
         9pW3mVIHBcSM1pVzAfKCgucRcqz5WQDaGLw9doAkTxGD+cFNd7NOqcrOsNJh4cDHGYng
         DcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:ironport-sdr
         :dkim-signature;
        bh=6qRdb2tHAjpNw5HxV4uP0hoa7Zzgw6Kqa078Vn8d190=;
        b=lDDrXL7sAy2Sbw7DsM3FhONN6oo7k5VYV04bMZ9ziXKS862L2YjJE2Pu5iihRTu6/L
         RhpIL5n7B7jvEoXw5xxjdvJA3yuYRZFnCIcFp9Yvw9iuxBDk0nVz55WuU9+I+JYFQDu9
         h2JZBzOgH8eJqiN+wI14NK5SSWkS49IW/Y6RNlhRbthW6Yvp243fAnmHbyXkyfM+uzvA
         ZiiNWfqpDoLWowABHvtzvkYI04wvvfQoWiLRT3QXPSyHjcrkuIXiXc+2JoD5crdLczdJ
         cj43+EslO/vAnl2Hr69b20vtsIPixbYZTxwP9v/XxHhax9+mlSy3cUND9FXdBs+/gEo8
         4ZEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.co.uk header.s=amazon201209 header.b=i21ChyGe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.co.uk
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v11si1725115otp.279.2020.02.20.05.56.39;
        Thu, 20 Feb 2020 05:56:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.co.uk header.s=amazon201209 header.b=i21ChyGe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.co.uk
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgBTN4h (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 20 Feb 2020 08:56:37 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:34883 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgBTN4g (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Feb 2020 08:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1582206996; x=1613742996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6qRdb2tHAjpNw5HxV4uP0hoa7Zzgw6Kqa078Vn8d190=;
  b=i21ChyGeUIIfLTy76yfgNa9jdwrzx3cPRQGuVw7Mc4L9Vei6O1gO6Xvs
   5wnO4Ucq2ZKLdNAtslPP/eGcSs0EfNHJGJVB5yo37FCT8DbPDb9H6UtZC
   OP3ilC1cBmnbb6MNLAfeX2H1DVH+WTdVeKOVMCR+ErwExtvgisvwjPwV4
   s=;
IronPort-SDR: wo2CTn8HSGq9XguOwKHujm9WgWfPn/NXmA5jPzTfTb+B/pt4Sdg7JXx/m7QeCdVyHX4aytsS43
 SUTF86rdYH9g==
X-IronPort-AV: E=Sophos;i="5.70,464,1574121600"; 
   d="scan'208";a="17947101"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 20 Feb 2020 13:56:31 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS id 13F73A1ECB;
        Thu, 20 Feb 2020 13:56:20 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 20 Feb 2020 13:56:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 20 Feb 2020 13:56:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 20 Feb 2020 13:56:18 +0000
From:   "Durrant, Paul" <pdurrant@amazon.co.uk>
To:     =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
        "Peter Maydell" <peter.maydell@linaro.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC:     Fam Zheng <fam@euphon.net>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        "Stefano Stabellini" <sstabellini@kernel.org>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
        David Hildenbrand <david@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "Aleksandar Rikalo" <aleksandar.rikalo@rt-rk.com>,
        Richard Henderson <rth@twiddle.net>,
        Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        "Alistair Francis" <alistair@alistair23.me>,
        Richard Henderson <richard.henderson@linaro.org>,
        Paul Durrant <paul@xen.org>,
        Eric Auger <eric.auger@redhat.com>,
        "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
        "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
        =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
        John Snow <jsnow@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        "Igor Mitsyanko" <i.mitsyanko@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>,
        "Michael Walle" <michael@walle.cc>,
        "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
        "Paolo Bonzini" <pbonzini@redhat.com>
Subject: RE: [Xen-devel] [PATCH v3 03/20] exec: Let qemu_ram_*() functions
 take a const pointer argument
Thread-Topic: [Xen-devel] [PATCH v3 03/20] exec: Let qemu_ram_*() functions
 take a const pointer argument
Thread-Index: AQHV5+62bDvzVj67r0Cu6rYKUNoaGagkGwNQ
Date:   Thu, 20 Feb 2020 13:56:18 +0000
Message-ID: <a7c2db54d9b04909a5c733ebe5cc5bd9@EX13D32EUC003.ant.amazon.com>
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-4-philmd@redhat.com>
In-Reply-To: <20200220130548.29974-4-philmd@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.112]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vgfmOvZzxnbg

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kNCj4gU2VudDogMjAgRmVicnVhcnkgMjAyMCAxMzowNg0KPiBUbzogUGV0
ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgcWVtdS1kZXZlbEBub25nbnUu
b3JnDQo+IENjOiBGYW0gWmhlbmcgPGZhbUBldXBob24ubmV0PjsgRG1pdHJ5IEZsZXl0bWFuDQo+
IDxkbWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsga3ZtQHZnZXIua2VybmVsLm9yZzsgTWljaGFl
bCBTLiBUc2lya2luDQo+IDxtc3RAcmVkaGF0LmNvbT47IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+OyBHZXJkIEhvZmZtYW5uDQo+IDxrcmF4ZWxAcmVkaGF0LmNvbT47IEVkZ2FyIEUu
IElnbGVzaWFzIDxlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBNYXR0aGV3IFJvc2F0bw0KPiA8bWpyb3NhdG9A
bGludXguaWJtLmNvbT47IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgRGF2aWQgSGlsZGVuYnJhbmQN
Cj4gPGRhdmlkQHJlZGhhdC5jb20+OyBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT47
IENocmlzdGlhbg0KPiBCb3JudHJhZWdlciA8Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT47IEhlcnbD
qSBQb3Vzc2luZWF1DQo+IDxocG91c3NpbkByZWFjdG9zLm9yZz47IE1hcmNlbCBBcGZlbGJhdW0g
PG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPjsNCj4gQW50aG9ueSBQZXJhcmQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBB
bGVrc2FuZGFyIFJpa2FsbyA8YWxla3NhbmRhci5yaWthbG9AcnQtDQo+IHJrLmNvbT47IFJpY2hh
cmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0K
PiA8cGhpbG1kQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQuY29t
PjsgVGhvbWFzIEh1dGgNCj4gPHRodXRoQHJlZGhhdC5jb20+OyBFZHVhcmRvIEhhYmtvc3QgPGVo
YWJrb3N0QHJlZGhhdC5jb20+OyBTdGVmYW4gV2VpbA0KPiA8c3dAd2VpbG5ldHouZGU+OyBBbGlz
dGFpciBGcmFuY2lzIDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPjsgUmljaGFyZA0KPiBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVu
Lm9yZz47DQo+IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT47IHFlbXUtczM5MHhA
bm9uZ251Lm9yZzsgcWVtdS0NCj4gYXJtQG5vbmdudS5vcmc7IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+OyBKb2huIFNub3cNCj4gPGpzbm93QHJlZGhhdC5jb20+OyBEYXZpZCBHaWJz
b24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT47IElnb3INCj4gTWl0c3lhbmtvIDxpLm1p
dHN5YW5rb0BnbWFpbC5jb20+OyBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT47DQo+
IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+OyBxZW11LXBwY0Bub25nbnUub3JnOyBQ
YW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRl
dmVsXSBbUEFUQ0ggdjMgMDMvMjBdIGV4ZWM6IExldCBxZW11X3JhbV8qKCkgZnVuY3Rpb25zDQo+
IHRha2UgYSBjb25zdCBwb2ludGVyIGFyZ3VtZW50DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCg==
