Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp936591njm;
        Wed, 5 Mar 2025 08:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjPpeIsN76lbjXKllD1CMMS5+SYbJsdcvd9VUjB3DbLnZg37SK5dvRRU5aUH9ZkHydtyiEwQ5lrKS+NQ==@linaro.org
X-Received: by 2002:a17:903:32cd:b0:223:2c7b:2cf7 with SMTP id d9443c01a7336-223f1d404bfmr46095715ad.51.1741193550237;
        Wed, 05 Mar 2025 08:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193550; cv=none;
        d=google.com; s=arc-20240605;
        b=aEjav9lA8T8FRo08rBhWVcMA5poOi5jE9TEp0rK56wyYUd2oKTMWSlwmGehktrnb99
         q2rX8G2k+VYi8mFmHbxITc2G/D74v/ksH3UqhkNoP9TVEWqw+cMT+y4y1mevEn6iSmao
         PtlyZxl6GIDzqJJNkL7W42/FbJkHBYpxEHflF9m1sRDEwd267PE0Hvx/qyIIXcmiisLs
         7WpsajUplCs4LMwN4CEoRSm1QCno8YQza+Zm0ParStBFH7mAmIRp5eRMgVO7I+hz+RHZ
         jlJlyazSwNwTJCfkXAnXiXNN0jFhXZjveVjJR0a2v4fbhpXZLoGIMlr/8r58R6aSG9IA
         rqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Gm/+QPCZu1UmTd5EB4JJzZIhgR34GrlUDa94v6dTbV0=;
        fh=3VMhn7VeCe2tZP04cM34vvdbXGR0QoV3v0tvAlcKRbI=;
        b=H9BYxFv81z2r09ii6KxIq2VMX5QjNurVpF147jUSo2RBBbe/CLU5EeWmmuvQ+NoidE
         7l1DbhACW/zgiSv0T8R2Yl3/T9xj4JolIwGlKbnfYfb9wjzg0YTaafwhzg1RnNAxMjOm
         RHWn5FQ7tnlRU8kij8w/OQrr5u2yrNNGGvBJCvsnY/4Q8f1tB2aQT2VwgFP4JwS/759B
         9Qk9RuLg9f8W0xj0/LxwfbixuKGAAeX2jVKZnAKoYyn3EcltKujL50pKWmR0TpxaTHSn
         6xD3rKF+qeyaFevyeFfQc1sGn3ByLSnW8cw1VXVMAIBfGdQBUBhlTol7KdF2BTKLasE3
         Aujg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I8K4PX4y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22405a8c0b6sor3911245ad.4.2025.03.05.08.52.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I8K4PX4y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193550; x=1741798350; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/+QPCZu1UmTd5EB4JJzZIhgR34GrlUDa94v6dTbV0=;
        b=I8K4PX4y5rO9KesFyPiky3yUZqx7x6dRDOvOi3kBzMpvUreEMM6m17/PlZqQeV9jP3
         /tl4B19/gREc9jej9ygMZN3JzypclBDBU8dL+zCEZqNJAkC+75MIW4h9ei6a3vUwz5YP
         8iEOJldtG64LZqtYmpbOtEag91wnzNaFpwui7TYu3YWxzgwRdSQ2zqOkXBZnuRuF5gEf
         pecacG1Imc5lpXKFjRXHyu5Zwq5brgRMTlWaQr9FRWZuTFCb1Z/ykG53Sv4aHA6SMNcN
         4h0QnIoXP8Yw+beyg+VcTb7CAq6ufAcSwFEfmvJS8PSCC2vLB3NabTRVCq7QAk20rlvp
         T31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193550; x=1741798350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/+QPCZu1UmTd5EB4JJzZIhgR34GrlUDa94v6dTbV0=;
        b=qNYed555T7wlNW8g8hBVOwVgRQ/kppsAJk0iuql/0b44IS5oUMAgtx1j55St56YNBH
         rgRiHaCc12dh5XM/V1aBZVTLwydxzJfi+TdhYRHkLBHjrL8q39EtWaSD4FARoMGIaXwi
         KY0j+b1dGAzG1u8Bh1rjmFSpJ2juyyrDKJqRnqCfX34SzT9L0UyPs/L+8eRPHv6QSZU1
         bgyuKyNmh1aKJWFdkEXi37nNgOBFtR/t83WLmHveKFv5flyiBUdEb/y8mRoQZ7cGfaib
         tz4c+E0MNcIM+0Rjo/WVIPE7xGL+YI2rSntlPDccgnxzYfxjyqeHZrMFmQDbGarOErRH
         0jBg==
X-Forwarded-Encrypted: i=1; AJvYcCXAmyHzlbakV/70BipWrRFw8LupfeI5wMuKIdc8ZvKM+qiZxPAtSrADbVy6CuHDQj3HjOjUQUml5JERxQ==@linaro.org
X-Gm-Message-State: AOJu0YzmG62QGQ10YJ9p8QuBVcjNNgupPfjXBud5ZBjFwo8eRDOjSmLe
	gXab0SHQrSlEL+prC7zO/em06TQxuyxSlpl5fQqfZp/3czj0zfiF3oKVYnG0MvZKaA==
