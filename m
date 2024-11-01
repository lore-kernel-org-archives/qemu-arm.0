Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp638723njc;
        Fri, 1 Nov 2024 11:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXosxgxJQ6qFDyz0BhMD0MAGocqbIsIfIJvsJ9ZZ4sEMHkFC1dXiCHUpwnyoG0vdrT1TZPHFEAf5YaSmA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdAKrVjuX7nwK4OdQm0m1Ykis0VAcWJeY2V88IIsNShcmRuri4BLzYK0DEdWEFzwy+uVsv
X-Received: by 2002:a05:6214:5889:b0:6cb:fcbe:b34b with SMTP id 6a1803df08f44-6d34609ab17mr142913876d6.32.1730485431628;
        Fri, 01 Nov 2024 11:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730485431; cv=none;
        d=google.com; s=arc-20240605;
        b=TAytqzfbMz8TgHeuOtKCpEsOH877z2aC/AJZ1b1/yHrUBY7k2JiizWIfSriaI/3gjv
         +qltQ6c6arV++Rr7hBIjq7JMAnAiAwFInzB80wI+PzM9m3jl2jJhwDQ5nQBrcroSeIMV
         u8Ec8h7Z5X3c9R1aFgsbo/dHHceIkx5aqTCpbmalva/h0Dv9o+DAOLYUh4h/17+5nOz2
         aX8lrumj18DUSWybr9DwMxENAWHqGrerBbu7yzD5ge1YeKClX/mf+NBynaS+R7W333xo
         neuxQFN2VCQN5MlhEWqALfs0ncLFLbOsIA388kMHvityQsYoMI3KKr2zG9U0N+NP53bo
         vm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lUDvt9zB2u2y5ROb3kv7PLYaVN7QRM7k7c1aVoW9TuE=;
        fh=+BLcO5/74dsz9iI/32Y3Z1sH+POun/sxanBZZmsUGmo=;
        b=bBhnDxbtMHfIEbc99gl+NPR1QcO1GC1EtIYn3vr7LwAFKQnc9s80jqEDerLU/UBQEo
         AbAQB56042Pz2QIak0fNSwn8hAAhzNpUjodgMTPDb4pmW6Ol8K9JjMunn0As6fkE+/bl
         XSiAYxLliK1Kc+nr8tAwSViIiBCEHWoOB2+yQXyDOhTCbnS9HLEpaZ+35pjZfsqM6wyo
         wBfNPrE/NZXNhhq2hd7c5Psc8TndHI9w+Y1IqMFIIfeNzC/fWFDahrDugBCnhzHhGjXr
         rXBkqu7NgkFQfnj+QGbDoYO6yI0Pa/6p4nYseFHFD7dZyKYNPWxDg0/9s84zGqASEiM4
         SWcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkS6QY0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa867fsi48141126d6.37.2024.11.01.11.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 11:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vkS6QY0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t6wIX-00076p-Fg; Fri, 01 Nov 2024 14:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t6wIW-00076S-Dt
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:23:00 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t6wIU-0005fc-OF
 for qemu-arm@nongnu.org; Fri, 01 Nov 2024 14:23:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-71ec997ad06so1902193b3a.3
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2024 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730485377; x=1731090177; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lUDvt9zB2u2y5ROb3kv7PLYaVN7QRM7k7c1aVoW9TuE=;
 b=vkS6QY0HUojHCahlqzi1tEg8Cl0iu8l29io8M6O9AKjccUdRNLJdtkn++T7TMgBUg7
 5407SuQKHqjK2/0ooUFcJcIPUr7vt/LAAb+mkMPZRiBqmp/qJDpSo2BfHh2EdZM4oWm1
 CtPjsTqn1X5m9bNphvCRzxkoVLRoxq2PJX5HePaujXpLTvhpr8Yj3/14UK/XiuqX5eV2
 Obf+Cxx6QW3JOJNqJ2fBc8yGerVVoZh15fIRm+A7b705EFOUcM6r0e0xk7gEBvZQqomc
 0hUcMLep+92xwcvpY8y4j5iqu/jkPs7uxo+3XbMeDfE1+mRtNCufvgxRaUDIMk8L/25u
 15XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730485377; x=1731090177;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lUDvt9zB2u2y5ROb3kv7PLYaVN7QRM7k7c1aVoW9TuE=;
 b=s7hHECqdvXgb4mvXo3HGLg+w/68bfwTxy531MZwVeDKQhmpD0gLKlsgRJFN5bh+oxg
 SIZAYGGF33jWr9UdeC5ckXqftFgZmZrUao3HpSPb5Zpz5GoW4hbzqDsA7FdmpgOVJYJe
 y/5dG8YKl0iip1yLt5T8G3txM3km91OKGsxz+H3SIz+zXsoWlp+f57p1Xs0L5wrXnBVZ
 wf8Y79PPN96LrVkht+9Z6sqv5x+sO0KjrxIg3oWayidhh+NhN+gzsgVHsK0bQcTHLMXJ
 KzIcpHJkopYOnePQCEAY+ZXtwLv/+3p2mSDZGO+OG9cl3S2ZFAHv5E0o4Ri65yanBb+L
 /2DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvZ8wb3FQAXglnCSk8sS+ujdB6AgpWzx9/5sHHANQOJis0szl0U+q1Nrl451ed4PVrsPgDeTCLnw==@nongnu.org
