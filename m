Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2142443njc;
        Mon, 22 Jul 2024 14:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdg06Ss/4oGqWbkqP5V4cPLOi/h3BI6dXMoEV20EsYggoGz/dL5fwR1hwqsdfm+UMuKFAy2MdHte6KlA0ffZgvH+4x78hY
X-Received: by 2002:aa7:8888:0:b0:705:b6d3:4f15 with SMTP id d2e1a72fcca58-70d0f0d8a6cmr8868154b3a.25.1721682413583;
        Mon, 22 Jul 2024 14:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682413; cv=none;
        d=google.com; s=arc-20160816;
        b=TSVuVzRer+Tq/Lk7Vu/A+O+i4/IhO5G5ovb9S9aXs5RVCg300RHs80SkvwEaI3z/eb
         3HHhhxIg0pRv/ZCb4a5CekNNfz6TpcDgF1LNkohvbPJsW7+g3/mfSsXJKrILHOWGL0H2
         NeMwbUgsaJbL3NkF2N7AlF1U7j2DmPTdgdzduLDHo/3PR9ZpDsmvkVZpXkw6tQpB2zLN
         4TFuD/gBpj8hXxRfDlrXxxppHn25zm40incyDTsQ/FytEdXoqLcYuGU7MwmW9EmzhQKz
         SrAE+gujVNRJJvQYsW+0WGphjIzRlde46aTmsunC1QFMFW36YsgH77JQSrZvzjuAWvVH
         AW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NHheaBbdivCBNrjkMc5BpEzF1l75/EsEBipNIOMuwxk=;
        fh=ybKYp8PxKAJV3XHcNWqC/PeXVkymVvQOf2aUIVpb2eE=;
        b=R0PLrcn8A1JepRG1HkzV+sHbkY7++LFm3dwmHp6e9zQGR13KFUZ3gtCi0aSJwa+w2f
         oYgVel3CE9EuF1NW6dabIT5rxYlB/PMYNBa7TGXkW1SLZ6gnhSpfUQLQ/s7ae40alvSK
         Beet3dLP2AOPuw6ovV1jmw2C9tm0E03mWbeLxC43wiVwC2FGDicgPBirXsl16O6fI6CZ
         b121XIUqEU7hN7HYXYb3EWjVlhT53RQfJ6G59NJks7MnCS/l9o/NGK+fO2M4mPIrVnMD
         z5cJoCyz7x+AbnRlHS5t/1SRlZ/CMU1F9gcGSW0DXVnGU8Km2L7pjwlII1JNXKibXkiq
         LAOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bD0wC4PR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70d11588e7fsor3135287b3a.8.2024.07.22.14.06.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bD0wC4PR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682413; x=1722287213; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHheaBbdivCBNrjkMc5BpEzF1l75/EsEBipNIOMuwxk=;
        b=bD0wC4PR0y2dzPgyuM+vNnMnbORxft73eIEsKHsNmeNoPGx3OP3o1tG6KR1sEce+4k
         Kn24aR3lAwcDHILCQUbgdzrtHVvh/G92NltRFb/brS8AP49ITrPNAgIrAVBRVniUqiwu
         hZTJxx9VLq+OH4UkJzOz8F0MFnn6NVc1Lb/3Dy+5t4x1Cl/E63/DGHz4DzUuOH54xPu+
         gg6axCjXwvLfkHCZYcf1z+aWgRijLda4uxSdQPrsYRd10S+NEVojdWsHfqDLSTxlGpq3
         4ZZ1/PlSOQwC/dxgLasxU3RuHp+6yX0dVVRKdk9a9FQSHSvddgcNEQ3dfWkXaKVUWGeO
         5Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682413; x=1722287213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHheaBbdivCBNrjkMc5BpEzF1l75/EsEBipNIOMuwxk=;
        b=VOV/QnU0LkJI4QO0EkjqVgvuQZfanmpXyaxcHBc6zp6fuuk6O9r/Ygy+AZkfdq+Qmw
         yFDAzfWIJeaIrm9UiD+joQrCtHDbM7azWlpWIMb7XuNsg2E7nmMt2Box/6dSRDB9/YTQ
         AF5yNz9JDJqCZB+wmvzipYKyBv+YZOrNaz5SLEWRjo1tSnwAcIqJ1WcpRYrMM1O6TJtn
         bfqXsdN3L7OBTkjoULPdvB/RCChK9MCMmgEcoOCle4TtNXGdDF4Y6JYTS962doHOLXQ3
         nbYcLn/cD//qxEkkQVviNOkEkmNIX7/xchC6tmowwZ4ngTHkzgn2IzpW9DrRHRZZqucB
         Ic9g==
X-Forwarded-Encrypted: i=1; AJvYcCXZlaKebcFpoDtMOOxtQDqi3y5lCJ2BdubUxblWPSyjgy9J2LbJYPnAPxpKLHRyx3SnFNce3jOB6yBpXzRaJG3ILmGny33y
X-Gm-Message-State: AOJu0YzuXa6PwBWDQiTJb2HYtgmFwKZJf6QueGNTu0jQj7iJ7lH2MmWg
	3l9PrL9wCC4QDXfO5R4B8qgX85cvxQVN4LjQUNTbn1CXsrjJJTxq1YDht8Lbji+2MQ==
