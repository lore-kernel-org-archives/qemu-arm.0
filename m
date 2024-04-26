Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp632307ejb;
        Fri, 26 Apr 2024 12:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMiLovIUn/6DT/vPavNWby7Ai1DutqBPCUvGgDni57lmU8nQExDoh5joqWN+ka3aSM3fm9AY7dgMw6rZZeAZPCEHt5WPbl
X-Received: by 2002:a17:90b:46c5:b0:2b0:9544:59e7 with SMTP id jx5-20020a17090b46c500b002b0954459e7mr776105pjb.23.1714160055746;
        Fri, 26 Apr 2024 12:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160055; cv=none;
        d=google.com; s=arc-20160816;
        b=mWf9McvhTVunq2tb/c4TLYdQTcd/rRsbbfuPtGvJKb9NRBx701OAUwfbryMQUXsvUo
         1pVUFKEBegs5HJxfB2f/OWEuOOUktsP5lMV4X+c4xS27Cs3pXE1s1/g4SUnvzFInif5V
         hcbsjH/ELxQjoPxbXEBx/4i+eeTtY46tttc3GcNcAoXujCJ1/Fb/qnvVICY6Jak4GCwj
         hNOvw4TOkrDH9NNFDgE/npnc/VvC5eaEFpHQpUtfbE7VU8h+L9UXMBr/gu9Pk2uNWx/t
         giB7bMjmrpEJaqX06GgfPnTNmGwqgPVUXQ925dGS4UD5fM+dGUfwG2DxY27gPT4szwd1
         LMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=m+Ylf8YtrrHtw/DdiVzN8IRtPB4Fe4ozL1NRbrzq8l4=;
        fh=FhhECMZvteV9ZEwzjpcNFnHIR4EmXLEtrVDjib9LJ24=;
        b=eIX+vAchUa1ETJLWdrSW3Ex98mKq5ymK42nJPd4wov5AHbCc79n0OtutU0XPoJ8JSZ
         8FiYjv/LjQtNiZAZa+cpIy4nDq6koqrVe+xNoUBCyO90tO2qsgi4ilBICG+QCgjYlfEP
         IrggXPxNrTWHqlOFNOdHO4hQl+Y2r+RfYYO5OJu+NOs42afy6wQHfYyxQ+BIAGO+O0pB
         2ihNtjNXbc4G8czC2j7Zqo+V0SbpSs7xXVHWgVG9YC6vKMAKsDXUZMi+q0E1MjdTdpiC
         S80E1WfmHfMMPgHn5euc+4zzd0tm3YywF28+uCAAP/nETX9F/ebAQUaR0+9a4MWBn7zr
         8MtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWAemfn6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x15-20020a17090a788f00b002a27943cf4fsor16037023pjk.0.2024.04.26.12.34.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SWAemfn6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160055; x=1714764855; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m+Ylf8YtrrHtw/DdiVzN8IRtPB4Fe4ozL1NRbrzq8l4=;
        b=SWAemfn6wUXMe0WHKFx4LnwDpABzXaBcPeVZHIlzu+B3VSEvK7+h/OfhNHPrLe8svI
         vAWETaXuMShs2/a/VdsuH0+t49pyK2YRQkJIFXUj4SdtzhBN0o7u+zcRqROsIDiWk7iv
         TWJI3exxWxUoI7FaAngrnguPVkrEoqboGK2dcmtRX3Cd24d1ObEVijO1uAPhtqfFCUIz
         0dUC5ClwN6jVvrirjOJZTHlZRkJ8a7mM1vqjpPvluZBXJTKVs3Mn9wPKrh/VmPR9x3o/
         2obZOdSIMgj1m9Ow5EKkkcjUsN/ujsU/wq35xrfMVhOVoNFPO30xE67ogd1FC+zDsyf/
         TdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160055; x=1714764855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+Ylf8YtrrHtw/DdiVzN8IRtPB4Fe4ozL1NRbrzq8l4=;
        b=TBLyMX9NcBbIfMqttyVQ4Wr8Xx5cW7Ai+mgwF+Bk/bNSkMJDkttPOeE5CY15mzIKLx
         OQOeZdmy5Xb4l01yksnSOCkCDb+Qu4rpVWxN1A/OPEAaTfvBFrFDiEbSJ4G9ZhF0HXKM
         so/Iq7q8iZSqKyhCua7hVQcc6/0LVje8DRo5FVGoysWjroghF1tnX+SWzEaLHajDW0jc
         ysQmECENyJakheYD+ZNgiviXJEHPSxxX0UpQZM5vQLYtbr0GYqtz6BO3ArRGMKotLe33
         5z/qwE34WsQgzTV0F9T4WzG7LYdlQzF2NwCsb/dS3vsBRja3QS0iPTBD4+t6/2t0d07F
         Z6yw==
