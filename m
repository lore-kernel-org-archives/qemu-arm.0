Received: by 10.28.71.27 with SMTP id u27csp1223567wma;
        Fri, 9 Feb 2018 10:01:17 -0800 (PST)
X-Received: by 10.36.217.208 with SMTP id p199mr4145205itg.29.1518199277281;
        Fri, 09 Feb 2018 10:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518199277; cv=none;
        d=google.com; s=arc-20160816;
        b=aelWAr4nxYbfrnHaOxEn8cbiEgLbGRG3x9VCtKu+08e+O8x3vmPq9ATB7F4/kVEzGP
         9kEzSbpTyqb0lY/0r5Etw+g5cn/vcHYfgwl0PVHZydNucvX5001gs5MY6hQEDj8B2YtC
         vHlooMAAp1ZTozFwyp7hapW8B0ac4stqy+g1d1Zprbf5QtoGFBjYoE9irw0gaE1mh19c
         9bGdl9mOJ6njWIJhzLuLeMQV4EwR5Ge1Ecf46hL7WX7y8wk1+2Um/u+lVVkUMmK68xrU
         utvwlheFMsFHTWUXAVirYQZDouM5IST1Zfs1Z0H/GRa2skxM5zoxp1ePjZf7Y92bKikO
         qVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=6SJaoJPM3Q3wMB1i9/vC6EhCn7zGQ3KNWVKZtVS59Ss=;
        b=Gpu+Y5k+7l+V15j1+wTin0vo0JjBYpR71JF3t7o8Q44z+STaelt2iGr2SP8gOA+AOh
         EqzvWzgmTfcYVv1Bb2PB2qptxQtR1H7JCObDh8zMya5lYvjAc0nQUxptcAYgmG67iVHB
         cpzCdxl03NtLmxxigyzq32b2fqmfo2QETWlvSvSgzlVXaPimcAIjl1PVvaT8QYIfD8Ei
         h+GdR0Vx8wapB4iEQnvfqSdrlqQPe5/kl4dqraJ9Dt+qQPvZgHvmZWYk2yaULwHZhK8c
         s/eiwontHAxuJrJZAFatLndqT75I2MNU/8OWSEyCvGUybJanGNsalGLt1gMN1Jk3TkT6
         N8YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrGqJfD1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j73sor1719138ioi.23.2018.02.09.10.01.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:01:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UrGqJfD1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6SJaoJPM3Q3wMB1i9/vC6EhCn7zGQ3KNWVKZtVS59Ss=;
        b=UrGqJfD1N8ar3vLoJJx2GCsEgfG/ja3lGzyQyKx6DHNMm4JeTjKm0dUO1MGPbN5078
         Ufm2GEzhG44FDzB2T1isA1QuH2KoOggiuxJhs9eiwPyUCfy8Xr9axcEjl4TgPV3Kk/oB
         T9jfsSF770jOIZFwM5yZp4wx5qeqiFy3UQ1eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6SJaoJPM3Q3wMB1i9/vC6EhCn7zGQ3KNWVKZtVS59Ss=;
        b=fWLGBkVP9yeV9AjpaJlArrIkZNEHX8P52rPKVvhWzhsPPpEAxd/o14sIRnqf3l92Ij
         39MDtI/1ttd6rczhPmHTbQv4rp7CPMkcp2+Vp6UviBK4P+AC32cfpJ/Vxpz6nbc/5xMX
         KoTuFtks50LDGKPwUnCw5eo3/QdIJ3eBAghEqzbLqInPD3rT3QPP3s9ssWDR9uVN1WKq
         6sv0PWN8njrdkc9uZip9ojs4766NGVZAXL1uXyhudDMklBTSf1YO1PsUwjDofyPGF7FX
         aSoWvDKENzlt4Qr/4mtxVMFBezH11IPm6jpmWmc2TiZBgKYHYmWHP+NK1+Z+nid8mWzO
         Gl4w==
X-Gm-Message-State: APf1xPB1RqEI1A55c4/uHtAJdJbRyWR5IIWgqgMp/dm005/cIiA6d5ES
	/EheRMt5ba910fRse/la/rr8kK/6
X-Google-Smtp-Source: AH8x2261DRkw2f87njFUXstozxSVmF27NTRX2vH37e0isXIvWcwKG2puy7ijAdagOzBLlSeZ2nxWjA==
X-Received: by 10.107.31.213 with SMTP id f204mr4242695iof.288.1518199276775;
        Fri, 09 Feb 2018 10:01:16 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id j77sm3755276iod.47.2018.02.09.10.01.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:01:15 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 26/32] arm/translate-a64: add FP16 FSQRT
 to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-27-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9655d2c-e9d5-4a5b-f3eb-3ec4e9b59594@linaro.org>
Date: Fri, 9 Feb 2018 10:01:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: W/Ix2uySukFZ

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   remove superfluous helpers
> ---
>  target/arm/helper-a64.c    | 13 +++++++++++++
>  target/arm/helper-a64.h    |  1 +
>  target/arm/translate-a64.c |  5 +++++
>  3 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
