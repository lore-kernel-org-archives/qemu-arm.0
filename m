Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89828njc;
        Wed, 13 Nov 2024 20:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6UUyO3sL5DHq+GbJ47nXfEVl2m1LsN9x3zKLlLbr9J7c03B7j56PWRqMc4utn8j9G4fyLoXLsYEG8jQ==@linaro.org
X-Received: by 2002:a17:902:ecc2:b0:20c:c694:f6c6 with SMTP id d9443c01a7336-211835bbc05mr292945255ad.49.1731557565403;
        Wed, 13 Nov 2024 20:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557565; cv=none;
        d=google.com; s=arc-20240605;
        b=dxND76d3WuvlW72iXEcfpBwHHolm8L+MbTtTeL0JHmFaMEpRAIFaazY5RKPS0ywE+I
         uExDqn+3H1+Wl5IA4W4UnDa/dCHVmsgjI+lTEOZwbkK7G2CtoPQCV1CQfRqrLkjxmwOC
         Nv+Ol7gfRMgS8Y2+uuhnpeMAhJWhdOLXjMafliTsS/ZPMo2hqNS2yKGzY4nhNOxDbdip
         ZHLlOgkPns++gK5mhHA8NgzQR5iSqio1EDFgPbckcGOe4Cuobhjo17VkpS5//g8YlsFm
         8+tbs2shSEqNptefbe5e1+IfcmUGEn8lXyIzHVaKrM9pqxFrCl+WIvfwWNF3xF9/NDv7
         m0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wRDVQUllrBRYv6rny84HKQVaKvEZvtUPh5K3yJfI6Cg=;
        fh=NFAHTocp/UTgbCxxsLv5eCuRMe+RowVelPkdX2UgiPk=;
        b=al9pMs0Pd2v0wyA+RRY0ric1a3d68xYbL824TlpvVKlrFGfxamgtnaMcJONK96GbMG
         L9kMRpJsFa7OhMBVExLKz8cMGt/e1v32tY2dAXVR7QwKNwcolYwv6qX8jBttSJXBzbVR
         Q9fSbWHweawXYrd+lF4LceD7lryODUIl6Q8TdXX1FexsV57blZUjLFpEL21GWzhJxfkE
         Vu5FFzX81e1KFuGK1SsDKeyDHSXlA1w6Pf/TmzTzja7WTg70tCqoz4RCey5z1pC1OD+j
         asW4R2g9XdiVauSNgvsTTgexfSivQmVGrnjW+LXs826aSiKPTuqz18FT9c64O5+nvzfD
         RytA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kChnc+RP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7cf4537sor1553915ad.15.2024.11.13.20.12.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kChnc+RP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557565; x=1732162365; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRDVQUllrBRYv6rny84HKQVaKvEZvtUPh5K3yJfI6Cg=;
        b=kChnc+RPyfgVOjwrI0N+w2NWWoUbZ8rW+qWsW7h+e5MFlkPAIgIiRlij/ezmROUhBl
         VetfP/a01j2uOyXW4a0bMWN2C9oGmTbVUevAkK7bFmW4A+k9fDdU2qkc5uJhSt96ESlv
         o0LONtTGm7M52fxn+ZgU3cTQ3NPq5bZ6jrx1YWkVIHEFT9IWlsG1U0HFKev08FLZcE4E
         xjX5pHTxayiD6i//0LFwuPsxb7Lm3r3VfuFGrcPwtn8kg0CI2un2rbLK9TUIR739SqhA
         aMil77iXrJxKEij73L5WXdKg3o03UJkSHpNfG9MsjynJE2SCmKl+biGNAf5ZSvw5sUCH
         b1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557565; x=1732162365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRDVQUllrBRYv6rny84HKQVaKvEZvtUPh5K3yJfI6Cg=;
        b=ltcWVH2P6VlsWmGHRwosWmHdDDG3HSXH5we2I18RiatHwotx1dZK0BWz3+2BjWZgZH
         XTjAeb5wsnUPX7uRBHGtyWtzgjL7O1n/m3Fl6bf9QsnSw5asleJV+d9E6CKnNRuNPR9o
         t8benkcAqnzkBBW8+n00KqivyFIijpRMvmyaiOtW5Wp/qeMWmOkZ6f/s4vFcotLsaaDU
         x5qavx5DAf1B1j+Vytwrjune9Zl54nO1sK3PTzMYXDPs86pmlKskD0Kj/WoO3kD6Ra9u
         CUqPY6B7Sny1KUrZoKmvntjpV4s63HGGWo0S1QPxgy7mbhp7LrB2ygAGFVQCKpgfksQO
         P9+g==
X-Forwarded-Encrypted: i=1; AJvYcCWdFfAQXXDlJzYchTOwbvOIIZFhDnn95TI2G8sB8/pYNpKAH9+2m/+sk7emuayz2aA3iRRhn3fN8wU8Ow==@linaro.org
X-Gm-Message-State: AOJu0YwFFq4y3dfnea/e3dzQ/PTtlXPnnN1DjhFnvVNHn/HCliy9Y0qd
	dRB9ajClj5OB/cuXMtPGFXuT545tEfP6P+DhtU2NlP+o2qsBmPly5R4LpHE1BqLPDA==
