Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1552436lfa;
        Fri, 4 Jun 2021 15:53:26 -0700 (PDT)
X-Received: by 2002:a63:a48:: with SMTP id z8mr7111920pgk.371.1622847206435;
        Fri, 04 Jun 2021 15:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622847206; cv=none;
        d=google.com; s=arc-20160816;
        b=ptTmvNZBPqjb9QCW0n5fkRCyoc2C+EhJA2lO5azsdOx68KxKpYq3aCOS8hDOIg+Svb
         Ved8XVFKOe/Ll3bsqRsp7qR4dkRENxSfJjHb7lK+2G7kI8UBtaczWqIB9lUaaW6eBg7g
         ey3mV2t88CrDLmZixc7Fm0IsmPLykFVruHlX83cM0/T1+GxxdDUzHeFOkg00LAf3vaZQ
         nLdfzbwDUoF1O8xrumGRHJcN+FAH1h5ySlR00c6qWSmYNX+hJ3GnHNBVUQWecVDzOU4y
         6bv0Pq61Cw4VlwMvNpiFHrsyswgQfGNp4bEdOWOpFkRjxdOQbde2M07P63TjIdpWqLPd
         bJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=jcLPWdnFVBxOXZ14nBEnxzUJHDMadqROTqpvCtQdgO8=;
        b=HYUUOEMGBmPIFzNPvD3kKcyzjffRDCUYdd5r5V3Mk2debqLUt8LGbx/8tYl6kPmRcx
         9g9NweqiWMgPJ+AkX2KPATXHpKYQ661Nh3RtqAxejpjU1WSR8Bm4ewfMnQxxkAl4BxPb
         NVpK+Fn0NH2NnEUkeBtb8rrBeZ1ofw5CvXELXlr3qfGXexGVjuq9FvWx3J5/E8bqNuBc
         CaBswwquy6Z8U4yOx3Vt1G0IEdYgKWNjhHgO79TU6mwr/VOTKqsYLkzuVTaDnxXTLhk9
         fVD+4Z525UzCACzAP1EkoS21VOSVbqU6vZ0Fz5Q1lFmJlpb8kVlMcDMNeMf4pSE0vBb3
         7oQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+Wr1ooD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gk20sor4219216pjb.0.2021.06.04.15.53.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 15:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+Wr1ooD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jcLPWdnFVBxOXZ14nBEnxzUJHDMadqROTqpvCtQdgO8=;
        b=Q+Wr1ooDKGU+jm+bQgbOXbM/sksFEg8HL4OoZFe/2bWFOs4drOypPGoMm62hFy9WQH
         Cdjg0wKN8t4GofkVJbCYm9a/mTvUyzpCPLKP/OSkZbHkrpTq/TjEOf7x8ZaduaUACqq0
         hpSwGlHC7MnVBAfwoTdZqYIfCOQwWMeE5EZEneZOadL3liysqdsrXfFGM8M05UD5QdZf
         75cGp7AuR4fM0tojDd8G3VbUhN0CA6ajkNqFpSKZSSoQ5D6ibaOgPyskpFLFKRJ+A7q4
         wGGASXMzl3ifdSJrIZhDsqD1mb12g2cnkHjxw7UYMzKPDoEuo/Ios4RBQPP4xjN0Z2yw
         8bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jcLPWdnFVBxOXZ14nBEnxzUJHDMadqROTqpvCtQdgO8=;
        b=r7N83lqBkRTBf1dc6EmExyOaRm+XPn08BX/+3F6YnvNMdsWCrYLGl27dnthkHcgwGG
         6lgTyWEvc3WBNc56qHew0pfgRM8/qLU4RvPgcpP2986hKYDbRMjmqGIGfOaE0JFZfMol
         NPcf3Ni4Ds4pgVKdnRPCNu2AQH3JIAbdPeHeG3Xm0r0vIMZCHdJR/eySNGeD8VsabuLe
         KWT1HHYrUYIPMLimv7AhBxon4YG9ie4EIp8UFMCdZihZlDNYdaylL1Wte/nGDK18tJA9
         c7nhxCbGwjIuuJkSnS+T4y3fm3NECPBSZfZFeWudMQej06XyERGCbnbztXvtiHA8vo3v
         pQqw==
X-Gm-Message-State: AOAM5305C4mWZz2IN2BudN+1w3VA5Dnh0lvlwo9+DX0ZLGIpMb2WZeyn
	Ucpq49NaLC38kvRVt3smlJWhWNe4
X-Google-Smtp-Source: ABdhPJyf2IEowZheJscO8+8iezEKnrRHeq7g0IopPAAY+TCIlO+FM6KI+9eWD/tX54N4a5g5mY/+LA==
X-Received: by 2002:a17:90a:134f:: with SMTP id y15mr7343757pjf.89.1622847205805;
        Fri, 04 Jun 2021 15:53:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id u7sm2965475pgl.39.2021.06.04.15.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 15:53:25 -0700 (PDT)
Subject: Re: [PATCH v16 41/99] target/arm: new cpu32 ARM 32 bit CPU Class
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-42-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3059960c-02b3-c50e-9248-1afb534f0ae2@linaro.org>
Date: Fri, 4 Jun 2021 15:53:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-42-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: U44+/ZrBPpwd

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> In the ARM CPU class hierarchy, the ancestor TYPE_ARM_CPU is fundamentally
> a 32 bit CPU Class. The child TYPE_AARCH64_CPU overrides the class to
> make it a 64 bit CPU Class.
> 
> Explicitly put the 32bit CPU Class implementation in a cpu32.c,
> along with the 32bit CPU Class model registration function.
> 
> In later changes, we will further split 32bit and 64bit code.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-qom.h   |   3 --
>   target/arm/cpu32.h     |  28 ++++++++++
>   target/arm/cpu.c       |  55 ++-----------------
>   target/arm/cpu32.c     | 118 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu64.c     |   2 +-
>   target/arm/cpu_tcg.c   |   3 +-
>   target/arm/meson.build |   6 ++-
>   7 files changed, 159 insertions(+), 56 deletions(-)
>   create mode 100644 target/arm/cpu32.h
>   create mode 100644 target/arm/cpu32.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
