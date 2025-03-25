Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2662336njc;
        Tue, 25 Mar 2025 07:21:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEVDH+hSREtcw9NJEdttwvHa1VVe32EEGavdMeqrvhjFzoEGcI6lnsOQfKaBWY46f/vG4CpG/ulKxk+Q==@linaro.org
X-Received: by 2002:a17:903:40cb:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-22780c536bcmr245315785ad.9.1742912465724;
        Tue, 25 Mar 2025 07:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742912465; cv=none;
        d=google.com; s=arc-20240605;
        b=ERfrnlsJjTXKU6KshWILakyHh9esHXNd2A6wSSE2lUcqr46gt9gkIqRUjs+GFrJIaS
         lVcUGjJvT1+G1ZqPgy0TMV3V5YBuUEHLXzokr1tGn38ef7rajgUWT2s32gDRPGUYMjMs
         QLJB7LdotEyFTwKw59dAGDXhKh1rNFIbfxr7y3mETWfz6M14sCIxYMqXnjbidasfIQOM
         TLQXcABMByuzT54RpaCSdgvoH0onF94ii/d1JPDdEJtKQ86CPhd03S+69uqyhzQwKvnF
         uU6LbXbeSAoYzYYkL6Q3Glo3l2wN76CMYLM2h2c4zsjh62ZiVoOuzC3aEK72YYGlkgrM
         1jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DWqWzgBMC4lNnssNGAxvfPfgbybGACwm/MQMsL+ZseI=;
        fh=lieES1wg/4n4NlhPDVzXEPN0JNdX/JiV7wsVdymoKNs=;
        b=B8kdDXKKkVsiT8Vtko4B3lwpIc0fBvOolXDOSNmkwYnmUPDMtIVZMhd4IHJ/iNkee5
         sPB0Gg1hT15fVZFmJbwcq27TrURvQojp8+Hm3KgqRpA5d0lul+VrNeZ54C0wW34ebYRp
         dhIeapu1zN1v0mGDFkmiwuszjlqGbifjhPXgAQ7gfqhUwZ3uVpJBGX9ScpEH+eEqn2+r
         IeYB7wybcLQarEFduXiNMZn7+2L1VpbGuladPe5hxdEeSYQ/8vzPmaJzb2uOb+tUOK+r
         hT7X43J9aI8U71lBFS23jtpuslhk6YmMrCQYPDvTmaQ/06h5q2OcN+11L4H75CIejGT1
         i8gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXsRJJV7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227e6d2c534sor8261255ad.17.2025.03.25.07.21.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 25 Mar 2025 07:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXsRJJV7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742912465; x=1743517265; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWqWzgBMC4lNnssNGAxvfPfgbybGACwm/MQMsL+ZseI=;
        b=GXsRJJV71gzOMPprad1iICWnwlP4g97l0X4Zjnl7BdbFbQQWegxnDyI9/BlUbRHWnX
         j3qZzxTJwJFf4aFkLoIFqEa/onO4UkCazVD5oiNR3DDuQkUQFcmmLsysVZVMH0SIgCtl
         wnudBulJd3nBu+y+MFbMtv9Xwt29SGb1Gymby6adxeG4R2tRpxy6T35TdGmpzC20bV1j
         vCuujiXCiC5eNUrgirwHI7oNrLIazLtg42MKR88/J/XrDrCunMXqAe0QeKKO4x23CgJ0
         3P/Zb9LrPunjGrDRjGBWmUSo/TJtgAUjW0XoG/OMkME9zfKeAfMiQi29+77kqOg+ax78
         om/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742912465; x=1743517265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWqWzgBMC4lNnssNGAxvfPfgbybGACwm/MQMsL+ZseI=;
        b=CtAHA2OGbDpllnw0MMa2mMc5fVNIuFgNjeC0FdPAQtK/CCa8+t/9PrHWDpIbvZ3uki
         Kmu3chGmcLhjp3bY2vjmWiqsdOTS+IkAuT02ahjvDfutoz0zEjnGaOgcPH/43xjUdtJA
         b00yvqNMrCU6OVnBcj2v/uXasGvO6KixWCH+JuxESL3kY0z5XxsKFLNyhBQV4Te35ASP
         aqtLtv7zS9F1SxJN5z5BfNtndnb/bP/TpEhBIr04FGGGTHhT8Wq0MoE+D7CDo4JOeXQ1
         nQBVr6dUCwWXGuTDZd2QVW5Yaywe2qARLfE3rh/As1y6+WAR0TtwE7g84FFS/sC3gtVr
         OrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4ddSPHKYD1KQHe/sex6UKBxTK2LQq0A2fwj48dpzKvP93swRXppIUcFJ8elJxbr1/dJwNsCnMRADN2w==@linaro.org
