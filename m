Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1202344njf;
        Mon, 2 Sep 2024 11:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVA+5Xkim4zlhxErGCqnlllvhr25I4ESi+7wZ+tuAr3sJ2VX/rA9N8pA1GN/z+o7bW2zB+c7U3riilMDA==@linaro.org
X-Google-Smtp-Source: AGHT+IHGxnVTwVGM0fgtqUsIOPCex/P5ycFYenZo3RNwDdFupsLNwy0NlEoExsmrtQIwNOIBZhxH
X-Received: by 2002:a05:620a:1983:b0:7a5:1ca:d010 with SMTP id af79cd13be357-7a804bc2c92mr2853852285a.12.1725302862607;
        Mon, 02 Sep 2024 11:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725302862; cv=none;
        d=google.com; s=arc-20160816;
        b=t7iw3lk4G6oK2FQHhnXK+MikNCuW0O93cC3EPlhFVkC8BPFEeB+T0FLUVcLOEf/JuT
         ly8Hl4iMdwl0L2Q62OS9OsP4s0mYLUIXIWQulIocDBBoL+kveHFAe+1J9A6sStlCAZ3u
         TAFXTWwNT1KrCjnLExFvWpkBGZk5ZbpcylLjmEf49xCF2HLdmHRhMZ7n4ZAPNjz1r+Dd
         L4rMEYt/3TRAn1PVdwJJQoAUtplIvm+bluXqIEJPEd7XbLMS3ToobGXH6sy6LG3OGDDU
         sifOsXDRS7LjMUJgDxotT3OFe+xAyRztefK4OyVdqTaTlFS/H+enLm4NX9aaXU/6bsG+
         E4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YxxbPNITuDXzQ1j4RfsmZXCMpCY5sssMeSz1sOO0UNY=;
        fh=y6Yd0H1oSZ3glPfxzKRfYQc5Uw2ZC+XpqgZslhKYUeg=;
        b=Ge2FPtaiKqrG5F9VfN4NjRF3SVYkgEg3J61SCJGJ5o7ShXOb5QRWNu2GfqgbreXeAE
         OhLi8mpobHMM16oegpToi3z1VQEvHhThoP3G1hn3efuyyr4vU66idKsBC+PpFfb4FazR
         BjuMwYmjz2/3ydufHrliDjMCY+ydDztQ0MVYcTmVcLWAUwV5zsJTZ44S9mFC1qGDATJw
         fqAW4oO9QgXHmbz1ZVXKQ9IhNT+t2pWoGWNiWXeS3v2iGBykkMP5IG9kdF5LVcr00/W6
         CpEPUZmI7HdC+zQ0lXdOqOLKs9ot0RiTH8gJZ83PogzHASU8pgPXq6Aw++DAXn8g1R4o
         VHKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSYxPiUf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806df175dsi1067674485a.709.2024.09.02.11.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 11:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSYxPiUf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slC5H-0001Sq-1b; Mon, 02 Sep 2024 14:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slC5E-0001Rk-JS
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 14:47:24 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slC59-0007kl-Qg
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 14:47:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-715cdc7a153so3110330b3a.0
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725302838; x=1725907638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YxxbPNITuDXzQ1j4RfsmZXCMpCY5sssMeSz1sOO0UNY=;
 b=RSYxPiUft3yRHp+7Lb2Yw9iwcL22soH5TvS6tUvyWjvNWC5DptV61UGlneelKwdM1f
 e8yT0okv71IIOf27LXTfon1IXWh6TLmRkfpVr60+btfRfmPcdRXqbwo+0mhGhmNQRSjC
 d5fs+6F7T5gUdw+TfuH1XXTOe4HyAoKC4js8T8bh2espYwWpAnwEfGT5mNvZG3K9UJoP
 9nCzuAP6Y1DY0wl4y78rCkaFsApU6OPjy3aliwhg56l3GIZXqnAAI5uxpo74yEzJWpl7
 uU2MWwgP7BIr0nmawfbH4sxBI88srbWEp5aMd7oZNo/rWKBi8SKknW7AP7MEli1jKK11
 9N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725302838; x=1725907638;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxxbPNITuDXzQ1j4RfsmZXCMpCY5sssMeSz1sOO0UNY=;
 b=YiwqFWIuOroMxgiW+sZhiUjvASk+QKhH93K5ilt7PfoMDAEjZQNqiSciznUaubqmFL
 TxvNuAiApaTeljsgRbqQxptav1foYBefFY9d2wlrCaDZPzanKSdGVQwj6Tth/g1LVS6N
 rhCP3hZXtTIv3zpe7IFyE4IYiXaWvS82Ce3gAXg4LjFElOtHlIuowHNBlder/63efHan
 TWxdtjWq0CsQmDFwENpB8GRH6BlcuZ+F7bwndm5gn1IfrKcHKBmo3cbzZ9pPlbZK8w+Z
 ya2hK+qBTu9nmTI6oyx/bynFzCTvFDS4esEq+NFY6FsXGRQyPLn+MBXdmv3f2h35NHxD
 Hbkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpG6teA9Rw7LaQ+WUJX7P1V7+XlybqHlx152sYZ/d99Fz678MZsCeX50LDHkrkRNk9LXq0QTQiZw==@nongnu.org
