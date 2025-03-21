Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp476326njc;
        Fri, 21 Mar 2025 10:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcwewrmK9zLyXjJlzNdk1vFdKQuUzOSpXs/K7MkWQMLVX5t1S6vl+LrneSqbaepQdak5iDkCSNcIwJpA==@linaro.org
X-Received: by 2002:a05:6a00:3a1e:b0:736:3954:d78c with SMTP id d2e1a72fcca58-739059b3e40mr6592620b3a.6.1742578027128;
        Fri, 21 Mar 2025 10:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742578027; cv=none;
        d=google.com; s=arc-20240605;
        b=D6/7Av3trMK7eh6cOyjVum26aTqD/aiLrQjCIoxSzFSUi9KsdmbaJ9ZY/1Ks2vaV64
         QXCPjhh4mov/dtTBo+yQ67REmZ8txYlMu9T/UmH2Q7SD1575hR0M+YouIJvEB7/LXbK9
         aTrdEFpGH+etsxXeJVYCQ7iU/cKwkB2ehAsnHRh6AtC1f6qVWJfEuPzsxautGZKdsH+F
         SWH3WjztLxPwbsYDUdAgoF+xU4h6evQzL4vCZSRXLt/D1I7fJlPmKPRdsjm8SALWJwXm
         Wv9/o1BvYOV2ElQ6Lganl2Dbo24ztSqqhmHC9CH5DRCiFi0BTsUqyDSBZnxzAqDw8VQz
         ys5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o6I8nyQ9gqpWyx44GJvrBO4kg+s2Z+LLTtP7XWhvVXc=;
        fh=zqWuIt1/8bHEuHfMeLBJmi03ldGEJ2M9Sma0ANITRKk=;
        b=LiDnpIxws38A+1rT8gXrqIk2zvxE4K0O7kUGKjhptUpMa4AYhZqiRdevjyrCvF8rea
         8PxuvyC50TEiwE1e7VBOwR1VIVgBH+dxmkhh+9tExkPOkSqxcZ/0FRZYgQ6Zk8mN1lRY
         lssqq8t8rnDPiwyaLnRdSgaLGKX7Zh26OQ7UA8TCmqAMhNiDfIGV5sAxAZpLCoflHyYs
         2qR3RzcU6jbiXcjXkR7d49M+BAf08kPEtPiFf9TTy9CoK6v/snMu4z9GW0Rl0sGQdhqY
         B6vZVvPxaCxPMyBGgYAM7N1WAPTTe59E+SozYklcP9mKNAj0t3OObVgtuOuBrF164Paf
         mF4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTla5o0H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f3fb54sor1398736b3a.3.2025.03.21.10.27.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 10:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTla5o0H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742578027; x=1743182827; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6I8nyQ9gqpWyx44GJvrBO4kg+s2Z+LLTtP7XWhvVXc=;
        b=mTla5o0HvpmCGWqGDLlvDP5dWP7N7Qs6mHMd0KgYHsLtIfMKPRB5SnZdpqh6ke0Y/m
         wWiNiIPyQ8vvsNIVTTfheGS605NaTFYnD4Ot24nBnMghKWBjD1mzORr0qZobulkPOblJ
         TwfnK7iaceGhiJ2GlZSG7XzNsw9r9ILjGPfdTDzvzR6qa5+gATB6UiNSUExSPw4wGwGh
         GN8pCytX3WwW67BPoaM4ckfBHBM5zfxrGx6XqvMXWBoC5ghazxfkWZmAq0aTDYaBpLGR
         5ZIFs6q/YN3+Z4R/mQT6AveOgPfku8lRLRgwNHvoU9gyMxwXwNXkjCQ17b8qCQFxoiR3
         qJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578027; x=1743182827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6I8nyQ9gqpWyx44GJvrBO4kg+s2Z+LLTtP7XWhvVXc=;
        b=l6HH8Ishu4GW5orlHZvL7ml856NrUrW38NuHs4nbU4UmfZmDwznmtOukqYBJ4tdMw8
         IeMnZB4PPI5E63btxGlYaWrNW1J00XiqkQcGh6+SQUOaNZGyNdqnL2t1DmPJUMQDolbL
         mQon81zlAQiwctuzMFtpix67awjk7e5OQ3C1fAXVLn4+9I2INHDOmFVjUY7sed67AqUf
         +nObTEsgO+jG8HsvYgZ5sbyjq1cCBTLVuroi8+4Mh3uaXMsbw51wkNagD/W9OxuXahHw
         35o0LsJWsHVMP/BPRZSG8RkFHaw/juqMLwALUlc5D0aOg8RvsVd20Sr6Ca+7MD/7IPbo
         uHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaw/pt/StYGAiaIL6b+qGY/i6P5NPGauHuuW4gS83Ap3nYpZq3slF8mS7318lX/GVBHI/8Q6FKJGxTlA==@linaro.org