X-Gm-Message-State: AOJu0YwWwyvmCR8fOtKdUnZdbxHupkBfBRid/qMhoXpReT9tmTyC9LpL
	5X1wLA0AOC5r88w7jBiPPAizm2NopzDqUBxR26jjdt9tLEvc0zxySz/rQwQcB7DTIA==
X-Gm-Gg: ASbGnctn2dyrEhfEvWvdeDupHRt+VYXPIZ4kY6lJVEKRuI8ZDR0yZ8U1n1YG7OvhLeK
	YyoqAFVQckVcFT2yVJSSO3cRpV3YdbEf2Cpcomnp5ALzhtUgoHAdYbFx9hu22ZMB3KKcc0jfiY0
	4YOBzcEk0avhhEckFb5KI8Mu/atU17mEcqCW77Z2VOIbzDY/bm3+5pGBuYWJm6KWa121LCnoLqK
	LtcuDhPs1sFXby3mwOl0Nm3NuRcDGAZyFdAvIRWT3nc+ITJknn1vcBBfJ7Ve7qbhl7rB3GDsLmO
	/p9jL759dskUuoOk/wENvpA4mnSghJIo6ryCcqIsoaB+vOrrSpuaYR1dEA==
X-Google-Smtp-Source: AGHT+IEKwhXjhwtAU/s6WZuq4+nogSSDpkyn455m9rPycEu42Jw7Z6BvWjvNpSQ/gi6yDlxfT+M4CQ==
X-Received: by 2002:a17:902:c949:b0:220:da88:2009 with SMTP id d9443c01a7336-22780e23fcfmr243510505ad.45.1742912464969;
        Tue, 25 Mar 2025 07:21:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d945sm10155222b3a.112.2025.03.25.07.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 07:21:04 -0700 (PDT)
Message-ID: <e5b667c0-117f-4dca-a591-cb56b772fe73@linaro.org>
Date: Tue, 25 Mar 2025 07:21:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
 <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
 <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
 <f2fc4de2-7235-4c86-8574-2b8d630e5cd6@linaro.org>
 <4ff5ca15-6784-4660-b6f5-9c219d215378@linaro.org>
 <6fd61c99-c753-40bc-b6a0-8b40e0c3956b@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <6fd61c99-c753-40bc-b6a0-8b40e0c3956b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Fd4jVFA0Rc33