X-Forwarded-Encrypted: i=1; AJvYcCWULK+PAOMuegsbO7gk78MA33vN72KVoBNlajPPKGV0nX4Tqzlhhdtbf0GE0MKUO4lj65vSqCQgxHzxTp6+G5qLdns4KBg6
X-Gm-Message-State: AOJu0Yy/MIsQTce9zJJaOOJgizgEG7ZNz8VVCpNPUEX9rrJlNaWdK4Pu
	T3sjNliuU3lunid+mUj/pXFblWaN3EYQDu4Pq+Np0tN8UXM+GOrgA8M82iAUPVOHXQ==
X-Google-Smtp-Source: AGHT+IEeTVMIF4CQktUYMKbZ446pl1MS5mi6qVDru/JGYGVK2QrZIOnaDhzXbOAdfjdHnan3iUGU3Q==
X-Received: by 2002:a17:90a:3d4e:b0:2a2:faf4:71da with SMTP id o14-20020a17090a3d4e00b002a2faf471damr852171pjf.10.1714160055121;
        Fri, 26 Apr 2024 12:34:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:937d:c610::abdb? ([2604:3d08:937d:c610::abdb])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm14900680pjq.2.2024.04.26.12.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 12:34:14 -0700 (PDT)
Message-ID: <6a4c2b81-ffea-437c-aa96-d96d009f3a1c@linaro.org>
Date: Fri, 26 Apr 2024 12:34:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] plugins: Include missing 'qemu/bitmap.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-19-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240418192525.97451-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: jFRpDUIPk0S1

T24gNC8xOC8yNCAxMjoyNSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ICJx
ZW11L3BsdWdpbi5oIiB1c2VzIERFQ0xBUkVfQklUTUFQKCksIHdoaWNoIGlzDQo+IGRlY2xh
cmVkIGluICJxZW11L2JpdG1hcC5oIi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVk
ZS9xZW11L3BsdWdpbi5oIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L3BsdWdpbi5oIGIvaW5jbHVk
ZS9xZW11L3BsdWdpbi5oDQo+IGluZGV4IDEyYTk2Y2VhMmEuLjQxZGI3NDhlZGEgMTAwNjQ0
DQo+IC0tLSBhL2luY2x1ZGUvcWVtdS9wbHVnaW4uaA0KPiArKysgYi9pbmNsdWRlL3FlbXUv
cGx1Z2luLmgNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gICAjaW5jbHVkZSAicWVtdS9xdWV1
ZS5oIg0KPiAgICNpbmNsdWRlICJxZW11L29wdGlvbi5oIg0KPiAgICNpbmNsdWRlICJxZW11
L3BsdWdpbi1ldmVudC5oIg0KPiArI2luY2x1ZGUgInFlbXUvYml0bWFwLmgiDQo+ICAgI2lu
Y2x1ZGUgImV4ZWMvbWVtb3BpZHguaCINCj4gICAjaW5jbHVkZSAiaHcvY29yZS9jcHUuaCIN
Cj4gICANCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZp
ZXJAbGluYXJvLm9yZz4NCg==
