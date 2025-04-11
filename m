Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp573304njc;
        Fri, 11 Apr 2025 09:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW69oVRqJskvM0dydIkeQXnSdQmzKmXZzLezRa/qQEx3NkXTyQE1XSOz9T+AawocDJVuJykl2gIVV/crQ==@linaro.org
X-Received: by 2002:a17:902:c405:b0:224:2207:5130 with SMTP id d9443c01a7336-22bea50da70mr44422185ad.45.1744389827240;
        Fri, 11 Apr 2025 09:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744389827; cv=none;
        d=google.com; s=arc-20240605;
        b=SSb58Z5yR1ZoN3FIT3rWEslSN/trv+ip0slOGYi4SzZgqgH1kw0UzHbeTM9C/WZ2AG
         UHcbIrb7l3xhbTgKFiSFDAUWgn7sY5e36YC9ewdoOxoNU6Eet3ie7R/mNHmDCvUIIA7Q
         9E9in4kAICCSyOZhNyk/DyMrewMbfy/GKloMJYM1Bgeo3S+BNQ5P7UgKuCdSL9uDTZqu
         vW3ETDcS6Iq7rS5PYxZan9RQHNdnenm7WReSr9n3VchViNLIRWchyv8RArqmdn7RSSRa
         p4x92RnB3e7flDyBENBk7K+u4L2czQi9MX7dJRQ3WLZGIsaq89mZE2kawhWeDgZOrTcD
         wZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yEehcKkEtvkrukIzx807jrlT1sua6l4Lwl0XwiVIqY8=;
        fh=V5eNuXziUvoAJXsVL23Kty9O6AfOXr0tPDMftwfyK98=;
        b=VHU+8wakeibv+1SNjKoi+zheOKt+pt8C3q4Y+X8T7BSMM8c2dlLDSaBz0KFXkpS765
         /3zRMC0+ny4U4jW05gIKmxAN0yCfUYoyas6pAf4oYFOVfKJDEIVYI+Zr7kzSU22kM0P0
         xCf5LyoLMHZci8yHuoQPU3G+BRtGkHTYlz8RgBqzs18yu1WrTvYq7/sPOUuNmvA1cCxN
         R8tyVkfnm2ENeFuiajFBpfqEi0L1lI+feUtH7l/iRMSWGpjF/swAbkmvzaV5Ho2Kme9p
         AIfjgSSKBc0QUCIQLVFQWaHIqjFpbWuzBxInvPXX6pR37cQuhabER0xdC3wZ9vHkfCLe
         JZqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6l514Z5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be10ce92esor28567685ad.8.2025.04.11.09.43.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Apr 2025 09:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y6l514Z5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744389827; x=1744994627; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEehcKkEtvkrukIzx807jrlT1sua6l4Lwl0XwiVIqY8=;
        b=y6l514Z5uNPW8rjh1SPsbo6KC9GIxTc1sevFpDADIWVHELjghrMFX7pbOdRx0/wDKc
         qOOlTvYdiBfbRMad/5lgxph/f2i4pX3HmfsRTAsKrPQ917vmybvfxAeJ615P4/jnk00k
         SwbSX+1pR1Zn2zgx1/tAIr5QhPemU9F/eX4uMRJzH9MAdwsoHRXMZeSs3DPQF483LcUE
         pps8jHSKOu80QhxxXKKdYo5UqGVE5jRZOJ8Y7o/KfcBgSvPaUuuojE0758FJbcLEEklM
         n/aOARwV2C92gi8++cGwlEmNql+AylKhvcWaKzTYl/Wa8b9n/p16uh2Jopy4tpXQkyNe
         d1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389827; x=1744994627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEehcKkEtvkrukIzx807jrlT1sua6l4Lwl0XwiVIqY8=;
        b=XeSqXWuPoEvJ1gfe2zbTxkfPuAWo9tV0GGZSj8OPZTnAHwj7R2LjiRuqMlhWCLphMm
         0F9qGjhtbm+7NaVqng+lEzTACzHlo9l83607xCJr5UqNNq0dPf1UN7tJD9Dm9Ta9QRUv
         QwcEibI61dmB1QTAWjqjM8tibL0VMkBTTTCyZGSNibBkdwbQK2qNGFRAaEY1BvzSmNtx
         aGzplEMoULSCuhjRm6CWYUPiNAkCKZoobvCmW1GQ2jRPiNjsnEJpnTdNuxqORzVJmknA
         Pdx2J/34s213KW0gkqubSjnL5+h3tD4T3J4Ps5A8gVbdOpVd2RQBJmeuKjnqLVPE0Aon
         DLNw==
X-Forwarded-Encrypted: i=1; AJvYcCWvTeEE6QiIRa0FIPGnjT5bt5wgqz02huVZjKIDTEwdymbUk0OTA87DZB6P7SlyeoD3ylztXwKJ3i3rYg==@linaro.org
X-Gm-Message-State: AOJu0YzPwcpEteYRECeaa3yhd6OD60/zbaPu83jg8ZUW5DFPF7n49F+7
	HJg0mOkgNHF0Yg1O4dZqUTPMRlateu9CY2nuSMGLJmaMqhRa5y/EDVYwp+4Gxziokw==
