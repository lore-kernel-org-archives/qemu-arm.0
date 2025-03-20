Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1195418njc;
        Thu, 20 Mar 2025 12:42:17 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-7390593d43fmr1041348b3a.2.1742499737404;
        Thu, 20 Mar 2025 12:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499737; cv=none;
        d=google.com; s=arc-20240605;
        b=DWgNx12OQUpCCyPIewjQoQc8QoZLwGnXcKUBKzsuwyVEhBhGhdHLkArZp8ACw8QuUt
         L2+27FO+UjRN+MfQatFpn88NMzHtdMiB290MURCg3ytYFRxmkQckNWu5Mjph0CMRg8uI
         nKvAgMHwMYx42hWYV77rmob3jLW8ROV7UKu07YrU5Ro0q+1AdJHmJd3Vy6qn6h89K0to
         ujqHurOK4mwSia3p5yVOTYUYfFEFq8/sYAvyhtM3IL+jmb+ob1IlZ6PPNNScX5XW6hqj
         H+Ms21fEEh7obYhbZoTKeNSKxY2qfjuKngJx4WwODD2MCSETbBjlSQMbBzQQ5p4xMx35
         cNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EMwvOKF0/A4f2+Gdl9mtTGx9/d/FKbz7V7NF4P0ysdw=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=NdWkIj/3zA8A/QPCX/o1pH4eOPq1WvBNx/CifqzEYyEDawDd7HKJIX8LLKrG2aj1bu
         LYpOUQ2LDL1HCO9Eq9eHa1GgqrFaKkzX14Tq4Ayk4dA5z8jV0Rru/CsqwRG7B52L52wm
         Q+fRS9yfxRl4WffPgDmPuWLq7lfD98pRbSLVGS9+uCqNlfV602rI4/jRI8z9jWJUMzSj
         f5fmFE0t44jSTRgjveOZXfJWB+3vbpGXIEEk4IK5GhmD2Dc926uuEYcuakTLVzIq6Loe
         ekPbtIFE8IUC+cYcko5hlv2EucfomSswcizFBPK7189jbwplYK7KwTYvXqWsDZkkCVe9
         B9Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lelCfGny;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905ff2230sor164212b3a.6.2025.03.20.12.42.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lelCfGny;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499737; x=1743104537; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMwvOKF0/A4f2+Gdl9mtTGx9/d/FKbz7V7NF4P0ysdw=;
        b=lelCfGnyKHG2cnXPtxgULm2XMSIzWmaNcoXEIPYQbQwU1+jo/mBiJSCZ0wYaH6N5xi
         b0sihNDe9yElm1igQuggaE+KckgxcBbqfB33k5e8x6GlrZH1IOJcMSCxfheBTLkEfYep
         Azv1bRLTTutD5Qnl0wA28KbMD/UpgrZCxBBg8pGVOn1OR5wjYhx2CTR7TaTdsL9hM4FO
         v2JqoV7NkLs/Wy0TP6nZuk+9deYSA8bR0TmbkUSiwT+9MLQgvgO3i8tkG07Wo7bkxJEm
         uWJLRmOCHxeMwCvieGO2FxfEqLwSmE2chabUA3BrqWE9CjBiv99rFGj/tjn9rlqwqt1y
         J7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499737; x=1743104537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMwvOKF0/A4f2+Gdl9mtTGx9/d/FKbz7V7NF4P0ysdw=;
        b=VOWQstDs79zAT0wPm8yAKLVS+rxDsJOptwmhnF+RYopDcdGGLW++nFQreFEK2yfzQH
         AL5LwseLuDDQiNz1SirCDXy9V8gwXSsA7tZehZuE6yk7Irslc2q3WVA9Rpeoci4gkfnZ
         wPhyRjTz+ZOSnJVy+XMKTlklqNwxkDLgQg/nTy9cyHadXnfBfZSLIwkkPvWpQyD7+045
         Z4qX6hf2e8wvSkRg1Mp1VATS9LDBeX6v4viiZj4oVzdGDbKPSnQ3zBD+BEZD96ckE50P
         BJi1/ntF9Fncyy5lYuObtJek/IWiurmpEQO6jZt6CeRxDdpg/GHrIf0ezaNIebH6/4sY
         ht4A==
