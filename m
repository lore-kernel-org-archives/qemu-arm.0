Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp313908njl;
        Tue, 1 Oct 2024 09:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4a2RgPhnjkT3AZaxFLAC/583X1AuagblKnzbBeDkcDNcZ28u/+rP1w2Q1BEC6noQj+tI0FK4rqdFDSQ==@linaro.org
X-Received: by 2002:a05:6a00:a14:b0:710:da27:f176 with SMTP id d2e1a72fcca58-71dc5c6723cmr471532b3a.12.1727801195201;
        Tue, 01 Oct 2024 09:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801195; cv=none;
        d=google.com; s=arc-20160816;
        b=UgOX9GFHo1e9pxNY73nT5BsrdqwPk+7wh936N8UeGr8NxxL1miQZLyQzIFq4aXxMTG
         ZrVF5PoQrNxu6F3XhKVz/SpEoh3oz7LKiBa0nAJVoSo6aaaDt9Cvr5LLKl+azdYJ54gq
         DLh7m6hr5RrmQD+YwgD4XyHrDvtrpDIeDVZi9qDG5M3TXgrU4rLPTIMeWUKvQLKviemY
         zkpHOEU34sZ1xEpXUQPMpQQolrJgL4N3ohLElCAh40KfSpkHu+d5iOCa1CTa1hk9TEJJ
         6rYSlmD6fyt2WsE3Swbe2FlOdKJA3Y6Hul2lU4ZpbXJv84or/yjC2Mf58qcuD90j1/OG
         n2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fHyj2FFOIINO6gGnWney9CosK6M1zsGXyXPICUa4uV4=;
        fh=yh38PpwRlcNhxBCC6pgX461J941M/j1srbF072TIdmw=;
        b=JPsps2FyDgEKl2fs3WVIkSVZeKEKJcgzVCKwc8zUJvEWzjdEFqcZ3c4MrN2eG6RUv6
         N2Kv0x0LCyTLKQl1U3N4Lf78X88CQAuPVxboEXnwp8qJ2LmdEqZ3qShxQn0m8pJAXLIT
         yQ038s0BwtZXK3FFea0xD9kPad7BmgMTQzlB3vWavi0obZCul5DBcG51w3R8ZGESv+kS
         PKwByXSq8Sy2IrAqwG60tBPlS9kkccJsiz3drsBMKQe2Bq1iPK5tTjvmsS+BAOS7tyBj
         H0FjWQHe1vLR6XxPtj7iSM08og+34/EfcY2mcxzOnXqe18sZ3205xpL60N097PYYeQOL
         Oa0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF18P2kt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71b26301fb5sor8114589b3a.0.2024.10.01.09.46.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:46:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sF18P2kt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801194; x=1728405994; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHyj2FFOIINO6gGnWney9CosK6M1zsGXyXPICUa4uV4=;
        b=sF18P2ktAA5WSavB9+jT57iOJUzdf8IbZvuMpqxh1MPzuGUr5Z97AcQeUBLz1vMGJe
         zEE8abb3USEPpLkBwDntoVg/dC4uIbwbbfKejCyOGNZvsm+ZgH9t5Zx4e9CZtGjbtz32
         UdqZFsdzUABFmHL0n104lp4PPW7aiySs8HOqT0wWJOQhic76SgHeAXL4m+B0iMllaNJw
         4dGsXCBjHVg4rgOCDPKVr7V1BEBeq6hOn7zWc0m5SY2rfAT6iJ8JCOE3Mp0z0DEdrsHX
         i4zArCY64YlI00KIHkqw4VJ5AadqfQpvwYf7j1VOJbBe3AW9O0k+bEHRWJl5sLLO7m2f
         6F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801194; x=1728405994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHyj2FFOIINO6gGnWney9CosK6M1zsGXyXPICUa4uV4=;
        b=TPTXH1hgfPiSKvaFwLTxPvTY01cW6FjD4wD1CSDCtyZQbg7Jy7WkWwGhQnpjqBlTwe
         3zYpEAl1BOC3JdCL1BcSDJbmDrSulMAWDAdOSWnveKw7+YU/fkl8TfQ6ncRl/DOsPIsP
         dDjTO8lmdTz8G5zh3y1Wz4EbQpSyMwvadNCmDFTdbgZRHzQoreBF/UBk3LKQhzbb0Zyl
         tyAurG59a7b370JlCPEh2j5KLCF86Mn2iPwmCFerIj3vhp9lrPUpLXny0YcWz65srv4t
         D4WwevlREuUZ0EQB/gK2o85ePmgRBI0EebNOl4cF1cEn3AEj86ZX6Og48jBlk8sg6aFb
         /rPw==
