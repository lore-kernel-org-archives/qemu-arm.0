Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1385952ejb;
        Fri, 20 Oct 2023 10:15:05 -0700 (PDT)
X-Received: by 2002:a50:d502:0:b0:53e:4c39:5608 with SMTP id u2-20020a50d502000000b0053e4c395608mr1963515edi.17.1697822105402;
        Fri, 20 Oct 2023 10:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697822105; cv=none;
        d=google.com; s=arc-20160816;
        b=xRA2JMlHzZOHA5Ouo1/x686uaylYJio2XS30tzkChYbtOfz7JvXoeCiKE0bUWNlskV
         ftP4XfVJ2V7Zfz3fVQPAxAT3fwKXhfGGeBvYyBDUibB6T5hnYI2TeTeEd+j7/nNSmYP1
         oMVrgr3t27yV7UlvHShG3SYKvYNm4B4XcqQSHwmLnTsPob6+ZE/dMj49xXlAYtk5RoPF
         xy+QKughjmSv0/RjmkyTh52ZeCNKJcdZYP45xEdUM+pCWJ7WQXlF9dk1uaeUmAjiYvbg
         GikVe9oT1YPTNzr8ovtakliVUJQqzrbQfOH+AKQdoWqDRCGWf/+EC9CDMx6IG1YDeg8b
         6K7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XJY3Ry6FtyEI3t3XZXdMiTi8tAQ17I99btx+L90/ieE=;
        fh=SlEr4YSSaEZQNdeI53eyAjTSOJyba/ReXl3RhQdzBkY=;
        b=kHJp/hAKYxbMWxR6+XayFolhQPSDtCn8Ej6HuvHb3hPmPjAVcLeB6NeZvi/+CsQmlM
         0u2iBD8mEC+CyZ48z3hhAfUK5ZRSrsQI5LqYWJ6vzAq7GLVHSCcNufMGKmFlPgl0CITJ
         mjzagPExyMaL8Xho1aJTt3u/ngl1OJG71YNWHa9JsBJh8H9b3PtFF3ZBsDZCZKU0juhG
         EdXOJk9Cs0XjhX8YRxr3YzCVsU92IQzOkQfGnRbsOgplfNigX5SUqEC7G70PL6oHUZBn
         N6vbyS21JvL1X8lBkJFdR0m0jpIDW6lABDfiidhSkjiQnc/UapRVBbyRJN8FC7podhf8
         oV+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GizhFr4w;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w1-20020a50d781000000b0053290d861a6sor767908edi.0.2023.10.20.10.15.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 10:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GizhFr4w;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697822105; x=1698426905; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJY3Ry6FtyEI3t3XZXdMiTi8tAQ17I99btx+L90/ieE=;
        b=GizhFr4wBMlNbnr9CAfNuBbhBHI+KkWW1SlQqNj8rN9aakNDqLJu/jD3yitR9t3tGK
         BuP/c8E59ehPT0MKOf3u1M6R7TisuiYKfEEnLE9I/i4RpETaV/f1n9jDWRQbbFngHns+
         FVKlTlRUB76V8vC3MFme9QqBEaTDsYjmDTFY4h2wGf/DrU90wAB9/B1j9NBMbkG0ayrN
         jpBR8urfAy5abEuMe3tkjghN7ATAjhLHMOjtOYaD3QAaL2XSoitfTemdNdFjiqJOXkNZ
         Ac+c6r7a+sOlRNgGOuKTbLjXaWfZbYcSkL+uH/slcO5Y96W4rhBCeTH+wRsKWK1pV4YJ
         Bd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697822105; x=1698426905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJY3Ry6FtyEI3t3XZXdMiTi8tAQ17I99btx+L90/ieE=;
        b=PypZ7l5Bs6FtL4VMvMWkwqkuFaZJGFOwb3RQrzD7YF5QVfs1rerWFHW8DtXG5TlXMH
         knoXkwS9y2suxZENVpkBFFG8HNS6hhGcPyTc+liom+E7i8nxzgudThKbZm0KocebBDB0
         y0fk1qjxA2ADMNfCV46G10t2dJUDnL+JLCY69AcuDzIoacc/1a7LjR6UAqBymSN13tqb
         7pySQNbOJmtAhrHX3iljanenkw7Co235W38tGOnazSYfR8XbAYe1dy9Qi6E4EtXguJ30
         gqM5h2GRd7/Hxq7o46rnPWMmw5hvDnhlRYRnNqnmOiuwPxOD+sElIwSgXQQpv7hZUvt8
         4v7A==
X-Gm-Message-State: AOJu0Yw8A2E2URn+cJEBy1RijTFSTPS9C16EZKx5rtNbR4d3fmoZf/u+
	x5L3mk+EIdkXXU3+FV7p2XywVzrlquYa9hGFOCdMGkCl
X-Google-Smtp-Source: AGHT+IH5/JR5VVSrQGkiUAnBpgum7umVYRelaDbiWsj0/ab1+EHOinqsQQviwnMGDCLcf+X7qbrpmHsOx5yYi3ZZx2I=
X-Received: by 2002:a50:ccc6:0:b0:53e:197d:a4d with SMTP id
 b6-20020a50ccc6000000b0053e197d0a4dmr1963231edj.4.1697822104818; Fri, 20 Oct
 2023 10:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231020163643.86105-1-philmd@linaro.org> <20231020163643.86105-2-philmd@linaro.org>
