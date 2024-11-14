Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89764njc;
        Wed, 13 Nov 2024 20:12:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqQcLHeUSo5bNSDiHM7cHqJ1Hb22RBcUmK4DiMC4xKi1Xp9jmm3cAtm0bTm1Pn8OBdCt6W7sRu0OhG8A==@linaro.org
X-Received: by 2002:a17:90b:4a85:b0:2e2:ebbb:760c with SMTP id 98e67ed59e1d1-2ea06301150mr797513a91.11.1731557553420;
        Wed, 13 Nov 2024 20:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557553; cv=none;
        d=google.com; s=arc-20240605;
        b=KeBrm03wYF1/cuPj/qFAUiMgDtKPwfZ7UJ4qo1BkMvCUy8H9f2DuZW83pHBcdw9Ggk
         51FqW5jk25ymK70BemdRWbHPNa67vRlrILpJcN4LJ/EjsoKtzm5dZ7qL29uVeiEJ6jS8
         E0KJVCih2xQssdLVc0HPwQc+45dox/oivBrjkw8JcSCE7YbChWL4tEKhHNxbZrSyum89
         Jo/F6af+mOdZ06LE/NLbMD7V9hIcqa+9DIqJirsgxm1vnReOCsBbnNK/1vhlN+vnjsHe
         ytdcquP2kjGVvj2QbTVtmgkdMVkg2lksin18hEjgF66ucLlYsm9ZbBGZbBeJQzEg6X3X
         CKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SW4rqpAE4op4kk5kd+bqXV2Y1zzekdwTP/zbDT7DlJc=;
        fh=p2mkMJoopRzRvJBPnYft6Uvp1NC+DdiB3ecW6tmjtJk=;
        b=HDw+jB9xJyNrbPDl4+uqpamFKDs0id8jxLJ1RHwOtL2fwOvmGlxzkMjareCnPWh4gC
         M5aM3b8ZuwG8uAlWoHOGqRmD43qptw1qRdXIKUDN40fz5PKbFP0aHzloMBBEl9eLuqSv
         4WfkMTn7ON5DeTwnCl8Ds5//28yvnHRIayq3QFrr6IEQiX9vsIVuqLEzFNyxwoLmW4N1
         FC43cA3zD6cxDvIfaFsvl9/hcsbL/LMS3/SWBBkyssNPvM7hTPqgmsunKcEqyBotXaHf
         6qevIpYMzkLwX1+vCpxGhy3Q6wZG9aPXYuWibLE8CbQ+mdVA63Wf3y6Jk2bHGgAiay1U
         2zqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyE6UbRF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea08026ed2sor220743a91.5.2024.11.13.20.12.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yyE6UbRF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557553; x=1732162353; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SW4rqpAE4op4kk5kd+bqXV2Y1zzekdwTP/zbDT7DlJc=;
        b=yyE6UbRF/hoGrbumK0WfpvnkkbtqPX3+cvt7uXYn3s7uS4WeG2wkGieTq9vYRi1U4F
         W4cdANMab691s/7+t/g/6QkdDjgShCyvvOiep6snsvO7olRGB44JA6SHfON5MeLuH4Wc
         mUYgfZApVD2gmAJtcFsCd8/T4X1JZfNiuIi561IhC7IzJ0voseE3/2+uGSpoAL5xqgQO
         +X5tloxoPNNwNdovxnModifgHm9O9LLCxSlrEVrUvZUJwLWUJulJ5oGkHZe2OwJYt1z5
         tG76PK+6PktGIA6kc8rWwm3Zj102trVmeTK/9hekd6JumOmA4lT4QNZ75ZV6tql0gWj9
         cLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557553; x=1732162353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SW4rqpAE4op4kk5kd+bqXV2Y1zzekdwTP/zbDT7DlJc=;
        b=XFB0ohtArxvN2y8TUT4b4RKA7sQwa+W3HsGZ2vreJSc2s0BHMPTJ4LjaAEthEs05gC
         vFBNQDTUE30t1ClN5CzhOkGjv0rmSqrhI5V+wY9qHQYRr4O/2RCSN0pjgWgFW710KT+Y
         FBDdyuhlv2p3EQFIVtkmwzFg9Z23Z2iXAwiHgxxrX3tSBEr6cmdLnwvwoKl3hlxKl4sy
         ogYvxAjuXUq2y+WTDGjeray99FsNT0STrHeppyVn5K/3ri8EjWv9AeCQm9aHWMExAG1l
         +e8dBlIIr4O1snFAZSQ8TIbkQ2nsc9DX6Ie2mlL8JMwkwg3tCJuNk3IgCnQhCwgx+tia
         DC1w==
