Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp715602ejx;
        Tue, 22 Aug 2023 06:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGomu/QIHquDnNGxdhFPz2v6woxieZXn1YM2UPpuFNfIb81TwOL10ff3MGX6mLLoLxBA4KM
X-Received: by 2002:ac8:5909:0:b0:403:c687:bfbb with SMTP id 9-20020ac85909000000b00403c687bfbbmr11940629qty.1.1692710322116;
        Tue, 22 Aug 2023 06:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692710322; cv=none;
        d=google.com; s=arc-20160816;
        b=qIUZNEPrOk/edIY2RKuYiX0Es/lTNvfwvQpzVY/AYsojRKREWMrdLrkoBxSD93/5Ph
         rGU4jaap/t0LmhZxuqo0iF9jKoI9BK5Djf8HOQ3nNAGan7ycD1Qa/zHl3FAcudlA/MYc
         DiMFILWqY3+ritGYDTwi2S6jMsej7EfoBVM6fSEnEzKpE6i/+gsURbEcVksGlD5mBXNH
         1K/if/LjfXw1BKghke6hDBTbUhNh0E9YiSARG1LMy7TvMsq17msne2wMsgSA7hrzqem2
         l5ghwgG4L/fSd0/hko0KneF+ZhKpaDC/OR+OqJ8FHRZ/MZdFob4NT7T1LNJWfto2fXL6
         RhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TqzJs172I2Gyki88DhpCefCteRnWwRqBaqDVR3nBygY=;
        fh=ls+9AeY53dnri35AoZk0g6Pe0ww+lVNfgHd/V2KVgkY=;
        b=nvar2YTfcTzMWV4RaJ2FdWxZVKgFlzZwFnNH5UtwhYIRtffpg0AegSiu70D9QtKXZw
         6T5jpfje6PTZ8oPD1B0axisge1c/1Uyhg10GDlH3m3mTvxXiChgnga5jjeBp3c8vhgOU
         ERGzhiIQCvPIiqtRGQhEq11NTaZo0pT7sOoUgTZMikYi/GEjBANeLX9SDfxkylVm37J7
         MoY/D+AhBoLlp93TKzYcqKC+425zvn3ocEnFpRjGpnefP1jbp7GYjZrucZh7YbeDqjjA
         xT2hsDzEPepUG/uMV2pPSSu9/QfmKcT7ReM0qLlxqT98Ph484ahxHdUS0R6iRuh/fqU2
         lIfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=uGA8yH01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05622a020500b003f972544a27si6382039qtx.533.2023.08.22.06.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 06:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=uGA8yH01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYRH9-0001kL-Ty; Tue, 22 Aug 2023 09:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5918e560e=graf@amazon.de>)
 id 1qYRH8-0001jl-Mp; Tue, 22 Aug 2023 09:18:26 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5918e560e=graf@amazon.de>)
 id 1qYRH2-0000x9-Qh; Tue, 22 Aug 2023 09:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1692710301; x=1724246301;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TqzJs172I2Gyki88DhpCefCteRnWwRqBaqDVR3nBygY=;
 b=uGA8yH01h2kNdFthvawCRSwZnaH7ZZvbv1Q5KAuEmGp5NzVu+t3EXSkw
 pclrQITmgWcpSl6Z/d3o4RPOiEZM6kbdJnT5biL/jHDGrcMTEZCgaZrgk
 7fVlyzNVZ7db27nBNtISUHMTgbFrRmXh7O0jqGQNmQQep6q3jG9u7E184 8=;
X-IronPort-AV: E=Sophos;i="6.01,193,1684800000"; d="scan'208";a="351726476"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-9fe6ad2f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 13:18:14 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-m6i4x-9fe6ad2f.us-east-1.amazon.com (Postfix)
 with ESMTPS id 0B56A8075C; Tue, 22 Aug 2023 13:18:03 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 22 Aug 2023 13:17:59 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 22 Aug
 2023 13:17:56 +0000
Message-ID: <f91863a1-4ef3-4502-ac04-ced6087171b0@amazon.com>
Date: Tue, 22 Aug 2023 15:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] hw/vmapple/cfg: Introduce vmapple cfg region
Content-Language: en-GB
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230614224038.86148-1-graf>
 <20230614225734.806-1-graf@amazon.com>
 <d77b97c1-2f59-bf40-bea6-4f1a72a3aa24@linaro.org>
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <d77b97c1-2f59-bf40-bea6-4f1a72a3aa24@linaro.org>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=5918e560e=graf@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SR6wNfF4y6fW

