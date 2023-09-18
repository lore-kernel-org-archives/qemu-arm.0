Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2816320ejb;
        Mon, 18 Sep 2023 03:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKMwH5d345atl901p0g71ZQ/BqCj2ievoLCUTXqGWlKByoS14fV0Ug83ottpvpFSsgIgaJ
X-Received: by 2002:a05:6214:3f83:b0:64f:9108:e368 with SMTP id ow3-20020a0562143f8300b0064f9108e368mr9360731qvb.30.1695034018516;
        Mon, 18 Sep 2023 03:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695034018; cv=none;
        d=google.com; s=arc-20160816;
        b=l+93jfB3LIv2EUHqAxG1RDav+cQEc/POWu9++kMdqtVliAvFr8qOVa5l+zeyIjAwxV
         wsqTuKlFXUq7xeGkv5kTHq858XulrzF/OKSfxiIZgvrscAN16D+H/NlXlcSqw2sCdZRc
         lU0hOc5cUTHrBkbo+myu8vCFmpLwR736jJxH1cSfmOcoz6lmd21f31bZAaOlyDJwyu7B
         ESjtDRk5h1T7RxIhs/QXioSrb/WQm/WghaXUmhtheDqIuvh4QqMVgisIMgdKleLSJmcf
         jiKjORlURfo0io8zMi7lHSzOgchSW2hBPKJ2BrtGtqcVEP+X1lAWMXAAlqic5fyhprB9
         FxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lJ/64b4swMyjvK8kPqgOOGCl81yHEYjOn1hgLk+o2TQ=;
        fh=1+iHolRYECe2ybtGU55u4K8H4b0+ghpL8z/BMNYY7WM=;
        b=VaLBvZKhDJ5xxDqm/LpcMFbQea7pzv/5ej7Sx/BBOCeAUDXA8q88vqU4+mGKgBA1iU
         2CdKF01rIwmXWcwzdaHNGZffFYyZ40EbXsxl03V82+jGhS4/zPNRU7vsXbUJIQxzZohb
         SvjRJqiD8p7NuH4Xixtt4Q4nxRWHeRs8YDJtEnkFXe/4ix6CU1y1aWG+a8azJwKT6eLI
         zeXsb9j9iFruS1WFieiy66azTzUKjVxd99vrBhC5GhaoLNXKabDXP366nguSNxYdP5OV
         3jv7gXhPNxpjZWo2g6Jyeol1xR10QZNSlFDQJ/EK5WCc4/nJ/UITD3SBF7FgloG2YjPa
         6Oxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kk7mBAKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a0ce18b000000b0063cf627e97csi5417026qvl.44.2023.09.18.03.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Sep 2023 03:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kk7mBAKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiBm2-0008H8-NQ; Mon, 18 Sep 2023 06:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiBlk-0008FJ-Rn
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 06:46:31 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiBlj-0006rs-2H
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 06:46:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52fe27898e9so5032656a12.0
 for <qemu-arm@nongnu.org>; Mon, 18 Sep 2023 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695033976; x=1695638776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lJ/64b4swMyjvK8kPqgOOGCl81yHEYjOn1hgLk+o2TQ=;
 b=kk7mBAKkpp7xWPtTHM1F23s4IWsGBe/qkLIOUtEQI2nildqIR8WuwdAPbjwWoPFs+c
 UDtYdvkqZJlueV7A59zWYaNGk3QrAWNLS4KswUdWSjDFNihlyjT/Uq/ig175NIgIAaM5
 M5NL3uZ9ipZhBSxSZEXPGrSJwG5bCNpqy48x8i1Tu4wiB96DowZZ+xsWCDwF8J5bMWQN
 gxOfh/ElKvm9yNtPFghfw1JDyE589+pGEG9pGGfhk6fbjIsqlZeXIuRF42I8LSvQ1ppE
 wNSOsClsFEDkupJ4aWKK6FuGQMNMcAq5R5TWDzBcY/6ZCaFxakmPQUU/8apOABPvIxQr
 RuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695033976; x=1695638776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lJ/64b4swMyjvK8kPqgOOGCl81yHEYjOn1hgLk+o2TQ=;
 b=MrB/SdEQLyM0X0bRoxiHz4A04DUw0aGISFEcG3dZiI6Xz5o67Kj21bR6vsEhTBTf0E
 uOsH5k4//GuEKaMk7WlmwN/lhff0iXrj/gI183SP8nh/pyzjOnJrMcjfwH67zOYQ8fke
 HaXxN9/F73zGQgF2OuXpNJUBmRRIryn3okYHGErJgHxnYDoOnBtP4ktwXnhqlff7+o3P
 xOCMWsYv8vry0V0/6Ijtjj6+eLK8yuIaRNL3G9O/tqYvlA+tC0Z4Gh1bG+0ODQfViR8C
 SaVVIs4vPURQ5BdNCxydon21wMyzDXS8Z+fsbASZ5Nn8CMSWs9e1Gdh/2Z56vYuEOh+a
 AegQ==