X-Forwarded-Encrypted: i=1; AJvYcCVCoRfPqRPp3SqWSGZL2P6gRWJHcCcqU7ZuXmROKJT6qfHPbdN4cEpyjvHWqRi4UuEJfzjOaMuYwfDTHg==@linaro.org
X-Gm-Message-State: AOJu0YwNT7IeZKElfuJgeTI//DnM3FCok6hwsIAtI9LOggaA8ZId+s4N
	8Clk4wJRYMu2VB2bzRbovkL7XBhDm2YT0HyGOEpi4GLAhJooKfeN1Ui7oCBA+daIKw==
X-Google-Smtp-Source: AGHT+IH9T0hwz9ElsHvdqfgd2BgzAWiGabb+SKD5TSpfTpmBFElgf1RU9WJUVH4dDvmX6u4wWt6zEQ==
X-Received: by 2002:a17:90b:3b46:b0:2e2:bfba:18d4 with SMTP id 98e67ed59e1d1-2ea0631c431mr946364a91.17.1731557552857;
        Wed, 13 Nov 2024 20:12:32 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f4ceacsm227351a91.29.2024.11.13.20.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:12:32 -0800 (PST)
Message-ID: <4cb85372-e062-40d8-bd5a-4c05a70c68e6@linaro.org>
Date: Wed, 13 Nov 2024 20:12:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/24] exec: Introduce 'user/guest-host.h' header
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
 <20241114011310.3615-12-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 4oQnb2Zc8DKc

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBF
eHRyYWN0IGFsbCBkZWNsYXJhdGlvbnMgcmVsYXRlZCB0byAnZ3Vlc3QgZnJvbS90byBob3N0
Jw0KPiBhZGRyZXNzIHRyYW5zbGF0aW9uIHRvIGEgbmV3ICJ1c2VyL2d1ZXN0LWhvc3QuaCIg
aGVhZGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2V4ZWMvY3B1LWFsbC5o
ICAgIHwgMzQgKy0tLS0tLS0tLS0tLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdV9sZHN0Lmgg
ICB8IDQ3ICstLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGluY2x1ZGUvdXNlci9ndWVzdC1o
b3N0LmggfCA4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
ICAzIGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9ucygtKQ0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VzZXIvZ3Vlc3QtaG9zdC5oDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2NwdS1hbGwuaCBiL2luY2x1ZGUvZXhlYy9j
cHUtYWxsLmgNCj4gaW5kZXggMWM0MGUyNzY3Mi4uMWM4ZTA0NDZkMCAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS9leGVjL2NwdS1hbGwuaA0KPiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1LWFs
bC5oDQo+IEBAIC02NCwzOSArNjQsNyBAQA0KPiAgIA0KPiAgIC8qIE1NVSBtZW1vcnkgYWNj
ZXNzIG1hY3JvcyAqLw0KPiAgIA0KPiAtI2lmIGRlZmluZWQoQ09ORklHX1VTRVJfT05MWSkN
Cj4gLSNpbmNsdWRlICJ1c2VyL2FiaXR5cGVzLmgiDQo+IC0NCj4gLS8qDQo+IC0gKiBJZiBu
b24temVybywgdGhlIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpcyBhIGNvbnRpZ3Vv
dXMgc3Vic2V0DQo+IC0gKiBvZiB0aGUgaG9zdCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UsIGku
ZS4gJy1SIHJlc2VydmVkX3ZhJyBpcyBpbiBlZmZlY3QNCj4gLSAqIGVpdGhlciBmcm9tIHRo
ZSBjb21tYW5kLWxpbmUgb3IgYnkgZGVmYXVsdC4gIFRoZSB2YWx1ZSBpcyB0aGUgbGFzdA0K
PiAtICogYnl0ZSBvZiB0aGUgZ3Vlc3QgYWRkcmVzcyBzcGFjZSBlLmcuIFVJTlQzMl9NQVgu
DQo+IC0gKg0KPiAtICogSWYgemVybywgdGhlIGhvc3QgYW5kIGd1ZXN0IHZpcnR1YWwgYWRk
cmVzcyBzcGFjZXMgYXJlIGludGVybWluZ2xlZC4NCj4gLSAqLw0KPiAtZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgcmVzZXJ2ZWRfdmE7DQo+IC0NCj4gLS8qDQo+IC0gKiBMaW1pdCB0aGUgZ3Vl
c3QgYWRkcmVzc2VzIGFzIGJlc3Qgd2UgY2FuLg0KPiAtICoNCj4gLSAqIFdoZW4gbm90IHVz
aW5nIC1SIHJlc2VydmVkX3ZhLCB3ZSBjYW5ub3QgcmVhbGx5IGxpbWl0IHRoZSBndWVzdA0K
PiAtICogdG8gbGVzcyBhZGRyZXNzIHNwYWNlIHRoYW4gdGhlIGhvc3QuICBGb3IgMzItYml0
IGd1ZXN0cywgdGhpcw0KPiAtICogYWN0cyBhcyBhIHNhbml0eSBjaGVjayB0aGF0IHdlJ3Jl
IG5vdCBnaXZpbmcgdGhlIGd1ZXN0IGFuIGFkZHJlc3MNCj4gLSAqIHRoYXQgaXQgY2Fubm90
IGV2ZW4gcmVwcmVzZW50LiAgRm9yIDY0LWJpdCBndWVzdHMuLi4gdGhlIGFkZHJlc3MNCj4g
LSAqIG1pZ2h0IG5vdCBiZSB3aGF0IHRoZSByZWFsIGtlcm5lbCB3b3VsZCBnaXZlLCBidXQg
aXQgaXMgYXQgbGVhc3QNCj4gLSAqIHJlcHJlc2VudGFibGUgaW4gdGhlIGd1ZXN0Lg0KPiAt
ICoNCj4gLSAqIFRPRE86IEltcHJvdmUgYWRkcmVzcyBhbGxvY2F0aW9uIHRvIGF2b2lkIHRo
aXMgcHJvYmxlbSwgYW5kIHRvDQo+IC0gKiBhdm9pZCBzZXR0aW5nIGJpdHMgYXQgdGhlIHRv
cCBvZiBndWVzdCBhZGRyZXNzZXMgdGhhdCBtaWdodCBuZWVkDQo+IC0gKiB0byBiZSB1c2Vk
IGZvciB0YWdzLg0KPiAtICovDQo+IC0jZGVmaW5lIEdVRVNUX0FERFJfTUFYXyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgKChN
SU5fQ09OU1QoVEFSR0VUX1ZJUlRfQUREUl9TUEFDRV9CSVRTLCBUQVJHRVRfQUJJX0JJVFMp
IDw9IDMyKSA/ICBcDQo+IC0gICAgIFVJTlQzMl9NQVggOiB+MHVsKQ0KPiAtI2RlZmluZSBH
VUVTVF9BRERSX01BWCAgICAocmVzZXJ2ZWRfdmEgPyA6IEdVRVNUX0FERFJfTUFYXykNCj4g
LQ0KPiAtI2Vsc2UNCj4gKyNpZiAhZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQ0KPiAgIA0K
PiAgICNpbmNsdWRlICJleGVjL2h3YWRkci5oIg0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9leGVjL2NwdV9sZHN0LmggYi9pbmNsdWRlL2V4ZWMvY3B1X2xkc3QuaA0KPiBpbmRl
eCBkYWMxMmJkOGViLi5hMjZhYjQ5YjBiIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMv
Y3B1X2xkc3QuaA0KPiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1X2xkc3QuaA0KPiBAQCAtNzIs
NTIgKzcyLDcgQEANCj4gICAjaW5jbHVkZSAicWVtdS9pbnQxMjguaCINCj4gICANCj4gICAj
aWYgZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQ0KPiAtDQo+IC0jaW5jbHVkZSAidXNlci9n
dWVzdC1iYXNlLmgiDQo+IC0NCj4gLSNpZm5kZWYgVEFSR0VUX1RBR0dFRF9BRERSRVNTRVMN
Cj4gLXN0YXRpYyBpbmxpbmUgYWJpX3B0ciBjcHVfdW50YWdnZWRfYWRkcihDUFVTdGF0ZSAq
Y3MsIGFiaV9wdHIgeCkNCj4gLXsNCj4gLSAgICByZXR1cm4geDsNCj4gLX0NCj4gLSNlbmRp
Zg0KPiAtDQo+IC0vKiBBbGwgZGlyZWN0IHVzZXMgb2YgZzJoIGFuZCBoMmcgbmVlZCB0byBn
byBhd2F5IGZvciB1c2VybW9kZSBzb2Z0bW11LiAgKi8NCj4gLXN0YXRpYyBpbmxpbmUgdm9p
ZCAqZzJoX3VudGFnZ2VkKGFiaV9wdHIgeCkNCj4gLXsNCj4gLSAgICByZXR1cm4gKHZvaWQg
KikoKHVpbnRwdHJfdCkoeCkgKyBndWVzdF9iYXNlKTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGlj
IGlubGluZSB2b2lkICpnMmgoQ1BVU3RhdGUgKmNzLCBhYmlfcHRyIHgpDQo+IC17DQo+IC0g
ICAgcmV0dXJuIGcyaF91bnRhZ2dlZChjcHVfdW50YWdnZWRfYWRkcihjcywgeCkpOw0KPiAt
fQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgZ3Vlc3RfYWRkcl92YWxpZF91bnRhZ2dl
ZChhYmlfdWxvbmcgeCkNCj4gLXsNCj4gLSAgICByZXR1cm4geCA8PSBHVUVTVF9BRERSX01B
WDsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGlubGluZSBib29sIGd1ZXN0X3JhbmdlX3ZhbGlk
X3VudGFnZ2VkKGFiaV91bG9uZyBzdGFydCwgYWJpX3Vsb25nIGxlbikNCj4gLXsNCj4gLSAg
ICByZXR1cm4gbGVuIC0gMSA8PSBHVUVTVF9BRERSX01BWCAmJiBzdGFydCA8PSBHVUVTVF9B
RERSX01BWCAtIGxlbiArIDE7DQo+IC19DQo+IC0NCj4gLSNkZWZpbmUgaDJnX3ZhbGlkKHgp
IFwNCj4gLSAgICAoSE9TVF9MT05HX0JJVFMgPD0gVEFSR0VUX1ZJUlRfQUREUl9TUEFDRV9C
SVRTIHx8IFwNCj4gLSAgICAgKHVpbnRwdHJfdCkoeCkgLSBndWVzdF9iYXNlIDw9IEdVRVNU
X0FERFJfTUFYKQ0KPiAtDQo+IC0jZGVmaW5lIGgyZ19ub2NoZWNrKHgpICh7IFwNCj4gLSAg
ICB1aW50cHRyX3QgX19yZXQgPSAodWludHB0cl90KSh4KSAtIGd1ZXN0X2Jhc2U7IFwNCj4g
LSAgICAoYWJpX3B0cilfX3JldDsgXA0KPiAtfSkNCj4gLQ0KPiAtI2RlZmluZSBoMmcoeCkg
KHsgXA0KPiAtICAgIC8qIENoZWNrIGlmIGdpdmVuIGFkZHJlc3MgZml0cyB0YXJnZXQgYWRk
cmVzcyBzcGFjZSAqLyBcDQo+IC0gICAgYXNzZXJ0KGgyZ192YWxpZCh4KSk7IFwNCj4gLSAg
ICBoMmdfbm9jaGVjayh4KTsgXA0KPiAtfSkNCj4gLQ0KPiArI2luY2x1ZGUgInVzZXIvZ3Vl
c3QtaG9zdC5oIg0KPiAgICNlbmRpZiAvKiBDT05GSUdfVVNFUl9PTkxZICovDQo+ICAgDQo+
ICAgdWludDMyX3QgY3B1X2xkdWJfZGF0YShDUFVBcmNoU3RhdGUgKmVudiwgYWJpX3B0ciBw
dHIpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91c2VyL2d1ZXN0LWhvc3QuaCBiL2luY2x1
ZGUvdXNlci9ndWVzdC1ob3N0LmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMC4uOGQyMDc5YmJiYg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2luY2x1
ZGUvdXNlci9ndWVzdC1ob3N0LmgNCj4gQEAgLTAsMCArMSw4NyBAQA0KPiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4xLW9yLWxhdGVyICovDQo+ICsvKg0KPiArICog
Z3Vlc3QgPC0+IGhvc3QgaGVscGVycy4NCj4gKyAqDQo+ICsgKiAgQ29weXJpZ2h0IChjKSAy
MDAzIEZhYnJpY2UgQmVsbGFyZA0KPiArICovDQo+ICsNCj4gKyNpZm5kZWYgVVNFUl9HVUVT
VF9IT1NUX0gNCj4gKyNkZWZpbmUgVVNFUl9HVUVTVF9IT1NUX0gNCj4gKw0KPiArI2luY2x1
ZGUgInVzZXIvYWJpdHlwZXMuaCINCj4gKyNpbmNsdWRlICJ1c2VyL2d1ZXN0LWJhc2UuaCIN
Cj4gKyNpbmNsdWRlICJjcHUuaCINCj4gKw0KPiArLyoNCj4gKyAqIElmIG5vbi16ZXJvLCB0
aGUgZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGlzIGEgY29udGlndW91cyBzdWJzZXQN
Cj4gKyAqIG9mIHRoZSBob3N0IHZpcnR1YWwgYWRkcmVzcyBzcGFjZSwgaS5lLiAnLVIgcmVz
ZXJ2ZWRfdmEnIGlzIGluIGVmZmVjdA0KPiArICogZWl0aGVyIGZyb20gdGhlIGNvbW1hbmQt
bGluZSBvciBieSBkZWZhdWx0LiAgVGhlIHZhbHVlIGlzIHRoZSBsYXN0DQo+ICsgKiBieXRl
IG9mIHRoZSBndWVzdCBhZGRyZXNzIHNwYWNlIGUuZy4gVUlOVDMyX01BWC4NCj4gKyAqDQo+
ICsgKiBJZiB6ZXJvLCB0aGUgaG9zdCBhbmQgZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIHNwYWNl
cyBhcmUgaW50ZXJtaW5nbGVkLg0KPiArICovDQo+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBy
ZXNlcnZlZF92YTsNCj4gKw0KPiArLyoNCj4gKyAqIExpbWl0IHRoZSBndWVzdCBhZGRyZXNz
ZXMgYXMgYmVzdCB3ZSBjYW4uDQo+ICsgKg0KPiArICogV2hlbiBub3QgdXNpbmcgLVIgcmVz
ZXJ2ZWRfdmEsIHdlIGNhbm5vdCByZWFsbHkgbGltaXQgdGhlIGd1ZXN0DQo+ICsgKiB0byBs
ZXNzIGFkZHJlc3Mgc3BhY2UgdGhhbiB0aGUgaG9zdC4gIEZvciAzMi1iaXQgZ3Vlc3RzLCB0
aGlzDQo+ICsgKiBhY3RzIGFzIGEgc2FuaXR5IGNoZWNrIHRoYXQgd2UncmUgbm90IGdpdmlu
ZyB0aGUgZ3Vlc3QgYW4gYWRkcmVzcw0KPiArICogdGhhdCBpdCBjYW5ub3QgZXZlbiByZXBy
ZXNlbnQuICBGb3IgNjQtYml0IGd1ZXN0cy4uLiB0aGUgYWRkcmVzcw0KPiArICogbWlnaHQg
bm90IGJlIHdoYXQgdGhlIHJlYWwga2VybmVsIHdvdWxkIGdpdmUsIGJ1dCBpdCBpcyBhdCBs
ZWFzdA0KPiArICogcmVwcmVzZW50YWJsZSBpbiB0aGUgZ3Vlc3QuDQo+ICsgKg0KPiArICog
VE9ETzogSW1wcm92ZSBhZGRyZXNzIGFsbG9jYXRpb24gdG8gYXZvaWQgdGhpcyBwcm9ibGVt
LCBhbmQgdG8NCj4gKyAqIGF2b2lkIHNldHRpbmcgYml0cyBhdCB0aGUgdG9wIG9mIGd1ZXN0
IGFkZHJlc3NlcyB0aGF0IG1pZ2h0IG5lZWQNCj4gKyAqIHRvIGJlIHVzZWQgZm9yIHRhZ3Mu
DQo+ICsgKi8NCj4gKyNkZWZpbmUgR1VFU1RfQUREUl9NQVhfICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAoKE1JTl9DT05TVChU
QVJHRVRfVklSVF9BRERSX1NQQUNFX0JJVFMsIFRBUkdFVF9BQklfQklUUykgPD0gMzIpID8g
IFwNCj4gKyAgICAgVUlOVDMyX01BWCA6IH4wdWwpDQo+ICsjZGVmaW5lIEdVRVNUX0FERFJf
TUFYICAgIChyZXNlcnZlZF92YSA/IDogR1VFU1RfQUREUl9NQVhfKQ0KPiArDQo+ICsjaWZu
ZGVmIFRBUkdFVF9UQUdHRURfQUREUkVTU0VTDQo+ICtzdGF0aWMgaW5saW5lIGFiaV9wdHIg
Y3B1X3VudGFnZ2VkX2FkZHIoQ1BVU3RhdGUgKmNzLCBhYmlfcHRyIHgpDQo+ICt7DQo+ICsg
ICAgcmV0dXJuIHg7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiArLyogQWxsIGRpcmVjdCB1
c2VzIG9mIGcyaCBhbmQgaDJnIG5lZWQgdG8gZ28gYXdheSBmb3IgdXNlcm1vZGUgc29mdG1t
dS4gICovDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgKmcyaF91bnRhZ2dlZChhYmlfcHRyIHgp
DQo+ICt7DQo+ICsgICAgcmV0dXJuICh2b2lkICopKCh1aW50cHRyX3QpKHgpICsgZ3Vlc3Rf
YmFzZSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqZzJoKENQVVN0YXRl
ICpjcywgYWJpX3B0ciB4KQ0KPiArew0KPiArICAgIHJldHVybiBnMmhfdW50YWdnZWQoY3B1
X3VudGFnZ2VkX2FkZHIoY3MsIHgpKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBi
b29sIGd1ZXN0X2FkZHJfdmFsaWRfdW50YWdnZWQoYWJpX3Vsb25nIHgpDQo+ICt7DQo+ICsg
ICAgcmV0dXJuIHggPD0gR1VFU1RfQUREUl9NQVg7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBndWVzdF9yYW5nZV92YWxpZF91bnRhZ2dlZChhYmlfdWxvbmcgc3RhcnQs
IGFiaV91bG9uZyBsZW4pDQo+ICt7DQo+ICsgICAgcmV0dXJuIGxlbiAtIDEgPD0gR1VFU1Rf
QUREUl9NQVggJiYgc3RhcnQgPD0gR1VFU1RfQUREUl9NQVggLSBsZW4gKyAxOw0KPiArfQ0K
PiArDQo+ICsjZGVmaW5lIGgyZ192YWxpZCh4KSBcDQo+ICsgICAgKEhPU1RfTE9OR19CSVRT
IDw9IFRBUkdFVF9WSVJUX0FERFJfU1BBQ0VfQklUUyB8fCBcDQo+ICsgICAgICh1aW50cHRy
X3QpKHgpIC0gZ3Vlc3RfYmFzZSA8PSBHVUVTVF9BRERSX01BWCkNCj4gKw0KPiArI2RlZmlu
ZSBoMmdfbm9jaGVjayh4KSAoeyBcDQo+ICsgICAgdWludHB0cl90IF9fcmV0ID0gKHVpbnRw
dHJfdCkoeCkgLSBndWVzdF9iYXNlOyBcDQo+ICsgICAgKGFiaV9wdHIpX19yZXQ7IFwNCj4g
K30pDQo+ICsNCj4gKyNkZWZpbmUgaDJnKHgpICh7IFwNCj4gKyAgICAvKiBDaGVjayBpZiBn
aXZlbiBhZGRyZXNzIGZpdHMgdGFyZ2V0IGFkZHJlc3Mgc3BhY2UgKi8gXA0KPiArICAgIGFz
c2VydChoMmdfdmFsaWQoeCkpOyBcDQo+ICsgICAgaDJnX25vY2hlY2soeCk7IFwNCj4gK30p
DQo+ICsNCj4gKyNlbmRpZg0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
