Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90019njc;
        Wed, 13 Nov 2024 20:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVX6A46QEMgrRMXYkG4NGuOdMVMkAVtXeHxn/Ud0mqjFPDkilt2gilHCJFRfh3p7dJu9DWpoz/MEzg04w==@linaro.org
X-Received: by 2002:a05:6a00:893:b0:724:66f0:8639 with SMTP id d2e1a72fcca58-72469ca2d11mr996646b3a.6.1731557600520;
        Wed, 13 Nov 2024 20:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557600; cv=none;
        d=google.com; s=arc-20240605;
        b=F2NLVKXjm3g+Uebf/IRu2alSqwMXUdXVIvYK85TXuRYUj1jGPowmS6QRgew3ZDvjlc
         Za6gZEhOFgbxF1HmQIH8rfyl87/IUhbjxCYzSrCt3FT0DC0BN4w3nBwG4fcfrXUHJFzR
         KC8KMtZsItaI6yqgLeEUjAa/LfneVTC2oBYYYVRsdmOBFoG1thS5ONM4faQ1eBXO12fN
         C2H4WP9LcxmnnTGjSJw8WXHlNXyh9sq8FNxKYAHl54R4cCFgb/HfYeVdJkpAVmdhNxTv
         cet2kuyApwJx26CwjouFLRzEIiessgDqYkEPaqSn5pr+yIl3gi+QS5Pz06/SzhJbFgCg
         zLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7L7hggnNWHYxci88srbhFxnlBX1PYwIpz8QPRVwqhCo=;
        fh=zySZ0pEyP9lUkCylijGMYKWr03jV4401laxpxSMomRU=;
        b=OGhQXLDQ4/OrWeffiW1aS7uyxW32BgLklr+4RT7Ucb96ncsrdTm6fhH3ftHZTraJbn
         mlXKLKI099NY1/1up+NtM5tYHXRfWLTBEbsUp+YmXCXSrpUd/oqcdhIf33nOFOlOAqWk
         1x2xRPdhY5zI091BkKyvotEZ8PuEGnQIkj1vrHle5Bl6vDKGKDNxK0AtbKZ0IWu7e+H/
         gJfLIjLWkNCN5GM14pzmgNksinBXlgv/7LYFrqa1b302Gtdjw5QfAwRIuz7FdDyThl5+
         8uYFFMss/1Hf/dl9yYKWI6Jkk9rfGozwtv8BrlB5gzD628jyG+vMjw2mypUbx6ZPnv78
         Lbmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Cugn9v;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a81e025sor279314b3a.5.2024.11.13.20.13.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Cugn9v;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557600; x=1732162400; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7L7hggnNWHYxci88srbhFxnlBX1PYwIpz8QPRVwqhCo=;
        b=m0Cugn9vQdwQfoQQk65juxQActW8lknOlaEW0KOWs/u2ZuYkyRENJAQK4oBO00xR0S
         FDADj95F2C0yF7A+bl2fBvbUl4eB5SmuxX4h/8o5uqHrsCakH2PDKlLwbw0HI+umAm1z
         4C1FmHy3sAuL2vVAKHCMwwBgheaFtNhX4P1ocIhtC6ee5cJkm0rwhIgihPNU479YudqW
         u2aMV8ibk12oPIaeqkMfwxJipX8zx0xZt+iqTfADcKvT8aRJiRBl0PQ1mRpZkug+rIVx
         iZFLDIvNI558nfvB7j8afP5gpLIyyqDkAVhRzPsSuQXxpDFb6hO2xagaBNVvC3B7oPN/
         zcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557600; x=1732162400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7L7hggnNWHYxci88srbhFxnlBX1PYwIpz8QPRVwqhCo=;
        b=BU7VEDUQOjxSPfl9Vbk1+N/4BssXktCDz26L7DF2JhV2NtfdeGEpG1N4GPcYL53zMK
         Q7dGtbjLyPc/8ZquutOMUo3foGjqopZuuE9c0dOGPFkz3tDoyTWMN1UpN2YA55j8SNPr
         DiGDJ0DyJc56+SOLfdhbqQeJh/IQFeqfGUu8XTbSxwEF1Bp0aQoxh3zJexl1VyUXRZny
         0gAgkX/nLx+WjO+o16C7QtCXXpGS3PPMG2R5mqseK0eIWH0tiAo2RLA5ll1Ni1euM6qW
         I7sEY1LiUijx4Zcilkd/9AUJcoFlu220VVpOho8gCSo3esKeSWn3Dx0BdvPu32veQe4X
         pleg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ti4JOkYEKxRJC/ngBdmP94jvGY1rLaeyx5bj6+k7GzgHLh8f8aZvwHSqAX0ZubH3oyitjYXNuIsZmg==@linaro.org
