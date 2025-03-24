Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2218051njc;
        Mon, 24 Mar 2025 13:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOCr2ctuoi1/mksa03WV/poltxfRofIvivqUI160HVu8hueZ3eAGxbWNAUhCeERR/chgU6hSJLKLZx7g==@linaro.org
X-Received: by 2002:a17:90b:2647:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-3030fe58cc6mr23662746a91.4.1742849363489;
        Mon, 24 Mar 2025 13:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742849363; cv=none;
        d=google.com; s=arc-20240605;
        b=InD9GkSJow33gWgZ0fc3y1HMJWYm6TEVLGy549vepLwU+eePPcd+DrCjAfFjfFuEKg
         PZRUkeDWQuCD1gRF+ovuMBYh4cSdPkToXiaU9ndyx6i5L9TrVVlkP5QC5j9AmZb44VBa
         4MlZbKthg6I7DTX1NhyvNwzCQtwa2bzAzM7+tDBuWBnH8Y4D7Qjpvj072gDBgk7YD7zM
         Q/ZwXnx6ocCddxjsb+5EZzvhkcnrrOiQ6QuChy7jKtmXUeGqGdh76RuG1YiWK7hMNHzD
         452lFUcGNf9b1n3p+e0yExAYVt88l96Wyc5lQW3I7fm/89xB4+w41YZdld/fv406vnO7
         RTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=97hOyWapgZBd64gmy0Nc9wp499USihNMJzxpnuLZbN0=;
        fh=S8i08Asarqtc6e2Sb+KSr85Cr6FLP2mBkIyhHg2s8Yc=;
        b=fTkqEIYTJsXGOQdTqe+Jm6YEo/sD44nRObpW3GLUiqytqhZc9k8lzOoLbnjjqSswGl
         gF0G/4odDdeqt0IZVo2iNG8IUgz9XSoKm2i08saHU9E6+2fmNJhKXzi3zrwWiWFO0XjW
         lhxgqxm29b8GsnmxcFhdI/w2dCAwxmTHjRvEmMx9LVV7sgEhAiyDLZeXJw8/W7zKRyqf
         pUYPa4BEwC3nUaBbPsprl6aJsg/plqKNd2AOlMYmun8gW5XuZE7gaRDnyCaj2I9Ps5tU
         /ZcxeWZQ2pagpzjRn9ph5yhjQRwk90j068ly7ZU944izgP7/Qhyw/p9R7WcnzTBIhz4m
         9LUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfVyYUhQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f79b3b3sor6759681a91.5.2025.03.24.13.49.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 13:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfVyYUhQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742849363; x=1743454163; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97hOyWapgZBd64gmy0Nc9wp499USihNMJzxpnuLZbN0=;
        b=dfVyYUhQYv1quP+ey/anuf8WyzdMoIYiU1y1G7QGi6FSgBBWGxgbKeoeJnRF5P3uCN
         Ma4tYnAGCbMepfVkZtYkrMkqCkE2E7xN3SLI1iYtNbAQ39hKl7ZUbRYl7yEzIJsNhdGO
         V1dbgM0v1rpWLTfnsC+HGfmcH26/Uhv2wRyjULlPuR5Kh0/fv+Fzkq/jBaBxmXMOw2gY
         tFpu8tkP8IiPBLxOsMY/KB4qhxO6b6DJXog3YBgUhWqGhdYGBz/8WXuWLQuBnb7F03g/
         iFqob1WdxldlWPQA2Vi0jGy0GgbiYzXjFqZM2cIJGKzvZKhj60Y2W7tUEW7h4s6/sN6h
         X4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849363; x=1743454163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=97hOyWapgZBd64gmy0Nc9wp499USihNMJzxpnuLZbN0=;
        b=ryicwq13L+YKaygvpM5f8NjzyXoA8pkBybkEeReXN/sZrPdarqmaZizfa9AxsSQ7Vm
         tfPhazgw1su/SBmUh7NZ+hZvTGLFncb9RZ9AqBsr4C7zU1mYn0Zad/Jv36g4TDDWCDqu
         e9IyGdV7iTaXwKL7KiHH/Gju8D3MN9ao9BI7kvhtF/pHvk7er0Kj7XEP1KnU6+jKEy97
         hkmTUCXxCau1h2Dhuyl2VsIMoEYbdBkvjX7xBxxmya70qKwVOlSP2lgoC8B/C2yhrVAT
         uW6uMB50kMQ5MNADDYvjDSAe3aD3vXYbJBrssY37U4Njh2n8YLNxNvjtVfDItjAr2r16
         x4mg==
