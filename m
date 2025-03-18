Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3118610njb;
        Tue, 18 Mar 2025 11:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWocI6YZ2D6/PUELCGpKZIk96aWUJV5F3//Kazdi/NBBrUSCwDF3C5ZZrd2uIE6B0mhfv1ZvDKTLJwlIQ==@linaro.org
X-Received: by 2002:a17:903:22c6:b0:21f:7077:2aaf with SMTP id d9443c01a7336-225e0b0fc35mr235162815ad.44.1742321633672;
        Tue, 18 Mar 2025 11:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742321633; cv=none;
        d=google.com; s=arc-20240605;
        b=hw9GTtZKXzsssuzs9aPGmsNEgv1rqQLyJ7PNuAiWadJqEHH1F89tb2dMFqJdxOmu43
         LolIhs6Be8CGffmlh7C1bwfDrc/AXFxlRinDkPcd1e/4IForNJvRG0RTC/9VvrcH2+2V
         M6JQjwpoqYnXN2K5K7pRQoTiqQpEQtvXZyMpjnYMwzsW/FbIv4NcYKBJOYo7eo7uy08t
         Uk0yXrT8xvCNM3UzuW5Rp6kTz/9+NymtQk+z2DYjNE1Quu1n8/a+mTwFdy/omXsggxCx
         jMdyfxjJximI7ZGNstHQ1QS8HZCD4yBO9iwOpf89489yK+672VrCy30owW/i8zcMNWFL
         TbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lmUQbfDb36TKJU3sYGzcNnijG6zoXKkNnWbTZWel+Eg=;
        fh=LR6/TRzGqXQs0L7cXYibJjpWB6NZ4uN9v9droYApyW8=;
        b=ap0hPVtfngNfe2BO+xmPW4LM45Bd93P+XJ/zK4xvZsFuaVHWSgKGv4gQQsZMgluiFG
         DFtMym9AOWe53Z5OwKsf9UMPFKHkpqeYuNP5d5L0dXV/8ElzAZ4TWOA+dUPlKtKUoAKw
         IYAB2rcv196B//D8myfcPPNAOxQacwQrjgvFlmxDPc0AO4cUBP1xQGkge7ts14Gh1evA
         vf9w3/nT5GZNnH5f67i5AT7uJN/jvrs8RlHP6dlrD9vee3kIuLJO1+2uKeQ8b8uFbXcl
         jogJ47Xt3KOIa0Rl/bWQsAO8IiAyveBUrh+kDAYgEpqnPCY152SL4W+piwQZ6BgQOvAs
         PMCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N1sT/mjK";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116b3622sor6904050b3a.10.2025.03.18.11.13.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N1sT/mjK";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742321633; x=1742926433; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmUQbfDb36TKJU3sYGzcNnijG6zoXKkNnWbTZWel+Eg=;
        b=N1sT/mjK+JiZDfUXTrwVF43gDdNVaq2/gxtcEHPSOKs76/Qgc52tfe9xKsBFQHyZZE
         ukhQg08wF0PUPXCfk+Cx3q1rwiogq9P9pzTncsCEKKdYPVqkLfvocSH09WSgqxHFgOUt
         oT1i0Az9r5DKnrew1EDh43ZFc5vWjDkLzq2sxBekBhCxV2M6bUX883Xvxk1DLVVR3hqw
         LQFq5SKO3ff4G3moCN/ZZqbXyac7Wy1PJZ/RMa6/9yuLjrA0HSpJ/lk0HVWKuAELiheG
         EnLAz02Yo09+sCAt1HwNxQ6c0G8tlbsGKzLTWHVZ3OT8oAZVvLrY2OonstSGGaEfXbaD
         sIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742321633; x=1742926433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmUQbfDb36TKJU3sYGzcNnijG6zoXKkNnWbTZWel+Eg=;
        b=n2tktKJiOyIQ0mqh07h1JzXmk83c2V55A8drbTQSvEdeRsqJ1IsQT4w6bbjlDK3yed
         +UWZ7D8q0A56frkknOJUnh9fImZ5HTCuZrcXLqUSDjchMbCFNijKqqgMU888HhQVYsZe
         hbTLFL9lod3PVDJqCA3v2tI6OO8dcCVdxXZiNHqw9gY+i4WUWYY03jEJilRvGtxaWBlh
         Y9reM1t3mIKiHGGFhrfDdcPoI3CVlS6af+UVwZ7/i9XJeLy6/oTed0LlWW6gdFyv8PJy
         ZjIy1K6hirPr7o8GXiEXaCrWvN/io86KOfD8/99VecsADoR7EQCUWBKxhIL1jurmfLwe
         7cow==