T24gMy8yNS8yNSAwMjoyMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDI0LzMvMjUgMjE6NDksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzI0LzI1
IDEzOjA0LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAzLzI0LzI1IDEyOjI5
LCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+PiBPbiAzLzI0LzI1IDEwOjM5LCBSaWNo
YXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+Pj4+IE9uIDMvMjQvMjUgMDM6MjEsIEFsZXggQmVu
bsOpZSB3cm90ZToNCj4+Pj4+PiArwqDCoMKgICNpZmRlZiBUQVJHRVRfQklHX0VORElBTg0K
Pj4+Pj4+ICvCoMKgwqAgTWVtT3AgZW5kID0gTU9fQkU7DQo+Pj4+Pj4gK8KgwqDCoCAjZWxz
ZQ0KPj4+Pj4+ICvCoMKgwqAgTWVtT3AgZW5kID0gTU9fTEU7DQo+Pj4+Pj4gK8KgwqDCoCAj
ZW5kaWYNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pg0KPj4+Pj4gVGhhdCdzIHdoYXQgTU9fVEUg
aXMgZm9yLg0KPj4+Pj4NCj4+Pj4+PiArLyoNCj4+Pj4+PiArICogSGVscGVycyBjb3BpZWQg
ZnJvbSBoZWxwZXJzLmgganVzdCBmb3IgaGFuZGxpbmcgdGFyZ2V0X3Vsb25nDQo+Pj4+Pj4g
dmFsdWVzDQo+Pj4+Pj4gKyAqIGZyb20gZ2Ric3R1YidzIEdCeXRlQXJyYXkgYmFzZWQgb24g
d2hhdCB0aGUgYnVpbGQgY29uZmlnIGlzLiBUaGlzDQo+Pj4+Pj4gKyAqIHdpbGwgbmVlZCBm
aXhpbmcgZm9yIHNpbmdsZS1iaW5hcnkuDQo+Pj4+Pj4gKyAqLw0KPj4+Pj4+ICsNCj4+Pj4+
PiArI2lmIFRBUkdFVF9MT05HX0JJVFMgPT0gNjQNCj4+Pj4+PiArI2RlZmluZSBsZHR1bF9w
KGFkZHIpIGxkcV9wKGFkZHIpDQo+Pj4+Pj4gKyNkZWZpbmUgZ2RiX2dldF9yZWdsX3ZhbHVl
KG0sIGIsIHYpIGdkYl9nZXRfcmVnNjRfdmFsdWUobSwgYiwgdikNCj4+Pj4+PiArI2Vsc2UN
Cj4+Pj4+PiArI2RlZmluZSBsZHR1bF9wKGFkZHIpIGxkbF9wKGFkZHIpDQo+Pj4+Pj4gKyNk
ZWZpbmUgZ2RiX2dldF9yZWdsX3ZhbHVlKG0sIGIsIHYpIGdkYl9nZXRfcmVnMzJfdmFsdWUo
bSwgYiwgdikNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pg0KPj4+Pj4gU3VyZWx5IHlvdSdyZSBu
b3QgaW50ZW5kaW5nIHRvIHJlcGxpY2F0ZSB0aGlzIGluIGFueSB0YXJnZXQgdGhhdCBjYW4N
Cj4+Pj4+IGhhdmUgbXVsdGlwbGUgc2l6ZXM/DQo+Pj4+PiBUaGlzIGlzIG5vdCBhbiBpbXBy
b3ZlbWVudC4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IElmIEknbSBjb3JyZWN0IChhbmQgZnJvbSB2
MSksIHBwYyBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgaGF2aW5nDQo+Pj4+IHJlZ2lzdGVy
cyBkZWZpbmVkIHdpdGgNCj4+Pj4gdGFyZ2V0X2xvbmcgdHlwZXMuDQo+Pj4NCj4+PiBXaXRo
IGEgcXVpY2sgY2hlY2ssIG1pcHMsIHJpc2N2LCBzcGFyYyBkbyBhcyB3ZWxsLg0KPj4+DQo+
Pg0KPj4gUmlnaHQsIEkgc2hvdWxkIGhhdmUgcnVuIHRoZSBzaW1wbGUgZ3JlcCA6KQ0KPj4g
U28gaXQncyBiZXR0ZXIgdG8ga2VlcCB0aG9zZSBtYWNyb3MgZGVmaW5lZCBpbiBhIHNlcGFy
YXRlIGhlYWRlciAob3V0IG9mDQo+PiBoZWxwZXJzLmgsIGxpa2UgaGVscGVycy10YXJnZXQu
aCksIHNvIHdlIGNhbiBhbHJlYWR5IHN0YXJ0IHRvIGNsZWFudXANCj4+IHNvbWUgdGFyZ2V0
cywgYW5kIGRvIHRoZSByZXN0IG9mIHRoZSB3b3JrIGZvciB0aGUgb25lcyB1c2luZw0KPj4g
dGFyZ2V0X3Vsb25nIHR5cGUgZm9yIGxhdGVyLg0KPiANCj4gU2VlIGFsc28NCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC9mOTEzMWY2ZS1lODQzLTQ4YmUtYjg1Zi1j
MzQxZWMxOTgxNTRAbGluYXJvLm9yZy8NCj4gY29uc2lkZXJpbmcgcy9UQVJHRVRfTE9OR19T
SVpFL3RhcmdldF9pbmZvX2xvbmdfc2l6ZSgpLw0KPiANCg0KVGhlIHByb2JsZW0gaXMgdGhh
dCBib3RoIG1hY3JvcyAobGR0dWwsIGdkYl9nZXRfcmVnbCkgaGF2ZSBkaWZmZXJlbnQgDQpz
aWduYXR1cmVzLiBGb3IgZ2RiX2dldF9yZWdsLCBpdCBjb3VsZCBiZSBzb2x2ZWQgYnkgY2Fz
dGluZyB0aGUgcG9pbnRlciANCnRvIHRoZSByaWdodCB0eXBlLg0KDQpIb3dldmVyLCBmb3Ig
bGR0dWwsIGl0J3MgbXVjaCBtb3JlIGRhbmdlcm91cywgYXMgbGRsIHJldHVybnMgYSBzaWdu
ZWQgDQp2YWx1ZSwgYW5kIGxkcSwgYW4gdW5zaWduZWQgb25lLiBJJ20gbm90IHN1cmUgd2hp
Y2ggc2lnbmF0dXJlIHdlIHNob3VsZCANCmFkb3B0IGZvciB0aGlzLg0KDQpUaGF0J3Mgd2h5
IEkgcHJvcG9zZWQgaW4gdGhlIGxhc3Qgc2VyaWVzIHRvIHJlcGxhY2UgbGR0dWxfcCB3aXRo
IGFub3RoZXIgDQpmdW5jdGlvbiByZXR1cm5pbmcgdmFsdWUgYnkgcG9pbnRlciwgc28gd2Ug
Y2FuIGVhc2lseSByZXBsYWNlIGNhbGwgc2l0ZXMgDQp3aXRob3V0IHRoZSByaXNrIG9mIHRy
dW5jYXRpbmcgc29tZXRoaW5nLg0K
