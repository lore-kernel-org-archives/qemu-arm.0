Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2108501wrt;
        Thu, 17 Jan 2019 10:01:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7gmLlOZLWbGJyBmlbRLHI0mcP0hSBeD9YR79sn5oLgArSqkeXlhX+3NI1hQnAwrq7J4QQ+
X-Received: by 2002:a1c:2902:: with SMTP id p2mr12600218wmp.19.1547748073390;
        Thu, 17 Jan 2019 10:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547748073; cv=none;
        d=google.com; s=arc-20160816;
        b=qGtfZ8EElPLsj833MGkeJEEO6KJJnIiReRKnkgDvM4eIiDcBBQ9W6JnpjoiBMSIIE9
         tMgTcEKmCI6S7V8eh/1HZADiUa8Hr7+jkK+XJwkabHvXGcM7qwdof0gAh4EfV8pjIdC8
         aRovivOu78Xvx9FpHAVoqoWLOz9Fi+FYWxc4otiGdDhtPiglw0kL6h1QSvNYU+am46wo
         Mp85JdyFGr0RSJRzFwmcQZMwJookA0a+2/ij46inHtrhhah8tfNQpJsGqBeAUYuv8nU3
         JNu9rzPIxNmwbpSiYZ4UpXRPlI6rrB+Sckmeze0ifvHBKv2Vg0NNXh65XE+i2TotxxA2
         xACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=A/BVSauYpMzbrIILaNxxGX1zwcazqMCcxPwwc+IeuxY=;
        b=uTZycwKsr0Ah7DDc9c1wq3rqgjZI7QjVQ6jYW0UB6YqEm/jP3SlmhQMqf43Lu0qpXe
         v7iYB7lU6nA03/DomNiizG3Dt/X1QtXDQKb3KaUbe5BwxOmiQYgbWwxEyqc0rUDtEZTj
         P7vZKPrfBfIOlOybYIMwqa4KAtQ7t80oNyo/q6vx4JL/F/CWDmg/ldDxCj+64X11VQPM
         Fe0jgmk1+qQx7rmJ2B0Y0FWOiv614AuVnSXtRNQmwiNG+rF22qScxfK1m3v+WogwNipH
         9ykcxmBDHtphIQ8q0tDgtoMbT6sCA2NhuymCehW+fmauF2ofIdkFjjAtXCHxi9LQmLNy
         n81Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nK1t1Uhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si54954532wru.170.2019.01.17.10.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 10:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nK1t1Uhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkBya-00031R-9E
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 13:01:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkByK-0002y7-3C
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:00:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkByH-0001QM-Nr
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:00:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkByB-00012b-JL; Thu, 17 Jan 2019 13:00:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id j2so12108305wrw.1;
	Thu, 17 Jan 2019 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A/BVSauYpMzbrIILaNxxGX1zwcazqMCcxPwwc+IeuxY=;
	b=nK1t1UhkO+FcT7BQLZX3BDVT22NBToqmIjCk2YHVQ1B8JdOGHbKl/0lWC9VV92jwpq
	2sXXjTCSL6ciEK/mizgg1QOOVHflTsy6AoCe1A1iqgeRlE+K3TYq8od/9R3HkgN4lJuy
	a7mIHjqjEnmhs8PNHz00NVM46ILWe2mIdY9iA8tpYEzY/ea1mvXYLmnitEiZ082zIcd+
	Px+sVD8VGjyI2hftbhwUoDPVAilu7c05hBIVlT1W9p6EPiTLzGfxJnWWrZyGLaQp7BGe
	Tiv5yafeCRTj13oi/nEP/BoAM2n9ZcMcOVpBaz3Rl4Efd1jsm8p4hS6PfnoCxztzT2Yt
	hxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A/BVSauYpMzbrIILaNxxGX1zwcazqMCcxPwwc+IeuxY=;
	b=pXCK7oxu/hNNd+3wHSf20Ulumfzf0TwUBvSmgWFHdQgSEJ8oCDHD7VoKlJfFhLugsq
	KRdA4Xl3oWN0/7BiiqmEP73m7CfjJXiOpiAUG+Ga5oJxrNPo+aUdz88wWvgksZEhczzn
	xH64vjFzQnzoEowoX6a86uSusalitYP5028O22SsAQ/UhZs+uTh6V19ZyWBrYXD6LsWP
	BfKYUgUUWKj5J3IsTuIGXyKu99WkZzIXTobx94jBPnQgoxBiR5QnEJfXdF1rsX6oBSdx
	jqhEWX/DvU11KdmJ7jBJ/RC/z7Ycm9lekewQlRWBuUyaAZDOE9fkneB37Rf7qmiVcf90
	IY6Q==