X-Forwarded-Encrypted: i=1; AJvYcCUGtoCN4zG4Bq6HVhcGL2Ht5o9T+bFRUUbPAqBmGChC39X/UMhIPr40i+iO8i0GteoSfh/5r7zm4C3a5Q==@linaro.org
X-Gm-Message-State: AOJu0Ywhvqq1OLZx8QW3p9FDUGk1mXYOu5iEcuOI76g6wqPC5waDaYuG
	KCulZzl1cWdgwuDgu4OAcF1EMwgdaf0OsFoFUskafIF60JOsOXYuzhhlPHqR3ifmTg==
X-Gm-Gg: ASbGnctB0mxcPQ4qWovRUU7HRp6hq0vItne6wyuef5MAsJzAWEx+YSas62P3MjFHBJo
	MyhMaAkxdfL0VGQxG5sbFajXJ5tv8JpQOkDc2qSq4n3S5TiaJEtkRDv25iRcdCdmgw6xYUQi2nw
	KW32lLubOgpvrGdaMCcBaHP2YveHzIVPaJgJPCjWIwEvIPVCzPIemQNkgOM3PIShN73bfet2m8v
	aK8xqkBkbA9JVKfSJxzotHYysoap4fddmZvMYtt7pEZTZ3tap7s2jhAo2bRkESUqal0Why9MvvF
	R5Ynlfsx2EsRrewLqveoYDJxrzp2rdgV6uryO1wF4CU3vHiCxDRdHaua9A==
X-Google-Smtp-Source: AGHT+IGC4O6xkU9iAtNKj1qbqiWAy/fyUW5mk3mtgeMn6dcnh9ulFRbfkTwNDCZJfKmGVlCQn/E7NQ==
X-Received: by 2002:a05:6a00:4f92:b0:736:532b:7c10 with SMTP id d2e1a72fcca58-737223fccabmr22570526b3a.21.1742321633062;
        Tue, 18 Mar 2025 11:13:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm9939246b3a.167.2025.03.18.11.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:13:52 -0700 (PDT)
Message-ID: <8291b89a-9e97-47e6-9ee6-fd407066c3bf@linaro.org>
Date: Tue, 18 Mar 2025 11:13:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
 <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
 <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
 <a3b61916-2466-4ec8-a4e1-567581be7a2b@linaro.org>
 <CAFEAcA9jsFqD-BR+zTzWV1V92fJqpghaOrGq1rDcdidm=R94Pw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA9jsFqD-BR+zTzWV1V92fJqpghaOrGq1rDcdidm=R94Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Y+E7ywZzWZ5M

