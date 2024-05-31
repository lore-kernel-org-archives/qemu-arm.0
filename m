Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp351918ejs;
        Fri, 31 May 2024 00:46:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXs53yglOs88JQL7vjwAC8qFg781Czz4jYk3Fgb5CVi4ggZ1//sIAnsOioDgXlwKIX1HwEZxWJbRZmIMgXxs8AI2XNACEiC
X-Google-Smtp-Source: AGHT+IET1Xb/j+uN1ZL12ED5mkUTizzYmv7IzBR1aj0mnXq+g/vhfcw7zMiSlZcvPXcuGqYQ/zbV
X-Received: by 2002:a05:620a:4713:b0:794:ca3f:d1fe with SMTP id af79cd13be357-794f5c95e4fmr135432485a.34.1717141609082;
        Fri, 31 May 2024 00:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717141609; cv=none;
        d=google.com; s=arc-20160816;
        b=AWn19dNAhoG1/oTqxmOvoI3ZjzG51xh7BA+qj9uFLGLZ1WD97t9oTwIz9KMkM5ZXM5
         lMCUUCxGIdB3ZdPTcWhR6rVBjOAyVL5p2LiudTwZR0Qy5jN3kXcHuYGIM00HaEgmN3z/
         U0gqu0RqdwjIs1leg1/lEEWLYNKaS3/wnYXiCE4Ng+06Z9ctJwH489VMiDqXkFa/XKiP
         GcrC5q242jgr4sxnaetTVjJ7wDfzWKufBymH3klVUIpUkZ1eRHO9hqvOthqgJLl4B6cH
         dYYd6ZD6Oo33kafQyTguxb2MFyhxKVFgvEnNwtBSJTc2XMGfnjboWzhFSO3KJJvOF2gZ
         A1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=VsLRQY4EB3xJ5p1PXh5tDbv9mPIKUJV7yCCjdyzVIVM=;
        fh=wBNV7UiSATYaVKmE7Xme8a9dwVo8oS3HDnEeSM4b3WE=;
        b=XvaxI8b1vWgAolbJlUvvrSS6lEX6yy4r/MiUzj55+U3uu+xiB73DKJ/5eQr5OZQIfJ
         fzUZ+rtCKUtv+az0gn/51QE771I7+arohbiCK+zj4kAKdjf0n/7bt2/v647YOGonXwpy
         XKRRE/rhPpLLCb/XfU5PTGUqAhsLAdLjiFcGRYYJKbI/u8xdGmAJSUJ3Y0qHD1an5KjK
         kBAGQyapwGBDOrGG3i+Fap2KrdcZ2JqXsvNVlFb+RuzYtSWEzux9pXjvd/0e94kERlU2
         CnI61qUfI2DQx2FPBRd5P+zrAQKTicWCneBCt0YMlrhqXekHY5v+FQtXcPVgNBB6MIIt
         mPzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff23ac160si15016311cf.101.2024.05.31.00.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 00:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCwyH-0003hu-Ua; Fri, 31 May 2024 03:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rvzv=NC=kaod.org=clg@ozlabs.org>)
 id 1sCwyG-0003hQ-3r; Fri, 31 May 2024 03:46:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rvzv=NC=kaod.org=clg@ozlabs.org>)
 id 1sCwyD-00068t-DD; Fri, 31 May 2024 03:46:39 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VrFYf1b3Vz4x32;
 Fri, 31 May 2024 17:46:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrFYX6zpYz4x1C;
 Fri, 31 May 2024 17:46:24 +1000 (AEST)
Message-ID: <a2aa3c01-51dd-4517-9261-038fff11f091@kaod.org>
Date: Fri, 31 May 2024 09:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] aspeed/soc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-13-jamin_lin@aspeedtech.com>
 <7ea55928-e61e-4112-992d-b899c65b4652@kaod.org>
 <SI2PR06MB50411ED51276574422E07948FCFC2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB50411ED51276574422E07948FCFC2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rvzv=NC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1Pjnj7v95e3i