X-Forwarded-Encrypted: i=1; AJvYcCWuERZFQIwIbySnVC/2SGQBBpIUIS9PNIMQOarzjjRIn/6mdXiqJ8bwDl8K2+MtD9nGvTKAUog7Ff3GQQ==@linaro.org
X-Gm-Message-State: AOJu0YxzFHxsp15Hya77G5J3jFaQnNit0aZfzpsGUc2xMLIfIlGs3kpE
	1G7/G89ZKp+qsuHBTLJUSiVw6nUY+oeVu7xtmbQqQ0iB2tqsuF44tpocCjntAOmoWQ==
X-Google-Smtp-Source: AGHT+IGyCuGVJnzo/jZ1tIrm847oeGhcLTbht+8BIkGtXGWbZ9STlsZba8oEg8XEOGdD3gZuKJ9ing==
X-Received: by 2002:a05:6a00:889:b0:714:2198:26bd with SMTP id d2e1a72fcca58-71dc5c67060mr501653b3a.11.1727801194622;
        Tue, 01 Oct 2024 09:46:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649f879sm8247606b3a.22.2024.10.01.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:46:34 -0700 (PDT)
Message-ID: <b2413aa8-40ae-4174-85ab-3a4be3e3b9e2@linaro.org>
Date: Tue, 1 Oct 2024 09:46:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] hw/virtio/virtio-access: Use the ld/st_endian_p()
 API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: FeRdtxfCpHFW

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFJl
ZmFjdG9yIHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBsZC9zdF9lbmRpYW5fcCgp
IEFQSQ0KPiBObyBsb2dpY2FsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0t
DQo+ICAgaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWFjY2Vzcy5oIHwgMzYgKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcv
dmlydGlvL3ZpcnRpby1hY2Nlc3MuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby1hY2Nl
c3MuaA0KPiBpbmRleCAwN2FhZTY5MDQyLi5iOTIwODc0YmU4IDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tYWNjZXNzLmgNCj4gKysrIGIvaW5jbHVkZS9ody92
aXJ0aW8vdmlydGlvLWFjY2Vzcy5oDQo+IEBAIC05NSw1NiArOTUsMzIgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHZpcnRpb19zdGxfcGh5cyhWaXJ0SU9EZXZpY2UgKnZkZXYsIGh3YWRkciBw
YSwNCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgdmlydGlvX3N0d19wKFZpcnRJT0Rl
dmljZSAqdmRldiwgdm9pZCAqcHRyLCB1aW50MTZfdCB2KQ0KPiAgIHsNCj4gLSAgICBpZiAo
dmlydGlvX2FjY2Vzc19pc19iaWdfZW5kaWFuKHZkZXYpKSB7DQo+IC0gICAgICAgIHN0d19i
ZV9wKHB0ciwgdik7DQo+IC0gICAgfSBlbHNlIHsNCj4gLSAgICAgICAgc3R3X2xlX3AocHRy
LCB2KTsNCj4gLSAgICB9DQo+ICsgICAgc3R3X2VuZGlhbl9wKHZpcnRpb19hY2Nlc3NfaXNf
YmlnX2VuZGlhbih2ZGV2KSwgcHRyLCB2KTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGlu
bGluZSB2b2lkIHZpcnRpb19zdGxfcChWaXJ0SU9EZXZpY2UgKnZkZXYsIHZvaWQgKnB0ciwg
dWludDMyX3QgdikNCj4gICB7DQo+IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2Vu
ZGlhbih2ZGV2KSkgew0KPiAtICAgICAgICBzdGxfYmVfcChwdHIsIHYpOw0KPiAtICAgIH0g
ZWxzZSB7DQo+IC0gICAgICAgIHN0bF9sZV9wKHB0ciwgdik7DQo+IC0gICAgfQ0KPiArICAg
IHN0bF9lbmRpYW5fcCh2aXJ0aW9fYWNjZXNzX2lzX2JpZ19lbmRpYW4odmRldiksIHB0ciwg
dik7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fc3RxX3Ao
VmlydElPRGV2aWNlICp2ZGV2LCB2b2lkICpwdHIsIHVpbnQ2NF90IHYpDQo+ICAgew0KPiAt
ICAgIGlmICh2aXJ0aW9fYWNjZXNzX2lzX2JpZ19lbmRpYW4odmRldikpIHsNCj4gLSAgICAg
ICAgc3RxX2JlX3AocHRyLCB2KTsNCj4gLSAgICB9IGVsc2Ugew0KPiAtICAgICAgICBzdHFf
bGVfcChwdHIsIHYpOw0KPiAtICAgIH0NCj4gKyAgICBzdHFfZW5kaWFuX3AodmlydGlvX2Fj
Y2Vzc19pc19iaWdfZW5kaWFuKHZkZXYpLCBwdHIsIHYpOw0KPiAgIH0NCj4gICANCj4gICBz
dGF0aWMgaW5saW5lIGludCB2aXJ0aW9fbGR1d19wKFZpcnRJT0RldmljZSAqdmRldiwgY29u
c3Qgdm9pZCAqcHRyKQ0KPiAgIHsNCj4gLSAgICBpZiAodmlydGlvX2FjY2Vzc19pc19iaWdf
ZW5kaWFuKHZkZXYpKSB7DQo+IC0gICAgICAgIHJldHVybiBsZHV3X2JlX3AocHRyKTsNCj4g
LSAgICB9IGVsc2Ugew0KPiAtICAgICAgICByZXR1cm4gbGR1d19sZV9wKHB0cik7DQo+IC0g
ICAgfQ0KPiArICAgIHJldHVybiBsZHV3X2VuZGlhbl9wKHZpcnRpb19hY2Nlc3NfaXNfYmln
X2VuZGlhbih2ZGV2KSwgcHRyKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSBp
bnQgdmlydGlvX2xkbF9wKFZpcnRJT0RldmljZSAqdmRldiwgY29uc3Qgdm9pZCAqcHRyKQ0K
PiAgIHsNCj4gLSAgICBpZiAodmlydGlvX2FjY2Vzc19pc19iaWdfZW5kaWFuKHZkZXYpKSB7
DQo+IC0gICAgICAgIHJldHVybiBsZGxfYmVfcChwdHIpOw0KPiAtICAgIH0gZWxzZSB7DQo+
IC0gICAgICAgIHJldHVybiBsZGxfbGVfcChwdHIpOw0KPiAtICAgIH0NCj4gKyAgICByZXR1
cm4gbGRsX2VuZGlhbl9wKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSwgcHRy
KTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSB1aW50NjRfdCB2aXJ0aW9fbGRx
X3AoVmlydElPRGV2aWNlICp2ZGV2LCBjb25zdCB2b2lkICpwdHIpDQo+ICAgew0KPiAtICAg
IGlmICh2aXJ0aW9fYWNjZXNzX2lzX2JpZ19lbmRpYW4odmRldikpIHsNCj4gLSAgICAgICAg
cmV0dXJuIGxkcV9iZV9wKHB0cik7DQo+IC0gICAgfSBlbHNlIHsNCj4gLSAgICAgICAgcmV0
dXJuIGxkcV9sZV9wKHB0cik7DQo+IC0gICAgfQ0KPiArICAgIHJldHVybiBsZHFfZW5kaWFu
X3AodmlydGlvX2FjY2Vzc19pc19iaWdfZW5kaWFuKHZkZXYpLCBwdHIpOw0KPiAgIH0NCj4g
ICANCj4gICBzdGF0aWMgaW5saW5lIHVpbnQxNl90IHZpcnRpb190c3dhcDE2KFZpcnRJT0Rl
dmljZSAqdmRldiwgdWludDE2X3QgcykNCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZp
ZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
