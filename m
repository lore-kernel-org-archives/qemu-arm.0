Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1223313njf;
        Mon, 2 Sep 2024 13:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ3fh5fI9twte5MHf3NKFdlm6uRjFBckKaGVFzm7PAwIxDVAJvkkamyv9AOYSIyO2C7iDmFBqcWM+RYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFm1gp7IaXCpvmBeVqIggtoydRsd6dJ3w3X3qY4vyf15FTedn43Y80cNrH97jRmdiIxtFnT
X-Received: by 2002:a05:622a:1244:b0:456:7dce:9cdf with SMTP id d75a77b69052e-45719f1a10cmr121891741cf.56.1725308487290;
        Mon, 02 Sep 2024 13:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725308487; cv=none;
        d=google.com; s=arc-20160816;
        b=of9wSd+tJsG1Rspi5XhF/KsMXd5X01rfMvh/maWq5p40ifb99/u6ULi1NiHiDRzab8
         rRZ2YCrgay7ScnsNEcFkU0aTaIR/bB9M2Kl5ys1AIUwlgqbhShjxlXy/otdRKj6BMLPl
         4UBLMvD3xOCO3D/QTS9ymiiQJ0olnpOWDz/ZDHTaXYO34jcn6yNQnxVIHAqOfTLk/DVl
         x2WMHyhdGFXvhrVcWMybjDeXJnNCl62FocRkbGFD5QXpbwYcu+VpXAk2JCO14YFvO3ax
         HIZcmWTPYuq+LmhdBCldXLLYvLUNXps5l9o4G0W5WHA1l746/F/UXMJLV5O+t1dp9uGz
         uAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=teLZ/4mzTBIZC3P8owCMf1djmtYMgIY/sB2P39MYkB0=;
        fh=fx0m9tqLGsrKHKT7SMtDZU2bI1TLL61Bhl3Ti2kZqUY=;
        b=uqydLb2BwPr2BMW4hDaJYEb+9HlK78gpeA4y4VJFb62mZlDHLlj2FKDV6FFEf9Wd3k
         ODYTfIOshhkzCOCAOtvnFrGa2UHvfrx+9pYmXqbPJW5TMExU06eO8MwnUsZh6VbYBWyY
         Aypd1GI/U+sImk31lXoXBFOG76cuwX/pDzy4mC9tqRf2Xx3en4WkKpmccyBT+FU1r7oU
         vricl63Gfd8huOrIwIEo4JOQdZzqSt1sQDXZYNn/06NAPAUljKs3L6PWIP6yvjF5m8mJ
         47rGFKPvz7Fp6cK8Tyw+jr3dkvn6Wbh4vqOsrSpAoccfRVR+MaZhYjZSKCXKluwiyduC
         aCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ErM9CNEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d8f375si111627391cf.463.2024.09.02.13.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 13:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ErM9CNEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slDXp-0002Qw-Tu; Mon, 02 Sep 2024 16:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slDXo-0002Oh-Mn
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 16:21:00 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slDXm-0000bP-P0
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 16:21:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7141e20e31cso3775438b3a.3
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725308456; x=1725913256; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=teLZ/4mzTBIZC3P8owCMf1djmtYMgIY/sB2P39MYkB0=;
 b=ErM9CNEqVAPnU8StId/8ygQv49n/kfMS811CekcXQ/eUenGQBcex8KS/mUA7XDkSWn
 UFRHFFUjJN8nyAqyP3+rZp+y9vL2ZHGKczyFi1Kw9yC5Z5qIu3k/aLz7UwI5CIpGI3FD
 kQa/4t5MKkYODP+/lX388GVDJzht7+0ktSn5C8rnjYt7lBIeEqj++nysfVsRj7c3Uti3
 WbJYPVxVmuOJ0MkkqHODXpR1f8zpnkVvVqdCiMewxLx22xnR11jIQ2/J2XtFq+ItFS+p
 HJdYtI/oiCxqy3Cp6VOSejNwosyeB/LDnKEfmiHZfeXoScxcHqD1rjXK0KE32QbX6TBV
 Cvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725308456; x=1725913256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=teLZ/4mzTBIZC3P8owCMf1djmtYMgIY/sB2P39MYkB0=;
 b=EQplTf42JueQT2A6L770gvEDFNxloIRjgjgflstt6kR4r0ti5sYxDD+/qVQjAqrs3J
 xKX0qrSzAUxUbmjxFm1SxC/wQhUKYdrc2vLHbXds8jkXiQF5O1GY9LCUjWjkh/H+s1Yo
 owPlZA0mMPKdX6sOVPFLcB7hIy0G7+1tVgi+m1sknc8oz3eCpyLh7MMAhqEHJ4VbQiml
 Y5nWqG51fRFAaaA0+A78jYUkdHuC4A8rfOfei0MhI+E39uTvWcQkUE5GmVldunH2615L
 rgg5vP62hiptYhWw3pRwqUuJVqGD8iZYUnCvru6WU9yVR21HCx10sQtEPCgkmcjgUIl/
 f2Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlqMsZ351JdH/0fCujQyj76G4vajDC7oe14eHMcPFVaktVJ733BjXX2ZiMU0cfYL5Sepor5zLWJA==@nongnu.org