Hello Jamin,
> I refer to versal_create_apu_gic function, https://github.com/qemu/qemu/blob/master/hw/arm/xlnx-versal.c#L67
> and updated aspeed_soc_ast2700_gic as following.
> If you have any concerned about the new changes, please let me know.
> Thanks-Jamin
> 
> static bool aspeed_soc_ast2700_gic(DeviceState *dev, Error **errp)

Please rename to aspeed_soc_ast2700_gic_realize()

> {
>      Aspeed27x0SoCState *a = ASPEED27X0_SOC(dev);
>      AspeedSoCState *s = ASPEED_SOC(dev);
>      AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>      SysBusDevice *gicbusdev;
>      DeviceState *gicdev;
>      QList *redist_region_count;
>      int i;
> 
>      object_initialize_child(OBJECT(a), "ast2700-gic", &a->gic,
>                              gicv3_class_name());

and object_initialize_child() can be called in aspeed_soc_ast2700_init().

>      gicbusdev = SYS_BUS_DEVICE(&a->gic);
>      gicdev = DEVICE(&a->gic);
>      qdev_prop_set_uint32(gicdev, "revision", 3);
>      qdev_prop_set_uint32(gicdev, "num-cpu", sc->num_cpus);
>      qdev_prop_set_uint32(gicdev, "num-irq", AST2700_MAX_IRQ);
> 
>      redist_region_count = qlist_new();
>      qlist_append_int(redist_region_count, sc->num_cpus);
>      qdev_prop_set_array(gicdev, "redist-region-count", redist_region_count);
> 
>      if (!sysbus_realize(gicbusdev, errp)) {
>          return false;
>      }
>      sysbus_mmio_map(gicbusdev, 0, sc->memmap[ASPEED_GIC_DIST]);
>      sysbus_mmio_map(gicbusdev, 1, sc->memmap[ASPEED_GIC_REDIST]);
> 
>      for (i = 0; i < sc->num_cpus; i++) {
>          DeviceState *cpudev = DEVICE(qemu_get_cpu(i));

Could we avoid qemu_get_cpu() and use the cpu array of the SoC instead ?

>          int NUM_IRQS = 256, ARCH_GIC_MAINT_IRQ = 9, VIRTUAL_PMU_IRQ = 7;
>          int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> 
>          const int timer_irq[] = {
>              [GTIMER_PHYS] = 14,
>              [GTIMER_VIRT] = 11,
>              [GTIMER_HYP]  = 10,
>              [GTIMER_SEC]  = 13,
>          };
>          int j;
> 
>          for (j = 0; j < ARRAY_SIZE(timer_irq); j++) {
>              qdev_connect_gpio_out(cpudev, j,
>                      qdev_get_gpio_in(gicdev, ppibase + timer_irq[j]));
>          }
> 
>          qemu_irq irq = qdev_get_gpio_in(gicdev,
>                                          ppibase + ARCH_GIC_MAINT_IRQ);
>          qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
>                                      0, irq);
>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
>                  qdev_get_gpio_in(gicdev, ppibase + VIRTUAL_PMU_IRQ));
> 
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>          sysbus_connect_irq(gicbusdev, i + sc->num_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
>          sysbus_connect_irq(gicbusdev, i + 2 * sc->num_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
>          sysbus_connect_irq(gicbusdev, i + 3 * sc->num_cpus,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
>      }
> 
>      return true;
> }
> 
> struct Aspeed27x0SoCState {
>      AspeedSoCState parent;
> 
>      ARMCPU cpu[ASPEED_CPUS_NUM];
>      AspeedINTCState intc;
>      GICv3State gic;
> };
> 
> #define TYPE_ASPEED27X0_SOC "aspeed27x0-soc"
> OBJECT_DECLARE_SIMPLE_TYPE(Aspeed27x0SoCState, ASPEED27X0_SOC)

Thanks,

C.



