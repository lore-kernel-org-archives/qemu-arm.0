Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5971687wrr;
        Thu, 14 Nov 2019 12:45:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzk/xRt+xbXOiblCVVa/w+uz0aUUC8vks3i/DKFVGOqq5mM8xW8R0osz4kIGPVJVKo6Zjrf
X-Received: by 2002:aed:3702:: with SMTP id i2mr9826192qtb.312.1573764346653;
        Thu, 14 Nov 2019 12:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573764346; cv=none;
        d=google.com; s=arc-20160816;
        b=R7HJMl05NHJSXvKlk0yGGQpFgDZ9gke+Wb8G8TOGWEEmDkitdRL18M+ISLjG7Bz8H5
         w3MqHfDvfTdDn3BT0npAIeK9ioNRpnKVKs/haYM5TMUl89mxvmUxoLGc6btklXN/hNCh
         CAuSbRa5HeoF0maeFP2RqMExCwLliroidM2hPrJkJPawKGQEoKurud2ZLmoUZSCN/pag
         UeTpK2IRb9sCHFLL+zFlBVuX2OeNM3UNi4waSoDkW4n4agw/VGApIx9h+YVYF9QtVe2A
         zMA2zGaTokR6Is7tDDca/XHRrzVqTVvyxq28fuZOAKT0UtTycxUoI00z1Y/Cg7QbE3zH
         xquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:ironport-sdr
         :dkim-signature;
        bh=Oocyq3EVGf18WvrHHwZNQVGT4Jn5mUjQevYkZZ1rXGg=;
        b=BakAESrDnDMFZAc2qGG5ojKdR1diGkPwObENeu4RGsfxRY1LwwN5gINvc6yMrzj8J6
         xXpMV/gJ779T0W2faXyQFqEJyqBlomAVa57tu4jAcmGegK9miFJ8N5uXrUEO65TyQCFS
         AsjjRA/IdFDTpbuT7IycgMt9LKltPM6XqfkMzicRfAjY0caJgN+bj3xsLLR2UJeib91V
         e7JUgicwSJ+U/f/inaF6xuDitDTdkZ0tuq+kXOsl6+zssWFpzkdWby9qgabXohsOfKzU
         fVTq2xSWP46lLaRb+H7dO3Lso5iceGWcZ9JyYh1tefztw8FwrZ81N1S7EX/3tz3knFrn
         55lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=EOeT6OTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si3861791qvp.192.2019.11.14.12.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 12:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=EOeT6OTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVLzt-0000jE-Ro
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 15:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2144d190e=graf@amazon.de>) id 1iVLzi-0000io-Jn
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 15:45:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2144d190e=graf@amazon.de>) id 1iVLzh-0003Fw-CH
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 15:45:34 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:16403)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=2144d190e=graf@amazon.de>)
 id 1iVLzh-0003Eb-62; Thu, 14 Nov 2019 15:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1573764334; x=1605300334;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Oocyq3EVGf18WvrHHwZNQVGT4Jn5mUjQevYkZZ1rXGg=;
 b=EOeT6OTluYRkEPMjmTxLT8ABY5rn46T5bo5I+LuoUg08DsDiPGQXwLmm
 ut2s+mQgwDzvRWbqRVTFgCAcmJR8WzZmmhd8f2yw5MJcQpaGTbpuoK4yL
 wMf2e7jLFc5yTmCNDPazNBqyLjUBOCkSkN4nhXDGD1LYnAveBmPMBtj1c 4=;
IronPort-SDR: 2q4yW35rxwg4IEXUNaunQ5xlK93xz8A3Hr8mBd2FqNvMgLrONn4gaQRW6sDbYQTs2ofCqnXB21
 QCUW8YdGY9bw==
X-IronPort-AV: E=Sophos;i="5.68,305,1569283200"; 
   d="scan'208";a="3034116"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 14 Nov 2019 20:45:30 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3C3EDA22BE; Thu, 14 Nov 2019 20:45:29 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 20:45:16 +0000
Received: from 38f9d3867b82.ant.amazon.com (10.43.161.243) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 20:45:14 +0000
Subject: Re: [PATCH] pl031: Expose RTCICR as proper WC register
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Hendrik Borghorst <hborghor@amazon.de>
References: <20191104115228.30745-1-graf@amazon.com>
 <CAFEAcA8zkR_MZ-28Nc=x4j05U9MsFYfzQtkHxTf65ZwacK020w@mail.gmail.com>
 <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
 <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
 <CAFEAcA8HwRNd+Mg91RJ1DpiyoNJKBWHjFT_Te16xTV5P7wV_ug@mail.gmail.com>
From: Alexander Graf <graf@amazon.com>
Message-ID: <a3b96c16-4d92-87ea-32a4-f36a62cc857e@amazon.com>
Date: Thu, 14 Nov 2019 22:45:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8HwRNd+Mg91RJ1DpiyoNJKBWHjFT_Te16xTV5P7wV_ug@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.43.161.243]
X-ClientProxiedBy: EX13D01UWA004.ant.amazon.com (10.43.160.99) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.49.90
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
X-TUID: FnGA3cbUpDyb

