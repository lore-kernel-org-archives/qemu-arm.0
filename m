Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1192629njc;
        Thu, 20 Mar 2025 12:36:28 -0700 (PDT)
X-Received: by 2002:a17:902:d2d0:b0:224:1001:677c with SMTP id d9443c01a7336-22780c526b7mr7668665ad.9.1742499387908;
        Thu, 20 Mar 2025 12:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499387; cv=none;
        d=google.com; s=arc-20240605;
        b=alo2p2zeQ8ZsyDjUH53hgA/P3aUc4vrjZR6nOEsJjGZR4wC87QYfrX25PxJP25qhBk
         WpVLcAxWB7Y0JW5MhGCCSwcKKUqHb3Pm03rtMSp2c0nd0mPJnk07q93IP26t/Ia4Ddx3
         llBxqXJT85l1b5mbQL0tpxTSJe5t/LGJaB1hc9c8UXfFSZNqXOwxA635CScyDyxddpaX
         BU62PazbU5+s1hv7IjtZ6oFJyxIlKA95FX4VI5kbGOvkIzItjTb4h0s97jgUX1qxcYaK
         UzenssOsHFjFSPMkrV6Ua/a1rrSsR2Ki2jt862SFNgkKiXBhVtxO4D1SKiU17Kb5Ypwc
         YhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TpF7et11Cx87OlsvQUvvY3RH1yF9ugGZeGJrN3A7upI=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=LZ9m1JX98BUR8LcpawVuzB2+C28SeJVAh5+BxJI801w3fN7nV/EqnRvxTsWZn5N87j
         jqTd/sG4oGZSj+NbjqiAhpMaaVzrI8CWIaA4Ia1acXkRoN/l7XhymHzVhkG/Js6R0iZy
         OH0XqfYh7pZXiTUYHdbVu0Gxb5uGVV2FQuLp2R6r4j8MN4co7BJScavJvj9SKdD5Ir4k
         44+GscwGg/+0pSI8BhYpsue/yHg2k0EYCR+7lsQKdzqu0SOl4GppnnJxB70i2bWvqVP+
         PvfaRVq/31Eb1GJBHxLdW+y45ns+bgpntytJ715kFc5IevGoAez/tUo7kPhiL6D70HGf
         +Udg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3by2oIK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811d59a9sor2157005ad.17.2025.03.20.12.36.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3by2oIK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499387; x=1743104187; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpF7et11Cx87OlsvQUvvY3RH1yF9ugGZeGJrN3A7upI=;
        b=J3by2oIKFxsy6qRHqVMxUEBnfKUX5qkBPLIAVT5qktIYn7GpcWXtlTnqSri+cLjACq
         NFtkgaDIKEcAvzjKnBcJPxLQRF9iVPMpElttTG2DMdsWqsMniJ86GPmuTAnvwnpGNUVr
         fdJ9TS2pSPAOWtJdbFinduGDhD8d0n/Dx3R9YimSE2nweQRds//JqlhYfpMdsNv+9/lB
         +oP7DREhTz3C+MJd3kPa1rfKlXaKPqWXhZo2daFl9kpeoxDT3LeJqwHMdExrge6VYAeQ
         V8TAVGRsKgraAaC3uQVg1h/DEZeDLZl8s6vGqKQM234ELJpeDpNAYWIf8ijnX8w+zJeo
         msyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499387; x=1743104187;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpF7et11Cx87OlsvQUvvY3RH1yF9ugGZeGJrN3A7upI=;
        b=k7PAbHfdaVaZDbROBmHYGpBlhfZFxcdGKJgSCuHz5Im//ank9u6idiLScQw0M4SBFk
         OVKcmysIhpXEIcnlRH9kfjiqedWHAhbM7exileSnuahnEacaFnV6BD10XT0MizYBO0vA
         G2/TjbCbAQWDjwDFRyeHBgJEnDAaSxay/PMHQ9kNafzO/N7Q+49yENEE12jcb9dJLevI
         UvJc96Nb9CVqIW6JMXY4kTcLa1zArWOVD4eMabLitmpP8I9AU6vKssn0O6cOhuwNUYen
         HRGnYh+N2w1apY3qPHSzRFevqXVIjoKsB/mhd6rusbv3sgu5GCepyL1c6SDma8mOvosr
         plLg==
