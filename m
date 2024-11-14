Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90506njc;
        Wed, 13 Nov 2024 20:14:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa2cElXR5MUpxlMNLwBjtM5IwtDDyyye72GP517DhOW50wOEG+V9N7/l7ca8LebM00byULYYdy1RdRBw==@linaro.org
X-Received: by 2002:a05:6870:7992:b0:259:ae64:9234 with SMTP id 586e51a60fabf-2961057a13cmr785672fac.13.1731557690351;
        Wed, 13 Nov 2024 20:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557690; cv=none;
        d=google.com; s=arc-20240605;
        b=hHPRathQo9QWUoHudXeKOlTr7bW8AMUSuuZ4kXJXc3rXRGhjjDkHXAos+mj6oMjs8e
         WnhmUxU88SvofCiAda7DzH7ty9JqzW03cwpVEncYnVT2buc0fZ5sczX0zUqIUTZWmx9q
         8kbtn057+eQUyE4tsXuVTPqOcWYQ9gN1housk2v71ol3zVM4F0m67w3ay01FX6dj4LNC
         tX6mnO9NXUPkZwn/aNWXS6ZZ54zTuaSeMzE9KSeqfTkjLK5A4tSEXKDExXEBq7WYjz/+
         kJAAczxeoof29kWkuI96IZA5TQ113TWClCJQIKQ2EloG3AoXb0nx5SIlpOifrZxwX+DS
         LyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mOhtsNykJRrnEBy3hcLvcYZQqGiuqjCQTRDZ9B0NrNA=;
        fh=QKZoKplByyRVE8KySO9Xcf+4W3klqdzczmYrQBJ2rbA=;
        b=LKSRj3aKiJsqgujRUhi1bgx9+h9hoJ3USPwfam92p+np4lW9pDzmT3YRMp+jlXeelP
         kvixK1yspqDzhaFX7WKn06j+eama/XHHNWZlIBgIiWYRn1WWKTI1UiIzCCIjmCwllI78
         DDjG/+I+Fm+p82xacw/1bTyRDyTsjDWyV4KNPlomXFf30xYx4FL85Uy2nFsYSHJE4TGF
         IwJXs+sEo83YQNM7py1AMdEQkmijYavQDlcYn5yieXOZFgYXGLzmPXByUDWtZIjKB3+e
         upRZ7qN2+QSrvUp6/Zg6lQIMG0BlA9ft8QtZHzVph94eVeVAZiFMCsz8Ri2ze8B821EF
         aOpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4vwKORj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-296108098fesor113076fac.2.2024.11.13.20.14.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4vwKORj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557690; x=1732162490; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOhtsNykJRrnEBy3hcLvcYZQqGiuqjCQTRDZ9B0NrNA=;
        b=l4vwKORj5NtWZqfAZx7UvtxrfIfRuIITR2NNkY2mJ5muND1SEeKYYVN03Mdxq+YiJf
         PGfLpRboQQpXGg9/BWlulMCBnULHlSIjUcQ7Z0phUwHmRe0ewPS1yAk9iyQ+XLooIYjR
         HTv04n/xonlLvNApuAOFEfHkesE8G80Mx9UALFMFHH3OgiQzB2Mvwa4HspZDl9Ur+DZ3
         BZ710ws3VNbBVBAPaUNVj9rSYWuiAbYlj9b4w17uJnDgm423ma86EP6Ixb1Rqw4XqKy0
         nWP51S6mCy+/GCnGDrjDhoOuzH9/24iQqMT9PhLLFIQ0i7naDJxqAAHJG8VAKz3fiJX6
         Eq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557690; x=1732162490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOhtsNykJRrnEBy3hcLvcYZQqGiuqjCQTRDZ9B0NrNA=;
        b=eKz54Xk2b6/b7f2OuxtLbeLteUmS5/iGJ7AJg5G9/y0bZ1eEhqgAyLEZDrWdcBpibs
         WLEXGhaI8I5d4UJgFB37vUvKspb1oVm//jZbriB3yzGCIMTvGWxOba7NnD3Fixsb2YBr
         Bi0m/krcbjMVsz0VUXGmLw1FQKJ9uS9HIi/N6IYHA3IW8SOs3qId5/pnK/BYtSXY7CT0
         bKGWErACcPLJXBg/ieRvhGuPDvguL0rK+HpaFI2BuiXh6y1zbIR2/HHyO8fbztSDQEz/
         HtZLBgSVFYTPxh6lJE3aINLysKS+X1SJIW3S4iVlWaFWaacW7BJGyg0524SrMSq7SO6H
         LlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfXF0XeNnMv+WfDeyzpj47B8flM4Rh5o9Iw4KHTZ/D5HpkmVzoR550DbNw3ieZqMLPo8xgPlEd9DvJjw==@linaro.org
