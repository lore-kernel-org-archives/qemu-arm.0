Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89907njc;
        Wed, 13 Nov 2024 20:12:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0Sw57cYXrfzYtDlg+LwPrjMsVZNMgBlVLOFEmOabf4Lls8Uml32y3N/jDzTlwOOEMrtwtnW9fjfubxg==@linaro.org
X-Received: by 2002:a05:6a00:22cb:b0:720:aa27:2e45 with SMTP id d2e1a72fcca58-724579bdfabmr7277333b3a.14.1731557578723;
        Wed, 13 Nov 2024 20:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557578; cv=none;
        d=google.com; s=arc-20240605;
        b=AYAfDC+09SEx557Fur1mkCXBXVIHuO8q4R/4wT3bEkJlM+rLlyxAO6gFmGTJ5uS9Fi
         0UD50tn57nk5Ynh73ovzYxmpEz4OsT98Gih1qQv/EhzDDEZb11F3Q97DoiZj8L2/ZYyH
         vpvVwpEp6N1uSpskAn3XJeRIWxPCYXtQdaATbN1NXGeSzJbJPF/DlyqAm7HDOaNRPL5F
         gI6oBrLurOzxL5r05jr9aDs6EIwaL8sxGtMzTL/GFZnsWF3jk+2ylTLa940DeFTCrESY
         1nIhpQZtYJ6WK2DT5XzO5E0QiVNxXLt7Gga2/Co2TI9zFsMI2xXyBxRCPT+QV/bYr/LT
         Q+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8GxiMmfNCd6JoJv9qmjUXMyJ8YC4n8TxjdnfgVceKS8=;
        fh=x866a94LvxdAqD6i9lSDnyuNHdtpeZbzwogqXPuAiAQ=;
        b=lJE9ctNqJdNlY4fxIotkhjgB6PVutmrBVd25zwQ03Mcjuf4uPRZcuacOE6tGcRNS7f
         4C/NFO8RnFDp9snAflSSoIaQZlA50jF8Mf+eFgUuYl7UtyQu64gojqwP9DI8+HTOF0v8
         3iNQErO4PybpW7SE4SP+qYWloIoI2vjdVY82ZkvF3lh16S7krPYiv7G//SJim8POMyyR
         HwLyNvzZulP4ZXb3hwRWzG0n8ualaCgBcrXyLD2XE4Jsc0hCFNWYc9jMWsZWQ2IM2pbQ
         QbFKZ1PyPm8FYJHUe3+5N4PRKFYk+ODZuSAFFy9L9Mj8rwxTICC5nrr45P4Z5vlPSsX4
         pA0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DSa4g7uz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246bce4d6fsor100815b3a.3.2024.11.13.20.12.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:12:58 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DSa4g7uz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557578; x=1732162378; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GxiMmfNCd6JoJv9qmjUXMyJ8YC4n8TxjdnfgVceKS8=;
        b=DSa4g7uzxqXow8aUwkSm1G3TvmWUXEUT9g9S+m7lp8nnXdWceBJnXVj6UdNMXk1q1D
         HktD1Iy0V5YGSnVCGfKMTIQ780aS3jYXiPCNz4RgGn+fNz8oz4sQXobBWLNaCGGkCWzw
         kNLRAMVxJJ5ddlUrC+d78XEY4rLWawcZNXa7PGiXpNuRvOtwsvPMu3glug7fxBD7pgqU
         juMrCqzjDZFYDzy/sHzBLmVVt+HfE3DAUqrNSDwfd1yZRyxf9esIPN4hlLY2ugegsTwJ
         HepzW0vXvoxZqPC2jLiLG4pIn1nFOpemrgn5BgMhV5HirUvaklUSJeqouYGUA6QHnRgW
         HCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557578; x=1732162378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GxiMmfNCd6JoJv9qmjUXMyJ8YC4n8TxjdnfgVceKS8=;
        b=RipWWmIVHjacvYEAk2RvTsbf77UtBa+2K4VPJsktffKVAIekbcGZTXsR8X7nRlqCjH
         p9QNIkhmtWRsAVwQL9/zlnC8RNDd95NSKclumqHKp4+RBfpbn68LDDtKi0HItkrS4LPg
         f8xWq6RS5KhJ2l4RHfVm/6xzk7LKky+OKt4YfA9gEkMG8zEMryj0kW7qL1I+ryX4357e
         ODq8IQj2C54eTIiX/V71ct5prxERq1YxRkrHJ+6OfbCaMAhMXETMmaNyn8++1RgaHZjP
         rt4MzRkFwmYbKyc9RbihvQN+8CudvRasOZcevRc6oPHovaOHpQl8wG2TcW1ixxasN44Z
         BkZg==
