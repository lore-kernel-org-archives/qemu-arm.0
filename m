Received: by 10.28.71.27 with SMTP id u27csp2535537wma;
        Thu, 8 Feb 2018 12:56:09 -0800 (PST)
X-Received: by 10.36.101.137 with SMTP id u131mr672100itb.9.1518123369506;
        Thu, 08 Feb 2018 12:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518123369; cv=none;
        d=google.com; s=arc-20160816;
        b=ewC6JPao94oZ5jMNYU1xOk4GTwHFK4k7vMi82dJY2Th52v4lSKzPEGJ4/rjEmt5J8T
         wnEasihLiD32EH9wRxAlHgaD+4xbhOKg4hE2QYs+LUsZPF54UFoUbasGVD9jjbs29f1l
         K8CiDN2M4x3rtybFKMzkNR/+S3j83H4yY51JxVqID5htL8PatBmRkOGo4Pn4S8f2RuKJ
         gVM6/uapNreQc9ABjtPEp1rTOgX8IbePzkJH196h5iMJ2DV3Lg32mv3VM4dJEewWcD4c
         OBgFPTdjW/YWKZPzeCozg6M2Pkwgkj8aFX+f0J9Kx9Aac+uClhdPcj6ebPlo9QCHvL97
         6BRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=JS2od6EV55lpiuCJIpcX2aX4IBC8+mU+RoJLqueFhBE=;
        b=l8ga6Cd1WL+1UzXOC4TJgSQiiupg5ddX5unZki9rWc4kSxY2wD2zoGKXmogLvQprgn
         fFl3Q5bW80QL4tA/GyJN2yR4gol03NuSPpHNoGlUZXB52YIVpXp36XV2rLE6kNKOhxuI
         MsYBtxAwQi0Y4I0ATjMhKgzqiIHadWtE7EGP4hyoJQxXzXvr1shbxyBIf+fm1ix2CsqI
         7oQQ4yC/sdiIzWV5fu6++1Lt0lktSvDroZ5X4wgc5zMko8dAKpfdkZERZy2D2OaybB1a
         RsD3DXnqnUtrclT6Vlta4QTW+4LgzIKK9xVgYlWEe9gPvBUCJ8EHaZnEiaHO+fHTe5Vo
         RVVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPfBumjh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s70sor491248ioe.21.2018.02.08.12.56.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 12:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPfBumjh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JS2od6EV55lpiuCJIpcX2aX4IBC8+mU+RoJLqueFhBE=;
        b=OPfBumjhsj0MlQ4CFqmxsHqjPOFP0tXYqNERuhhpdl0oyYvwOcHdmjiD87Roi1R8ef
         FiE2x1v9tZUbHd8KwlP6MhpriVoBw+RwgOBtcljoJSYjZ8Ja+KJOCmsKDyxGHw7o1jF2
         bSU46dseMCR1XmEbihVxpv27YYPFfdBzJcohk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JS2od6EV55lpiuCJIpcX2aX4IBC8+mU+RoJLqueFhBE=;
        b=gINhbDCZIw3S5xouvOykzFTEYoo2z8ZBUqQZJBqFa6MvTiiIT5dV699kszsBEevObR
         xN6Pt02Ucm4D9H0NityBA6vloNEGVdsE1vhhplKzdatJj39coOsNOOGumiV7o1OYpA8k
         Untw5SUZ+RgW4YimPTTBczp7/LvoX/dDm7WscvJrSuyZNVZ6RbS7ny/0mKPgjIWCIts/
         K8NKffhRUW3KWxfv8gEeyhi38DMADwKzNfYxYg57hln89rVImSWRvYiPZcXgRu1KM+bw
         yhv4jpkFxkR5XqIDyqUBXKMDkUAeR+taT81YzLijlBoTqt/GhLP7gaQ+zO1eeYSGP7AY
         kZUQ==
X-Gm-Message-State: APf1xPAnxuldQMezJuiSIwFK2AY7l6VoRe78bqeXyO6AhB5xl3huBejx
	LDSkJhrBbwDTJuWKC4AICMODJ8xbOJkn8w==
X-Google-Smtp-Source: AH8x226thOiPlir1pQHtfebbitvvV/oIfgFqZmsojzNgF+ksocPR4nXlvNlmskTiGcBrdUUSOPWCmw==
X-Received: by 10.107.51.149 with SMTP id z143mr666054ioz.287.1518123369084;
        Thu, 08 Feb 2018 12:56:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id r137sm615033ita.23.2018.02.08.12.56.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 12:56:08 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 12/32] arm/translate-a64: add FP16
 FMULA/X/S to simd_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc79bcf4-249a-0ae1-5099-7aeb78e97e04@linaro.org>
Date: Thu, 8 Feb 2018 12:56:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4ozC4Ej87ZGJ

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/helper-a64.c    | 24 ++++++++++++++++++++++++
>  target/arm/helper-a64.h    |  2 ++
>  target/arm/translate-a64.c | 15 +++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 78eeda31d1..bdfcac111f 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -600,6 +600,30 @@ ADVSIMD_HALFOP(max)
>  ADVSIMD_HALFOP(minnum)
>  ADVSIMD_HALFOP(maxnum)
>  
> +/* Data processing - scalar floating-point and advanced SIMD */
> +float16 HELPER(advsimd_mulxh)(float16 a, float16 b, void *fpstp)
> +{
> +    float_status *fpst = fpstp;
> +
> +    a = float16_squash_input_denormal(a, fpst);
> +    b = float16_squash_input_denormal(b, fpst);
> +
> +    if ((float16_is_zero(a) && float16_is_infinity(b)) ||
> +        (float16_is_infinity(a) && float16_is_zero(b))) {
> +        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
> +        return make_float16((1U << 14) |
> +                            ((float16_val(a) ^ float16_val(b)) & (1U << 15)));

Since you diced all of the structures, are you going to dice all of the (now
pointless) make/val calls?

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
