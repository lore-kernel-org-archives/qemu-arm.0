Received: by 10.28.71.27 with SMTP id u27csp929615wma;
        Fri, 23 Feb 2018 10:47:27 -0800 (PST)
X-Received: by 10.101.88.15 with SMTP id g15mr2109143pgr.383.1519411647732;
        Fri, 23 Feb 2018 10:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519411647; cv=none;
        d=google.com; s=arc-20160816;
        b=vnsAsGvpssUmiCgejkVBq6K0hereGzx5vKbhi/VAjjWZOm/gyRxaqM/fIopoSmezNC
         4WIa8R05dn1E439g/ALR5hmUX2okSGNmsJV2LEpvtkpdxM7YzUXQSNopigsXY1Y4ra0x
         t+J8/WWFY8gFNUoWvS+f+AQzskb+CezHB6oQoos0X0gm/GB7qhvl3oRqVXfFlCX+50Uk
         6AoW5gMhMB5d2QItsDwzPj/221PyV2JkcodvqCpn89apPeQSRzVfbveV8ceLhK2WVcuO
         9p2A9mU0xSDkBFHJeT1gD4Os5TAmXsusQjdQXMm5jHgXj1ScxzdNFdsx1PYqpOQWgj5A
         cQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=96fIh6Alq0LxXBW779J5D0hGKe3zjM07N86wpyrIvtI=;
        b=ZSNEAlJVa/aKR9KW/ERgOixK1Dc2+0FQkRVF6IxRmnPe73d/D2Ftwo/3I9HaA9Lnyp
         nwRPEhYvnTZSY7x8IxC+FqflrY9dMx+IM6byhismrRPpDMZ0+whoLgl6SIkybZI/Q6cR
         2A3g5YHO/f+6fhxsSJHKK/JpV3rq7y+OtRdsPAL0YoXbiR3iXdp2O1wxiOkol1bWGXvA
         GWM894TXjwr0TDLXCUj7Vn+YLlGwn7MlJ1alPLLWw/Q5XkdLX5m0pmniWDzF8JkqaveV
         xQQfXVOJMxFOLxop3ZJ2zfeHlhmkNI6YJHufw8T1LlHlHvFv3ls26SHFhQvdrKjsx4xv
         WbKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLB5GK5h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f9-v6sor1021840plo.115.2018.02.23.10.47.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 10:47:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLB5GK5h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=96fIh6Alq0LxXBW779J5D0hGKe3zjM07N86wpyrIvtI=;
        b=gLB5GK5h4clcLwQdXHN5aWYd8+uoFU9LjqZTT7yjodse9dPY8ujL6dEWuRePHL1FxQ
         QEqZf2NVdR75wsKIm7VnSCIieYCh5vOCrMHiXVS5ue3mDBWR4yvRsMVwiQXFk9hIBCb0
         DxWvc2bh0wfJYjDFUFQJ2ATmD83JXN/rUwz7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=96fIh6Alq0LxXBW779J5D0hGKe3zjM07N86wpyrIvtI=;
        b=AVcbEixAgvcTUqKWX6QC2rGt/TUjeuE9b+oncsu/g/1H0uU8IeaJhTWXqyCRbWQGwq
         qQpFYWOEu0nqLktAnvEsCvwH4oMLtxFRAop+gOy4j74O6cZanc9q+vaCMbVNMT1tDb/g
         yoEwxBPo50iIOuwdG5c2Fpwl7TVwAnuFCBPlMMjFBv/65gwoShyEe4jBggRqg8zbxQd8
         h+d+3e/lLizbCix6FZK08TIhC0xq9v5wz7T00Urw+praxhX/G/q0Jsc/w0JirYRfliEP
         YoA5Ugy0VWU4z8cwqZedmU8DZO4frJuU1NkmGj/1bch+A0hfoNGbUVekTaFUO2pKO9fy
         DJSA==
X-Gm-Message-State: APf1xPCRg+E7hQaYPAGaRzr3hQSERVwQzg7IJCJXZ4w+k/6ptnOp3pNO
	SJTZstQY9GoSpdiQgEvMFSy4QP4L
X-Google-Smtp-Source: AH8x227Q9lD4Xqjou/YZ5Jp9662bb9b/oq2AcRSSfeAmo1rqI25n7NayHueaQngrjZdnCE7STBIlag==
X-Received: by 2002:a17:902:aa5:: with SMTP id 34-v6mr2585468plp.429.1519411647132;
        Fri, 23 Feb 2018 10:47:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id h69sm6427847pfe.97.2018.02.23.10.47.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 10:47:26 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v2 01/67] target/arm: Enable SVE for
 aarch64-linux-user
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180217182323.25885-1-richard.henderson@linaro.org>
 <20180217182323.25885-2-richard.henderson@linaro.org>
 <877er3abex.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cba5d6f3-a3bf-d799-ee79-7425887421c0@linaro.org>
Date: Fri, 23 Feb 2018 10:47:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <877er3abex.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ox0MeNqTicqg

On 02/23/2018 09:00 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Enable ARM_FEATURE_SVE for the generic "any" cpu.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/cpu.c   | 7 +++++++
>>  target/arm/cpu64.c | 1 +
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 1b3ae62db6..10843994c3 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -150,6 +150,13 @@ static void arm_cpu_reset(CPUState *s)
>>          env->cp15.sctlr_el[1] |= SCTLR_UCT | SCTLR_UCI | SCTLR_DZE;
>>          /* and to the FP/Neon instructions */
>>          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
>> +        /* and to the SVE instructions */
>> +        env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
>> +        env->cp15.cptr_el[3] |= CPTR_EZ;
>> +        /* with maximum vector length */
>> +        env->vfp.zcr_el[1] = ARM_MAX_VQ - 1;
>> +        env->vfp.zcr_el[2] = ARM_MAX_VQ - 1;
>> +        env->vfp.zcr_el[3] = ARM_MAX_VQ - 1;
>>  #else
> 
> I notice this is linux-user only but what happens if you specify a
> specific CPU in linux-user mode, do we still end up running SVE specific
> initialisation?
> 
> It seems to me that we should be seeing feature guarded reset stuff in here.

You're right.  On the whole (probably) wouldn't matter in the end because the
actual insn decode would still be protected by ARM_FEATURE_SVE.  But even so
we'd see VQ=16 in the TB flags and do too much work in clear_high_part.


r~
