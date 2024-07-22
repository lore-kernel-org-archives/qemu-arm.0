Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2141241njc;
        Mon, 22 Jul 2024 14:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW80xJqLPKsad2T+QL4MNA6e0vh2axNcQdJCB/KjEHsjlV4BN1U1Q8EuwNYFzJyNoaOYBmYxTiqsGLT+fAOhJ1zDtkY3IPk
X-Received: by 2002:a05:6602:400a:b0:7eb:89ba:44fe with SMTP id ca18e2360f4ac-81ea5349eb4mr139928639f.17.1721682261754;
        Mon, 22 Jul 2024 14:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682261; cv=none;
        d=google.com; s=arc-20160816;
        b=doSMN6VEyS/IK0tJwyEERKuKcASd0vq4YkLnSEF/g3Xd2L36mwiqwIA6NWYaYfPHRq
         N0moLPNUSvc73DGcbCzPkoxFFllgpDQxq7JOPwjPGeQOgD2c8JRXiwe9FeG/QYl5XXBL
         AAmMLcZdOEWg+ocXHcLZKsDRyFVql/y6FKoIMfnadl9evtPCYRrPjAYQahN+aSL+IsV8
         9fWmZxArksz2Y3YFZ94Q70wotcy6A03l1Ts9q7GeMOOhPVDYYSt0swNn1himc+io1Gzu
         EBh9oQ2bxXmr8cY+L35qwnB7T0R98ymnSkVB04b+sR6G5wdR6f0J03JgitSCFTHoyin3
         eBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6nLJb7N3tCi8KVBa4iIQwt+e6N/HkGEFo0szuSgBsCY=;
        fh=VJvdu8Nh2QCY08rxzR3Ycs8J0WPozBkUjHPfBqbKxzg=;
        b=TQ0iiisSHd1ZpwW8+qguWnbL53xb/uQGJAUBzZDtwqdE7co/pgtcEYzATtXkCoRX5Q
         GOD2rsKEblQqD8kzh5ULvsV/ulzP96AwSXDq3f/WpJ2DhN/ngRXCQcrsQIHhYgafwWxJ
         IsebBUDSE5Eyxo8MM1M4NyPoLWD09+pA6chcRdclBSdmG+wswF0l9hM4Ah0Pg56vFQBc
         yCnc7dAML1H4mfjb//JjMVV+du55/iPDk/kf3H/dZ7rs5iLZA3EQMNbU6eqHtrGnP0D4
         FKDSSPy6wM7/ooqF0R3LtRbmyJ46pw8HYSsH5wAmmux6Br+RnLS7T/s+ZcriszOQ1vwX
         juAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAJUMtX0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca18e2360f4ac-819abbfdf0dsor359656439f.3.2024.07.22.14.04.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAJUMtX0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682261; x=1722287061; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nLJb7N3tCi8KVBa4iIQwt+e6N/HkGEFo0szuSgBsCY=;
        b=mAJUMtX0WXWh+8XzR2b8TqzRwD8TMBfjgtsOizZuLt9r6IjCZZESI2ree0KcfawQY+
         snypToPW7JxOpsXrS6V2Jg0NX2eDyII49oHh/u/cURv+AhM0CB6QWz7nw5X8aMp8nnQT
         t4pTQ+B0D/jW4+B7HDMQn0pXkCDf5jq9CzMa113dosH0894RWiFuraSLpkgTzTKDPVM6
         LJMs74Eh8fQtbGT434aRIsfP4u7ynbhGRIP8nLqOCZtAkodg91cwoJyp6jlJSjKwHr2t
         LKZqki6CGhcx1JvzDPZPSSBrLAteoY1V0QXW4Co6U/OQOkQPyiGqnfS8oNwDnugn8YLU
         wGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682261; x=1722287061;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nLJb7N3tCi8KVBa4iIQwt+e6N/HkGEFo0szuSgBsCY=;
        b=ZQNOuZKAruk/vFpNK/DTqHWyFTsxQUnlxOyFS+g1zWtObF3FEUyTBJzuVN7HccCUza
         WMlyvATuQ9HUuUqYWPOwuwdbab0uLcnUtQ4XjYxsMwzcVaxkCQs4watlfPZhiVfhwvIv
         GiHYi9ZNQGY8dPM20M4oUY2haYB7SBYzIHF435VSiePmwQyDI074PQMvyhGg+cEDaVq5
         oXHTUUUnCLKyo5rxyne+cv7n8oYzDydUFP5xzUenPKwZ6QShurYO5BH/8a4UDmHgW5CE
         JB00eO10YTWeUF3nwbnKRuRJKsXZoK3HaWr74jhGCaEfpo0aypP3qFbBze5FVGDabQZK
         nJFw==
