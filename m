Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp496762njc;
        Fri, 21 Mar 2025 11:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDZLIIp/KBsSbtKvGjZs0eOzqk1PrSwjBehO2iOdIVN5EtkCTetUZHawV7rKUHxAgC5Z5WnUIlKEeA2w==@linaro.org
X-Received: by 2002:a17:902:f709:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22780e09686mr78535845ad.39.1742580210713;
        Fri, 21 Mar 2025 11:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580210; cv=none;
        d=google.com; s=arc-20240605;
        b=VZjOzL23xo94eDZD7etIWr35jhYMESTf0RKJJRkBo2s5UpxlsqGDlcDmw9gZ2ygUYe
         XZdq33yVLzaBuw1lokOBRRpJZNfh3iA4B1BP5X6RUr9QWHOxBUliUj3F961ffny5WjvM
         ikz9vppOk+CEkUFxbf5mNZGAB52CvAJNTQnoKrEZln5qqe0MjHs6pva+G9zzXdYcTwzk
         OT33THUQH3ZUyIX87NEwC0w98kF10Noe8SbscTcc+liM+DwJzi6UA8qUhi5jSelQWWkY
         /feR3P8uYJ2Y4/eBmSlIjcN/5pTx08qhLHVj7HsHzIgl0GvW+Bkp61VZKa9xlhkiWfeS
         Yygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FHWrgu4CI1pd1XxzLhTETskG12YT/MMg2wUOB15BvDw=;
        fh=3o8wbMYQtbEP9x7zmVLx1KyKdcWhnpjX3e7kdxU0fUI=;
        b=RqCpkjFWVxZfPfTMZ2Zarsu+NKLB7VVkq+ZsKVA90tUa90frxaXbpDIT2D0gf7YOB7
         MC1AwzVZaYBSLkNbMA8ZrXGf1gBk6NgyVwprd9/tzstRVtONCDGwXcueAYtNyWEuGYcr
         pw+L9y+VQ67vcTbZXRxe3YcbAl+EE+CYi3XVqiLbxi938nG6YXvP/H/GbhP92yNWbcAa
         rnKuJzMr7TJu+NiL8FEttnLQyXM39YS1E6ITBH8efgSatcO4DgdUFqjpsoDW+iODhsrC
         toNZn843yDlh6+6fo58cbLtCHqjidpYOl9zbVMuwYl5v/XUjWYzcc3UVVNe9h8eAV256
         xQQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOtGQdGA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811da417sor23451005ad.17.2025.03.21.11.03.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOtGQdGA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580210; x=1743185010; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHWrgu4CI1pd1XxzLhTETskG12YT/MMg2wUOB15BvDw=;
        b=dOtGQdGA0gqhetPFV+OK/6iKT6BjTwEjXRc1qjtIx2SJx4ArENGc3xRGleprxnmWWr
         3eQ+djNrHAGxX5PzNMLI0efN6WgSut2COJYRG/STzxAiJ7QAA+cnyoyKyOxVyLqXZXcX
         YrKKqnyXaf0/GNgAKxE3LapS4hMblWFCtHSFFetswXychrHwl0eJ+NGNQYclSceSNkY2
         Ht8pcf+H5Ttb9DhVHmuvjm2vpdCfP/Au3SFfbn9w682v2Tfht65aZVh2MA/zoUYUbgEB
         tpr7e9mSHhnjTQKvrko/SkrDO7FBh4zxzNdoDtOVwhre+ncl8QbQmTh6M4ukg8NHidIc
         xALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580210; x=1743185010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHWrgu4CI1pd1XxzLhTETskG12YT/MMg2wUOB15BvDw=;
        b=Pg5p0cuevElp3H+DaC1RgeJ+Erh39d/+jE8t+e+GbTasQ9XAGz+uyVwJpNShuKbl9c
         hXifBtACdcFoRrMrSjjNyKS2gxWnNftMh0iXEbg250inweKSADPTee+jlNgYq9D/yswD
         Mgk+oo8nO6NSrgREbifdKWVn44Nf1ecPE01CNDL00dv5X/8WwGzOEz5IsqitSaWGRCzb
         pzU/u9hIE8WihU6+QRgByady7qLKLg/+zP6wdopjjyAuBiLBB4zpMHh15t//GaF5Q+SC
         w97iwdibyfVkavyY2tfXQJZH5YsroGM9aLCZwpBkrg0Ynj7inOmM/UoP+c3w7pQlPNzb
         meIA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ImHXIW9lon3Wo3jfJAuw5gVAbarrv2DccgF2mAb/26SA/9rIRCTA8MJ4KlZiDjLicRXRSoRL1ceYLg==@linaro.org
