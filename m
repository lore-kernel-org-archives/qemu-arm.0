Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp585484njc;
        Wed, 19 Mar 2025 16:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKIJFh6YzyKrE5Dzrj/NcLzFpL8jh1FhXh8UpukxEmF9PjeCDgevRy0f09e5KkjBWdLBZPlxz0g05+nQ==@linaro.org
X-Received: by 2002:a17:903:40c6:b0:223:607c:1d99 with SMTP id d9443c01a7336-2265e34e5c3mr23375015ad.0.1742425746053;
        Wed, 19 Mar 2025 16:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742425746; cv=none;
        d=google.com; s=arc-20240605;
        b=HHO/42N0lDb82FoyANRHYiC44ADLGXUOOMTWbnNoSYx40VSE4c4aDU8VzAvr8VgQu9
         GtQ6l+JnQD5jQ7wxtURNg7/zB4VUESIKpjD9w8YYDkhL7ZRSY3GC9L6qyiwwTjJ98LMQ
         kzXoj4WNpQ6SJS09j4HYt82Q3sx0Rn5TlgRfpKctvRtw9Dr7R2SxBDyzbNaj/s4lWpI2
         MDp4CvK656cPyeeVwGFvjSe7dW5TpHF8Ke7EtX592puXQEFp4FsyZ3G0N0QEraS7uMrR
         gkTB2ouRFE81jwqxZH1nPOJgtoPvPcwQErhzAJPStCvUjde47vOtgydCURbZoKOcxpvT
         QsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vc1QjsrUNop6NT34LfjdBlMP7nwjGJRKQWt7xwjFmPw=;
        fh=ZCa3QQJeyF8VNsWtbvCuHZW9d6ItctTIAvQl8Gv22Bw=;
        b=TFChyqW3Y3tk8v2dZzVJJCsbJOUD4XWlnH0RkR0ZBeXWb7YQAJ/bAX5y61aOarJEjO
         EjlXGKXDIO58eb2h8q/EM7UOM1l/K9HMEkD1S+OP1PdFH2RWcVTAAVD7amcQYKtQHPFW
         rLj6o0+d1Eg6yMGwRI0wAZAi6ICPJsw4GlUuUv+sBWz+/GYWj3ZLrlUMcS6//lUMswHA
         QxKHg17Q6An463rwi3fvroqgwfCv/eobPLBk3NRA37OhIB8PK7bsS+cprNEm7os8zbUd
         5Y4jfblvloQRVRGRXlR5g3CVARZyxOZhjZDkRbR/hJVRYRLSxB24hieM0HlwDTAPjalQ
         phJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WFyRYffR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2264b30a14csor15557225ad.5.2025.03.19.16.09.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 16:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WFyRYffR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742425745; x=1743030545; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vc1QjsrUNop6NT34LfjdBlMP7nwjGJRKQWt7xwjFmPw=;
        b=WFyRYffRHnF3KsVdFAkYfZHIUjoNUnPVfddBo1kcOWSN3C9WGXmkvFaLHEdneTF6fA
         FNKayri5KQrhR99jq+9ETpuzxZ1Ch5YDfL7n4KFyC2Nmkv5Ty+qhktDZHq6Yx+3Yg2IB
         D9AUW5lfzTZf/nUkyc2/vGAfwlvcc11B98ehgdBdBz25EXjrjnYi9xdWZjOfrrFlXhVH
         FLCvvZeLoGzmwq3IRvCDBo9nSoy0jj98pprT+swWSJY4PcS7BBnPjCl6e+SUzDkO6c6l
         0V/SyjgOIPYjfG81dpFmsl3rOHYwAZPJXibq6daVgOHGbA+CKRYI1D/eAkiDVvV347oW
         Q1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742425745; x=1743030545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc1QjsrUNop6NT34LfjdBlMP7nwjGJRKQWt7xwjFmPw=;
        b=u3R8rvwOnh9BbvVCLd7HUE8H8NKR7/vRw9upDfvWdkn9DHpiXOCPKTBO6gPO+eB3WM
         2aByMKOFiBZ1MPORdqxK09RKHvJHf8d/CpEckQ2ZxTU2gtwfFZu+yDPb7iDwxOlxMKcd
         tvMDl2I3eO5zyrASjdkLDmnhXYEOXjGy+EoLzhNyS7eNEb1Zi+bNc9Y9WWlRgRkz1gTn
         hiuOARMHXYeLhSIneu63Csb1aZ5HoRWAM6cgmuqzK8nuEveedCEG6g0pZfHaRx/0ARsV
         Z/m+H+nKZmaWwogMJEJmCpSlQ96syMwdSGI7u/voAoUkQw6JciJn4t6J3r/fwpDHgPek
         Ez7g==
X-Forwarded-Encrypted: i=1; AJvYcCV7bhnHUDiuQslTUmKa+EYgn+wobEO8mw5ZQI92aO2V3DvjpWiREKg0lhdVtHM0j4rvvkoGo6BwpqYtbw==@linaro.org
X-Gm-Message-State: AOJu0YwzaO0saf3Ih1jZ4ynKMXIXZFOMGIEHAux8TamR2HvhLLawdkUM
	pJH45enT8a9FhxRCVz42JZxoLIoeW0cMEcYe4HPc/SbfiuLErpKAHKr+5Cw/Z/F9RA==
