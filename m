Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2177333njc;
        Mon, 24 Mar 2025 12:24:36 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:223:325c:89f6 with SMTP id d9443c01a7336-22780c6a15amr298406105ad.10.1742844276576;
        Mon, 24 Mar 2025 12:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844276; cv=none;
        d=google.com; s=arc-20240605;
        b=bXTDAnTdszBTMIERSmaUw6vE1u8ZstfwoSFh2mJ7Z8BXCLlQMX511WKWHqgjF2KkOi
         bP+vdAUM10Wjnn7YpaX4PuVQRRTOIlmGC66CCXJ5PJjCHeJje8zTF50ISc6tOHVnIgdA
         gb2ZheoAHAN9BsbmNUgb5D1gSmP9MJYLUZUTuVgrlxSeo6hYdXWJL7F0UiVNtq02DCnB
         rP5WmRAQIbt657opYjVdIST57qdGejYk2HhouEUxyRTyWMuIEt+EJqFqjv57EZ8J9trV
         EKAvkFD50a35HKuIze0PYJ5QU9AZbXnrdCw4CNpKZUbFmzCgIxuRFRpBeWVZ4Xy5G9Yx
         +QGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6020aAwZb8kumMqjWBZgP/W9xGt5ZslaNiVoWIO95Uc=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=ahXfGlegXRZ0MBvBKFPKcMhFWEZjtQTF2d17GWwbkFcOyeOsgObFgvB2yROeu6LJrh
         Nzb7XxWVMF3tehmMKvr0Sa6QRsWeuAM/Dd2SRsIl1TXmiqx/zBGRdg1Tm16bEVTv4Jpk
         t0x8GDmjPJ55ZIjEvt41j1aSohwOsoBRLphXGO0m/mw47BglCOLVadFNq34/lydeoLi+
         SeiHAlh6Hqm9e7eVnearipXsN//r7OKb8KG/uz0SYw55bFawHByvXl2wSujof5zD7IAh
         4G9B2MHl0iD852tyKVi4lwJ3sJnPdDh8XkOlK0QvWbFpRPzOI1zmq6U+kvw8o1tX9WYj
         x6gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tE1jL91s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227812380f1sor55522465ad.15.2025.03.24.12.24.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tE1jL91s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844276; x=1743449076; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6020aAwZb8kumMqjWBZgP/W9xGt5ZslaNiVoWIO95Uc=;
        b=tE1jL91svnFxG6XORUD5n/6Pmgp+J45gHajNn3dX8pIiYuCpa0/QrgdDgR6nbPo8Yq
         hLW29dhPOHQaZOM3BdsZFqPVMFoRhdsXuO44yurpZA4G8W0tlp2C4UXazMaqGdD0IaqI
         FwnkhPFChtkhG0qZRDHvhbWjTFJDOgpk1anBV5ngj/1ejwm7FddjKl2w2jXf5KG3sgJs
         cM4P40SwInmcy/U3m3PXxlbBMasC2QEa+4oYcWGoPp3wSuNlgEsAbxkXoQ2BNDGzBr+l
         W+cG8usr+DWbmiroeoLqfHABDPRKaJroqAwhoJMT53pHZQAsn7mTdTy6xeoeaqMtEviT
         leHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844276; x=1743449076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6020aAwZb8kumMqjWBZgP/W9xGt5ZslaNiVoWIO95Uc=;
        b=rUROEPR4Apkk3oVF0cc20fmB7WzxmoRakW6356Z9seGS3C/ZnGWPFPjeeL21lN+/3d
         rQ0FjpJk79465/wSw5um0IdVF2OuJkiJVVk/pUhGA5/jDptF6NC28wxinmJa8ReqKra1
         CpfEvSM59W0GCLdJY/KeFB/3Tn0uRBJrHwfrydOYQUksk5BdYGlZsK9xzS7wNz7H7KQX
         0bgNcKJy5uyUrTc1gud6x1QzbkTOUHh/UnGwOEoNwNhqgIOnus4haFXZ0VIlDC1kcbni
         Ac1m9LAWJlsDL4x3kjP45AlnuDNltmJrFajiB5Ot69FmYFNLWJeZq6wnj8Zc+GtAItwH
         /7EQ==
X-Gm-Message-State: AOJu0Yw3PiCy7C6hBLW/i6tPxo6gqZ9ZEx2jysZ/5zQ4nNsW/QYiCoBo
	SUXISNbqRzYuIWzSaSgwRSpcwp3b4tQeMe+aKjwdHCDVhaXLvcTnILttc27+56oYOKPEVfdlbRg
	7Th1s1A==
X-Gm-Gg: ASbGncvsqexd6VadpIiVujo5LIVmbcXJ5eVZxFyQIXURc8KsROa3f1aS8b/VAU4qZAC
	xQLkQ0mmX8eEKSYOUiLvlQtUJYtOFwHrurLi28FdaWkxlJzmW1xoYsSH3Ne8DggtPhwE3gOPfM0
	F5sHQxXsVtchDT1ExOOfMO1836tg3scifWWHm0izgr4KnWpNdq+dVI3l0AqAqGVkZaUolE7RSWr
	9/hArR9YoE8qpcSBMYK3O4mlV+IvjY8AYBqwhdYrZBQLRq6KeBzn4SV4E4fwrcqfu5cwIiaJTcg
	+rCwgupCqfXCNsrdtPkcDBD9l7oc0LI8UgoEhl7XJyen2l6Zglfzfz+fmw==