X-Gm-Message-State: AJcUukcQ2Wwpf5QM2iG53bRKHBiUqj4JPkHf2lObFdaxs7OUwLGQizQe
	DNMiGYUI/bNm6bTX8QpXggo1Wz60
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr13351230wrj.107.1547748039986;
	Thu, 17 Jan 2019 10:00:39 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	f187sm30848429wma.4.2019.01.17.10.00.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 10:00:39 -0800 (PST)
To: =?UTF-8?Q?Jo=c3=a3o_Gaspar?= <joaogaspar_csw_qemu@hotmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <dbf1160d-be81-741c-acef-aabcf99179a9@amsat.org>
Date: Thu, 17 Jan 2019 19:00:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: Re: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9wKR/IBj8pYQ

Hi,

On 1/17/19 5:54 PM, João Gaspar wrote:
> Hi!
> I'm new at QEMU so I have some questions.
> 
> I'm trying to create a new support machine to QEMU, the TMS570LC43
> board, this board use the Cortex-R5f microcontroller.
> At this moment when I do the "qemu-system-arm -M help" my machine is
> showed with the name "cortex-r5".

OMG why on Earth do you want to model a Hercules SoC? Speaking of
experience, I used to work with those and spend some time tring to model
them, I don't recommend this to you to start modelling an ARM SoC with
QEMU. So I'm curious to understand your goal here, is it for hobby or
univ/job assignment?
Do you plan to run real world firmwares or simple/generic programs?
Designed for Safety critical/Real-Time embedded world, it has plenty of
very specific features that a safe firmware should be using, thus making
the work of modelling very teddious.
Any unmodified firmware require you to implement the Clock Monitoring,
PBIST, and part of the ESM.
Also, you might be limited to run from SRAM then EMIF, because the flash
registers (F021) aren't public.
Also the CPU boots in Big Endian, and while QEMU backend support both
endianess, there are no ARM system booting BE, and you might encounter
weird bugs has it happened to me.

So if you don't have a strong reason, I'd redirect you to use another
ARM SoC.

> The probleme start when I try to instaciate the machine with the comand
> "qemu-system-arm --machine cortex-r5 -cpu cortex-r5f", after that I
> received the message "segmentation fault (core dump)".
> 
> Does anyone have an possible cause to my problem or an tip?

Since this question isn't ARM specific but generic about QEMU machines,
I recommend you to also post to the qemu-devel@nongnu.org list (now copied).

You can have a more verbose debug output configuring QEMU as:

./configure ... --extra-cflags=--ggdb --enable-debug

Regards,

Phil.