T24gMy8xOC8yNSAxMTowNiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gVHVlLCAxOCBN
YXIgMjAyNSBhdCAxNzo1MiwgUGllcnJpY2sgQm91dmllcg0KPiA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+DQo+PiBPbiAzLzE4LzI1IDEwOjUwLCBQZXRlciBN
YXlkZWxsIHdyb3RlOg0KPj4+IE9uIFR1ZSwgMTggTWFyIDIwMjUgYXQgMTc6NDIsIFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4+DQo+
Pj4+IE9uIDE4LzMvMjUgMDU6NTEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4+PiBE
aXJlY3RseSBjb25kaXRpb24gYXNzb2NpYXRlZCBjYWxscyBpbiB0YXJnZXQvYXJtL2hlbHBl
ci5jIGZvciBub3cuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4+Pj4gLS0tDQo+Pj4+PiAg
ICAgdGFyZ2V0L2FybS9jcHUuaCAgICB8IDggLS0tLS0tLS0NCj4+Pj4+ICAgICB0YXJnZXQv
YXJtL2hlbHBlci5jIHwgNiArKysrKysNCj4+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2FybS9jcHUuaCBiL3RhcmdldC9hcm0vY3B1LmgNCj4+Pj4+IGluZGV4IDUx
YjY0MjhjZmVjLi45MjA1Y2JkZWM0MyAxMDA2NDQNCj4+Pj4+IC0tLSBhL3RhcmdldC9hcm0v
Y3B1LmgNCj4+Pj4+ICsrKyBiL3RhcmdldC9hcm0vY3B1LmgNCj4+Pj4+IEBAIC0xMjIyLDcg
KzEyMjIsNiBAQCBpbnQgYXJtX2NwdV93cml0ZV9lbGYzMl9ub3RlKFdyaXRlQ29yZUR1bXBG
dW5jdGlvbiBmLCBDUFVTdGF0ZSAqY3MsDQo+Pj4+PiAgICAgICovDQo+Pj4+PiAgICAgdm9p
ZCBhcm1fZW11bGF0ZV9maXJtd2FyZV9yZXNldChDUFVTdGF0ZSAqY3B1c3RhdGUsIGludCB0
YXJnZXRfZWwpOw0KPj4+Pj4NCj4+Pj4+IC0jaWZkZWYgVEFSR0VUX0FBUkNINjQNCj4+Pj4+
ICAgICBpbnQgYWFyY2g2NF9jcHVfZ2RiX3JlYWRfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNwdSwg
R0J5dGVBcnJheSAqYnVmLCBpbnQgcmVnKTsNCj4+Pj4+ICAgICBpbnQgYWFyY2g2NF9jcHVf
Z2RiX3dyaXRlX3JlZ2lzdGVyKENQVVN0YXRlICpjcHUsIHVpbnQ4X3QgKmJ1ZiwgaW50IHJl
Zyk7DQo+Pj4+PiAgICAgdm9pZCBhYXJjaDY0X3N2ZV9uYXJyb3dfdnEoQ1BVQVJNU3RhdGUg
KmVudiwgdW5zaWduZWQgdnEpOw0KPj4+Pj4gQEAgLTEyNTQsMTMgKzEyNTMsNiBAQCBzdGF0
aWMgaW5saW5lIHVpbnQ2NF90ICpzdmVfYnN3YXA2NCh1aW50NjRfdCAqZHN0LCB1aW50NjRf
dCAqc3JjLCBpbnQgbnIpDQo+Pj4+PiAgICAgI2VuZGlmDQo+Pj4+PiAgICAgfQ0KPj4+Pj4N
Cj4+Pj4+IC0jZWxzZQ0KPj4+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBhYXJjaDY0X3N2ZV9u
YXJyb3dfdnEoQ1BVQVJNU3RhdGUgKmVudiwgdW5zaWduZWQgdnEpIHsgfQ0KPj4+Pj4gLXN0
YXRpYyBpbmxpbmUgdm9pZCBhYXJjaDY0X3N2ZV9jaGFuZ2VfZWwoQ1BVQVJNU3RhdGUgKmVu
diwgaW50IG8sDQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbiwgYm9vbCBhKQ0KPj4+Pj4gLXsgfQ0KPj4+Pj4gLSNlbmRpZg0KPj4+Pj4g
LQ0KPj4+Pj4gICAgIHZvaWQgYWFyY2g2NF9zeW5jXzMyX3RvXzY0KENQVUFSTVN0YXRlICpl
bnYpOw0KPj4+Pj4gICAgIHZvaWQgYWFyY2g2NF9zeW5jXzY0X3RvXzMyKENQVUFSTVN0YXRl
ICplbnYpOw0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2hlbHBlci5j
IGIvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4+Pj4gaW5kZXggYjQ2YjJiZmZjZjMuLjc3NGUx
ZWUwMjQ1IDEwMDY0NA0KPj4+Pj4gLS0tIGEvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4+Pj4g
KysrIGIvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4+Pj4gQEAgLTY1NjIsNyArNjU2Miw5IEBA
IHN0YXRpYyB2b2lkIHpjcl93cml0ZShDUFVBUk1TdGF0ZSAqZW52LCBjb25zdCBBUk1DUFJl
Z0luZm8gKnJpLA0KPj4+Pj4gICAgICAgICAgKi8NCj4+Pj4+ICAgICAgICAgbmV3X2xlbiA9
IHN2ZV92cW0xX2Zvcl9lbChlbnYsIGN1cl9lbCk7DQo+Pj4+PiAgICAgICAgIGlmIChuZXdf
bGVuIDwgb2xkX2xlbikgew0KPj4+Pj4gKyNpZmRlZiBUQVJHRVRfQUFSQ0g2NA0KPj4+Pg0K
Pj4+PiBXaGF0IGFib3V0IHVzaW5nIHJ1bnRpbWUgY2hlY2sgaW5zdGVhZD8NCj4+Pj4NCj4+
Pj4gICAgIGlmIChhcm1fZmVhdHVyZSgmY3B1LT5lbnYsIEFSTV9GRUFUVVJFX0FBUkNINjQp
ICYmIG5ld19sZW4gPCBvbGRfbGVuKSB7DQo+Pj4+DQo+Pj4NCj4+PiBUaGF0IHdvdWxkIGJl
IGEgZGVhZCBjaGVjazogaXQgaXMgbm90IHBvc3NpYmxlIHRvIGdldCBoZXJlDQo+Pj4gdW5s
ZXNzIEFSTV9GRUFUVVJFX0FBUkNINjQgaXMgc2V0Lg0KPj4+DQo+Pg0KPj4gV2UgY2FuIHRo
ZW4gYXNzZXJ0IGl0LCB0byBtYWtlIHN1cmUgdGhlcmUgaXMgbm8gcmVncmVzc2lvbiBhcm91
bmQgdGhhdC4NCj4gDQo+IFdlIGhhdmUgYSBsb3Qgb2Ygd3JpdGUvcmVhZC9hY2Nlc3MgZm5z
IGZvciBBQXJjaDY0LW9ubHkgc3lzcmVncywgYW5kDQo+IHdlIGRvbid0IG5lZWQgdG8gYXNz
ZXJ0IGluIGFsbCBvZiB0aGVtIHRoYXQgdGhleSdyZSBjYWxsZWQgb25seSB3aGVuDQo+IHRo
ZSBDUFUgaGFzIEFBcmNoNjQgZW5hYmxlZC4NCj4gDQo+PiBXZSBub3cgaGF2ZSBhbm90aGVy
IGNvbnZlcnNhdGlvbiBhbmQgc29tZXRoaW5nIHRvIGRlY2lkZSBpbiBhbm90aGVyDQo+PiBm
aWxlLCBhbmQgdGhhdCdzIHdoeSBJIGNob3NlIHRvIGRvIHRoZSBtaW5pbWFsIGNoYW5nZSAo
ImlmZGVmIHRoZQ0KPj4gaXNzdWUiKSBpbnN0ZWFkIG9mIHRyeWluZyB0byBkbyBhbnkgY2hh
bmdlLg0KPiANCj4gSSB0aGluayB3ZSBjYW4gZmFpcmx5IGVhc2lseSBhdm9pZCBpZmRlZmZp
bmcgdGhlIGNhbGxzaXRlIG9mDQo+IGFhcmNoNjRfc3ZlX25hcnJvd192cSgpLiBDdXJyZW50
bHkgd2UgaGF2ZToNCj4gICAqIGEgcmVhbCB2ZXJzaW9uIG9mIHRoZSBmdW5jdGlvbiwgd2hv
c2UgZGVmaW5pdGlvbiBpcyBpbnNpZGUNCj4gICAgIGFuIGlmZGVmIFRBUkdFVF9BQVJDSDY0
IGluIHRhcmdldC9hcm0vaGVscGVyLmMNCj4gICAqIGEgc3R1YiB2ZXJzaW9uLCBpbmxpbmUg
aW4gdGhlIGNwdS5oIGhlYWRlcg0KPiANCj4gSWYgd2UgZG9uJ3Qgd2FudCB0byBoYXZlIHRo
ZSBzdHViIHZlcnNpb24gd2l0aCBpZmRlZnMsIHRoZW4gd2UgY2FuDQo+IG1vdmUgdGhlIHJl
YWwgaW1wbGVtZW50YXRpb24gb2YgdGhlIGZ1bmN0aW9uIHRvIG5vdCBiZSBpbnNpZGUgdGhl
DQo+IGlmZGVmIChtYXRjaGluZyB0aGUgZmFjdCB0aGF0IHRoZSBwcm90b3R5cGUgaXMgbm8g
bG9uZ2VyIGluc2lkZQ0KPiBhbiBpZmRlZikuIFRoZSBmdW5jdGlvbiBkb2Vzbid0IGNhbGwg
YW55IG90aGVyIGZ1bmN0aW9ucyB0aGF0IGFyZQ0KPiBUQVJHRVRfQUFSQ0g2NCBvbmx5LCBz
byBpdCBzaG91bGRuJ3QgYmUgYSAibm93IHdlIGhhdmUgdG8gbW92ZQ0KPiA1MCBvdGhlciB0
aGluZ3MiIHByb2JsZW0sIEkgaG9wZS4NCj4gDQoNCkknbGwgdHJ5IHRvIGp1c3QgbGV0IHRo
ZSBjYWxsIGJlIGRvbmUsIGFuZCBzZWUgd2hhdCBoYXBwZW5zLg0KQnV0IGlmIEkgbWVldCBh
IHJlZ3Jlc3Npb24gc29tZXdoZXJlIGluIHRhcmdldC9hcm0vKiwgSSdsbCBzaW1wbHkNCmxl
dCB0aGUgY3VycmVudCBpZmRlZiBmb3Igbm93Lg0KDQpJIHVuZGVyc3RhbmQgaXQgInNob3Vs
ZCBiZSBvayIsIGJ1dCBJIGp1c3Qgd2FudCB0byBmb2N1cyBvbiBody9hcm0sIGFuZCANCm5v
dCBzdGFydCBmdXJ0aGVyIGNoYW5nZXMgaW4gdGFyZ2V0L2FybS9oZWxwZXIuYyBhcyBhIHNp
ZGUgZWZmZWN0IG9mIA0Kc2ltcGx5IG1vdmluZyBhbiBpZmRlZiBpbiBhIGhlYWRlci4NCg0K
PiB0aGFua3MNCj4gLS0gUE1NDQoNCg==
