Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp677674ejb;
        Fri, 7 Apr 2023 21:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:685:b0:237:40a5:7cb9 with SMTP id m5-20020a17090b068500b0023740a57cb9mr1355407pjz.5.1680927830914;
        Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927830; cv=none;
        d=google.com; s=arc-20160816;
        b=YiO6LRrRTD0F2/+9OdqueUSHYJY2npUYPnb+MsyBIyKKibpIm1SZIHKJkkwDsHZRGK
         Yo46s01/TA1jgAdt/zmrcHiEwwjg35NdM/PIETKNO9tezC1ibQPN6zldYh3j7hTxqAvZ
         3qNl6OOPRXLqu3dq2ExsZaQmszzD+jvUZk8La6JiBMfiaX1WVl7NNaBbDoyNlFegTfB/
         EX9GIliUCk9ocHlSOcFJHVLyFQU6NbeKjKGSqoBmO19EN1ufOh8Mq05VV1Aju5NuFX14
         USIroPOERJN9sO/fpmABbCDh49dZQcsgVQuZcfNHTman03B9UBC/P86LbU6Bf+ZZ0pJ+
         dlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hiiQLOUpmXBWuKOn/UUWqBuRStVCeUARBOIRt8dw52c=;
        b=zaZFJRCVmbhnxf2maItRQ4OEO2pzvLB4E6Q13RBLKYb5TdYaNUbRyH9Z4+nhk7gWCQ
         MJgcxM22ovvvWwbpdVj8qkw8BqKSGyXTsvWT7mVQZeS7dkx8wwNFCBTF3DbTrcYVtB11
         ng2hxRbiTsinyFQVZn3pcvFmNUZaBszOh2gW9zt+PCkWITefBk91ikNM7JVQJk5HmI3v
         uWOtzadVrya4D3BSjdnmt5On+wg19b13UyOyWCbipk4GmunYqUS1evKSWPoI0MZf58Qb
         QZhBhfladx/xkjF2eRHD+dpKNPu3ep1ktL7Ce5PfpLDvOqidSXbM4GhUmNIe9lHF7ONR
         vpJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkvzkcFY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j24-20020a170902759800b001a0463dfd1esor2407257pll.59.2023.04.07.21.23.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkvzkcFY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680927830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiiQLOUpmXBWuKOn/UUWqBuRStVCeUARBOIRt8dw52c=;
        b=lkvzkcFYRPQ0/XRKi7u4dhC39xUYN7uK5T2yDMgb5v34yfuCuc82zpr62tb5Z+70Di
         4mQt4nvdDU4SXxu1Svl13qFdJ+FbMyvaOUwEWe0+QLyMy9jVY1upxIetr/DlUwJ02Fuo
         R4Q3DYpD7+CfNZoup1nyytlKQAPrD9g+WCNXUyd5F/z0rD9afMC9cRBlEewVFan4437N
         AS0YcMly8nschlUTyOtDZCejRtg1S5YnhS53wL8t3am51bp3Ekfdh6O5KUQ3ZhwTr8AM
         jvCmb1oMSWg/bGT+zWJx/uJrsJ44J6SQ4cauEDI4e3t3tZLxIU2zY5+aGAVjeJ3JyHWw
         WzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680927830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiiQLOUpmXBWuKOn/UUWqBuRStVCeUARBOIRt8dw52c=;
        b=r4aBqPos/0TcZLifzrLu3HvAdnGpwxflfYXCquK0Ithw+q2iOAcMdDuJwV2/N+bphc
         lB3FRNJkDL4ZJTYeR7hEUYpH2rdsFY7T9DanBc5QoE2CKtABsv3vsYa/T3N+tW5rIPxK
         TtvPphLJkFtbHqfEz1GJZtjARmcNdlXA70W4/40PgdJVhQOISulTGyPThb34yAe9QJIl
         zB3dn8UTzryc9c8GuBo7OuqTAIK5A9HYOicc6pGN2c26W5OeX/l6Gxv8GNWZau+B2G5Z
         rIA5hzEwA1UdVxnBLckDoRCIsT7GUyBlEU/AlvF4BUBhjSATPhC/MOJ3tU2Cx/V6faou
         AAFg==
X-Gm-Message-State: AAQBX9e03ADlg1JBJoYANT09D1lhzZJrymi2FlJN9M9EvOpdwZ90LnnM
	MJkt62jowlkvrlGD0oJftKwll8KF
X-Google-Smtp-Source: AKy350bxSubZkDnaLAgaaFFf8QyqWAXH0GhCoxrxaORXlZzZG86iODTY6N0YjkS8zhiOSfi65CBBYg==
X-Received: by 2002:a17:903:2115:b0:1a1:b11d:6af5 with SMTP id o21-20020a170903211500b001a1b11d6af5mr611598ple.52.1680927830461;
        Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090aa50d00b0023d16f05dd8sm2292970pjq.36.2023.04.07.21.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:23:50 -0700 (PDT)
Message-ID: <e6e1a695-1dde-4109-e0f7-cd1c9ff73af5@linaro.org>
Date: Fri, 7 Apr 2023 21:23:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Rks7jlAbWg8B

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
> 
> arm_gic_common_reset_irq_state() calls its second argument
> 'first_cpu', producing a build failure when "hw/core/cpu.h"
> is included:
> 
>    hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
>      static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
>                                                                         ^
>    include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>      #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>                               ^
> 
> KISS, rename the function argument.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/arm_gic_common.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Wow, that's ugly.  But a reasonable work-around.


r~