X-Gm-Message-State: AOJu0YzC8ylwYYyt/J3Xf1vUqPA5nd+mr2j7qs7nY+XK2ExPrIE59Mps
	4pM+BcSvqkji6f7zopqFHi0XCJXPaxoE5u++lQ9CRYYVkiGllDl4e5fQg0anjksPkejF7TEwJS7
	RUrU=
X-Gm-Gg: ASbGncvNZ1pnKswQJljw8OYHol1VxnLDR9XnHBBYQA4tl4m48DJdMPwuZ3z85bijotW
	ABOf81H1wP7nE3LLo8DzuCWwn6mtUxqXU8tRZTm4O7c3f8pq3bLHhXs1kliCNyjcZEY2g90/oV9
	iF5X5TvtAs3+MilCWWYgGNFoXE3hyzNZCXQKAr/bo0puZ4Yvmm9tqgy2x+G1HcvvelPW8iqZ9H/
	q8lmzbxps708xEgdIKlMrmnDl8yS4KFIoz0U/c0BY3jc2nqksuVe18uNgyIp6fj5BI97yTL8b8o
	78EQbb3U39dEVrcaeH0f+vnyBhVQ3rmyZKJ/HTZPGgAhhnPifUSt0Z8p/w==
X-Google-Smtp-Source: AGHT+IGqeJgxmMwaHS8+WqPUmMVg89q9mOSC8W6m260dbGfzpYHHaXHnXB8h73kdnlitnTRbkYvI8A==
X-Received: by 2002:a17:903:2348:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22780d787a0mr7339645ad.18.1742499387333;
        Thu, 20 Mar 2025 12:36:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f14dfsm1691635ad.220.2025.03.20.12.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:36:26 -0700 (PDT)
Message-ID: <1bc5463d-1e37-4a92-b43d-2d4b61cc19ff@linaro.org>
Date: Thu, 20 Mar 2025 12:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
 <2c441f75-8fd8-4792-a4e4-1ae7c78754ba@linaro.org>
In-Reply-To: <2c441f75-8fd8-4792-a4e4-1ae7c78754ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 5BeElykRFTZd

