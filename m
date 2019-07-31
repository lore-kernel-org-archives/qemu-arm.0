Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6198600wrv;
        Wed, 31 Jul 2019 16:24:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMZDs2jVr5vTTukTzj6b1mEEMYRirRWxlJiCpCkqEaFL1hJgYfC2xvIWSR1k5nB3pEtRCs
X-Received: by 2002:a05:6402:6d0:: with SMTP id n16mr27778538edy.168.1564615481812;
        Wed, 31 Jul 2019 16:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564615481; cv=none;
        d=google.com; s=arc-20160816;
        b=Jw/XyusdKvauM0lTPZIB0kFeX+oM8IZ8us73gx2m8X59EYiP0PI0cbQD7Lg1qB4mqU
         72G7iu4fcxjrR3GhUp+POcf6YaPZ+/MjHuRVfQZ+rNvPJZjQAGIGS+xWcRwcAIY/CUpF
         SZBX3cFQXcyPFzCUDpCSSWSOp0dA75IvKwvq/AIT6OYK56xhBLuwoOGiC6DBtM+tbscc
         ayiE82Fv6WeGuL4s8VPrNfyNYNaSBc2ogRk8hQV44i60VWJBlNUWoP4vbbv/izucO1oP
         RbX7g2eI5jgocmttoMesCQruYrVsk2qqTbXi3tzjTIp6Y/Y885Pvv79iHEOoeporlWc6
         xLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=JiOENqEGwZ0VwIxuaQJE5qjhFBRs2h4k0ibwOSY2oHQ=;
        b=gQViI+wGSuIhpvZcIai+lQsNsly5u/7blj6fAunlMEKe6tPDVLDwD8dGSYbYW195qt
         oVJ7GuyC1LKvpgW5pVNhmbULltrtGHv/58ZA0dt35JoVgb9guW9pwmDjKXeT3mOYTHD3
         7t8zZ7F4qWz5EUiQTGFQH47vXiasUccjs95qC4Kr3TWRo7uNRpAemZ5lGsQk+gsD14ny
         G+p2KeK9oujjAmeJCV9kmx65+5f2lbfch5qGZ5Rb5rcfR2QYe+7xazxmTd+LRD/5XRBk
         EGoT+mZ2jAP3nTNrVQtcnXDrAY8rEfSHQG2aPXuBXORDuYEoqw/F94IkRJU57zwiPaWV
         rcsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si19421905eju.390.2019.07.31.16.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 16:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsxxY-00052O-Ue
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 19:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kevin.tian@intel.com>) id 1hsxwZ-000433-VW
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 19:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kevin.tian@intel.com>) id 1hsxwZ-0001TB-3H
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 19:23:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:5182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kevin.tian@intel.com>)
 id 1hsxwY-0001OU-Rj; Wed, 31 Jul 2019 19:23:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 16:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,332,1559545200"; d="scan'208";a="174973704"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 31 Jul 2019 16:23:29 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 31 Jul 2019 16:23:28 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 31 Jul 2019 16:23:28 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.163]) with mapi id 14.03.0439.000;
 Thu, 1 Aug 2019 07:23:26 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH for-4.2 v10 11/15] virtio-iommu: Expose the IOAPIC MSI
 reserved region when relevant
Thread-Index: AQHVRvuB+lYfnIqunUiYF7Ql9SMCpqbjCI0AgADC99CAAMu+AIAABW2AgADAzMA=
Date: Wed, 31 Jul 2019 23:23:26 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CAFD1AF@SHSMSX104.ccr.corp.intel.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-12-eric.auger@redhat.com>
 <20190730153628-mutt-send-email-mst@kernel.org>
 <AADFC41AFE54684AB9EE6CBC0274A5D19CAF8E1B@SHSMSX104.ccr.corp.intel.com>
 <20190731151834-mutt-send-email-mst@kernel.org>
 <95de34e9-1b1a-3eff-cebb-ee146e9acc78@redhat.com>
In-Reply-To: <95de34e9-1b1a-3eff-cebb-ee146e9acc78@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDQ3ZTA0ZTktNDgwNC00ZjcwLWFkZjgtMDNkMTI3YTM5ZmNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib2lZR0hYWkZqbStORFBUdktsdldMU0wweTVNV3FHMlZMNThETzVnTmRBVjM3elVEbHIrclJvTTVcL1B2RUI0WFIifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH for-4.2 v10 11/15] virtio-iommu: Expose the
 IOAPIC MSI reserved region when relevant
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UrtnCJCci9hF

PiBGcm9tOiBBdWdlciBFcmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50
OiBUaHVyc2RheSwgQXVndXN0IDEsIDIwMTkgMzo0NSBBTQ0KPiANCj4gSGkgTWljaGFlbCwNCj4g
DQo+IE9uIDcvMzEvMTkgOToyNSBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+IE9u
IFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDExOjIwOjQ0UE0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3Rl
Og0KPiA+Pj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIFttYWlsdG86bXN0QHJlZGhhdC5jb21d
DQo+ID4+PiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMzEsIDIwMTkgMzozOCBBTQ0KPiA+Pj4NCj4g
Pj4+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDA3OjIxOjMzUE0gKzAyMDAsIEVyaWMgQXVnZXIg
d3JvdGU6DQo+ID4+Pj4gV2UgaW50cm9kdWNlIGEgbmV3IG1zaV9ieXBhc3MgZmllbGQgd2hpY2gg
aW5kaWNhdGVzIHdoZXRoZXINCj4gPj4+PiB0aGUgSU9BUElDIE1TSSB3aW5kb3cgWzB4RkVFMDAw
MDAgLSAweEZFRUZGRkZGXSBtdXN0IGJlIGV4cG9zZWQNCj4gPj4NCj4gPj4gaXQncyBub3QgZ29v
ZCB0byBjYWxsIGl0IElPQVBJQyBNU0kgd2luZG93LiBhbnkgd3JpdGUgdG8gdGhpcyByYW5nZSwg
ZWl0aGVyDQo+ID4+IGZyb20gSU9BUElDIG9yIFBDSSBkZXZpY2UsIGlzIGludGVycHJldGVkIGJ5
IHRoZSBwbGF0Zm9ybSBhcyBpbnRlcnJ1cHQNCj4gPj4gcmVxdWVzdC4gSSdkIGNhbGwgaXQgIng4
NiBpbnRlcnJ1cHQgYWRkcmVzcyByYW5nZSIuDQo+ID4NCj4gPiBJc24ndCB0aGlzIEFQSUNfREVG
QVVMVF9BRERSRVNTPyBJJ20gbm90IHN1cmUgZ3Vlc3RzIGNhbid0IGNoYW5nZSBpdA0KPiA+IGV2
ZW4gdGhvdWdoIEknbSBub3Qgc3VyZSBxZW11IHN1cHBvcnRzIGNoYW5naW5nIGl0Lg0KPiANCj4g
VGhhdCdzIGluZGVlZCBtYXRjaGluZzoNCj4gDQo+ICNkZWZpbmUgQVBJQ19ERUZBVUxUX0FERFJF
U1MgMHhmZWUwMDAwMA0KPiAjZGVmaW5lIEFQSUNfU1BBQ0VfU0laRSAgICAgIDB4MTAwMDAwDQo+
IA0KDQpUaGV5IGFyZSBkaWZmZXJlbnQgdGhpbmcsIHRob3VnaCB2YWx1ZSBtYXRjaGVzLiBBUElD
IGRlZmF1bHQgYWRkcmVzcw0KaXMgdGhlIG1lbW9yeS1tYXBwZWQgcmVnaW9uIGZvciBzb2Z0d2Fy
ZSB0byBhY2Nlc3MgQVBJQyByZWdpc3Rlci4gSXQNCmNhbiBiZSByZWxvY2F0ZWQgYnkgdGhlIHNv
ZnR3YXJlLCB3aXRoIGRlZmF1bHQgYXMgMHhmZWUwMDAwMC4gT24gdGhlDQpvdGhlciBoYW5kLCB0
aGUgaW50ZXJydXB0IGFkZHJlc3MgcmFuZ2UgaXMgZm9yIHJvb3QgY29tcGxleCB0byBpbnRlcnBy
ZXQNCmludGVycnVwdCBtZXNzYWdlIGZyb20gZGV2aWNlcy4gWW91IGNhbiBsb29rIGF0IEludGVs
IFNETSAzQSwgMTAuMTENCk1lc3NhZ2UgU2lnbmFsbGVkIEludGVycnVwdHMsIHdoZXJlIHRoZSBt
ZXNzYWdlIGFkZHJlc3MgcmVnaXN0ZXINCmZvcm1hdCBpcyBkZWZpbmVkIHdpdGggMHhmZWUgYXMg
dGhlIGhhcmQgcHJlZml4Lg0KDQpUaGFua3MNCktldmluDQo=
