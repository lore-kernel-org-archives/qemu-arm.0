Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp613855njm;
        Sat, 29 Jun 2024 09:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWd7FNQmTZTx5EuHe/DzTFrUPzXO3tnOP6XCNpVJ27ElIwwYvJ5f1StFF0YkDvmjw7csMWL9mUkyU0d45TJ0QY0FTmss22Z
X-Received: by 2002:a05:6808:218e:b0:3d5:6446:3407 with SMTP id 5614622812f47-3d6b4de2f1dmr1955695b6e.47.1719678104299;
        Sat, 29 Jun 2024 09:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719678104; cv=none;
        d=google.com; s=arc-20160816;
        b=D5Iru02SZaNEsaHeq/V6UPAkff0HFy1WvUbzc5lciYl3SulwNkmOJ/nBHCGvmTB5z9
         JZsgaiLBklJjgNuOzUzUBA/wk+TuzlPbnjWQTfWj1y/Ldq6kLMqvQZr9DM42X4N81eH5
         OSDXw3fgyVAqPVcgj0ffAPvNSSaScxJYS1aMS8Kwm2kYO1av0LCy1jyY+u8R3ZtNX1zL
         mEt+HWlBtsSVzqBl3HYTmQWXa05YpQgFTkZk+HQjVUAkbLOqhUrAnXE/T51tROzTa+2W
         LikF1J+N29NeRJE4epZg9fQVkryTFnZcTBIZvvZEaHyPgDT5Dl6/pnLtkfROSYzfvExz
         jS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mMdwZVEfI/dAA94EPLCTlDwq3F6q1KZmQl9heAggKEA=;
        fh=ZpNzH9sNs32iMVrwzzw0SPbSq35mSgRoTK9YPT86NRU=;
        b=RlpLm/WDMDZHDma92aPyPPX1SDAdFmYMbjcgkvnxNtwQx9c0KdygmXJD8IFsW5s6a5
         TXZlUlEcAyAn9hFZwLdR6wr6Sbogxo9vuol3bASfCJRztiOOTfmOrSkfZBserWXDjIOD
         av/a7Em9bTd18NsOnkJwepWLJgSwq9M2c5/G94k0JgoUo11JJ175xjYj4UYxxJybpLeA
         Sdc3NmRH9ZoizNjSl24dCq4RcRGP1unHHdDAvpbJ2uxV8oSLZ1ECO2WA+eB21dXhb9F+
         U8Vx96a/EZFPotSI66b+lsPH2BZjXUOcGjjNcHEJjR9DVn6XRB+nR3q+GCG/HYA8Atos
         odPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkgnD3iJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70802565b45sor2808324b3a.3.2024.06.29.09.21.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Jun 2024 09:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkgnD3iJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719678104; x=1720282904; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMdwZVEfI/dAA94EPLCTlDwq3F6q1KZmQl9heAggKEA=;
        b=QkgnD3iJMwAzuCSEZ2IdFXCEgT7/0xKZdrVWFd2jX0y5XxkVa/nMKnjbijqpajs310
         ctgBv+T90oPR499voYjs+gpuatPH1awTA4cARE+NjCKpWWYIpTMLq/bansLmRrxlquuA
         x5yt5VMPvWOZHoMCXgQCSgcIkAXPdhcme7FNRky/GN4c0UWVcrGW9xSnKYmRBCINypV2
         TbanyVBqmbxcvmRPLbmBbrAOSFz0Qd7jqFkDDuIdKtgif5XuOBR0PlnHsEohy0+cOj55
         LSbgDO6LQmisUO3sNWHieQaqa+7ZZu8wF0is61J2pcH77mKAJq2Z4eRPtbP8+kvGRuzl
         kPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719678104; x=1720282904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMdwZVEfI/dAA94EPLCTlDwq3F6q1KZmQl9heAggKEA=;
        b=E8tp/xup24KaZVnlDfLPHRwJpNUU6OxSKhNhg6SucgjmWUbEY2ZCsV9yLrSjhzvL35
         8GjgWFuQn7cCwLDQYY6PrUWSx22e908eSfXEusiwSPcFaFwC803QAdLgqEKAlrpW98GQ
         d26KCz9RYFokDcVJjHtWnXBQeUqKeIunmwSfFepo/Vn8moxIcHxEh8XvHnZsSPbgp8Ez
         q4ke6u8Xnj7+/td6qEhZtHiDHZmZG5UzQZHn5X3lTjqRKNjhSHIrH122I5I4LUynwQhq
         Kp7zZFk2sg0yt+BUX8iEJF1iHXce2oNY4Sp4k4j1OCTG+I4CMuKLYTYBdMQEScMZqbVu
         hqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV30vzlFSgTcDh9GhCFqeZCi8/Ec8nipX1Se/8MDjlfZj4I9iFQGYybGEUjCunIg7o2Urze05E/3o+9sPy+UfbRlfnDBSfV
X-Gm-Message-State: AOJu0YwEubIg1m/n9QDl9kEV6SgVD6KJl7sw0T+9YFdIr1R+w9fTRi5e
	qd39voW/nmkRhIIaH2B+dArp4iFQOz3bilEUStxLnwG7aSV9N8+g5QKoS6jthtdYEw==
X-Google-Smtp-Source: AGHT+IGx+z5FWeu8q3RAQkyPHswkryLa+WpD0XSI3F20wvWjtI6raNMpTb/q61hlLUZm8OiQITmgCg==
X-Received: by 2002:a05:6a00:2d06:b0:706:62d9:a4f1 with SMTP id d2e1a72fcca58-70aaaf44f51mr1358767b3a.31.1719678103482;
        Sat, 29 Jun 2024 09:21:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708042be4e6sm3454740b3a.153.2024.06.29.09.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 09:21:42 -0700 (PDT)
Message-ID: <eb2c8141-4b16-43bb-94ba-698e3d937eff@linaro.org>
Date: Sat, 29 Jun 2024 09:21:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] tests/tcg/arm: Manually bit-cast half-precision
 numbers
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240629-tcg-v3-0-fa57918bdf09@daynix.com>
 <20240629-tcg-v3-7-fa57918bdf09@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240629-tcg-v3-7-fa57918bdf09@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9Ly4haQ28rCj

On 6/29/24 01:56, Akihiko Odaki wrote:
> clang version 18.1.6 does not allow specifying an integer as the value
> of a single-precision register. Manually bit-cast into float with vmov
> first.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/tcg/arm/fcvt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
> index f631197287a1..5263f607b59c 100644
> --- a/tests/tcg/arm/fcvt.c
> +++ b/tests/tcg/arm/fcvt.c
> @@ -355,7 +355,9 @@ static void convert_half_to_single(void)
>   
>           print_half_number(i, input);
>   #if defined(__arm__)
> -        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
> +        float tmp;
> +        asm("vmov %0, %1" : "=w" (tmp) : "r" (input));
> +        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" (tmp));
>   #else
>           asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
>   #endif

Better as

  #if defined(__arm__)
-        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
+        /*
+         * Clang refuses to allocate an integer to a fp register.
+         * Perform the move from a general register by hand.
+         */
+        asm("vmov %0, %1\n\t"
+            "vcvtb.f32.f16 %0, %0" : "=w" (output) : "r" (input));
  #else

without the C temporary.  With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
