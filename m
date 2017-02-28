Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d75sm2806961wmd.25.2017.02.28.05.59.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 05:59:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 513003E0189;
	Tue, 28 Feb 2017 13:59:36 +0000 (GMT)
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Alistair Francis <alistair23@gmail.com>, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 04/11] armv7m: Use QOMified armv7m object in armv7m_init()
In-reply-to: <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 13:59:36 +0000
Message-ID: <87h93e2z7b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: mu8YjuwOstrz


Peter Maydell <peter.maydell@linaro.org> writes:

> Make the legacy armv7m_init() function use the newly QOMified
> armv7m object rather than doing everything by hand.
>
> We can return the armv7m object rather than the NVIC from
> armv7m_init() because its interface to the rest of the
> board (GPIOs, etc) is identical.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/arm/armv7m.c | 49 ++++++++++++-------------------------------------
>  1 file changed, 12 insertions(+), 37 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 56d02d4..36f213c 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -131,21 +131,6 @@ static void bitband_init(Object *obj)
>      sysbus_init_mmio(dev, &s->iomem);
>  }
>
> -static void armv7m_bitband_init(void)
> -{
> -    DeviceState *dev;
> -
> -    dev = qdev_create(NULL, TYPE_BITBAND);
> -    qdev_prop_set_uint32(dev, "base", 0x20000000);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x22000000);
> -
> -    dev = qdev_create(NULL, TYPE_BITBAND);
> -    qdev_prop_set_uint32(dev, "base", 0x40000000);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x42000000);
> -}
> -
>  /* Board init.  */
>
>  static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> @@ -283,35 +268,25 @@ static void armv7m_reset(void *opaque)
>
>  /* Init CPU and memory for a v7-M based board.
>     mem_size is in bytes.
> -   Returns the NVIC array.  */
> +   Returns the ARMv7M device.  */
>
>  DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>                        const char *kernel_filename, const char *cpu_model)
>  {
> -    ARMCPU *cpu;
> -    CPUARMState *env;
> -    DeviceState *nvic;
> +    DeviceState *armv7m;
>
>      if (cpu_model == NULL) {
> -	cpu_model = "cortex-m3";
> +        cpu_model = "cortex-m3";
>      }
> -    cpu = cpu_arm_init(cpu_model);
> -    if (cpu == NULL) {
> -        fprintf(stderr, "Unable to find CPU definition\n");
> -        exit(1);
> -    }
> -    env = &cpu->env;
> -
> -    armv7m_bitband_init();
> -
> -    nvic = qdev_create(NULL, "armv7m_nvic");
> -    qdev_prop_set_uint32(nvic, "num-irq", num_irq);
> -    env->nvic = nvic;
> -    qdev_init_nofail(nvic);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
> -                       qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
> -    armv7m_load_kernel(cpu, kernel_filename, mem_size);
> -    return nvic;
> +
> +    armv7m = qdev_create(NULL, "armv7m");
> +    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
> +    qdev_prop_set_string(armv7m, "cpu-model", cpu_model);
> +    /* This will exit with an error if the user passed us a bad cpu_model */
> +    qdev_init_nofail(armv7m);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), kernel_filename, mem_size);
> +    return armv7m;
>  }
>
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)


--
Alex Bennée