X-Gm-Message-State: AOJu0YxaLOtU9mT21r8svno+wNBhpA3d9FvOJ0KK+N9EsGG1Lm8HulnH
 XJPgJik67PoxNgOI6GNT4LpL06ZsBiapvVuJ3J/WQj5XJW48gFA5jrsI/AnJvos=
X-Received: by 2002:a05:6a21:78e:b0:1d9:832b:e28e with SMTP id
 adf61e73a8af0-1d9eecbe578mr15489370637.23.1730485377113; 
 Fri, 01 Nov 2024 11:22:57 -0700 (PDT)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93daac954sm3032501a91.23.2024.11.01.11.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 11:22:56 -0700 (PDT)
Message-ID: <e3264752-c334-404f-9063-9a17bd9238ef@linaro.org>
Date: Fri, 1 Nov 2024 11:22:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
 <20241101161125.1901394-2-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241101161125.1901394-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FuNoDcq/HTV3



On 11/1/24 09:11, Peter Maydell wrote:
> Use the private peripheral interrupt definitions from bsa.h instead
> of defining them locally.
> 
> Note that bsa.h defines these values as INTID values, which are all
> 16 greater than the PPI values that we were previously using.  So we
> refactor the code to use INTID-based values to match that.
> 
> This is the same thing we did in commit d40ab068c07d9 for sbsa-ref.
> It removes the "same constant, different values" confusion where this
> board code and bsa.h both define an ARCH_GIC_MAINT_IRQ, and allows us
> to use symbolic names for the timer interrupt IDs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/aspeed_ast27x0.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index dca660eb6be..5638a7a5781 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -13,6 +13,7 @@
>   #include "qapi/error.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/arm/aspeed_soc.h"
> +#include "hw/arm/bsa.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "hw/i2c/aspeed_i2c.h"
> @@ -416,28 +417,28 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
>   
>       for (i = 0; i < sc->num_cpus; i++) {
>           DeviceState *cpudev = DEVICE(&a->cpu[i]);
> -        int NUM_IRQS = 256, ARCH_GIC_MAINT_IRQ = 9, VIRTUAL_PMU_IRQ = 7;
> -        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> +        int NUM_IRQS = 256;
> +        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
>   
>           const int timer_irq[] = {
> -            [GTIMER_PHYS] = 14,
> -            [GTIMER_VIRT] = 11,
> -            [GTIMER_HYP]  = 10,
> -            [GTIMER_SEC]  = 13,
> +            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
> +            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
> +            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
> +            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
>           };
>           int j;
>   
>           for (j = 0; j < ARRAY_SIZE(timer_irq); j++) {
>               qdev_connect_gpio_out(cpudev, j,
> -                    qdev_get_gpio_in(gicdev, ppibase + timer_irq[j]));
> +                    qdev_get_gpio_in(gicdev, intidbase + timer_irq[j]));
>           }
>   
>           qemu_irq irq = qdev_get_gpio_in(gicdev,
> -                                        ppibase + ARCH_GIC_MAINT_IRQ);
> +                                        intidbase + ARCH_GIC_MAINT_IRQ);
>           qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
>                                       0, irq);
>           qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> -                qdev_get_gpio_in(gicdev, ppibase + VIRTUAL_PMU_IRQ));
> +                qdev_get_gpio_in(gicdev, intidbase + VIRTUAL_PMU_IRQ));
>   
>           sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>           sysbus_connect_irq(gicbusdev, i + sc->num_cpus,

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