In-Reply-To: <20231020163643.86105-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2023 18:14:53 +0100
Message-ID: <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/19] cpus: Add argument to qemu_get_cpu() to filter
 CPUs by QOM type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, David Woodhouse <dwmw2@infradead.org>, 
	Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>, 
	Thomas Huth <huth@tuxfamily.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Yanan Wang <wangyanan55@huawei.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, 
	Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aTcFtjSDRvrQ

On Fri, 20 Oct 2023 at 17:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Heterogeneous machines have different type of CPU.
> qemu_get_cpu() returning unfiltered CPUs doesn't make
> sense anymore. Add a 'type' argument to filter CPU by
> QOM type.

I'm not sure "filter by CPU type" is ever really the
correct answer to this problem, though.

Picking out a handful of arm-related parts to this patchset
as examples of different situations where we're currently
using qemu_get_cpu():

> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 474cfdc87c..1c1585f3e1 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -212,7 +212,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error =
**errp)
>
>      for (i =3D 0; i < smp_cpus; i++) {
>          SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->a7mpcore);
> -        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i));
> +        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i, NULL));
>
>          irq =3D qdev_get_gpio_in(d, ARM_CPU_IRQ);
>          sysbus_connect_irq(sbd, i, irq);

This is an Arm SoC object. What it wants is not "the i'th Arm
CPU in the whole system", but "the i'th CPU in this SoC object".
Conveniently, it has easy access to that: s->cpu[i].

> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
> index e7c3d99224..0a698171ab 100644
> --- a/hw/arm/pxa2xx_gpio.c
> +++ b/hw/arm/pxa2xx_gpio.c
> @@ -303,7 +303,7 @@ static void pxa2xx_gpio_realize(DeviceState *dev, Err=
or **errp)
>  {
>      PXA2xxGPIOInfo *s =3D PXA2XX_GPIO(dev);
>
> -    s->cpu =3D ARM_CPU(qemu_get_cpu(s->ncpu));
> +    s->cpu =3D ARM_CPU(qemu_get_cpu(s->ncpu, NULL));
>
>      qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
>      qdev_init_gpio_out(dev, s->handler, s->lines);

This is grabbing a private pointer to the CPU object[*], which
we can do more cleanly by setting a link property, and getting
the board code to pass a pointer to the CPU.

[*] it then uses that pointer to mess with the internals of
the CPU to implement wake-up-on-GPIO in a completely horrible
way, but let's assume we don't want to try to clean that up now...

> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3c7dfcd6dc..3571d5038f 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -275,7 +275,7 @@ static void create_fdt(SBSAMachineState *sms)
>
>      for (cpu =3D sms->smp_cpus - 1; cpu >=3D 0; cpu--) {
>          char *nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
> -        ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu));
> +        ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(cpu, NULL));
>          CPUState *cs =3D CPU(armcpu);
>          uint64_t mpidr =3D sbsa_ref_cpu_mp_affinity(sms, cpu);

This is in a board model. By definition the board model for a
non-heterogenous board knows it isn't in a heterogenous system
model, and it doesn't need to say "specifically the first Arm CPU".
So I think we should be able to leave it alone...

> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index bfd8aa5644..8c9098d5d3 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -65,7 +65,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error =
**errp)
>          /* Make the GIC's TZ support match the CPUs. We assume that
>           * either all the CPUs have TZ, or none do.
>           */
> -        cpuobj =3D OBJECT(qemu_get_cpu(0));
> +        cpuobj =3D OBJECT(qemu_get_cpu(0, NULL));
>          has_el3 =3D object_property_find(cpuobj, "has_el3") &&
>              object_property_get_bool(cpuobj, "has_el3", &error_abort);
>          qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
> @@ -90,7 +90,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error =
**errp)
>       * appropriate GIC PPI inputs
>       */
>      for (i =3D 0; i < s->num_cpu; i++) {
> -        DeviceState *cpudev =3D DEVICE(qemu_get_cpu(i));
> +        DeviceState *cpudev =3D DEVICE(qemu_get_cpu(i, NULL));
>          int ppibase =3D s->num_irq - 32 + i * 32;
>          int irq;
>          /* Mapping from the output timer irq lines from the CPU to the

This is another case where what we want is "the Nth CPU
associated with this peripheral block", not the Nth CPU of
some particular architecture. (It's not as easy to figure
out where we would get that from as it is in the fsl-imx7
case, though -- perhaps we would need to tweak the API
these objects have somehow to pass in pointers to the CPUs?)

> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 2ebf880ead..cdf21dfc11 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -392,7 +392,7 @@ static void arm_gicv3_common_realize(DeviceState *dev=
, Error **errp)
>      s->cpu =3D g_new0(GICv3CPUState, s->num_cpu);
>
>      for (i =3D 0; i < s->num_cpu; i++) {
> -        CPUState *cpu =3D qemu_get_cpu(i);
> +        CPUState *cpu =3D qemu_get_cpu(i, NULL);
>          uint64_t cpu_affid;
>
>          s->cpu[i].cpu =3D cpu;

These gicv3 uses of qemu_get_cpu() are because instead of doing
the theoretical Right Thing and having the GIC object have to
be told which CPUs it is responsible for, we took a shortcut
and said "there's only one GIC, and it's connected to all the CPUs".
The fix is, again, not filtering by CPU type, but having the
board and SoC models do the work to explicitly represent
"this GIC object is attached to these CPU objects" (via link
properties or otherwise).


So overall there are some places where figuring out the right
replacement for qemu_get_cpu() is tricky, and some places where
it's probably fairly straightforward but just an annoying
amount of extra code to write, and some places where we don't
care because we know the board model is not heterogenous.
But I don't think "filter by CPU architecture type" is usually
going to be what we want.

thanks
-- PMM