X-Gm-Message-State: AOJu0Yz7bTt52Tyb6n9iO9bkp7MyHRPXZPozOpGUPF9iJFgdHKfb74fk
	u2KSzUmxL4DF/GEXqteidtaWuVrU2EX0+2jG+1bPE5H1/8IJ0wXFr3NSH2f0j9qFwwqgNal1lwx
	hic4=
X-Gm-Gg: ASbGncv6iXQL7O4rk9wHL/s9RpXMrk+Q/ozM3Pc8rL018tsuQAxuSakhGPihEjUWpP8
	/bZvrEv632Q/7jheVd8sMcmEi3DJJEo1SBnz8E3tiNDmLu4EEHi5hj0/BnwJWiDVZRBoHBH39oJ
	pBR1zsclMiG/f8VU4lotQ0blMmMrmnObP8LIY5OvHeY9tNq5HIfj/aM0wB8ZOczHvFqO2JUmP9d
	UstfnwS2/qydYmQJAdl6YYhAumTVv2ddT5MPGUob3s5EvfGX0rkWG5xJMmrGXHXEqtn9m1Sp8J/
	Ez7AZbZI6T8TXgPk8HA9h+MFjCeBEQs2DTnceJFTbtS56TIUkd1kPyYzhg==
X-Google-Smtp-Source: AGHT+IGHbyMTZJwAJfgINZn4QN5cMJhWRDT34v/PV8RYWuQRK4dBFoqOf7d0VmKumM5SpPk3zoE9vQ==
X-Received: by 2002:a05:6a00:a29:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-739059763admr1262253b3a.8.1742499736767;
        Thu, 20 Mar 2025 12:42:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92d4sm211696b3a.23.2025.03.20.12.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:42:16 -0700 (PDT)
