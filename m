Received: by 10.103.98.197 with SMTP id w188csp343477vsb;
        Tue, 21 Feb 2017 03:36:20 -0800 (PST)
X-Received: by 10.202.194.70 with SMTP id s67mr12328159oif.4.1487676980685;
        Tue, 21 Feb 2017 03:36:20 -0800 (PST)
Return-Path: <alistair23@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com. [2607:f8b0:4003:c0f::242])
        by mx.google.com with ESMTPS id x84si416908oix.103.2017.02.21.03.36.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Feb 2017 03:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c0f::242 as permitted sender) client-ip=2607:f8b0:4003:c0f::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c0f::242 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-ot0-x242.google.com with SMTP id k4so3047440otc.0;
        Tue, 21 Feb 2017 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ple4YiEVcM4/+NPVV/HDh92lXgaYvY8MobSnz6V62XY=;
        b=kdlmIWkGuu/3NIqfWWg7d3LjpfKSHCQ/IK2X3Fyz/1Dm9qVXDo7Gh61tuT6y/OQAG4
         8DVs8WxDMffDmtrrZNMX5cDLfhh35vQ0BAiHBLAlbJpTXuxDAjDWCII1CPb+rPLGA5v8
         iV6q1JXOLlUVmoWFlcjixSAQJMgfVlLI2pRirnHwTqPiq2AfL/BUd6qR6OudwHlLEZZX
         gkiXYq6dldZk7An/IEY2kZV1e1tAw4+XjVQ41boU3Ilwbskp/RdHJ6hEQmKJHsRFy5xJ
         WckWryQFF6xzga5LYk7BOxCZpu5g7JWJ3CXI1H8bhXUeravc1TqIJIqZlHP4QQwN4pgM
         WyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ple4YiEVcM4/+NPVV/HDh92lXgaYvY8MobSnz6V62XY=;
        b=D9BeP6FJMu4eJUNZYAf9XYEujWSiy6JgzsLOGH2zRwReALRLvEbLxYy8VRZ+eHaHUu
         jw27Py56GhSOkgAdZFHZW6z3DwXcZdNxGHpwNyLzouqTjU0unxyOS9sPcZzK1beeH4O/
         /JOiIIhucCqmXnQv8WSwqvV/DO3VhFnBoFCKMh89VIdYqPzOf0SLfCgDkBFzz6DbyM58
         tieOMC/baRdPK0iUVbXX9WkpzzNVcex3adIps3yr2KneoFd9BBxuXNUkAGtE8wyZ7JVM
         KiTnsE0UAl3i0l3HZhGYpQD2Nl7i9E5KPo2ITeerzB05eZUsYjtgQ92qhW+uCcEhG7n5
         jSSg==
X-Gm-Message-State: AMke39lMXrxG3UQGfisEKeERa9u3pLSY3oXR+HFjUxEPFcOnvEvsKPWLNfYo5xyPGHY0D9Ck8a5CKkOv/UiMMQ==
X-Received: by 10.157.60.241 with SMTP id t46mr15361861otf.224.1487676980327;
 Tue, 21 Feb 2017 03:36:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.183.26.67 with HTTP; Tue, 21 Feb 2017 03:35:49 -0800 (PST)
In-Reply-To: <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Feb 2017 03:35:49 -0800
Message-ID: <CAKmqyKPLsevYz52KKGw2tfiZXdbeagd8zEKAMJvSV2ELGsRx9w@mail.gmail.com>
Subject: Re: [PATCH 04/11] armv7m: Use QOMified armv7m object in armv7m_init()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: 6fTireCEgKSB

On Mon, Feb 20, 2017 at 7:35 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Make the legacy armv7m_init() function use the newly QOMified
> armv7m object rather than doing everything by hand.
>
> We can return the armv7m object rather than the NVIC from
> armv7m_init() because its interface to the rest of the
> board (GPIOs, etc) is identical.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
> -       cpu_model = "cortex-m3";
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
> --
> 2.7.4
>