CgpPbiAxNC4xMS4xOSAxNTo0MiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiBPbiBUdWUsIDEyIE5v
diAyMDE5IGF0IDExOjU3LCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+
IHdyb3RlOgo+PiBPbiBUdWUsIDEyIE5vdiAyMDE5IGF0IDA3OjI4LCBBbGV4YW5kZXIgR3JhZiA8
Z3JhZkBhbWF6b24uY29tPiB3cm90ZToKPj4+IEkgc3RpbGwgdGhpbmsgdGhhdCBiZWluZyBjb25z
aXN0ZW50IHdpdGggdGhlIGFjdHVhbCBQTDAzMSBzcGVjIGlzCj4+PiBwcmVmZXJhYmxlIHRob3Vn
aC4gSWYgYW55IHJlYWwgd29ybGQgZ3Vlc3QgYnJlYWtzIGJlY2F1c2Ugb2YgdGhpcywgd2UKPj4+
IGNhbiBzdGlsbCByZXZlcnQgdGhpcyBwYXRjaCBhbmQgZG9jdW1lbnQgdGhlIGV4YWN0IGJyZWFr
YWdlIGluIHRoZQo+Pj4gY29tbWVudCBpbnN0ZWFkLgo+Pgo+PiBZZWFoLCBJIGFncmVlOyBJJ20g
ZXNzZW50aWFsbHkganVzdCBnYXRoZXJpbmcgbWF0ZXJpYWwKPj4gZm9yIHRoZSBjb21taXQgbWVz
c2FnZSBoZXJlLiAoVGhlIGdvbGQgc3RhbmRhcmQgd291bGQgYmUKPj4gdG8gZ28gZmluZCBzb21l
IGhhcmR3YXJlIHdpdGggYSByZWFsIHBsMDMxIGFuZCBwcm9kIGl0Cj4+IHRvIGNvbmZpcm0gYmVo
YXZpb3VyLCBidXQgdGhhdCdzIG1vcmUgZWZmb3J0IHRoYW4gcmVhbGx5Cj4+IHNlZW1zIGp1c3Rp
ZmllZCB0byBtZS4pCj4gCj4gSSBwcm9wb3NlIHRvIHB1dCB0aGlzIGluIGZvciA0LjIgd2l0aCBh
biB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlOgo+IAo+ID09PWJlZ2luPT09Cj4gICAgICBwbDAzMTog
RXhwb3NlIFJUQ0lDUiBhcyBwcm9wZXIgV0MgcmVnaXN0ZXIKPiAKPiAgICAgIFRoZSBjdXJyZW50
IFBMMDMxIFJUQ0lDUiByZWdpc3RlciBpbXBsZW1lbnRhdGlvbiBhbHdheXMgY2xlYXJzIHRoZQo+
ICAgICAgSVJRIHBlbmRpbmcgc3RhdHVzIG9uIGEgcmVnaXN0ZXIgd3JpdGUsIHJlZ2FyZGxlc3Mg
b2YgdGhlIHZhbHVlIHRoZQo+ICAgICAgZ3Vlc3Qgd3JpdGVzLgo+IAo+ICAgICAgVG8ganVzdGlm
eSB0aGF0IGJlaGF2aW9yLCBpdCByZWZlcmVuY2VzIHRoZSBBUk05MjZFSi1TIERldmVsb3BtZW50
Cj4gICAgICBDaGlwIFJlZmVyZW5jZSBNYW51YWwgKERESTAyODdCKSBhbmQgaW5kaWNhdGVzIHRo
YXQgc2FpZCBkb2N1bWVudAo+ICAgICAgc3RhdGVzIHRoYXQgYW55IHdyaXRlIGNsZWFycyB0aGUg
aW50ZXJuYWwgSVJRIHN0YXRlLiAgSXQgaXMgaW5kZWVkCj4gICAgICB0cnVlIHRoYXQgaW4gc2Vj
dGlvbiAxMS4xIHRoaXMgZG9jdW1lbnQgc2F5czoKPiAKPiAgICAgICAgIlRoZSBpbnRlcnJ1cHQg
aXMgY2xlYXJlZCBieSB3cml0aW5nIGFueSBkYXRhIHZhbHVlIHRvIHRoZQo+ICAgICAgICAgaW50
ZXJydXB0IGNsZWFyIHJlZ2lzdGVyIFJUQ0lDUiIuCj4gCj4gICAgICBIb3dldmVyLCBsYXRlciBp
biBzZWN0aW9uIDExLjIuMiBpdCBjb250cmFkaWN0cyBpdHNlbGYgYnkgc2F5aW5nOgo+IAo+ICAg
ICAgICAiV3JpdGluZyAxIHRvIGJpdCAwIG9mIFJUQ0lDUiBjbGVhcnMgdGhlIFJUQ0lOVFIgZmxh
Zy4iCj4gCj4gICAgICBUaGUgbGF0dGVyIHN0YXRlbWVudCBtYXRjaGVzIHRoZSBQTDAzMSBUUk0g
KERESTAyMjRDKSwgd2hpY2ggc2F5czoKPiAKPiAgICAgICAgIldyaXRpbmcgMSB0byBiaXQgcG9z
aXRpb24gMCBjbGVhcnMgdGhlIGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0Lgo+ICAgICAgICAgV3Jp
dGluZyAwIGhhcyBubyBlZmZlY3QuIgo+IAo+ICAgICAgTGV0J3MgYXNzdW1lIHRoYXQgdGhlIHNl
bGYtY29udHJhZGljdG9yeSBEREkwMjg3QiBpcyBpbiBlcnJvciwgYW5kCj4gICAgICBmb2xsb3cg
dGhlIHJlZmVyZW5jZSBtYW51YWwgZm9yIHRoZSBkZXZpY2UgaXRzZWxmLCBieSBtYWtpbmcgdGhl
Cj4gICAgICByZWdpc3RlciB3cml0ZS1vbmUtdG8tY2xlYXIuCj4gPT09ZW5kaXQ9PT0KPiAKPiBJ
cyB0aGF0IE9LPwoKSXQncyBtdWNoIGJldHRlci4gV2lsbCB5b3UganVzdCBmaXggaXQgdXAgaW5s
aW5lIGZvciBtZSBwbGVhc2U/IDopCgoKVGhhbmtzLAoKQWxleAoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==

