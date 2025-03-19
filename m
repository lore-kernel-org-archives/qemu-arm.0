Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp596846njc;
        Wed, 19 Mar 2025 16:35:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBy5JHvc7kqW9H6tZw81pHKRdXdhtwH/CbOfNIN3Cwurgrg+PUKLueq8U38FKf9/SV95L9Qa9mjkvuJQ==@linaro.org
X-Received: by 2002:a17:902:eb81:b0:224:1781:a947 with SMTP id d9443c01a7336-226499280d0mr83118275ad.21.1742427351905;
        Wed, 19 Mar 2025 16:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742427351; cv=none;
        d=google.com; s=arc-20240605;
        b=RntP6ELIUYtY2qlaN4JIah9gv9VQBuRRtjQRk1l9i5K7Uhq8CsErCHScUhA3wkNycY
         mORS3Mr14A+buP3QAudKTITSBQ+eNeOFtw5ZsVr8sls3c5dyw+iL7d+6MpZMIcB/5mSF
         01q+z58k4g4WxRHmOSmModKjaBbN4mcYZLBH81iWtQLUJRzo0U/VVFlb5UZHv2/SDhdr
         Q5rb2si25lD25KYsk220FpHFmkw0vu8OYp2xrjWBp22T1NP6SZ2fvr5nCkBzFdOfJsnk
         2l45a+6sMl8Xo+y4tL9fWoqML+6jW2vZlEzIBzATxHL9AHUGsMLko6U/ajMp7KGYzzax
         CJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Bba+WjZANogVZ1VO1VQrZkZQkuzhk6YNoaDnsc3kitM=;
        fh=/LOghffR+CkdQnF0NnIO84kO56az6mzC5DBV9jqiynw=;
        b=GAlJ2dtY+s54Y1r2vNYG1YbgeRD6Z049//Cn/HlrcDXzIY1Y/OW9xF0Z++ugLvYSp4
         72ota4Txu4nkkSkVV1e0duRNIczVD64lhDOT35taTXIzPgBAfPoDI15vvMqefHF21i1T
         yuwlLcyNWLU4E7v7emgmIO/7CJXPIl4RSl2hq+fkUSVHXr+O5uG0Yp+/HyRhmIU8g6UL
         +uZ2wGn7wAQlwJFxznKbYCyA2fF+Rtx3FfHAwRSYNOTilQD6+IkZk82OK1n6jRJEvTHB
         rRKNhwyAvn5OJ997b0ChhAjI7VX3daeI957/GV6C0meqZdjy7DXKt+y4msZQDStLNVQk
         EYpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IXosqr8L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2266358fcc0sor1500615ad.1.2025.03.19.16.35.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 16:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IXosqr8L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742427351; x=1743032151; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bba+WjZANogVZ1VO1VQrZkZQkuzhk6YNoaDnsc3kitM=;
        b=IXosqr8LjVd6Pl7yQHysB6kvm4BY5SCk4Mtf+N6k2HyufqwhsNNQNVyGOfCZku16GB
         fV05yOuXt0Ez5OT2AkisVulPPTuU7XDPgFV+E7ZtcOjN+Goc8gZg0JMty0CI3x9Aornp
         vmj8Ha0iaFR8bWcKj3V24y5xrddvO0ZwRyFGyoim6TQkiO6faoLs0GmxlXpMPfqjQCl9
         ai8ytT/xhag1dhChptjypkw95fdspN2R84XXbS1HpH2MyCGMq0+s7FPQVIE933bn5V5v
         Ruquk1IsLjER9Ir3QrHC6ax4W6zGScHpNEgzsMAHHR4S3TnYeP1JmxTceGov8hQhTHXp
         LBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742427351; x=1743032151;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bba+WjZANogVZ1VO1VQrZkZQkuzhk6YNoaDnsc3kitM=;
        b=v7HxZAuJ+UZmRNOtZRawUdYHmYq/w9L+ojMCbO7Rnq3Um6+7yVpC6A85VZrXuubGb6
         kLflvjBTTKPiwTyLfVUvKxMqAgKf+Lx3UT9DjroamXNUdXhLbvp8yznnaciLTtHUTWyH
         BAOWl2YlDzKgfDA2Igs+b4u/Sf6ojJrZXT/bXWh5pYdZHZyEIQf+wlxunRPU4dOzJbPG
         4KB2+tIeNLXiIKpjv2B4lBPaNGtaCwdNb5blFGN0mcnJPnckXSjYMWae2Y8nwRn5Vtgu
         DilF1TI2BG6MVIbi9muOV4SbRahRFLqPN2ePzCubS+T4rfxPQB20MT6Zqk6tAI1hbrM3
         dWPA==
