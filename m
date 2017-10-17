Received: by 10.223.197.9 with SMTP id q9csp4064386wrf;
        Mon, 16 Oct 2017 17:39:14 -0700 (PDT)
X-Received: by 10.98.35.75 with SMTP id j72mr9965660pfj.82.1508200754785;
        Mon, 16 Oct 2017 17:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508200754; cv=none;
        d=google.com; s=arc-20160816;
        b=HzEn5j4CGW4UL4eJ3NaQRT7KAfhtJf8eERqGbHNFAoSuPeOCTy3DM3LG/hGLWABop+
         O1O0q48oqWpdvuyZRAZzEugGcYH/miI4C6g4f8bJ7zcOQn7rLmYJgsniUC3L1fCIbsqo
         ZOrTPpzLU58KTxytf0e8KNqRS/N5lrFKDt+i9GG9SJC65pucl6jhIyKS8oi5A4gC4PLj
         adNSr0k5j9ctUkGFhjNfWCFiinB8kb5Mi2lNA7GvsDfhhEXn95o0zWB/kZRGXc4qxisl
         yU5gDBWLHSSdQnog5tinX0eo+g/gWIflOhCuE9/yIB2pWDTnbMFWQOxOXuthTXOmuT62
         gE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=2ICBD4Gr0GfRrLz+cqqDY7dNZYxWBEuixIdj6gDAzVk=;
        b=XPOlTdsG+LUV+EH3yB15ibUahG2WdO9M6sV5O96+XMLX3T8jXAbpUvAKvC0U8txF+I
         BUXSTJRejSwzCIrFN+x/jJsn4rpjpI7/Dphp8XdfLd5inl2RwAZmbmCsjW5FOdnh6xXA
         DX9Yo4A+NMvDl+bBo9aKsAgHYHl+AlsvgQ+wpOhS183Y7rlomgddOcP4NJ2HQfLCND5P
         yhvQAAiL5V0jyQBZRDlTFgKCy1WvAoZsX44xLjIwMF4t0Ek5REOgM4y264lkrxE3qPVT
         77q7Ek1Rvg+YhZTSiTgtcdPXbzDRpYbElh+rmoWVYVYbeSRmc/uvannNGPZ7FF20FYbA
         wGiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SpUrWnGb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y15sor2151119pfg.140.2017.10.16.17.39.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 17:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SpUrWnGb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2ICBD4Gr0GfRrLz+cqqDY7dNZYxWBEuixIdj6gDAzVk=;
        b=SpUrWnGbiu591XSF2pec43dXfapE283T0ii3k+WGU6ZsHOd5uurOaNdPrYF4NMcNLE
         RqrUPzLLwcxUMlL3agHKGOptsAb5vrm0GLJuLYP6S3TebtRBpYH3FrPvzP+P3Esz7I7p
         xMr6jO6p7y8TI5WS3Y8hiyvaQekaPdAMHGRyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ICBD4Gr0GfRrLz+cqqDY7dNZYxWBEuixIdj6gDAzVk=;
        b=IVXByq8VgChZEllQIgduTs0tM9fcDj4Ysko8aVypCQb92HKr/IxwYUKdQ4w+LmfvdB
         gt1356MOwOb+Jizbmx/UL0YTtgckdFsC1TnjaPGY3hkcD/PMstFX0zcA1sxoUUjsGz6q
         XKqqQ3OLBRxjJf0HWvO5Sn9pN98lhVgt77/O8Xcdyo6keZiztR27Kuzxik1DRgN45nfX
         1Fbpcjcv5lrrIOnDoSQ+15vrMIwTezhp6R7HP+SSzUmOi2EzWzT6iEqPLqrBNTBQutw3
         IoIz3h1aE/Z9NNznJHo4wDyq0vWOf5Mhz6ZCFaxMJkbzHHEhjwrfFAKTLajH9C7ZDN4i
         iNAQ==
X-Gm-Message-State: AMCzsaValdCrPtOsXLj/YgBhBwXorjRHcMF75mZx/VtvTEUzP0OHzBXW
	QopfHg3SdVqCevSQ/EJ5g2sTgi6g
X-Google-Smtp-Source: AOwi7QDT2mzk1L1sGLZY3FwYbWY1pYSthOFHzDHBfb7mfMyRfkMPxAQEq/fEJRmo939slVQpXAadDA==
X-Received: by 10.98.223.15 with SMTP id u15mr10228509pfg.115.1508200754395;
        Mon, 16 Oct 2017 17:39:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id y4sm12914368pgs.19.2017.10.16.17.39.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 17:39:13 -0700 (PDT)
Subject: Re: [RFC PATCH 22/30] target/arm/translate-a64.c: add FP16 FAGCT to
 AdvSIMD 3 Same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9106f459-c4fa-07f6-0709-b8e5aa23001f@linaro.org>
Date: Mon, 16 Oct 2017 17:39:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wmqfKs9pDsLI

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> -/* uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp) */
> -/* { */
> -/*     float_status *fpst = fpstp; */
> -/*     float16 f0 = float16_abs(a); */
> -/*     float16 f1 = float16_abs(b); */
> -/*     return -float16_lt(f1, f0, fpst); */
> -/* } */
> +uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
> +{
> +    float_status *fpst = fpstp;
> +    float16 f0 = float16_abs(a);
> +    float16 f1 = float16_abs(b);
> +    return -float16_lt(f1, f0, fpst);
> +}

Should be folded into previous.  But otherwise ok.


r~