T24gMy8yMC8yNSAxMjozMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gMy8xOS8y
NSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4gVGhlIGN1cnJlbnQgaGVscGVyLmgg
ZnVuY3Rpb25zIHJlbHkgb24gaGFyZCBjb2RlZCBhc3N1bXB0aW9ucyBhYm91dA0KPj4gdGFy
Z2V0IGVuZGlhbmVzcyB0byB1c2UgdGhlIHRzd2FwIG1hY3Jvcy4gV2UgYWxzbyBlbmQgdXAg
ZG91YmxlDQo+PiBzd2FwcGluZyBhIGJ1bmNoIG9mIHZhbHVlcyBpZiB0aGUgdGFyZ2V0IGNh
biBydW4gaW4gbXVsdGlwbGUgZW5kaWFuZXNzDQo+PiBtb2Rlcy4gQXZvaWQgdGhpcyBieSBn
ZXR0aW5nIHRoZSB0YXJnZXQgdG8gcGFzcyB0aGUgZW5kaWFuZXNzIGFuZCBzaXplDQo+PiB2
aWEgYSBNZW1PcCBhbmQgZml4aW5nIHVwIGFwcHJvcHJpYXRlbHkuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPj4gLS0t
DQo+PiAgICBpbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmggfCAzMCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAgIGdkYnN0dWIvZ2Ric3R1Yi5jICAgICAgICAgICB8
IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNTIg
aW5zZXJ0aW9ucygrKQ0KPj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZ2Ric3R1
Yi9yZWdpc3RlcnMuaA0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2dkYnN0dWIvcmVn
aXN0ZXJzLmggYi9pbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmgNCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi40YWJjN2E2YWU3DQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9pbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmgNCj4+IEBAIC0w
LDAgKzEsMzAgQEANCj4+ICsvKg0KPj4gKyAqIEdEQiBDb21tb24gUmVnaXN0ZXIgSGVscGVy
cw0KPj4gKyAqDQo+PiArICogQ29weXJpZ2h0IChjKSAyMDI1IExpbmFybyBMdGQNCj4+ICsg
Kg0KPj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQo+
PiArICovDQo+PiArDQo+PiArI2lmbmRlZiBHREJfUkVHSVNURVJTX0gNCj4+ICsjZGVmaW5l
IEdEQl9SRUdJU1RFUlNfSA0KPj4gKw0KPj4gKyNpbmNsdWRlICJleGVjL21lbW9wLmgiDQo+
PiArDQo+PiArLyoqDQo+PiArICogZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZSgpIC0gZ2V0IHJl
Z2lzdGVyIHZhbHVlIGZvciBnZGINCj4+ICsgKiBtbzogc2l6ZSBhbmQgZW5kaWFuIE1lbU9w
DQo+PiArICogYnVmOiBHQnl0ZUFycmF5IHRvIHN0b3JlIGluIHRhcmdldCBvcmRlcg0KPj4g
KyAqIHZhbDogcG9pbnRlciB0byB2YWx1ZSBpbiBob3N0IG9yZGVyDQo+PiArICoNCj4+ICsg
KiBUaGlzIHJlcGxhY2VzIHRoZSBwcmV2aW91cyBsZWdhY3kgcmVhZCBmdW5jdGlvbnMgd2l0
aCBhIHNpbmdsZQ0KPj4gKyAqIGZ1bmN0aW9uIHRvIGhhbmRsZSBhbGwgc2l6ZXMuIFBhc3Np
bmcgQG1vIGFsbG93cyB0aGUgdGFyZ2V0IG1vZGUgdG8NCj4+ICsgKiBiZSB0YWtlbiBpbnRv
IGFjY291bnQgYW5kIGF2b2lkcyB1c2luZyBoYXJkIGNvZGVkIHRzd2FwKCkgbWFjcm9zLg0K
Pj4gKyAqDQo+PiArICogUmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gdG8g
dGhlIGFycmF5Lg0KPj4gKyAqLw0KPj4gK2ludCBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1l
bU9wIG9wLCBHQnl0ZUFycmF5ICpidWYsIHVpbnQ4X3QgKnZhbCk7DQo+PiArDQo+PiArI2Vu
ZGlmIC8qIEdEQl9SRUdJU1RFUlNfSCAqLw0KPj4gKw0KPj4gKw0KPj4gZGlmZiAtLWdpdCBh
L2dkYnN0dWIvZ2Ric3R1Yi5jIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4+IGluZGV4IDI4MmUx
M2UxNjMuLjNkN2IxMDI4ZTQgMTAwNjQ0DQo+PiAtLS0gYS9nZGJzdHViL2dkYnN0dWIuYw0K
Pj4gKysrIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4+IEBAIC0zMiw2ICszMiw3IEBADQo+PiAg
ICAjaW5jbHVkZSAiZXhlYy9nZGJzdHViLmgiDQo+PiAgICAjaW5jbHVkZSAiZ2Ric3R1Yi9j
b21tYW5kcy5oIg0KPj4gICAgI2luY2x1ZGUgImdkYnN0dWIvc3lzY2FsbHMuaCINCj4+ICsj
aW5jbHVkZSAiZ2Ric3R1Yi9yZWdpc3RlcnMuaCINCj4+ICAgICNpZmRlZiBDT05GSUdfVVNF
Ul9PTkxZDQo+PiAgICAjaW5jbHVkZSAiYWNjZWwvdGNnL3ZjcHUtc3RhdGUuaCINCj4+ICAg
ICNpbmNsdWRlICJnZGJzdHViL3VzZXIuaCINCj4+IEBAIC00NSw2ICs0Niw3IEBADQo+PiAg
ICAjaW5jbHVkZSAic3lzdGVtL3J1bnN0YXRlLmgiDQo+PiAgICAjaW5jbHVkZSAiZXhlYy9y
ZXBsYXktY29yZS5oIg0KPj4gICAgI2luY2x1ZGUgImV4ZWMvaHdhZGRyLmgiDQo+PiArI2lu
Y2x1ZGUgImV4ZWMvbWVtb3AuaCINCj4+ICAgIA0KPj4gICAgI2luY2x1ZGUgImludGVybmFs
cy5oIg0KPj4gICAgDQo+PiBAQCAtNTUxLDYgKzU1MywyNiBAQCBzdGF0aWMgaW50IGdkYl93
cml0ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3B1LCB1aW50OF90ICptZW1fYnVmLCBpbnQgcmVn
KQ0KPj4gICAgICAgIHJldHVybiAwOw0KPj4gICAgfQ0KPj4gICAgDQo+PiArLyoNCj4+ICsg
KiBUYXJnZXQgaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgdmFsdWUgaW50byBHQnl0ZUFycmF5
LCB0YXJnZXQNCj4+ICsgKiBzdXBwbGllcyB0aGUgc2l6ZSBhbmQgdGFyZ2V0IGVuZGlhbmVz
cyB2aWEgdGhlIE1lbU9wLg0KPj4gKyAqLw0KPj4gK2ludCBnZGJfZ2V0X3JlZ2lzdGVyX3Zh
bHVlKE1lbU9wIG9wLCBHQnl0ZUFycmF5ICpidWYsIHVpbnQ4X3QgKnZhbCkNCj4+ICt7DQo+
PiArICAgIHNpemVfdCBieXRlcyA9IG1lbW9wX3NpemUob3ApOw0KPj4gKw0KPj4gKyAgICBp
ZiAob3AgJiBNT19CU1dBUCkgew0KPj4gKyAgICAgICAgZm9yICggaW50IGkgPSBieXRlcyA7
IGkgPiAwOyBpLS0pIHsNCj4+ICsgICAgICAgICAgICBnX2J5dGVfYXJyYXlfYXBwZW5kKGJ1
ZiwgJnZhbFtpIC0gMV0sIDEpOw0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAgfSBlbHNlIHsN
Cj4+ICsgICAgICAgIGdfYnl0ZV9hcnJheV9hcHBlbmQoYnVmLCB2YWwsIGJ5dGVzKTsNCj4+
ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gYnl0ZXM7DQo+PiArfQ0KPj4gKw0KPj4g
Kw0KPj4gICAgc3RhdGljIHZvaWQgZ2RiX3JlZ2lzdGVyX2ZlYXR1cmUoQ1BVU3RhdGUgKmNw
dSwgaW50IGJhc2VfcmVnLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2RiX2dldF9yZWdfY2IgZ2V0X3JlZywgZ2RiX3NldF9yZWdfY2Igc2V0X3JlZywNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IEdEQkZlYXR1cmUg
KmZlYXR1cmUpDQo+IA0KPiBJdCBjb3VsZCBiZSBwcmVmZXJhYmxlIHRvIHNldCBidWYgd2l0
aCB0aGUgdmFsdWUsIGluc3RlYWQgb2Ygc2ltcGx5DQo+IGFwcGVuZGluZyB0aGUgdmFsdWUu
IFRoaXMgd2F5LCB0aGVyZSBpcyBubyBuZWVkIHRvIHJldHVybiB0aGUgc2l6ZSwgYXMNCj4g
aXQncyBjb250YWluZWQgaW4gYnVmZmVyIHNpemUgaXRzZWxmLg0KPiANCj4gSWYgd2UgaW5z
aXN0IG9uIHJldHVybmluZyB0aGUgc2l6ZSwgaXQncyBiZXR0ZXIgdG8gbWFrZSBpdCBhIHBh
cmFtZXRlcg0KPiAoYW5kIHVzZSBhIHZvaWQgcGFyYW1ldGVyIHR5cGUpLCBiZWNhdXNlIGF0
IHRoZSBtb21lbnQsIGl0IGdpdmVzIHRoZQ0KPiBpbXByZXNzaW9uIHRoZSBmdW5jdGlvbiBp
dHNlbGYgcmV0dXJucyB0aGUgdmFsdWUsIHdoaWNoIG1heSBiZSBjb25mdXNpbmcuDQoNClNl
ZW1zIGxpa2UgaXQncyB0aGUgZXhpc3RpbmcgY29udmVudGlvbiB0aHJvdWdoIA0KZ2RiX3Nl
dF9yZWdfY2IvZ2RiX2dldF9yZWdfY2IsIHNvIHdlIGhhdmUgdG8gZm9sbG93IHRoaXMuDQo=
