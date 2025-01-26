Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2066504njk;
        Sun, 26 Jan 2025 12:00:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWq6Wm4f7mJZTZyyiUvY8qvckBgjkk5WWZdoUcKaH/191zxpdnWTTzUDtWbT6iZSQrhyMX8PwQqhZafgw==@linaro.org
X-Received: by 2002:a17:90b:1f86:b0:2ee:8253:9a9f with SMTP id 98e67ed59e1d1-2f7ff35826fmr17143033a91.11.1737921605692;
        Sun, 26 Jan 2025 12:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737921605; cv=none;
        d=google.com; s=arc-20240605;
        b=eO96usLUXQ8Ood1L9yP85t2T9uDlvWcum6jHRruZUpwk03YM5RkB+rhoJcLdYRz2bn
         FMy75CqwbVItu403QD6vQ9aRHJ3Xipy5wyqCBswEsEXi2w1AtsLdPQpmcP3hKySWb3R2
         JPze3RStZ9TJtyHPVwWX8V1DGt87vr789b1gaO4nSzDhM5FrNQpZKdwNufXUu84+N163
         raPh86pk6fBHOWdb3zG9Ja2tCuys9DHi5nTxo7kx7TzsU7ZdrQQ/zoQkjsIgXiisBMa0
         FynlmSta6ZBG+QFOvIdxnAalZYKwlEgqPqRXoOxDjZkQs70asdOSvXqrUdIj5QeJogaa
         SKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
        fh=DBOo3bTER8D/q8w+NhVbI758FvvPauAyd9z0JL+fFXg=;
        b=bBUIifulz7Oxa91QXIH9XkbIh/A6z5RloqtUjjfGVmNx6VD6dQ016szjCirHfGXMfW
         +L+TiPoIxL1c/7Gt1kC2VDAfbZ5HoAOT1n9+owLzOBeTus9F88INMGtyDfhBhLgOJvJW
         ISG2/O4F79nl/cb/1J0PeaJEOy9YmIks2mlfGXYRsGwzEQiX3gvlK+B4ALy+jbE67LpC
         w24O6QwXzt0TCQtesM9q2SesECr/+QYLG9ELWiAoRH4/iRNVjYk/PE4u3Hs2uK8Pt1al
         NXB4GdRTx6BedEEPg6TMhRAhpxls+FVRAVp+TzUm3f5l04wNYZZRxDd1/G5bvna7w2an
         oGvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+vexTbH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2f7fe60cd6bsor3002662a91.4.2025.01.26.12.00.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+vexTbH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921605; x=1738526405; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
        b=I+vexTbHqaYQSCOniQH5s3VDmFnmD5AHZY7+2JiGQItNWJ2BdUv3FxoW/nZz+obIww
         fDrCgnlxFFKzknMkCFo1NgGzdvqM6Zz23lsqM9WkOZc+1i6VvGFeaSr4nRhEks8WDiVm
         aarkXdI00Ftn0rwU7axQE09SKAxx/eJEs+1wTbNo8Chk3lyF4JMzuIz2E3NOQouX41bn
         g4J5AH3axBDc1GfehcMgkEJ2NDSki54bcWLrozptFHRFjDJQUW4EPGlOKfveghtot/6s
         publnY9kXqzlMsDQrVv1VYvsir95/mPQJtCOSWIdaUp7YadcN3n7o47qOXBJ2e6L9ErP
         1Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921605; x=1738526405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvT1nOyyGXJEnkXkKCQj0Xq14BrdlE2RAOYFWR4ybQg=;
        b=kAYXsKJhZYDkKn4rMaJcRcu2CO+dYBevdFYzbohLsQ6YDCKuKzxofeUwKlZtgprWtr
         zOTkQU/FjYM1S88wC6/lnpJ3vKnsuqXr4i7wwmNjQWXMtdJnlxNC3cdKIOtjsbiuh6G8
         0IUPkFjBA0EPhVTdpZaYMbqRU8H9yG3XPffgU6rMlTXKZ9UPA0rcKasa1Q8/5k5UCpan
         6UU9QQPMELBgRavSO69ZEGjCLOwdkHoh9Z1qaeykxvzYEGB+gjjd6VuO0g3AeduekL+R
         mUZBFG7Ftz13TBk2aKhoq2g2B3+Hvc1wmV7m1VpMqg9kH6Q/Xh89Wo5MX2Hg4jheHtEi
         pn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZlKWq0lpr+t5Lv7fNgrQ1MMRGPnSYrGcH+ZzJO2DkNRiYbaIqA2zHhQWsA3aWdFmfQitwTLK5PKPzmQ==@linaro.org
X-Gm-Message-State: AOJu0YzZX13A9RJ19iFKX9ldcfsOzG0FE3LMIXCDjqAtIzpl2U7Ct2FA
	8bMbQzFQ51cGnWYu2Qam31F/KcTy1tfkWZcoSolbkjfsE18kgpeqq/I4qXiSNVoqfA==
X-Gm-Gg: ASbGncvzBVjQ1CYcKcdSPDo9qQnInikw8IelQgj6O3pqcHZ6T1XFbhCPJSk39eao4Kh
	D+92vu6rDSVXoYfIUDM6am1Af4hLssXQj+mlC4L4rR2Ju4vqQJEoYUD4lGlvz5DtpItu+44jHYW
	Rw3SYSJ+cYDjo26NxAC4uP4ZtyiAUpzWisil/fneK0a56QQso6nt7QqJNlAXXjh90JgVTcGCb6F
	atru5rqU9m0xA4a44nonbKT7qWyWM/2346vQtSH+71ZFvMYPQEqSJlcagixLqI2e2RO4auybWSL
	DmgFtyuMZk1yaPj/9FsbmIHmedtbx2llRz+W+fmLU8GonqE=
X-Google-Smtp-Source: AGHT+IEP4DwQ/u514V5B38J2P62wTL0qYp8JNncl4+5UB0i/l/G/YI+4UbX8eVL0ayMsA+c7B1DDZA==
X-Received: by 2002:a17:90a:f947:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-2f7f176b184mr25848071a91.8.1737921605198;
        Sun, 26 Jan 2025 12:00:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffb1dc56sm6196959a91.49.2025.01.26.12.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:00:04 -0800 (PST)
Message-ID: <ba781224-7b4a-43f6-af25-acb308f11313@linaro.org>
Date: Sun, 26 Jan 2025 12:00:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] cpus: Keep default fields initialization in
 cpu_common_initfn()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6s8eXF/aNE5a

On 1/23/25 15:43, Philippe Mathieu-Daudé wrote:
> cpu_common_initfn() is our target agnostic initializer,
> while cpu_exec_initfn() is the target specific one.
> 
> The %as and %num_ases fields are not target specific,
> so initialize them in the common helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c         | 3 ---
>   hw/core/cpu-common.c | 2 ++
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