X-Gm-Gg: ASbGnctyn7B/w1YzXy+ZzNMrjXkIWfMQy0DrIFlkG+CVPYs/4g6Nm5u54N8vgyXGekS
	Ebb7/THuj+2XbKRybrw+u/etw5sQd4EYUAR3cJ9yVguit7wHKQKXe/TA4sioBkyYD5TwtxnCWz2
	7ETRxwjeIRZt5bniH4Wgi/c0G4Sjzl2j3/uYi3Tlxxg4Uv0Y1pXhD5L59147ZX9wDXFB7+oeZTu
	9oLJcyP5Nlx3w9egJPWGzG1fwF7CmhfbZ/5U4VTbRHWKX3OzuBsFA/KEIzIadSvber3xmb7QLb0
	ecixRV8xs4x54ARcmYBqpRHfTlAJLt3z1l/744MMgLbvxc8lG9+Aig==
X-Google-Smtp-Source: AGHT+IGf54UMQ/WV03DIur+/XHnWpBL5Jn9QPVDaNn0xvv32LjsywHFJDgUYmDh0hVrTznsWUFFWkA==
X-Received: by 2002:a17:902:ef0b:b0:21f:8453:7484 with SMTP id d9443c01a7336-22bea4c76cdmr51659035ad.30.1744389826716;
        Fri, 11 Apr 2025 09:43:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5ddsm51718575ad.230.2025.04.11.09.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 09:43:46 -0700 (PDT)
Message-ID: <7538bb41-cb6a-4a82-8535-3059f12e2f67@linaro.org>
Date: Fri, 11 Apr 2025 09:43:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] target/arm/ptw: extract arm_mmu_idx_to_security_space
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 qemu-arm@nongnu.org, Yannis Bolliger <yannis.bolliger@protonmail.com>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
 <20250410210022.809905-2-pierrick.bouvier@linaro.org>
 <cea136fd-50a1-42be-98c6-e9550e85c1ed@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <cea136fd-50a1-42be-98c6-e9550e85c1ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: zbsMHtnSAECP

T24gNC8xMS8yNSAwNjo0NCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDEwLzQvMjUgMjM6MDAsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBXZSdsbCByZXVz
ZSB0aGlzIGZ1bmN0aW9uIGxhdGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNr
IEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAg
dGFyZ2V0L2FybS9wdHcuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQ0KPj4gICAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vcHR3LmMgYi90YXJnZXQvYXJtL3B0dy5jDQo+PiBp
bmRleCA4ZDRlOWUwN2E5NC4uNWUxOTZjZmE5NTUgMTAwNjQ0DQo+PiAtLS0gYS90YXJnZXQv
YXJtL3B0dy5jDQo+PiArKysgYi90YXJnZXQvYXJtL3B0dy5jDQo+PiBAQCAtMzU1MCwxMyAr
MzU1MCw5IEBAIGJvb2wgZ2V0X3BoeXNfYWRkcl93aXRoX3NwYWNlX25vZ3BjKENQVUFSTVN0
YXRlICplbnYsIHZhZGRyIGFkZHJlc3MsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWVtb3AsIHJlc3VsdCwgZmkpOw0KPj4gICAgfQ0KPj4gICAgDQo+PiAtYm9v
bCBnZXRfcGh5c19hZGRyKENQVUFSTVN0YXRlICplbnYsIHZhZGRyIGFkZHJlc3MsDQo+PiAt
ICAgICAgICAgICAgICAgICAgIE1NVUFjY2Vzc1R5cGUgYWNjZXNzX3R5cGUsIE1lbU9wIG1l
bW9wLCBBUk1NTVVJZHggbW11X2lkeCwNCj4+IC0gICAgICAgICAgICAgICAgICAgR2V0UGh5
c0FkZHJSZXN1bHQgKnJlc3VsdCwgQVJNTU1VRmF1bHRJbmZvICpmaSkNCj4+ICtzdGF0aWMg
QVJNU2VjdXJpdHlTcGFjZSBhcm1fbW11X2lkeF90b19zZWN1cml0eV9zcGFjZQ0KPj4gKyhD
UFVBUk1TdGF0ZSAqZW52LCBBUk1NTVVJZHggbW11X2lkeCkNCj4gDQo+IFN0eWxlIGlzOg0K
PiANCj4gc3RhdGljIEFSTVNlY3VyaXR5U3BhY2UgYXJtX21tdV9pZHhfdG9fc2VjdXJpdHlf
c3BhY2UoQ1BVQVJNU3RhdGUgKmVudiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUk1NTVVJZHggbW11X2lkeCkNCj4gDQo+
IG9yOg0KPiANCj4gc3RhdGljIEFSTVNlY3VyaXR5U3BhY2UNCj4gYXJtX21tdV9pZHhfdG9f
c2VjdXJpdHlfc3BhY2UoQ1BVQVJNU3RhdGUgKmVudiwgQVJNTU1VSWR4IG1tdV9pZHgpDQo+
IA0KDQpUaGFua3MsIEknbGwgdXBkYXRlIHRvIHRoaXMgb25lLg0KDQo+IFJldmlld2VkLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IA0KDQo=
