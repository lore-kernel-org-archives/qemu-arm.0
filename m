Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3478900lfk;
        Sun, 12 Dec 2021 12:43:31 -0800 (PST)
X-Received: by 2002:a17:90b:4b09:: with SMTP id lx9mr40603111pjb.100.1639341810975;
        Sun, 12 Dec 2021 12:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639341810; cv=none;
        d=google.com; s=arc-20160816;
        b=wVp/hVFFznMfgOd/V9diPUluevoQIt6fa5j/5dammS2Ocyjj/gs3ZSBMLfRWCPe0/a
         k2LYk82VpPzk6YghqUqqa72dYgh43JIwc4vYBJd8Bq1P7wJMvUVbwucTarjTNtfB2dyb
         TYxcRWGYDKI+78gungyqxazsmNXNtj86xhwZmfgzdFyIAONC/Kn0IFywabBHelMzOXdl
         2RRgKmZP2mj0Z462c+HtbdOHPHJh8zXUY01H1BbY2PWuiQux9KoAPE/3ojUNkRw7EobB
         SS4VXbFb+3ACqeZil3230INz+VuEUUFWu6NXOoZo1oag+o++fdi2SEmqN0aOCwQBuTKf
         dWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=24U4qXKInjYeICxUXdhiQPFvo1gapp+rEvu4ctBipvI=;
        b=dbzeYCcdIk7sv/7NhaQAkss17MbnWbN27yQiriSAJfNOLVAIqrLFjmolUTWwwD4HI8
         AbEQ+ERtDVmI0rNA7LOrzQCbXWp3EbBYc858llEQUUreqVV/8e60g+BscRu8TWXEF3dC
         fEqmEI8gnK1jDO/NVMWJMx8l9Kow4PYxuezP3cgdw76bfJwQj+wWf8HIOm3JcJpWF2lg
         /yMIOSS93eMN3CCXHPLreaQBQWwdbocgHzOgfZTWeHykJ8sv4ogS4IY8i2P8m8jXx7LO
         tSdi1F34hUv3I9vWxzlEHDbXUbtpdL/3IYdDKk3UNG+T8uTZPMPIjlrSGSUklFTL1U1Y
         w8jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONeEV83z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e15sor5458559pln.57.2021.12.12.12.43.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 12 Dec 2021 12:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONeEV83z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=24U4qXKInjYeICxUXdhiQPFvo1gapp+rEvu4ctBipvI=;
        b=ONeEV83zNfuDVxFFAy36IJDxRkvLY+zEO33skCmw9XC8ISxrjnr7A8hxWPWzH5xOsg
         zt0PJCalKjZY/DIO6yGge6D/RFJhXAPXnu+HEpCOPhJN6HlTbMuN2hZ0kDXvIno1Kc5b
         c4LpVhxAL2NbFUsW2tZLGAFKuQNZ1sBKiT+8PlcQwnVSYMgMoRbHx3GYDAW0WThIPzyO
         iplYsSCZG7ZfrUrPzypIYrgiyQhHdwh7WPAOKGnLj0qc8qktkk/nLOgCj8HxcQYKS88M
         3OyetDJgo4+RcFUgmFRDFOkpj0smuAaZVZuO3kOdxhF0LtXvps6D2ue8HrniOeaprdjr
         qrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=24U4qXKInjYeICxUXdhiQPFvo1gapp+rEvu4ctBipvI=;
        b=qX6gXwJJRujWrR3lMgPDS28knzJpMKeTn1NJdqsNudU32jsuFgjKmHLfD0r7+35Vry
         Rv3TIK/m6dLlp53oBtD5v1b9HcS/efUUYLLS6r06G8ljBd0Qv5qYS2X8XGcSluiXO06S
         WhrOMIBw5hz8AOasrxGC4ZtTnOJ8Dwrx/GP4cypkZOprPaD87BwntoNQNvQgubOjf4Cj
         VQTqXJ4aIOMTIywvslaq2c7dVzP/MVUZ0v0rkrAKscESF7KtcC45CUVLPYiPsUJCfnT2
         qW9xBeTuYNGWCy4gCTVrduy9K5fuqk4dml89rgw7nx230qs4vWDlzRXGCQY1Jr5HBeec
         bPLw==
X-Gm-Message-State: AOAM533EchVQlgQcwJqVXUZl4t9/DiGbaYSEwjyC0BFyOGNErqbTFHuZ
	1qqBEvFRkAo2ZPcCQ8cXfepRydLwD2sipVSF
X-Google-Smtp-Source: ABdhPJy0MxAynF+cJG1FTpEn/M7Pd1uF7SzceFtcKTL0gjmMwMlPd6ZVC6iLfBE7pxMcZ6vnVBn7mA==
X-Received: by 2002:a17:902:a584:b0:143:c2e3:c4 with SMTP id az4-20020a170902a58400b00143c2e300c4mr90125108plb.69.1639341810494;
        Sun, 12 Dec 2021 12:43:30 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
        by smtp.gmail.com with ESMTPSA id z8sm8080585pgc.53.2021.12.12.12.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 12:43:30 -0800 (PST)
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
Date: Sun, 12 Dec 2021 12:43:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: jXegshFPhYEO

On 12/11/21 11:11 AM, Peter Maydell wrote:
>   
>       if (dte_valid) {
> -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);

Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one 
bug by not changing the comparisions, but changing this computation.  E.g.

   max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;

so that the value becomes UINT32_MAX for SIZE=31.



r~
