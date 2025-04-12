Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1118879njc;
        Sat, 12 Apr 2025 10:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9tC6/ZR5vfcUfp7gAooC7MwrYQJM+p0wK3QZUHE2kRVwbrJQl/6Ink0jXmbUlgHKd9EwEA8Oa3x01nA==@linaro.org
X-Received: by 2002:a17:902:ef0b:b0:21f:8453:7484 with SMTP id d9443c01a7336-22bea4c76cdmr99901735ad.30.1744477908053;
        Sat, 12 Apr 2025 10:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744477908; cv=none;
        d=google.com; s=arc-20240605;
        b=C/4LsjAXWYM8us1zwZCK4hNJLYFvi2eoWBDv+txUKyctPg2JKWkhBBdnyepgVyvC8l
         7ZfsvXBBGzznxVCtmhXZN5Qk9gY6vPZN2iZqcOkQUliu6QxF1H8zpWLCwi9Iim6xjJxL
         Ujw6I3b6JvOlRLcRKF1h65hG8L6WuPDypNM5+yMe37t5S9CyahJ7q8I0sSbI0dIDPtJ0
         RR2Gfw1UpJWQIMvO+B8qqJ/LV0X21TcWZPiEc5pbgJPYMvFldN1iaxtvh7YTJ8RCm7IO
         hQQhOiyonm5zWzpOavz4hqMVL0mEAGV52IboeW8N6wATcTfBiDGWCEXhFr3MfSutxmVT
         5WWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9lif+I060r52wAK9pX8fs3xbCy/IJKgEJm1ZH7uGFlw=;
        fh=Tpmt480ReyP68hi+tf38W0TCYWgGFWTFR45vCb5qJwM=;
        b=aOuVnU4VB5lsj+2QaZlm80zNSR6RtX0yExwMkLRA6TT7ZsYOBseIHiDBMMedxA/jkj
         9MP92urNRfl7/a2WK1uIY7gvTZzSdyhmk6HeJBMRxYHU7+nTtNS0cBLY1bmRr4V0dW9/
         gVFx+uTb57yUVJWE2pvKlFNfvZ2EYHNmbGhAV3kj87fx0fOqIUJaxwrI/GwAVZGdK0Zm
         pjIj9AYBlnrfanw6fHVwC6+sYuTkcrGklMJhCDHt5dOxPuGJQmjc7oYX7m+bMCXhqYRj
         5HfgBfvxOfyQ1lPiac+Pd/wtzXFwAOleXxw60bnuf1U4jrslFivVo2d17paUZRZ3MFca
         kBAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNk3qMcU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be10f2178sor35632935ad.9.2025.04.12.10.11.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 12 Apr 2025 10:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNk3qMcU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744477907; x=1745082707; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lif+I060r52wAK9pX8fs3xbCy/IJKgEJm1ZH7uGFlw=;
        b=LNk3qMcUmM8hjUK7jDxF2R1F1o/N6Ol0MbPo4YIAPOQPPZQ6kDX3abS2EbBG1F5PWR
         d9idODU0FCX6uUslRFuMceBuh6jRVa3wg0JpgIbfFYL4YXkqktC3XretQzoq2tC5SOWS
         AEOjrPURY0jxJ//x0nBrowmRmnfG5yvpnMWCfS456cgyTtmGB/gGWKyJXkNJCGELOXwu
         8EcjO9jquK1Fi/uhknHOM9XrBcDsX1ASKI9OJYqcLRaC/Ilayyi2t+ssSceajsfZV0Pf
         sA3vzkM1bZjX11YPWp+A1Mktsh9/eGlVX2LjWUUfQZ7WYnkITyht+/0sibhuQ0wJ6+DF
         HkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744477907; x=1745082707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lif+I060r52wAK9pX8fs3xbCy/IJKgEJm1ZH7uGFlw=;
        b=T3gw3lSj370zgTKkKarjAS0l9kMu5SMRdwlgdG0YI5h5BEvanHJB+D3dU4KixLbW7W
         NSJSpsT+Q2MKcwM4dxNn/VcKUnJ2v589YrPf/5BkbgmtMM8Qey7l5WPUPQE4G+ZGzcKd
         uP8e12gEQ/mIeB9FSZS0sYt8e21tzqCNb4al74A/IGqiSZ/aVyww+K/ERsWpa6ebEyqp
         2qYlnnj64xWiemJWWdnkAnQGLnCqDOjOGMrZLtcpU/VSNtYMcrJVxsuUXkixT1RFTJIa
         5ICk/scPD0XVmWepPOijjYuLABIXjYXfiPwnCB2bYV04TgXrCyK3zD/Cr6wuoLsM8q3f
         I7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCULwgsYByy5+/VBiJW+dOri9T7ABlS7aKGYE8sxskiD3Q4YXEORRWS0L3B5PtR0zxzVGNmf2H1sizSG5w==@linaro.org
X-Gm-Message-State: AOJu0YwRTTbvpXUFY5lhcI9ElD4+2g6mP1JfdnTZ+XQ7gaK6B+9gO1PU
	5FcUhoAPCnhiRGumV3lFiFmGT+Q4QptfyrurHrTjU8pH7YYqMnPWUUGzI9qMHn2cJQ==
X-Gm-Gg: ASbGncv0T4XQZr7mwTvHRN9ibez56D33qjCoK0I2khctpG1YoxsIP1qj2zesXVAsW2s
	3CcwwtH+Y+Ua0f4ygNO/MWnQ4MRG2WI21TBrZcIZwD9RQP/KtTN8lpvKZ68CzEu66z/atAqv4Bd
	6HjmMSuZj9LILqmhHVQn2D7WV9YNmT0W7DlzoJfSRY9UZy3z0Y3lkKPsHPIcGcY6Un0W7nEw2/I
	hK16FvfNIbusu4J5KfxXkcA2ICcDSaFFGXQqURV0Uex6Ebss1D+ZQ7LNaqmB7PdXO8Gwy3LLqIw
	C7+NeGdJBfQGDOIFtjDhRz0jrbcVPlW5+dwWCYrV9d4jI/tyIcoo6hMIoPEmGY/EjG7D92+PMzW
	jNHq4dmM=
X-Google-Smtp-Source: AGHT+IHBTTgkola2/9LW8V8Tl9qWWLlq7TM2e5LKnkvDqd3X5SnMo1nfCfZ+v0nHEvP+WGgfAdfYvQ==
X-Received: by 2002:a17:902:eb8d:b0:223:5e54:c521 with SMTP id d9443c01a7336-22bea3f1542mr97886545ad.0.1744477907597;
        Sat, 12 Apr 2025 10:11:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbcc6sm69325625ad.247.2025.04.12.10.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 10:11:46 -0700 (PDT)
Message-ID: <271cec07-4d99-49b8-9ebd-e1623cd59a95@linaro.org>
Date: Sat, 12 Apr 2025 10:11:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org,
 alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Yannis Bolliger <yannis.bolliger@protonmail.com>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oGdPd1GhBYrj

On 4/10/25 14:00, Pierrick Bouvier wrote:
> Pierrick Bouvier (4):
>    target/arm/ptw: extract arm_mmu_idx_to_security_space
>    target/arm/ptw: get current security_space for current mmu_idx
>    target/arm/ptw: extract arm_cpu_get_phys_page
>    target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