X-Gm-Message-State: AOJu0YxiKPKTQGeW53k27Y+E4Icb7O2v5IgUT8pwf+UUlnUyPACgKumI
	YIn+T0xpKbtXDcv5l26rFmBP6VMSHtcCCxlpzWkEronwQ12EB5h3KMl4mVMJ0f5hiQ==
X-Google-Smtp-Source: AGHT+IHkTVoebjq8Ld4e52DaNFO/rOcHB0iPOfGlk+293Xm1RnZ9Rq0SK6xRyogxBaYoRmL02pzjkw==
X-Received: by 2002:a05:6871:284:b0:287:0:9ecc with SMTP id 586e51a60fabf-296107bba00mr780084fac.33.1731557689917;
        Wed, 13 Nov 2024 20:14:49 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39d0773sm137842a12.83.2024.11.13.20.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:14:48 -0800 (PST)
Message-ID: <0b94aed9-b024-4ee8-8800-87f6432ae989@linaro.org>
Date: Wed, 13 Nov 2024 20:14:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/24] exec: Declare tlb_hit*() in 'exec/cputlb.h'
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
 <20241114011310.3615-20-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: bemlkfYESTEH

DQoNCk9uIDExLzEzLzI0IDE3OjEzLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gTW92ZSBDUFUgVExCIHJlbGF0ZWQgbWV0aG9kcyB0byAiZXhlYy9jcHV0bGIuaCIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxp
bmFyby5vcmc+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvZXhlYy9jcHUtYWxsLmggfCAyMyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFjY2VsL3RjZy9jcHV0bGIuYyAgICAgfCAyMyAr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9l
eGVjL2NwdS1hbGwuaCBiL2luY2x1ZGUvZXhlYy9jcHUtYWxsLmgNCj4gaW5kZXggMWM4ZTA0
NDZkMC4uY2NhYTY1MGIxOSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL2NwdS1hbGwu
aA0KPiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oDQo+IEBAIC0zMjMsMjkgKzMyMyw2
IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNwdV9tbXVfaW5kZXgoQ1BVU3RhdGUgKmNzLCBib29s
IGlmZXRjaCkNCj4gICAvKiBUaGUgdHdvIHNldHMgb2YgZmxhZ3MgbXVzdCBub3Qgb3Zlcmxh
cC4gKi8NCj4gICBRRU1VX0JVSUxEX0JVR19PTihUTEJfRkxBR1NfTUFTSyAmIFRMQl9TTE9X
X0ZMQUdTX01BU0spOw0KPiAgIA0KPiAtLyoqDQo+IC0gKiB0bGJfaGl0X3BhZ2U6IHJldHVy
biB0cnVlIGlmIHBhZ2UgYWxpZ25lZCBAYWRkciBpcyBhIGhpdCBhZ2FpbnN0IHRoZQ0KPiAt
ICogVExCIGVudHJ5IEB0bGJfYWRkcg0KPiAtICoNCj4gLSAqIEBhZGRyOiB2aXJ0dWFsIGFk
ZHJlc3MgdG8gdGVzdCAobXVzdCBiZSBwYWdlIGFsaWduZWQpDQo+IC0gKiBAdGxiX2FkZHI6
IFRMQiBlbnRyeSBhZGRyZXNzIChhIENQVVRMQkVudHJ5IGFkZHJfcmVhZC93cml0ZS9jb2Rl
IHZhbHVlKQ0KPiAtICovDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgdGxiX2hpdF9wYWdlKHVp
bnQ2NF90IHRsYl9hZGRyLCB2YWRkciBhZGRyKQ0KPiAtew0KPiAtICAgIHJldHVybiBhZGRy
ID09ICh0bGJfYWRkciAmIChUQVJHRVRfUEFHRV9NQVNLIHwgVExCX0lOVkFMSURfTUFTSykp
Ow0KPiAtfQ0KPiAtDQo+IC0vKioNCj4gLSAqIHRsYl9oaXQ6IHJldHVybiB0cnVlIGlmIEBh
ZGRyIGlzIGEgaGl0IGFnYWluc3QgdGhlIFRMQiBlbnRyeSBAdGxiX2FkZHINCj4gLSAqDQo+
IC0gKiBAYWRkcjogdmlydHVhbCBhZGRyZXNzIHRvIHRlc3QgKG5lZWQgbm90IGJlIHBhZ2Ug
YWxpZ25lZCkNCj4gLSAqIEB0bGJfYWRkcjogVExCIGVudHJ5IGFkZHJlc3MgKGEgQ1BVVExC
RW50cnkgYWRkcl9yZWFkL3dyaXRlL2NvZGUgdmFsdWUpDQo+IC0gKi8NCj4gLXN0YXRpYyBp
bmxpbmUgYm9vbCB0bGJfaGl0KHVpbnQ2NF90IHRsYl9hZGRyLCB2YWRkciBhZGRyKQ0KPiAt
ew0KPiAtICAgIHJldHVybiB0bGJfaGl0X3BhZ2UodGxiX2FkZHIsIGFkZHIgJiBUQVJHRVRf
UEFHRV9NQVNLKTsNCj4gLX0NCj4gLQ0KPiAgICNlbmRpZiAvKiAhQ09ORklHX1VTRVJfT05M
WSAqLw0KPiAgIA0KPiAgIC8qIFZhbGlkYXRlIGNvcnJlY3QgcGxhY2VtZW50IG9mIENQVUFy
Y2hTdGF0ZS4gKi8NCj4gZGlmZiAtLWdpdCBhL2FjY2VsL3RjZy9jcHV0bGIuYyBiL2FjY2Vs
L3RjZy9jcHV0bGIuYw0KPiBpbmRleCAwODBjYmNiMzRkLi5kYmE0ODMxY2QxIDEwMDY0NA0K
PiAtLS0gYS9hY2NlbC90Y2cvY3B1dGxiLmMNCj4gKysrIGIvYWNjZWwvdGNnL2NwdXRsYi5j
DQo+IEBAIC0xMjIwLDYgKzEyMjAsMjkgQEAgdm9pZCB0bGJfc2V0X3BhZ2UoQ1BVU3RhdGUg
KmNwdSwgdmFkZHIgYWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJv
dCwgbW11X2lkeCwgc2l6ZSk7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsgKiB0bGJfaGl0
X3BhZ2U6IHJldHVybiB0cnVlIGlmIHBhZ2UgYWxpZ25lZCBAYWRkciBpcyBhIGhpdCBhZ2Fp
bnN0IHRoZQ0KPiArICogVExCIGVudHJ5IEB0bGJfYWRkcg0KPiArICoNCj4gKyAqIEBhZGRy
OiB2aXJ0dWFsIGFkZHJlc3MgdG8gdGVzdCAobXVzdCBiZSBwYWdlIGFsaWduZWQpDQo+ICsg
KiBAdGxiX2FkZHI6IFRMQiBlbnRyeSBhZGRyZXNzIChhIENQVVRMQkVudHJ5IGFkZHJfcmVh
ZC93cml0ZS9jb2RlIHZhbHVlKQ0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdGxi
X2hpdF9wYWdlKHVpbnQ2NF90IHRsYl9hZGRyLCB2YWRkciBhZGRyKQ0KPiArew0KPiArICAg
IHJldHVybiBhZGRyID09ICh0bGJfYWRkciAmIChUQVJHRVRfUEFHRV9NQVNLIHwgVExCX0lO
VkFMSURfTUFTSykpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHRsYl9oaXQ6IHJldHVy
biB0cnVlIGlmIEBhZGRyIGlzIGEgaGl0IGFnYWluc3QgdGhlIFRMQiBlbnRyeSBAdGxiX2Fk
ZHINCj4gKyAqDQo+ICsgKiBAYWRkcjogdmlydHVhbCBhZGRyZXNzIHRvIHRlc3QgKG5lZWQg
bm90IGJlIHBhZ2UgYWxpZ25lZCkNCj4gKyAqIEB0bGJfYWRkcjogVExCIGVudHJ5IGFkZHJl
c3MgKGEgQ1BVVExCRW50cnkgYWRkcl9yZWFkL3dyaXRlL2NvZGUgdmFsdWUpDQo+ICsgKi8N
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB0bGJfaGl0KHVpbnQ2NF90IHRsYl9hZGRyLCB2YWRk
ciBhZGRyKQ0KPiArew0KPiArICAgIHJldHVybiB0bGJfaGl0X3BhZ2UodGxiX2FkZHIsIGFk
ZHIgJiBUQVJHRVRfUEFHRV9NQVNLKTsNCj4gK30NCj4gKw0KPiAgIC8qDQo+ICAgICogTm90
ZTogdGxiX2ZpbGxfYWxpZ24oKSBjYW4gdHJpZ2dlciBhIHJlc2l6ZSBvZiB0aGUgVExCLg0K
PiAgICAqIFRoaXMgbWVhbnMgdGhhdCBhbGwgb2YgdGhlIGNhbGxlcidzIHByaW9yIHJlZmVy
ZW5jZXMgdG8gdGhlIFRMQiB0YWJsZQ0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmll
ciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
