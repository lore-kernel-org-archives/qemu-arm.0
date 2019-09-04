Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp236638wrp;
        Tue, 3 Sep 2019 21:24:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcnVIIDK0DMeXYa4QW1XV98DwurwcWcuQLfQary+A2h7A17TUzMN4mWmFIfV2FHriKt/fo
X-Received: by 2002:a17:906:405b:: with SMTP id y27mr11959185ejj.18.1567571066653;
        Tue, 03 Sep 2019 21:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567571066; cv=none;
        d=google.com; s=arc-20160816;
        b=MpoVNH73y4l4dmogVfZhADuJA6VflWWnnE2l+/7i2Fxez9sVa34TyQgh4erVtAySsD
         03TWnQAPuUyTNppt67w5IVJek3Frusw4rDHXL5WdRulDUq7eHugKP2HY6Q++Sr+woOPg
         FsaOkCSE1sOPY9XiRQEj/1FoKR2DixSqHAsD/AasOCSsU324ONA77VyqdoCPvpa/llJH
         az+IBmBF5pZudLGu/W7wyu6Gq6UvMFx4j4rv2nwafEg7deNlmd3lVfC3eXlBjOomaYzV
         QAo2322O3m6PGPFDVcceos/Zcx6DIDZUSKEpou2cQktRShKL1ot93J4/LqBWJ1iwCJvM
         HBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from;
        bh=0uDFqYCYecvtWsCPvLEKLhQVzj2ks63y4IkfqZV4Al0=;
        b=PboU1eV8vTJbdc0sh5opNlyYGMugWMWzb2XtZXKSTYdPtiYn9dtKIpBkj+I9595nRM
         zBAnw1fwZgfivJfV84fmTXcl/51WVTPCYvlGe5hVPIPk+tftp93V7j6CTP/zn7rztKIk
         1MhLDfmM95ba5HSjZIoeiMvF7fbvnD+JmUmB2oUATPn8XOVyxmFhJTmghSn1HeD3zsiV
         i8EjkPPySoqnU5R5m4gPCRVtNh5KrTAu2GBCQ9w3OpR7i7Qln2H5px24/vw+OZm4ryfU
         P/vhSijSQZbJ3LsW5lu5dvgIV86lR3+3s9i4v1h3Ud2PuOlvyjG+KY4xagTYpcA5AK8u
         c99A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si8787421eda.368.2019.09.03.21.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 21:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5MqH-000585-MT
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 00:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kevin.tian@intel.com>) id 1i5Mpr-00057w-PT
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 00:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kevin.tian@intel.com>) id 1i5Mpp-000758-Ue
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 00:23:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:56596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kevin.tian@intel.com>)
 id 1i5Mpp-00073i-Hi; Wed, 04 Sep 2019 00:23:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 21:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,465,1559545200"; d="scan'208";a="194584313"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 03 Sep 2019 21:23:53 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 21:23:53 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.86]) with mapi id 14.03.0439.000;
 Wed, 4 Sep 2019 12:23:51 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>
Thread-Topic: [PATCH for-4.2 v10 08/15] virtio-iommu: Implement map/unmap
Thread-Index: AQHVRvt45mqYxba1WEGcL7R8WepU8acBt2WAgBfMYYCAAOysAIAAsfiA
Date: Wed, 4 Sep 2019 04:23:50 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D561F28@SHSMSX104.ccr.corp.intel.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
 <20190819081143.GA13560@xz-x1>
 <b5e2ff32-eed8-829e-ffd4-2b62ed6b2fda@redhat.com>
 <20190904014416.GB30402@xz-x1>
In-Reply-To: <20190904014416.GB30402@xz-x1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDhjZDkxNTAtNTkwYS00Y2VhLTg3YzMtOTVkYzUzMjkzYWRhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9lTUUxcU5lQ0toNkU4N2dBNEp6c0Fwdjc5VjFrc2xSanhFSFJXazdWYnhsMHdlbkNlTURnV0pCWVUrNDNJRFgifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH for-4.2 v10 08/15] virtio-iommu: Implement
 map/unmap
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8wtw4pluGgWQ

