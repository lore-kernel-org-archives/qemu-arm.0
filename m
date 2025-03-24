Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2177198njc;
        Mon, 24 Mar 2025 12:24:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc4f:b0:224:256e:5e4e with SMTP id d9443c01a7336-22780c7b695mr223870355ad.16.1742844257323;
        Mon, 24 Mar 2025 12:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844257; cv=none;
        d=google.com; s=arc-20240605;
        b=cBhAhzB8P0tnuqHvsdHhoYSJRJwHkzelo+fv/U84a3vfnNbtTNGxjnewKlN3pYmpZy
         L8q7h0y4Xc5uUkWK2nnQLgWhCJ7GiBRTe9CyJVvxSOxO+XZOyKDWh0Ebn3Kx6GPSseYL
         9qF5Lg1QTtRCapC/58Q0c+JKs3mjvSysEQPlMbJOq3u8BahbHz2mI3D8ldK7Vd5s+w1r
         9IkwB2zbLdAIo+RrAqAKmc0g3VguagWRSAHj8xzswimmJknebIlzdsrJ1uG3+ONKVxKZ
         jC/ukab239trFrs3BJSZSzql7Riq9t4dEIKqJPtURxAhnTSKpuozHcgJ6/Ri9zzH5Rda
         w4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EwhYSCmxzwkZb62e1aTLdPHYo8Ds6ne6ZazzzgXRd7Q=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=SXJsOiyL0W9Dn9kqXcMXXkmT+2F5A5XvBLyr92SDoJymNdQa8l/nNCjSm/VvNaH9NK
         STpelEtuKGXx872x6q6MJ4jmFNI+EicaWS/SHkXmZJ16RwNNvcyYGpOkJfFtcTCUxf4f
         +MWWmr2oX1i0PDcH51rrzhBIKr/GVvpFXfYxLvaIDZ1RoTwK0AZB0LBD2yQJa3PsTP9o
         AGv0d6X3W77sq10c8xSpDGe74wwTphujEN+bwyxvX4lOc6LU8e4C8DpsVbj2Hx2zLStt
         eYKWG303f7KM0J4QgnRzDtO1L1bmvjJk8kHs3I6Tpfh2Xv4wZThfjR1LcyPLFJMTVK3g
         He7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NIURW2Mp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f8df52sor47824605ad.13.2025.03.24.12.24.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NIURW2Mp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844257; x=1743449057; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwhYSCmxzwkZb62e1aTLdPHYo8Ds6ne6ZazzzgXRd7Q=;
        b=NIURW2MpvledlcDtIIBAoHy0datSfG2BeKDgh8by9g1JVnEm8P96/mcgnpoMnPCRyQ
         scHuuG8C+mjR16UOb5DOsuorzYx+9Qjf+fvlaT/3hCaepdxaxWpsA8Gif+KXKzX1S9sk
         JICNFOQ4qK0z5Uj0fxYycYBnAE7qZkYvZy/uLgG6zshnbVQHKlG3aQOu5CprZE03nqwj
         l6UwQ7isO1/2AzMuIw1r20Op5wznrthFI+hM8sNOMJrlddKaE1Tl67ePlydHg23nS+um
         W8mtv24xTvpS6VZuY/idipLcC36fa8pM9Pg931QcLwFTw/Tb82PWOlz2ZYq6YUYt4B4D
         qCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844257; x=1743449057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwhYSCmxzwkZb62e1aTLdPHYo8Ds6ne6ZazzzgXRd7Q=;
        b=qIZObQDxVE4DOjj80gKYwtDKvaZfRL9kR8fOC75ebVbTEr8HrryW7/IB++vKeEy3eD
         G30a096iODBh2q5OKI8pqsZvcmEfpjfcO2flLajeUbxAsm0o5mBKfzKLxClJaKSDgcX+
         oemxSr2S8Lw4sxfAxRWrtIrKV5lMsG52n1ooCGYbIQIQFR3DahpnX/P5phr28Hvcrm8N
         +XanEbfEZ4Td20wq5ipI7mUUm26/uHtSP0UVDEC7DCbyxf23DNMo09neYuyco4pOz9eA
         W5n8fRnmBqT+W2/AXU9fPYsfjf+N9pcQnDBfRUv5dCUGC1/II+HUhMMoAn9xs/r9yHWP
         hfWA==
