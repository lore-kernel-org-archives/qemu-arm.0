Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp933955njm;
        Wed, 5 Mar 2025 08:47:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIkFjxGg8ihsoWGeh6bPUIt7EzMbE7f1o0EIW35eNGMMvKpVDt/PobS24bzEZ4r50UkttxhK4j7yFEGA==@linaro.org
X-Received: by 2002:a17:902:e850:b0:21f:58fd:d215 with SMTP id d9443c01a7336-223d916c2bbmr127254855ad.11.1741193262279;
        Wed, 05 Mar 2025 08:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193262; cv=none;
        d=google.com; s=arc-20240605;
        b=EhRs051SAEdVlRZpsyehMvVTHcsWkoEgIV4mFBuPEYfudxRcNL7IXoWgQlID7T5FsD
         Bj2z8cG6OHeo0cHrCBzmgK2Q8CsF4hjdDQWPHzKsQfOMixC5BKokkzVUsCE4uugCpL3C
         Tme7lRg+NISQZwcvLSHrtyOYbWz9ZYkSvp76eLbXOjwLJTI6S5blhx/3AflWVGOcOrRB
         Wia0C0LcjVZayQXwdQXIs0v+HhrU7klG2sjI5EErrpM8caf038bleE9R8T1jl3+lMUSt
         EDCTpeoOmO8i2hefKa/4+rK6HPXM5ht61Cc/V/e38wlYEPbVqr8EafYqOBcISW8M5AKH
         FoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yDTjrjl2lgL0PcFOS2hmGBgcSKflZXaPmkVfQZeqtdo=;
        fh=Kl9DyAgTJS6hpcujBpy0AVT2xv7ahiYJgriQVC/j1Iw=;
        b=VY2KmTGKtE7jGqwQle9CIFwwmvtYuibJDLMmRyX+fsynALKWL2+jMDANvfKeStUQH4
         qdeEqkhGl7Ij0/tg7HYcNXNR47pzQl4KUf3v4KO/lGs+ebZIQ+dGWMrg2VotPbO/q7j7
         6TO8vpOLmEYm7Y2VUeJ81STn1A+xv5vlR51ZLs4paA5CxplsbLa9c0DbU5gS7TvVcC0J
         7CXTJIwtkmaIDUq1AGu+LDANfCoIgK0agB/Fj1zepF1CKmEaTOfNtlEcT5zqHase52Dg
         Wh0eoli6oi9VDuqVMbfHMrcxA9zamI80gvLn9Yfff016eN98dRfD+hCIBkX6WwnxnMvK
         PjGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TmjN5ZMr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-223f65875besor7955935ad.2.2025.03.05.08.47.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TmjN5ZMr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193262; x=1741798062; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDTjrjl2lgL0PcFOS2hmGBgcSKflZXaPmkVfQZeqtdo=;
        b=TmjN5ZMr9/YY/DdyVLs+gSf6aOPB9CgJGdQenwTA12GFtsXBwcLVWtTWn0e1XXcUZt
         KAbFQBP8poui5hhofPJe4T7p2iOJUPgHQc0HgTNzzsEYRSouS13X/de3arJcHAchiUEb
         c54oWDCm+1GYWvKyxj33jJejnVl4qjlwZJR3BMXYDF33/EVTQH3y8Rlc1xFO1EhTeMH7
         25R/X5H++vLy+Bp9hkVfxNKyRnB7LvhikC0WoTlQPWsWv9+31tw4c3c0S6ESWVrm4oee
         uBVAAwWoCwoYglC/SVtKi3835+FlHE2F31Nrqj2FIQ4C/79yAR9K/VFaTinDES3ZT/aN
         hcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193262; x=1741798062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDTjrjl2lgL0PcFOS2hmGBgcSKflZXaPmkVfQZeqtdo=;
        b=Up5SEDAC5LkSQDiWVhOhoWVeA+31D/sTZrpZpI1rKbC7qZRv3NVhDijWddgWGk8GNU
         d0VP5Gj/EEBgLck903+lF2+LvRy9cKSg2bs70LqI9CbTxnXqkYjyTrdZmoP3PLohVgWg
         +Ohi5UlSTc93bbRGAJgHfZJ9URLDRL7pQE6xaSr3l/P8BNBrUytbfuPer9NEiObrPddq
         UK1HJLOL/enMU06yO3Gg0oQH3Ht54/IkcNfGKqZqFEwXwK08esx4BPqguYG5Pcp9YvdO
         6rFif719CAdt2v9gQPXBhsfQ8UZGui8vIGD+yfgZSdyG5DteWvGBNzZUBntbiFujjvbj
         7ccg==