X-Forwarded-Encrypted: i=1; AJvYcCX05Ac6E1yM+Zf6sZHi0EKywdhHYAEi4VC6zivIlW1ag7UmqA7Nlxa3HbGv/Dv1rBtudSe8rEi+QQumzQ==@linaro.org
X-Gm-Message-State: AOJu0Yz7tLQLPCZq8mhcL/lvea+rIkMuOKCX+wB52NFbu/OPREvFOBqT
	3lpjHmWmsAf2zYz8SM1jpEzYRGpuVn1ec8W+gOEj0VoLbYarvcYAj5w6Ga5c7M/rbA==
X-Gm-Gg: ASbGncscOwyT4/j4XVjdMu1IrBlBM909i70ugQ7NEG9QlI7spU8M4F8OZ/rNUPG8up3
	bP0V2oW88euE+PH3I2Zf0UsqG3T9bP6ePEHMPlTOZnz8a9KWnlT/BTIA07DiZ2sWYZ0bMcCMY/E
	KnW0LV8AKV9+A8RJ0q4ZhoIYXSXtJKu3gN8lXaL5Hsmco9nmJEDsA4g4TN6kKzqV365xFHHN4uq
	xwV04vflXt/fAJ/IIfep2bqj5YibejoS8H0745jLFdUJQND1NdJZogmuS3vdTHd4bdljdNocLG1
	wE0GI08TSnO6uBMTNV0iZpWQQR2bF3yQ3zddfl937TiKHvdRR6rvMGgyAGPs17GzBhEV
X-Google-Smtp-Source: AGHT+IETmexpnPzy5asUNH7L61TM7FIk56BJdgjCieEAWISIOp2MN6FnQVD6a0eBg54AiItWl2hCbA==
X-Received: by 2002:a17:903:1a08:b0:223:f928:4553 with SMTP id d9443c01a7336-22649a7ff9cmr77267365ad.44.1742427351422;
        Wed, 19 Mar 2025 16:35:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa815sm121697505ad.102.2025.03.19.16.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:35:51 -0700 (PDT)
Message-ID: <6bf1aea4-9709-4216-9cd8-4e413caf6872@linaro.org>
Date: Wed, 19 Mar 2025 16:35:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
 <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
 <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
 <a3b61916-2466-4ec8-a4e1-567581be7a2b@linaro.org>
 <CAFEAcA9jsFqD-BR+zTzWV1V92fJqpghaOrGq1rDcdidm=R94Pw@mail.gmail.com>
 <8291b89a-9e97-47e6-9ee6-fd407066c3bf@linaro.org>
In-Reply-To: <8291b89a-9e97-47e6-9ee6-fd407066c3bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: kWhuQqsJWBzT