X-Google-Smtp-Source: AGHT+IE4qPUz5gYwwYIL6B6Lv2/yJz+NzSDmJ+f19kpUBF8nlsTwMnhrWAmxrZP2n2Fs7zBr32sFFQ==
X-Received: by 2002:a17:903:320e:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22780e3f352mr215034985ad.53.1742844275928;
        Mon, 24 Mar 2025 12:24:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f39772sm74794155ad.25.2025.03.24.12.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:24:35 -0700 (PDT)
Message-ID: <f138ea6d-342e-4d8b-9e50-8aa112981744@linaro.org>
Date: Mon, 24 Mar 2025 12:24:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] target/ppc: make ppc_maybe_bswap_register static
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
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
 <20250324102142.67022-9-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: bDFGD/OwaiGN

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBJdCdzIG5vdCB1c2Vk
IG91dHNpZGUgb2YgdGhlIGdkYnN0dWIgY29kZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBQaWVy
cmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+IFJldmlld2Vk
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4g
LS0tDQo+ICAgdGFyZ2V0L3BwYy9jcHUuaCAgICAgfCAxIC0NCj4gICB0YXJnZXQvcHBjL2dk
YnN0dWIuYyB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvY3B1LmggYi90
YXJnZXQvcHBjL2NwdS5oDQo+IGluZGV4IDFlODMzYWRlMDQuLjk1MGJiNmUwNmMgMTAwNjQ0
DQo+IC0tLSBhL3RhcmdldC9wcGMvY3B1LmgNCj4gKysrIGIvdGFyZ2V0L3BwYy9jcHUuaA0K
PiBAQCAtMzAxNiw3ICszMDE2LDYgQEAgc3RhdGljIGlubGluZSBib29sIHBwY19pbnRlcnJ1
cHRzX2xpdHRsZV9lbmRpYW4oUG93ZXJQQ0NQVSAqY3B1LCBib29sIGh2KQ0KPiAgIA0KPiAg
IHZvaWQgZHVtcF9tbXUoQ1BVUFBDU3RhdGUgKmVudik7DQo+ICAgDQo+IC12b2lkIHBwY19t
YXliZV9ic3dhcF9yZWdpc3RlcihDUFVQUENTdGF0ZSAqZW52LCB1aW50OF90ICptZW1fYnVm
LCBpbnQgbGVuKTsNCj4gICB2b2lkIHBwY19zdG9yZV92c2NyKENQVVBQQ1N0YXRlICplbnYs
IHVpbnQzMl90IHZzY3IpOw0KPiAgIHVpbnQzMl90IHBwY19nZXRfdnNjcihDUFVQUENTdGF0
ZSAqZW52KTsNCj4gICB2b2lkIHBwY19zZXRfY3IoQ1BVUFBDU3RhdGUgKmVudiwgdWludDY0
X3QgY3IpOw0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9nZGJzdHViLmMgYi90YXJnZXQv
cHBjL2dkYnN0dWIuYw0KPiBpbmRleCAzYjI4ZDRlMjFjLi5jMDllOTNhYmFmIDEwMDY0NA0K
PiAtLS0gYS90YXJnZXQvcHBjL2dkYnN0dWIuYw0KPiArKysgYi90YXJnZXQvcHBjL2dkYnN0
dWIuYw0KPiBAQCAtODEsNyArODEsNyBAQCBzdGF0aWMgaW50IHBwY19nZGJfcmVnaXN0ZXJf
bGVuKGludCBuKQ0KPiAgICAqIFRBUkdFVF9CSUdfRU5ESUFOIGlzIGFsd2F5cyBzZXQsIGFu
ZCB3ZSBtdXN0IGNoZWNrIHRoZSBjdXJyZW50DQo+ICAgICogbW9kZSBvZiB0aGUgY2hpcCB0
byBzZWUgaWYgd2UncmUgcnVubmluZyBpbiBsaXR0bGUtZW5kaWFuLg0KPiAgICAqLw0KPiAt
dm9pZCBwcGNfbWF5YmVfYnN3YXBfcmVnaXN0ZXIoQ1BVUFBDU3RhdGUgKmVudiwgdWludDhf
dCAqbWVtX2J1ZiwgaW50IGxlbikNCj4gK3N0YXRpYyB2b2lkIHBwY19tYXliZV9ic3dhcF9y
ZWdpc3RlcihDUFVQUENTdGF0ZSAqZW52LCB1aW50OF90ICptZW1fYnVmLCBpbnQgbGVuKQ0K
PiAgIHsNCj4gICAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4gICAgICAgaWYgKCFGSUVM
RF9FWDY0KGVudi0+bXNyLCBNU1IsIExFKSkgew0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sg
Qm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
