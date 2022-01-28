Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp26047lfk;
        Thu, 27 Jan 2022 17:33:48 -0800 (PST)
X-Received: by 2002:a17:90a:2e0a:: with SMTP id q10mr7196856pjd.130.1643333627774;
        Thu, 27 Jan 2022 17:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643333627; cv=none;
        d=google.com; s=arc-20160816;
        b=R3MLSTqM6+kQ5+NmVFkJwqHiTJfZjeG3WV8h7knCuSPkNpeA2NGZdaRneCgFK/dn8t
         +Q5kGpqRSoOENUqUoHCb4V/IRh81e+FnPHtSoDOG4LglWnRnVrZ36v3dmgg1DPCi6cod
         5vVnwbYvAB7O/YpABmEh7FwwBnD9tVLcGnU1VVJ+uo4KvV/l/7h+oO7U6cihJK3eU0JO
         M4bNe4WkEAPk4fuTB76Z76tAs+OY/qcUl33szWTeHaIUFXfybEe7eeFiEER4xOZYhqNH
         lNFUyIegMmnHmrBnZxNqon/QEd0y2+MdjtPqdvGhNOd281CSMghC4c7gzvQuYMhHeCw9
         QMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZPp7HT9s7G06w/uVTiUtnde1QKDlRCBFIMx/3qTEdRo=;
        b=KPtedljpnbn+wL0dulF8itrS966tjE/ae7vC5/MB1ZM7/V4982aZwl3JBTT1VbOBLK
         aaJMEdi56xCF/B/YZxscyQtD4R1TNTblt65aoSm+t4ZwZ3j6bUbYt7ORzDnUksksaBFn
         llmNsObPX8G9e4Any2ERKOG7nBQ4pbpTpKt3egBcAzjRVlOeRAXTVr/omWyg5a3ObnTH
         EK7m8piGFb/PEjhnE7RUisi7LOYDc0x2FtSXgZbq5c8Gjf4Dn/k8bAgKrXSA7BC9zYRy
         4VxZSrtb3qW/UCD6nhDER9UUaefgdnE8HjmwwAbGannBpdBIUpM1/5lJ4ojmKSEl/gtp
         0Euw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQrhcUz0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d17sor1887441pls.110.2022.01.27.17.33.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 17:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQrhcUz0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZPp7HT9s7G06w/uVTiUtnde1QKDlRCBFIMx/3qTEdRo=;
        b=CQrhcUz0pVmIfBCIxRMueFBtJpIWEhpjl3uaDhpIWkXgzgaUGRt5j7pKURg3pV811A
         NUTPQfNLh30eEoSJHxmMRdXGzMiXG94nsPQe6Q6T89v6oE2shNzsYkk+6RoGYTqAayZz
         eu55xy0Y0y4fRNuorDa19cZd+NKteJED3QW5S8wB9doYxEhz0GfDg2NYQUykYW7fZ/Qy
         CHd9rhUjVeNedNcsiWNeYpbS0f6Gd1YdRNovlEjlwxv2BHc2k0A1l1WtEVnaOc7X1U94
         lyxljrCR+65hLTull2lZX/ELLX2bsbvUz1BFvJTG7RVUsKuu0GoYoglKBRG2TOV5LzNP
         Dtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZPp7HT9s7G06w/uVTiUtnde1QKDlRCBFIMx/3qTEdRo=;
        b=DC4nICvMLdoSB4yi74aNo1ieGANGk0seWGqfL5rfqbmjn66+Qh6seT8TiXcWS3zXp3
         ouZraG5v5FPghEtRJv7VH/DpDPTKkq0eyULyWM/iGC0Q7rVyOhY0Xqxaio2bGvrbm3ug
         pmCuE9mrQiR8ShwXDMsZJwM5ideEhK2N/f8yw8mBlufPCuWSbm8NzzUmoR49+B0dTcMy
         H+NBadp7MhJNIAcvQUYoqR+37U1yjj/EhmDePyEcKeIrGKDsxFa0YgJH0qUz3FuyXTEi
         TlQbkiuVhqaKAbXk1WN3kGvCUQGPwRY6+A8IAsEvtdlGZYczdT6M8NSEOTjvFnhRVD8R
         cGyg==
X-Gm-Message-State: AOAM531idYzmYJZG/pCnR87RmQwZGNVQg8dp9Ssa+KIXsBfUW3nN6GFV
	eYYct+7wkP/RZs2pnFmz5rvQCv29
X-Google-Smtp-Source: ABdhPJxyS4v7gECK2rIc9xtFYL3ouYmgfDDR5amCkOAYfESSdpHRmqwRv170pxFQWNvPx6NRX93q/A==
X-Received: by 2002:a17:902:c602:: with SMTP id r2mr3979484plr.68.1643333627281;
        Thu, 27 Jan 2022 17:33:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id z2sm7247599pff.66.2022.01.27.17.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 17:33:46 -0800 (PST)
Message-ID: <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
Date: Fri, 28 Jan 2022 12:33:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds
 checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111171048.3545974-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: dctlvSc9qSCH

On 1/12/22 04:10, Peter Maydell wrote:
> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention:
>   * change the variable names
>   * use uint64_t and 1ULL when calculating the number
>     of valid event IDs, because DTE.SIZE is 5 bits and
>     so num_eventids may be up to 2^32
>   * fix the off-by-one error in the comparison
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);

Could be written 2 << N, instead of 1 << (N + 1).

r~