T24gMy8xOC8yNSAxMToxMywgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gMy8xOC8y
NSAxMTowNiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4+IE9uIFR1ZSwgMTggTWFyIDIwMjUg
YXQgMTc6NTIsIFBpZXJyaWNrIEJvdXZpZXINCj4+IDxwaWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+IHdyb3RlOg0KPj4+DQo+Pj4gT24gMy8xOC8yNSAxMDo1MCwgUGV0ZXIgTWF5ZGVs
bCB3cm90ZToNCj4+Pj4gT24gVHVlLCAxOCBNYXIgMjAyNSBhdCAxNzo0MiwgUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+
PiBPbiAxOC8zLzI1IDA1OjUxLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+Pj4+IERp
cmVjdGx5IGNvbmRpdGlvbiBhc3NvY2lhdGVkIGNhbGxzIGluIHRhcmdldC9hcm0vaGVscGVy
LmMgZm9yIG5vdy4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJv
dXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+Pj4+PiAtLS0NCj4+Pj4+
PiAgICAgIHRhcmdldC9hcm0vY3B1LmggICAgfCA4IC0tLS0tLS0tDQo+Pj4+Pj4gICAgICB0
YXJnZXQvYXJtL2hlbHBlci5jIHwgNiArKysrKysNCj4+Pj4+PiAgICAgIDIgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vY3B1LmggYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4+
Pj4gaW5kZXggNTFiNjQyOGNmZWMuLjkyMDVjYmRlYzQzIDEwMDY0NA0KPj4+Pj4+IC0tLSBh
L3RhcmdldC9hcm0vY3B1LmgNCj4+Pj4+PiArKysgYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4+
Pj4gQEAgLTEyMjIsNyArMTIyMiw2IEBAIGludCBhcm1fY3B1X3dyaXRlX2VsZjMyX25vdGUo
V3JpdGVDb3JlRHVtcEZ1bmN0aW9uIGYsIENQVVN0YXRlICpjcywNCj4+Pj4+PiAgICAgICAq
Lw0KPj4+Pj4+ICAgICAgdm9pZCBhcm1fZW11bGF0ZV9maXJtd2FyZV9yZXNldChDUFVTdGF0
ZSAqY3B1c3RhdGUsIGludCB0YXJnZXRfZWwpOw0KPj4+Pj4+DQo+Pj4+Pj4gLSNpZmRlZiBU
QVJHRVRfQUFSQ0g2NA0KPj4+Pj4+ICAgICAgaW50IGFhcmNoNjRfY3B1X2dkYl9yZWFkX3Jl
Z2lzdGVyKENQVVN0YXRlICpjcHUsIEdCeXRlQXJyYXkgKmJ1ZiwgaW50IHJlZyk7DQo+Pj4+
Pj4gICAgICBpbnQgYWFyY2g2NF9jcHVfZ2RiX3dyaXRlX3JlZ2lzdGVyKENQVVN0YXRlICpj
cHUsIHVpbnQ4X3QgKmJ1ZiwgaW50IHJlZyk7DQo+Pj4+Pj4gICAgICB2b2lkIGFhcmNoNjRf
c3ZlX25hcnJvd192cShDUFVBUk1TdGF0ZSAqZW52LCB1bnNpZ25lZCB2cSk7DQo+Pj4+Pj4g
QEAgLTEyNTQsMTMgKzEyNTMsNiBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2NF90ICpzdmVfYnN3
YXA2NCh1aW50NjRfdCAqZHN0LCB1aW50NjRfdCAqc3JjLCBpbnQgbnIpDQo+Pj4+Pj4gICAg
ICAjZW5kaWYNCj4+Pj4+PiAgICAgIH0NCj4+Pj4+Pg0KPj4+Pj4+IC0jZWxzZQ0KPj4+Pj4+
IC1zdGF0aWMgaW5saW5lIHZvaWQgYWFyY2g2NF9zdmVfbmFycm93X3ZxKENQVUFSTVN0YXRl
ICplbnYsIHVuc2lnbmVkIHZxKSB7IH0NCj4+Pj4+PiAtc3RhdGljIGlubGluZSB2b2lkIGFh
cmNoNjRfc3ZlX2NoYW5nZV9lbChDUFVBUk1TdGF0ZSAqZW52LCBpbnQgbywNCj4+Pj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbiwgYm9vbCBh
KQ0KPj4+Pj4+IC17IH0NCj4+Pj4+PiAtI2VuZGlmDQo+Pj4+Pj4gLQ0KPj4+Pj4+ICAgICAg
dm9pZCBhYXJjaDY0X3N5bmNfMzJfdG9fNjQoQ1BVQVJNU3RhdGUgKmVudik7DQo+Pj4+Pj4g
ICAgICB2b2lkIGFhcmNoNjRfc3luY182NF90b18zMihDUFVBUk1TdGF0ZSAqZW52KTsNCj4+
Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2hlbHBlci5jIGIvdGFyZ2V0
L2FybS9oZWxwZXIuYw0KPj4+Pj4+IGluZGV4IGI0NmIyYmZmY2YzLi43NzRlMWVlMDI0NSAx
MDA2NDQNCj4+Pj4+PiAtLS0gYS90YXJnZXQvYXJtL2hlbHBlci5jDQo+Pj4+Pj4gKysrIGIv
dGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4+Pj4+IEBAIC02NTYyLDcgKzY1NjIsOSBAQCBzdGF0
aWMgdm9pZCB6Y3Jfd3JpdGUoQ1BVQVJNU3RhdGUgKmVudiwgY29uc3QgQVJNQ1BSZWdJbmZv
ICpyaSwNCj4+Pj4+PiAgICAgICAgICAgKi8NCj4+Pj4+PiAgICAgICAgICBuZXdfbGVuID0g
c3ZlX3ZxbTFfZm9yX2VsKGVudiwgY3VyX2VsKTsNCj4+Pj4+PiAgICAgICAgICBpZiAobmV3
X2xlbiA8IG9sZF9sZW4pIHsNCj4+Pj4+PiArI2lmZGVmIFRBUkdFVF9BQVJDSDY0DQo+Pj4+
Pg0KPj4+Pj4gV2hhdCBhYm91dCB1c2luZyBydW50aW1lIGNoZWNrIGluc3RlYWQ/DQo+Pj4+
Pg0KPj4+Pj4gICAgICBpZiAoYXJtX2ZlYXR1cmUoJmNwdS0+ZW52LCBBUk1fRkVBVFVSRV9B
QVJDSDY0KSAmJiBuZXdfbGVuIDwgb2xkX2xlbikgew0KPj4+Pj4NCj4+Pj4NCj4+Pj4gVGhh
dCB3b3VsZCBiZSBhIGRlYWQgY2hlY2s6IGl0IGlzIG5vdCBwb3NzaWJsZSB0byBnZXQgaGVy
ZQ0KPj4+PiB1bmxlc3MgQVJNX0ZFQVRVUkVfQUFSQ0g2NCBpcyBzZXQuDQo+Pj4+DQo+Pj4N
Cj4+PiBXZSBjYW4gdGhlbiBhc3NlcnQgaXQsIHRvIG1ha2Ugc3VyZSB0aGVyZSBpcyBubyBy
ZWdyZXNzaW9uIGFyb3VuZCB0aGF0Lg0KPj4NCj4+IFdlIGhhdmUgYSBsb3Qgb2Ygd3JpdGUv
cmVhZC9hY2Nlc3MgZm5zIGZvciBBQXJjaDY0LW9ubHkgc3lzcmVncywgYW5kDQo+PiB3ZSBk
b24ndCBuZWVkIHRvIGFzc2VydCBpbiBhbGwgb2YgdGhlbSB0aGF0IHRoZXkncmUgY2FsbGVk
IG9ubHkgd2hlbg0KPj4gdGhlIENQVSBoYXMgQUFyY2g2NCBlbmFibGVkLg0KPj4NCj4+PiBX
ZSBub3cgaGF2ZSBhbm90aGVyIGNvbnZlcnNhdGlvbiBhbmQgc29tZXRoaW5nIHRvIGRlY2lk
ZSBpbiBhbm90aGVyDQo+Pj4gZmlsZSwgYW5kIHRoYXQncyB3aHkgSSBjaG9zZSB0byBkbyB0
aGUgbWluaW1hbCBjaGFuZ2UgKCJpZmRlZiB0aGUNCj4+PiBpc3N1ZSIpIGluc3RlYWQgb2Yg
dHJ5aW5nIHRvIGRvIGFueSBjaGFuZ2UuDQo+Pg0KPj4gSSB0aGluayB3ZSBjYW4gZmFpcmx5
IGVhc2lseSBhdm9pZCBpZmRlZmZpbmcgdGhlIGNhbGxzaXRlIG9mDQo+PiBhYXJjaDY0X3N2
ZV9uYXJyb3dfdnEoKS4gQ3VycmVudGx5IHdlIGhhdmU6DQo+PiAgICAqIGEgcmVhbCB2ZXJz
aW9uIG9mIHRoZSBmdW5jdGlvbiwgd2hvc2UgZGVmaW5pdGlvbiBpcyBpbnNpZGUNCj4+ICAg
ICAgYW4gaWZkZWYgVEFSR0VUX0FBUkNINjQgaW4gdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4g
ICAgKiBhIHN0dWIgdmVyc2lvbiwgaW5saW5lIGluIHRoZSBjcHUuaCBoZWFkZXINCj4+DQo+
PiBJZiB3ZSBkb24ndCB3YW50IHRvIGhhdmUgdGhlIHN0dWIgdmVyc2lvbiB3aXRoIGlmZGVm
cywgdGhlbiB3ZSBjYW4NCj4+IG1vdmUgdGhlIHJlYWwgaW1wbGVtZW50YXRpb24gb2YgdGhl
IGZ1bmN0aW9uIHRvIG5vdCBiZSBpbnNpZGUgdGhlDQo+PiBpZmRlZiAobWF0Y2hpbmcgdGhl
IGZhY3QgdGhhdCB0aGUgcHJvdG90eXBlIGlzIG5vIGxvbmdlciBpbnNpZGUNCj4+IGFuIGlm
ZGVmKS4gVGhlIGZ1bmN0aW9uIGRvZXNuJ3QgY2FsbCBhbnkgb3RoZXIgZnVuY3Rpb25zIHRo
YXQgYXJlDQo+PiBUQVJHRVRfQUFSQ0g2NCBvbmx5LCBzbyBpdCBzaG91bGRuJ3QgYmUgYSAi
bm93IHdlIGhhdmUgdG8gbW92ZQ0KPj4gNTAgb3RoZXIgdGhpbmdzIiBwcm9ibGVtLCBJIGhv
cGUuDQo+Pg0KPiANCj4gSSdsbCB0cnkgdG8ganVzdCBsZXQgdGhlIGNhbGwgYmUgZG9uZSwg
YW5kIHNlZSB3aGF0IGhhcHBlbnMuDQo+IEJ1dCBpZiBJIG1lZXQgYSByZWdyZXNzaW9uIHNv
bWV3aGVyZSBpbiB0YXJnZXQvYXJtLyosIEknbGwgc2ltcGx5DQo+IGxldCB0aGUgY3VycmVu
dCBpZmRlZiBmb3Igbm93Lg0KPiANCj4gSSB1bmRlcnN0YW5kIGl0ICJzaG91bGQgYmUgb2si
LCBidXQgSSBqdXN0IHdhbnQgdG8gZm9jdXMgb24gaHcvYXJtLCBhbmQNCj4gbm90IHN0YXJ0
IGZ1cnRoZXIgY2hhbmdlcyBpbiB0YXJnZXQvYXJtL2hlbHBlci5jIGFzIGEgc2lkZSBlZmZl
Y3Qgb2YNCj4gc2ltcGx5IG1vdmluZyBhbiBpZmRlZiBpbiBhIGhlYWRlci4NCj4gDQoNCkkg
dHJpZWQgdG8gc2ltcGx5IGlmZGVmIGZ1bmN0aW9ucyBkZXBlbmRpbmcgb24gdGhvc2Ugc3lt
Ym9scy4gSG93ZXZlciwgDQp0aGlzIGFkZHMgbXVjaCBtb3JlIGlmZGVmcyB0aGFuIHRoaXMg
b3JpZ2luYWwgcGF0Y2guDQpTb29uLCB3ZSdsbCBjb21wbGV0ZWx5IHJlbW92ZSB0aG9zZSBp
ZmRlZnMgZnJvbSB0YXJnZXQvYXJtL2hlbHBlci5jLCBzbyANCkknbGwganVzdCBjYWxsIGl0
IGEgZGF5IGZvciBub3csIHdpdGhvdXQgYWRkaW5nIHN0dWJzIHRoYXQgd2lsbCBiZSANCnJl
bW92ZWQgc29vbiBhcyB3ZWxsLg0KDQo+PiB0aGFua3MNCj4+IC0tIFBNTQ0KPiANCg0K
