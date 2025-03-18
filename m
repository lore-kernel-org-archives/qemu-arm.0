Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3246681njb;
        Tue, 18 Mar 2025 15:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWG5uYvpBmmb5YzNbLLHceNz9nWxNixCuo5mUZ4CK/NX6jNMmZbNoOhdJTAfYUbdJWBBOtQv7NWGuVZvA==@linaro.org
X-Received: by 2002:a17:902:f550:b0:223:f7ec:f834 with SMTP id d9443c01a7336-22649a43b61mr4512475ad.31.1742336717795;
        Tue, 18 Mar 2025 15:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742336717; cv=none;
        d=google.com; s=arc-20240605;
        b=W8vW7R63NDm9pJcnD9j8qrGp9xvLIEjtFkBBDbYD8wOVz+/TSaS9AuKDAtqjEN1Fi+
         AH8ACGS6cjXUIvwT8+kTvuKaKVlEwL2yY3uK72+1IcxBtA2yg3n6BLMmEgI45eCUDvnz
         0zrD5De2yOoyvtOkJU1GqlhpPBQ5Zm1iwmrqP7EmsgfTudoEDtYPi5fgUQNPn3VGNz7J
         u4IyjarGILZuBHwm4dJ39GRvdZL1IO6DtFnYUogJhSx7FsruvMBzWY7sQJaLV5ub/pyA
         yXQlXK0P8vKx3Z6DoTEqBuvTk9HgUh50dRUoB2SReAZ7t69WrfLmIaZX9kE+7xGVayUa
         3UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+OZcSxEjvy5barsrM9YzuoeAs1gtQHABtK6IPFv4fFE=;
        fh=x2V24sc3cKE4T3YUbIJ5fwWuFAeiQf+du2zfH777UBM=;
        b=b25Yh3rFJQ2D2jQ5R8lQ3EhhYYUoAOMuKtdOkKOaIW1rIJEp5aSTxhAPKAveOpHQA5
         8nnmAwxPXhKZkAkfPHE9Dyg+StYXzQ/HwoDz8vAG4UmRDVtn0X3SBx6ggb8jAb0TSRUy
         IrJ72bH46jXNjTBBNkmwfjaTmeVEGOWiX+SEvT2stg71bibsghxtqqYU/mv0cuuMzCHF
         H0e+s9pUEe8Kd9n6kMVF2oGO+ADy1pk2a232BAB1eua1RS16AJQpD/4zu8JgJdAIBLWp
         pqvVX7scgfyaMIjUmcm6sX1OHDhIhwBTUlBWoVz58PtND6Y6MJ4jI4QwlY5Zs7f0HndO
         8QkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kP5sN1j2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-225c6b485a9sor96966245ad.2.2025.03.18.15.25.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kP5sN1j2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742336717; x=1742941517; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OZcSxEjvy5barsrM9YzuoeAs1gtQHABtK6IPFv4fFE=;
        b=kP5sN1j2SWynlYA2UHISc1x3HYkijZkRNWhUmMlJGYcuUZ5dzuR+a2R5WQ9DQhKATY
         VzXPAp7OSMhxR3FVr0M7E26fyIn5TWfUcSIribIIo+SmIm5ctZQegTqf2QjWxvZyQB5m
         lpWGo9uHHpzN2DQfKmD2Icnn7OXYXksw7cbshhLJ9yRCUNQoLFTKg9lGgI6wt+WLtkHV
         RwpO6+JVJcwa7B6mNVlW34YbXV3Y2tHYBvMeOPIJf3AyCcb0KC80Ys+XZmhv6gAfqaY8
         iN9ueIOY9lw2gBBHpgGcfx/k9FIgZRmD3wE4nOUKjXwHU1YMY+tvk7Y7cVStRlxWDFE3
         jmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336717; x=1742941517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OZcSxEjvy5barsrM9YzuoeAs1gtQHABtK6IPFv4fFE=;
        b=sii9nNMhF7ssTEOrTWJdH2ZXdsztHmVzJ7XZ1IE/uKOgjz02FqOpxoc36U2VgefNHl
         k82lvudNfUFeUbwoCVwu7oGMNYqmgCdQsbeagItP5Lzj2Omsuf+7I9JunviYdYfXVy2A
         X8pKcFNphiHvSVVWxF5mRS4f7FNIO6tNiL00Y4ULPL+Zg2ib4XF3ZZ2d7YgUO90VNy4y
         Cibd4+/D6Q2nJc8iTRluJzIrfSXEp03mQVGiQrq3qjXh4IXRoRa1aa4D9OPPnGFsOXVL
         iu1N1cfi2M7dtsgxAHQo2pXdBeW9E4xx2Qn1ksSnM/bx4EWicvKDt9iOJKrfCJXEH1z/
         rS2w==
