Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3846160ejf;
        Wed, 10 Aug 2022 08:33:57 -0700 (PDT)
X-Received: by 2002:aa7:9637:0:b0:52d:b082:cd28 with SMTP id r23-20020aa79637000000b0052db082cd28mr27749546pfg.43.1660145637678;
        Wed, 10 Aug 2022 08:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660145637; cv=none;
        d=google.com; s=arc-20160816;
        b=m5rzR0k0NyZc/I4j+gvgJBYkbU/HeC7Q+vNjahRrOpBMma9+mQHMgYlUoIn2rOMToz
         Rmw9tgVr/pwywmdajGyOncJQt2FKlpMUORGEkyPYCelcxnnO6xV2W+n3e5yu0yGlgcxY
         O8LslQV7GPrG/zgNEKtADHeS/wsJJEkm7TyMcDaniECvMZ3lHRw8fEgRa5x2rQT7Co+o
         HMXezntQ7/xN30rERYtSzrNsR0/bumJT8AopNsXMEYZ52vw6rXNNDFy9yR7lPcQcyNcY
         FxzdOr3m+DEkw5FXdtCDXq9SLCeGWDocfuFDyO5FpV5aJLnca0flCLMjaIurgyDiF4Qb
         DwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Shpi7OSQIlO7SdnT4HPS6c5P5Dd3pS6PG/YMmkGP+WY=;
        b=G1H1dVGJq+WZYWgtySJSy8Q4yMETWXt4HsBixy6z/5R2UyKU19iy5NDMmjxRdfHrXc
         VpklWxO+WwXgj+u7C/axAloHrvF3bFZgT7g9n2150xgUCScEUtd9pD7nwkkDg5iyH01o
         imRHOKq/ish1Qwv+CmQzeUb6amJxPpgOOidzUfm/Mvl6MOTpHbhhop+/PyfNwTfn8iQ6
         xgetRTgCzk4r+r+r5GwsU1kMWVdiglcEco01/k/uznxLlcp0e6TodGyBidso3bXKhntu
         gk8ZTiTHqA//3E5WrG3u0rQg4gD4c1iGRmqVh8i+PqiTEIr6rJAn5chn5Mqj/Ho6P90N
         fPEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fA9mrsqp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e126-20020a621e84000000b00528cfe15f2bsor1536523pfe.75.2022.08.10.08.33.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Aug 2022 08:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fA9mrsqp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Shpi7OSQIlO7SdnT4HPS6c5P5Dd3pS6PG/YMmkGP+WY=;
        b=fA9mrsqpw7kbbbEje4X4FwhGH1arpIcjESUigIgCZxhA60Meja6Xpqhgc47S7XTjhT
         Wh2O96kacR5wDn1XDuyiE76NOvLkFNGuXv52GIWPnzEGxN+GUCc1QsoKehTjPwP83zxF
         IfZvLOsiHtWr4QWXska6FIEatmWo8fWWWQ7ftChfS/oq3zAQuVovCRAXZuVB2P8pBgmO
         jl5iqDn4B7MUnXHR/DHd/9cSd6b8RPLImyibwbPv07w9CEXS0qD2GtQasRvUNEin5JSs
         QWT0TOdO1EzYVwR919o9r4COVN+PfL1gFTXtwbUh0JJZz7KewTGwr5D6FDnuG4qJ3qGM
         uvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Shpi7OSQIlO7SdnT4HPS6c5P5Dd3pS6PG/YMmkGP+WY=;
        b=4VX3GJYzTGsQtRdh42Wm+ApSKmy0fkwFaVtrUXVaswzQMo1jyuE+ZDm1PrMviyo56c
         mvstzvWsY25Z9HrNU8SGOYuFRBd3iOihOB2tuucrceu+DnOM65D8KDpKl4+3o3qpfRev
         ZPPpj+VzelYzI1zQPmMivLRPod5OYzDmAWWkbOJMVfW4QnhBwAgN+E+j/gY7p9V1Ku6D
         sWHZNuXpvGorXUFsi/rJ0IL3/bSdld2kBz5oHavFz5af5hCbkkcsJjUHQupMvw1FZivP
         CplLEUh7ZPNcL8xIqrnwT8ieg64Njw0TwhFItjEBFuNxMqRjTzalf5gC/ewxY4qauvrl
         nACg==
X-Gm-Message-State: ACgBeo3pl3lXLD3Z+P+jM8Ra8m1FEZVkHrHoH1GEE0i4jm/hX2e4IrH6
	IisawujJQpNwGUYrJSsL95YahBdgah59U9lg
X-Google-Smtp-Source: AA6agR6CpdwsR2EPKTVsH2T0+pULBm3+QB5ouGucw30N8u062t4Kd11834Gj4P7vnFNHaP94L6DwLw==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id k7-20020a056a00168700b005186c6b6a9amr28566230pfc.81.1660145636954;
        Wed, 10 Aug 2022 08:33:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646? ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
        by smtp.gmail.com with ESMTPSA id b123-20020a62cf81000000b0052e23a5ab74sm2111028pfg.59.2022.08.10.08.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 08:33:56 -0700 (PDT)
Message-ID: <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
Date: Wed, 10 Aug 2022 08:33:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
 <87fsi4kzkz.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fsi4kzkz.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: teU0WYJXI28A

On 8/10/22 06:16, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
>> Since we already had a local variable named secure, use that.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index d424dec729..f7892a0c48 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
>>   
>>   static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>>                                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
>> -                                 GetPhysAddrResult *result,
>> +                                 bool secure, GetPhysAddrResult
>>   *result,
> 
> NIT: why not use is_secure like all the other functions (and reformat
> the commit subject to match too).

It's right there in the commit message -- there was an existing local variable.


r~

> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