X-Gm-Message-State: AOJu0Yx66idK4z602L6pHT/j0uHzZ1ynSo5fSPGa2CE50AMslSAT8gpL
 xZOE2X2QKbYJ3VvBR+HIy59oEDdqE24HC1sLPd1N9FrP6k97h5wL
X-Received: by 2002:a05:6402:b73:b0:530:bdb0:6cb3 with SMTP id
 cb19-20020a0564020b7300b00530bdb06cb3mr5170705edb.28.1695033976568; Mon, 18
 Sep 2023 03:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230915115535.129834-1-quic_llindhol@quicinc.com>
 <20230915115535.129834-4-quic_llindhol@quicinc.com>
In-Reply-To: <20230915115535.129834-4-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2023 11:45:57 +0100
Message-ID: <CAFEAcA9avj+vMb1gAzzcJKFJbqC10T_QAyOvRW=i3LWO35LVkQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/arm/sbsa-ref: use bsa.h for PPI definitions
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: Jjoyx4uED3wG

On Fri, 15 Sept 2023 at 12:55, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> Use the private peripheral interrupt definitions from bsa.h instead of
> defining them locally. Refactor to use PPI() to convert from INTID macro
> where necessary.
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> ---
>  hw/arm/sbsa-ref.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index bc89eb4806..3a4ea4dfdd 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -2,6 +2,7 @@
>   * ARM SBSA Reference Platform emulation
>   *
>   * Copyright (c) 2018 Linaro Limited
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
>   *
>   * This program is free software; you can redistribute it and/or modify it
> @@ -30,6 +31,7 @@
>  #include "exec/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
> +#include "hw/arm/bsa.h"
>  #include "hw/arm/fdt.h"
>  #include "hw/arm/smmuv3.h"
>  #include "hw/block/flash.h"
> @@ -55,13 +57,6 @@
>  #define NUM_SMMU_IRQS   4
>  #define NUM_SATA_PORTS  6
>
> -#define VIRTUAL_PMU_IRQ        7
> -#define ARCH_GIC_MAINT_IRQ     9
> -#define ARCH_TIMER_VIRT_IRQ    11
> -#define ARCH_TIMER_S_EL1_IRQ   13
> -#define ARCH_TIMER_NS_EL1_IRQ  14
> -#define ARCH_TIMER_NS_EL2_IRQ  10
> -
>  enum {
>      SBSA_FLASH,
>      SBSA_MEM,
> @@ -494,15 +489,19 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
>          for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
>              qdev_connect_gpio_out(cpudev, irq,
>                                    qdev_get_gpio_in(sms->gic,
> -                                                   ppibase + timer_irq[irq]));
> +                                                   ppibase
> +                                                   + PPI(timer_irq[irq])));
>          }
>
>          qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
> -                                    qdev_get_gpio_in(sms->gic, ppibase
> -                                                     + ARCH_GIC_MAINT_IRQ));
> +                                    qdev_get_gpio_in(sms->gic,
> +                                                     ppibase
> +                                                     + PPI(ARCH_GIC_MAINT_IRQ)));
> +
>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> -                                    qdev_get_gpio_in(sms->gic, ppibase
> -                                                     + VIRTUAL_PMU_IRQ));
> +                                    qdev_get_gpio_in(sms->gic,
> +                                                     ppibase
> +                                                     + PPI(VIRTUAL_PMU_IRQ)));
>
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>          sysbus_connect_irq(gicbusdev, i + smp_cpus,

You could also change the definition of ppibase not to add GIC_NR_SGIS
(perhaps renaming it) and then you wouldn't need to use the PPI() macro here...

-- PMM
