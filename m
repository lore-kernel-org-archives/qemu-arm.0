Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2142782njc;
        Mon, 22 Jul 2024 14:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDe6K68btWMMGNnKvegfNfkgn9cj2aiYSxXnPUWDijqW2ODxzuEMlSJJ2J+xBl51vc+EMfrGI3PQ4l+ww14q5R+nHHVRL+
X-Received: by 2002:a05:6808:1242:b0:3d9:3234:6268 with SMTP id 5614622812f47-3dafd41cb10mr946920b6e.38.1721682461270;
        Mon, 22 Jul 2024 14:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682461; cv=none;
        d=google.com; s=arc-20160816;
        b=Sx4i7/nQTViahY4btHQLugl+Vd6Es0xaKcQrWol2+LyLSR3VcyrYtIgnFIV8XIZdVT
         ZMUXRVAZdtz6arc8BN+E9lrYn9VQDvl+wAKv7Ol+LuSURvxua7agiolPiTvYq722XFIw
         kIAYS6Uhtl//ezVr26L8H+8AKgEKYZprsqdAAiEU0eFOZoqE/pMMT3r6+Wct34A8XCQ2
         ieX3sTDL48H9Trv+IQGFnGdOnNtaUpZeAwuz1Zz1ysC393HdhUF9ugBqE1IVsDh/8TJ2
         Ep3LQ0kWjRiEsCYoUUt+uH7VuVu+eK8lAV5FdE90xyZEFV+rS0eDKJZEpC8J2bB6T2sA
         cekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8ZvVvX4ASDdz0l16oGL3z6D5T5GhEH+lvXkJHrnpwGY=;
        fh=QrFfp3wjRauto+Ax8MW0E8PJSuUBj11pDWmsUPfBckc=;
        b=fm1OvSQc9+0GTBZxdilniIBNrzrOcUHVe8QEZApegieNlOsuWzJCKSAcnuFuHktSSf
         KCef/dvrLD0zVqRjwAQ+uCXpkpRGv66ApEWGDBa2IY2Yi/xRLnVqBNCAWkrUPGSGty3s
         7ax2yT6aFcvk7A9QZ3fqm2Yl8Vb/GDEIWTHJrMR8O1/CfeE3Nt7N4SPFAbysXqZsXXbx
         rTtGVxscYCcnLNvdqDDdDymnY064Ouf5WKzFjEhfqrZi8mPU4IPsoCFmlCSso5LdlAeS
         9qgbWPoItEjJFT67ck3niMrTNaJTHRpnuQ+AEEtocPsTomoP4/5DBus1vYSWdBYg0dvS
         CSeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4O8i2jo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3dae0978358sor3866356b6e.6.2024.07.22.14.07.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e4O8i2jo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682461; x=1722287261; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZvVvX4ASDdz0l16oGL3z6D5T5GhEH+lvXkJHrnpwGY=;
        b=e4O8i2joYp/uYUx7HL8HJxNsgKzr4FqTvE6x+Gck6T5jbpcbWR4/LdHFdEgwAuNe6j
         C/3JhhjBJU2TVhOm0mCF7kT/QDFpkkFO/cK+azp46kUQSAWYszD1h7SKX5fSCo6qLXkM
         xmMbTWC5whXbc0fIUG8GAkUNHSHdZ7U1vWoTNOStSqGJOJ5lIz6Mumg6K6RKim6VwPBh
         JHlHNRptlzH1stt/ROMLCzuo1ryGvisxKLJwbTU3rKow23tHlFQGnBRHH+IPIKAI/1qh
         tttDDP8GsD2IQbmpXVGwy6c/C+w2vHV3TlX2t7hjrWqtw/2zDqRK9mZ9XbT0xr4gDz41
         PVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682461; x=1722287261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZvVvX4ASDdz0l16oGL3z6D5T5GhEH+lvXkJHrnpwGY=;
        b=eK8QC+VtxWMWOqaKRD8KicPuy0KRp5jZhKbvwLSLwc3xENXFPyr/7uhh4B9CobRed+
         AjxJbMT7TTuBneOgVuR0paFi+uJ9vzlhm1xz0oTWkY+uEeGqrgqG8KALyA+xAypAgZ4u
         yxkz1nHb/ylkkbQlnksY6oxW/gBiu3azWuTS4WENLcSb0NGwxXj+c3JPw1yZvUxLO4x+
         yCFiJ3c4hrzfqLfun0k2uZ+udp68+LGX44ZPgg2sEIeaFXMeaC+kGzANCO3vQZIaqxq/
         34WHdpk277pC+Fnl45HOTKQfsnheGwoV/oe/BFBXHbdzvfRTwcpSZnPcXGGATFN/4x2y
         kLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrlFXvp92S+bXuBxSeD2aUArcWybZo8xLXVYpKIykhelZAYg88DhhD+CGl20N7W2eAa5cWKD/OLstSmVcuyRxeuUChSjGl
