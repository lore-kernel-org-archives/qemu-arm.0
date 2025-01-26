Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2078504njk;
        Sun, 26 Jan 2025 12:33:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3iTblcVq7xKwoHTojI68x4po4xQCfrk+Rbfwrc0QoX3qO/xRWPKXa0kOeuhVn97FDfBcbKp2hqc33PA==@linaro.org
X-Received: by 2002:a17:903:2bcb:b0:215:8847:435c with SMTP id d9443c01a7336-21c353e663cmr594880925ad.12.1737923581717;
        Sun, 26 Jan 2025 12:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737923581; cv=none;
        d=google.com; s=arc-20240605;
        b=grhiBgHmoM18cNFQk/oVu/3txt74BhJqOEn2zWliXL8LPJhs23FRhV688eqlGN4SeT
         ObVxDLMJ88zUA6qx3YzaPK/XzPpItbSbv9yX9FU30Dxg/jI88g0JTi0Q/1qkpnH8OzHW
         A/9rK7B/kXssAzCLVE1CkgJHSo3MBV0n/vWn+IqTn/unW902SApcohVzneHSAsGvXBX2
         NG38IIFfCJE1TGsqu1utG2PE2sNwbdUuk8Qhq/OzVf4Cj7NVR5T4Z3k0SklKyh6TI7hi
         kFZlbaMSWfMlzlJW55DY+tMGbvHMP45+BD9pZ8vJTJIN9hg84BONF6CZCxbLaH48y3Cl
         uxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
        fh=qMPErFrFuqmxk7dEVbWC8MPGkvIVJvhYiUfjNlnFdFY=;
        b=ftsZawZ9oLF7cDLp1QkWvBCbC58oB6BeV5tOkLFhFcfqqs9aB4ETyGRtljNqjO+p7I
         sc6ThLg7eOPMQy583yU/+CiCe206hIkXeUy57ofNLIqpTLtk80lJfmgrIaZ8BkkdqA9l
         0DPM2xOkR0EmIcES4/8yoQ8BGDRHeEt0RrowrJSysYjTZqWxR7S4rJpdFC21ox78wA5H
         MNp7+3CXzmT6tLO9XK6cJGwofmSA7FExvAl9nedNFnn95/yKA3+xsSa14Czw7YwoFKxM
         jQfHFDJs2wMnOvqp20vyp9jZy7dcKWCVXvJpJJq5nnTrm3W2PUioh8KPKqiO0R8f4FCc
         gWuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/mrHmo7";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21da3be6ce9sor38031725ad.0.2025.01.26.12.33.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/mrHmo7";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923581; x=1738528381; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
        b=g/mrHmo7L17WAamkUuFT3QF63sqSiCKquv+sBKPviF6RgG4QW/KWs4Jx8+qXXE+Is9
         ZQAu51+7LejHupxq8zJ5KtfmQ7s0VZV29lZzLt5t195UPzZJqFylSu1VeqhTKfAKbJ4U
         0Wqff7K57s31ouuWaRjsVSd3TBpw6bjJJl8Ll+65ev81w0VDA5e5zFJnA0qIcMAQ4wnh
         2idmlCfIA1rK2EMI6LlMT500548udYxVPHi1f7EZ32kgyP+tfS3yi9B6r7n+KW96hxVw
         1Nu9UxjUqKaCzx3/OY5bqUQoLkzKSAVvGZc0MHpD3oIvG8esAIrs1DTxt9yGImB1votr
         88xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923581; x=1738528381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GarlRROndxCjTPZHSIwatKna1U0gu9y5c+dSUp9779s=;
        b=dWMmW52O7zXzFgV6zixGCWiw4ix/u7O8O2w+Zwzy2QASaalUpODrudiJarH4g4kBHl
         xcOLtEWLnyEJCXpPyydQYqNT0yy9r3qNqC3S1R1oVJ10vQKbHf08+1NlwDxs2gd6mDsy
         Y7l1lP1JtZ9994j+y1Bffq0JbQzYQJMixpKPRwndY1LioYwbzh1MLzocY4oRELLmMN5m
         gAm52VKgzMlxI7EuZmEE1zrmdf1hCFWRQ725PTgRLmlyf9n+Xpg+KQPF7LJZJaV9Au6K
         GN1gqI51u/pC8KI7xwHptdhzBUMMjlgB2z5Vg2TkPpMUyxPH4QT64V8bKXyKZocUSoI0
         QZZA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Uc74VjacYHPeoh78GHMLNlkJ3HPOM/KWhjXghPOH1N+H0VE1y7cQHZpaaiwk71ZeI88nKHgzyWxPjg==@linaro.org
X-Gm-Message-State: AOJu0YxJizpZvnV1c8IyTes6CSnibGVSBj4/OUq/oiaC7mpmIBXQu2U0
	g/KnOsyUTiLtBH0dBu8UDTBbmRVnBGTxPlGsJ3yVOrXoTLppofjT6brcsD3Yd8gA6g==
X-Gm-Gg: ASbGncvL5CGjj7sJYX+vissH4PwVxBOThgOlk/qpfbTEShf1U/BMWXcq+2TbBAD/gOd
	Ao7UTh8sbAo52PXP0BDqGQ6Tan313F+Kh7dexQYveBWWu2qSSzRS2PUUGPwc9mbfjIGfH4zcYH0
	hrcYglzoUzRK07FJQBUEinbFVwjLr8nelHcwy4NYc5OvcwJr0A+8L+mHUVv5ciKheJMh0Ezes0Y
	qgdxR1/CJN1Rge5pCRAPvzaxl3/X8khRKUVvlaGOBG87VE/9JpxluLE5gET0EY+bblv9hEkFCn1
	xWe0xgwikxVDiU0w9TbQivSu+uml/6F667qNHs7vjs2AdLI=
X-Google-Smtp-Source: AGHT+IGrTF0ua3JOvhdmIhcZ60si5thXhjyK00MEnuyxWBq+ow6bXi0deca44yvyI2f3m7/CVHkiOg==
X-Received: by 2002:a17:90b:3a0e:b0:2f7:7680:51a6 with SMTP id 98e67ed59e1d1-2f782c55be4mr50581605a91.6.1737923581153;
        Sun, 26 Jan 2025 12:33:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa8122fsm5509332a91.41.2025.01.26.12.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:33:00 -0800 (PST)
Message-ID: <525918e8-b114-49de-bf4f-5b6e1c04d29c@linaro.org>
Date: Sun, 26 Jan 2025 12:32:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] accel/tcg: Restrict tlb_init() / destroy() to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MXo+kGNITyYc

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to accel/tcg/ scope,
> in "internal-common.h".
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/internal-common.h | 11 +++++++++++
>   include/exec/exec-all.h     | 16 ----------------
>   accel/tcg/user-exec-stub.c  | 11 +++++++++++
>   3 files changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