X-Forwarded-Encrypted: i=1; AJvYcCX6X126mlFsDhJPGY/PL2mossJOS4P+3N/itM9rbHqGkqR+yBLpHhAcPh1WDPk1z0mX9fpmSIZhir4rJA==@linaro.org
X-Gm-Message-State: AOJu0YwYrc/atUV9OAlxOteZse4+qSh/mJ3FJQnlvexnpKeVtopkvH0e
	qSjq+IZYZUJF8ibCFFkxek5qwDBdOXQIjGn7NzQ2/k8GmsEVx6gcJwyO/G6MOTmtQw==
X-Gm-Gg: ASbGncsPESwSjezVnckW3qgR9ektDZzO6AznyOQAauo+DGxYn5sDLMCrp0XqXiVUUBk
	ScF4RIhgwjY0qiVorJtBs9IhFj1AXVCr0XnxrOOMUmE0/ci/Av1XnfhbkH7biELLjtiOiJQUiXP
	X18+mCu6PIfxaGrT3yaS2Y9c7nCJaHGO0Hi5HKBskHEs1juH9JKicET58fy4GXLfPhvdOO8jUaA
	WIxUOLlwS3ESxC4f7sUqQI3Qorp4XCK1Lr33ndxGJsZOebdi60mkWOsidav+f3YSf0IKGsDRiYm
	0Gd4JQbd5L5mWD1NfhAw5roRybH0f92kT7DKnXUbgdzW9My6Qm5gZPGPfA==
X-Google-Smtp-Source: AGHT+IFXt3ZXtvjhqsKPjwTZjE6W+mT+TwD0xPN6Wv7bPTrX6BddvzyANfTOi8eqwCY9oud7VfiANQ==
X-Received: by 2002:a17:90b:2551:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-3030fe595c0mr25403894a91.7.1742849362863;
        Mon, 24 Mar 2025 13:49:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f395e9sm75791905ad.28.2025.03.24.13.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 13:49:22 -0700 (PDT)
Message-ID: <4ff5ca15-6784-4660-b6f5-9c219d215378@linaro.org>
Date: Mon, 24 Mar 2025 13:49:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
 <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
 <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
 <f2fc4de2-7235-4c86-8574-2b8d630e5cd6@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f2fc4de2-7235-4c86-8574-2b8d630e5cd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: NJmG2tnpesiL

