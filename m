Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89577njc;
        Wed, 13 Nov 2024 20:12:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTSlz3gXUD0Wux+RM7fkMjQlUGXzvm7gU+GxfcQ74gTvN6guWQdkKyD2E763MfcksfZTW0hV5BX5N9Nw==@linaro.org
X-Received: by 2002:a05:6a00:806:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-72469e2f06emr949314b3a.22.1731557522097;
        Wed, 13 Nov 2024 20:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557522; cv=none;
        d=google.com; s=arc-20240605;
        b=I3cZXW+rMCBsOPnFWNleHD+Wn1anK/Zf7e0fANIKxBY4vrmpQh6aRcGn1UicBS8Gfc
         m1/mQnsO734u18O+8Jtu+PSfCf+vMH+ZKT0BXHVywA/c6ocmfQCQEojzENfSdr8agtKM
         +w8uy1DcJ8XoG5N9QLQyB0fahXtpBaaBhgr7JdnWyJ9W1go+kFGV79dZHPjCbhkzovSp
         sIYngHN6pwuGsfQ+WXS/rWCBckiAmpajTKKX6Q9eWNxXqzbZGNV8Y65HuckZouYzuc4E
         E63x3DG1UQ5a1P8/gx+2aJdu6fvTzPpenSqWCZIWXh1cGDvOsbU4gBwwL/A6JMtyO1Ea
         jtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U5xowOW/X8LNaHsNkXGFai5iT0WOJ2YHn8n6ZWYO4SI=;
        fh=HLAMo6xXycr0qWyg9zQeOTU/poDY3O2jLarePkONJq0=;
        b=TZmacR3+2UVMav8BQCezeZmNEAI25h07tNcKengA9fhfYtyDx/n2evKOMlUN6fkdNP
         1AfX0VqsVhcBTzhAnPwwcUt6asbL0hLaio/V7Ymz4cP46NCUIB8pZsOq66C28k9dfl69
         M8jyXso3Qv8EXvB0ud4pNif2Si6T3XnhACy+iJeMaPqixgQE50mGKWIfuzDtAysufchM
         0qUbEdjVMFDsyFZvEx6RzXD1gNhiIEpbbo3OWsAuaTbYO1gt1XWViwp5I82ATNTt/2rk
         SCG5SvQy2bFouR2aZaIpIhXNjjb+ItVzAQs+9Ql+CEArpi2ph38uklQ2P2ZOigU/w4g3
         v1/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="am7/ZgQB";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a9b2baesor245055b3a.8.2024.11.13.20.12.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:12:02 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="am7/ZgQB";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557521; x=1732162321; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5xowOW/X8LNaHsNkXGFai5iT0WOJ2YHn8n6ZWYO4SI=;
        b=am7/ZgQBc/aeW0esgUdcaKUbOC0NLwe8cSHzkHfmrH8fmclH//0AI0uBWyiVvIjT6t
         BXHCKcuBxSkc0Uqrn57U1/lo7OwOVeEnL58uI3FHOI4DmA2PdqKnOJJyn7DwkaTsMg7r
         BXkD1abUHSZXBCMSmsajRmvAR9K7UkylGyjWPyGVY4/wH6lOxNHrMjQZbea5NynZyCVS
         m8QZmSOsYEODO3Nki3xZF4ZuxH1L8unTB46SvPSmPcTedO78HgBgZEl0K1GPLmR1gK5M
         3ZsytpjcE4TLXDl+lc1flsRGeSKigtLFyhFHA45cOLvHwWHGoMYIds/EeDKRZW315HbZ
         wCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557521; x=1732162321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5xowOW/X8LNaHsNkXGFai5iT0WOJ2YHn8n6ZWYO4SI=;
        b=rqhR6SFzCUE7zJxm4TgdXqh8hzc1IM+U74HGdUcl/NlWWZfGeFnDFhkUYlxgxGHAHA
         m1uUd5XdKTUzCQ5TkRDUjMABiZthDg7Nbxo3luMLoWeCXkk0X0x2tKZ9Rp8BkVDTPkAa
         onx1xqR0CjkNygDfYgYlIHB/jB0D8kxBzANwVqZIvGkKwrUfsHA9oL8ba4wCBfFXCD9v
         JTzfYI7Oj1/dhgmaxuZEGGs5gZf0vf39MbQEfRXqo+wmxsoVBXvcQPBHe/vYX0o2gfhS
         ElI6waR405JpFIA/5AX44O/8lqlpXr65yIL6X8p+sR8bHCcmKxw2qQYbkLAs3uUKTYl/
         WuwA==