X-Gm-Message-State: AOJu0YycToYEwylCmtniLCtTnA4z0k9gzwOX1ndn+5IDIJTsIL2uiivn
 UfOIjrE1CuJG3HgI1ZqjFpckM2iYGP++K6h3AcIbBB9vbQ1bVe9EfCgQweLXvIaHGLYQs0d+yRp
 LYTw=
X-Received: by 2002:a05:6a00:9282:b0:704:2563:5079 with SMTP id
 d2e1a72fcca58-7173d0069b0mr10593269b3a.27.1725308455858; 
 Mon, 02 Sep 2024 13:20:55 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9384:1d00::27bd? ([2604:3d08:9384:1d00::27bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e55a594bsm7232346b3a.55.2024.09.02.13.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 13:20:55 -0700 (PDT)
Message-ID: <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
Date: Mon, 2 Sep 2024 13:20:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
Content-Language: en-US
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
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
X-TUID: V8rUfQ7Mp6ei

T24gOS8yLzI0IDEyOjUzLCBNYXJpbyBNYXJpZXR0byB3cm90ZToNCj4gSGVsbG8gUGllcnJp
Y2suDQo+IA0KPiBXaXRoIEN1dHRsZWZpc2ggY2FuIEkgZW11bGF0ZSBBbmRyb2lkIDE0IGZv
ciBhcm02NCA/IEkgYXNrIGJlY2F1c2UgaW4gDQo+IHlvdXIgc2NyaXB0IEkgcmVhZCA6DQo+
IA0KPiAifC9ob21lL3VzZXIvLndvcmsvcWVtdS9idWlsZC9xZW11LXN5c3RlbS14ODZfNjQi
LCBzbyxJIHN1c3BlY3QgdGhhdCB5b3UgDQo+IGhhdmUgZW11bGF0ZWQgQW5kcm9pZCB4NjQg
Yml0LGJ1dCBJIG5lZWQgYXJtNjQuIHwNCj4NCg0KWWVzLCBpdCB3b3JrcyBmb3IgYm90aCBh
cmNoaXRlY3R1cmUuIFRoZSBvbmx5IHRoaW5nIEkgZGlkbid0IHRyeSBpcyBhbiANCmFybTY0
IHZtIGFjY2VsZXJhdGVkIHdpdGgga3ZtIChJIGRvbid0IGhhdmUgdGhpcyBhIGxpbnV4LWFh
cmNoNjQgDQptYWNoaW5lKSwgYnV0IGl0IHNob3VsZCB3b3JrLg0KDQo+IEkgYWxzbyByZWFk
ICJmb3IgYWFyY2g2NCBpbWFnZXM6IHNlbGVjdCANCj4gfGFvc3BfY2ZfYXJtNjRfb25seV9w
aG9uZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1ZyIgOiBJJ20gbm90IGFibGUgdG8gDQo+IGRv
d25sb2FkIHRoaXMga2luZCBvZiBpbWFnZXMuIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhl
IEJyYW5jaCBHcmlkIA0KPiB3b3Jrcy4gQ2FuIHlvdSBleHBsYWluIHRvIG1lIGEgbGl0dGxl
IGJpdCBtb3JlID8NCj4gfA0KDQpZb3UgaGF2ZSBhIGxpbmsganVzdCBuZXh0IHRvIGl0ICgi
QnJhbmNoIGdyaWQiKSBvbiB0aGUgd2lraSBwYWdlLg0KT25jZSBvbiBjaSBhbmRyb2lkIHBh
Z2UsIGNsaWNrIG9uIGZpbHRlciBidXR0b24gKHRocmVlIGJhcnMsIGludmVydGVkIA0KcHly
YW1pZCksIGFuZCBzZWxlY3QgYW9zcF9jZl9hcm02NF9vbmx5X3Bob25lLXRydW5rX3N0YWdp
bmctdXNlcmRlYnVnLg0KVGhlbiBnbyB0byBhcnRpZmFjdHMsIGFuZCBkb3dubG9hZCBpbWFn
ZSBhbmQgY3ZkX2hvc3RfeDg2XzY0IHBhY2thZ2UsIGFzIA0Kd2lraSBtZW50aW9ucy4NCg0K
RG9uJ3QgaGVzaXRhdGUgdG8gYXNrIG1vcmUgcXVlc3Rpb25zIG9uIHRoaXMuIEkgaW1hZ2lu
ZSB0aGlzIHRvcGljIG1pZ2h0IA0KaW50ZXJlc3Qgc29tZSBwZW9wbGUgd2hvIHRyeSB0byBk
byB0aGUgc2FtZSB0aGluZy4NCg0KUGllcnJpY2sNCg0KPiB8DQo+IHwNCj4gDQo+IA0KPiBP
biBNb24sIFNlcCAyLCAyMDI0IGF0IDg6NDfigK9QTSBQaWVycmljayBCb3V2aWVyIA0KPiA8
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnIDxtYWlsdG86cGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnPj4gd3JvdGU6DQo+IA0KPiAgICAgSGVsbG8gTWFyaW8sDQo+IA0KPiAgICAg
dmVyeSByZWNlbnRseSwgSSBoYWQgdG8gaW52ZXN0aWdhdGUgYm9vdGluZyB0aW1lIG9mIEFu
ZHJvaWQgd2hlbiB1c2luZw0KPiAgICAgUUVNVS4gWW91IGNhbiBwcm9iYWJseSBtYW5hZ2Ug
dG8gYm9vdCB0aGlzIHdpdGggb25seSBRRU1VIGFsb25lLCBidXQgaW4NCj4gICAgIG15IGV4
cGVyaWVuY2UsIHVzaW5nIEN1dHRsZWZpc2ggdG9vbGluZyBpcyBhbiBlYXNpZXIgYXBwcm9h
Y2guDQo+IA0KPiAgICAgSWYgeW91IHJlYWxseSB3YW50IHRvIHVzZSBvbmx5IFFFTVUsIHlv
dSBjYW4gdXNlIEN1dHRsZWZpc2ggdG8gZ2V0DQo+ICAgICBleGFjdA0KPiAgICAgY29tbWFu
ZCBsaW5lIHVzZWQgKHdoaWNoIGRpc2sgZ29lcyB3aGVyZSksIGFuZCBpdGVyYXRlIGZyb20g
dGhhdC4NCj4gDQo+ICAgICBJbnN0cnVjdGlvbnM6DQo+ICAgICBodHRwczovL2xpbmFyby5h
dGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FFTVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0Fu
ZHJvaWQrdXNpbmcrUUVNVSA8aHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93aWtpL3Nw
YWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FFTVU+DQo+
IA0KPiAgICAgQXMgeW91J2xsIHNlZSwgSSBjb3VsZCBub3QgZ2V0IGEgZGlyZWN0IGdyYXBo
aWMgb3V0cHV0LCBidXQgdXNpbmcNCj4gICAgIHNjcmNweSwgaXQgd29ya2VkIHdlbGwgZm9y
IG1lLiBIb3BlIGl0IGNhbiBmaXQgeW91ciB1c2UgY2FzZS4NCj4gDQo+ICAgICBSZWdhcmRz
LA0KPiAgICAgUGllcnJpY2sNCj4gDQo+ICAgICBPbiA5LzIvMjQgMDY6NDksIE1hcmlvIE1h
cmlldHRvIHdyb3RlOg0KPiAgICAgID4gSGVsbG8uDQo+ICAgICAgPg0KPiAgICAgID4gSSB3
b3VsZCBsaWtlIHRvIGVtdWxhdGUgQW5kcm9pZCAxNCBvbiBteSBVYnVudHUgMjQuMDQgT1Mg
WDY0IGJpdA0KPiAgICAgdXNpbmcNCj4gICAgICA+IHFlbXUtc3lzdGVtLWFhcmNoNjQuIEkg
dHJpZWQgdXNpbmcgdGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIDoNCj4gICAgICA+DQo+ICAg
ICAgPiBxZW11LXN5c3RlbS1hYXJjaDY0IFwNCj4gICAgICA+wqAgwqAgwqAgwqAgwqAgLXNt
cCA0IFwNCj4gICAgICA+wqAgwqAgwqAgwqAgwqAgLW0gMjA0OCBcDQo+ICAgICAgPsKgIMKg
IMKgIMKgIMKgIC1jcHUgY29ydGV4LWE3MiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1N
IHZpcnQgXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ncHUtcGNp
LHhyZXM9MTAyNCx5cmVzPTc2OCBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kaXNwbGF5
IHNkbCxnbD1vbiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdXNiLWVoY2kg
XA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1rYmQgXA0KPiAgICAgID7C
oCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby10YWJsZXQtcGNpIFwNCj4gICAgICA+wqAg
wqAgwqAgwqAgwqAgLXVzYiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1zZXJpYWwgc3Rk
aW8gXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAta2VybmVsIC9tbnQvenJvb3QtMTMzL19P
Uy9BbmRyb2lkL3JwaTQvSW1hZ2UgXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtaW5pdHJk
IC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXA0KPiAgICAg
ID7CoCDCoCDCoCDCoMKgwqAgLWRyaXZlDQo+ICAgICAgPg0KPiAgICAgaW5kZXg9MCxpZj1u
b25lLGlkPXN5c3RlbSxmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvYm9v
dC5pbWcgXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNp
LGRyaXZlPWJvb3QgXA0KPiAgICAgID7CoCDCoMKgwqDCoMKgwqDCoCAtZHJpdmUNCj4gICAg
ICA+DQo+ICAgICBpbmRleD0xLGlmPW5vbmUsaWQ9c3lzdGVtLGZpbGU9L21udC96cm9vdC0x
MzMvX09TL0FuZHJvaWQvcnBpNC9zeXN0ZW0uaW1nIFwNCj4gICAgICA+wqAgwqAgwqAgwqAg
wqAgLWRldmljZSB2aXJ0aW8tYmxrLXBjaSxkcml2ZT1zeXN0ZW0gXA0KPiAgICAgID7CoCDC
oCDCoCDCoCDCoCAtZHJpdmUNCj4gICAgICA+DQo+ICAgICBpbmRleD0yLGlmPW5vbmUsaWQ9
dmVuZG9yLGZpbGU9L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC92ZW5kb3IuaW1n
IFwNCj4gICAgICA+wqAgwqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0aW8tYmxrLXBjaSxkcml2
ZT12ZW5kb3IgXA0KPiAgICAgID4gLWFwcGVuZCAiY29uc29sZT10dHlBTUEwLDM4NDAwIGRy
bS5kZWJ1Zz0weDAgcm9vdHdhaXQgcm9vdGRlbGF5PTUNCj4gICAgICA+IHJvb3Q9L2Rldi9t
bWNibGswcDIgYW5kcm9pZGJvb3QuaGFyZHdhcmU9cnBpNA0KPiAgICAgID4gYW5kcm9pZGJv
b3Quc2VsaW51eD1wZXJtaXNzaXZlIHNlY3VyaXR5PXNlbGludXggc2VsaW51eD0xDQo+ICAg
ICAgPiBhbmRyb2lkYm9vdC5xZW11Lmh3Lm1haW5rZXlzPTAgYW5kcm9pZGJvb3QubGNkLmRl
bnNpdHk9MTYwIg0KPiAgICAgID4NCj4gICAgICA+IFRoZSBlcnJvciBJIGdldCBpbiBzaG9y
dCBpcyA6DQo+ICAgICAgPg0KPiAgICAgID4gWyAxLjk5MzY2OF0gaW5pdDogYm9vbA0KPiAg
ICAgID4NCj4gICAgIGFuZHJvaWQ6OmluaXQ6OkJsb2NrRGV2SW5pdGlhbGl6ZXI6OkluaXRE
ZXZpY2VzKHN0ZDo6c2V0PHN0ZDo6c3RyaW5nPik6DQo+ICAgICAgPiBwYXJ0aXRpb24ocykg
bm90IGZvdW5kIGluIC9zeXMsIHdhaXRpbmcgZm9yIHRoZWlyIHVldmVudChzKToNCj4gICAg
IG1tY2JsazBwMiwNCj4gICAgICA+IG1tY2JsazBwMw0KPiAgICAgID4NCj4gICAgICA+DQo+
ICAgICAgPiBPbmUgdXNlciBzdWdnZXN0ZWQgdG8gOg0KPiAgICAgID4NCj4gICAgICA+DQo+
ICAgICAgPg0KPiAgICAgID4NCj4gICAgICA+DQo+ICAgICAgPiBIaSEhISBUaGUgIi9zeXMi
IGlzIGEgImR5bmFtaWMgZnMiIGNyZWF0ZWQgYXQgcmFtIGZyb20gdGhlDQo+ICAgICBrZXJu
ZWwsIHRvDQo+ICAgICAgPiBleHBvcnQgYSBsb3Qgb2YgdGhpbmdzLi4uc28gbW9zdCBvZiB0
aGUgZmlsZXMgb25seSBleGlzdCBhdCBydW50aW1lLg0KPiAgICAgID4gTm9ybWFsbHksIHRo
ZSBwYXJ0aXRpb25zIGZyb20gdGhlIGJsb2NrIGRldmljZSBoYXZlIGEgc3ltbGluayBhdA0K
PiAgICAgID4gL3N5cy88c29tZXRoaW5nPi88Li4uPiB0aGF0IHBvaW50cyB0byAvZGV2LyBi
bG9jayBub2RlLiBJdCBzZWVtcw0KPiAgICAgdGhhdA0KPiAgICAgID4gdGhlcmUgYXJlIG5v
IHN1Y2ggZmlsZXMgdW5kZXIgL3N5cyBhY2NvcmRpbmcgdG8gd2hhdCBpbml0IGlzIGxvb2tp
bmcNCj4gICAgICA+IGZvci4gWW91IGNhbiBkb3VibGUgY2hlY2sgdGhpcyBhdCBpbml0IHNv
dXJjZSBjb2RlIHRvIGNoZWNrIHRoZQ0KPiAgICAgZXhhY3QNCj4gICAgICA+IHBhdGggYnV0
IEknbSBndWVzc2luZyB0aGF0IHlvdSdsbCBoYXZlIHRvIGNoYW5nZSB0aGUgcWVtdSBhcmd1
bWVudHMNCj4gICAgICA+IHJlZ2FyZGluZyB0aGUgYmxvY2sgZGV2aWNlLg0KPiAgICAgID4N
Cj4gICAgICA+IEFib3V0IHVzZXJkYXRhLmltZyBJIHRoaW5rIGl0J3Mgbm9ybWFsIHNpbmNl
IGluIHRoZSBvbGQgZGF5cywgdGhlDQo+ICAgICBpbWFnZQ0KPiAgICAgID4gd2FzIGEgImVt
cHR5IHNwYXJzZSBpbWFnZSIsIHRoYXQgbWVhbnMsIGF0IHRoZSBmaXJzdCBmbGFzaGluZw0K
PiAgICAgcHJvY2VzcywNCj4gICAgICA+IHRoZXJlIGlzbid0IHVzZXJkYXRhIGluZm9ybWF0
aW9uLCB3ZSdyZSBqdXN0ICJmbGFzaGluZyB0aGUNCj4gICAgIHBhcnRpdGlvbiINCj4gICAg
ICA+IHdpdGggZW1wdHkgZGF0YS4NCj4gICAgICA+IFRrcyEhIQ0KPiAgICAgID4NCj4gICAg
ICA+DQo+ICAgICAgPg0KPiAgICAgID4gU28saW4gc2hvcnQgSSBzaG91bGQgY2hhbmdlIHRo
ZSBxZW11IGFyZ3VtZW50cyByZWdhcmRpbmcgdGhlIGJsb2NrDQo+ICAgICAgPiBkZXZpY2Uu
IEkgdHJpZWQgaW4gdGhpcyB3YXkgOg0KPiAgICAgID4NCj4gICAgICA+DQo+ICAgICAgPiBx
ZW11LXN5c3RlbS1hYXJjaDY0IFwNCj4gICAgICA+wqAgwqAgwqAgwqAgwqAgLXNtcCA0IFwN
Cj4gICAgICA+wqAgwqAgwqAgwqAgwqAgLW0gMjA0OCBcDQo+ICAgICAgPsKgIMKgIMKgIMKg
IMKgIC1jcHUgY29ydGV4LWE3MiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1NIHZpcnQg
XA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ncHUtcGNpLHhyZXM9
MTAyNCx5cmVzPTc2OCBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kaXNwbGF5IHNkbCxn
bD1vbiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdXNiLWVoY2kgXA0KPiAg
ICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1rYmQgXA0KPiAgICAgID7CoCDCoCDC
oCDCoCDCoCAtZGV2aWNlIHZpcnRpby10YWJsZXQtcGNpIFwNCj4gICAgICA+wqAgwqAgwqAg
wqAgwqAgLXVzYiBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1zZXJpYWwgc3RkaW8gXA0K
PiAgICAgID7CoCDCoCDCoCDCoCDCoCAta2VybmVsIC9tbnQvenJvb3QtMTMzL19PUy9BbmRy
b2lkL3JwaTQvSW1hZ2UgXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtaW5pdHJkIC9tbnQv
enJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXA0KPiAgICAgID7CoCDC
oMKgwqDCoMKgwqDCoCAtaGRhIC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvYm9v
dC5pbWcgXA0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCAtaGRiIC9tbnQvenJvb3QtMTMzL19P
Uy9BbmRyb2lkL3JwaTQvc3lzdGVtLmltZyBcDQo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1o
ZGMgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC92ZW5kb3IuaW1nIFwNCj4gICAg
ICA+wqAgwqAgwqAgwqAgLWFwcGVuZCAiY29uc29sZT10dHlBTUEwLDM4NDAwIGRybS5kZWJ1
Zz0weDAgcm9vdHdhaXQNCj4gICAgIHJvb3RkZWxheT01DQo+ICAgICAgPiByb290PS9kZXYv
bW1jYmxrMHAyIGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQNCj4gICAgICA+IGFuZHJvaWRi
b290LnNlbGludXg9cGVybWlzc2l2ZSBzZWN1cml0eT1zZWxpbnV4IHNlbGludXg9MQ0KPiAg
ICAgID4gYW5kcm9pZGJvb3QucWVtdS5ody5tYWlua2V5cz0wIGFuZHJvaWRib290LmxjZC5k
ZW5zaXR5PTE2MCINCj4gICAgICA+DQo+ICAgICAgPg0KPiAgICAgID4gYnV0IHRoZSBlcnJv
ciBpcyBzdGlsbCB0aGVyZS4gRG8geW91IGtub3cgc29tZSBkaWZmZXJlbnQgYWx0ZXJuYXRp
dmUNCj4gICAgICA+IGJsb2NrIGRldmljZXMgdG8gdHJ5ID8gdGhhbmtzLg0KPiAgICAgID4N
Cj4gICAgICA+DQo+ICAgICAgPiAtLQ0KPiAgICAgID4gTWFyaW8uDQo+IA0KPiANCj4gDQo+
IC0tIA0KPiBNYXJpby4NCg==
