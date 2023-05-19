Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp444751ejq;
        Fri, 19 May 2023 08:00:37 -0700 (PDT)
X-Received: by 2002:a17:902:e549:b0:1a9:9a18:345c with SMTP id n9-20020a170902e54900b001a99a18345cmr3424559plf.44.1684508437115;
        Fri, 19 May 2023 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684508437; cv=none;
        d=google.com; s=arc-20160816;
        b=P3IXK0xCFfmNJgtMyypRdYGJfzAkMnFFF5/YNrkLj856g9FkczEstw6RrPbjBzDdNt
         Tk5KotChmm7DjwtawduGixinKO338Y/1OnjH3z4/+AbO0xNZ+ojm7vy+OjGprqJHEViT
         7vmnevP4F0C5sVLghPSrOyFNMqMI7t09amg2tvfMt8Ft05d4/pHkIPR3NxqE4hyHKrnm
         HTX4P1bxd1UVyozb7ki3I8xF7fSI4DTGN4ZdJEeY8mGoln45rtmVk1BPBb666vNscqkh
         gFQJ+gBhgrBCD7BnJd0FKYoZC6sTnvXag9kIARkuesroC8UY9Kug9AYBhRtI8LefqlRZ
         lvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=L1cvhEp5ZR87MBsvwJCWB0RGjMDQew3io93LmMVniq0=;
        b=VROXRyvmYpCAQVbGC6l7YbzJCvOQMldMtZU7/4B7+kDy1VdjLhEE1vcVFYvi4NYg8O
         osrdX8PVetVyGnQa4x4ZwBpf7o5lQzuh5IWirVpmnkJP3pgIxmidHuKyW7XJXZFDVKfX
         Mv3OMa80K5fn8STBQBWrGFFkeWw8E+cKCgRi1K6xAF/eeWxyFVEkp1+cE+xGHaYx2oVo
         cMijMsEleFzh6TkPq0Idu6IBrg2TdHllgV3aBw/tgsl6l1/fFS1Dgwfyf5ex7EMQQFJ7
         yTmjnSH/DAT6CAJHJh0smlXTdGEqWyxIyT1fpJtDsOichBvzJ5/SuAAz3R5hMLFx4tnw
         /1pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKRvKT+G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u10-20020a170903304a00b001aca7e0c77fsor2192960pla.8.2023.05.19.08.00.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 May 2023 08:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKRvKT+G;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684508436; x=1687100436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1cvhEp5ZR87MBsvwJCWB0RGjMDQew3io93LmMVniq0=;
        b=eKRvKT+GKOq6h8QyqU9iSriO0I0FZm/Ap7Ky1lNIpSGubGjCmiDMti/Y+zLG+V+cy+
         dBMmKLBAs+4OjbB7yHdJsrdXvIGChIgsLHcBsN9oDTfgEoHEsLD483NRhcKtq0+UZ6CQ
         rEj6Lgp5OqoY+xRHz6f3HPSFxrKfUlgfFGjcXMpebP9l56rnvnyIIm1ZyECehFIp6V2X
         Qp7BDLY4RhWy49lU1Wb2UruAGPNXNn0yOgJZ7basFz2XrTY0l81RC0Hg8++JBNClZ2U6
         HlTfICJ90xA4lqvTges/IaZ5F0bQMhQ5AZyGKZ8CUr4aY9JVB/GJEgWf2Qqwk2JJbGAM
         c5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508436; x=1687100436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1cvhEp5ZR87MBsvwJCWB0RGjMDQew3io93LmMVniq0=;
        b=GhKtnrjaMlChmjYvuwzTor+8Okles8D5dKmGK596c8a0X+j9ZN1eLPqB0emmf2mjH0
         qNPyMfgnz9NAWFrApMICQ5/4Gs6MZsJq55wfMOW9SfVFdFzMR4EAPSjJ3sO8pl2smcxZ
         5fwQDamzPMaiD8g5ZMgzOaHt1dJb2lELI2OJsS8Wjt8q7xW1TJn4fTHduYDBz8/6pOMP
         gqM1Bu0/ixbsUzdXgwH/XRowdIJ4utLv2B2/kzqEoFUtsIohM/W9E0FTrbe21SJToylE
         hJPP2DqLhu+XOt8RKYAKWuKAIMl2DhVgVgmlI7+z9aHc8FlN4y7ZVKnxl6O63pZcYpin
         hhrw==
X-Gm-Message-State: AC+VfDxUppdXvpfZSormmp8hkHtbmCiw1QhWoS8vwJjUKaMvF1CdkbTP
	r6GgeBKsqfDWppGtCQs7iYjPepLb
X-Google-Smtp-Source: ACHHUZ7CoaUueCtBwheDTkxtA1pqPbAuBdKn6Y9cEhVjzZEt6Z/dXFy332NLaeAjxi+y7WKiRI3AiQ==
X-Received: by 2002:a17:902:ef82:b0:1a5:3319:12f7 with SMTP id iz2-20020a170902ef8200b001a5331912f7mr2617012plb.50.1684508436565;
        Fri, 19 May 2023 08:00:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:686f:d1bb:8fc4:dc38? ([2602:ae:1598:4c01:686f:d1bb:8fc4:dc38])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b001ae626d051bsm3575943plb.70.2023.05.19.08.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 08:00:36 -0700 (PDT)
Message-ID: <d66f620e-d19c-8d4a-ae10-4c5732d73df2@linaro.org>
Date: Fri, 19 May 2023 08:00:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "arm/kvm: add support for MTE"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230519145808.348701-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230519145808.348701-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: H1JYWMtS3vcf

On 5/19/23 07:58, Peter Maydell wrote:
> This reverts commit b320e21c48ce64853904bea6631c0158cc2ef227,
> which accidentally broke TCG, because it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM:
> 
>      ==346473==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address (pc 0x55f328952a4a bp 0x00000213a400 sp 0x7f7871859b80 T346476)
>      ==346473==The signal is caused by a READ memory access.
>      ==346473==Hint: this fault was caused by a dereference of a high value address (see register values below).  Disassemble the provided pc to learn which register was used.
>          #0 0x55f328952a4a in address_space_to_flatview /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/memory.h:1108:12
>          #1 0x55f328952a4a in address_space_translate /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/memory.h:2797:31
>          #2 0x55f328952a4a in allocation_tag_mem/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../target/arm/tcg/mte_helper.c:176:10
>          #3 0x55f32895366c in helper_stgm/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../target/arm/tcg/mte_helper.c:461:15
>          #4 0x7f782431a293  (<unknown module>)
> 
> It's also not clear that the KVM logic is correct either:
> MTE defaults to on there, rather than being only on if the
> board wants it on.
> 
> Revert the whole commit for now so we can sort out the issues.
> 
> (We didn't catch this in CI because we have no test cases in
> avocado that use guests with MTE support.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Richard, do you want to apply this to master as a buildfix?

Can do, yes.


r~