X-Forwarded-Encrypted: i=1; AJvYcCXCJ5I4V6Hyn4SpHn/sTJ0kltbqVWUcy5ZXlnabJuvIh4srNIxcAnGXA70XFvNJ+6ff7c+QIPJAlLtg9A==@linaro.org
X-Gm-Message-State: AOJu0YzLgCLQXUXSbcISPSFhE+E3Z2/skVLI6Cwzgndl6EufLC9FRtn7
	xTSrWLzhD3UN/UP8C+t1ACz0CRpxln7F7JVY4VKwsqVspvW8JiAU1l+glZN73zvrcg==
X-Google-Smtp-Source: AGHT+IG8SZRgP/EqiaNul+1oi2KZ+tQq8GWE3GmpdNTshl4psHJlLk7JxkkvTo0saA9tFsyYSc2J6g==
X-Received: by 2002:a05:6a00:b89:b0:71e:6eb:786e with SMTP id d2e1a72fcca58-72469cf6b3bmr908232b3a.13.1731557521577;
        Wed, 13 Nov 2024 20:12:01 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a813d1dsm244950b3a.90.2024.11.13.20.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:12:01 -0800 (PST)
Message-ID: <976fdded-4ca7-4557-80d2-3fe4c54206d5@linaro.org>
Date: Wed, 13 Nov 2024 20:12:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] target/arm/cpu: Restrict cpu_untagged_addr() to
 user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-11-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Q1LmSU2v/DpI

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gTW92ZSB0aGUgI2VuZGlmIGd1YXJkIHdoZXJlIGl0IGJlbG9uZ3MgdG8gcmVzdHJpY3QN
Cj4gdGhlIGNwdV91bnRhZ2dlZF9hZGRyKCkgaW1wbGVtZW50YXRpb24gdG8gdXNlcg0KPiBl
bXVsYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIHRhcmdldC9hcm0vY3B1LmggfCA1
ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NwdS5oIGIvdGFyZ2V0L2Fy
bS9jcHUuaA0KPiBpbmRleCBkODZlNjQxMjgwLi4xMmI4NDY2NTQyIDEwMDY0NA0KPiAtLS0g
YS90YXJnZXQvYXJtL2NwdS5oDQo+ICsrKyBiL3RhcmdldC9hcm0vY3B1LmgNCj4gQEAgLTMz
NTUsOCArMzM1NSw4IEBAIGV4dGVybiBjb25zdCB1aW50NjRfdCBwcmVkX2Vzel9tYXNrc1s1
XTsNCj4gICAjZGVmaW5lIFRBR19HUkFOVUxFICAgICAgKDEgPDwgTE9HMl9UQUdfR1JBTlVM
RSkNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1VTRVJfT05MWQ0KPiArDQo+ICAgI2RlZmlu
ZSBUQVJHRVRfUEFHRV9EQVRBX1NJWkUgKFRBUkdFVF9QQUdFX1NJWkUgPj4gKExPRzJfVEFH
X0dSQU5VTEUgKyAxKSkNCj4gLSNlbmRpZg0KPiAgIA0KPiAgICNpZmRlZiBUQVJHRVRfVEFH
R0VEX0FERFJFU1NFUw0KPiAgIC8qKg0KPiBAQCAtMzM4Miw2ICszMzgyLDcgQEAgc3RhdGlj
IGlubGluZSB0YXJnZXRfdWxvbmcgY3B1X3VudGFnZ2VkX2FkZHIoQ1BVU3RhdGUgKmNzLCB0
YXJnZXRfdWxvbmcgeCkNCj4gICAgICAgfQ0KPiAgICAgICByZXR1cm4geDsNCj4gICB9DQo+
IC0jZW5kaWYNCj4gKyNlbmRpZiAvKiBUQVJHRVRfVEFHR0VEX0FERFJFU1NFUyAqLw0KPiAr
I2VuZGlmIC8qIENPTkZJR19VU0VSX09OTFkgKi8NCj4gICANCj4gICAjZW5kaWYNCg0KUmV2
aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCg0K
