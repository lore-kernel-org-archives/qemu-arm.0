Received: by 10.223.197.9 with SMTP id q9csp3888715wrf;
        Mon, 16 Oct 2017 13:16:45 -0700 (PDT)
X-Received: by 10.84.211.79 with SMTP id b73mr9886665pli.214.1508185005280;
        Mon, 16 Oct 2017 13:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508185005; cv=none;
        d=google.com; s=arc-20160816;
        b=aa9H74BEngsImhSkM47rGd+EYp7vjFcGNJDMrVe64V33YUtQUS1lXTJ8Bj9Vkm9Lh+
         JfxTc7yo8WzZbHo+yRT2BHSLsETO5UqqfA6dGQe8y6Bro2cjR++SovZ+cMpqjhIHbMsm
         mJoJDmy2r/BmXCiBakrgniVpl8GPCkhuFC1i42zeUYpkmYGPASa6gsnKDHyoAHXz5BaB
         b9iSCGCb3wt0LPU3kDocBmRw+E+ZX5Nk1d5gwbET8owihOPFTsAOTKDj2NAkqcRRt1f+
         ZIhRhKaWtr/ftQ4qFfjaQhK8/5fwjLN5CQf0Ew8AUmIGldJGVG1gpMnnoFLxlLCpVDU6
         bUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=R8cPexmeK+SiE8cv8+KL5K4RSduPVwBv92gE9lQp6IA=;
        b=hcDjxIGq5PAHR/mLmegV8v9G4Jt0Lk66g3SfCL4Mg9VMWc7oS7Poi2qTNycMcaYigA
         9MienuZ8VL3SlT0NV9eDLMSQuZUcoMp4dpPl6xz4dcgJqcG0LJQSLARfFEdxkanzdZGF
         X1RhkzOwpPrvU7qStaRBvfZ1CSMp/43zH3O76r3FEjMDNZvjNQ5FY3u1EOum+/YIAfIc
         u4wps4CxCGo4z4bLa55dg6v0JYI2Yrg9C6+vV7Qy7Td/EWCEbKcXI5g9Wl/7NxD45VGY
         W0h4MHeppKH5gge1xw2aCDLMFgbV50HCQHDjqLZlgX871MyXpHb+VvLk+8t+4ggyXO5C
         8fLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9xMlYTx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d25sor2442944plj.49.2017.10.16.13.16.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 13:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9xMlYTx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R8cPexmeK+SiE8cv8+KL5K4RSduPVwBv92gE9lQp6IA=;
        b=V9xMlYTxS1YFaT8e+NPwc5+WJ0FtUOkEXk93KtHIfpA2G/9vMeea31bp3VKws7JMv1
         wS8ORXaTwftz5L3SS+FL42kL+FQYk4cNCXkca+2voBil8At1U+ujPqkJ54WaHcOFffu5
         WxIvAMsA/LX9AiqwJ53z8Mk3ck8GIGd+Kocg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R8cPexmeK+SiE8cv8+KL5K4RSduPVwBv92gE9lQp6IA=;
        b=g1sNJ++VKtMlpqcR1Hf5mnQElYP89XTSnQKesspY1Bb7vZC/bbRVECYkIES8Oglx3T
         XsopydbvP69GXIMeCvmFWf7o4J9Uxg4olidc13Hc5Jq5r2bBKHRdOwQQOKo0i7ORzSDZ
         gGKPSlnCyq5e38oLsJPiuNWE0fB7B6A8BMffYUM47HUSXtMNPYZUBCqLhTu3K/JWxvNp
         dtcOfUngXIwFErvgyH7EMk6aXmeaTJsTEktZvBz27tJULh79tYDayIW3Mmhc7AEHkuft
         bh0XMVHGWKosSr9hdftSiGZsG8Z9vZVliahmweJk50iy0+ah5CzJQ1oUWXlFyWQH/PU7
         9wRQ==
X-Gm-Message-State: AMCzsaVfMs5rJStbKyiTIcrYt516NemKaqRyvohZ3srMZYH9j/9vNZhG
	pa6iIQt0y7A762lldDonLBTIa+FhTnPRhw==
X-Google-Smtp-Source: AOwi7QDX4fUf217JLpgqhpjIbdx/2yfGx2hiunMJqvyZhA6tAl3A5T69WUxTDMhTs7b5KSbzYvSQEw==
X-Received: by 10.159.203.140 with SMTP id ay12mr10105850plb.143.1508185004793;
        Mon, 16 Oct 2017 13:16:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id l66sm15960610pfl.17.2017.10.16.13.16.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 13:16:43 -0700 (PDT)
Subject: Re: [RFC PATCH 13/30] target/arm/translate-a64.c: AdvSIMD scalar 3
 Same FP16 initial decode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cffab041-0028-801d-c29b-2c18fe9853fb@linaro.org>
Date: Mon, 16 Oct 2017 13:16:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ar3cW5cf7Bnf

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> This is the initial decode skeleton for the Advanced SIMD scalar
> three same instruction group. The fprintf is purely to aid debugging
> as the additional instructions are added. It will be removed once the
> group is complete.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