X-Forwarded-Encrypted: i=1; AJvYcCXiuBLiTtbIeOwCsowLQXoQpnw5uqqT4EkHp/3nJIhcxNTi3wbBpY90768neqZ43rkRrO22Y+Mb1xpaCw==@linaro.org
X-Gm-Message-State: AOJu0Yy0WtH4apdmO+3i6DX1Vmm/INBlgTW3g7QgJ0d5OuyG7t+JqtbO
	4E4L1QqFzHFVRcJmTjzZEfPk6AJWZ1iUK+6L9dE05qVDC119K4J8NUyks2MTh/16Yg==
X-Gm-Gg: ASbGncss6ym/6VixIZGHOMYYPpeJMf/FWaR9BGpQ9CByBgm2wKBwfYG0WH+2vZVETHX
	6H3KgR9unNqov+dDBY/jCHXSFLqhc7lbZpibjAzdukEkVq0SDO4KcaBi6SRTMaERMlXT/1Gqog5
	NvlH8s64vP6MWWSbr53wM/mmz3Dfiy/RKhMwusAdoyyoSEW9mWgOUfC5+8AaVxgyMb2/VfumM2C
	YKp6jMhuT4Hu7nyQ/m22GjyvbzcfRuIayLCMEqEsRNd6aN0Mngn1TgdqpY55kBCfzUDQS9GWuAQ
	+Oe4r+1xjPSFPmJazTEnkby4KraQb9eNVLuoxSxkM0cepYP+urKVO6ma8g==
X-Google-Smtp-Source: AGHT+IGmH0IikLDiUP1B2sJeJzQbJRgDAITprzk8AgiG9cM4xJ5TN/4hReGgOfBC1vsSdDXqD1UKow==
X-Received: by 2002:a17:90b:3ccc:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-301bde62101mr577697a91.13.1742336717408;
        Tue, 18 Mar 2025 15:25:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5cddd6sm21699a91.41.2025.03.18.15.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:25:17 -0700 (PDT)
Message-ID: <172a10d0-f479-4d6c-9555-a9060bdf744e@linaro.org>
Date: Tue, 18 Mar 2025 15:25:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
 <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
 <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
 <0c6f23d5-d220-4fa7-957e-8721f1aa732f@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <0c6f23d5-d220-4fa7-957e-8721f1aa732f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ZTlzKD3laCsh

T24gMy8xOC8yNSAxNToyMSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMTgv
MjUgMTU6MTYsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4gVGhpcyBkb2Vzbid0IG1h
a2UgYW55IHNlbnNlIHRvIG1lLsKgIENQVV9JTkNMVURFIGlzIGRlZmluZWQgd2l0aGluIHRo
ZSB2ZXJ5IGZpbGUgdGhhdA0KPj4+IHlvdSdyZSB0cnlpbmcgdG8gaW5jbHVkZSBieSBhdm9p
ZGluZyAiY3B1LmgiLg0KPj4+DQo+Pg0KPj4gRXZlcnkgdGFyZ2V0L1gvY3B1LmggaW5jbHVk
ZXMgY3B1LWFsbC5oLCB3aGljaCBpbmNsdWRlcyAiY3B1LmgiIGl0c2VsZiwgcmVseWluZyBv
biBwZXINCj4+IHRhcmdldCBpbmNsdWRlIHBhdGggc2V0IGJ5IGJ1aWxkIHN5c3RlbS4NCj4g
DQo+IFNvLCBhbm90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGZpeCB0aGUgc2lsbHkgaW5j
bHVkZSBsb29wPw0KPg0KDQpJZiB5b3UncmUgb2sgd2l0aCBpdCwgSSdtIHdpbGxpbmcgdG8g
cmVtb3ZlIGNwdS1hbGwuaCBjb21wbGV0ZWx5IChtb3ZpbmcgDQp0bGIgZmxhZ3MgYml0cyBp
biBhIG5ldyBoZWFkZXIpLCBhbmQgZml4aW5nIG1pc3NpbmcgaW5jbHVkZXMgZXZlcnl3aGVy
ZS4NCg0KSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgaXQncyBhbiBhY2NlcHRhYmxlIHBh
dGggYmVmb3JlIHNwZW5kaW5nIHRvbyANCm11Y2ggdGltZSBvbiBpdC4NCg0KPiANCj4gcn4N
Cg0K