X-Forwarded-Encrypted: i=1; AJvYcCX/C/KmMe5BzynnF5/voe8IrbiUPi3e7K8j4zDyfQf/IsorW6wSwOTz02urEMYlghkyPXV7KN6iww0SXw==@linaro.org
X-Gm-Message-State: AOJu0YxD2LgXs530Y09PT94eQ4taCHZjcap0nX+U3MBw0nWY9do1sEd1
	v6yB8RHx8pg03eI1VGxXO0gWIWxzgxUsNETcs/yp6CPuItaU9IEjN43206DRdu5Atw==
X-Gm-Gg: ASbGncui/taShv1cN6F59WTJ2kRv5aHv/7uKz0xJx//OjJqUffbesuSKCUmGPPkUm5K
	x/ZwWKmfnxfxOLGDX9BNPAV5GDqiW+lirQJUhZs7mFW1Ay5gDYdPCJLXFRR6JHwVPQTE0mjyjQL
	vH8+p4O0XDLTkjNuJ2oQpwmHIUwb5twi8IEarcL5FfdUKRNJLwPNImg8Gmrow3zaaQECcNDkLr3
	HRRtiTXg0jYiKywnQXmxq5zS6bZNAl3tLlBvPng5tDJv7oD76cD3rb8BH5ZL8XLVnvA+bAY8WWK
	kdyOspco133TYmZRrfojjefQeDfUx+WGpms8zrSZeMew9huCDAFsMlJu9A==
X-Google-Smtp-Source: AGHT+IFvf6z4lu87G9ngKbVZnlrylTq1F7IyhWtdq6+xvfINUzGQbO9pnI4PpiA3ZW0lc6Bf5MZZOA==
X-Received: by 2002:a17:903:2302:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-223f1e07b97mr71107725ad.25.1741193261838;
        Wed, 05 Mar 2025 08:47:41 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fae29sm115051435ad.95.2025.03.05.08.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:47:41 -0800 (PST)
Message-ID: <62dcbd00-0bb6-43ff-998d-a07b85917c99@linaro.org>
Date: Wed, 5 Mar 2025 08:47:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] qom: Introduce TypeInfo::registerable() callback
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250305161248.54901-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 4/tLPv16akI+

