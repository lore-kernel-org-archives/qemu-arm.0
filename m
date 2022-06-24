Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp91982lft;
        Thu, 23 Jun 2022 23:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v43HWXC5X2xe3Lc13Q3eaLjFlsUVLoxkVcguDEs6jB9GcHqky1ALNvg1OI35mDL4kb0AlW
X-Received: by 2002:a05:620a:2901:b0:6a7:3b73:7448 with SMTP id m1-20020a05620a290100b006a73b737448mr9525736qkp.241.1656052889568;
        Thu, 23 Jun 2022 23:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656052889; cv=none;
        d=google.com; s=arc-20160816;
        b=00CQZNiqX2aZeKx56MTyUF5ir9EXaR4nzIoKZYNVjRCztsH5HQL1XQ4xXYBOSi0d4F
         +P933EoOZmkUY2yjpOsbJmG2E2ZKp2krBoSBCyPpfFrIolvLdumPPkRvd4kLY8Qmclq7
         K89vmDuSkxvGnVDXITgK34DUmwW7JvsEldDB+IrxA8uc91W/7ThYMTnGk0s4exkq6/sy
         Nw6z7NuLbn4lzDMVkky82YcjHa+HhkWFHkc0NaDsuW1Ry2/ZnIk7gJaJMuxJY42it28D
         Or24HDS0BNOwG7sglVa3ERIqIBtE++bsssnaoWzqxGSEg5sS1jVXcQK/AAcUlqhY1pSp
         3r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=GL77WPjYNZotd8a/O+Om27AVY6H0jQuSYDuOvAclzvY=;
        b=0yDag5XYLqjAgbK9QLcV93GrMvBKUXwzEy4qAKsQQuqFaBqcwnZb3J4NGKNCipKGR+
         I6jn8CTnWABHLH4RBOWQux7YeFbsElWgmwQ5zDxfiNMCgposPs8bG+AnIEh3Mvdwr5gM
         LJ9yKWX5vLmKFrULZPnn2DEy1qFoW5fakvSXJ2nUqP66zZ9wZd6qrL0/d4G7zEeaGHp6
         BUa2ei6wAF3iMFusjHQmoM26cwjuWW98DigeYUuv8BIaF2ixcdaW9Uu93pJSfwznKaDv
         0wsHi4qzDG3S19aDy5PUA+r+QHJhKr8UaUmb0hXZEPEWweA4CHqu+IXD6Pultj9gd2YZ
         jstg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020a05620a245500b006a6c52e0432si1589769qkn.459.2022.06.23.23.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 23:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4d0T-0003Vn-0V
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 02:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4czz-0003UV-Aw
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:40:59 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4czw-0003D4-V5
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 02:40:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 179F122EF9;
 Fri, 24 Jun 2022 06:40:54 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:40:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ee67035a-e007-4a4b-ad7f-3bae3bc28713,
 E6A4B675E747F7C4DAB6964939055BC5BE69314E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a36b0263-2f91-ff1c-0345-1ed8e6268c14@kaod.org>
Date: Fri, 24 Jun 2022 08:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/8] aspeed: Add memory property to Aspeed SoC
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 39a26b61-fcab-4664-96af-2a3c13d9e62d
X-Ovh-Tracer-Id: 6662512699069467616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZQ34obWKf6xZ

On 6/24/22 02:36, Peter Delevoryas wrote:
> Multi-SoC machines can use this property to specify a memory container
> for each SoC. Single SoC machines will just specify get_system_memory().
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c             |  4 ++++
>   hw/arm/aspeed_ast10x0.c     |  5 ++---
>   hw/arm/aspeed_ast2600.c     |  4 ++--
>   hw/arm/aspeed_soc.c         | 14 ++++++++------
>   include/hw/arm/aspeed_soc.h |  1 +
>   5 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index dc09773b0b..b43dc0fda8 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -329,6 +329,8 @@ static void aspeed_machine_init(MachineState *machine)
>                               &error_abort);
>       object_property_set_int(OBJECT(&bmc->soc), "hw-strap2", amc->hw_strap2,
>                               &error_abort);
> +    object_property_set_link(OBJECT(&bmc->soc), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
>       object_property_set_link(OBJECT(&bmc->soc), "dram",
>                                OBJECT(machine->ram), &error_abort);
>       if (machine->kernel_filename) {
> @@ -1336,6 +1338,8 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>       object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
>       qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
>   
> +    object_property_set_link(OBJECT(&bmc->soc), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
>       qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
>                            amc->uart_default);
>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 5df480a21f..e074f80cc7 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -148,7 +148,6 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>   {
>       AspeedSoCState *s = ASPEED_SOC(dev_soc);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> -    MemoryRegion *system_memory = get_system_memory();
>       DeviceState *armv7m;
>       Error *err = NULL;
>       int i;
> @@ -172,7 +171,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
>       qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
>       object_property_set_link(OBJECT(&s->armv7m), "memory",
> -                             OBJECT(system_memory), &error_abort);
> +                             OBJECT(s->memory), &error_abort);
>       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
>   
>       /* Internal SRAM */
> @@ -181,7 +180,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(system_memory,
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM],
>                                   &s->sram);
>   
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index f950fff070..d8e5b607e9 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -295,7 +295,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>                                   &error_abort);
>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
> +                                 OBJECT(s->memory), &error_abort);
>   
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
> @@ -333,7 +333,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
>       /* DPMCU */
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 06e5629800..3b531519e9 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -248,7 +248,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
>           object_property_set_link(OBJECT(&s->cpu[i]), "memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
> +                                 OBJECT(s->memory), &error_abort);
>           if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>               return;
>           }
> @@ -261,7 +261,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>           error_propagate(errp, err);
>           return;
>       }
> -    memory_region_add_subregion(get_system_memory(),
> +    memory_region_add_subregion(s->memory,
>                                   sc->memmap[ASPEED_DEV_SRAM], &s->sram);
>   
>       /* SCU */
> @@ -456,6 +456,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
>   }
>   static Property aspeed_soc_properties[] = {
> +    DEFINE_PROP_LINK("memory", AspeedSoCState, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
>       DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
> @@ -555,14 +557,14 @@ void aspeed_soc_uart_init(AspeedSoCState *s)
>       int i, uart;
>   
>       /* Attach an 8250 to the IO space as our UART */
> -    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
> +    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
>                      aspeed_soc_get_irq(s, s->uart_default), 38400,
>                      serial_hd(0), DEVICE_LITTLE_ENDIAN);
>       for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
>           if (uart == s->uart_default) {
>               uart++;
>           }
> -        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
> +        serial_mm_init(s->memory, sc->memmap[uart], 2,
>                          aspeed_soc_get_irq(s, uart), 38400,
>                          serial_hd(i), DEVICE_LITTLE_ENDIAN);
>       }
> @@ -596,7 +598,7 @@ bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp)
>       memory_region_add_subregion_overlap(&s->dram_container, ram_size,
>                         sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0), -1000);
>   
> -    memory_region_add_subregion(get_system_memory(),
> -                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SDRAM],
> +                                &s->dram_container);
>       return true;
>   }
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index e8a104823d..c8e903b821 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -49,6 +49,7 @@ struct AspeedSoCState {
>       ARMCPU cpu[ASPEED_CPUS_NUM];
>       A15MPPrivState     a7mpcore;
>       ARMv7MState        armv7m;
> +    MemoryRegion *memory;
>       MemoryRegion *dram_mr;
>       MemoryRegion dram_container;
>       MemoryRegion sram;

