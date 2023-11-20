Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2117990ejb;
        Mon, 20 Nov 2023 03:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSdYDkg3+ttXwkx/hTc2rKX1saSn8aZSPRxcfpJfnv+1Ro87s0R8kkMSMclc0tJm8GBa8L
X-Received: by 2002:a05:620a:28c1:b0:77b:ec3f:347a with SMTP id l1-20020a05620a28c100b0077bec3f347amr8499338qkp.69.1700481247770;
        Mon, 20 Nov 2023 03:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700481247; cv=none;
        d=google.com; s=arc-20160816;
        b=yn6LdRgun4DxdufR7VohlorvjYpM/zLtfeqGA4Gg/W5fZx1Bgh2gv7dutMnmots9XB
         4y6JKRPj4k6StGaHNN68n5wIE/n8eIbOf09MfXXaXgFbMf1McPEPFUw9+LMwcKXtbzFx
         hC43NrnJvX6VZaOhTJnD/KMCUWPQmtzgSlL1JHqYZjfm/wWkuHNOa0hpriyva24/STib
         5DgBWnrFspCXhCFb4x0XfQe5A9W1MFVTN9Ut47k/TX85zB8Q/if11Y99XnOV12SybDKi
         teEaScNYiJsu6OpahUj6XJP1ufP1toRhoiLbafljkPBOgCQaLLNkzEGhVRg8MCqW9vjx
         W/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bsQxV/dL7WynoiMJdbi0CtMPYeYj0Vle/X+D7F0ITwM=;
        fh=cKp2fIE7LKjFCAfyuaxgnRzA5s6CfBEEWqbaW2U+xCw=;
        b=N/vH8VHqIKIU86F/6cr9JLfCHLmP0imY4GeYi2ugKqxTednOcWl9bOD3rKxQ7F4MFt
         rysWHeVnxtHLwk08CrCmYmNjMP0GE4Sthu9yZRlMIhsgUvjT4EMQGmKHQrlmI+yHhyFe
         X4zUy0ZcixJMDatGdrdevRRTMZh6wUWkBXYHzDu/pRmx1Wz4hSSU7DfVNjXK+z95aZX5
         QVuBwiuJ4BXFbDsUFT0sG+VJhpm4VoVGDz30L9LBFyBkE1/qhRi3L/RGfQHFOwIcXBjC
         K2Gzf2DtPv1eu1JIwsH7Y8Gihsb5APn1gKCEuBQeJkkIKvXErxTCIoEFXbM/nLhzEjZi
         zOZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=Y9eIKHxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05620a450c00b00768b6bc7aa0si6977472qkp.713.2023.11.20.03.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 03:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=Y9eIKHxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r52qq-0002gM-Ee; Mon, 20 Nov 2023 06:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=68108d3ea=graf@amazon.de>)
 id 1r52qp-0002fo-4i; Mon, 20 Nov 2023 06:54:03 -0500
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=68108d3ea=graf@amazon.de>)
 id 1r52qm-0000dp-K1; Mon, 20 Nov 2023 06:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1700481241; x=1732017241;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bsQxV/dL7WynoiMJdbi0CtMPYeYj0Vle/X+D7F0ITwM=;
 b=Y9eIKHxqx0L5CzMOLuoilcYJNMec9HJ8rw3efXnS80Hamw5fVLt5dPf8
 2ZwAO1NFcxmucGCx/EtqrTUwLy0yFBU1A0/Gls0viKzhLe/s+JOJpooL4
 KrEMd+VUlr78K1EZI+W+acNGc7Zzg+LzmdgVU1x4oFAa1dsFT0aiWbPg4 M=;
X-IronPort-AV: E=Sophos;i="6.04,213,1695686400"; d="scan'208";a="617063495"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-52005.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 11:53:57 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1e-m6i4x-3554bfcf.us-east-1.amazon.com (Postfix)
 with ESMTPS id 195E280C8A; Mon, 20 Nov 2023 11:53:52 +0000 (UTC)
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:58510]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.242:2525]
 with esmtp (Farcaster)
 id 349a29de-7c8a-4ad5-b82c-aaa9e880992d; Mon, 20 Nov 2023 11:53:52 +0000 (UTC)
X-Farcaster-Flow-ID: 349a29de-7c8a-4ad5-b82c-aaa9e880992d
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 20 Nov 2023 11:53:51 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 11:53:47 +0000
Message-ID: <9db15906-9474-4a6e-82a9-5275c72cf2b4@amazon.com>
Date: Mon, 20 Nov 2023 12:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] hw/uefi: add uefi variable service
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Markus
 Armbruster" <armbru@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 <mimoja@mimoja.de>
