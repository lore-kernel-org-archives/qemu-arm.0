Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp638716njc;
        Fri, 1 Nov 2024 11:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYxOCdi7DC4nyPXVf5AddQg2uhZ4JB2omelmgT43Gr/YpN8P4mKQVqjc0g26fDW3DoA1V7sMgvG6d0bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHwHovvnwwDCocs2FQuImhf1ijjIQnsAQ1hom0WUovQNfoUgY0+RDrzGP844wWd68+PrM1v
X-Received: by 2002:a05:6102:3594:b0:4a4:8651:3c3f with SMTP id ada2fe7eead31-4a956b0ecb4mr6294174137.0.1730485431620;
        Fri, 01 Nov 2024 11:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730485431; cv=none;
        d=google.com; s=arc-20240605;
        b=PFeLDi7g0PJJmDXnW6VY4fgPp+LEdQ4XjVqwleKEetYSYsc4U8KxN9Xvl6W3HRjvpz
         GVhxu1PTHBe0W7vnUzI9DyzNPFvVxOEJqvFVQoL3lRlN9MbUKlmBGd2B4GsxgyDrIUQk
         LyRTO1Q5JFPiSHUvALlnwHeSHDV6xDSdSDJKXAogRMq7u9CkECBjW5LI5PmD5E503BKG
         b9jHN7YsLau2C86FbsyxydHsb4oX22i+mphIkXRgs5YRa+1+KkoOu8CEbINnHEe0wr5M
         9/z3nfTXXVpRpD4zo8sXfWbBihvH/EQVnWDTXB4p9Acsk+fjBqQ3tidljUvoZeRnYUTG
         A3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SPexEx7VjbR4dJzx44VVL0It5cgb6HEvb4iS6PGJ2iM=;
        fh=54ixepBNpOVnvZ/f2DiyWijQJiDY5bUT4+v2MWskSfE=;
        b=LDUy0HLhfrifKETh5bhMevJmLuFcC4T7vcpjZ4Ekr18zZ3ZN9+xcU8JLa5VcGuFidK
         xRlNT1ewMFqVeLR3Aq+Q+d0WAFKNuP1q4BZc4ZZc8aKfGK1Deg8O5kwj8q3ZrBqlQXiL
         YLq9Gym8kfQInBvEtN2CXdIWN+yBf+RsKEqQH3yT4PKsPNF6Ekjv2L7+QawaRIKw45rC
         eD6lSfbUwPLF9jjtIHBiI36aLXwHoTJ0mpi1FvCzFyufdegCI7lpmd+spHNeSX1tXf3j
         DtlUqbYcuLkqQgjqazfOQdvWwITLg7F683+/NBcyo63ywQhtSVHSmbCFSb/HYG+htYj7
         Z/cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBf1fy8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a9575926b6si1240745137.669.2024.11.01.11.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 11:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBf1fy8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6wId-00078A-Nc; Fri, 01 Nov 2024 14:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t6wIc-00077c-K4
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:23:06 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t6wIa-0005gE-St
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:23:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-71e4c2e36daso2349750b3a.0
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2024 11:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730485384; x=1731090184; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SPexEx7VjbR4dJzx44VVL0It5cgb6HEvb4iS6PGJ2iM=;
 b=DBf1fy8KUt8Ct8UhhFPaWF6GVN1JBiGDyQZcyDLLeLoOCcA6oPYZEjBZ4zg+HMzDdK
 aPXiMHFyHtvScTtgfoI+iDzbil/lsxi8npFB1pbHKwjJBrEw+nSPCjwyHfLKeYd/Tu8F
 SErXPClp5L24dZLtc5i/QY4ByTT3fqNy8750lPNqCqR8y2x64rHlUA9EBkjVw9w4nyQy
 kcT/7JouUKVN/BnKNiIWrMMv11f92Z662kMIiMG3ntKdtbWPeKXjdmYIegg7xAQgp2za
 gbczfz8+ffVVR5vBH7U1+fYd3shNM12gzYYcYksi2kcajGzsSJtBBD3LFnhEjsfQNpt3
 i/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730485384; x=1731090184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPexEx7VjbR4dJzx44VVL0It5cgb6HEvb4iS6PGJ2iM=;
 b=fQDh7AAx4mmM0Ps1pHYf9YeX1dFaEhI2KUoqEc1wIecJQz0QN0jjFjOdciU7EZZTA6
 gwZeEvzFg19oL2rCJDYudrgsTBouAZ78HZeCBW6izt5+suDmBYEZRHQP7udMEhKxx63x
 AX20feXbjFGl0Swc+WQHR66HgbGLM7Osrh1a91ogCzdPF/3bDFf0XY4a+4lZ5a0aktbV
 Zs9PF2xYfcbdj9yFKP3835BZXrx4t+yR+CTklJfp++pv9pMD4muwGaQS2vXF7C58h2Ut
 g85dTFK9T3vy7WFQTgFluFtEHJhZ8YY/q4/vf0lcHZO7vzmCiaBMdV/RQHsrYSBUYyDM
 pExQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8a/jGGy/J9Tw5DNjkuAOT+s1HgQfe22BTJkeCQH3yzJRsaNNHrY5B1yRTx8wCA2j7QybO5VAx9A==@nongnu.org
