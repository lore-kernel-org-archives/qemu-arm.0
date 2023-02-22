Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8405ejc;
        Wed, 22 Feb 2023 12:56:06 -0800 (PST)
X-Received: by 2002:a17:902:f68f:b0:19c:1433:5fba with SMTP id l15-20020a170902f68f00b0019c14335fbamr10824190plg.0.1677099366568;
        Wed, 22 Feb 2023 12:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677099366; cv=none;
        d=google.com; s=arc-20160816;
        b=AsSqKkv4PXkvSkUNfj4NDSp4b8gB221vwhUWr7NwTK3OLfKQf5gbhoDzFaDXvHfTEJ
         jE2iW9hEW4pIAOnmJf8JEaDu4mbgAWPWpvcV1drwbT4Mk246f18NbAfauv81hVdRq/46
         mHcL1zkzKaSu1H4FkIk7p4q4YE5xsXdxxgs2lBa3C3a1kN1yNJwFWiZAgHLzo0oZTDSv
         wAj05sI4NxXyB2n/Jn/S+DAS5TFq/415jIJehDpi2Q+v8D2Qt2SjwT6SsMQFdPq3E+FZ
         xjS8xe/KdchRTdBdJEA1GrMp7Izw/rmsaTRGritVPLbVGoWouZIzFwELhvmM4ghOaZ/p
         vz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hm6gZqMrVLJHNBocnV8Og/i/0BEfwFH9ls5LQ1lmtNw=;
        b=Bt1kSmq1Kdmq9AnxW8iAcW+8IiHYJ7oEPftz1crsCiNiOvnG9PUvCtti+hlEpa6O2x
         gAcgT/MpatCJuZMxeqDRg9xwm63kKv0Lxgb7F+GaH7/9SSWs73PQeiTROTuybbrOrFyV
         zAdYFOjhU+aokYNGls8TqUh0G5HMCsTxcNXNIp9s33skwloPZE5+Q0bYJWfUwInU7sHz
         4dCdP9ThacSRgE/7iSkcTNdRcNGY6pr6lNR0sTUmFOEjHkriNoxMWOj7AwpK0hA/F/DG
         hIVkrGwAev3O3SBLdKQf2kkahd9ucjzsQ2SqyQC1a0KmRD8c+MbRxlRVWO6KjyIcVgA0
         XdxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYTVtrT2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o1-20020a170902778100b0019c8ed28808sor3381740pll.143.2023.02.22.12.56.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 12:56:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MYTVtrT2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hm6gZqMrVLJHNBocnV8Og/i/0BEfwFH9ls5LQ1lmtNw=;
        b=MYTVtrT2Kuq2AiiBploMAYsdmcmrPSOG4qnP3O0dGkxqfUHYpUyZ2ajDlRVlPTcp0b
         +tG7Bu/aptkKln4ywuzYFt6sSXQYyh1n2hxIWs1XsUln5pb65aywEoVI1kRoBDBQyKpH
         bjN3E6TrEdD878UXEDVRWs7Jpu5+xkrpUNYVRbDijF+5lztJz+86NX5xyYbnB1+asHck
         ib1VL9/zJ/lC7RBV8j5LMSUxdwfKvew4mXY/FcK+cjv5jZwBoIxWHEP/OJjfSCYkmSfs
         Q44eZ5AyyFKAttuGcqhDUTId4umJYNtL9ggIggyr05wWM8JX5guvvt8SJVQS5/cxAYSB
         qWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hm6gZqMrVLJHNBocnV8Og/i/0BEfwFH9ls5LQ1lmtNw=;
        b=B0Tt8EZlB8IcZ9+Y2qMqCCNPz12wtdSShVcnJIT/+TSUzzSnHsGWNheEnwmURapezT
         YuhRTeagTpViYUcfLnH1yFUwRzJXD8dK2zhkscfm0bWpqNPB9oN2AUV103UNWdNDolcR
         ZVXzszgoUn92oatd4gDbkoxZn5YP/YY7ssFXfjKEBYC11mgYxWxbA5hWX69tf5EEJBHl
         iqva1b5B6EA5qjZN4z3QlaHv9S2TTqSSofUP6d46xCYyo/LU/aAl5zpzyKqv+jjQkIef
         tEqOXZztzKglb589x4Zhp7oGeGmrtvQZgehyGlHKESAc1FuQlFC1h+5JSyMdd2RUVmT+
         Zs7Q==
X-Gm-Message-State: AO0yUKWdQYwnZ6bZbR8M6YLPbgujECyUgHNqDvfTwTIWwY6CRTSyA8V9
	R+I5rcFwCV96yl9GCjNA8MkrjaTG
X-Google-Smtp-Source: AK7set/d3+RkOy3uZaLMl9uRqAllUhKfKjI+lgUvR3QpsCDDLI40KSmf9WHwaR5ExgX4Jlm6YLQnhw==
X-Received: by 2002:a17:902:ea11:b0:19a:b6b1:ca82 with SMTP id s17-20020a170902ea1100b0019ab6b1ca82mr11086528plg.10.1677099366006;
        Wed, 22 Feb 2023 12:56:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id bh4-20020a170902a98400b00192a3e13b39sm5708639plb.264.2023.02.22.12.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:56:05 -0800 (PST)
Message-ID: <e3662d65-5f41-5d78-b7b9-1cf5a39ae5f7@linaro.org>
Date: Wed, 22 Feb 2023 10:56:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] targer/arm: Inform helpers whether a PAC
 instruction is 'combined'
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-6-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-6-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CDoOjtgOQNwe

On 2/22/23 09:35, Aaron Lindsay wrote:
>   static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
> -                           ARMPACKey *key, bool data, int keynumber)
> +                           ARMPACKey *key, bool data, int keynumber,
> +                           bool is_combined)

Add 'ra' argument here at the same time, to avoid modifying calls to this function in 
successive patches.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