X-Forwarded-Encrypted: i=1; AJvYcCXDylBQC7J5F5s5Zd/1PUwvONcM9+8d5qqiDpX1BXnLb9iKNWLrOUPcz9zTHre+bbLd13Yr/lFkiKXBBSd0n/c/OkfHwm8i
X-Gm-Message-State: AOJu0Yzry2SHudx4xwjaOAwJsV0FlDFXj/V8VAGnqqjumuGcqkklWIXi
	vP5H8S1ekpfHRdwL3b352OpQhm4M7lRdCgvsT3oqI3T32/gqQvciiLK17RhgDvQ6rg==
X-Google-Smtp-Source: AGHT+IHdvqAxQIAkfS3GC2lfDB+NkFaAIzJsBH5urxZmxW8c5V97a+XQfVxrJPT1TqMTl4rzK3soxQ==
X-Received: by 2002:a05:6602:400a:b0:7eb:89ba:44fe with SMTP id ca18e2360f4ac-81ea5349eb4mr139924639f.17.1721682261029;
        Mon, 22 Jul 2024 14:04:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d23f325d1sm2636421b3a.25.2024.07.22.14.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:04:20 -0700 (PDT)
Message-ID: <07a4849e-aab4-4341-828b-ef4908da0ca9@linaro.org>
Date: Mon, 22 Jul 2024 14:04:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] util/fifo8: Fix style
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20240722160745.67904-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ivNKa+Ore2aJ