X-Gm-Gg: ASbGnctp3a7sItiQsDfVZAxDix2xrTO6A3kBR3ERt8VWc3jHASwoDMaCZxQxJLfsmdU
	Br3VbrtRW9N8W+IxWSV0xRwam710IDQn/ppBYjMX/rq9dq9gI7Hk6LnhUy9L5l6WQOxALCBKtPF
	dsIN/laA/IPs0AqWwtbqVuMdVZyv+g0Fln3p+LuZlOPK3gamtg8j3kk3LCmSBpcdwJdKO4Z2yF6
	WPjHvJ0b5EDBRM7/y5j/LggbX9kpodpKNOjavC3r4viYTdEmnsao7hMWM1jrHBKFUeDoMegr3Tb
	Y6zDtcm/pT4R+i9i+RtOTFhuBE3zqJmur6b4Se/z1tZN1c2YmRDIC+NpBQ==
X-Google-Smtp-Source: AGHT+IHUQLN+UE66LLyb9QL2RLG/E5/qamim3O0wvOh7yEsA/jhb7guLXbnLCgDJ9OvHWSIxqB8IoQ==
X-Received: by 2002:a17:902:d48c:b0:21f:81f4:21b8 with SMTP id d9443c01a7336-223f1d3bf88mr45170625ad.50.1741193549733;
        Wed, 05 Mar 2025 08:52:29 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223ff94dc8bsm7617555ad.2.2025.03.05.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:52:29 -0800 (PST)
Message-ID: <a0a8faf3-5ab0-4b9d-9517-1aff3b7cdaaf@linaro.org>
Date: Wed, 5 Mar 2025 08:52:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/4] hw/ppc: Remove TARGET_PPC64 use in
 ppc_create_page_sizes_prop()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250305161248.54901-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: IfEBa7/yTGJR

T24gMy81LzI1IDA4OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gQ2hl
Y2sgdGhlIGJpbmFyeSBpcyBidWlsdCBmb3IgNjQtYml0IFBQQyBhdCBydW50aW1lLA0KPiBy
ZW1vdmluZyB0aGUgbmVlZCBmb3IgVEFSR0VUX1BQQzY0ICNpZmRlZidyeS4NCj4gDQoNClNh
bWUgZ29lcyBoZXJlLCB3ZSB3YW50IGEgdGFyZ2V0X2lzX3BwYzY0KCkgZnVuY3Rpb24uDQpB
cyB3ZWxsLCBtb2RpZnlpbmcgaHcvcHBjIHN0dWZmIHNob3VsZCBiZSBpbiBhbiBpbmRlcGVu
ZGVudCBzZXJpZXMgDQppZGVhbGx5LCB0byBrZWVwIGl0IG1vcmUgY2xlYXIuDQoNCj4gU2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3Jn
Pg0KPiAtLS0NCj4gICBody9wcGMvZmR0LmMgfCA1ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9ody9wcGMvZmR0LmMgYi9ody9wcGMvZmR0LmMNCj4gaW5kZXggMDgyOGFkNzI1NDguLmJh
ZTI2OWM3MmFjIDEwMDY0NA0KPiAtLS0gYS9ody9wcGMvZmR0LmMNCj4gKysrIGIvaHcvcHBj
L2ZkdC5jDQo+IEBAIC04LDEyICs4LDEyIEBADQo+ICAgICovDQo+ICAgDQo+ICAgI2luY2x1
ZGUgInFlbXUvb3NkZXAuaCINCj4gKyNpbmNsdWRlICJxZW11L2xlZ2FjeV9iaW5hcnlfaW5m
by5oIg0KPiAgICNpbmNsdWRlICJ0YXJnZXQvcHBjL2NwdS5oIg0KPiAgICNpbmNsdWRlICJ0
YXJnZXQvcHBjL21tdS1oYXNoNjQuaCINCj4gICANCj4gICAjaW5jbHVkZSAiaHcvcHBjL2Zk
dC5oIg0KPiAgIA0KPiAtI2lmIGRlZmluZWQoVEFSR0VUX1BQQzY0KQ0KPiAgIHNpemVfdCBw
cGNfY3JlYXRlX3BhZ2Vfc2l6ZXNfcHJvcChQb3dlclBDQ1BVICpjcHUsIHVpbnQzMl90ICpw
cm9wLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgbWF4
c2l6ZSkNCj4gICB7DQo+IEBAIC0yMSw2ICsyMSw4IEBAIHNpemVfdCBwcGNfY3JlYXRlX3Bh
Z2Vfc2l6ZXNfcHJvcChQb3dlclBDQ1BVICpjcHUsIHVpbnQzMl90ICpwcm9wLA0KPiAgICAg
ICBpbnQgaSwgaiwgY291bnQ7DQo+ICAgICAgIHVpbnQzMl90ICpwID0gcHJvcDsNCj4gICAN
Cj4gKyAgICBhc3NlcnQobGVnYWN5X2JpbmFyeV9pc182NGJpdCgpKTsNCj4gKw0KPiAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgUFBDX1BBR0VfU0laRVNfTUFYX1NaOyBpKyspIHsNCj4gICAg
ICAgICAgIFBQQ0hhc2g2NFNlZ21lbnRQYWdlU2l6ZXMgKnNwcyA9ICZjcHUtPmhhc2g2NF9v
cHRzLT5zcHNbaV07DQo+ICAgDQo+IEBAIC00Niw0ICs0OCwzIEBAIHNpemVfdCBwcGNfY3Jl
YXRlX3BhZ2Vfc2l6ZXNfcHJvcChQb3dlclBDQ1BVICpjcHUsIHVpbnQzMl90ICpwcm9wLA0K
PiAgIA0KPiAgICAgICByZXR1cm4gKHAgLSBwcm9wKSAqIHNpemVvZih1aW50MzJfdCk7DQo+
ICAgfQ0KPiAtI2VuZGlmDQoNCg==
