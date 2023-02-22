Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp46379ejc;
        Wed, 22 Feb 2023 13:37:20 -0800 (PST)
X-Received: by 2002:a17:902:fb10:b0:199:190c:3c15 with SMTP id le16-20020a170902fb1000b00199190c3c15mr9153822plb.49.1677101840237;
        Wed, 22 Feb 2023 13:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677101840; cv=none;
        d=google.com; s=arc-20160816;
        b=IBN+d/YLvxSadptV10aewvriARCEoyzOD5XJrcDA95cRS3ppaTw3bVWHqn3moeAt9z
         yN8sJWF23kHBYFKUN0u6UnzbjX+x55ej+qaJ6VEh1h03G/c46EiWdGAW3uhggkqkOBla
         MnY8vGTI0wrLfV2mrf88hnyR5P/1Ak6kYRY/HcX009WIz9barAw8p+58i23ZeYSwebnq
         nnM6RSsR2zSMpHehZvcRatqxf4SnQrnBaZOQQ2TTqiiNcbGnuaE1am0uFCB0kQDxGeU3
         BcR7ojzQe1PcKfPxQXwSNPapY/kDcAUx4yJ3l84iGBCgLbb063W+xu1yWobeMYgYFIm/
         clQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T6UnAIy50X4YtRBVt50hEeqQhRj0NfiDHvi3k0VYj88=;
        b=uHrsF60bLKnMY4CFbOzjfuXImwoKEpyd6ONG4qykqIcnxaRRmJXzhBl0VaE5136RIF
         U99MujfZQ3FsZi/Yqi/Drh7gqX8q64Gvtm0Tdaae6AqNqkIm5NzuAoNOg5kgG0J4oCbW
         2CeEBTHBgZBY+PjISGvhg7v56fKxlcxt+Minwtk5hfxIMkFkN5QuFb3dFGLwlKvxoVnM
         BVT/a0fqF3pDODhzuZnDKU/O7JQKm06fy0gld+u9xxN5cDPf3nL3lUcAf50DCv8e3ehG
         wMYRSJK1TIRJKfSNJYbdiVErQYfSFeH7RTAmsP6LXvogMISyadpNuzC1yMar2OqwIJ/N
         YBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtDufyLv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ix17-20020a170902f81100b0019c92f56a12sor3113129plb.1.2023.02.22.13.37.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 13:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtDufyLv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6UnAIy50X4YtRBVt50hEeqQhRj0NfiDHvi3k0VYj88=;
        b=JtDufyLvRlQOJM+w2f3gTCArLVrhKbIXslrMI/uEcJekIUrvEE9fwVwYTLGxBB11yQ
         sXpmdQ9o3vvJVcMrxKfjBsOFpIT6si7eNAOjvdJvmu26yh6dDQeLNOWrVibGANBzMHnk
         TeocT4QGCLT9WedKAenfvfmIohU/KheipNOcm4fU5lUnOrXliTc5FywhlLE4X1dd4J0u
         QPqV/CHUv7b2WCU1EjmI8cBI84ykPjidEDWFxit17jHtusagZE+jFE63E7X6gyMlMwH3
         VJV9h0CznL4Rdn+g+Ly0VjsOrUnXvXbme9gc9pklIkPESVDpMfJLj2UxpeiX7sSukkCD
         mkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6UnAIy50X4YtRBVt50hEeqQhRj0NfiDHvi3k0VYj88=;
        b=AWWUdCwtfJzIShOgYEJjXilj3nAPGNwhF/MHi3AV6nQXdem/l5Z2KSHCenb+bxekSi
         7auF3mVT2PBeDSmTbRCGXgJHZ2jGlTQLKw+ZC9RmhohSYOFOZq1LOef7AjdythxqAIcS
         oKmjhLhS/9+zQYz9UbXMrxL0LAdx8tbkM19UqRlCm0nTM32xA1UvzeTiDA2XE8VcR/8y
         UDcDL3pmPeiU0KjxtYdKuY/sDz4PJbdUhSvHEHrID87VGHMV8OBj3JVQW+UipUwy9vzV
         nhgz3lQ7Bj2miVjAXuDnw3LvNNnZjzkL2Opd/JIvTJQMQC6gJBRMUPvnhmQAtFeOAtII
         Wtmg==
X-Gm-Message-State: AO0yUKUYxQGBf/pw3S4HZwxIqIPeTbKX3MSUtX7Tox/k9hEkre44/oiH
	bomYUrK3BjBoawW7om4xb/6amxUK
X-Google-Smtp-Source: AK7set+OdHz3WpoVB0Dj4yYx+VYOovnViKfAnp2sZEdafiSQO3/wGjdSJwJRnw5KuKLPw4YFrucysw==
X-Received: by 2002:a17:903:1384:b0:19a:beec:8b56 with SMTP id jx4-20020a170903138400b0019abeec8b56mr8862295plb.39.1677101839711;
        Wed, 22 Feb 2023 13:37:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902b70800b0019a983f0119sm5399025pls.307.2023.02.22.13.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 13:37:19 -0800 (PST)
Message-ID: <989f380e-9d70-a377-9f56-6d42935459c2@linaro.org>
Date: Wed, 22 Feb 2023 11:37:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-7-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222193544.3392713-7-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LIBtG6xcnSgp

On 2/22/23 09:35, Aaron Lindsay wrote:
> +static G_NORETURN
> +void pauth_fail_exception(CPUARMState *env, bool data, int keynumber, uintptr_t ra)
> +{
> +    int target_el = arm_current_el(env);
> +    if (target_el == 0) {
> +        uint64_t hcr = arm_hcr_el2_eff(env);
> +        if (arm_is_el2_enabled(env) && (hcr & HCR_TGE))
> +            target_el = 2;
> +        else
> +            target_el = 1;
> +    }
> +
> +    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(data, keynumber), target_el, ra);

Use exception_target_el(), no need to check TGE here.

> @@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>           uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
>               ~MAKE_64BIT_MASK(55, 1);
>           result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
> +        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
> +                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
> +                 !is_combined)) {

Indentation is off.

> +    int error_code = ((data ? 1 : 0) << 1) | (keynumber);

'? 1 : 0' is not required.


r~