X-Gm-Gg: ASbGncuIgDU2WYWfEMZ61i47GRyP86X31wHzrNAmE4VW/VZ4i8FnW4qVbeseSazoEAO
	m7jDNv8Hx9lhdrXeLNM4ClDcmq9X/UuTJ3G6+bzKIH5VTSTzlr+rlIGsLDOqWt9VfD+utirZAnx
	PqFDoYrPdgheRo6ktOwM5aVgGPgVSw862D1JC7eaTQswuK2yV3JFCvgjmDTVoFkIfP5NqedXH2n
	wrGp5fBXj09lWbinSMC/GKe+C3xdVABDlQ+mhPEFwwMYJCC9bmLaxPs5K22ZhXEcy0TcfJYF4HQ
	tgE2Ntcc0nMuqPPRSR1RcTJKcLB1wM9+ceB4Rpkd/+L5IbEjQzAicbOudw==
X-Google-Smtp-Source: AGHT+IEybpOSsnbkV87Um3HczhmpYrkNqcFe1swRytU+M2QpreJDTcs7ZY3BLcVX4mk11SEbqt2IdQ==
X-Received: by 2002:a17:903:1a27:b0:21f:98fc:8414 with SMTP id d9443c01a7336-2265e7c2830mr19945575ad.26.1742425745587;
        Wed, 19 Mar 2025 16:09:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba724asm121095885ad.152.2025.03.19.16.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:09:05 -0700 (PDT)
Message-ID: <5c977254-ee11-4604-91f0-70720d06eaeb@linaro.org>
Date: Wed, 19 Mar 2025 16:09:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32
 and aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-10-pierrick.bouvier@linaro.org>
 <a88f54cb-73be-4947-b3be-aa12b120f07e@linaro.org>
 <52000c3d-827f-4e21-afa3-f191c6636b9d@linaro.org>
 <52c8b6dc-048c-49d2-b535-4855b9f3d26b@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <52c8b6dc-048c-49d2-b535-4855b9f3d26b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 6EiNe3jZ6ANY