T24gMy8yNC8yNSAxMzowNCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMjQv
MjUgMTI6MjksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzI0LzI1IDEwOjM5
LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAzLzI0LzI1IDAzOjIxLCBBbGV4
IEJlbm7DqWUgd3JvdGU6DQo+Pj4+ICvCoMKgwqAgI2lmZGVmIFRBUkdFVF9CSUdfRU5ESUFO
DQo+Pj4+ICvCoMKgwqAgTWVtT3AgZW5kID0gTU9fQkU7DQo+Pj4+ICvCoMKgwqAgI2Vsc2UN
Cj4+Pj4gK8KgwqDCoCBNZW1PcCBlbmQgPSBNT19MRTsNCj4+Pj4gK8KgwqDCoCAjZW5kaWYN
Cj4+Pj4gKyNlbmRpZg0KPj4+DQo+Pj4gVGhhdCdzIHdoYXQgTU9fVEUgaXMgZm9yLg0KPj4+
DQo+Pj4+ICsvKg0KPj4+PiArICogSGVscGVycyBjb3BpZWQgZnJvbSBoZWxwZXJzLmgganVz
dCBmb3IgaGFuZGxpbmcgdGFyZ2V0X3Vsb25nIHZhbHVlcw0KPj4+PiArICogZnJvbSBnZGJz
dHViJ3MgR0J5dGVBcnJheSBiYXNlZCBvbiB3aGF0IHRoZSBidWlsZCBjb25maWcgaXMuIFRo
aXMNCj4+Pj4gKyAqIHdpbGwgbmVlZCBmaXhpbmcgZm9yIHNpbmdsZS1iaW5hcnkuDQo+Pj4+
ICsgKi8NCj4+Pj4gKw0KPj4+PiArI2lmIFRBUkdFVF9MT05HX0JJVFMgPT0gNjQNCj4+Pj4g
KyNkZWZpbmUgbGR0dWxfcChhZGRyKSBsZHFfcChhZGRyKQ0KPj4+PiArI2RlZmluZSBnZGJf
Z2V0X3JlZ2xfdmFsdWUobSwgYiwgdikgZ2RiX2dldF9yZWc2NF92YWx1ZShtLCBiLCB2KQ0K
Pj4+PiArI2Vsc2UNCj4+Pj4gKyNkZWZpbmUgbGR0dWxfcChhZGRyKSBsZGxfcChhZGRyKQ0K
Pj4+PiArI2RlZmluZSBnZGJfZ2V0X3JlZ2xfdmFsdWUobSwgYiwgdikgZ2RiX2dldF9yZWcz
Ml92YWx1ZShtLCBiLCB2KQ0KPj4+PiArI2VuZGlmDQo+Pj4NCj4+PiBTdXJlbHkgeW91J3Jl
IG5vdCBpbnRlbmRpbmcgdG8gcmVwbGljYXRlIHRoaXMgaW4gYW55IHRhcmdldCB0aGF0IGNh
biBoYXZlIG11bHRpcGxlIHNpemVzPw0KPj4+IFRoaXMgaXMgbm90IGFuIGltcHJvdmVtZW50
Lg0KPj4+DQo+Pg0KPj4gSWYgSSdtIGNvcnJlY3QgKGFuZCBmcm9tIHYxKSwgcHBjIGlzIHRo
ZSBvbmx5IGFyY2hpdGVjdHVyZSBoYXZpbmcgcmVnaXN0ZXJzIGRlZmluZWQgd2l0aA0KPj4g
dGFyZ2V0X2xvbmcgdHlwZXMuDQo+IA0KPiBXaXRoIGEgcXVpY2sgY2hlY2ssIG1pcHMsIHJp
c2N2LCBzcGFyYyBkbyBhcyB3ZWxsLg0KPg0KDQpSaWdodCwgSSBzaG91bGQgaGF2ZSBydW4g
dGhlIHNpbXBsZSBncmVwIDopDQpTbyBpdCdzIGJldHRlciB0byBrZWVwIHRob3NlIG1hY3Jv
cyBkZWZpbmVkIGluIGEgc2VwYXJhdGUgaGVhZGVyIChvdXQgb2YgDQpoZWxwZXJzLmgsIGxp
a2UgaGVscGVycy10YXJnZXQuaCksIHNvIHdlIGNhbiBhbHJlYWR5IHN0YXJ0IHRvIGNsZWFu
dXAgDQpzb21lIHRhcmdldHMsIGFuZCBkbyB0aGUgcmVzdCBvZiB0aGUgd29yayBmb3IgdGhl
IG9uZXMgdXNpbmcgDQp0YXJnZXRfdWxvbmcgdHlwZSBmb3IgbGF0ZXIuDQoNCj4gDQo+IHJ+
DQoNCg==
