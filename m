Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90929njc;
        Wed, 13 Nov 2024 20:15:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRJ64mQjL/CDEJRU+xzREQbGNveBevHGkfxmQuSnW9gE7YsQciVyIen8L7Cld4HhZpLcI8NjBHaLUS+w==@linaro.org
X-Received: by 2002:a05:6808:201b:b0:3e5:e72e:17c8 with SMTP id 5614622812f47-3e7946a68a1mr22075274b6e.21.1731557759109;
        Wed, 13 Nov 2024 20:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557759; cv=none;
        d=google.com; s=arc-20240605;
        b=KptnfJoPCF9fwohjGSfIkETxYeIWph2MxIVvIxpqfPH5Kt1go5ocwfCritH7hbXUDn
         H7HWEC0YBwAfpiGbTR0rWNsBwVTzP0AxH3aboxD5ruy1gUPlxkimIYW/gO+ecHFeyHbD
         cfyU5XNTw102Jlu2WmPW+ehlxTFzRNxIs+Xw98PFJpqI13/hVnvM9A5IbxUZpHVrgF7l
         MbGKuG+55GF+rLaUkmOUD0VbSipvVFYUJdluy5QXcL4Bwb7Zwfp/n3cnKV9OyHNeqALM
         CWtKlLdC4fZFdYOFJ7vHWX1BRn9WxB8XsXKvV7ckn3Cn7nuZlEHP4saxRNvBRXQILf1p
         jq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uPGqk4xsYh71HK/hxL5gxJdm89YLQ7+T380UMBiv2k0=;
        fh=cPBklz/ha9B4Gp5xRUtRLMD3VI99ko+S6BpnhBgIees=;
        b=lA5wASZM1YTEAcwe6e7ZLKz/+FhxDlqyeIWe05LlsboYU0f8kBlZ89a7QBISy9lOki
         wXMCJQZWfkSv9JaxDm2Fqj2EuQFvKNKUPomO7Po45HkRwGeh+F+3dE0K86ABPopg5pKl
         rZoTCld1vLi0ixOEy4/ERppXWC3pOi1vQtOYSwpG7XxngSofUrM9CSVwgRfoKCQl9Wm3
         wiaXWX6KuTnvH8DAuMLSDNg/qOrZPqRxMdjfLyqEU8pDXiRdMXhIvy8yo3hyd29kYHmE
         5BYPp7lK+J3miERj4EfSFUuWq8hTu+0+7uSXovtB/AYTvOu6ESdreucXHOfOBed0Gm/Q
         bMAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KpDxxEvH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e7b858933fsor110680b6e.1.2024.11.13.20.15.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KpDxxEvH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557759; x=1732162559; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPGqk4xsYh71HK/hxL5gxJdm89YLQ7+T380UMBiv2k0=;
        b=KpDxxEvHVtd6U1TcgYn8jbsCbhusbaIvtc6zi+N8hE+1PJOSZ2rU2mkErTmUdVp9J7
         ZAD+xYh7/lrFV+o02BGfLKGK/q4izhiarJP/hMu6gLq2G2+XvfDft1sxDG/LZNvbcwFA
         exelEBHioUDC4dEn8K2xdw47EFCK3KWbs6GcFf0+2QwHuGpOBuotwfVvmXV95pvOLWQ/
         8nJZz6Unpp8MymCB+ACE69UQ3YrDSjWK8KUm7/C2DholVOdl2kf1rq4jk5oHyPgF4GgF
         YEs/g7iw+qdC/oDe7t1Ugv7kv5O1ZFcvEMd0R/UjQHaifRblGVkT7mBnMmnd4hGhdGZV
         OFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557759; x=1732162559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPGqk4xsYh71HK/hxL5gxJdm89YLQ7+T380UMBiv2k0=;
        b=kZNpuRSUgX8McYK09WFKOiYef/R9/UOmRThEaDapYYMtL5SSzdUbrmRt1/KNMAfUR8
         Bl+X3zi8cs5CNk2YOc7A7j7oUif2YzGVmt85NuI6eDgBnroYgNv0j3zgVoAOvXnzlsUe
         Uwf5NEphE85TN16SD8NrzJTSGDRSdz7T8rfqvEt/VugqlZREN6ePLrM0XBT8AX6IirGm
         zPgkwTMEgtECpib1/FUHaWSGRuE+jk6zwGJXjuS1Y3tadjckRSloqsRKuetl7IFsMr6Y
         OA6WU47UJ5lqhc2h2KO/XzX5GxqcwWMs5t8YYo3uaSxr/IOGkH08aL2ik/hnxpv860DE
         T7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUllh7G3jM3rCLs6LTD6FUrTOhtv3I2EnV5FAz9424EbxIK6KxGwxoGqccKZzG+qskeGnNOcqsiHAKmIw==@linaro.org