T24gNy8yMi8yNCAwOTowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9xZW11L2ZpZm84LmggfCAyMiArKysrKystLS0tLS0t
LS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2ZpZm84LmggYi9p
bmNsdWRlL3FlbXUvZmlmbzguaA0KPiBpbmRleCBjNjI5NWM2ZmYwLi4yNjkyZDZiZmRhIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3FlbXUvZmlmbzguaA0KPiArKysgYi9pbmNsdWRlL3Fl
bXUvZmlmbzguaA0KPiBAQCAtMTUsMTAgKzE1LDkgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAg
ICAqIEBmaWZvOiBzdHJ1Y3QgRmlmbzggdG8gaW5pdGlhbGlzZSB3aXRoIG5ldyBGSUZPDQo+
ICAgICogQGNhcGFjaXR5OiBjYXBhY2l0eSBvZiB0aGUgbmV3bHkgY3JlYXRlZCBGSUZPDQo+
ICAgICoNCj4gLSAqIENyZWF0ZSBhIEZJRk8gb2YgdGhlIHNwZWNpZmllZCBzaXplLiBDbGll
bnRzIHNob3VsZCBjYWxsIGZpZm84X2Rlc3Ryb3koKQ0KPiArICogQ3JlYXRlIGEgRklGTyBv
ZiB0aGUgc3BlY2lmaWVkIGNhcGFjaXR5LiBDbGllbnRzIHNob3VsZCBjYWxsIGZpZm84X2Rl
c3Ryb3koKQ0KPiAgICAqIHdoZW4gZmluaXNoZWQgdXNpbmcgdGhlIGZpZm8uIFRoZSBGSUZP
IGlzIGluaXRpYWxseSBlbXB0eS4NCj4gICAgKi8NCj4gLQ0KPiAgIHZvaWQgZmlmbzhfY3Jl
YXRlKEZpZm84ICpmaWZvLCB1aW50MzJfdCBjYXBhY2l0eSk7DQo+ICAgDQo+ICAgLyoqDQo+
IEBAIC0yNiw5ICsyNSw4IEBAIHZvaWQgZmlmbzhfY3JlYXRlKEZpZm84ICpmaWZvLCB1aW50
MzJfdCBjYXBhY2l0eSk7DQo+ICAgICogQGZpZm86IEZJRk8gdG8gY2xlYW51cA0KPiAgICAq
DQo+ICAgICogQ2xlYW51cCBhIEZJRk8gY3JlYXRlZCB3aXRoIGZpZm84X2NyZWF0ZSgpLiBG
cmVlcyBtZW1vcnkgY3JlYXRlZCBmb3IgRklGTw0KPiAtICAqc3RvcmFnZS4gVGhlIEZJRk8g
aXMgbm8gbG9uZ2VyIHVzYWJsZSBhZnRlciB0aGlzIGhhcyBiZWVuIGNhbGxlZC4NCj4gKyAq
IHN0b3JhZ2UuIFRoZSBGSUZPIGlzIG5vIGxvbmdlciB1c2FibGUgYWZ0ZXIgdGhpcyBoYXMg
YmVlbiBjYWxsZWQuDQo+ICAgICovDQo+IC0NCj4gICB2b2lkIGZpZm84X2Rlc3Ryb3koRmlm
bzggKmZpZm8pOw0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtMzksNyArMzcsNiBAQCB2b2lkIGZp
Zm84X2Rlc3Ryb3koRmlmbzggKmZpZm8pOw0KPiAgICAqIFB1c2ggYSBkYXRhIGJ5dGUgdG8g
dGhlIEZJRk8uIEJlaGF2aW91ciBpcyB1bmRlZmluZWQgaWYgdGhlIEZJRk8gaXMgZnVsbC4N
Cj4gICAgKiBDbGllbnRzIGFyZSByZXNwb25zaWJsZSBmb3IgY2hlY2tpbmcgZm9yIGZ1bGxu
ZXNzIHVzaW5nIGZpZm84X2lzX2Z1bGwoKS4NCj4gICAgKi8NCj4gLQ0KPiAgIHZvaWQgZmlm
bzhfcHVzaChGaWZvOCAqZmlmbywgdWludDhfdCBkYXRhKTsNCj4gICANCj4gICAvKioNCj4g
QEAgLTUyLDcgKzQ5LDYgQEAgdm9pZCBmaWZvOF9wdXNoKEZpZm84ICpmaWZvLCB1aW50OF90
IGRhdGEpOw0KPiAgICAqIENsaWVudHMgYXJlIHJlc3BvbnNpYmxlIGZvciBjaGVja2luZyB0
aGUgc3BhY2UgbGVmdCBpbiB0aGUgRklGTyB1c2luZw0KPiAgICAqIGZpZm84X251bV9mcmVl
KCkuDQo+ICAgICovDQo+IC0NCj4gICB2b2lkIGZpZm84X3B1c2hfYWxsKEZpZm84ICpmaWZv
LCBjb25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdCBudW0pOw0KPiAgIA0KPiAgIC8qKg0K
PiBAQCAtNjQsNyArNjAsNiBAQCB2b2lkIGZpZm84X3B1c2hfYWxsKEZpZm84ICpmaWZvLCBj
b25zdCB1aW50OF90ICpkYXRhLCB1aW50MzJfdCBudW0pOw0KPiAgICAqDQo+ICAgICogUmV0
dXJuczogVGhlIHBvcHBlZCBkYXRhIGJ5dGUuDQo+ICAgICovDQo+IC0NCj4gICB1aW50OF90
IGZpZm84X3BvcChGaWZvOCAqZmlmbyk7DQo+ICAgDQo+ICAgLyoqDQo+IEBAIC03Myw3ICs2
OCw3IEBAIHVpbnQ4X3QgZmlmbzhfcG9wKEZpZm84ICpmaWZvKTsNCj4gICAgKiBAbWF4OiBt
YXhpbXVtIG51bWJlciBvZiBieXRlcyB0byBwb3ANCj4gICAgKiBAbnVtcHRyOiBwb2ludGVy
IGZpbGxlZCB3aXRoIG51bWJlciBvZiBieXRlcyByZXR1cm5lZCAoY2FuIGJlIE5VTEwpDQo+
ICAgICoNCj4gLSAqIFBvcCBhIG51bWJlciBvZiBlbGVtZW50cyBmcm9tIHRoZSBGSUZPIHVw
IHRvIGEgbWF4aW11bSBvZiBtYXguIFRoZSBidWZmZXINCj4gKyAqIFBvcCBhIG51bWJlciBv
ZiBlbGVtZW50cyBmcm9tIHRoZSBGSUZPIHVwIHRvIGEgbWF4aW11bSBvZiBAbWF4LiBUaGUg
YnVmZmVyDQo+ICAgICogY29udGFpbmluZyB0aGUgcG9wcGVkIGRhdGEgaXMgcmV0dXJuZWQu
IFRoaXMgYnVmZmVyIHBvaW50cyBkaXJlY3RseSBpbnRvDQo+ICAgICogdGhlIEZJRk8gYmFj
a2luZyBzdG9yZSBhbmQgZGF0YSBpcyBpbnZhbGlkYXRlZCBvbmNlIGFueSBvZiB0aGUgZmlm
bzhfKiBBUElzDQo+ICAgICogYXJlIGNhbGxlZCBvbiB0aGUgRklGTy4NCj4gQEAgLTgyLDcg
Kzc3LDcgQEAgdWludDhfdCBmaWZvOF9wb3AoRmlmbzggKmZpZm8pOw0KPiAgICAqIGFyb3Vu
ZCBpbiB0aGUgcmluZyBidWZmZXI7IGluIHRoaXMgY2FzZSBvbmx5IGEgY29udGlndW91cyBw
YXJ0IG9mIHRoZSBkYXRhDQo+ICAgICogaXMgcmV0dXJuZWQuDQo+ICAgICoNCj4gLSAqIFRo
ZSBudW1iZXIgb2YgdmFsaWQgYnl0ZXMgcmV0dXJuZWQgaXMgcG9wdWxhdGVkIGluICpudW1w
dHI7IHdpbGwgYWx3YXlzDQo+ICsgKiBUaGUgbnVtYmVyIG9mIHZhbGlkIGJ5dGVzIHJldHVy
bmVkIGlzIHBvcHVsYXRlZCBpbiAqQG51bXB0cjsgd2lsbCBhbHdheXMNCj4gICAgKiByZXR1
cm4gYXQgbGVhc3QgMSBieXRlLiBtYXggbXVzdCBub3QgYmUgMCBvciBncmVhdGVyIHRoYW4g
dGhlIG51bWJlciBvZg0KPiAgICAqIGJ5dGVzIGluIHRoZSBGSUZPLg0KPiAgICAqDQo+IEBA
IC05OSw3ICs5NCw3IEBAIGNvbnN0IHVpbnQ4X3QgKmZpZm84X3BvcF9idWYoRmlmbzggKmZp
Zm8sIHVpbnQzMl90IG1heCwgdWludDMyX3QgKm51bXB0cik7DQo+ICAgICogQG1heDogbWF4
aW11bSBudW1iZXIgb2YgYnl0ZXMgdG8gcGVlaw0KPiAgICAqIEBudW1wdHI6IHBvaW50ZXIg
ZmlsbGVkIHdpdGggbnVtYmVyIG9mIGJ5dGVzIHJldHVybmVkIChjYW4gYmUgTlVMTCkNCj4g
ICAgKg0KPiAtICogUGVlayBpbnRvIGEgbnVtYmVyIG9mIGVsZW1lbnRzIGZyb20gdGhlIEZJ
Rk8gdXAgdG8gYSBtYXhpbXVtIG9mIG1heC4NCj4gKyAqIFBlZWsgaW50byBhIG51bWJlciBv
ZiBlbGVtZW50cyBmcm9tIHRoZSBGSUZPIHVwIHRvIGEgbWF4aW11bSBvZiBAbWF4Lg0KPiAg
ICAqIFRoZSBidWZmZXIgY29udGFpbmluZyB0aGUgZGF0YSBwZWVrZWQgaW50byBpcyByZXR1
cm5lZC4gVGhpcyBidWZmZXIgcG9pbnRzDQo+ICAgICogZGlyZWN0bHkgaW50byB0aGUgRklG
TyBiYWNraW5nIHN0b3JlLiBTaW5jZSBkYXRhIGlzIGludmFsaWRhdGVkIG9uY2UgYW55DQo+
ICAgICogb2YgdGhlIGZpZm84XyogQVBJcyBhcmUgY2FsbGVkIG9uIHRoZSBGSUZPLCBpdCBp
cyB0aGUgY2FsbGVyIHJlc3BvbnNpYmlsaXR5DQo+IEBAIC0xMDksNyArMTA0LDcgQEAgY29u
c3QgdWludDhfdCAqZmlmbzhfcG9wX2J1ZihGaWZvOCAqZmlmbywgdWludDMyX3QgbWF4LCB1
aW50MzJfdCAqbnVtcHRyKTsNCj4gICAgKiBhcm91bmQgaW4gdGhlIHJpbmcgYnVmZmVyOyBp
biB0aGlzIGNhc2Ugb25seSBhIGNvbnRpZ3VvdXMgcGFydCBvZiB0aGUgZGF0YQ0KPiAgICAq
IGlzIHJldHVybmVkLg0KPiAgICAqDQo+IC0gKiBUaGUgbnVtYmVyIG9mIHZhbGlkIGJ5dGVz
IHJldHVybmVkIGlzIHBvcHVsYXRlZCBpbiAqbnVtcHRyOyB3aWxsIGFsd2F5cw0KPiArICog
VGhlIG51bWJlciBvZiB2YWxpZCBieXRlcyByZXR1cm5lZCBpcyBwb3B1bGF0ZWQgaW4gKkBu
dW1wdHI7IHdpbGwgYWx3YXlzDQo+ICAgICogcmV0dXJuIGF0IGxlYXN0IDEgYnl0ZS4gbWF4
IG11c3Qgbm90IGJlIDAgb3IgZ3JlYXRlciB0aGFuIHRoZSBudW1iZXIgb2YNCj4gICAgKiBi
eXRlcyBpbiB0aGUgRklGTy4NCj4gICAgKg0KPiBAQCAtMTI2LDcgKzEyMSw2IEBAIGNvbnN0
IHVpbnQ4X3QgKmZpZm84X3BlZWtfYnVmKEZpZm84ICpmaWZvLCB1aW50MzJfdCBtYXgsIHVp
bnQzMl90ICpudW1wdHIpOw0KPiAgICAqDQo+ICAgICogUmVzZXQgYSBGSUZPLiBBbGwgZGF0
YSBpcyBkaXNjYXJkZWQgYW5kIHRoZSBGSUZPIGlzIGVtcHRpZWQuDQo+ICAgICovDQo+IC0N
Cj4gICB2b2lkIGZpZm84X3Jlc2V0KEZpZm84ICpmaWZvKTsNCj4gICANCj4gICAvKioNCj4g
QEAgLTEzNyw3ICsxMzEsNiBAQCB2b2lkIGZpZm84X3Jlc2V0KEZpZm84ICpmaWZvKTsNCj4g
ICAgKg0KPiAgICAqIFJldHVybnM6IFRydWUgaWYgdGhlIGZpZm8gaXMgZW1wdHksIGZhbHNl
IG90aGVyd2lzZS4NCj4gICAgKi8NCj4gLQ0KPiAgIGJvb2wgZmlmbzhfaXNfZW1wdHkoRmlm
bzggKmZpZm8pOw0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtMTQ4LDcgKzE0MSw2IEBAIGJvb2wg
ZmlmbzhfaXNfZW1wdHkoRmlmbzggKmZpZm8pOw0KPiAgICAqDQo+ICAgICogUmV0dXJuczog
VHJ1ZSBpZiB0aGUgZmlmbyBpcyBmdWxsLCBmYWxzZSBvdGhlcndpc2UuDQo+ICAgICovDQo+
IC0NCj4gICBib29sIGZpZm84X2lzX2Z1bGwoRmlmbzggKmZpZm8pOw0KPiAgIA0KPiAgIC8q
Kg0KPiBAQCAtMTU5LDcgKzE1MSw2IEBAIGJvb2wgZmlmbzhfaXNfZnVsbChGaWZvOCAqZmlm
byk7DQo+ICAgICoNCj4gICAgKiBSZXR1cm5zOiBOdW1iZXIgb2YgZnJlZSBieXRlcy4NCj4g
ICAgKi8NCj4gLQ0KPiAgIHVpbnQzMl90IGZpZm84X251bV9mcmVlKEZpZm84ICpmaWZvKTsN
Cj4gICANCj4gICAvKioNCj4gQEAgLTE3MCw3ICsxNjEsNiBAQCB1aW50MzJfdCBmaWZvOF9u
dW1fZnJlZShGaWZvOCAqZmlmbyk7DQo+ICAgICoNCj4gICAgKiBSZXR1cm5zOiBOdW1iZXIg
b2YgdXNlZCBieXRlcy4NCj4gICAgKi8NCj4gLQ0KPiAgIHVpbnQzMl90IGZpZm84X251bV91
c2VkKEZpZm84ICpmaWZvKTsNCj4gICANCj4gICBleHRlcm4gY29uc3QgVk1TdGF0ZURlc2Ny
aXB0aW9uIHZtc3RhdGVfZmlmbzg7DQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
