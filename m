Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp78076njb;
        Thu, 3 Oct 2024 14:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaKNvuXbqsbaSH5UL2mhepfeyveT+XvQIoGsDtBrUScHnzXKyJg3A8VTJe9oDw4hOH4bDgEBEwvJbJKw==@linaro.org
X-Received: by 2002:a17:902:d484:b0:20b:8d7f:d13 with SMTP id d9443c01a7336-20bff18bcdemr8646705ad.58.1727991063230;
        Thu, 03 Oct 2024 14:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727991063; cv=none;
        d=google.com; s=arc-20240605;
        b=fcOB05Zq3gh4VAE/9MfwoaMoLK2paBB9jhw1l1W6t6MRqy53M4QdDTtTqoD3lSrrkw
         sCtxHX7894S8SqfZRjvh4P0DEkAdkbfgeMUpgzlEHG3BzXm42w5GY7tzVo5ae9JSqLQ7
         wNgURtqG+CfuOJrv9/had/GzHIm1+0umOCDB+uISqIuy7kxEZYRh8kWegoi0yiAPB0q/
         lH+Fo5dUeW6xO7OHv/x7A0N0hwC3hmd/jVpxkUReo1A58rBBJACV4g2RBSWJStmG6ydV
         Z65I7JiuC+lu5Zn6D7sk1Ib5ZUG3i9SOviEk00gR5ylJ7tJKufGBC+0LwfdBhDnJLbpY
         bhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4B361wxAFVRbvhVHWi1pgIVtEGILyIVUI91bqrA+uiU=;
        fh=hZ2FgPGqZzERmGKu+xiAt7g7zp7oI8zo19Qnr0xgkGU=;
        b=NQ+4b3N6gqBpYQKZBCRTiXkD+gybOyKklsxl27LjwUUp6rteh0CRAFDvY/MhTNqoIj
         T87PGp27ke+erSo1dE1zW1UyRnBi9qn9DeD4oS6FTmuNGvJApkS44Is76MIlWBot5wOx
         JGbHQvpSQfXTkO7c/mt5DzoXRrkwZRp9OpGUUR9UkpJBdgalHPwng/M6iGZCGkc4lqbm
         7gfHdtYzdV0UfNgCeP/JI60Y+EagkRftSoI9VRUBH//hOIKnq9e+O2aCxnUcwhjA47lb
         0gRqlrOS1cUCV0Z+d5JhaGeV/6eEQDVpUG0Yh4QY05w3fwQfxM1igf36BKWaKDaChiYE
         s6yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFP3JXbL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20be97b8d38sor13589355ad.7.2024.10.03.14.31.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 14:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TFP3JXbL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727991063; x=1728595863; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4B361wxAFVRbvhVHWi1pgIVtEGILyIVUI91bqrA+uiU=;
        b=TFP3JXbLT7M+eVMYH6Ajd+sojF8w+nboy3JVtdtycT2VK2rlIxSzFE2QtFIo25TIG5
         3GQPdIz7hpb0B5HhZIyULcstvRzRtFqVKQbscCmKcw7VQZmXYChwSh9rZV+jNkObFIFt
         hVVzCYQJUyDAN7+uCPLvP2QRL7Rn/PMPLvhatNhC5BOfuFPWsUysafn7RZ9Q6tz7nSd1
         OxRehmBWIZKz7Ku5jNgBu1m8WjbqiFkZ5wyffK9WiXSymlgo7BIE+kQb4WrQMGNZjJFt
         y+12UrBPHZ01xhNLMv8cSUVaqHR77p7sqDgTTay6c9t734iQjAVoULkzTWuTV3LOHK1m
         LUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991063; x=1728595863;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B361wxAFVRbvhVHWi1pgIVtEGILyIVUI91bqrA+uiU=;
        b=dJSDnmmgEW3Ze9XSS2+hDWeIR8gdvmjyaM3RbFsBJNPY7AFsyFikUR+0sQU3dhn+8B
         kwx2YxJ54PQHs6s63STLTuKQFU9HWfajtcX3qzMydhJC6XIovAg7kySaUVIQzzqDIKkg
         nKgINHf3TV3Wh4syNfsZoiAu+z62F9GFdtDjw7HTYx2Kv0trxLAz0gZL5jhopbxb4DcI
         ihoDHeBs6lVLn/Cvp41pZYBh2owTamhCktkMu5I4s5dvJcYQBR3b8ZGQEdbkE49EVcPO
         9stijFi7eaVL8oYoKdVYAcock5CU3jZxShQMz7++ft9MvvDPHc/iAMSFgYZ55pYA4qPY
         hrpA==
