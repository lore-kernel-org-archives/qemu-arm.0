Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3472106lfk;
        Sun, 12 Dec 2021 12:31:31 -0800 (PST)
X-Received: by 2002:a17:90b:188e:: with SMTP id mn14mr39724782pjb.91.1639341091671;
        Sun, 12 Dec 2021 12:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341091; cv=none;
        d=google.com; s=arc-20160816;
        b=YEMLyr742SyAWDSripGANyfwZ5MVCNlHsEfpY/s2WV10d/bh8SPtOO4EL1DFk+IgnJ
         NxmMtP6I9mNiguEun6pQfrxBZDk5BO/Qdqsas0UXg0YPoUIiATr8nIJV2z3jJrcFiZ/C
         8VAbRZuxBU7/bBtZ/jRer4BesneNXswDTWVwfRJL0OBtGoYEM5CaSRz1jzoqFjW5R2Py
         EU1yeeJ092Ua6VyCRuIokHKnS5oDn0ImHZsPLmLROHxwuFQRokZq7ozHDYaQFU05xxEs
         b4w+AdzpQYaiDs015T7hDXnylwi943H31SMpG9Jh99FNmGRfbTHRu/wXajsKdsRpk8UD
         pClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IMh1HKuTCrNTPjLu4ZRuSgPRr0bBwS4tyKbnHSOVO+A=;
        b=l+l+9wUDBjAlhJRI+Hh29y4B2TkJV89OI+CaIisAoczHwVXd8s8bd6hN2RwTHCaIFK
         Eqi4xZoL5Ycg5X47z77M3twAHMG2U6es+rHlrSWMFIa6/aIJP5F/TidTHOIBBL2gX5tP
         7AyLxbL6h2Qg0RYasMUmRRM/sRva4Cy111iLcqR18Uk5tPw4QVzVnz4TwRSBZH9ReMEZ
         XiBtTwfrvzlJ5DNlKliIW4Yb8kW6Hm0iAPR+BjdAj3fBsSiP8VsFLnNCkt2SO8/9AbBz
         J63ASzRioqgGpccVhGmgJut0segfZIJZIPNtO5Ifoh4UI5RRjFeVu8+9lgYnfShms4Iy
         tATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToOa+wHp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 198sor4145552pgc.69.2021.12.12.12.31.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToOa+wHp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IMh1HKuTCrNTPjLu4ZRuSgPRr0bBwS4tyKbnHSOVO+A=;
        b=ToOa+wHpYwC3Ig8Gws2+0VAPYhRGz3RMgd+/iTJHnekG7tU9ZEyM8vI8EHU72TVKjU
         GOT1pGL+rKduvRcPslgly20hSWbh+AOKFd5e1bohxTi8ewOHmOGf9E1l4561LARhMJdW
         LwKZfYw8c/vqKZHBXTT7bJOVTf3jUnJXVCg7CxZbQf+u44xMCDl+4ZJeVKG0SoYPY/yO
         GuTCdYWGlQG7PMSXYsmkFpmjMTt+XEXOkrhmYA6lfTdxDkNczUsdJUsCOzC1gakZPqQF
         j1OLXnn7T+1Z1QaHX4QuTeSikdJGqfmJ33zPgFHcWDWU+heIbN+j/1ISr1/tB92ztgM1
         mOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IMh1HKuTCrNTPjLu4ZRuSgPRr0bBwS4tyKbnHSOVO+A=;
        b=TpvcJo939Xw7CKFyhoVe9wnKrUWoxFqoxoU+AwQG1Y3Ikj8LOHnDBktdd8wbE/WgE1
         7J8RffzrSzmrwNoxGqx4aftoF5PMdUgA9j7hGcCEuACeLAJb4+1JD+emDIqLRAbeDnuw
         2449va5XiB2zQpfXwKtzdOACMFEIEFPfReBDhzjFVfDUl06JHWwe213Ppwq3tc0a1cvZ
         sVdJNe4PLMx+3UGjzTQUw/NWf5TFN0F/+V9hi/Xq3QLW4JujkKJwOMtAGUK9fzgeUn0K
         oAVY4xkh8a0nvwhNRVxxd2/lTNhd8NS6SD77qiYE+VuySRUf8zRtuOSMmBI/7XktMXfU
         15OA==
X-Gm-Message-State: AOAM533ov5cu0dnj1dSv1A3rLV+DILLaMJlWXwE+ilWAQREJQ2uAXskV
	8O/zgLqlZ+zBUMAIEhXg7QfcJtTMl9rwlSrl
X-Google-Smtp-Source: ABdhPJyHCEn0Z9G182eXepV7/5C8C5cUqp2q7epcQKPWm+CHbqwrndEOJ8uZuq9PMUWhwCbkm96RlQ==
X-Received: by 2002:a65:5c05:: with SMTP id u5mr46230185pgr.471.1639341091211;
        Sun, 12 Dec 2021 12:31:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id t191sm2645611pgd.3.2021.12.12.12.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:31:30 -0800 (PST)
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d30f706-538f-f477-f9a6-f3b5ce4f38ab@linaro.org>
Date: Sun, 12 Dec 2021 12:31:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: setplrJAdF5U

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The DTE.SIZE field is 5 bits, which means that DTE.SIZE + 1
> might in theory be 32. When calculating 1 << (DTE.SIZE + 1)
> use 1ULL to ensure that we don't do this arithmetic at 32 bits
> and shift the 1 off the end in this case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

But then you assign the result to a uint32_t, so the patch is incomplete.


r~
