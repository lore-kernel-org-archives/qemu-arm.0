Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp88634njc;
        Wed, 13 Nov 2024 20:09:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqwelR8SaS0T9cm4gu1OtcY2kdoVoNUoiX0BoEyn7gwo/MbtoAXSVoBycHdEE25cP76g6Ly1HuKTlghg==@linaro.org
X-Received: by 2002:a17:902:d50c:b0:20b:6d82:acb with SMTP id d9443c01a7336-211c4fdd8a0mr10374115ad.23.1731557349594;
        Wed, 13 Nov 2024 20:09:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557349; cv=none;
        d=google.com; s=arc-20240605;
        b=iNeyXfcaSMLIoiwC22E0uRtJ8xtr4HhKqHkl3k3mBAyRv/XKTub1VuOZlcyt4WDDSr
         iksfDmmaa6Ciuho2NQ1rPBpR5qU+IK9l7yiPo4gPTlD9nAY4JB5tK8bQ1upESEz/oWT5
         Vz5cpK6ZEqk692yzT2etIEnF7B37NjpvUVaK7xZLaFreykMyJnUj8aZsaHMBVvqe7hLp
         DyuoPxIS1AlPSZE/TS9c23z9SPLWEkG66rctFK+UksGsDlhLM2Ss30Yk/RX2kqMRpHQ1
         39pPc+MmkkY6PFKkmtTGWN0bG8APyj+K7ADCT1qcTlH+usDqMjZC9ccmHasMcewZVnBj
         apuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lQ0+qGxRd5qqh2SgUKXZ9OXZcju5M5t/HuXAsk9/oKA=;
        fh=+ZD0ZbCgDLukiipN0es5HV7Qt7cl0RhrhteZYyfvqCA=;
        b=JiIzOqWlZEAMiG/+hKIZlTirs65A+T0gk2DCmy0mmWKNSSYT0whKinVVbDPIS39+t7
         kJ6ZBHRWi2AdMo4VgzWzko1uzcKaGpRkFPolfLLDxsVN6auHhIBvrMKiQS0TEpzMEsMD
         GtRkp2nJvijIUgCdu/kqnHfYnYWA84qmxnHsf5qpB+Kjm8d33Ej5VS6VJWCJ3MacShbb
         nnqGTfq2DRdhd01pIYl+4Fka+gN8Ztno32ZD65L2yT5HBvXs/1MMpwCOkx9uRr1DaVv5
         cYXjfZoKfZvKwzrPoaGWquAF7e8uQUvv7yMaz5Jqjmgzi/MRg4qhsNS3VVv8uLjH3muf
         Yp2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HlJnNKf/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7c97f0esor1810815ad.5.2024.11.13.20.09.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HlJnNKf/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557349; x=1732162149; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ0+qGxRd5qqh2SgUKXZ9OXZcju5M5t/HuXAsk9/oKA=;
        b=HlJnNKf/4O91VduP6YkJAzXjpgbgIC7ZwDEk4k8NumRyoQrEPDla1kpTnyZKXHcA2Y
         JDvoOi1Dq0/9/i7vR/Uc3m+kfxC+xNSJFPQdCHEB4mv/YRvWySMZ4wRBJjOvP/jGWSpG
         G84YEiJlxvJnF8Iq0S/XbZoXG7ODW96K/xGMMsAVgcmdjNqlTPxM4HxBUDKf7ZxrUI7R
         miin/tdCUKdL0b8MEOJAn8TUxskq1SmEWdJLyIVW8B0YBfDF/OGgzVdmuQVol9eqosUp
         WOC0IkLQH0V46VKjHF13+rcIiYk8IFv95sKIzAVs0tCTBE0es80oW7/1vD58N+xbIaTG
         Cpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557349; x=1732162149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ0+qGxRd5qqh2SgUKXZ9OXZcju5M5t/HuXAsk9/oKA=;
        b=oGtiBZE4Kk8CPnh0qAt6VoPAQPF9pkxmVO18q1G9mxxWEpAO8yLfhxAf70cOZT0um5
         cywu6i5ptBZ4gT9hWpSwtExVVe38GMysbBmMiz7pAGvT0ubAYRl3LSH2PKFsLbDRIqhW
         hztlQupHjzkoBh00Yoyw6LQbJQ4Fe6nneRT/dT6HyRLMzs1p3f7oUITweXXITQ7Mvckw
         uLqnOjpyYbgh2LhXA21sise+QUb36IqKoDbllkHkYQiESosKGKQwQIl5A6/JtZgz30wU
         TKfRFFXLLLZ2T3f/q1DixjbPGjtrYcY+ZkQBN5B4ZfBcU4R2oBOkK60lFqZh+hsEg++D
         LDuw==