X-Forwarded-Encrypted: i=1; AJvYcCW6PmBV+dj6bylnRFAezoHGZh4jzzc+Byw+BuJIckpyHzlmrWZKQbx4A+tbQOA9w3dVIvykKBIoyGzwJw==@linaro.org
X-Gm-Message-State: AOJu0YxPIxv3Ry9HXcAGhOstCqpIgWbb95TWZIN5uJNv4EDfrMeiBpGK
	rbF08V04ER2nBp/DA0wbUGQcFtggQz9P24PUfI2EsACGfepvxCcaYUMJs4WCGdQ2zg==
X-Google-Smtp-Source: AGHT+IHeyx1jbQyvVuldRgcF7U/onPNGHJ+FhW6qOfh5UbRsKkwgTE5UPe5BD2eTF99BuZ7DWSt7rA==
X-Received: by 2002:a05:6a00:3a06:b0:71e:6743:7599 with SMTP id d2e1a72fcca58-7245799e2damr6585758b3a.7.1731557578268;
        Wed, 13 Nov 2024 20:12:58 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a5ce39bsm250836b3a.35.2024.11.13.20.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:12:57 -0800 (PST)
Message-ID: <86769558-7f36-4875-9453-707339937d49@linaro.org>
Date: Wed, 13 Nov 2024 20:12:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
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
 <20241114011310.3615-14-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: VaOJ5HN2kIJ2

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBN
b3ZlIENQVSBUTEIgcmVsYXRlZCBtZXRob2RzIHRvICJleGVjL2NwdXRsYi5oIi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdXRsYi5oICAgfCA3ICsrKysrKysN
Cj4gICBpbmNsdWRlL2V4ZWMvZXhlYy1hbGwuaCB8IDMgLS0tDQo+ICAgaW5jbHVkZS9leGVj
L3JhbV9hZGRyLmggfCAxICsNCj4gICBzeXN0ZW0vcGh5c21lbS5jICAgICAgICB8IDEgKw0K
PiAgIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9jcHV0bGIuaCBiL2luY2x1ZGUvZXhl
Yy9jcHV0bGIuaA0KPiBpbmRleCBlZjE4NjQyYTMyLi42Y2FjN2Q1MzBmIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2V4ZWMvY3B1dGxiLmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdXRs
Yi5oDQo+IEBAIC0zMiw0ICszMiwxMSBAQCB2b2lkIHRsYl91bnByb3RlY3RfY29kZShyYW1f
YWRkcl90IHJhbV9hZGRyKTsNCj4gICANCj4gICAjZW5kaWYgLyogQ09ORklHX1RDRyAqLw0K
PiAgIA0KPiArI2lmbmRlZiBDT05GSUdfVVNFUl9PTkxZDQo+ICsNCj4gK3ZvaWQgdGxiX3Jl
c2V0X2RpcnR5KENQVVN0YXRlICpjcHUsIHJhbV9hZGRyX3Qgc3RhcnQxLCByYW1fYWRkcl90
IGxlbmd0aCk7DQo+ICt2b2lkIHRsYl9yZXNldF9kaXJ0eV9yYW5nZV9hbGwocmFtX2FkZHJf
dCBzdGFydCwgcmFtX2FkZHJfdCBsZW5ndGgpOw0KPiArDQo+ICsjZW5kaWYNCj4gKw0KPiAg
ICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmggYi9pbmNs
dWRlL2V4ZWMvZXhlYy1hbGwuaA0KPiBpbmRleCAyZTRjNGNjNGI0Li4yYzA2ZTU0Mzg3IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvZXhlYy1hbGwuaA0KPiArKysgYi9pbmNsdWRl
L2V4ZWMvZXhlYy1hbGwuaA0KPiBAQCAtNTg5LDkgKzU4OSw2IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBtbWFwX2xvY2sodm9pZCkge30NCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbW1hcF91
bmxvY2sodm9pZCkge30NCj4gICAjZGVmaW5lIFdJVEhfTU1BUF9MT0NLX0dVQVJEKCkNCj4g
ICANCj4gLXZvaWQgdGxiX3Jlc2V0X2RpcnR5KENQVVN0YXRlICpjcHUsIHJhbV9hZGRyX3Qg
c3RhcnQxLCByYW1fYWRkcl90IGxlbmd0aCk7DQo+IC12b2lkIHRsYl9yZXNldF9kaXJ0eV9y
YW5nZV9hbGwocmFtX2FkZHJfdCBzdGFydCwgcmFtX2FkZHJfdCBsZW5ndGgpOw0KPiAtDQo+
ICAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqDQo+ICAgYWRkcmVzc19zcGFjZV90cmFuc2xhdGVf
Zm9yX2lvdGxiKENQVVN0YXRlICpjcHUsIGludCBhc2lkeCwgaHdhZGRyIGFkZHIsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh3YWRkciAqeGxhdCwgaHdhZGRy
ICpwbGVuLA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmggYi9pbmNs
dWRlL2V4ZWMvcmFtX2FkZHIuaA0KPiBpbmRleCA4OTFjNDRjZjJkLi5iNmQ1NTUxNTQ5IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaA0KPiArKysgYi9pbmNsdWRl
L2V4ZWMvcmFtX2FkZHIuaA0KPiBAQCAtMjMsNiArMjMsNyBAQA0KPiAgICNpbmNsdWRlICJj
cHUuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L3hlbi5oIg0KPiAgICNpbmNsdWRlICJzeXNl
bXUvdGNnLmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9jcHV0bGIuaCINCj4gICAjaW5jbHVkZSAi
ZXhlYy9yYW1saXN0LmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvcmFtYmxvY2suaCINCj4gICAj
aW5jbHVkZSAiZXhlYy9leGVjLWFsbC5oIg0KPiBkaWZmIC0tZ2l0IGEvc3lzdGVtL3BoeXNt
ZW0uYyBiL3N5c3RlbS9waHlzbWVtLmMNCj4gaW5kZXggZGMxZGIzYTM4NC4uM2Y5MzdhNWU1
OCAxMDA2NDQNCj4gLS0tIGEvc3lzdGVtL3BoeXNtZW0uYw0KPiArKysgYi9zeXN0ZW0vcGh5
c21lbS5jDQo+IEBAIC0zMiw2ICszMiw3IEBADQo+ICAgI2VuZGlmIC8qIENPTkZJR19UQ0cg
Ki8NCj4gICANCj4gICAjaW5jbHVkZSAiZXhlYy9leGVjLWFsbC5oIg0KPiArI2luY2x1ZGUg
ImV4ZWMvY3B1dGxiLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvcGFnZS1wcm90ZWN0aW9uLmgi
DQo+ICAgI2luY2x1ZGUgImV4ZWMvdGFyZ2V0X3BhZ2UuaCINCj4gICAjaW5jbHVkZSAiaHcv
cWRldi1jb3JlLmgiDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmlj
ay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