X-Gm-Message-State: AOJu0YxiDrGn6r0oh3aPNhZ2EQiHY4NXwEiH1MFyCXi82ahAZhOsPNd0
	0O4A8vcMhrn0t7ZnWfD3yutTfiqjkAz53ZeLGRYvU2bNvvUpjXCjhQCqOGmWwguLsg==
X-Google-Smtp-Source: AGHT+IFTF16A1X9jKJcosfG0RWzU+DgL2mKVN3EYn9fB+OquNcg2LrMwBQJgt+F3MurCw/HqPF45dg==
X-Received: by 2002:a05:6a00:21cd:b0:71d:eb7d:20e4 with SMTP id d2e1a72fcca58-72469ca52a5mr947185b3a.8.1731557600056;
        Wed, 13 Nov 2024 20:13:20 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a9d3c6esm240465b3a.194.2024.11.13.20.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:13:19 -0800 (PST)
Message-ID: <1f277f46-f09a-4713-a9c1-1de739871d24@linaro.org>
Date: Wed, 13 Nov 2024 20:13:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Declare tlb_init/destroy() in 'exec/cputlb.h'
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
 <20241114011310.3615-15-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: lFj+sMf5PS6Y

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBN
b3ZlIENQVSBUTEIgcmVsYXRlZCBtZXRob2RzIHRvICJleGVjL2NwdXRsYi5oIi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdXRsYi5oICAgfCAyOCArKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tDQo+ICAgaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmggfCAx
NyAtLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFjY2VsL3RjZy9jcHUtZXhlYy5jICAgIHwgIDEg
Kw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2NwdXRsYi5oIGIvaW5jbHVk
ZS9leGVjL2NwdXRsYi5oDQo+IGluZGV4IDZjYWM3ZDUzMGYuLjUzODZlNTM4MDYgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvZXhlYy9jcHV0bGIuaA0KPiArKysgYi9pbmNsdWRlL2V4ZWMv
Y3B1dGxiLmgNCj4gQEAgLTIyLDE1ICsyMiwzMyBAQA0KPiAgIA0KPiAgICNpbmNsdWRlICJl
eGVjL2NwdS1jb21tb24uaCINCj4gICANCj4gLSNpZmRlZiBDT05GSUdfVENHDQo+ICsjaWYg
ZGVmaW5lZChDT05GSUdfVENHKSAmJiAhZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQ0KPiAr
DQo+ICsvKioNCj4gKyAqIHRsYl9pbml0IC0gaW5pdGlhbGl6ZSBhIENQVSdzIFRMQg0KPiAr
ICogQGNwdTogQ1BVIHdob3NlIFRMQiBzaG91bGQgYmUgaW5pdGlhbGl6ZWQNCj4gKyAqLw0K
PiArdm9pZCB0bGJfaW5pdChDUFVTdGF0ZSAqY3B1KTsNCj4gKw0KPiArLyoqDQo+ICsgKiB0
bGJfZGVzdHJveSAtIGRlc3Ryb3kgYSBDUFUncyBUTEINCj4gKyAqIEBjcHU6IENQVSB3aG9z
ZSBUTEIgc2hvdWxkIGJlIGRlc3Ryb3llZA0KPiArICovDQo+ICt2b2lkIHRsYl9kZXN0cm95
KENQVVN0YXRlICpjcHUpOw0KPiAgIA0KPiAtI2lmICFkZWZpbmVkKENPTkZJR19VU0VSX09O
TFkpDQo+IC0vKiBjcHV0bGIuYyAqLw0KPiAgIHZvaWQgdGxiX3Byb3RlY3RfY29kZShyYW1f
YWRkcl90IHJhbV9hZGRyKTsNCj4gICB2b2lkIHRsYl91bnByb3RlY3RfY29kZShyYW1fYWRk
cl90IHJhbV9hZGRyKTsNCj4gLSNlbmRpZg0KPiAgIA0KPiAtI2VuZGlmIC8qIENPTkZJR19U
Q0cgKi8NCj4gKyNlbHNlDQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0bGJfaW5pdChD
UFVTdGF0ZSAqY3B1KQ0KPiArew0KPiArfQ0KPiArc3RhdGljIGlubGluZSB2b2lkIHRsYl9k
ZXN0cm95KENQVVN0YXRlICpjcHUpDQo+ICt7DQo+ICt9DQo+ICsNCj4gKyNlbmRpZiAvKiBD
T05GSUdfVENHICYmICFDT05GSUdfVVNFUl9PTkxZICovDQo+ICAgDQo+ICAgI2lmbmRlZiBD
T05GSUdfVVNFUl9PTkxZDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvZXhl
Yy1hbGwuaCBiL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+IGluZGV4IDJjMDZlNTQzODcu
LmQ3OTIyMDM3NzMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+
ICsrKyBiL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+IEBAIC00NywxNyArNDcsNiBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgY3B1X2xvb3BfZXhpdF9yZXF1ZXN0ZWQoQ1BVU3RhdGUgKmNw
dSkNCj4gICB9DQo+ICAgDQo+ICAgI2lmICFkZWZpbmVkKENPTkZJR19VU0VSX09OTFkpICYm
IGRlZmluZWQoQ09ORklHX1RDRykNCj4gLS8qIGNwdXRsYi5jICovDQo+IC0vKioNCj4gLSAq
IHRsYl9pbml0IC0gaW5pdGlhbGl6ZSBhIENQVSdzIFRMQg0KPiAtICogQGNwdTogQ1BVIHdo
b3NlIFRMQiBzaG91bGQgYmUgaW5pdGlhbGl6ZWQNCj4gLSAqLw0KPiAtdm9pZCB0bGJfaW5p
dChDUFVTdGF0ZSAqY3B1KTsNCj4gLS8qKg0KPiAtICogdGxiX2Rlc3Ryb3kgLSBkZXN0cm95
IGEgQ1BVJ3MgVExCDQo+IC0gKiBAY3B1OiBDUFUgd2hvc2UgVExCIHNob3VsZCBiZSBkZXN0
cm95ZWQNCj4gLSAqLw0KPiAtdm9pZCB0bGJfZGVzdHJveShDUFVTdGF0ZSAqY3B1KTsNCj4g
ICAvKioNCj4gICAgKiB0bGJfZmx1c2hfcGFnZToNCj4gICAgKiBAY3B1OiBDUFUgd2hvc2Ug
VExCIHNob3VsZCBiZSBmbHVzaGVkDQo+IEBAIC0yNDIsMTIgKzIzMSw2IEBAIHZvaWQgdGxi
X3NldF9wYWdlKENQVVN0YXRlICpjcHUsIHZhZGRyIGFkZHIsDQo+ICAgICAgICAgICAgICAg
ICAgICAgaHdhZGRyIHBhZGRyLCBpbnQgcHJvdCwNCj4gICAgICAgICAgICAgICAgICAgICBp
bnQgbW11X2lkeCwgdmFkZHIgc2l6ZSk7DQo+ICAgI2Vsc2UNCj4gLXN0YXRpYyBpbmxpbmUg
dm9pZCB0bGJfaW5pdChDUFVTdGF0ZSAqY3B1KQ0KPiAtew0KPiAtfQ0KPiAtc3RhdGljIGlu
bGluZSB2b2lkIHRsYl9kZXN0cm95KENQVVN0YXRlICpjcHUpDQo+IC17DQo+IC19DQo+ICAg
c3RhdGljIGlubGluZSB2b2lkIHRsYl9mbHVzaF9wYWdlKENQVVN0YXRlICpjcHUsIHZhZGRy
IGFkZHIpDQo+ICAgew0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2FjY2VsL3RjZy9jcHUtZXhl
Yy5jIGIvYWNjZWwvdGNnL2NwdS1leGVjLmMNCj4gaW5kZXggODE2MzI5NWYzNC4uODc3MDQ5
MzU5MCAxMDA2NDQNCj4gLS0tIGEvYWNjZWwvdGNnL2NwdS1leGVjLmMNCj4gKysrIGIvYWNj
ZWwvdGNnL2NwdS1leGVjLmMNCj4gQEAgLTI0LDYgKzI0LDcgQEANCj4gICAjaW5jbHVkZSAi
aHcvY29yZS90Y2ctY3B1LW9wcy5oIg0KPiAgICNpbmNsdWRlICJ0cmFjZS5oIg0KPiAgICNp
bmNsdWRlICJkaXNhcy9kaXNhcy5oIg0KPiArI2luY2x1ZGUgImV4ZWMvY3B1dGxiLmgiDQo+
ICAgI2luY2x1ZGUgImV4ZWMvZXhlYy1hbGwuaCINCj4gICAjaW5jbHVkZSAidGNnL3RjZy5o
Ig0KPiAgICNpbmNsdWRlICJxZW11L2F0b21pYy5oIg0KDQpSZXZpZXdlZC1ieTogUGllcnJp
Y2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