X-Google-Smtp-Source: AGHT+IF+S2XirUDimkdKvMiEJsVH7iRRx9lheHPdhuThgvThwyw9kn6yO/wwzpuAwMtiMMbI0fzp3Q==
X-Received: by 2002:a17:903:11c9:b0:20c:cccd:17a3 with SMTP id d9443c01a7336-2118359c11amr310889535ad.46.1731557564850;
        Wed, 13 Nov 2024 20:12:44 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d018e9sm1412135ad.174.2024.11.13.20.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:12:44 -0800 (PST)
Message-ID: <c2f927c3-321e-43a5-b9c3-7cf41cb746ba@linaro.org>
Date: Wed, 13 Nov 2024 20:12:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] accel/tcg: Have tlb_vaddr_to_host() use vaddr type
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
 <20241114011310.3615-13-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: gs5QzadvsONa

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBh
YmlfcHRyIGlzIGV4cGVjdGVkIHRvIGJlIHVzZWQgaW4gdXNlciBlbXVsYXRpb24uDQo+IHRs
Yl92YWRkcl90b19ob3N0KCkgdXNlcyBpdCwgYnV0IGNhbiBiZSB1c2VkIGluDQo+IHN5c3Rl
bSBlbXVsYXRpb24uIFJlcGxhY2UgdGhlIHR5cGUgYnkgJ3ZhZGRyJyB3aGljaA0KPiBpcyBl
cXVpdmFsZW50IG9uIHVzZXIgZW11bGF0aW9uIGJ1dCBhbHNvIHdvcmtzIG9uDQo+IHN5c3Rl
bS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdV9sZHN0LmggfCAz
ICsrLQ0KPiAgIGFjY2VsL3RjZy9jcHV0bGIuYyAgICAgIHwgMiArLQ0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZXhlYy9jcHVfbGRzdC5oIGIvaW5jbHVkZS9leGVjL2NwdV9sZHN0
LmgNCj4gaW5kZXggYTI2YWI0OWIwYi4uNzY5ZTlmYzQ0MCAxMDA2NDQNCj4gLS0tIGEvaW5j
bHVkZS9leGVjL2NwdV9sZHN0LmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdV9sZHN0LmgN
Cj4gQEAgLTY3LDYgKzY3LDcgQEANCj4gICAjZW5kaWYNCj4gICANCj4gICAjaW5jbHVkZSAi
ZXhlYy9tZW1vcGlkeC5oIg0KPiArI2luY2x1ZGUgImV4ZWMvdmFkZHIuaCINCj4gICAjaW5j
bHVkZSAiZXhlYy9hYmlfcHRyLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvbW11LWFjY2Vzcy10
eXBlLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvaW50MTI4LmgiDQo+IEBAIC0zMzAsNyArMzMx
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkICp0bGJfdmFkZHJfdG9faG9zdChDUFVBcmNoU3Rh
dGUgKmVudiwgYWJpX3B0ciBhZGRyLA0KPiAgICAgICByZXR1cm4gZzJoKGVudl9jcHUoZW52
KSwgYWRkcik7DQo+ICAgfQ0KPiAgICNlbHNlDQo+IC12b2lkICp0bGJfdmFkZHJfdG9faG9z
dChDUFVBcmNoU3RhdGUgKmVudiwgYWJpX3B0ciBhZGRyLA0KPiArdm9pZCAqdGxiX3ZhZGRy
X3RvX2hvc3QoQ1BVQXJjaFN0YXRlICplbnYsIHZhZGRyIGFkZHIsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTU1VQWNjZXNzVHlwZSBhY2Nlc3NfdHlwZSwgaW50IG1tdV9pZHgp
Ow0KPiAgICNlbmRpZg0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvYWNjZWwvdGNnL2NwdXRsYi5j
IGIvYWNjZWwvdGNnL2NwdXRsYi5jDQo+IGluZGV4IGI3NmE0ZWFjNGUuLjA4MGNiY2IzNGQg
MTAwNjQ0DQo+IC0tLSBhL2FjY2VsL3RjZy9jcHV0bGIuYw0KPiArKysgYi9hY2NlbC90Y2cv
Y3B1dGxiLmMNCj4gQEAgLTE1MDQsNyArMTUwNCw3IEBAIHZvaWQgKnByb2JlX2FjY2VzcyhD
UFVBcmNoU3RhdGUgKmVudiwgdmFkZHIgYWRkciwgaW50IHNpemUsDQo+ICAgICAgIHJldHVy
biBob3N0Ow0KPiAgIH0NCj4gICANCj4gLXZvaWQgKnRsYl92YWRkcl90b19ob3N0KENQVUFy
Y2hTdGF0ZSAqZW52LCBhYmlfcHRyIGFkZHIsDQo+ICt2b2lkICp0bGJfdmFkZHJfdG9faG9z
dChDUFVBcmNoU3RhdGUgKmVudiwgdmFkZHIgYWRkciwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICBNTVVBY2Nlc3NUeXBlIGFjY2Vzc190eXBlLCBpbnQgbW11X2lkeCkNCj4gICB7
DQo+ICAgICAgIENQVVRMQkVudHJ5RnVsbCAqZnVsbDsNCg0KUmV2aWV3ZWQtYnk6IFBpZXJy
aWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K