X-Gm-Message-State: AOJu0YylJim7HhECTmcFc80Jf17oxsHeyIHK+OaulWRvKI82t/0uMgKc
	zfWFAt1DlIt8Y2nxFsI1ttxcSRg3SNfDSnDIItuoWlBW4spgmG1C7TWqHTC70dp49Q==
X-Google-Smtp-Source: AGHT+IEfVlpeKXjBn4JwNfaaycIX6bXx6fz+qOI7HrfV85i9jehON6TbEII05AqYdqp59bXWdYDRIA==
X-Received: by 2002:a05:6808:f8b:b0:3d9:222e:40ac with SMTP id 5614622812f47-3dafd43dfabmr1272378b6e.44.1721682460865;
        Mon, 22 Jul 2024 14:07:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d21ab0cb4sm2768560b3a.130.2024.07.22.14.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:07:40 -0700 (PDT)
Message-ID: <acc83ab4-8787-481f-b5d8-a95cce98afea@linaro.org>
Date: Mon, 22 Jul 2024 14:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] util/fifo8: Introduce fifo8_discard()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-8-philmd@linaro.org>
 <18f7d975-617e-4791-b921-7df7c9ef2d1d@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <18f7d975-617e-4791-b921-7df7c9ef2d1d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Q3s0bR5SgsDB