X-Google-Smtp-Source: AGHT+IEIAl516jCeCNyPrk9/Fwk3RRpe479rs2ph73c4Hbr0+of3olrH1gi7fmbAAOY1sxWyfAECyw==
X-Received: by 2002:a05:6a20:a11f:b0:1c0:e1bf:4c23 with SMTP id adf61e73a8af0-1c4285d4640mr11228334637.20.1721682413175;
        Mon, 22 Jul 2024 14:06:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7c57a58sm7594707a91.23.2024.07.22.14.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:06:52 -0700 (PDT)
Message-ID: <c0eb2331-4242-4058-be43-ddded418eb2d@linaro.org>
Date: Mon, 22 Jul 2024 14:06:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] chardev/char-fe: Document returned value on error
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240722160745.67904-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 6N4W0etp3/L7

T24gNy8yMi8yNCAwOTowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IHFl
bXVfY2hyX2ZlX2FkZF93YXRjaCgpIGFuZCBxZW11X2Nocl9mZV93cml0ZVtfYWxsXSgpDQo+
IHJldHVybiAtMSBvbiBlcnJvci4gTWVudGlvbiBpdCBpbiB0aGUgZG9jdW1lbnRhdGlvbi4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
bGluYXJvLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IE1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2
ZS1heWxhbmRAaWxhbmRlLmNvLnVrPg0KPiAtLS0NCj4gICBpbmNsdWRlL2NoYXJkZXYvY2hh
ci1mZS5oIHwgMyArKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9jaGFyZGV2L2NoYXItZmUuaCBiL2luY2x1ZGUv
Y2hhcmRldi9jaGFyLWZlLmgNCj4gaW5kZXggZWNlZjE4MjgzNS4uMzMxMDQ0OWVhZiAxMDA2
NDQNCj4gLS0tIGEvaW5jbHVkZS9jaGFyZGV2L2NoYXItZmUuaA0KPiArKysgYi9pbmNsdWRl
L2NoYXJkZXYvY2hhci1mZS5oDQo+IEBAIC0yMjgsNiArMjI4LDcgQEAgZ3VpbnQgcWVtdV9j
aHJfZmVfYWRkX3dhdGNoKENoYXJCYWNrZW5kICpiZSwgR0lPQ29uZGl0aW9uIGNvbmQsDQo+
ICAgICogaXMgdGhyZWFkLXNhZmUuDQo+ICAgICoNCj4gICAgKiBSZXR1cm5zOiB0aGUgbnVt
YmVyIG9mIGJ5dGVzIGNvbnN1bWVkICgwIGlmIG5vIGFzc29jaWF0ZWQgQ2hhcmRldikNCj4g
KyAqICAgICAgICAgIG9yIC0xIG9uIGVycm9yLg0KPiAgICAqLw0KPiAgIGludCBxZW11X2No
cl9mZV93cml0ZShDaGFyQmFja2VuZCAqYmUsIGNvbnN0IHVpbnQ4X3QgKmJ1ZiwgaW50IGxl
bik7DQo+ICAgDQo+IEBAIC0yNDIsNiArMjQzLDcgQEAgaW50IHFlbXVfY2hyX2ZlX3dyaXRl
KENoYXJCYWNrZW5kICpiZSwgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKTsNCj4gICAg
KiBhdHRlbXB0ZWQgdG8gYmUgd3JpdHRlbi4gIFRoaXMgZnVuY3Rpb24gaXMgdGhyZWFkLXNh
ZmUuDQo+ICAgICoNCj4gICAgKiBSZXR1cm5zOiB0aGUgbnVtYmVyIG9mIGJ5dGVzIGNvbnN1
bWVkICgwIGlmIG5vIGFzc29jaWF0ZWQgQ2hhcmRldikNCj4gKyAqICAgICAgICAgIG9yIC0x
IG9uIGVycm9yLg0KPiAgICAqLw0KPiAgIGludCBxZW11X2Nocl9mZV93cml0ZV9hbGwoQ2hh
ckJhY2tlbmQgKmJlLCBjb25zdCB1aW50OF90ICpidWYsIGludCBsZW4pOw0KPiAgIA0KPiBA
QCAtMjUzLDYgKzI1NSw3IEBAIGludCBxZW11X2Nocl9mZV93cml0ZV9hbGwoQ2hhckJhY2tl
bmQgKmJlLCBjb25zdCB1aW50OF90ICpidWYsIGludCBsZW4pOw0KPiAgICAqIFJlYWQgZGF0
YSB0byBhIGJ1ZmZlciBmcm9tIHRoZSBiYWNrIGVuZC4NCj4gICAgKg0KPiAgICAqIFJldHVy
bnM6IHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVhZCAoMCBpZiBubyBhc3NvY2lhdGVkIENoYXJk
ZXYpDQo+ICsgKiAgICAgICAgICBvciAtMSBvbiBlcnJvci4NCj4gICAgKi8NCj4gICBpbnQg
cWVtdV9jaHJfZmVfcmVhZF9hbGwoQ2hhckJhY2tlbmQgKmJlLCB1aW50OF90ICpidWYsIGlu
dCBsZW4pOw0KPiAgIA0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJp
Y2suYm91dmllckBsaW5hcm8ub3JnPg0K