References: <20231115151242.184645-1-kraxel@redhat.com>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D040UWB001.ant.amazon.com (10.13.138.82) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.119.213.156;
 envelope-from=prvs=68108d3ea=graf@amazon.de; helo=smtp-fw-52005.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O5kqeLcVvqAN

SGV5IEdlcmQhCgpPbiAxNS4xMS4yMyAxNjoxMiwgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiBUaGlz
IHBhdGNoIGFkZHMgYSB2aXJ0dWFsIGRldmljZSB0byBxZW11IHdoaWNoIHRoZSB1ZWZpIGZpcm13
YXJlIGNhbiB1c2UKPiB0byBzdG9yZSB2YXJpYWJsZXMuICBUaGlzIG1vdmVzIHRoZSBVRUZJIHZh
cmlhYmxlIG1hbmFnZW1lbnQgZnJvbQo+IHByaXZpbGVnZWQgZ3Vlc3QgY29kZSAobWFuYWdpbmcg
dmFycyBpbiBwZmxhc2gpIHRvIHRoZSBob3N0LiAgTWFpbgo+IGFkdmFudGFnZSBpcyB0aGF0IHRo
ZSBuZWVkIHRvIGhhdmUgcHJpdmlsZWdlIHNlcGFyYXRpb24gaW4gdGhlIGd1ZXN0Cj4gZ29lcyBh
d2F5Lgo+Cj4gT24geDg2IHByaXZpbGVnZWQgZ3Vlc3QgY29kZSBydW5zIGluIFNNTS4gIEl0J3Mg
c3VwcG9ydGVkIGJ5IGt2bSwgYnV0Cj4gbm90IGxpa2VkIG11Y2ggYnkgdmFyaW91cyBzdGFrZWhv
bGRlcnMgaW4gY2xvdWQgc3BhY2UgZHVlIHRvIHRoZQo+IGNvbXBsZXhpdHkgU01NIGVtdWxhdGlv
biBicmluZ3MuCj4KPiBPbiBhcm0gcHJpdmlsZWdlZCBndWVzdCBjb2RlIHJ1bnMgaW4gZWwzIChh
a2Egc2VjdXJlIHdvcmxkKS4gIFRoaXMgaXMKPiBub3Qgc3VwcG9ydGVkIGJ5IGt2bSwgd2hpY2gg
aXMgdW5saWtlbHkgdG8gY2hhbmdlIGFueXRpbWUgc29vbiBnaXZlbgo+IHRoYXQgZXZlbiBlbDIg
c3VwcG9ydCAobmVzdGVkIHZpcnQpIGlzIGJlaW5nIHdvcmtlZCBvbiBmb3IgeWVhcnMgYW5kIGlz
Cj4gbm90IHlldCBpbiBtYWlubGluZS4KPgo+IFRoZSBkZXNpZ24gaWRlYSBpcyB0byByZXVzZSB0
aGUgcmVxdWVzdCBzZXJpYWxpemF0aW9uIHByb3RvY29sIGVkazIgdXNlcwo+IGZvciBjb21tdW5p
Y2F0aW9uIGJldHdlZW4gU01NIGFuZCBub24tU01NIGNvZGUsIHNvIGxhcmdlIGNodW5rcyBvZiB0
aGUKPiBlZGsyIHZhcmlhYmxlIGRyaXZlciBzdGFjayBjYW4gYmUgdXNlZCB1bm1vZGlmaWVkLiAg
T25seSB0aGUgZHJpdmVyCj4gd2hpY2ggdHJhcHMgaW50byBTTU0gbW9kZSBtdXN0IGJlIHJlcGxh
Y2VkIGJ5IGEgZHJpdmVyIHdoaWNoIHRhbGtzIHRvCj4gcWVtdSBpbnN0ZWFkLgoKCkknbSBub3Qg
c3VyZSBJIGxpa2UgdGhlIHNwbGl0IDopLiBJZiB3ZSBjdXQgdGhpbmdzIG9mZiBhdCB0aGUgU01N
IApjb21tdW5pY2F0aW9uIGxheWVyLCB3ZSBzdGlsbCBoYXZlIGEgbG90IG9mIGNvZGUgaW5zaWRl
IHRoZSBSdW50aW1lIApTZXJ2aWNlcyAoUlRTKSBjb2RlIHRoYXQgaXMgZWRrMiBzcGVjaWZpYyB3
aGljaCBtZWFucyB3ZSdyZSB0eWluZyAKb3Vyc2VsdmVzIHRpZ2h0bHkgdG8gdGhlIGVkazIgZGF0
YSBmb3JtYXQuIEl0IGFsc28gbWVhbnMgd2UgY2FuIG5vdCAKZWFzaWx5IGV4cG9zZSBVRUZJIHZh
cmlhYmxlcyB0aGF0IFFFTVUgb3ducywgd2hpY2ggY2FuIGNvbWUgaW4gdmVyeSAKaGFuZHkgd2hl
biBpbXBsZW1lbnRpbmcgTU9SIC0gYW5vdGhlciBmZWF0dXJlIHRoYXQgZGVwZW5kcyBvbiBTTU0g
dG9kYXkuCgpJbiBFQzIsIHdlIGFyZSBzaW1wbHkgc2VyaWFsaXppbmcgYWxsIHZhcmlhYmxlIFJU
UyBjYWxscyB0byB0aGUgCmh5cGVydmlzb3IsIHNpbWlsYXIgdG8gdGhlIFhlbiBpbXBsZW1lbnRh
dGlvbiAKKGh0dHBzOi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9amlSOGtoYUVDRWspLgoKVGhl
IGVkazIgc2lkZSBjb2RlIHdlIGhhdmUgYnVpbHQgaXMgaGVyZTogCmh0dHBzOi8vZ2l0aHViLmNv
bS9hd3MvdWVmaS90cmVlL21haW4vZWRrMi1zdGFibGUyMDIyMTEgKHNlZSBhbnl0aGluZyAKd2l0
aCBWYXJTdG9yZSBpbiB0aGUgbmFtZSkuCgpGb3IgdGhlIHZtbSBzaWRlLCB3ZSBjdXJyZW50bHkg
aGF2ZSBhbiBBV1MtaW50ZXJuYWwgQysrIGltcGxlbWVudGF0aW9uIAp0aGF0IEkgY2FuIGNvbnZl
cnQgaW50byBRRU1VIGNvZGUgYW5kIHNlbmQgYXMgcGF0Y2ggaWYgdGhlcmUgaXMgcmVhbCAKaW50
ZXJlc3QuIEdpdmVuIHRoYXQgd2UgZGVhbCB3aXRoIHVudHJ1c3RlZCBpbnB1dCwgSSB3b3VsZCBz
dHJvbmdseSAKcHJlZmVyIGlmIHdlIGNvdWxkIG1vdmUgaXQgdG8gYSBSdXN0IGltcGxlbWVudGF0
aW9uIGluc3RlYWQgdGhvdWdoLiBXZSAKc3RhcnRlZCBhIFJ1c3QgcmVpbXBsZW1lbnRhdGlvbiBv
ZiBpdCB0aGF0IGludGVyZmFjZSB0aGF0IGNhbiBidWlsZCBhcyBhIApsaWJyYXJ5IHdpdGggQyBi
aW5kaW5ncyB3aGljaCBRRU1VIGNvdWxkIHRoZW4gbGluayBhZ2FpbnN0OgoKIMKgIGh0dHBzOi8v
Z2l0aHViLmNvbS9NaW1vamEvcnMtdWVmaS12YXJzdG9yZS90cmVlL2Zvcl9tYWluCgpUaGUgY29k
ZSBuZXZlciB3ZW50IGJleW9uZCB0aGUgaW5pdGlhbCBzdGFnZXMsIGJ1dCBpZiB3ZSdyZSBwdWxs
aW5nIHRoZSAKdmFyaWFibGUgc3RvcmUgdG8gUUVNVSwgdGhpcyB3b3VsZCBiZSB0aGUgYmVzdCBw
YXRoIGZvcndhcmQgSU1ITy4KCgpJZiBpbnN0ZWFkLCB3ZSBqdXN0IHdhbnQgc29tZXRoaW5nIHdl
IGNhbiBxdWlja2x5IGludGVncmF0ZSB3aGlsZSBlYXRpbmcgCnVwIHRoZSBhZGRpdGlvbmFsIHNl
Y3VyaXR5IHJpc2ssIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgcmV1c2UgdGhlIFhlbiAKaW1wbGVt
ZW50YXRpb24uCgoKQWxleAoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBH
bWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlz
dGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBE
RSAyODkgMjM3IDg3OQoKCg==