X-Forwarded-Encrypted: i=1; AJvYcCUE8wiVenllLhzY/4SVLHAHcVJBHwY7blauT98S9ErQfm4g1cnUU89u/I2VFDKlEXmhTUfWtg2AiAI8pg==@linaro.org
X-Gm-Message-State: AOJu0YxGUjYc6Q0c69yni3u3I/BVnZ5vpwxLt4TXNln0H8ERqoWsk3Xo
	llAWSlBzBh5osHbmzP1OsbnhFbLwQWWqzzs2sM3pSms7nCWGetaowMG5JFESoZcwNsj3pZkr1CX
	mFYaTN5Fn
X-Google-Smtp-Source: AGHT+IGRpDdMGNn5+Vh56sta2pavYv15YctNTQha57Nm1Nt+XPo7thPN40tyPava8u/0xGMN0XSQLw==
X-Received: by 2002:a17:903:2b06:b0:20c:c15c:96ab with SMTP id d9443c01a7336-211c50ce7bemr11216025ad.48.1731557349129;
        Wed, 13 Nov 2024 20:09:09 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7ce9776sm1360135ad.121.2024.11.13.20.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:09:08 -0800 (PST)
Message-ID: <11b3990b-1f62-4e5f-a2c6-db651f11ec7a@linaro.org>
Date: Wed, 13 Nov 2024 20:09:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20241114011310.3615-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ORxsZz9JXswv

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVEFSR0VUX1BBR0VfQklUUyBpcyBkZWZpbmVkIGluICJleGVjL2NwdS1kZWZzLmgiLg0K
PiBJbmNsdWRlIGl0IGluIG9yZGVyIHRvIGF2b2lkIHdoZW4gcmVmYWN0b3Jpbmc6DQo+IA0K
PiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3lzdGVtL3dhdGNocG9pbnQuYzoy
MzoNCj4gICAgaW5jbHVkZS9leGVjL2NwdS1hbGwuaDozNTY6MTk6IGVycm9yOiB1c2Ugb2Yg
dW5kZWNsYXJlZCBpZGVudGlmaWVyICdUQVJHRVRfUEFHRV9CSVRTJw0KPiAgICAgIDM1NiB8
IFFFTVVfQlVJTERfQlVHX09OKFRMQl9GTEFHU19NQVNLICYgVExCX1NMT1dfRkxBR1NfTUFT
Syk7DQo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgXg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2V4ZWMvY3B1LWFsbC5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZXhlYy9jcHUtYWxsLmggYi9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oDQo+IGlu
ZGV4IDQ1ZTY2NzY5MzguLjFjNDBlMjc2NzIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZXhl
Yy9jcHUtYWxsLmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdS1hbGwuaA0KPiBAQCAtMTM2
LDcgKzEzNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzdGxfcGh5c19ub3RkaXJ0eShBZGRy
ZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwgdWludDMyX3QgdmFsDQo+ICAgI2VuZGlmDQo+
ICAgDQo+ICAgLyogcGFnZSByZWxhdGVkIHN0dWZmICovDQo+IC0NCj4gKyNpbmNsdWRlICJl
eGVjL2NwdS1kZWZzLmgiDQo+ICAgI2lmZGVmIFRBUkdFVF9QQUdFX0JJVFNfVkFSWQ0KPiAg
ICMgaW5jbHVkZSAiZXhlYy9wYWdlLXZhcnkuaCINCj4gICBleHRlcm4gY29uc3QgVGFyZ2V0
UGFnZUJpdHMgdGFyZ2V0X3BhZ2U7DQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
