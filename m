Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2548139ejb;
        Wed, 25 Oct 2023 00:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI1z0v9brlKIeeLwG1O9z6DZDmVVDri+FzjvQbDTaNI5ZFHQfbQA082Gxed2Tdxw6RILHl
X-Received: by 2002:a05:6214:2a48:b0:66d:12c7:bf85 with SMTP id jf8-20020a0562142a4800b0066d12c7bf85mr20162480qvb.31.1698217966198;
        Wed, 25 Oct 2023 00:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217966; cv=none;
        d=google.com; s=arc-20160816;
        b=DvbzPmLBvbtSZzeyM+RDbQkCyelTU/tzHM/MrCoYly6oGymmmbeu9p9Yp1qar3cEqG
         2FutZKZfMgxzjvVRR+YsVb6eLYlc8M6AGZ1rxyCM/bM9Jm+VWrv7Zv/z5fWNTK8KvbtY
         pcT9V9u+Ar2LrAWuzax7VvNurldgyZ5FdWdLWicN8ds0MvyaAQc2Owi7d2gfp3i/dlLN
         OUlevAOfitsIhKlYspJOiqhn5kDj0y/7jLqrZnk3x3w7LEYA31xAG1ThUTjw9vDZBPxn
         TAy0f4N/p5lHZ158T3fMOhyxBjN5BI2Qo+S55VL0v+M3k+Vna5rb07/D3lQTFuZbrILC
         Dizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=2qpbZ/+EVaT65M78tKH0ucftI+di5BWKD5ZqlYjv5t4=;
        fh=keE2KatKG8lbgXGZXmt3WBgtkhQ6uEw33ggpupitLEY=;
        b=bo9LUxVJLnj/EeBVpmbRYO2QYRE3YHeYHjS8lGzJuHlxAh5Ey0gpnm4PgJVOjrVLRw
         0jKytOLWimsgoUHJsguRt+kzA9bfT8I0oCXxyKiKy7ftoi/0CvnFm3oaqqWiGwVp34QC
         m4pavC08gFLLzk34n7PCqdIRR1gmUUhZ+CrzFri//1SXvrZvj9GyK7VUushxqHIBNqjk
         3rSfLqNH4WkpNq4ZcdUwbAc+e4UcoPMJs4i+AnZ9yZYA5yPFneOd/OfgRBYKoOR1BpIm
         70UA/VL2FgkQR07Rwa7Rtu43aAw1GOZLc/LuXeoUspv7Z0jv4h3yDA30h8/ToSXh8jkk
         fp1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a0cfad2000000b0066d054257a6si8075581qvo.476.2023.10.25.00.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 00:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvY4K-0002iT-K4; Wed, 25 Oct 2023 03:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY4J-0002i0-9p; Wed, 25 Oct 2023 03:12:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvY4G-0001kt-9F; Wed, 25 Oct 2023 03:12:43 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFg9d06W2z4wx5;
 Wed, 25 Oct 2023 18:12:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFg9b1ZL2z4wnw;
 Wed, 25 Oct 2023 18:12:34 +1100 (AEDT)
Message-ID: <a1f0d98a-148f-41e9-8ffe-0c132a61deca@kaod.org>
Date: Wed, 25 Oct 2023 09:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] hw/arm/aspeed: Move AspeedSoCState::armv7m to
 Aspeed10x0SoCState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20231024162423.40206-1-philmd@linaro.org>
 <20231024162423.40206-10-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231024162423.40206-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: cgwoAaxvUdZ6