X-Gm-Message-State: AOJu0Yx4IR6davVhW6323Oy2ZFkXozSY34hg/lSi8NWQa+GAQwAcAS9Y
 ptH3E6x1QjYEuDir8DO1C/QYizKkBL9mFt5qXw+BeugrWt2fSehhxL7XnCh2SRE=
X-Received: by 2002:a05:6a00:1905:b0:712:7512:add9 with SMTP id
 d2e1a72fcca58-7170a85ab58mr17641665b3a.13.1725302837882; 
 Mon, 02 Sep 2024 11:47:17 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9384:1d00::27bd? ([2604:3d08:9384:1d00::27bd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e77f487sm6771932a12.42.2024.09.02.11.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 11:47:17 -0700 (PDT)
Message-ID: <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
Date: Mon, 2 Sep 2024 11:47:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>, qemu-discuss@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: QGw7RrUTc3Fk

SGVsbG8gTWFyaW8sDQoNCnZlcnkgcmVjZW50bHksIEkgaGFkIHRvIGludmVzdGlnYXRlIGJv
b3RpbmcgdGltZSBvZiBBbmRyb2lkIHdoZW4gdXNpbmcgDQpRRU1VLiBZb3UgY2FuIHByb2Jh
Ymx5IG1hbmFnZSB0byBib290IHRoaXMgd2l0aCBvbmx5IFFFTVUgYWxvbmUsIGJ1dCBpbiAN
Cm15IGV4cGVyaWVuY2UsIHVzaW5nIEN1dHRsZWZpc2ggdG9vbGluZyBpcyBhbiBlYXNpZXIg
YXBwcm9hY2guDQoNCklmIHlvdSByZWFsbHkgd2FudCB0byB1c2Ugb25seSBRRU1VLCB5b3Ug
Y2FuIHVzZSBDdXR0bGVmaXNoIHRvIGdldCBleGFjdCANCmNvbW1hbmQgbGluZSB1c2VkICh3
aGljaCBkaXNrIGdvZXMgd2hlcmUpLCBhbmQgaXRlcmF0ZSBmcm9tIHRoYXQuDQoNCkluc3Ry
dWN0aW9uczogDQpodHRwczovL2xpbmFyby5hdGxhc3NpYW4ubmV0L3dpa2kvc3BhY2VzL1FF
TVUvcGFnZXMvMjk0NjQwNjgwOTcvUnVuK0FuZHJvaWQrdXNpbmcrUUVNVQ0KDQpBcyB5b3Un
bGwgc2VlLCBJIGNvdWxkIG5vdCBnZXQgYSBkaXJlY3QgZ3JhcGhpYyBvdXRwdXQsIGJ1dCB1
c2luZyANCnNjcmNweSwgaXQgd29ya2VkIHdlbGwgZm9yIG1lLiBIb3BlIGl0IGNhbiBmaXQg
eW91ciB1c2UgY2FzZS4NCg0KUmVnYXJkcywNClBpZXJyaWNrDQoNCk9uIDkvMi8yNCAwNjo0
OSwgTWFyaW8gTWFyaWV0dG8gd3JvdGU6DQo+IEhlbGxvLg0KPiANCj4gSSB3b3VsZCBsaWtl
IHRvIGVtdWxhdGUgQW5kcm9pZCAxNCBvbiBteSBVYnVudHUgMjQuMDQgT1MgWDY0IGJpdCB1
c2luZyANCj4gcWVtdS1zeXN0ZW0tYWFyY2g2NC4gSSB0cmllZCB1c2luZyB0aGUgZm9sbG93
aW5nIHBhcmFtZXRlcnMgOg0KPiANCj4gcWVtdS1zeXN0ZW0tYWFyY2g2NCBcDQo+ICDCoCDC
oCDCoCDCoCAtc21wIDQgXA0KPiAgwqAgwqAgwqAgwqAgLW0gMjA0OCBcDQo+ICDCoCDCoCDC
oCDCoCAtY3B1IGNvcnRleC1hNzIgXA0KPiAgwqAgwqAgwqAgwqAgLU0gdmlydCBcDQo+ICDC
oCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ncHUtcGNpLHhyZXM9MTAyNCx5cmVzPTc2OCBc
DQo+ICDCoCDCoCDCoCDCoCAtZGlzcGxheSBzZGwsZ2w9b24gXA0KPiAgwqAgwqAgwqAgwqAg
LWRldmljZSB1c2ItZWhjaSBcDQo+ICDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1rYmQgXA0K
PiAgwqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0aW8tdGFibGV0LXBjaSBcDQo+ICDCoCDCoCDC
oCDCoCAtdXNiIFwNCj4gIMKgIMKgIMKgIMKgIC1zZXJpYWwgc3RkaW8gXA0KPiAgwqAgwqAg
wqAgwqAgLWtlcm5lbCAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L0ltYWdlIFwN
Cj4gIMKgIMKgIMKgIMKgIC1pbml0cmQgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBp
NC9yYW1kaXNrLmltZyBcDQo+ICDCoCDCoCDCoMKgwqAgLWRyaXZlIA0KPiBpbmRleD0wLGlm
PW5vbmUsaWQ9c3lzdGVtLGZpbGU9L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9i
b290LmltZyBcDQo+ICDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRyaXZl
PWJvb3QgXA0KPiAgwqDCoMKgwqDCoMKgwqAgLWRyaXZlIA0KPiBpbmRleD0xLGlmPW5vbmUs
aWQ9c3lzdGVtLGZpbGU9L21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9zeXN0ZW0u
aW1nIFwNCj4gIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9c3lz
dGVtIFwNCj4gIMKgIMKgIMKgIMKgIC1kcml2ZSANCj4gaW5kZXg9MixpZj1ub25lLGlkPXZl
bmRvcixmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvdmVuZG9yLmltZyBc
DQo+ICDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ibGstcGNpLGRyaXZlPXZlbmRvciBc
DQo+IC1hcHBlbmQgImNvbnNvbGU9dHR5QU1BMCwzODQwMCBkcm0uZGVidWc9MHgwIHJvb3R3
YWl0IHJvb3RkZWxheT01IA0KPiByb290PS9kZXYvbW1jYmxrMHAyIGFuZHJvaWRib290Lmhh
cmR3YXJlPXJwaTQgDQo+IGFuZHJvaWRib290LnNlbGludXg9cGVybWlzc2l2ZSBzZWN1cml0
eT1zZWxpbnV4IHNlbGludXg9MSANCj4gYW5kcm9pZGJvb3QucWVtdS5ody5tYWlua2V5cz0w
IGFuZHJvaWRib290LmxjZC5kZW5zaXR5PTE2MCINCj4gDQo+IFRoZSBlcnJvciBJIGdldCBp
biBzaG9ydCBpcyA6DQo+IA0KPiBbIDEuOTkzNjY4XSBpbml0OiBib29sIA0KPiBhbmRyb2lk
Ojppbml0OjpCbG9ja0RldkluaXRpYWxpemVyOjpJbml0RGV2aWNlcyhzdGQ6OnNldDxzdGQ6
OnN0cmluZz4pOiANCj4gcGFydGl0aW9uKHMpIG5vdCBmb3VuZCBpbiAvc3lzLCB3YWl0aW5n
IGZvciB0aGVpciB1ZXZlbnQocyk6IG1tY2JsazBwMiwgDQo+IG1tY2JsazBwMw0KPiANCj4g
DQo+IE9uZSB1c2VyIHN1Z2dlc3RlZCB0byA6DQo+IA0KPiANCj4gDQo+IA0KPiAJDQo+IEhp
ISEhIFRoZSAiL3N5cyIgaXMgYSAiZHluYW1pYyBmcyIgY3JlYXRlZCBhdCByYW0gZnJvbSB0
aGUga2VybmVsLCB0byANCj4gZXhwb3J0IGEgbG90IG9mIHRoaW5ncy4uLnNvIG1vc3Qgb2Yg
dGhlIGZpbGVzIG9ubHkgZXhpc3QgYXQgcnVudGltZS4gDQo+IE5vcm1hbGx5LCB0aGUgcGFy
dGl0aW9ucyBmcm9tIHRoZSBibG9jayBkZXZpY2UgaGF2ZSBhIHN5bWxpbmsgYXQgDQo+IC9z
eXMvPHNvbWV0aGluZz4vPC4uLj4gdGhhdCBwb2ludHMgdG8gL2Rldi8gYmxvY2sgbm9kZS4g
SXQgc2VlbXMgdGhhdCANCj4gdGhlcmUgYXJlIG5vIHN1Y2ggZmlsZXMgdW5kZXIgL3N5cyBh
Y2NvcmRpbmcgdG8gd2hhdCBpbml0IGlzIGxvb2tpbmcgDQo+IGZvci4gWW91IGNhbiBkb3Vi
bGUgY2hlY2sgdGhpcyBhdCBpbml0IHNvdXJjZSBjb2RlIHRvIGNoZWNrIHRoZSBleGFjdCAN
Cj4gcGF0aCBidXQgSSdtIGd1ZXNzaW5nIHRoYXQgeW91J2xsIGhhdmUgdG8gY2hhbmdlIHRo
ZSBxZW11IGFyZ3VtZW50cyANCj4gcmVnYXJkaW5nIHRoZSBibG9jayBkZXZpY2UuDQo+IA0K
PiBBYm91dCB1c2VyZGF0YS5pbWcgSSB0aGluayBpdCdzIG5vcm1hbCBzaW5jZSBpbiB0aGUg
b2xkIGRheXMsIHRoZSBpbWFnZSANCj4gd2FzIGEgImVtcHR5IHNwYXJzZSBpbWFnZSIsIHRo
YXQgbWVhbnMsIGF0IHRoZSBmaXJzdCBmbGFzaGluZyBwcm9jZXNzLCANCj4gdGhlcmUgaXNu
J3QgdXNlcmRhdGEgaW5mb3JtYXRpb24sIHdlJ3JlIGp1c3QgImZsYXNoaW5nIHRoZSBwYXJ0
aXRpb24iIA0KPiB3aXRoIGVtcHR5IGRhdGEuDQo+IFRrcyEhIQ0KPiANCj4gDQo+IAkNCj4g
U28saW4gc2hvcnQgSSBzaG91bGQgY2hhbmdlIHRoZSBxZW11IGFyZ3VtZW50cyByZWdhcmRp
bmcgdGhlIGJsb2NrIA0KPiBkZXZpY2UuIEkgdHJpZWQgaW4gdGhpcyB3YXkgOg0KPiANCj4g
DQo+IHFlbXUtc3lzdGVtLWFhcmNoNjQgXA0KPiAgwqAgwqAgwqAgwqAgLXNtcCA0IFwNCj4g
IMKgIMKgIMKgIMKgIC1tIDIwNDggXA0KPiAgwqAgwqAgwqAgwqAgLWNwdSBjb3J0ZXgtYTcy
IFwNCj4gIMKgIMKgIMKgIMKgIC1NIHZpcnQgXA0KPiAgwqAgwqAgwqAgwqAgLWRldmljZSB2
aXJ0aW8tZ3B1LXBjaSx4cmVzPTEwMjQseXJlcz03NjggXA0KPiAgwqAgwqAgwqAgwqAgLWRp
c3BsYXkgc2RsLGdsPW9uIFwNCj4gIMKgIMKgIMKgIMKgIC1kZXZpY2UgdXNiLWVoY2kgXA0K
PiAgwqAgwqAgwqAgwqAgLWRldmljZSB1c2Ita2JkIFwNCj4gIMKgIMKgIMKgIMKgIC1kZXZp
Y2UgdmlydGlvLXRhYmxldC1wY2kgXA0KPiAgwqAgwqAgwqAgwqAgLXVzYiBcDQo+ICDCoCDC
oCDCoCDCoCAtc2VyaWFsIHN0ZGlvIFwNCj4gIMKgIMKgIMKgIMKgIC1rZXJuZWwgL21udC96
cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9JbWFnZSBcDQo+ICDCoCDCoCDCoCDCoCAtaW5p
dHJkIC9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXA0KPiAg
wqDCoMKgwqDCoMKgwqAgLWhkYSAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L2Jv
b3QuaW1nIFwNCj4gIMKgIMKgIMKgIMKgIC1oZGIgL21udC96cm9vdC0xMzMvX09TL0FuZHJv
aWQvcnBpNC9zeXN0ZW0uaW1nIFwNCj4gIMKgIMKgIMKgIMKgIC1oZGMgL21udC96cm9vdC0x
MzMvX09TL0FuZHJvaWQvcnBpNC92ZW5kb3IuaW1nIFwNCj4gIMKgIMKgIMKgIC1hcHBlbmQg
ImNvbnNvbGU9dHR5QU1BMCwzODQwMCBkcm0uZGVidWc9MHgwIHJvb3R3YWl0IHJvb3RkZWxh
eT01IA0KPiByb290PS9kZXYvbW1jYmxrMHAyIGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQg
DQo+IGFuZHJvaWRib290LnNlbGludXg9cGVybWlzc2l2ZSBzZWN1cml0eT1zZWxpbnV4IHNl
bGludXg9MSANCj4gYW5kcm9pZGJvb3QucWVtdS5ody5tYWlua2V5cz0wIGFuZHJvaWRib290
LmxjZC5kZW5zaXR5PTE2MCINCj4gDQo+IA0KPiBidXQgdGhlIGVycm9yIGlzIHN0aWxsIHRo
ZXJlLiBEbyB5b3Uga25vdyBzb21lIGRpZmZlcmVudCBhbHRlcm5hdGl2ZSANCj4gYmxvY2sg
ZGV2aWNlcyB0byB0cnkgPyB0aGFua3MuDQo+IA0KPiANCj4gLS0gDQo+IE1hcmlvLg0K