X-Gm-Message-State: AOJu0YwKzCRk33VlnxUu0uZfynpKh0Byf2PruBrKfr3dNeBTyQqYuKh9
 zNr0sOFgIt0foHW/UojFbi7QNPXLyFKTDV3PqybOZVz/F43lDnpTpW4YcN2XT/U=
X-Received: by 2002:a05:6a20:3d89:b0:1d8:a322:6e with SMTP id
 adf61e73a8af0-1dba420516fmr7011861637.19.1730485383621; 
 Fri, 01 Nov 2024 11:23:03 -0700 (PDT)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee44bf470dsm2800803a12.0.2024.11.01.11.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 11:23:03 -0700 (PDT)
Message-ID: <73bdeaf1-d000-4686-b76a-81c2bc7af123@linaro.org>
Date: Fri, 1 Nov 2024 11:23:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/aspeed_ast27x0: Avoid hardcoded '256' in IRQ
 calculation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
 <20241101161125.1901394-3-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241101161125.1901394-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vgJntbtvyQJh



On 11/1/24 09:11, Peter Maydell wrote:
> When calculating the index into the GIC's GPIO array for per-CPU
> interrupts, we have to start with the number of SPIs.  The code
> currently hard-codes this to 'NUM_IRQS = 256'.  However the number of
> SPIs is set separately and implicitly by the value of
> AST2700_MAX_IRQ, which is the number of SPIs plus 32 (since it is
> what we set the GIC num-irq property to).
> 
> Define AST2700_MAX_IRQ as the total number of SPIs; this brings
> AST2700 into line with AST2600, which defines AST2600_MAX_IRQ as the
> number of SPIs not including the 32 internal interrupts.  We can then
> use AST2700_MAX_IRQ instead of the hardcoded 256.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/aspeed_ast27x0.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index 5638a7a5781..7b246440952 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -66,7 +66,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_GPIO]      =  0x14C0B000,
>   };
>   
> -#define AST2700_MAX_IRQ 288
> +#define AST2700_MAX_IRQ 256
>   
>   /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
>   static const int aspeed_soc_ast2700_irqmap[] = {
> @@ -403,7 +403,7 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
>       gicdev = DEVICE(&a->gic);
>       qdev_prop_set_uint32(gicdev, "revision", 3);
>       qdev_prop_set_uint32(gicdev, "num-cpu", sc->num_cpus);
> -    qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ);
> +    qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ + GIC_INTERNAL);
>   
>       redist_region_count = qlist_new();
>       qlist_append_int(redist_region_count, sc->num_cpus);
> @@ -417,8 +417,7 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < sc->num_cpus; i++) {
>           DeviceState *cpudev = DEVICE(&a->cpu[i]);
> -        int NUM_IRQS = 256;
> -        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
> +        int intidbase = AST2700_MAX_IRQ + i * GIC_INTERNAL;
>   
>           const int timer_irq[] = {
>               [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