X-Forwarded-Encrypted: i=1; AJvYcCV8IGL/ksBYsDz+0NVcR4AUXNjmIlvE4uDob9IaXnGaoSO2QiSYVDOCBSuFZ0BT++kRZuSWA6X+mbDLPg==@linaro.org
X-Gm-Message-State: AOJu0YxX2FhAQLqH62g7ZzZrkO67+PE0LJJxu9Z+lLG0kUaR+Ud7vZzK
	8fG8M1KSyFpDWJjLrG4x7P6Iz0ka3DaKpTqrkjSMUdZGbaHiCrmF2p7ZfPtvuSb+7g==
X-Google-Smtp-Source: AGHT+IFtzjsiaxuS6VNNzw2rUJTcOOE8bHrdlmfZiF2WsUw+IZmEqafl+i6EZBs4E1mhm91mmMeQ+A==
X-Received: by 2002:a17:902:e885:b0:205:2a59:a28c with SMTP id d9443c01a7336-20bfde555b8mr7047295ad.1.1727991062772;
        Thu, 03 Oct 2024 14:31:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefafc65sm12994565ad.217.2024.10.03.14.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 14:31:02 -0700 (PDT)
Message-ID: <aeb88605-989b-4c26-9371-15fbe44a9e3a@linaro.org>
Date: Thu, 3 Oct 2024 14:31:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
 <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
 <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
 <a14cd43c-087b-4a5d-b036-39aa6a80e691@linaro.org>
 <f20cebfe-027a-4664-82f0-3769c7047e38@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <f20cebfe-027a-4664-82f0-3769c7047e38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: EbqjAvzMUT2L