Message-ID: <e03abbd9-cb20-4a98-a112-66d13a76d244@linaro.org>
Date: Thu, 20 Mar 2025 12:42:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/arm: convert 64 bit gdbstub to new helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: NVjfrRPQELiG

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGb3Igc29tZSBvZiB0
aGUgaGVscGVycyB3ZSBuZWVkIGEgdGVtcG9yYXJ5IHZhcmlhYmxlIHRvIGNvcHkgZnJvbQ0K
PiBhbHRob3VnaCB3ZSBjb3VsZCBhZGQgc29tZSBoZWxwZXJzIHRvIHJldHVybiBwb2ludGVy
cyBpbnRvIGVudiBpbg0KPiB0aG9zZSBjYXNlcyBpZiB3ZSB3YW50ZWQgdG8uDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgIHRhcmdldC9hcm0vZ2Ric3R1YjY0LmMgfCA1MyArKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5z
ZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2FybS9nZGJzdHViNjQuYyBiL3RhcmdldC9hcm0vZ2Ric3R1YjY0LmMNCj4gaW5kZXggMWE0
ZGJlYzU2Ny4uNzkzMzMyYWYzMSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2FybS9nZGJzdHVi
NjQuYw0KPiArKysgYi90YXJnZXQvYXJtL2dkYnN0dWI2NC5jDQo+IEBAIC0yMCw3ICsyMCw3
IEBADQo+ICAgI2luY2x1ZGUgInFlbXUvbG9nLmgiDQo+ICAgI2luY2x1ZGUgImNwdS5oIg0K
PiAgICNpbmNsdWRlICJpbnRlcm5hbHMuaCINCj4gLSNpbmNsdWRlICJnZGJzdHViL2hlbHBl
cnMuaCINCj4gKyNpbmNsdWRlICJnZGJzdHViL3JlZ2lzdGVycy5oIg0KPiAgICNpbmNsdWRl
ICJnZGJzdHViL2NvbW1hbmRzLmgiDQo+ICAgI2luY2x1ZGUgInRjZy9tdGVfaGVscGVyLmgi
DQo+ICAgI2lmIGRlZmluZWQoQ09ORklHX1VTRVJfT05MWSkgJiYgZGVmaW5lZChDT05GSUdf
TElOVVgpDQo+IEBAIC0zNSwxNSArMzUsMTYgQEAgaW50IGFhcmNoNjRfY3B1X2dkYl9yZWFk
X3JlZ2lzdGVyKENQVVN0YXRlICpjcywgR0J5dGVBcnJheSAqbWVtX2J1ZiwgaW50IG4pDQo+
ICAgDQo+ICAgICAgIGlmIChuIDwgMzEpIHsNCj4gICAgICAgICAgIC8qIENvcmUgaW50ZWdl
ciByZWdpc3Rlci4gICovDQo+IC0gICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzY0KG1lbV9i
dWYsIGVudi0+eHJlZ3Nbbl0pOw0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rl
cl92YWx1ZShNT19URVVPLCBtZW1fYnVmLCAodWludDhfdCAqKSAmZW52LT54cmVnc1tuXSk7
DQo+ICAgICAgIH0NCj4gICAgICAgc3dpdGNoIChuKSB7DQo+ICAgICAgIGNhc2UgMzE6DQo+
IC0gICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzY0KG1lbV9idWYsIGVudi0+eHJlZ3NbMzFd
KTsNCj4gKyAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUoTU9fVEVVTywg
bWVtX2J1ZiwgKHVpbnQ4X3QgKikgJmVudi0+eHJlZ3NbMzFdKTsNCj4gICAgICAgY2FzZSAz
MjoNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnNjQobWVtX2J1ZiwgZW52LT5wYyk7
DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVU8sIG1l
bV9idWYsICh1aW50OF90ICopICZlbnYtPnBjKTsNCg0KRm9yIHRoZSAzIG9jY3VycmVuY2Vz
LCBzaG91bGQgaXQgYmUgTU9fVEVVUSBpbnN0ZWFkPw0KDQo+ICAgICAgIGNhc2UgMzM6DQo+
IC0gICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyKG1lbV9idWYsIHBzdGF0ZV9yZWFkKGVu
dikpOw0KPiArICAgICAgICB1aW50MzJfdCBwc3RhdGUgPSBwc3RhdGVfcmVhZChlbnYpOw0K
PiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBtZW1f
YnVmLCAodWludDhfdCAqKSAmcHN0YXRlKTsNCj4gICAgICAgfQ0KPiAgICAgICAvKiBVbmtu
b3duIHJlZ2lzdGVyLiAgKi8NCj4gICAgICAgcmV0dXJuIDA7DQo+IEBAIC04MiwyMyArODMs
MjcgQEAgaW50IGFhcmNoNjRfZ2RiX2dldF9mcHVfcmVnKENQVVN0YXRlICpjcywgR0J5dGVB
cnJheSAqYnVmLCBpbnQgcmVnKQ0KPiAgIHsNCj4gICAgICAgQVJNQ1BVICpjcHUgPSBBUk1f
Q1BVKGNzKTsNCj4gICAgICAgQ1BVQVJNU3RhdGUgKmVudiA9ICZjcHUtPmVudjsNCj4gKyAg
ICB1aW50MzJfdCBmcHI7DQo+ICAgDQo+ICAgICAgIHN3aXRjaCAocmVnKSB7DQo+ICAgICAg
IGNhc2UgMCAuLi4gMzE6DQo+ICAgICAgIHsNCj4gICAgICAgICAgIC8qIDEyOCBiaXQgRlAg
cmVnaXN0ZXIgLSBxdWFkcyBhcmUgaW4gTEUgb3JkZXIgKi8NCj4gICAgICAgICAgIHVpbnQ2
NF90ICpxID0gYWE2NF92ZnBfcXJlZyhlbnYsIHJlZyk7DQo+IC0gICAgICAgIHJldHVybiBn
ZGJfZ2V0X3JlZzEyOChidWYsIHFbMV0sIHFbMF0pOw0KPiArICAgICAgICByZXR1cm4gZ2Ri
X2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVPLCBidWYsICh1aW50OF90ICopIHEpOw0KPiAg
ICAgICB9DQo+ICAgICAgIGNhc2UgMzI6DQo+ICAgICAgICAgICAvKiBGUFNSICovDQo+IC0g
ICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyKGJ1ZiwgdmZwX2dldF9mcHNyKGVudikpOw0K
PiArICAgICAgICBmcHIgPSB2ZnBfZ2V0X2Zwc3IoZW52KTsNCj4gKyAgICAgICAgYnJlYWs7
DQo+ICAgICAgIGNhc2UgMzM6DQo+ICAgICAgICAgICAvKiBGUENSICovDQo+IC0gICAgICAg
IHJldHVybiBnZGJfZ2V0X3JlZzMyKGJ1ZiwgdmZwX2dldF9mcGNyKGVudikpOw0KPiArICAg
ICAgICBmcHIgPSB2ZnBfZ2V0X2ZwY3IoZW52KTsNCj4gKyAgICAgICAgYnJlYWs7DQo+ICAg
ICAgIGRlZmF1bHQ6DQo+ICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgfQ0KPiArICAg
IHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVUwsIGJ1ZiwgKHVpbnQ4X3Qg
KikgJmZwcik7DQo+ICAgfQ0KPiAgIA0KPiAgIGludCBhYXJjaDY0X2dkYl9zZXRfZnB1X3Jl
ZyhDUFVTdGF0ZSAqY3MsIHVpbnQ4X3QgKmJ1ZiwgaW50IHJlZykNCj4gQEAgLTEzMiwzMCAr
MTM3LDM3IEBAIGludCBhYXJjaDY0X2dkYl9nZXRfc3ZlX3JlZyhDUFVTdGF0ZSAqY3MsIEdC
eXRlQXJyYXkgKmJ1ZiwgaW50IHJlZykNCj4gICB7DQo+ICAgICAgIEFSTUNQVSAqY3B1ID0g
QVJNX0NQVShjcyk7DQo+ICAgICAgIENQVUFSTVN0YXRlICplbnYgPSAmY3B1LT5lbnY7DQo+
ICsgICAgdWludDMyX3QgZnByOw0KPiAgIA0KPiAgICAgICBzd2l0Y2ggKHJlZykgew0KPiAg
ICAgICAvKiBUaGUgZmlyc3QgMzIgcmVnaXN0ZXJzIGFyZSB0aGUgenJlZ3MgKi8NCj4gICAg
ICAgY2FzZSAwIC4uLiAzMToNCj4gICAgICAgew0KPiAgICAgICAgICAgaW50IHZxLCBsZW4g
PSAwOw0KPiArICAgICAgICBBUk1WZWN0b3JSZWcgKnpyZWcgPSAmZW52LT52ZnAuenJlZ3Nb
cmVnXTsNCj4gKw0KPiAgICAgICAgICAgZm9yICh2cSA9IDA7IHZxIDwgY3B1LT5zdmVfbWF4
X3ZxOyB2cSsrKSB7DQo+IC0gICAgICAgICAgICBsZW4gKz0gZ2RiX2dldF9yZWcxMjgoYnVm
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudi0+dmZwLnpyZWdz
W3JlZ10uZFt2cSAqIDIgKyAxXSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnYtPnZmcC56cmVnc1tyZWddLmRbdnEgKiAyXSk7DQo+ICsgICAgICAgICAgICBs
ZW4gKz0gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVRLCBidWYsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWludDhfdCAqKSAmenJlZy0+
ZFt2cSAqIDIgKyAxXSk7DQo+ICsgICAgICAgICAgICBsZW4gKz0gZ2RiX2dldF9yZWdpc3Rl
cl92YWx1ZShNT19URVVRLCBidWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodWludDhfdCAqKSAmenJlZy0+ZFt2cSAqIDJdKTsNCj4gICAgICAg
ICAgIH0NCj4gICAgICAgICAgIHJldHVybiBsZW47DQo+ICAgICAgIH0NCj4gICAgICAgY2Fz
ZSAzMjoNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCB2ZnBfZ2V0X2Zw
c3IoZW52KSk7DQo+ICsgICAgICAgIGZwciA9IHZmcF9nZXRfZnBzcihlbnYpOw0KPiArICAg
ICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYsICh1aW50
OF90ICopICZmcHIpOw0KPiAgICAgICBjYXNlIDMzOg0KPiAtICAgICAgICByZXR1cm4gZ2Ri
X2dldF9yZWczMihidWYsIHZmcF9nZXRfZnBjcihlbnYpKTsNCj4gKyAgICAgICAgZnByID0g
dmZwX2dldF9mcGNyKGVudik7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVy
X3ZhbHVlKE1PX1RFVUwsIGJ1ZiwgKHVpbnQ4X3QgKikgJmZwcik7DQo+ICAgICAgIC8qIHRo
ZW4gMTYgcHJlZGljYXRlcyBhbmQgdGhlIGZmciAqLw0KPiAgICAgICBjYXNlIDM0IC4uLiA1
MDoNCj4gICAgICAgew0KPiAgICAgICAgICAgaW50IHByZWcgPSByZWcgLSAzNDsNCj4gICAg
ICAgICAgIGludCB2cSwgbGVuID0gMDsNCj4gICAgICAgICAgIGZvciAodnEgPSAwOyB2cSA8
IGNwdS0+c3ZlX21heF92cTsgdnEgPSB2cSArIDQpIHsNCj4gLSAgICAgICAgICAgIGxlbiAr
PSBnZGJfZ2V0X3JlZzY0KGJ1ZiwgZW52LT52ZnAucHJlZ3NbcHJlZ10ucFt2cSAvIDRdKTsN
Cj4gKyAgICAgICAgICAgIGxlbiArPSBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVVEs
IGJ1ZiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
aW50OF90ICopICZlbnYtPnZmcC5wcmVnc1twcmVnXS5wW3ZxIC8gNF0pOw0KPiAgICAgICAg
ICAgfQ0KPiAgICAgICAgICAgcmV0dXJuIGxlbjsNCj4gICAgICAgfQ0KPiBAQCAtMTY1LDgg
KzE3Nyw4IEBAIGludCBhYXJjaDY0X2dkYl9nZXRfc3ZlX3JlZyhDUFVTdGF0ZSAqY3MsIEdC
eXRlQXJyYXkgKmJ1ZiwgaW50IHJlZykNCj4gICAgICAgICAgICAqIFdlIHJlcG9ydCBpbiBW
ZWN0b3IgR3JhbnVsZXMgKFZHKSB3aGljaCBpcyA2NGJpdCBpbiBhIFogcmVnDQo+ICAgICAg
ICAgICAgKiB3aGlsZSB0aGUgWkNSIHdvcmtzIGluIFZlY3RvciBRdWFkcyAoVlEpIHdoaWNo
IGlzIDEyOGJpdCBjaHVua3MuDQo+ICAgICAgICAgICAgKi8NCj4gLSAgICAgICAgaW50IHZx
ID0gc3ZlX3ZxbTFfZm9yX2VsKGVudiwgYXJtX2N1cnJlbnRfZWwoZW52KSkgKyAxOw0KPiAt
ICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWc2NChidWYsIHZxICogMik7DQo+ICsgICAgICAg
IHVpbnQ2NF90IHZxID0gKHN2ZV92cW0xX2Zvcl9lbChlbnYsIGFybV9jdXJyZW50X2VsKGVu
dikpICsgMSkgKiAyOw0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1
ZShNT19URVVMLCBidWYsICh1aW50OF90ICopICZ2cSk7DQo+ICAgICAgIH0NCg0KU2hvdWxk
IGl0IGJlIE1PX1RFVVEgaW5zdGVhZD8NCg0KPiAgICAgICBkZWZhdWx0Og0KPiAgICAgICAg
ICAgLyogZ2Ric3R1YiBhc2tlZCBmb3Igc29tZXRoaW5nIG91dCBvdXIgcmFuZ2UgKi8NCj4g
QEAgLTI0OCwxMCArMjYwLDExIEBAIGludCBhYXJjaDY0X2dkYl9nZXRfcGF1dGhfcmVnKENQ
VVN0YXRlICpjcywgR0J5dGVBcnJheSAqYnVmLCBpbnQgcmVnKQ0KPiAgICAgICAgICAgICAg
IGJvb2wgaXNfZGF0YSA9ICEocmVnICYgMSk7DQo+ICAgICAgICAgICAgICAgYm9vbCBpc19o
aWdoID0gcmVnICYgMjsNCj4gICAgICAgICAgICAgICBBUk1NTVVJZHggbW11X2lkeCA9IGFy
bV9zdGFnZTFfbW11X2lkeChlbnYpOw0KPiAtICAgICAgICAgICAgQVJNVkFQYXJhbWV0ZXJz
IHBhcmFtOw0KPiArICAgICAgICAgICAgQVJNVkFQYXJhbWV0ZXJzIHBhcmFtID0gYWE2NF92
YV9wYXJhbWV0ZXJzKGVudiwgLWlzX2hpZ2gsIG1tdV9pZHgsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfZGF0YSwgZmFs
c2UpOw0KPiArICAgICAgICAgICAgdWludDY0X3QgcGF1dGhfbWFzayA9IHBhdXRoX3B0cl9t
YXNrKHBhcmFtKTsNCj4gICANCj4gLSAgICAgICAgICAgIHBhcmFtID0gYWE2NF92YV9wYXJh
bWV0ZXJzKGVudiwgLWlzX2hpZ2gsIG1tdV9pZHgsIGlzX2RhdGEsIGZhbHNlKTsNCj4gLSAg
ICAgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzY0KGJ1ZiwgcGF1dGhfcHRyX21hc2socGFy
YW0pKTsNCj4gKyAgICAgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1P
X1RFVVEsIGJ1ZiwgKHVpbnQ4X3QgKikgJnBhdXRoX21hc2spOw0KPiAgICAgICAgICAgfQ0K
PiAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgICAgcmV0dXJuIDA7DQo+IEBAIC0zOTksNyAr
NDEyLDcgQEAgaW50IGFhcmNoNjRfZ2RiX2dldF90YWdfY3RsX3JlZyhDUFVTdGF0ZSAqY3Ms
IEdCeXRlQXJyYXkgKmJ1ZiwgaW50IHJlZykNCj4gICANCj4gICAgICAgdGNmMCA9IGV4dHJh
Y3Q2NChlbnYtPmNwMTUuc2N0bHJfZWxbMV0sIDM4LCAyKTsNCj4gICANCj4gLSAgICByZXR1
cm4gZ2RiX2dldF9yZWc2NChidWYsIHRjZjApOw0KPiArICAgIHJldHVybiBnZGJfZ2V0X3Jl
Z2lzdGVyX3ZhbHVlKE1PX1RFVVEsIGJ1ZiwgKHVpbnQ4X3QgKikgJnRjZjApOw0KPiAgIH0N
Cj4gICANCj4gICBpbnQgYWFyY2g2NF9nZGJfc2V0X3RhZ19jdGxfcmVnKENQVVN0YXRlICpj
cywgdWludDhfdCAqYnVmLCBpbnQgcmVnKQ0KDQo=