> 
> I'm gonna let the code too, because probably I'm doing aniything wrong!
> 
>     #include "qemu/osdep.h"
>     #include "qapi/error.h"
>     #include "qemu-common.h"
>     #include "hw/arm/arm.h"
>     #include "exec/address-spaces.h"
>     #include "qemu/error-report.h"
>     #include "qom/object.h"
>     #include "cpu.h"
>     #include "hw/sysbus.h"
>     #include "hw/arm/cortex-R5.h"
> 
>     //RTI -> Real Time Interruption
>     //static const uint32_t RTI_addr = 0xFFFFFC00;
> 
>     //SPI
>     static const uint32_t spi_addr[CR5_NUM_SPI] = {0xFFF7F400,
>     0xFFF7F600, 0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};
>     //I2C
>     static const uint32_t i2c_addr[CR5_NUM_I2C] = {0xFFF7D400, 0xFFF7D500};
>     //CAN
>     static const uint32_t can_addr[CR5_NUM_CAN] = {0XFFF7DC00,
>     0XFFF7DE00, 0X0FFF7E00, 0X0FFF7E200};
>     //ADC
>     static const uint32_t adc_addr[CR5_NUM_ADC] = {0xFFF7C000, 0xFFF7C200};
>     //GIO
>     static const uint32_t gio_addr[CR5_NUM_GIO] = {0xFFF7BC00};
> 
>     /*IRQ
>     Interrupt Request Assignement
>     http://www.ti.com/lit/ds/spns195c/spns195c.pdf
>     Page: 118
>     */
>     //irq RTI
>     /* static const int rti_cmp_irq0 = 2;
>     static const int rti_cmp_irq1 = 3;
>     static const int rti_cmp_irq2 = 4;
>     static const int rti_cmp_irq3 = 5;
>     static const int rti_oflw_irq0 = 6;
>     static const int rti_oflw_irq1 = 7;
>     static const int rti_timebase_irq = 8; */
>     //irq SPI
>     static const int spi_l0_irq[CR5_NUM_SPI] = {12, 17, 37, 49, 53};
>     static const int spi_l1_irq[CR5_NUM_SPI] = {26, 30, 38, 54, 56};
>     //irq I2C
>     static const int i2c_irq[CR5_NUM_I2C] = {66, 114};
>     //irc CAN
>     static const int can_l0_irq[CR5_NUM_CAN] = {16, 35, 45, 113};
>     static const int can_l1_irq[CR5_NUM_CAN] = {29, 42, 55, 117};
>     static const int can_if3_irq[CR5_NUM_CAN] = {44, 46, 60, 120};
>     //irq ADC
>     static const int adc_swgroup1_irq[CR5_NUM_ADC] = {15, 51};
>     static const int adc_swgroup2_irq[CR5_NUM_ADC] = {28, 57};
>     static const int adc_eventgroup_irq[CR5_NUM_ADC] = {14, 50};
>     static const int adc_magnitudecmp_irq[CR5_NUM_ADC] = {31, 59};
>     //irq GIO
>     static const int gio_high_irq[CR5_NUM_GIO] = {9};
>     static const int gio_low_irq[CR5_NUM_GIO] = {23};
> 
> 
>     static void cortexR5_initf(MachineState *mc)
>     {
>         CORTEXR5State *s = g_new0(CORTEXR5State, 1);
> 
>         DeviceState *dev;
>         SysBusDevice *busdev;
>         Error *err = NULL;
> 
>         int i;
>         ARMCPU *cpu;
> 
> 
>         MemoryRegion *system_memory = get_system_memory();
>         MemoryRegion *ram = g_new(MemoryRegion, 1);
>         MemoryRegion *flash = g_new(MemoryRegion, 1);
>         MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
> 
>        
> 
>         //s->cr5_cpu = ARM_CPU(object_new(mc->cpu_type));
>         cpu = ARM_CPU(object_new(mc->cpu_type));
> 
>         //object_initialize_child(obj, "cpu", &s->cr5_cpu,
>     sizeof(s->cr5_cpu), ARM_CPU_TYPE_NAME("cortex-r5f"), &error_abort,
>     NULL);
>         object_property_set_bool(OBJECT(cpu), true, "realized",
>     &error_fatal);
> 
>         memory_region_init_ram(flash, NULL, "CORTEXR5.flash",
>     FLASH_SIZE, &error_fatal);
> 
>         memory_region_init_alias(flash_alias, NULL,
>     "CORTEXR5.flash.alias", flash, 0, FLASH_SIZE);
> 
>         memory_region_set_readonly(flash, true);
>         memory_region_set_readonly(flash_alias, true);
> 
>         memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS,
>     flash);
>         memory_region_add_subregion(system_memory, 0, flash_alias);
> 
>         memory_region_init_ram(ram, NULL, "CORTEXR5.ram", SRAM_SIZE,
>     &error_fatal);
>         memory_region_add_subregion(system_memory, RAM_BASE_ADDRESS, ram);
> 
>         //SPI
>         for (i = 0; i < CR5_NUM_SPI; i++)
>         {
>             dev = DEVICE(&(s->spi[i]));
>             object_property_set_bool(OBJECT(&s->spi[i]), true,
>     "realized", &err);
>             if (err != NULL)
>             {
>                 //error_propagate(errp, err);
>                 return;
>             }
>             busdev = SYS_BUS_DEVICE(dev);
>             sysbus_mmio_map(busdev, 0, spi_addr[i]);
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     spi_l0_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     spi_l1_irq[i]));
>         }
> 
>         //I2C
>         for (i = 0; i < CR5_NUM_I2C; i++)
>         {
>             dev = DEVICE(&(s->i2c[i]));
>             object_property_set_bool(OBJECT(&s->i2c[i]), true,
>     "realized", &err);
>             if (err != NULL)
>             {
>                 //error_propagate(errp, err);
>                 return;
>             }
>             busdev = SYS_BUS_DEVICE(dev);
>             sysbus_mmio_map(busdev, 0, i2c_addr[i]);
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     i2c_irq[i]));
>         }
> 
>         //CAN
>         for (i = 0; i < CR5_NUM_CAN; i++)
>         {
>             dev = DEVICE(&(s->can[i]));
>             object_property_set_bool(OBJECT(&s->can[i]), true,
>     "realized", &err);
>             if (err != NULL)
>             {
>                 //error_propagate(errp, err);
>                 return;
>             }
>             busdev = SYS_BUS_DEVICE(dev);
>             sysbus_mmio_map(busdev, 0, can_addr[i]);
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     can_l0_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     can_l1_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     can_if3_irq[i]));
>         }
> 
>         //ADC
>         object_property_set_int(OBJECT(s->adc_irqs), CR5_NUM_ADC,
>     "num-lines", &err);
>         object_property_set_bool(OBJECT(s->adc_irqs), true, "realized",
>     &err);
>         if (err != NULL)
>         {
>             //error_propagate(errp, err);
>             return;
>         }
>        // qdev_connect_gpio_out(DEVICE(s->adc_irq), 0,
>     qdev_get_gpio_in(dev));
> 
>         for (i = 0; i < CR5_NUM_ADC; i++)
>         {
>             dev = DEVICE(&(s->adc[i]));
>             object_property_set_bool(OBJECT(&s->adc[i]), true,
>     "realized", &err);
>             if (err != NULL)
>             {
>                 //error_propagate(errp, err);
>                 return;
>             }
>             busdev = SYS_BUS_DEVICE(dev);
>             sysbus_mmio_map(busdev, 0, adc_addr[i]);
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     adc_swgroup1_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     adc_swgroup2_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     adc_eventgroup_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     adc_magnitudecmp_irq[i]));
>         }
> 
>         //GIO
>         for (i = 0; i < CR5_NUM_GIO; i++)
>         {
>             dev = DEVICE(&(s->gio[i]));
>             object_property_set_bool(OBJECT(&s->gio[i]), true,
>     "realized", &err);
>             if (err != NULL)
>             {
>                 //error_propagate(errp, err);
>                 return;
>             }
>             busdev = SYS_BUS_DEVICE(dev);
>             sysbus_mmio_map(busdev, 0, gio_addr[i]);
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     gio_high_irq[i]));
>             sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>     gio_low_irq[i]));
>         }
>     }
> 
> 
> 
>     static void cortexR5_machine_init(MachineClass *mc){
>        //mc->name = "Cortex-R5f";
>         mc->desc = "Based on TMS570LC43x";
>         mc->init =  cortexR5_initf;
>         mc->max_cpus = 1;
>         mc->ignore_memory_transaction_failures = true;
>         mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-r5f");
>     }
> 
> 
> 
>     DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)
> 
> 
> 
> 
> Thanks in advanced,
> 
> João Gaspar
> 
> Enviado do Outlook <http://aka.ms/weboutlook>
