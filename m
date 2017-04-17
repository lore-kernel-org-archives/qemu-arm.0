Received: by 10.25.0.144 with SMTP id 138csp1116541lfa;
        Sun, 16 Apr 2017 20:26:10 -0700 (PDT)
X-Received: by 10.55.19.16 with SMTP id d16mr6727240qkh.142.1492399570233;
        Sun, 16 Apr 2017 20:26:10 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id c27si9603389qta.207.2017.04.16.20.26.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Apr 2017 20:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id v75so18001440qkb.3;
        Sun, 16 Apr 2017 20:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=CXPNblC5t7eFi+mbKs8k1TVuCjDDdsd+N4ygQsm7wPg=;
        b=XpyZrhYE5JhiP+WLwMSaVFBPLSJQShGSvz78nEZL4xnKPjzMRqvrIh/sMXdH3vY9XB
         +oEIs9HuzA9GS7dKz96PHkbGRcp2HPknkbPpoySDH4Nd0kQ+uI05zZXHnYOCBg9SbXZS
         Npyr/4Vo6sEivHZJVl8sKP6ESGieK0OhtxGD3XrAmZAsPqiObFFUmzpOeDNPByUjIRv4
         PMmfWRhvEdFSoZ7QpwRWZYkJCrVtjxh5PInDIpH9f301XPeUVR/4HbRkzt08jPWZji2V
         6jiLYlIWi32nMFzedqwvui0h6Zm2KUx7i2bmPR/Q0pSTt4SdOw2QuxbA1lwHFzwEyp98
         Pq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=CXPNblC5t7eFi+mbKs8k1TVuCjDDdsd+N4ygQsm7wPg=;
        b=PWlKM1oBZoAkdSON8xA+qotow9MzSO0bLHCfSLL9nJNZbGVR7pu98NrKMw8jiyrRsR
         WPO9DpjP+ih09ScSROs+fVdKmgJrNonFn7i2aQxnfGSguWO8lesuVLDkeGfpBFIf8EhO
         0tm0cNrGNjIqPF9aIOU+bs3Biy0BcxaOGHAVBXqWtbWO5AIKSMe+aEjwe2pdkigySDPg
         yFr8roHVFwO5efWizsMhQfZRqdEAm9k1K4VYYQhHsgiod/WmslYYOlrQ9Tal5WqQIADV
         p9LOYG+yeLot9TUJ9crB0RP7UbzKdOOs21bClJ18eNevvK/HSLTA6BGUTGVvPgDko9vM
         pZIA==
X-Gm-Message-State: AN3rC/4yhDUTnsHgTfM0FfNe5m/l8nRPFxbflAi05Ha8loEfzgheDpPM
	rIf5csg3jqSmUv2vN64=
X-Received: by 10.55.43.219 with SMTP id r88mr7582478qkr.143.1492399569705;
        Sun, 16 Apr 2017 20:26:09 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id u68sm5158150qku.2.2017.04.16.20.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Apr 2017 20:26:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 06/11] armv7m: Make NVIC expose a memory
 region rather than mapping itself
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
 <1487604965-23220-7-git-send-email-peter.maydell@linaro.org>
Cc: Alistair Francis <alistair23@gmail.com>,
 Michael Davidsaver <mdavidsaver@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e0853a2f-7cc0-9ee5-fed6-d5af02e86b06@amsat.org>
Date: Mon, 17 Apr 2017 00:26:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0O45a8AnkfWB

On 02/20/2017 12:36 PM, Peter Maydell wrote:
> Make the NVIC device expose a memory region for its users
> to map, rather than mapping itself into the system memory
> space on realize, and get the one user (the ARMv7M object)
> to do this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/armv7m.c       | 7 ++++++-
>  hw/intc/armv7m_nvic.c | 7 ++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 638c597..fb21f74 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -172,6 +172,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>  {
>      /* here realize our children */
>      ARMv7MState *s = ARMV7M(dev);
> +    SysBusDevice *sbd;
>      Error *err = NULL;
>      int i;
>      char **cpustr;
> @@ -233,10 +234,14 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
>
>      /* Wire the NVIC up to the CPU */
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nvic), 0,
> +    sbd = SYS_BUS_DEVICE(&s->nvic);
> +    sysbus_connect_irq(sbd, 0,
>                         qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
>      s->cpu->env.nvic = &s->nvic;
>
> +    memory_region_add_subregion(&s->container, 0xe000e000,
> +                                sysbus_mmio_get_region(sbd, 0));
> +
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
>          Object *obj = OBJECT(&s->bitband[i]);
>          SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index f2ada39..c814e16 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -19,7 +19,6 @@
>  #include "hw/arm/arm.h"
>  #include "hw/arm/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/log.h"
>  #include "trace.h"
>
> @@ -1043,10 +1042,8 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>                            "nvic_sysregs", 0x1000);
>      memory_region_add_subregion(&s->container, 0, &s->sysregmem);
>
> -    /* Map the whole thing into system memory at the location required
> -     * by the v7M architecture.
> -     */
> -    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> +
>      s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
>  }
>
>