X-Gm-Message-State: AOJu0YyLM/BjQDDfgDG2mCqHQny759iccSVV8pFjPpzoDb271HKEPnaR
	kELRTsTTe4k8UsXrCuAQvsy8M3FfsGt5eYa2XMyKK2sgM+LfRSDRVc6Hw1oC5rPKO/6tImH2+IG
	EgcQ=
X-Gm-Gg: ASbGncuFEAN404obVyLdlcWr4x79/Bb9bOeIobWqLzftEfE7ZVESamU65dp4i999CjB
	u6AdtpZiJ4ZEtvpMPPZxHprKIy7lETTe2B+nxQVpHOED6COaisWkwb7V0xx2VC3TceeVhVwIkDo
	wXXe0UzQpy6GOTsCVB4nN+bJqE7bd5/LPEK1Wff5ZEOdHbmIa/hxY+1r2eakk3H+wZcUNvM6fZi
	/0Y26INvzpEOMj1r0Fnf/Y1x+wmMHgqDiyDVbEZY7HasXGFkpp/JmtYex8h0t1C+I5+DEo0COR4
	WusAilxpvPM1UER/2msojvLFAFD5shJUg7Q3Gd59qMzt0Xn6/oYeKYMM+80=
X-Google-Smtp-Source: AGHT+IEXi1KfiVBZOqIRAbtHwX7MVtyEsaTSGgdYWyfqQi8F0DMmOf4evIlQ/lofZMY+CjZ7fEPddA==
X-Received: by 2002:a05:6a00:ac8:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-73905a63bd5mr7527830b3a.20.1742578026384;
        Fri, 21 Mar 2025 10:27:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [172.16.224.217] ([209.53.90.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d21dsm2219619b3a.118.2025.03.21.10.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:27:05 -0700 (PDT)
Message-ID: <1b4ab8fa-c106-4161-ab25-39589a495564@linaro.org>
Date: Fri, 21 Mar 2025 10:27:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
 <7444c007-d8f1-4c55-ab4a-15becdf1c932@linaro.org>
 <fd9ecec4-cfa9-4605-aa14-264284f6afb6@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <fd9ecec4-cfa9-4605-aa14-264284f6afb6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: nykbcC5lCJKt

T24gMy8yMS8yNSAwNjowMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDIwLzMvMjUgMjE6MTYsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzIwLzI1
IDEyOjUyLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IE9uIDMvMTkvMjUgMTE6MjIs
IEFsZXggQmVubsOpZSB3cm90ZToNCj4+Pj4gVGhlIGFpbSBvZiB0aGlzIHdvcmsgaXMgdG8g
Z2V0IHJpZCBvZiB0aGUgZW5kaWFuIGF3YXJlIGhlbHBlcnMgaW4NCj4+Pj4gZ2Ric3R1Yi9o
ZWxwZXJzLmggd2hpY2ggZHVlIHRvIHRoZWlyIHVzZSBvZiB0c3dhcCgpIG1lYW4gdGFyZ2V0
DQo+Pj4+IGdkYnN0dWJzIG5lZWQgdG8gYmUgYnVpbHQgbXVsdGlwbGUgdGltZXMuIFdoaWxl
IHRoaXMgc2VyaWVzIGRvZXNuJ3QNCj4+Pj4gYWN0dWFsbHkgYnVpbGQgZWFjaCBzdHViIG9u
Y2UgaXQgaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIgLQ0KPj4+PiBnZGJfZ2V0X3JlZ2lzdGVy
X3ZhbHVlKCkgd2hpY2ggdGFrZXMgYSBNZW1PcCB3aGljaCBjYW4gZGVzY3JpYmUgdGhlDQo+
Pj4+IGN1cnJlbnQgZW5kaWFuIHN0YXRlIG9mIHRoZSBzeXN0ZW0uIFRoaXMgd2lsbCBiZSBh
IGxvdCBlYXNpZXIgdG8NCj4+Pj4gZHluYW1pY2FsbHkgZmVlZCBmcm9tIGEgaGVscGVyIGZ1
bmN0aW9uLg0KPj4+Pg0KPj4+PiBUaGUgbW9zdCBjb21wbGV4IGV4YW1wbGUgaXMgUFBDIHdo
aWNoIGhhcyBhIGhlbHBlciBjYWxsZWQNCj4+Pj4gcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVy
KCkgd2hpY2ggd2FzIGRvaW5nIHRoaXMuDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgc3RpbGwgYW4g
UkZDIHNvIEknbSBpbnRlcmVzdGVkIGluIGZlZWRiYWNrOg0KPj4+Pg0KPj4+PiAgwqDCoMKg
IC0gaXMgdGhlIEFQSSBzYW5lDQo+Pj4+ICDCoMKgwqAgLSBjYW4gd2UgYXZvaWQgbG90cyBv
ZiAodWludDhfdCAqKSBjYXN0aW5nPw0KPj4+DQo+Pj4gRXZlbiB0aG91Z2ggdGhlIHNlcmll
cyBoYXMgYSBnb29kIGludGVudCwgdGhlIGZhY3Qgd2UgbWFrZSBldmVyeXRoaW5nDQo+Pj4g
ImdlbmVyaWMiIG1ha2VzIHRoYXQgd2UgbG9zZSBhbGwgZ3VhcmFudGVlcyB3ZSBjb3VsZCBn
ZXQgYnkgcmVseWluZyBvbg0KPj4+IHN0YXRpYyB0eXBpbmcsIGFuZCB0aGF0IHdlIGhhZCBw
b3NzaWJpbGl0eSBvZiBtaXN0YWtlcyB3aGVuIHBhc3Npbmcgc2l6ZQ0KPj4+ICh3aGljaCBo
YXBwZW5lZCBpbiBwYXRjaCA0IGlmIEknbSBjb3JyZWN0KS4gQW5kIGV4cGxpY2l0IGNhc3Rp
bmcgY29tZXMNCj4+PiBhcyBhICpzdHJvbmcqIHdhcm5pbmcgYWJvdXQgdGhhdC4NCj4+Pg0K
Pj4+IEJ5IHBhdGNoIDcsIEkgd2FzIHJlYWxseSBmZWVsaW5nIGl0J3Mgbm90IGEgd2luIHZz
IGV4cGxpY2l0IGZ1bmN0aW9ucw0KPj4+IHBlciBzaXplLg0KPj4+DQo+Pj4gSWYgdGhlIGdv
YWwgb2YgdGhlIHNlcmllcyBpcyB0byBnZXQgcmlkIG9mIGVuZGlhbiBhd2FyZSBoZWxwZXJz
LCB3ZWxsLA0KPj4+IHRoaXMgY2FuIGJlIGZpeGVkIGluIHRoZSBoZWxwZXJzIHRoZW1zZWx2
ZXMsIHdpdGhvdXQgbmVlZGluZyB0bw0KPj4+IGludHJvZHVjZSBhICJnZW5lcmljIiBzaXpl
IGhlbHBlci4gTWF5YmUgd2UgYXJlIHRyeWluZyB0byBzb2x2ZSB0d28NCj4+PiBkaWZmZXJl
bnQgcHJvYmxlbXMgaGVyZT8NCj4+Pg0KPj4+PiAgwqDCoMKgIC0gc2hvdWxkIHdlIGhhdmUg
YSByZXZlcnNlIGhlbHBlciBmb3Igc2V0dGluZyByZWdpc3RlcnMNCj4+Pj4NCj4+Pj4gSWYg
dGhpcyBzZWVtcyBsaWtlIHRoZSByaWdodCBhcHByb2FjaCBJIGNhbiBoYXZlIGEgZ28gYXQg
bW9yZSBvZiB0aGUNCj4+Pj4gZnJvbnRlbmRzIGxhdGVyLg0KPj4+Pg0KPj4NCj4+IExvb2tp
bmcgYXQgaW5jbHVkZS9nZGJzdHViL2hlbHBlcnMuaCwgZ2RiX2dldF9yZWcxMjggY2FuIGJl
IHNvbHZlZCBieQ0KPj4gdXNpbmcgdGFyZ2V0X3dvcmRzX2JpZ2VuZGlhbigpIGluc3RlYWQg
b2YgVEFSR0VUX0JJR19FTkRJQU4sIHdoaWNoIGlzDQo+PiBhbHJlYWR5IHdoYXQgdHN3YXAg
cHJpbWl0aXZlcyBhcmUgZG9pbmcuDQo+IA0KPiBXZSdsbCBuZWVkIHRvIGV2ZW50dWFsbHkg
cmVtb3ZlIHRhcmdldF93b3Jkc19iaWdlbmRpYW4oKSwgc28gdGhhdCdkIGp1c3QNCj4gYmUg
cG9zdHBvbmluZyB0aGF0Lg0KPiANCg0KSXQgc2VlbWVkIHRvIG1lIHRoYXQgb25lIG9mIHRo
ZSBnb2FsIG9mIGN1cnJlbnQgc2hhcmVkIHdvcmsgb24gc2luZ2xlIA0KYmluYXJ5IGlzIHRv
IGJlIGFibGUgdG8gY2hlY2sgdGhvc2Uga2luZCBvZiB0aGluZ3MgYXQgcnVudGltZS4gU28g
SSANCmRvbid0IHNlZSBob3cgd2UgY2FuIHBsYW4gdG8gcmVtb3ZlIHRhcmdldF93b3Jkc19i
aWdlbmRpYW4oKSwgb3IgYW4gDQplcXVpdmFsZW50Lg0KDQpJZiB5b3UgbWVhbiB3ZSdsbCBy
ZXBsYWNlIHRoaXMgY2FsbCB3aXRoIGFub3RoZXIgbmFtZS9hcGksIEkgZG9uJ3Qgc2VlIA0K
aXQgYXMgYSBwcm9ibGVtIHRvIHVzZSBpdCBmb3Igbm93LiBJdCdzIHVwc3RyZWFtIGFuZCB3
b3Jrcy4NCg==