X-Gm-Message-State: AOJu0Yx3nyzVvmLI3IJkO73GoWzN7IczGSz1l7XxcG/unppHpHNxDsfg
	XTMNhNDHe9m7ddW5jehGZoc9hZJWoxrK0uxJqFzuhzIHPmBHAlaeumHtXcw0z0sAQL7OlSDgzXU
	ioul1LQ==
X-Gm-Gg: ASbGncsotcFeX+0O0ErghjoDMe3/3Lz2llGfIBc2JeQCZ+WpsTqmCvOwfLGQ47RQlNO
	HLjdPEwFiAeDqyHnK+Jo8TYiJTxM96DaFPXu2TAYfSk1QAkaEaVYbjxCQfbxBXW1T2R93TSXQbt
	blCldltGcV2tLTY/jN2M7Tl9DQL3sHTkwgwsEPQY1QBLmNOxWrHsBLaU57XxnMT9dmA36vyWIyy
	2f17s3Sy8UZePZC/dsyzKCAnoZCI7ozFOCfGSWlUYfpY7YK+chK1i9zop2ytLsbPaCKoVzcmxAC
	vc4zKMAyVcBkAd4/PLuLYZ7BygILGWjmWKF6RJ76lL6hu9JzhqGFMAd1Aw==
X-Google-Smtp-Source: AGHT+IHyTyBan8NZNA14WNQohEUVRTjEyDJWTb1J+7RFKPhNpOynuqByDr5qY1jmtK1ovlPYsPpCqg==
X-Received: by 2002:a17:902:da8c:b0:21f:988d:5758 with SMTP id d9443c01a7336-22780e0ae4amr209382725ad.35.1742844256673;
        Mon, 24 Mar 2025 12:24:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b289fsm74963235ad.158.2025.03.24.12.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:24:16 -0700 (PDT)
Message-ID: <a504eab5-97a4-4e1e-986f-ff96cd46362e@linaro.org>
Date: Mon, 24 Mar 2025 12:24:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] target/ppc: expand comment on FP/VMX/VSX access
 functions
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
 <20250324102142.67022-8-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: I/L6xu4OdZdo

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBNYWlubHkgYXMgYW4g
YWlkIHRvIG15c2VsZiBnZXR0aW5nIGNvbmZ1c2VkIHRvbyBtYW55IGJzd2FwcyBkZWVwIGlu
dG8NCj4gdGhlIGNvZGUuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8
cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIHRhcmdldC9wcGMv
Y3B1LmggfCA3ICsrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9jcHUuaCBi
L3RhcmdldC9wcGMvY3B1LmgNCj4gaW5kZXggZWZhYjU0YTA2OC4uMWU4MzNhZGUwNCAxMDA2
NDQNCj4gLS0tIGEvdGFyZ2V0L3BwYy9jcHUuaA0KPiArKysgYi90YXJnZXQvcHBjL2NwdS5o
DQo+IEBAIC0yOTA2LDcgKzI5MDYsMTIgQEAgc3RhdGljIGlubGluZSBib29sIGxzd19yZWdf
aW5fcmFuZ2UoaW50IHN0YXJ0LCBpbnQgbnJlZ3MsIGludCByeCkNCj4gICAgICAgICAgICAg
IChzdGFydCArIG5yZWdzID4gMzIgJiYgKHJ4ID49IHN0YXJ0IHx8IHJ4IDwgc3RhcnQgKyBu
cmVncyAtIDMyKSk7DQo+ICAgfQ0KPiAgIA0KPiAtLyogQWNjZXNzb3JzIGZvciBGUCwgVk1Y
IGFuZCBWU1ggcmVnaXN0ZXJzICovDQo+ICsvKg0KPiArICogQWNjZXNzIGZ1bmN0aW9ucyBm
b3IgRlAsIFZNWCBhbmQgVlNYIHJlZ2lzdGVycw0KPiArICoNCj4gKyAqIFRoZSByZWdpc3Rl
ciBpcyBzdG9yZWQgYXMgYSAxMjggYml0IGhvc3QgZW5kaWFuIHZhbHVlIHNvIHdlIG5lZWQg
dG8NCj4gKyAqIHRha2UgdGhhdCBpbnRvIGFjY291bnQgd2hlbiBhY2Nlc3Npbmcgc21hbGxl
ciBwYXJ0cyBvZiBpdC4NCj4gKyAqLw0KPiAgICNpZiBIT1NUX0JJR19FTkRJQU4NCj4gICAj
ZGVmaW5lIFZzckIoaSkgdThbaV0NCj4gICAjZGVmaW5lIFZzclNCKGkpIHM4W2ldDQoNClJl
dmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmc+DQoNCg==
