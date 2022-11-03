Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp621927ejx;
        Thu, 3 Nov 2022 06:15:56 -0700 (PDT)
X-Received: by 2002:a17:907:a428:b0:78d:9fab:84fb with SMTP id sg40-20020a170907a42800b0078d9fab84fbmr27657023ejc.694.1667481356251;
        Thu, 03 Nov 2022 06:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667481356; cv=none;
        d=google.com; s=arc-20160816;
        b=QxPJ1Q9CqeOzhbqpUd+e+bVwPfbVs1YQjJ0F3FPS0Og1hUD7UwXW3o5rq9Zd6FMuGu
         DfPUsPFQPnQcJt2CISYHw9V2So83OVIh4vYksvOGQRvmXbPbn38eW3OYc6HHEdNMTVW+
         lIxmHg53dZO7asnufVpR//Q7isgZwuAQFvZxRdhuB1xrkEBOdLK7WG4kI1raIlQpkDcU
         L6zbi48zah3ESlwEc3HPLIPrImNbCcSx/po2GQS+o+22G/y/Ym1y6thKSXqVQVbTgg6R
         80IKv6hpSNgOH0W4dNVNY4SeRPVkQmC6xZVyGz0bDmdVBQc7u4zLMk0f9hNlIW/OyfMh
         3aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=grGXI9YvH69Ce0oCWTfCxKZD79ZSLACvKU4Eld6Qiek=;
        b=nRDkFQkV3sxXOwcpkxasGzrbE9b6JWcV2QwiM6wnWoeAaCyDrpzQviirUMuZWQ5tNg
         p/JF0MLBHPjq14cteI2Bh2r/HELmhBL6yQBBXkn3oaevTzTM1fZsIwfVH7ZqmTL1yMQL
         lNGJqUz9oOn+X6HDbrWOxiQKqreX4eVTlWqIZN57W4q/l7ZnfwltV7+Hl5C90WIJpUKN
         6pzG8fCzzDEuGFKU3SnytkVgdInpYRFS9Jxj8lXCgkc+KkI49jUQt/okr8MaEeXcKpC2
         bIh5DIlysNGFGn5H6lfBhgwg7nai+hN8VK/lCH9pm/Vo3wTeRUt7p+zVcIDqd/6X6ejb
         V1ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSrQY1Q7;
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jerome.forissier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o4-20020a509b04000000b0046270ee466esor633336edi.43.2022.11.03.06.15.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Nov 2022 06:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSrQY1Q7;
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grGXI9YvH69Ce0oCWTfCxKZD79ZSLACvKU4Eld6Qiek=;
        b=qSrQY1Q7DaZ5i4CCTmG7/bgdSepuaCJ8Vaw4okx7/+LhvhLcl2c9UWAmtBXO3BrFZs
         TbSlXiBFAuiLmzFDZIS+FLystuqiDAxB877qbQVZX9OyShgWfpttbjLhDVBd7j9c+b4p
         DlUWWAoTOLY8SPyfr3PQBo/h801nPHLNozgI6Lg3iJYTWDVd+ChJjNHHQQpD8Dm4zzT7
         bYsiCwpmGkXDSpTEebt1v80ZX0n3pbJjwkekcRLmjlhuPIaM2lIT2pn8kl0TnJohvdL6
         VBCz8fK0sw9bZB3uyTCOu/9LOoHXgFgi3q6zX5pYXmF5R2UiHcNhHGAvecLaZMg1CpAy
         s5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grGXI9YvH69Ce0oCWTfCxKZD79ZSLACvKU4Eld6Qiek=;
        b=6OfrW7JYqpy2IrBjLSAeWIu5Utu8ebDvFrJPJm0pqLvSgDvLbwbuyHgDyK1CwfM+ub
         gM3zREWczsuX1A4Z7fo2it9GYo46ECjN3hx5scW0xGxx8Ay+PSD9Agk8qLepsy7LppuQ
         Ue8xHW61S27rP3BileWvBoiio97uSuOnu1HSIVxj5lGaaG0nZayYdElR7QDS+PsedX+U
         W1kJCBWApoq3WDUwfDbfGVsuUihpfZHxGbt4boIUhrJBUgvvqbgxfsaOVDksQQMQYrai
         tKryiJUvQjTB+lbOnzr642/71RRYOtmxqDAi+C/Maf+nRQ+XIpMTtlveXtAxqLA4EL4O
         HD4g==
X-Gm-Message-State: ACrzQf3Lzp0IjHs6Mozk6xeloeunm0z8Zv36rJMvQ49wm4BjqxNvcMww
	ZdQANuScs6QWfaHj4jVc99m7slYj
X-Google-Smtp-Source: AMsMyM6bMJexAF7JRsN1DWPUiveGyUf/REKO1PS5DuJuRrDLVpj/nFeVp4Y+uHhQ/7aUKlcTZm75rA==
X-Received: by 2002:a05:6402:5250:b0:461:e870:850f with SMTP id t16-20020a056402525000b00461e870850fmr30029535edd.404.1667481355990;
        Thu, 03 Nov 2022 06:15:55 -0700 (PDT)
Return-Path: <jerome.forissier@linaro.org>
Received: from ?IPV6:2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14? ([2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14])
        by smtp.gmail.com with ESMTPSA id 25-20020a170906329900b00772061034dbsm465058ejw.182.2022.11.03.06.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:15:54 -0700 (PDT)
Message-ID: <c2b702d4-5db5-a58b-1746-2ffa29ffb2b6@linaro.org>
Date: Thu, 3 Nov 2022 14:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Possible regression caused by "target/arm: Add ptw_idx to
 S1Translate"
From: Jerome Forissier <jerome.forissier@linaro.org>
To: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <c6494e10-eab6-039d-7c83-5ba6262c4841@linaro.org>
Content-Language: en-US
In-Reply-To: <c6494e10-eab6-039d-7c83-5ba6262c4841@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ldHMj4doepb9

On 11/3/22 14:04, Jerome Forissier wrote:
> Hi,
> 
> I am troubleshooting a regression that seems related to commit
> 48da29e485af ("target/arm: Add ptw_idx to S1Translate"), at least that's
> what git bisect says.
> 
> The following hunk looks weird to me:
> 
> @@ -1263,7 +1260,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          descaddr |= (address >> (stride * (4 - level))) & indexmask;
>          descaddr &= ~7ULL;
>          nstable = extract32(tableattrs, 4, 1);
> -        ptw->in_secure = !nstable;
> +        if (!nstable) {
> +            /*
> +             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
> +             * Assert that the non-secure idx are even, and relative order.
> +             */
> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
> +            ptw->in_ptw_idx &= ~1;
> +            ptw->in_secure = false;
> +        }
>          descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
>          if (fi->type != ARMFault_None) {
>              goto do_fault;
> 

Nevermind, I just noticed that a fix for this was sent yesterday...
https://lists.nongnu.org/archive/html/qemu-arm/2022-11/msg00047.html

master still doesn't work for me though.

Thanks,
-- 
Jerome