PiBGcm9tOiBQZXRlciBYdSBbbWFpbHRvOnBldGVyeEByZWRoYXQuY29tXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciA0LCAyMDE5IDk6NDQgQU0NCj4gDQo+IE9uIFR1ZSwgU2VwIDAzLCAy
MDE5IGF0IDAxOjM3OjExUE0gKzAyMDAsIEF1Z2VyIEVyaWMgd3JvdGU6DQo+ID4gSGkgUGV0ZXIs
DQo+ID4NCj4gPiBPbiA4LzE5LzE5IDEwOjExIEFNLCBQZXRlciBYdSB3cm90ZToNCj4gPiA+IE9u
IFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDA3OjIxOjMwUE0gKzAyMDAsIEVyaWMgQXVnZXIgd3JvdGU6
DQo+ID4gPg0KPiA+ID4gWy4uLl0NCj4gPiA+DQo+ID4gPj4gKyAgICBtYXBwaW5nID0gZ190cmVl
X2xvb2t1cChkb21haW4tPm1hcHBpbmdzLCAoZ3BvaW50ZXIpKCZpbnRlcnZhbCkpOw0KPiA+ID4+
ICsNCj4gPiA+PiArICAgIHdoaWxlIChtYXBwaW5nKSB7DQo+ID4gPj4gKyAgICAgICAgdmlvbW11
X2ludGVydmFsIGN1cnJlbnQ7DQo+ID4gPj4gKyAgICAgICAgdWludDY0X3QgbG93ICA9IG1hcHBp
bmctPnZpcnRfYWRkcjsNCj4gPiA+PiArICAgICAgICB1aW50NjRfdCBoaWdoID0gbWFwcGluZy0+
dmlydF9hZGRyICsgbWFwcGluZy0+c2l6ZSAtIDE7DQo+ID4gPj4gKw0KPiA+ID4+ICsgICAgICAg
IGN1cnJlbnQubG93ID0gbG93Ow0KPiA+ID4+ICsgICAgICAgIGN1cnJlbnQuaGlnaCA9IGhpZ2g7
DQo+ID4gPj4gKw0KPiA+ID4+ICsgICAgICAgIGlmIChsb3cgPT0gaW50ZXJ2YWwubG93ICYmIHNp
emUgPj0gbWFwcGluZy0+c2l6ZSkgew0KPiA+ID4+ICsgICAgICAgICAgICBnX3RyZWVfcmVtb3Zl
KGRvbWFpbi0+bWFwcGluZ3MsIChncG9pbnRlcikoJmN1cnJlbnQpKTsNCj4gPiA+PiArICAgICAg
ICAgICAgaW50ZXJ2YWwubG93ID0gaGlnaCArIDE7DQo+ID4gPj4gKyAgICAgICAgICAgIHRyYWNl
X3ZpcnRpb19pb21tdV91bm1hcF9sZWZ0X2ludGVydmFsKGN1cnJlbnQubG93LA0KPiBjdXJyZW50
LmhpZ2gsDQo+ID4gPj4gKyAgICAgICAgICAgICAgICBpbnRlcnZhbC5sb3csIGludGVydmFsLmhp
Z2gpOw0KPiA+ID4+ICsgICAgICAgIH0gZWxzZSBpZiAoaGlnaCA9PSBpbnRlcnZhbC5oaWdoICYm
IHNpemUgPj0gbWFwcGluZy0+c2l6ZSkgew0KPiA+ID4+ICsgICAgICAgICAgICB0cmFjZV92aXJ0
aW9faW9tbXVfdW5tYXBfcmlnaHRfaW50ZXJ2YWwoY3VycmVudC5sb3csDQo+IGN1cnJlbnQuaGln
aCwNCj4gPiA+PiArICAgICAgICAgICAgICAgIGludGVydmFsLmxvdywgaW50ZXJ2YWwuaGlnaCk7
DQo+ID4gPj4gKyAgICAgICAgICAgIGdfdHJlZV9yZW1vdmUoZG9tYWluLT5tYXBwaW5ncywgKGdw
b2ludGVyKSgmY3VycmVudCkpOw0KPiA+ID4+ICsgICAgICAgICAgICBpbnRlcnZhbC5oaWdoID0g
bG93IC0gMTsNCj4gPiA+PiArICAgICAgICB9IGVsc2UgaWYgKGxvdyA+IGludGVydmFsLmxvdyAm
JiBoaWdoIDwgaW50ZXJ2YWwuaGlnaCkgew0KPiA+ID4+ICsgICAgICAgICAgICB0cmFjZV92aXJ0
aW9faW9tbXVfdW5tYXBfaW5jX2ludGVydmFsKGN1cnJlbnQubG93LA0KPiBjdXJyZW50LmhpZ2gp
Ow0KPiA+ID4+ICsgICAgICAgICAgICBnX3RyZWVfcmVtb3ZlKGRvbWFpbi0+bWFwcGluZ3MsIChn
cG9pbnRlcikoJmN1cnJlbnQpKTsNCj4gPiA+PiArICAgICAgICB9IGVsc2Ugew0KPiA+ID4+ICsg
ICAgICAgICAgICBicmVhazsNCj4gPiA+PiArICAgICAgICB9DQo+ID4gPj4gKyAgICAgICAgaWYg
KGludGVydmFsLmxvdyA+PSBpbnRlcnZhbC5oaWdoKSB7DQo+ID4gPj4gKyAgICAgICAgICAgIHJl
dHVybiBWSVJUSU9fSU9NTVVfU19PSzsNCj4gPiA+PiArICAgICAgICB9IGVsc2Ugew0KPiA+ID4+
ICsgICAgICAgICAgICBtYXBwaW5nID0gZ190cmVlX2xvb2t1cChkb21haW4tPm1hcHBpbmdzLA0K
PiAoZ3BvaW50ZXIpKCZpbnRlcnZhbCkpOw0KPiA+ID4+ICsgICAgICAgIH0NCj4gPiA+PiArICAg
IH0NCj4gPiA+PiArDQo+ID4gPj4gKyAgICBpZiAobWFwcGluZykgew0KPiA+ID4+ICsgICAgICAg
IHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9SLA0KPiA+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIioqKioqKiAlczogVW5tYXAgMHglIlBSSXg2NCIgc2l6ZT0weCUiUFJJeDY0DQo+ID4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICIgZnJvbSAweCUiUFJJeDY0IiBzaXplPTB4JSJQUkl4
NjQiIGlzIG5vdCBzdXBwb3J0ZWRcbiIsDQo+ID4gPj4gKyAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBpbnRlcnZhbC5sb3csIHNpemUsDQo+ID4gPj4gKyAgICAgICAgICAgICAgICAgICAg
IG1hcHBpbmctPnZpcnRfYWRkciwgbWFwcGluZy0+c2l6ZSk7DQo+ID4gPj4gKyAgICB9IGVsc2Ug
ew0KPiA+ID4+ICsgICAgICAgIHJldHVybiBWSVJUSU9fSU9NTVVfU19PSzsNCj4gPiA+PiArICAg
IH0NCj4gPiA+PiArDQo+ID4gPj4gKyAgICByZXR1cm4gVklSVElPX0lPTU1VX1NfSU5WQUw7DQo+
ID4gPg0KPiA+ID4gQ291bGQgdGhlIGFib3ZlIGNodW5rIGJlIHNpbXBsaWZpZWQgYXMgc29tZXRo
aW5nIGxpa2UgYmVsb3c/DQo+ID4gPg0KPiA+ID4gICB3aGlsZSAoKG1hcHBpbmcgPSBnX3RyZWVf
bG9va3VwKGRvbWFpbi0+bWFwcGluZ3MsICZpbnRlcnZhbCkpKSB7DQo+ID4gPiAgICAgZ190cmVl
X3JlbW92ZShkb21haW4tPm1hcHBpbmdzLCBtYXBwaW5nKTsNCj4gPiA+ICAgfQ0KPiA+IEluZGVl
ZCB0aGUgY29kZSBjb3VsZCBiZSBzaW1wbGlmaWVkLiBJIG9ubHkgbmVlZCB0byBtYWtlIHN1cmUg
SSBkb24ndA0KPiA+IHNwbGl0IGFuIGV4aXN0aW5nIG1hcHBpbmcuDQo+IA0KPiBIbW0uLi4gRG8g
d2UgbmVlZCB0byBzdGlsbCBzcGxpdCBhbiBleGlzdGluZyBtYXBwaW5nIGlmIG5lY2Vzc2FyeT8N
Cj4gRm9yIGV4YW1wbGUgd2hlbiB3aXRoIHRoaXMgbWFwcGluZzoNCj4gDQo+ICAgaW92YT0weDEw
MDAsIHNpemU9MHgyMDAwLCBwaHlzPUFERFIxLCBmbGFncz1GTEFHUzENCj4gDQo+IEFuZCBpZiB3
ZSB3YW50IHRvIHVubWFwIHRoZSByYW5nZSAoaW92YT0wLCBzaXplPTB4MjAwMCksIHRoZW4gd2UN
Cj4gc2hvdWxkIHNwbGl0IHRoZSBleGlzdGluZyBtYXBwcGluZyBhbmQgbGVhdmUgdGhpcyBvbmU6
DQo+IA0KPiAgIGlvdmE9MHgyMDAwLCBzaXplPTB4MTAwMCwgcGh5cz0oQUREUjErMHgxMDAwKSwg
ZmxhZ3M9RkxBR1MxDQo+IA0KPiBSaWdodD8NCj4gDQoNCnZpcnRpby1pb21tdSBzcGVjIGV4cGxp
Y2l0bHkgZGlzYWxsb3dzIHBhcnRpYWwgdW5tYXAuDQoNCjUuMTEuNi42LjEgRHJpdmVyIFJlcXVp
cmVtZW50czogVU5NQVAgcmVxdWVzdA0KDQpUaGUgZmlyc3QgYWRkcmVzcyBvZiBhIHJhbmdlIE1V
U1QgZWl0aGVyIGJlIHRoZSBmaXJzdCBhZGRyZXNzIG9mIGEgDQptYXBwaW5nIG9yIGJlIG91dHNp
ZGUgYW55IG1hcHBpbmcuIFRoZSBsYXN0IGFkZHJlc3Mgb2YgYSByYW5nZSANCk1VU1QgZWl0aGVy
IGJlIHRoZSBsYXN0IGFkZHJlc3Mgb2YgYSBtYXBwaW5nIG9yIGJlIG91dHNpZGUgYW55IA0KbWFw
cGluZy4NCg0KNS4xMS42LjYuMiBEZXZpY2UgUmVxdWlyZW1lbnRzOiBVTk1BUCByZXF1ZXN0DQoN
CklmIGEgbWFwcGluZyBhZmZlY3RlZCBieSB0aGUgcmFuZ2UgaXMgbm90IGNvdmVyZWQgaW4gaXRz
IGVudGlyZXR5IA0KYnkgdGhlIHJhbmdlICh0aGUgVU5NQVAgcmVxdWVzdCB3b3VsZCBzcGxpdCB0
aGUgbWFwcGluZyksIA0KdGhlbiB0aGUgZGV2aWNlIFNIT1VMRCBzZXQgdGhlIHJlcXVlc3Qgc3Rh
dHVzIHRvIFZJUlRJT19JT01NVQ0KX1NfUkFOR0UsIGFuZCBTSE9VTEQgTk9UIHJlbW92ZSBhbnkg
bWFwcGluZy4NCg0KVGhhbmtzDQpLZXZpbg0K
