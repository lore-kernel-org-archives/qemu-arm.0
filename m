Received: by 10.25.0.147 with SMTP id 141csp118059lfa;
        Mon, 20 Feb 2017 09:48:43 -0800 (PST)
X-Received: by 10.55.185.131 with SMTP id j125mr20593826qkf.115.1487612923736;
        Mon, 20 Feb 2017 09:48:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si5767709qtf.117.2017.02.20.09.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 09:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfs4p-0004Hn-4a
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 12:48:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs1r-00026E-RO
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs1o-00020a-Ak
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:45:39 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs1o-00020Q-62; Mon, 20 Feb 2017 12:45:36 -0500
Received: by mail-qt0-x243.google.com with SMTP id h53so14788781qth.3;
	Mon, 20 Feb 2017 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=P9yy/Fu/BtQVsVF8uLYwQVFT+d+HSDo40feU71LDdrU=;
	b=CuJbIyV4F0BI5x0nE5a65cjaXzQg6x9YtiFcB8wjE2D7KRqu13oXKg71ER9A1iGuj+
	HCnQ/udzjWfhloga63w6Je/waUgfBb1T3WRe8l3veVgwxRVa3CHrQhIRi2REnUT7DlJi
	reea3c+Y5Y1Pl/NLQiHtkeIti6XEFy4317HHIYv4soWV4le9ie6xwcp3jL3LUKwJYUmD
	LxfQAIPqr28j2lrFxHcLGufWBbCzO1+ErpwEIE8Q62gIfhnzXdC8SAuD3YUf0gJsS2rV
	Amy6IzaVIHk7325o5jaQUYu9nOvshkgORcsznIab/gR9rkGSxsyFpyqLXgadYtJPZIKy
	4VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=P9yy/Fu/BtQVsVF8uLYwQVFT+d+HSDo40feU71LDdrU=;
	b=DwYBMyRQdAkS0ci5VXpU/r/yzh1Xyj/Lu25Bla1c96hBctu+67xt138MPHtTWgxz06
	EDIuMYPazI/03nOAe1ohv5zksZ1tx5yJQB1EwQP+GHqy7JwbrCd+HdMTOjeVvFiHBdzu
	YeA4Bu3+pqK8J6ydDQ45cbLheQEpggzyU7XA0B9b0SjoKuk4RByIdROhP4VIjr9p9Efe
	p5WAGFG7eBgeOiUx+zrCQT3HUqKGC+OUezcylJPKy4mYXy3C7aCMWApZO2EK4qiAvThP
	QpTvpe3EnVSuvFnkvOpBjgJVqnUHf4rqSxyaa/CVMg1px7ibJaxmlRHR3aFi3uZGAoXy
	dZzw==
X-Gm-Message-State: AMke39kx+lCpa1n47k3RyAiNmrD7pPS5jZyx4udmDD7dvbkYS1Jw4o68PkqtoPirGPqjBA==
X-Received: by 10.200.36.41 with SMTP id c38mr22180193qtc.57.1487612735506;
	Mon, 20 Feb 2017 09:45:35 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	g32sm12386871qtd.28.2017.02.20.09.45.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 09:45:34 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-11-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f32893c7-5fa2-7075-4ca8-3d82b0f8eba7@amsat.org>
Date: Mon, 20 Feb 2017 14:45:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 10/11] stm32f205: Create armv7m
 object without using armv7m_init()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cFcLzmXV6vSl

On 02/20/2017 12:36 PM, Peter Maydell wrote:
> Switch the stm32f205 SoC to create the armv7m object directly
> rather than via the armv7m_init() wrapper. This fits better
> with the SoC model's very QOMified design.
>
> In particular this means we can push loading the guest image
> out to the top level board code where it belongs, rather
> than the SoC object having a QOM property for the filename
> to load.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/stm32f205_soc.h |  4 +++-
>  hw/arm/netduino2.c             |  7 ++++---
>  hw/arm/stm32f205_soc.c         | 16 +++++++++++++---
>  3 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
> index 1332141..e2dce11 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -31,6 +31,7 @@
>  #include "hw/adc/stm32f2xx_adc.h"
>  #include "hw/or-irq.h"
>  #include "hw/ssi/stm32f2xx_spi.h"
> +#include "hw/arm/armv7m.h"
>
>  #define TYPE_STM32F205_SOC "stm32f205-soc"
>  #define STM32F205_SOC(obj) \
> @@ -51,9 +52,10 @@ typedef struct STM32F205State {
>      SysBusDevice parent_obj;
>      /*< public >*/
>
> -    char *kernel_filename;
>      char *cpu_model;
>
> +    ARMv7MState armv7m;
> +
>      STM32F2XXSyscfgState syscfg;
>      STM32F2XXUsartState usart[STM_NUM_USARTS];
>      STM32F2XXTimerState timer[STM_NUM_TIMERS];
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 23d7928..3cfe332 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -27,17 +27,18 @@
>  #include "hw/boards.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f205_soc.h"
> +#include "hw/arm/arm.h"
>
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>
>      dev = qdev_create(NULL, TYPE_STM32F205_SOC);
> -    if (machine->kernel_filename) {
> -        qdev_prop_set_string(dev, "kernel-filename", machine->kernel_filename);
> -    }
>      qdev_prop_set_string(dev, "cpu-model", "cortex-m3");
>      object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       FLASH_SIZE);
>  }
>
>  static void netduino2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 38425bd..e6bd73a 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -49,6 +49,9 @@ static void stm32f205_soc_initfn(Object *obj)
>      STM32F205State *s = STM32F205_SOC(obj);
>      int i;
>
> +    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
> +    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
> +
>      object_initialize(&s->syscfg, sizeof(s->syscfg), TYPE_STM32F2XX_SYSCFG);
>      qdev_set_parent_bus(DEVICE(&s->syscfg), sysbus_get_default());
>
> @@ -110,8 +113,16 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      vmstate_register_ram_global(sram);
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>
> -    nvic = armv7m_init(get_system_memory(), FLASH_SIZE, 96,
> -                       s->kernel_filename, s->cpu_model);
> +    nvic = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(nvic, "num-irq", 96);
> +    qdev_prop_set_string(nvic, "cpu-model", s->cpu_model);
> +    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
> +                                     "memory", &error_abort);
> +    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>
>      /* System configuration controller */
>      dev = DEVICE(&s->syscfg);
> @@ -192,7 +203,6 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>  }
>
>  static Property stm32f205_soc_properties[] = {
> -    DEFINE_PROP_STRING("kernel-filename", STM32F205State, kernel_filename),
>      DEFINE_PROP_STRING("cpu-model", STM32F205State, cpu_model),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