X-Gm-Message-State: AOJu0Ywasj+CEG0DjnSstzqZ68p193Tv9JW0jAVlDuJ1nqy7GxY/z1U1
	bq5o5FqTrn2RSj6rYy6M7JG0hvG7jjTflZLe5l7+oCDfN6EK75NXpyeD3vptmdAhHw==
X-Gm-Gg: ASbGncvKJXxAZWy6/jBhVmBQOvz4H1gtCItNxVOydd4NNyChxubpd8xtNHE1u1qGPF/
	B2BJES2kFsz4Lg9wjuhGCS9/umTIkfJM9mxBzn0T//vpL4BV5EkiVbGonPW5h1vtMVzqBmFUg5N
	P+CB83/v2SIzkVDEafIbCqHFYw+sJIMOzjW4aYhuxhOP4od102m2EtNPvI0XHVxu0t8+BFv7Tl2
	crCYdYmQxxBVUXhBQdo1Gzl3iKcp2kKi8MWQiUlOY8/XLezg0GlCSs77AZhhQ0wamnSBPxF3nkB
	gGs7KdETFrWC+KhgDAFF/cxyxJqpnLbU+MEqtlJpPyIwqQq2mgFpa6QkJeg+x+UExMjf6ma3Kkw
	sy1fZCr//
X-Google-Smtp-Source: AGHT+IFw1l5Jp6Qozd56AnDUA+f0dW6g+9lo+kicQ35LV6Y00Wjk+3zxrVeXUdhwG9mrH+L7/mOUQg==
X-Received: by 2002:a17:903:2f47:b0:224:376:7a21 with SMTP id d9443c01a7336-22780e0969cmr66161015ad.42.1742580210285;
        Fri, 21 Mar 2025 11:03:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f39797sm20285935ad.11.2025.03.21.11.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:03:29 -0700 (PDT)
Message-ID: <d1a86799-a978-4af1-9505-0d972f8e0f88@linaro.org>
Date: Fri, 21 Mar 2025 11:03:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/30] exec/cpu-all: transfer exec/cpu-common include
 to cpu.h headers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-16-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-16-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XMjMllTOPtpq

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h  | 2 --
>   include/exec/cpu_ldst.h | 1 +
>   target/alpha/cpu.h      | 1 +
>   target/arm/cpu.h        | 1 +
>   target/avr/cpu.h        | 1 +
>   target/hexagon/cpu.h    | 1 +
>   target/hppa/cpu.h       | 1 +
>   target/i386/cpu.h       | 1 +
>   target/loongarch/cpu.h  | 1 +
>   target/m68k/cpu.h       | 1 +
>   target/microblaze/cpu.h | 1 +
>   target/mips/cpu.h       | 1 +
>   target/openrisc/cpu.h   | 1 +
>   target/ppc/cpu.h        | 1 +
>   target/riscv/cpu.h      | 1 +
>   target/rx/cpu.h         | 1 +
>   target/s390x/cpu.h      | 1 +
>   target/sh4/cpu.h        | 1 +
>   target/sparc/cpu.h      | 1 +
>   target/tricore/cpu.h    | 1 +
>   target/xtensa/cpu.h     | 1 +
>   cpu-target.c            | 1 +
>   22 files changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
