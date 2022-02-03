Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1586341lfk;
        Wed, 2 Feb 2022 20:05:45 -0800 (PST)
X-Received: by 2002:a62:1a10:: with SMTP id a16mr32808828pfa.67.1643861145097;
        Wed, 02 Feb 2022 20:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643861145; cv=none;
        d=google.com; s=arc-20160816;
        b=PNaGOtRrkvSd1SYjNzf2fo1L22XIXpJYR8L4dvMZcPkY6+A/3bBn7CcZwLpNspQtw2
         Wofd/hSE4cqBn2TT8paZvhxOtwkaRisrh9kvDD+U1mPU9edZoizZxs38N5TP8Ma5z0uG
         +q8oMVOWzF4GZqHlHaBtjZw/hsWLXWfY9LaViNaMZtITVXnkXHdY04T2j49sSTpguJua
         d5Rh4+a+Lt9NtEc+dTlewXYe76tvUyxeVC+3+TPFMhVpSYGIGB4Z6rZD6EcthE4harSu
         01TwDLmdwVqqkO3xWKN0cQA5wi9hFd0oyPWjPUlp2ef9sJvcV+Kp3jPX6iAjJ8jHMamy
         bwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yP+kFL94y5VaOzwE1oNnpdu4uaDtD7o3RBHfK7xpS7c=;
        b=zSf+lLuchOz44q+ynCH0RFxKzdfRbbA8x8bPm/oupmR0Ho3f/jKEzpDQBETMfzpem7
         QFOnsMAbXienY4ONGnAkjYIjPN65GPP7c8IfXD2Fryq2v7qMv2TrsFg+6Msb2HNIoXIW
         nchfr88L+CEWJfDKZR1oTECQfwTDAQQv1lEdGJHpKW2h2FHoPvso9+DejvOhIZgsPYi0
         3Cxpuwi8v1I0jC8ly9FJBFMxFgkepRg4ZI169B/O58q/5e1+5nvgold0hoRopiE8VU3P
         l7e7ofS4eW6KwjJQytmPSQyg9TyCAl8NWSQXOHd41NJkwUYPvhOESMppQiGxovs+l8Vn
         aC7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXCQxrkq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3sor9023757plc.176.2022.02.02.20.05.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 20:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXCQxrkq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yP+kFL94y5VaOzwE1oNnpdu4uaDtD7o3RBHfK7xpS7c=;
        b=aXCQxrkqO2NrVzHEIRPrQIOUnpl1UhsWjfJSPeGW/UJhnRHR/yTKGwc32hSe8Kp88z
         31EVGavOiQgTxIsiD8ciDPrBvgPEzukqnW43APlmCtJvOH1EXuhqWMuy7EW0ociHhLqM
         qbpildAtg/LJF+M7lwKUw7OO7SJo/B8w/zC8IwQ3tdHvhVAAKOtYtgaQk9ehqAc4z5pf
         VSm9fWbaZynx4wF2+EPVVGhAmKxqOIsU19uiAXL3f6DhwOR1hOgbj1DmOxexC9Q3fVlx
         7O7+FrZIamRfQ4o7Qp7jdOqgGIy1eJQNnorHjGXzqANqPr+1jU4hkyqTlrB4NrFt1xju
         AmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yP+kFL94y5VaOzwE1oNnpdu4uaDtD7o3RBHfK7xpS7c=;
        b=A5PnqoOi2UOrSjBuo+kvF9cDScvvlcXNHjrae51AcMfvMDBuqtEfrRb6uDqJFHG3re
         KfHvHw24bwOaCyHTrDelKkvGo+lgJthSS2e4juPl3K5aKaUZmkrZ0yZfFY+icowGJkkb
         ddo9E13OOV0O5wkLopMDMj8KKcGpGKix40G3syrqA03mmD9SsIwmDwP0zehDyEt3XRrV
         lh7WUkLf9+O7fSYmw/PFmQIiXE1eVX1Yxx4BgeTMstOjql12ksfQ9xUl+hOI1eFZUniF
         UQTYTfZJqE2RscYuRgi3CUIwALxFNQPeybOwbUHOCb1a0ahFbd8ttB32r3UACrAo0ROm
         g4cg==
X-Gm-Message-State: AOAM533jZeCd4UJFx5jeS3yH5Cal4qwADqUzPLDcMqgu5ARGNJv6ssd7
	Bat1+wRsUb5pkAvd8y9FvCwi84+z
X-Google-Smtp-Source: ABdhPJxaPSUbwH/WbWbdI9hfsZo+aAHQ4YXF3g03z+PFuEM0ajfOa1lZ9bbDbUTJC2+rEsA83VSRwA==
X-Received: by 2002:a17:903:2451:: with SMTP id l17mr34197987pls.84.1643861144617;
        Wed, 02 Feb 2022 20:05:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca? ([2001:8003:3a49:fd00:801:72a7:386c:deca])
        by smtp.gmail.com with ESMTPSA id rj12sm8119582pjb.41.2022.02.02.20.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 20:05:44 -0800 (PST)
Message-ID: <47e7ac52-b5bd-5453-52a7-2b5e88368750@linaro.org>
Date: Thu, 3 Feb 2022 15:05:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/13] hw/intc/arm_gicv3_its: Pass ITE values back from
 get_ite() via a struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jTUhplj+RH13

On 2/2/22 06:32, Peter Maydell wrote:
> In get_ite() we currently return the caller some of the fields of an
> Interrupt Table Entry via a set of pointer arguments, and validate
> some of them internally (interrupt type and valid bit) to return a
> simple true/false 'valid' indication. Define a new ITEntry struct
> which has all the fields that the in-memory ITE has, and bring the
> get_ite() function in to line with get_dte() and get_cte().
> 
> This paves the way for handling virtual interrupts, which will want
> a different subset of the fields in the ITE. Handling them under
> the old "lots of pointer arguments" scheme would have meant a
> confusingly large set of arguments for this function.
> 
> The new struct ITEntry is obviously confusably similar to the
> existing IteEntry struct, whose fields are the raw 12 bytes
> of the in-memory ITE. In the next commit we will make update_ite()
> use ITEntry instead of IteEntry, which will allow us to delete
> the IteEntry struct and remove the confusion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 102 ++++++++++++++++++++++------------------
>   1 file changed, 55 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