X-Gm-Message-State: AOJu0YxirJTrZcIuqY3ZlC8Ri72Sugz2wz66WCOkNny+DbYLHRuEKQto
	B3Y86GfYuzaJBxBS5xWnNCRxDD0i0vqS/e7rIqUuIE8MSiTTwgxqrENWrljlEqyBHw==
X-Google-Smtp-Source: AGHT+IGwHy+s9nNltQr5D2MesZGPmWJy4c6wC8wwLJnhiMjoPbGjPekbdtU9xOrlNF2OtXfG72av0g==
X-Received: by 2002:a05:6808:138e:b0:3e6:56a2:d070 with SMTP id 5614622812f47-3e794685f46mr20967073b6e.9.1731557758731;
        Wed, 13 Nov 2024 20:15:58 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39af5edsm138857a12.77.2024.11.13.20.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:15:58 -0800 (PST)
Message-ID: <8fe0b6ea-c467-4194-8a57-969974f446c8@linaro.org>
Date: Wed, 13 Nov 2024 20:15:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] exec/cpu-common: Move ram_addr_t related methods to
 'exec/ram_addr.h'
Content-Language: en-US
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
 <20241114011310.3615-23-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Kgu/Dltt5e0P

T24gMTEvMTMvMjQgMTc6MTMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBN
b3ZlIG1ldGhvZHMgcmVsYXRlZCB0byB0aGUgcmFtX2FkZHJfdCB0eXBlIHRvDQo+IHRoZSBz
cGVjaWZpYyAiZXhlYy9yYW1fYWRkci5oIiBoZWFkZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0K
PiAgIGluY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggICAgICAgIHwgNTYgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBpbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaCAgICAg
ICAgICB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVk
ZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmggfCAgMiArLQ0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgNTggaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaCBiL2luY2x1ZGUvZXhlYy9jcHUtY29tbW9u
LmgNCj4gaW5kZXggNjM4ZGM4MDZhNS4uYjc5MDIwMmM1NiAxMDA2NDQNCj4gLS0tIGEvaW5j
bHVkZS9leGVjL2NwdS1jb21tb24uaA0KPiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1LWNvbW1v
bi5oDQo+IEBAIC01NCw2MSArNTQsNyBAQCBlbnVtIGRldmljZV9lbmRpYW4gew0KPiAgICNk
ZWZpbmUgREVWSUNFX0hPU1RfRU5ESUFOIERFVklDRV9MSVRUTEVfRU5ESUFODQo+ICAgI2Vu
ZGlmDQo+ICAgDQo+IC0vKiBhZGRyZXNzIGluIHRoZSBSQU0gKGRpZmZlcmVudCBmcm9tIGEg
cGh5c2ljYWwgYWRkcmVzcykgKi8NCj4gLSNpZiBkZWZpbmVkKENPTkZJR19YRU5fQkFDS0VO
RCkNCj4gLXR5cGVkZWYgdWludDY0X3QgcmFtX2FkZHJfdDsNCj4gLSMgIGRlZmluZSBSQU1f
QUREUl9NQVggVUlOVDY0X01BWA0KPiAtIyAgZGVmaW5lIFJBTV9BRERSX0ZNVCAiJSIgUFJJ
eDY0DQo+IC0jZWxzZQ0KPiAtdHlwZWRlZiB1aW50cHRyX3QgcmFtX2FkZHJfdDsNCj4gLSMg
IGRlZmluZSBSQU1fQUREUl9NQVggVUlOVFBUUl9NQVgNCj4gLSMgIGRlZmluZSBSQU1fQURE
Ul9GTVQgIiUiIFBSSXhQVFINCj4gLSNlbmRpZg0KPiAtDQo+IC0vKiBtZW1vcnkgQVBJICov
DQo+IC0NCj4gLXZvaWQgcWVtdV9yYW1fcmVtYXAocmFtX2FkZHJfdCBhZGRyLCByYW1fYWRk
cl90IGxlbmd0aCk7DQo+IC0vKiBUaGlzIHNob3VsZCBub3QgYmUgdXNlZCBieSBkZXZpY2Vz
LiAgKi8NCj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Qodm9pZCAqcHRy
KTsNCj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Rfbm9mYWlsKHZvaWQg
KnB0cik7DQo+IC1SQU1CbG9jayAqcWVtdV9yYW1fYmxvY2tfYnlfbmFtZShjb25zdCBjaGFy
ICpuYW1lKTsNCj4gLQ0KPiAtLyoNCj4gLSAqIFRyYW5zbGF0ZXMgYSBob3N0IHB0ciBiYWNr
IHRvIGEgUkFNQmxvY2sgYW5kIGFuIG9mZnNldCBpbiB0aGF0IFJBTUJsb2NrLg0KPiAtICoN
Cj4gLSAqIEBwdHI6IFRoZSBob3N0IHBvaW50ZXIgdG8gdHJhbnNsYXRlLg0KPiAtICogQHJv
dW5kX29mZnNldDogV2hldGhlciB0byByb3VuZCB0aGUgcmVzdWx0IG9mZnNldCBkb3duIHRv
IGEgdGFyZ2V0IHBhZ2UNCj4gLSAqIEBvZmZzZXQ6IFdpbGwgYmUgc2V0IHRvIHRoZSBvZmZz
ZXQgd2l0aGluIHRoZSByZXR1cm5lZCBSQU1CbG9jay4NCj4gLSAqDQo+IC0gKiBSZXR1cm5z
OiBSQU1CbG9jayAob3IgTlVMTCBpZiBub3QgZm91bmQpDQo+IC0gKg0KPiAtICogQnkgdGhl
IHRpbWUgdGhpcyBmdW5jdGlvbiByZXR1cm5zLCB0aGUgcmV0dXJuZWQgcG9pbnRlciBpcyBu
b3QgcHJvdGVjdGVkDQo+IC0gKiBieSBSQ1UgYW55bW9yZS4gIElmIHRoZSBjYWxsZXIgaXMg
bm90IHdpdGhpbiBhbiBSQ1UgY3JpdGljYWwgc2VjdGlvbiBhbmQNCj4gLSAqIGRvZXMgbm90
IGhvbGQgdGhlIEJRTCwgaXQgbXVzdCBoYXZlIG90aGVyIG1lYW5zIG9mIHByb3RlY3Rpbmcg
dGhlDQo+IC0gKiBwb2ludGVyLCBzdWNoIGFzIGEgcmVmZXJlbmNlIHRvIHRoZSBtZW1vcnkg
cmVnaW9uIHRoYXQgb3ducyB0aGUgUkFNQmxvY2suDQo+IC0gKi8NCj4gLVJBTUJsb2NrICpx
ZW11X3JhbV9ibG9ja19mcm9tX2hvc3Qodm9pZCAqcHRyLCBib29sIHJvdW5kX29mZnNldCwN
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFtX2FkZHJfdCAqb2Zm
c2V0KTsNCj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxv
Y2sgKnJiLCB2b2lkICpob3N0KTsNCj4gLXZvaWQgcWVtdV9yYW1fc2V0X2lkc3RyKFJBTUJs
b2NrICpibG9jaywgY29uc3QgY2hhciAqbmFtZSwgRGV2aWNlU3RhdGUgKmRldik7DQo+IC12
b2lkIHFlbXVfcmFtX3Vuc2V0X2lkc3RyKFJBTUJsb2NrICpibG9jayk7DQo+IC1jb25zdCBj
aGFyICpxZW11X3JhbV9nZXRfaWRzdHIoUkFNQmxvY2sgKnJiKTsNCj4gLXZvaWQgKnFlbXVf
cmFtX2dldF9ob3N0X2FkZHIoUkFNQmxvY2sgKnJiKTsNCj4gLXJhbV9hZGRyX3QgcWVtdV9y
YW1fZ2V0X29mZnNldChSQU1CbG9jayAqcmIpOw0KPiAtcmFtX2FkZHJfdCBxZW11X3JhbV9n
ZXRfdXNlZF9sZW5ndGgoUkFNQmxvY2sgKnJiKTsNCj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1f
Z2V0X21heF9sZW5ndGgoUkFNQmxvY2sgKnJiKTsNCj4gLWJvb2wgcWVtdV9yYW1faXNfc2hh
cmVkKFJBTUJsb2NrICpyYik7DQo+IC1ib29sIHFlbXVfcmFtX2lzX25vcmVzZXJ2ZShSQU1C
bG9jayAqcmIpOw0KPiAtYm9vbCBxZW11X3JhbV9pc191Zl96ZXJvYWJsZShSQU1CbG9jayAq
cmIpOw0KPiAtdm9pZCBxZW11X3JhbV9zZXRfdWZfemVyb2FibGUoUkFNQmxvY2sgKnJiKTsN
Cj4gLWJvb2wgcWVtdV9yYW1faXNfbWlncmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiAtdm9p
ZCBxZW11X3JhbV9zZXRfbWlncmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiAtdm9pZCBxZW11
X3JhbV91bnNldF9taWdyYXRhYmxlKFJBTUJsb2NrICpyYik7DQo+IC1ib29sIHFlbXVfcmFt
X2lzX25hbWVkX2ZpbGUoUkFNQmxvY2sgKnJiKTsNCj4gLWludCBxZW11X3JhbV9nZXRfZmQo
UkFNQmxvY2sgKnJiKTsNCj4gLQ0KPiAtc2l6ZV90IHFlbXVfcmFtX3BhZ2VzaXplKFJBTUJs
b2NrICpibG9jayk7DQo+IC1zaXplX3QgcWVtdV9yYW1fcGFnZXNpemVfbGFyZ2VzdCh2b2lk
KTsNCj4gKyNpbmNsdWRlICJleGVjL3JhbV9hZGRyLmgiDQo+ICAgDQo+ICAgLyoqDQo+ICAg
ICogY3B1X2FkZHJlc3Nfc3BhY2VfaW5pdDoNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhl
Yy9yYW1fYWRkci5oIGIvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gaW5kZXggODBmNmRj
NzU2NC4uZTA2MjBkZGIwMyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL3JhbV9hZGRy
LmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gQEAgLTIxLDYgKzIxLDYy
IEBADQo+ICAgDQo+ICAgI2lmbmRlZiBDT05GSUdfVVNFUl9PTkxZDQo+ICAgDQo+ICsvKiBh
ZGRyZXNzIGluIHRoZSBSQU0gKGRpZmZlcmVudCBmcm9tIGEgcGh5c2ljYWwgYWRkcmVzcykg
Ki8NCj4gKyNpZiBkZWZpbmVkKENPTkZJR19YRU5fQkFDS0VORCkNCj4gK3R5cGVkZWYgdWlu
dDY0X3QgcmFtX2FkZHJfdDsNCj4gKyMgIGRlZmluZSBSQU1fQUREUl9NQVggVUlOVDY0X01B
WA0KPiArIyAgZGVmaW5lIFJBTV9BRERSX0ZNVCAiJSIgUFJJeDY0DQo+ICsjZWxzZQ0KPiAr
dHlwZWRlZiB1aW50cHRyX3QgcmFtX2FkZHJfdDsNCj4gKyMgIGRlZmluZSBSQU1fQUREUl9N
QVggVUlOVFBUUl9NQVgNCj4gKyMgIGRlZmluZSBSQU1fQUREUl9GTVQgIiUiIFBSSXhQVFIN
Cj4gKyNlbmRpZg0KPiArDQo+ICsvKiBtZW1vcnkgQVBJICovDQo+ICsNCj4gK3ZvaWQgcWVt
dV9yYW1fcmVtYXAocmFtX2FkZHJfdCBhZGRyLCByYW1fYWRkcl90IGxlbmd0aCk7DQo+ICsv
KiBUaGlzIHNob3VsZCBub3QgYmUgdXNlZCBieSBkZXZpY2VzLiAgKi8NCj4gK3JhbV9hZGRy
X3QgcWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Qodm9pZCAqcHRyKTsNCj4gK3JhbV9hZGRyX3Qg
cWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Rfbm9mYWlsKHZvaWQgKnB0cik7DQo+ICtSQU1CbG9j
ayAqcWVtdV9yYW1fYmxvY2tfYnlfbmFtZShjb25zdCBjaGFyICpuYW1lKTsNCj4gKw0KPiAr
LyoNCj4gKyAqIFRyYW5zbGF0ZXMgYSBob3N0IHB0ciBiYWNrIHRvIGEgUkFNQmxvY2sgYW5k
IGFuIG9mZnNldCBpbiB0aGF0IFJBTUJsb2NrLg0KPiArICoNCj4gKyAqIEBwdHI6IFRoZSBo
b3N0IHBvaW50ZXIgdG8gdHJhbnNsYXRlLg0KPiArICogQHJvdW5kX29mZnNldDogV2hldGhl
ciB0byByb3VuZCB0aGUgcmVzdWx0IG9mZnNldCBkb3duIHRvIGEgdGFyZ2V0IHBhZ2UNCj4g
KyAqIEBvZmZzZXQ6IFdpbGwgYmUgc2V0IHRvIHRoZSBvZmZzZXQgd2l0aGluIHRoZSByZXR1
cm5lZCBSQU1CbG9jay4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiBSQU1CbG9jayAob3IgTlVM
TCBpZiBub3QgZm91bmQpDQo+ICsgKg0KPiArICogQnkgdGhlIHRpbWUgdGhpcyBmdW5jdGlv
biByZXR1cm5zLCB0aGUgcmV0dXJuZWQgcG9pbnRlciBpcyBub3QgcHJvdGVjdGVkDQo+ICsg
KiBieSBSQ1UgYW55bW9yZS4gIElmIHRoZSBjYWxsZXIgaXMgbm90IHdpdGhpbiBhbiBSQ1Ug
Y3JpdGljYWwgc2VjdGlvbiBhbmQNCj4gKyAqIGRvZXMgbm90IGhvbGQgdGhlIEJRTCwgaXQg
bXVzdCBoYXZlIG90aGVyIG1lYW5zIG9mIHByb3RlY3RpbmcgdGhlDQo+ICsgKiBwb2ludGVy
LCBzdWNoIGFzIGEgcmVmZXJlbmNlIHRvIHRoZSBtZW1vcnkgcmVnaW9uIHRoYXQgb3ducyB0
aGUgUkFNQmxvY2suDQo+ICsgKi8NCj4gK1JBTUJsb2NrICpxZW11X3JhbV9ibG9ja19mcm9t
X2hvc3Qodm9pZCAqcHRyLCBib29sIHJvdW5kX29mZnNldCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmFtX2FkZHJfdCAqb2Zmc2V0KTsNCj4gK3JhbV9hZGRy
X3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxvY2sgKnJiLCB2b2lkICpob3N0
KTsNCj4gK3ZvaWQgcWVtdV9yYW1fc2V0X2lkc3RyKFJBTUJsb2NrICpibG9jaywgY29uc3Qg
Y2hhciAqbmFtZSwgRGV2aWNlU3RhdGUgKmRldik7DQo+ICt2b2lkIHFlbXVfcmFtX3Vuc2V0
X2lkc3RyKFJBTUJsb2NrICpibG9jayk7DQo+ICtjb25zdCBjaGFyICpxZW11X3JhbV9nZXRf
aWRzdHIoUkFNQmxvY2sgKnJiKTsNCj4gK3ZvaWQgKnFlbXVfcmFtX2dldF9ob3N0X2FkZHIo
UkFNQmxvY2sgKnJiKTsNCj4gK3JhbV9hZGRyX3QgcWVtdV9yYW1fZ2V0X29mZnNldChSQU1C
bG9jayAqcmIpOw0KPiArcmFtX2FkZHJfdCBxZW11X3JhbV9nZXRfdXNlZF9sZW5ndGgoUkFN
QmxvY2sgKnJiKTsNCj4gK3JhbV9hZGRyX3QgcWVtdV9yYW1fZ2V0X21heF9sZW5ndGgoUkFN
QmxvY2sgKnJiKTsNCj4gK2Jvb2wgcWVtdV9yYW1faXNfc2hhcmVkKFJBTUJsb2NrICpyYik7
DQo+ICtib29sIHFlbXVfcmFtX2lzX25vcmVzZXJ2ZShSQU1CbG9jayAqcmIpOw0KPiArYm9v
bCBxZW11X3JhbV9pc191Zl96ZXJvYWJsZShSQU1CbG9jayAqcmIpOw0KPiArdm9pZCBxZW11
X3JhbV9zZXRfdWZfemVyb2FibGUoUkFNQmxvY2sgKnJiKTsNCj4gK2Jvb2wgcWVtdV9yYW1f
aXNfbWlncmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiArdm9pZCBxZW11X3JhbV9zZXRfbWln
cmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiArdm9pZCBxZW11X3JhbV91bnNldF9taWdyYXRh
YmxlKFJBTUJsb2NrICpyYik7DQo+ICtib29sIHFlbXVfcmFtX2lzX25hbWVkX2ZpbGUoUkFN
QmxvY2sgKnJiKTsNCj4gK2ludCBxZW11X3JhbV9nZXRfZmQoUkFNQmxvY2sgKnJiKTsNCj4g
Kw0KPiArc2l6ZV90IHFlbXVfcmFtX3BhZ2VzaXplKFJBTUJsb2NrICpibG9jayk7DQo+ICtz
aXplX3QgcWVtdV9yYW1fcGFnZXNpemVfbGFyZ2VzdCh2b2lkKTsNCj4gKw0KPiAgIGJvb2wg
cmFtYmxvY2tfaXNfcG1lbShSQU1CbG9jayAqcmIpOw0KPiAgIA0KPiAgIGxvbmcgcWVtdV9t
aW5yYW1wYWdlc2l6ZSh2b2lkKTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy90cmFu
c2xhdGlvbi1ibG9jay5oIGIvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4g
aW5kZXggYjk5YWZiMDA3Ny4uOWM0NzU3ODgyYyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9l
eGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL3RyYW5zbGF0
aW9uLWJsb2NrLmgNCj4gQEAgLTgsNyArOCw3IEBADQo+ICAgI2RlZmluZSBFWEVDX1RSQU5T
TEFUSU9OX0JMT0NLX0gNCj4gICANCj4gICAjaW5jbHVkZSAicWVtdS90aHJlYWQuaCINCj4g
LSNpbmNsdWRlICJleGVjL2NwdS1jb21tb24uaCINCj4gKyNpbmNsdWRlICJleGVjL3JhbV9h
ZGRyLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvdmFkZHIuaCINCj4gICAjaWZkZWYgQ09ORklH
X1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJxZW11L2ludGVydmFsLXRyZWUuaCINCg0KUmV2
aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCg0K