T24gMy8xOS8yNSAwMDowMywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE4LzMvMjUgMjM6MDIsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzE4LzI1
IDExOjUwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+PiBPbiAxOC8zLzI1
IDA1OjUxLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+PiBUaGlzIHdpbGwgYWZmZWN0
IHpyZWdzIGZpZWxkIGZvciBhYXJjaDMyLg0KPj4+PiBUaGlzIGZpZWxkIGlzIHVzZWQgZm9y
IE1WRSBhbmQgU1ZFIGltcGxlbWVudGF0aW9ucy4gTVZFIGltcGxlbWVudGF0aW9uDQo+Pj4+
IGlzIGNsaXBwaW5nIGluZGV4IHZhbHVlIHRvIDAgb3IgMSBmb3IgenJlZ3NbKl0uZFtdLA0K
Pj4+PiBzbyB3ZSBzaG91bGQgbm90IHRvdWNoIHRoZSByZXN0IG9mIGRhdGEgaW4gdGhpcyBj
YXNlIGFueXdheS4NCj4+Pg0KPj4+IFdlIHNob3VsZCBkZXNjcmliZSB3aHkgaXQgaXMgc2Fm
ZSBmb3IgbWlncmF0aW9uLg0KPj4+DQo+Pj4gSS5lLiB2bXN0YXRlX3phIGRlcGVuZHMgb24g
emFfbmVlZGVkKCkgLT4gU01FLCBub3QgaW5jbHVkZWQgaW4gMzItYml0DQo+Pj4gY3B1cywg
ZXRjLg0KPj4+DQo+Pj4gU2hvdWxkIHdlIHVwZGF0ZSB0YXJnZXQvYXJtL21hY2hpbmUuYyBp
biB0aGlzIHNhbWUgcGF0Y2gsIG9yIGENCj4+PiBwcmVsaW1pbmFyeSBvbmU/DQo+Pj4NCj4+
DQo+PiB2bXN0YXRlX3phIGRlZmluaXRpb24gYW5kIGluY2x1c2lvbiBpbiB2bXN0YXRlX2Fy
bV9jcHUgaXMgdW5kZXIgI2lmZGVmDQo+PiBUQVJHRVRfQUFSQ0g2NC4gSW4gdGhpcyBjYXNl
IChUQVJHRVRfQUFSQ0g2NCksIEFSTV9NQVhfVlEgd2FzIGFscmVhZHkNCj4+IGRlZmluZWQg
YXMgMTYsIHNvIHRoZXJlIHNob3VsZCBub3QgYmUgYW55IGNoYW5nZS4NCj4gDQo+IEknbSBu
b3Qgc2F5aW5nIHRoaXMgaXMgaW52YWxpZCwgSSdtIHRyeWluZyB0byBzYXkgd2UgbmVlZCB0
byBkb2N1bWVudA0KPiB3aHkgaXQgaXMgc2FmZS4NCj4gDQo+PiBPdGhlciB2YWx1ZXMgZGVw
ZW5kaW5nIG9uIEFSTV9NQVhfVlEsIGZvciBtaWdyYXRpb24sIGFyZSBhcyB3ZWxsIHVuZGVy
DQo+PiBUQVJHRVRfQUFSQ0g2NCBpZmRlZnMgKHZtc3RhdGVfenJlZ19oaV9yZWcsIHZtc3Rh
dGVfcHJlZ19yZWcsDQo+PiB2bXN0YXRlX3ZyZWcpLg0KPj4NCj4+IEFuZCBmb3Igdm1zdGF0
ZV92ZnAsIHdoaWNoIGlzIHByZXNlbnQgZm9yIGFhcmNoMzIgYXMgd2VsbCwgdGhlIHNpemUg
b2YNCj4+IGRhdGEgdW5kZXIgZWFjaCByZWdpc3RlciBpcyBzcGVjaWZpY2FsbHkgc2V0IHRv
IDIuDQo+PiBWTVNUQVRFX1VJTlQ2NF9TVUJfQVJSQVkoZW52LnZmcC56cmVnc1swXS5kLCBB
Uk1DUFUsIDAsIDIpDQo+Pg0KPj4gU28gZXZlbiBpZiBzdG9yYWdlIGhhcyBtb3JlIHNwYWNl
LCBpdCBzaG91bGQgbm90IGltcGFjdCBhbnkgdXNhZ2Ugb2YgaXQuDQo+Pg0KPj4gRXZlbiB0
aG91Z2ggdGhpcyBjaGFuZ2UgaXMgdHJpdmlhbCwgSSBkaWRuJ3QgZG8gaXQgYmxpbmRseSB0
byAibWFrZSBpdA0KPj4gY29tcGlsZSIgYW5kIEkgY2hlY2tlZCB0aGUgdmFyaW91cyB1c2Fn
ZXMgb2YgQVJNX01BWF9WUSBhbmQgenJlZ3MsIGFuZCBJDQo+PiBkaWRuJ3Qgc2VlIGFueXRo
aW5nIHRoYXQgc2VlbXMgdG8gYmUgYSBwcm9ibGVtLg0KPiANCj4gWW91IGRpZCB0aGUgYW5h
bHlzaXMgb25jZSwgbGV0J3MgYWRkIGl0IGluIHRoZSBjb21taXQgZGVzY3JpcHRpb24gc28N
Cj4gb3RoZXIgZGV2ZWxvcGVycyBsb29raW5nIGF0IHRoaXMgY29tbWl0IHdvbid0IGhhdmUg
dG8gZG8gaXQgYWdhaW4uDQo+IA0KDQpTdXJlLCBJJ2xsIGFkZCB0aGlzIHRvIHRoZSBjb21t
aXQgbWVzc2FnZS4NCg0KPj4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sg
Qm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4+PiAtLS0NCj4+Pj4g
IMKgwqAgdGFyZ2V0L2FybS9jcHUuaCB8IDYgKy0tLS0tDQo+Pj4+ICDCoMKgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL3RhcmdldC9hcm0vY3B1LmggYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4+IGlu
ZGV4IDI3YTBkNDU1MGYyLi4wMGY3OGQ2NGJkOCAxMDA2NDQNCj4+Pj4gLS0tIGEvdGFyZ2V0
L2FybS9jcHUuaA0KPj4+PiArKysgYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4+IEBAIC0xNjks
MTEgKzE2OSw3IEBAIHR5cGVkZWYgc3RydWN0IEFSTUdlbmVyaWNUaW1lciB7DQo+Pj4+ICDC
oMKgwqAgKiBBbGlnbiB0aGUgZGF0YSBmb3IgdXNlIHdpdGggVENHIGhvc3QgdmVjdG9yIG9w
ZXJhdGlvbnMuDQo+Pj4+ICDCoMKgwqAgKi8NCj4+Pj4gLSNpZmRlZiBUQVJHRVRfQUFSQ0g2
NA0KPj4+PiAtIyBkZWZpbmUgQVJNX01BWF9WUcKgwqDCoCAxNg0KPj4+PiAtI2Vsc2UNCj4+
Pj4gLSMgZGVmaW5lIEFSTV9NQVhfVlHCoMKgwqAgMQ0KPj4+PiAtI2VuZGlmDQo+Pj4+ICsj
ZGVmaW5lIEFSTV9NQVhfVlHCoMKgwqAgMTYNCj4+Pj4gIMKgwqAgdHlwZWRlZiBzdHJ1Y3Qg
QVJNVmVjdG9yUmVnIHsNCj4+Pj4gIMKgwqDCoMKgwqDCoCB1aW50NjRfdCBkWzIgKiBBUk1f
TUFYX1ZRXSBRRU1VX0FMSUdORUQoMTYpOw0KPj4+DQo+Pg0KPiANCg0K