T24gMy81LzI1IDA4OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gSW50
cm9kdWNlIHRoZSBUeXBlSW5mbzo6cmVnaXN0ZXJhYmxlKCkgY2FsbGJhY2sgdG8gYWxsb3cN
Cj4gcnVudGltZSBkZWNpc2lvbiBvbiB3aGV0aGVyIHJlZ2lzdGVyIGEgUU9NIHR5cGUgb3Ig
bm90Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL3FvbS9vYmplY3QuaCB8IDEg
Kw0KPiAgIHFvbS9vYmplY3QuYyAgICAgICAgIHwgNCArKysrDQo+ICAgcW9tL3RyYWNlLWV2
ZW50cyAgICAgfCAxICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvcW9tL29iamVjdC5oIGIvaW5jbHVkZS9xb20v
b2JqZWN0LmgNCj4gaW5kZXggOTE5MjI2NWRiNzYuLmYwNDY3OTFmNjBjIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3FvbS9vYmplY3QuaA0KPiArKysgYi9pbmNsdWRlL3FvbS9vYmplY3Qu
aA0KPiBAQCAtNDc2LDYgKzQ3Niw3IEBAIHN0cnVjdCBUeXBlSW5mbw0KPiAgIHsNCj4gICAg
ICAgY29uc3QgY2hhciAqbmFtZTsNCj4gICAgICAgY29uc3QgY2hhciAqcGFyZW50Ow0KPiAr
ICAgIGJvb2wgKCpyZWdpc3RlcmFibGUpKHZvaWQpOw0KPiAgIA0KPiAgICAgICBzaXplX3Qg
aW5zdGFuY2Vfc2l6ZTsNCj4gICAgICAgc2l6ZV90IGluc3RhbmNlX2FsaWduOw0KPiBkaWZm
IC0tZ2l0IGEvcW9tL29iamVjdC5jIGIvcW9tL29iamVjdC5jDQo+IGluZGV4IDAxNjE4ZDA2
YmQ4Li5jNjJiN2ZkMTY5NSAxMDA2NDQNCj4gLS0tIGEvcW9tL29iamVjdC5jDQo+ICsrKyBi
L3FvbS9vYmplY3QuYw0KPiBAQCAtMTY4LDYgKzE2OCwxMCBAQCBzdGF0aWMgVHlwZUltcGwg
KnR5cGVfcmVnaXN0ZXJfaW50ZXJuYWwoY29uc3QgVHlwZUluZm8gKmluZm8pDQo+ICAgICAg
ICAgICBmcHJpbnRmKHN0ZGVyciwgIlJlZ2lzdGVyaW5nICclcycgd2l0aCBpbGxlZ2FsIHR5
cGUgbmFtZVxuIiwgaW5mby0+bmFtZSk7DQo+ICAgICAgICAgICBhYm9ydCgpOw0KPiAgICAg
ICB9DQo+ICsgICAgaWYgKGluZm8tPnJlZ2lzdGVyYWJsZSAmJiAhaW5mby0+cmVnaXN0ZXJh
YmxlKCkpIHsNCj4gKyAgICAgICAgdHJhY2Vfb2JqZWN0X3JlZ2lzdGVyX3NraXBwZWQoaW5m
by0+bmFtZSk7DQo+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPiArICAgIH0NCj4gICANCj4g
ICAgICAgdGkgPSB0eXBlX25ldyhpbmZvKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3FvbS90
cmFjZS1ldmVudHMgYi9xb20vdHJhY2UtZXZlbnRzDQo+IGluZGV4IGIyZTlmNGE3MTI3Li4y
OWFmOTVkODUwNyAxMDA2NDQNCj4gLS0tIGEvcW9tL3RyYWNlLWV2ZW50cw0KPiArKysgYi9x
b20vdHJhY2UtZXZlbnRzDQo+IEBAIC0zLDMgKzMsNCBAQA0KPiAgICMgb2JqZWN0LmMNCj4g
ICBvYmplY3RfZHluYW1pY19jYXN0X2Fzc2VydChjb25zdCBjaGFyICp0eXBlLCBjb25zdCBj
aGFyICp0YXJnZXQsIGNvbnN0IGNoYXIgKmZpbGUsIGludCBsaW5lLCBjb25zdCBjaGFyICpm
dW5jKSAiJXMtPiVzICglczolZDolcykiDQo+ICAgb2JqZWN0X2NsYXNzX2R5bmFtaWNfY2Fz
dF9hc3NlcnQoY29uc3QgY2hhciAqdHlwZSwgY29uc3QgY2hhciAqdGFyZ2V0LCBjb25zdCBj
aGFyICpmaWxlLCBpbnQgbGluZSwgY29uc3QgY2hhciAqZnVuYykgIiVzLT4lcyAoJXM6JWQ6
JXMpIg0KPiArb2JqZWN0X3JlZ2lzdGVyX3NraXBwZWQoY29uc3QgY2hhciAqdHlwZSkgIk5v
dCByZWdpc3RlcmluZyAnJXMnIHR5cGUiDQoNClRoYXQncyBhIGdvb2Qgd2F5IHRvIGJlIGFi
bGUgdG8gc2VsZWN0IGF0IHJ1bnRpbWUgdGhlIG9iamVjdHMgZW5hYmxlZCwgDQpldmVuIHRo
b3VnaCB3ZSdsbCBoYXZlIGEgYmluYXJ5IHdpdGggYWxsIHFvbSBvYmplY3RzIGNvZGUgcHJl
c2VudC4NCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZp
ZXJAbGluYXJvLm9yZz4NCg0K