On 10/24/23 18:24, Philippe Mathieu-Daudé wrote:
> The v7-M core is specific to the Aspeed 10x0 series,
> remove it from the common AspeedSoCState.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h |  5 ++---
>   hw/arm/aspeed_ast10x0.c     | 27 +++++++++++++++------------
>   hw/arm/fby35.c              | 13 ++++++++-----
>   3 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index ee7926b81c..2118a441f7 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -47,13 +47,10 @@
>   #define ASPEED_JTAG_NUM  2
>   
>   struct AspeedSoCState {
> -    /*< private >*/
>       DeviceState parent;
>   
> -    /*< public >*/
>       ARMCPU cpu[ASPEED_CPUS_NUM];
>       A15MPPrivState     a7mpcore;
> -    ARMv7MState        armv7m;
>       MemoryRegion *memory;
>       MemoryRegion *dram_mr;
>       MemoryRegion dram_container;
> @@ -117,6 +114,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(Aspeed2600SoCState, ASPEED2600_SOC)
>   
>   struct Aspeed10x0SoCState {
>       AspeedSoCState parent;
> +
> +    ARMv7MState armv7m;
>   };
>   
>   #define TYPE_ASPEED10X0_SOC "aspeed10x0-soc"
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 1c15bf422f..8becb146a8 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -101,13 +101,15 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>   
>   static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
>   {
> +    Aspeed10x0SoCState *a = ASPEED10X0_SOC(s);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>   
> -    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[dev]);
> +    return qdev_get_gpio_in(DEVICE(&a->armv7m), sc->irqmap[dev]);
>   }
>   
>   static void aspeed_soc_ast1030_init(Object *obj)
>   {
> +    Aspeed10x0SoCState *a = ASPEED10X0_SOC(obj);
>       AspeedSoCState *s = ASPEED_SOC(obj);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       char socname[8];
> @@ -118,7 +120,7 @@ static void aspeed_soc_ast1030_init(Object *obj)
>           g_assert_not_reached();
>       }
>   
> -    object_initialize_child(obj, "armv7m", &s->armv7m, TYPE_ARMV7M);
> +    object_initialize_child(obj, "armv7m", &a->armv7m, TYPE_ARMV7M);
>   
>       s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
>   
> @@ -185,6 +187,7 @@ static void aspeed_soc_ast1030_init(Object *obj)
>   
>   static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>   {
> +    Aspeed10x0SoCState *a = ASPEED10X0_SOC(dev_soc);
>       AspeedSoCState *s = ASPEED_SOC(dev_soc);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       DeviceState *armv7m;
> @@ -206,17 +209,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>                                     0x40000);
>   
>       /* AST1030 CPU Core */
> -    armv7m = DEVICE(&s->armv7m);
> +    armv7m = DEVICE(&a->armv7m);
>       qdev_prop_set_uint32(armv7m, "num-irq", 256);
>       qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
>       qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> -    object_property_set_link(OBJECT(&s->armv7m), "memory",
> +    object_property_set_link(OBJECT(&a->armv7m), "memory",
>                                OBJECT(s->memory), &error_abort);
> -    sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
> +    sysbus_realize(SYS_BUS_DEVICE(&a->armv7m), &error_abort);
>   
>       /* Internal SRAM */
>       sram_name = g_strdup_printf("aspeed.sram.%d",
> -                                CPU(s->armv7m.cpu)->cpu_index);
> +                                CPU(a->armv7m.cpu)->cpu_index);
>       memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
>       if (err != NULL) {
>           error_propagate(errp, err);
> @@ -249,7 +252,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       }
>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>       for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
> -        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                           sc->irqmap[ASPEED_DEV_I2C] + i);
>           /* The AST1030 I2C controller has one IRQ per bus. */
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
> @@ -261,7 +264,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       }
>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
>       for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> -        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                           sc->irqmap[ASPEED_DEV_I3C] + i);
>           /* The AST1030 I3C controller has one IRQ per bus. */
>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
> @@ -290,19 +293,19 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>        * On the AST1030 LPC subdevice IRQs are connected straight to the GIC.
>        */
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_1,
> -                       qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                       qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_1));
>   
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_2,
> -                       qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                       qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_2));
>   
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_3,
> -                       qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                       qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_3));
>   
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
> -                       qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                       qdev_get_gpio_in(DEVICE(&a->armv7m),
>                                   sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>   
>       /* UART */
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index f2ff6c1abf..c8bc75d870 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -28,7 +28,7 @@ struct Fby35State {
>       Clock *bic_sysclk;
>   
>       AspeedSoCState bmc;
> -    AspeedSoCState bic;
> +    Aspeed10x0SoCState bic;
>   
>       bool mmio_exec;
>   };
> @@ -114,10 +114,13 @@ static void fby35_bmc_init(Fby35State *s)
>   
>   static void fby35_bic_init(Fby35State *s)
>   {
> +    AspeedSoCState *soc;
> +
>       s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
>       clock_set_hz(s->bic_sysclk, 200000000ULL);
>   
>       object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
> +    soc = ASPEED_SOC(&s->bic);
>   
>       memory_region_init(&s->bic_memory, OBJECT(&s->bic), "bic-memory",
>                          UINT64_MAX);
> @@ -125,12 +128,12 @@ static void fby35_bic_init(Fby35State *s)
>       qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
>       object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
>                                &error_abort);
> -    aspeed_soc_uart_set_chr(&s->bic, ASPEED_DEV_UART5, serial_hd(1));
> +    aspeed_soc_uart_set_chr(soc, ASPEED_DEV_UART5, serial_hd(1));
>       qdev_realize(DEVICE(&s->bic), NULL, &error_abort);
>   
> -    aspeed_board_init_flashes(&s->bic.fmc, "sst25vf032b", 2, 2);
> -    aspeed_board_init_flashes(&s->bic.spi[0], "sst25vf032b", 2, 4);
> -    aspeed_board_init_flashes(&s->bic.spi[1], "sst25vf032b", 2, 6);
> +    aspeed_board_init_flashes(&soc->fmc, "sst25vf032b", 2, 2);
> +    aspeed_board_init_flashes(&soc->spi[0], "sst25vf032b", 2, 4);
> +    aspeed_board_init_flashes(&soc->spi[1], "sst25vf032b", 2, 6);
>   }
>   
>   static void fby35_init(MachineState *machine)