Ck9uIDE2LjA2LjIzIDEyOjQ3LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPgo+IE9u
IDE1LzYvMjMgMDA6NTcsIEFsZXhhbmRlciBHcmFmIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGRldmlj
ZSB0cmVlIG9yIG90aGVyIG1vcmUgc3RhbmRhcmRpemVkIG1lYW5zLCBWTUFwcGxlIHBhc3Nlcwo+
PiBwbGF0Zm9ybSBjb25maWd1cmF0aW9uIHRvIHRoZSBmaXJzdCBzdGFnZSBib290IGxvYWRlciBp
biBhIGJpbmFyeSAKPj4gZW5jb2RlZAo+PiBmb3JtYXQgdGhhdCByZXNpZGVzIGF0IGEgZGVkaWNh
dGVkIFJBTSByZWdpb24gaW4gcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4KPj4KPj4gVGhpcyBwYXRj
aCBtb2RlbHMgdGhpcyBjb25maWd1cmF0aW9uIHNwYWNlIGFzIGEgcWRldiBkZXZpY2Ugd2hpY2gg
d2UgY2FuCj4+IHRoZW4gbWFwIGF0IHRoZSBmaXhlZCBsb2NhdGlvbiBpbiB0aGUgYWRkcmVzcyBz
cGFjZS4gVGhhdCB3YXksIHdlIGNhbgo+PiBpbmZsdWVuY2UgYW5kIGFubm90YXRlIGFsbCBjb25m
aWd1cmF0aW9uIGZpZWxkcyBlYXNpbHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBH
cmFmIDxncmFmQGFtYXpvbi5jb20+Cj4+IC0tLQo+PiDCoCBody92bWFwcGxlL0tjb25maWfCoMKg
wqDCoMKgwqAgfMKgwqAgMyArKwo+PiDCoCBody92bWFwcGxlL2NmZy5jwqDCoMKgwqDCoMKgwqDC
oCB8IDEwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgaHcv
dm1hcHBsZS9tZXNvbi5idWlsZMKgwqAgfMKgwqAgMSArCj4+IMKgIGluY2x1ZGUvaHcvdm1hcHBs
ZS9jZmcuaCB8wqAgNjggKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDE3NyBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody92bWFw
cGxlL2NmZy5jCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3ZtYXBwbGUvY2Zn
LmgKPgo+Cj4+IGRpZmYgLS1naXQgYS9ody92bWFwcGxlL2NmZy5jIGIvaHcvdm1hcHBsZS9jZmcu
Ywo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi5kNDhlM2MzYWZh
Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvaHcvdm1hcHBsZS9jZmcuYwo+PiBAQCAtMCwwICsx
LDEwNSBAQAo+PiArLyoKPj4gKyAqIFZNQXBwbGUgQ29uZmlndXJhdGlvbiBSZWdpb24KPj4gKyAq
Cj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMyBBbWF6b24uY29tLCBJbmMuIG9yIGl0cyBhZmZpbGlh
dGVzLiBBbGwgUmlnaHRzIAo+PiBSZXNlcnZlZC4KPj4gKyAqCj4+ICsgKiBUaGlzIHdvcmsgaXMg
bGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgCj4+IG9y
IGxhdGVyLgo+PiArICogU2VlIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJl
Y3RvcnkuCj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKPj4gKyNpbmNs
dWRlICJody92bWFwcGxlL2NmZy5oIgo+PiArI2luY2x1ZGUgInFlbXUvbG9nLmgiCj4+ICsjaW5j
bHVkZSAicWVtdS9tb2R1bGUuaCIKPj4gKyNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCj4+ICsKPj4g
K3N0YXRpYyB2b2lkIHZtYXBwbGVfY2ZnX3Jlc2V0KERldmljZVN0YXRlICpkZXYpCj4+ICt7Cj4+
ICvCoMKgwqAgVk1BcHBsZUNmZ1N0YXRlICpzID0gVk1BUFBMRV9DRkcoZGV2KTsKPj4gK8KgwqDC
oCBWTUFwcGxlQ2ZnICpjZmc7Cj4+ICsKPj4gK8KgwqDCoCBjZmcgPSBtZW1vcnlfcmVnaW9uX2dl
dF9yYW1fcHRyKCZzLT5tZW0pOwo+PiArwqDCoMKgIG1lbXNldCgodm9pZCAqKWNmZywgMCwgVk1B
UFBMRV9DRkdfU0laRSk7Cj4KPiBJJ20gYSBiaXQgY29uZnVzZWQgaGVyZTogRGV2aWNlUmVzZXQo
KSBoYW5kbGVyIGlzIGNhbGxlZCBfYWZ0ZXJfCj4gRGV2aWNlUmVhbGl6ZSgpLgoKClllcy4gSW4g
UmVhbGl6ZSB3ZSBzZXQgdXAgcy0+Y2ZnICh0aGUgdGVtcGxhdGUpLiBJbiByZXNldCwgd2UgZmV0
Y2ggYSAKcG9pbnRlciB0byB0aGUgZ3Vlc3QgZXhwb3NlZCBtZW1vcnkgcmVnaW9uIChjZmcpLCB3
aXBlIGl0IGFuZCB0aGVuIGNvcHkgCnRoZSB0ZW1wbGF0ZSBvdmVyIGl0IGluIHRoZSBuZXh0IGxp
bmU6CgoKPgo+PiArwqDCoMKgICpjZmcgPSBzLT5jZmc7CgoKWy4uLl0KCgo+Cj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2h3L3ZtYXBwbGUvY2ZnLmggYi9pbmNsdWRlL2h3L3ZtYXBwbGUvY2ZnLmgK
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMzMzNzA2NGU0NAo+
PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2luY2x1ZGUvaHcvdm1hcHBsZS9jZmcuaAo+PiBAQCAt
MCwwICsxLDY4IEBACj4+ICsvKgo+PiArICogVk1BcHBsZSBDb25maWd1cmF0aW9uIFJlZ2lvbgo+
PiArICoKPj4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFm
ZmlsaWF0ZXMuIEFsbCBSaWdodHMgCj4+IFJlc2VydmVkLgo+PiArICoKPj4gKyAqIFRoaXMgd29y
ayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMiAK
Pj4gb3IgbGF0ZXIuCj4+ICsgKiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVs
IGRpcmVjdG9yeS4KPj4gKyAqLwo+PiArCj4+ICsjaWZuZGVmIEhXX1ZNQVBQTEVfQ0ZHX0gKPj4g
KyNkZWZpbmUgSFdfVk1BUFBMRV9DRkdfSAo+PiArCj4+ICsjaW5jbHVkZSAiaHcvc3lzYnVzLmgi
Cj4+ICsjaW5jbHVkZSAicW9tL29iamVjdC5oIgo+PiArI2luY2x1ZGUgIm5ldC9uZXQuaCIKPj4g
Kwo+PiArdHlwZWRlZiBzdHJ1Y3QgVk1BcHBsZUNmZyB7Cj4+ICvCoMKgwqAgdWludDMyX3QgdmVy
c2lvbjvCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDAwICovCj4+ICvCoMKgwqAgdWludDMyX3QgbnJf
Y3B1czvCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDA0ICovCj4+ICvCoMKgwqAgdWludDMyX3QgdW5r
MTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDA4ICovCj4+ICvCoMKgwqAgdWludDMyX3Qg
dW5rMjvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDBjICovCj4+ICvCoMKgwqAgdWludDMy
X3QgdW5rMzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDEwICovCj4+ICvCoMKgwqAgdWlu
dDMyX3QgdW5rNDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDE0ICovCj4+ICvCoMKgwqAg
dWludDY0X3QgZWNpZDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4MDE4ICovCj4+ICvCoMKg
wqAgdWludDY0X3QgcmFtX3NpemU7wqDCoMKgwqDCoMKgwqAgLyogMHgwMjAgKi8KPj4gK8KgwqDC
oCB1aW50MzJfdCBydW5faW5zdGFsbGVyMTvCoCAvKiAweDAyOCAqLwo+PiArwqDCoMKgIHVpbnQz
Ml90IHVuazU7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAweDAyYyAqLwo+PiArwqDCoMKgIHVp
bnQzMl90IHVuazY7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAweDAzMCAqLwo+PiArwqDCoMKg
IHVpbnQzMl90IHJ1bl9pbnN0YWxsZXIyO8KgIC8qIDB4MDM0ICovCj4+ICvCoMKgwqAgdWludDMy
X3Qgcm5kO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAweDAzOCAqLwo+PiArwqDCoMKgIHVp
bnQzMl90IHVuazc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAweDAzYyAqLwo+PiArwqDCoMKg
IE1BQ0FkZHIgbWFjX2VuMDvCoMKgwqDCoMKgwqDCoMKgwqAgLyogMHgwNDAgKi8KPj4gK8KgwqDC
oCB1aW50OF90IHBhZDFbMl07Cj4+ICvCoMKgwqAgTUFDQWRkciBtYWNfZW4xO8KgwqDCoMKgwqDC
oMKgwqDCoCAvKiAweDA0OCAqLwo+PiArwqDCoMKgIHVpbnQ4X3QgcGFkMlsyXTsKPj4gK8KgwqDC
oCBNQUNBZGRyIG1hY193aWZpMDvCoMKgwqDCoMKgwqDCoCAvKiAweDA1MCAqLwo+PiArwqDCoMKg
IHVpbnQ4X3QgcGFkM1syXTsKPj4gK8KgwqDCoCBNQUNBZGRyIG1hY19idDA7wqDCoMKgwqDCoMKg
wqDCoMKgIC8qIDB4MDU4ICovCj4+ICvCoMKgwqAgdWludDhfdCBwYWQ0WzJdOwo+PiArwqDCoMKg
IHVpbnQ4X3QgcmVzZXJ2ZWRbMHhhMF07wqDCoCAvKiAweDA2MCAqLwo+PiArwqDCoMKgIHVpbnQz
Ml90IGNwdV9pZHNbMHg4MF07wqDCoCAvKiAweDEwMCAqLwo+PiArwqDCoMKgIHVpbnQ4X3Qgc2Ny
YXRjaFsweDIwMF07wqDCoCAvKiAweDE4MCAqLwo+PiArwqDCoMKgIGNoYXIgc2VyaWFsWzMyXTvC
oMKgwqDCoMKgwqDCoMKgwqAgLyogMHgzODAgKi8KPj4gK8KgwqDCoCBjaGFyIHVuazhbMzJdO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogMHgzYTAgKi8KPj4gK8KgwqDCoCBjaGFyIG1vZGVsWzMy
XTvCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAweDNjMCAqLwo+PiArwqDCoMKgIHVpbnQ4X3QgdW5r
OVszMl07wqDCoMKgwqDCoMKgwqDCoCAvKiAweDNlMCAqLwo+PiArwqDCoMKgIHVpbnQzMl90IHVu
azEwO8KgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIDB4NDAwICovCj4+ICvCoMKgwqAgY2hhciBzb2Nf
bmFtZVszMl07wqDCoMKgwqDCoMKgwqAgLyogMHg0MDQgKi8KPj4gK30gVk1BcHBsZUNmZzsKPgo+
IFNpbmNlIHlvdSBhY2Nlc3MgdGhpcyBzdHJ1Y3R1cmUgdmlhIHFkZXYgcHJvcGVydGllcyAod2hp
Y2ggaXMKPiBnb29kKSwgdGhlbiB3ZSBjYW4gcmVzdHJpY3QgaXRzIGRlZmluaXRpb24gdG8gY2Zn
LmMgKG5vIG5lZWQgdG8KPiBleHBvc2UgaXQpLgoKClRoaXMgc3RydWN0IGlzIHBhcnQgb2YgVk1B
cHBsZUNmZ1N0YXRlIHdoaWNoICh1bmxlc3Mgd2UgZ28gdGhyb3VnaCAKcG9pbnRlcnMgYW5kIGFs
bG9jYXRlIGR5bmFtaWNhbGx5IC0gYmxla3MpIG1lYW5zIGl0IG5lZWRzIHRvIGtub3cgdGhlIApz
aXplIG9mIHRoZSBzdHJ1Y3Qgd2hpY2ggYWdhaW4gbWVhbnMgaXQgbmVlZHMgdG8gYmUgcGFydCBv
ZiB0aGUgaGVhZGVyIDopCgoKQWxleAoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0
LUlEOiBERSAyODkgMjM3IDg3OQoKCg==