T24gMTAvMy8yNCAxMzo0OCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDMvMTAvMjQgMTg6MDQsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAxMC8zLzI0
IDA5OjAyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+PiBPbiAzMC85LzI0
IDE2OjMyLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4+Pj4gT24gMzAvMDkvMjAyNCAwOS4zNCwg
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+Pj4+PiBSZXBsYWNlIGEgcGFpciBv
ZiBtZW1jcHkoKSArIHRzd2FwMzIoKSBieSBzdGxfZW5kaWFuX3AoKSwNCj4+Pj4+IHdoaWNo
IGFsc28gc3dhcCB0aGUgdmFsdWUgdXNpbmcgdGFyZ2V0IGVuZGlhbm5lc3MuDQo+Pj4+Pg0K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgwqDCoCBody94dGVuc2EveHRmcGdhLmMg
fCA2ICsrLS0tLQ0KPj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvaHcveHRlbnNh
L3h0ZnBnYS5jIGIvaHcveHRlbnNhL3h0ZnBnYS5jDQo+Pj4+PiBpbmRleCAyMjhmMDBiMDQ1
Li41MjFmZTg0YjAxIDEwMDY0NA0KPj4+Pj4gLS0tIGEvaHcveHRlbnNhL3h0ZnBnYS5jDQo+
Pj4+PiArKysgYi9ody94dGVuc2EveHRmcGdhLmMNCj4+Pj4+IEBAIC00MzgsMTEgKzQzOCw5
IEBAIHN0YXRpYyB2b2lkIHh0ZnBnYV9pbml0KGNvbnN0IFh0ZnBnYUJvYXJkRGVzYw0KPj4+
Pj4gKmJvYXJkLCBNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+Pj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzaXplX3QgYm9vdF9zeiA9IFRBUkdFVF9CSUdfRU5E
SUFOID8NCj4+Pj4+IHNpemVvZihib290X2JlKQ0KPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDoNCj4+Pj4+IHNpemVv
Zihib290X2xlKTsNCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ4
X3QgKmJvb3QgPSBUQVJHRVRfQklHX0VORElBTiA/IGJvb3RfYmUgOiBib290X2xlOw0KPj4+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgZW50cnlfcGMgPSB0c3dhcDMy
KGVudHJ5X3BvaW50KTsNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90
IGVudHJ5X2EyID0gdHN3YXAzMih0YWdwdHIpOw0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWVtY3B5KGJvb3QgKyA0LCAmZW50cnlfcGMsIHNpemVvZihlbnRyeV9wYykpOw0K
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KGJvb3QgKyA4LCAmZW50cnlf
YTIsIHNpemVvZihlbnRyeV9hMikpOw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RsX2VuZGlhbl9wKFRBUkdFVF9CSUdfRU5ESUFOLCBib290ICsgNCwgZW50cnlfcG9pbnQp
Ow0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RsX2VuZGlhbl9wKFRBUkdFVF9C
SUdfRU5ESUFOLCBib290ICsgOCwgdGFncHRyKTsNCj4+Pj4NCj4+Pj4gV2h5IGRvbid0IHlv
dSBzaW1wbHkgdXNlIHN0bF9wKCkgaGVyZT8NCj4+Pg0KPj4+IFdlIHdhbnQgdG8gcmVtb3Zl
IHRoZSB0c3dhcDMyKCkgY2FsbHMuLi4NCj4+Pg0KPj4NCj4+IEkgdGhpbmsgaXMgcG9pbnQg
aXMgdGhhdCB5b3UgY291bGQgZGlyZWN0bHkgdXNlIHN0bF9iZV9wLCBpbnN0ZWFkIG9mDQo+
PiBzdGxfZW5kaWFuX3AoVEFSR0VUX0JJVF9FTkRJQU4sIC4uLikuDQo+IA0KPiBUQVJHRVRf
QklHX0VORElBTiBpcyBkZWZpbmVkIGFzIDAgb24gbGl0dGxlIGVuZGlhbiwgYW5kIDEgb24g
YmlnIG9uZS4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlIGlzbid0IHdvcnRoIGl0Og0K
PiANCj4gICAgIGlmIChUQVJHRVRfQklHX0VORElBTikgew0KPiAgICAgICBzdGxfYmVfcChi
b290ICsgOCwgdGFncHRyKTsNCj4gICAgIH0gZWxzZSB7DQo+ICAgICAgIHN0bF9sZV9wKGJv
b3QgKyA4LCB0YWdwdHIpOw0KPiAgICAgfQ0KPiANCj4gTWF5YmUgSSdtIG1pc3NpbmcgVGhv
bWFzIHBvaW50LCBhcyB0aGUgeHRmcGdhIG1hY2hpbmVzIGFyZSBhdmFpbGFibGUNCj4gZm9y
IGJvdGggeHRlbnNhLXNvZnRtbXUgKExFKSBhbmQgeHRlbnNhZWItc29mdG1tdSAoQkUpLg0K
PiANCj4+IEkgZG9uJ3Qga25vdyBpZiB5b3VyIGludGVudCBpcyB0byBtYWtlIGJlL2xlIHZh
cmlhbnQgInByaXZhdGUiIGFuZA0KPj4gcmVsaWVzIG9ubHkgb24gZW5kaWFuX3AgdGhvdWdo
Lg0KPiANCj4gTXkgaW50ZW50IGlzIHRvIGVuZm9yY2UgZW5kaWFuIGFnbm9zdGljIEFQSSB1
c2VzIHdoZW4gcG9zc2libGUsIGFuZA0KPiB1c2UgTEUvQkUgc3BlY2lmaWMgdmFyaWFudCB3
aGVuIGl0IGlzIGtub3duIGF0IGJ1aWxkIHRpbWUuDQoNCk9oIG9rLCBpdCdzIG1lIHdobyBt
aXNzZWQgeW91ciBwb2ludCB0aGVuLg0KRm9yIHNvbWUgcmVhc29uLCBJIHRob3VnaHQgd2Ug
d2VyZSBhbHdheXMgY2FsbGluZyBiaWcgZW5kaWFuIHZhcmlhbnQuDQoNClRodXMsIHlvdXIg
aW1wbGVtZW50YXRpb24gbWFrZXMgdG90YWxseSBzZW5zZS4NCg0KTGV0J3Mgc2VlIGlmIFRo
b21hcyBtZWFudCBzb21ldGhpbmcgZGlmZmVyZW50Lg0KRWxzZSwNClJldmlld2VkLWJ5OiBQ
aWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