T24gNy8yMi8yNCAwOToxMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDIyLzcvMjQgMTg6MDcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4gQWRk
IHRoZSBmaWZvOF9kaXNjYXJkKCkgaGVscGVyIGZvciBjbGFyaXR5Lg0KPj4gSXQgaXMgYSBz
aW1wbGUgd3JhcHBlciBvdmVyIGZpZm84X3BvcF9idWYoKS4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+PiAt
LS0NCj4+ICAgIGluY2x1ZGUvcWVtdS9maWZvOC5oIHwgOCArKysrKysrKw0KPj4gICAgaHcv
c2NzaS9lc3AuYyAgICAgICAgfCAyICstDQo+PiAgICB1dGlsL2ZpZm84LmMgICAgICAgICB8
IDYgKysrKysrDQo+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2ZpZm84Lmgg
Yi9pbmNsdWRlL3FlbXUvZmlmbzguaA0KPj4gaW5kZXggMjFjN2EyMjkzNy4uNTNiYWZhYmQy
NSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvcWVtdS9maWZvOC5oDQo+PiArKysgYi9pbmNs
dWRlL3FlbXUvZmlmbzguaA0KPj4gQEAgLTEyOSw2ICsxMjksMTQgQEAgY29uc3QgdWludDhf
dCAqZmlmbzhfcG9wX2NvbnN0YnVmKEZpZm84ICpmaWZvLCB1aW50MzJfdCBtYXgsIHVpbnQz
Ml90ICpudW1wdHIpOw0KPj4gICAgICovDQo+PiAgICBjb25zdCB1aW50OF90ICpmaWZvOF9w
ZWVrX2NvbnN0YnVmKEZpZm84ICpmaWZvLCB1aW50MzJfdCBtYXgsIHVpbnQzMl90ICpudW1w
dHIpOw0KPj4gICAgDQo+PiArLyoqDQo+PiArICogZmlmbzhfZGlzY2FyZDoNCj4+ICsgKiBA
ZmlmbzogRklGTyB0byBjb25zdW1lIGJ5dGVzDQo+PiArICoNCj4+ICsgKiBEaXNjYXJkIChj
b25zdW1lKSBieXRlcyBmcm9tIGEgRklGTy4NCj4+ICsgKi8NCj4+ICt2b2lkIGZpZm84X2Rp
c2NhcmQoRmlmbzggKmZpZm8sIHVpbnQzMl90IGxlbik7DQo+PiArDQo+PiAgICAvKioNCj4+
ICAgICAqIGZpZm84X3Jlc2V0Og0KPj4gICAgICogQGZpZm86IEZJRk8gdG8gcmVzZXQNCj4+
IGRpZmYgLS1naXQgYS9ody9zY3NpL2VzcC5jIGIvaHcvc2NzaS9lc3AuYw0KPj4gaW5kZXgg
Y2VjODQ3YjU0YS4uYzcwM2ZhNzM1MSAxMDA2NDQNCj4+IC0tLSBhL2h3L3Njc2kvZXNwLmMN
Cj4+ICsrKyBiL2h3L3Njc2kvZXNwLmMNCj4+IEBAIC0zNTEsNyArMzUxLDcgQEAgc3RhdGlj
IHZvaWQgZG9fbWVzc2FnZV9waGFzZShFU1BTdGF0ZSAqcykNCj4+ICAgICAgICAvKiBJZ25v
cmUgZXh0ZW5kZWQgbWVzc2FnZXMgZm9yIG5vdyAqLw0KPj4gICAgICAgIGlmIChzLT5jbWRm
aWZvX2NkYl9vZmZzZXQpIHsNCj4+ICAgICAgICAgICAgaW50IGxlbiA9IE1JTihzLT5jbWRm
aWZvX2NkYl9vZmZzZXQsIGZpZm84X251bV91c2VkKCZzLT5jbWRmaWZvKSk7DQo+PiAtICAg
ICAgICBmaWZvOF9wb3BfYnVmKCZzLT5jbWRmaWZvLCBOVUxMLCBsZW4pOw0KPj4gKyAgICAg
ICAgZmlmbzhfZGlzY2FyZCgmcy0+Y21kZmlmbywgbGVuKTsNCj4+ICAgICAgICAgICAgcy0+
Y21kZmlmb19jZGJfb2Zmc2V0ID0gMDsNCj4+ICAgICAgICB9DQo+PiAgICB9DQo+PiBkaWZm
IC0tZ2l0IGEvdXRpbC9maWZvOC5jIGIvdXRpbC9maWZvOC5jDQo+PiBpbmRleCA2NjEwYjc5
MTgyLi5lYTM5Y2EyNTUyIDEwMDY0NA0KPj4gLS0tIGEvdXRpbC9maWZvOC5jDQo+PiArKysg
Yi91dGlsL2ZpZm84LmMNCj4+IEBAIC0xMzEsNiArMTMxLDEyIEBAIHVpbnQzMl90IGZpZm84
X3BvcF9idWYoRmlmbzggKmZpZm8sIHVpbnQ4X3QgKmRlc3QsIHVpbnQzMl90IGRlc3RsZW4p
DQo+PiAgICAgICAgcmV0dXJuIG4xICsgbjI7DQo+PiAgICB9DQo+PiAgICANCj4+ICt2b2lk
IGZpZm84X2NvbnN1bWUoRmlmbzggKmZpZm8sIHVpbnQzMl90IGxlbikNCj4gDQo+IFNvcnJ5
LCBmb3Jnb3QgdG8gcy9maWZvOF9jb25zdW1lL2ZpZm84X2Rpc2NhcmQvLg0KPiANCj4+ICt7
DQo+PiArICAgIGxlbiAtPSBmaWZvOF9wb3BfYnVmKGZpZm8sIE5VTEwsIGxlbik7DQo+PiAr
ICAgIGFzc2VydChsZW4gPT0gMCk7DQo+PiArfQ0KPj4gKw0KPj4gICAgYm9vbCBmaWZvOF9p
c19lbXB0eShGaWZvOCAqZmlmbykNCj4+ICAgIHsNCj4+ICAgICAgICByZXR1cm4gKGZpZm8t
Pm51bSA9PSAwKTsNCj4gDQo+IA0KDQp3aXRoIHRoaXMgZml4LA0KUmV2aWV3ZWQtYnk6IFBp
ZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
