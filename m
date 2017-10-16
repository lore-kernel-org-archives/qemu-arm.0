Received: by 10.223.197.9 with SMTP id q9csp3969133wrf;
        Mon, 16 Oct 2017 15:08:37 -0700 (PDT)
X-Received: by 10.98.219.134 with SMTP id f128mr10001274pfg.85.1508191717786;
        Mon, 16 Oct 2017 15:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508191717; cv=none;
        d=google.com; s=arc-20160816;
        b=dCQc1VL5RhlZQa21H3xl37ILKyWWpCwYGUfU4cXhLeqek8tVgEpcAFlM6UVoUjLgnD
         Dm6Je0ETHpk4zZOiYeaAV3SaxD/B0yZB4tZwhmUCi06KCLXJ+gP/ruDtoJwoiWXth1Tz
         SCFr2Hj2+qMlKFOWFRCWZp9/t0T9XkIxnrsG1TxpIEdPIaVo7DZCbflGhFfeWtzTsfKr
         EDK3wyi/dwZYUjJaNMblBANVhu9gbWC/s++8pMC+WwXvhjsbH2EYteE/DwCZvT1bxKaR
         wUxOml/FoUlj5ZxvMq0+c0yY09VLu0siLBEnIQwZoHUI+sbrr04u3Kbq5xct+GDtdyX9
         Ti6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=t6HhuQuruI/+RhRcLLIfM7c6h8KjzCAqwaa3teyU2gc=;
        b=xVjBMstu37Ed4hIclooojTbxPw+NrdUGn1ygcvXf9MBXEdo6oUcTbQPZyqqrH7Bmaz
         h0zrXzGx12xTuT69AZV6dlozIOjwjhoGD4CO1VaMFLoE5kCo4+Qcibh/QNsxR2BC4UxO
         uTIQhQrcgkIjPmtuA02RC7uX+nZDN4eGfcaz8BarA3n+ue7te7bcPD1uTYhKb+0ZZXsD
         +d0VjQrtvUkUt3XvYPL065SqbjRvoWoytMDw4nDxCV9dImvj5X9sKUB5woKrYS5v/vxF
         JIosnGDwXkMu/lOCwXxtWRC14/L8VtEjGW2FI0UCKI6r6qEk6kuyp1E5rQPjKQ/Dlwol
         KsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilzVL2J9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 33sor2503756plo.80.2017.10.16.15.08.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 15:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilzVL2J9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t6HhuQuruI/+RhRcLLIfM7c6h8KjzCAqwaa3teyU2gc=;
        b=ilzVL2J9ON78G0Uopl+5Jpqeczk2Lb9OuH1AP7ox7+SgPqTAbEjWw8T6Bwg0Nqqo0O
         6Llb/FrPEMgQNey/v5NfuPGpnsayoKOcvziqV5k/fAKNBLJzbmV1kswuatjt315jyMFf
         kJzcDXBTJDG5Seu2QOgvxxVzXGRW86JQ+vdx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t6HhuQuruI/+RhRcLLIfM7c6h8KjzCAqwaa3teyU2gc=;
        b=cR53KxDtKUmiTjOxRT0RO7sCAZdHIo6kC/LJ9CqjWd5kCHMMEzMbcUlDbVlf9DO7+m
         9BwNJq1YBI3VFnSwvEwbwBpLu4OiA2Am6sof/FqcSu7BscTse7sDSt3stkLDjWqKEEq1
         eXihX0y6hvlW+MT6NJMsSMlhnsiemQjWnt9K6bxXGtL5Q6afPNb4k0dJfqlPyGaOc5ri
         YHXujXc3x+DhGEEXz0eRIWEAcTo1RyxvPgZE19oLCi0MZq5Ed4EwnmXhhkM+cVXLefMo
         c9dE/QvN2VK1BtwqAe4nbirikn3KhjLNyR6mm8q2ZEO2h5oX4a0zFfgGaIFnlKEwMjRL
         CySQ==
X-Gm-Message-State: AMCzsaW6h4A9Qf12GOOPZ+mLEf6Ig81fICFMv9g6Fa0VppHMsfgy3ox2
	PYB9QPaQa7F/CeaPzsbVocayFmHZl724ow==
X-Google-Smtp-Source: AOwi7QBYBo71Wov9VtXSk3I1Posv797NjlclQZ1HoQO2q1aHoMwu2K6WuePLau5sM5WWD0UeOW/EKg==
X-Received: by 10.159.198.11 with SMTP id f11mr10128955plo.290.1508191717358;
        Mon, 16 Oct 2017 15:08:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id m10sm13989526pgs.77.2017.10.16.15.08.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 15:08:36 -0700 (PDT)
Subject: Re: [RFC PATCH 16/30] target/arm/translate-a64.c: add FP16
 FADD/FMUL/FDIV to AdvSIMD 3 Same (!sub)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-17-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbd163be-fd12-9b58-c8cc-34f94c742e25@linaro.org>
Date: Mon, 16 Oct 2017 15:08:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: j1h8w8ISEgc3

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> +DEF_HELPER_3(advsimd_addh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_subh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_mulh, f16, f16, f16, ptr)
> +DEF_HELPER_3(advsimd_divh, f16, f16, f16, ptr)
...
>          switch (fpopcode) {
> +        case 0x2: /* FADD */
> +            gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
> +            break;

Forgot FSUB with case 0x12?


r~
