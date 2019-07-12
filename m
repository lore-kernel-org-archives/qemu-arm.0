Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1142618wrv;
        Fri, 12 Jul 2019 10:28:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUJsxqMs7OGNtezTqvLwXeRbwyTNv5Inm/9nPWzU8hznGvuFfEgpMsdDZx3PACbjgv/B5Q
X-Received: by 2002:a05:6402:145a:: with SMTP id d26mr10508313edx.10.1562952537513;
        Fri, 12 Jul 2019 10:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562952537; cv=none;
        d=google.com; s=arc-20160816;
        b=0xvxhXcu20KJ8gHMIVvDHyYT+RmnnuzA+L6djsrRgzo04Z3AsNKGTYoVsnk/3Dq4Tm
         1P3zrP35hGf/UnJUEikcw9rdX4+eaVoXgced5SvFaTbXGH91fQJlyzKcjVkFmkCWFBIZ
         3qtFkX4QYUZLPlM3N1dhW2EqpoWHDblA2giAF7sm6eb47TrGiDNWp/T1ribDy2A7rGDh
         yeMF/t+MeLMBxi9Ve6LMb6J/5hv7xSD155BaMYk/UxPGZMouqBcYR6GIqm8f/WJOd5rL
         ZM/JqsSEC/DHPZ8/M1CaL3cQcvLzFmcf30qwQZOniOuFL5dXPBfPA77wHwyc1VGay/JC
         26Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=9Iua3+7y3KjwQ//Ijl/1tDlJTjpt1E8gdBd/UZUqInQ=;
        b=rBAOXAKd1r7Bakkz83ka1wUmWtjT4eGgdkKYOccU3CS9PsGFGyx7PVveC+CBvXUDaV
         yrWyYqN0fXLB9dZjXpLHXrAc0TjzSgJCtUX1LgsSiUD13qOYFz/PLmzhAPGau6kiYbJe
         6Ugqs0OQV7x9XOtf9iSs6YzDSfU8oYJRGEGbiVkqc60qGSUaNG00qO7npxRlxT0nT50D
         7s/sqiAYkuojY9uYn23JEvYQfuYqFfwp6DuEQbMmpgAizJEcVnubt1xhuqU8lawdzaVK
         E6hCTkl7rFLWd8jAknJemP5MMN+NE8JBfEmwAKRWefCEV2kTJSc8fez0LsdaPmVi6YN0
         Wzcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22si4876349eje.19.2019.07.12.10.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 10:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlzLs-0000mb-KO
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 13:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37603)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlzLo-0000mP-52
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlzLm-0004SF-N3
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:28:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44928)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hlzLm-0004Rg-FF
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 13:28:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so10734566wrf.11
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 10:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Iua3+7y3KjwQ//Ijl/1tDlJTjpt1E8gdBd/UZUqInQ=;
 b=sH4C71ljT/lxZrQVDdaPzJHa7nWYjg/ehIIcIwFAb0/7CmZawl8Up8jHSdueBxE1pJ
 CmnpW+CEYgV9/nnkXjbw1gfAK/DRdxxjGX1RaSSQKQtAdUDV2C2I9U5NAHdGs1n9P4U5
 RCsbNFpJ6gvrtf4+NMtAADCUfok/RuoQVVyi9FZPhzMY8ymHBKWKWgtrhBV6FLPHhEc5
 bUQDPJyK62G/hHiBl1tV4LZHPhDydIxSTnDLcpPWHJKLNtOGL3YTKFKf6dNceKqsn7Qp
 c4VTMCHNLRC7AWJbkWtYKxw6oHdomVwrUh4M9oJbLfOnAfIugTt3NEnoWmq+LdPPvb2x
 SmAw==
X-Gm-Message-State: APjAAAV+flqlXVBkF8JHFM4BfSuyQekLyrzPRVUOeD5AVh9yywBpE0YN
 xVw+NcnNolnlw4GzeQU0Gexvqw==
X-Received: by 2002:adf:fc8d:: with SMTP id g13mr6521798wrr.234.1562952529440; 
 Fri, 12 Jul 2019 10:28:49 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id h6sm8759697wre.82.2019.07.12.10.28.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 10:28:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190712115030.26895-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5e29549d-cc13-a44e-cd8b-ae63ced1f9a9@redhat.com>
Date: Fri, 12 Jul 2019 19:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712115030.26895-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH for-4.1?] hw/arm/fsl-imx6ul.c: Remove dead
 SMP-related code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TGx6OC5OZapA

On 7/12/19 1:50 PM, Peter Maydell wrote:
> The i.MX6UL always has a single Cortex-A7 CPU (we set FSL_IMX6UL_NUM_CPUS
> to 1 in line with this). This means that all the code in fsl-imx6ul.c to
> handle multiple CPUs is dead code, and Coverity is now complaining that
> it is unreachable (CID 1403008, 1403011).
> 
> Remove the unreachable code and the only-executes-once loops,
> and replace the single-entry cpu[] array in the FSLIMX6ULState
> with a simple cpu member.

The header says "Based on hw/arm/fsl-imx7.c" which has
FSL_IMX7_NUM_CPUS=2, makes sense.

Looking at the i.MX 6:

include/hw/arm/fsl-imx6.h:38:#define FSL_IMX6_NUM_CPUS 4

Ok, we can have 1/2/4 cpus in the family.

The UltraLite series is part of the i.MX 6 family, I wonder why we
needed a different FslIMX6ULState than FslIMX6State.

Anyway, not related to this cleanup patch, so meanwhile:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The only real reason to put this into 4.1 is because it fixes
> some Coverity issues, and it would be nice to be able to get
> down to no Coverity issues for the release. I think that pre-rc1
> that's a reasonable reason to put this in.

Agreed.

> Disclaimer: tested with "make check" as I have no test image for
> this board.
> 
>  include/hw/arm/fsl-imx6ul.h |  2 +-
>  hw/arm/fsl-imx6ul.c         | 62 +++++++++++--------------------------
>  hw/arm/mcimx6ul-evk.c       |  2 +-
>  3 files changed, 20 insertions(+), 46 deletions(-)
> 
> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index 9e94e98f8ee..eda389aec7d 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h
> @@ -61,7 +61,7 @@ typedef struct FslIMX6ULState {
>      DeviceState    parent_obj;
>  
>      /*< public >*/
> -    ARMCPU             cpu[FSL_IMX6UL_NUM_CPUS];
> +    ARMCPU             cpu;
>      A15MPPrivState     a7mpcore;
>      IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
>      IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index f8601654388..b074177a71d 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -29,16 +29,12 @@
>  
>  static void fsl_imx6ul_init(Object *obj)
>  {
> -    MachineState *ms = MACHINE(qdev_get_machine());
>      FslIMX6ULState *s = FSL_IMX6UL(obj);
>      char name[NAME_SIZE];
>      int i;
>  
> -    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6UL_NUM_CPUS); i++) {
> -        snprintf(name, NAME_SIZE, "cpu%d", i);
> -        object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
> -                                "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
> -    }
> +    object_initialize_child(obj, "cpu0", &s->cpu, sizeof(s->cpu),
> +                            "cortex-a7-" TYPE_ARM_CPU, &error_abort, NULL);
>  
>      /*
>       * A7MPCORE
> @@ -161,42 +157,25 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>      MachineState *ms = MACHINE(qdev_get_machine());
>      FslIMX6ULState *s = FSL_IMX6UL(dev);
>      int i;
> -    qemu_irq irq;
>      char name[NAME_SIZE];
> -    unsigned int smp_cpus = ms->smp.cpus;
> +    SysBusDevice *sbd;
> +    DeviceState *d;
>  
> -    if (smp_cpus > FSL_IMX6UL_NUM_CPUS) {
> -        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
> -                   TYPE_FSL_IMX6UL, FSL_IMX6UL_NUM_CPUS, smp_cpus);
> +    if (ms->smp.cpus > 1) {
> +        error_setg(errp, "%s: Only a single CPU is supported (%d requested)",
> +                   TYPE_FSL_IMX6UL, ms->smp.cpus);
>          return;
>      }
>  
> -    for (i = 0; i < smp_cpus; i++) {
> -        Object *o = OBJECT(&s->cpu[i]);
> -
> -        object_property_set_int(o, QEMU_PSCI_CONDUIT_SMC,
> -                                "psci-conduit", &error_abort);
> -
> -        /* On uniprocessor, the CBAR is set to 0 */
> -        if (smp_cpus > 1) {
> -            object_property_set_int(o, FSL_IMX6UL_A7MPCORE_ADDR,
> -                                    "reset-cbar", &error_abort);
> -        }
> -
> -        if (i) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> -            object_property_set_bool(o, true,
> -                                     "start-powered-off", &error_abort);
> -        }
> -
> -        object_property_set_bool(o, true, "realized", &error_abort);
> -    }
> +    object_property_set_int(OBJECT(&s->cpu), QEMU_PSCI_CONDUIT_SMC,
> +                            "psci-conduit", &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpu), true,
> +                             "realized", &error_abort);
>  
>      /*
>       * A7MPCORE
>       */
> -    object_property_set_int(OBJECT(&s->a7mpcore), smp_cpus, "num-cpu",
> -                            &error_abort);
> +    object_property_set_int(OBJECT(&s->a7mpcore), 1, "num-cpu", &error_abort);
>      object_property_set_int(OBJECT(&s->a7mpcore),
>                              FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL,
>                              "num-irq", &error_abort);
> @@ -204,18 +183,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>                               &error_abort);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
>  
> -    for (i = 0; i < smp_cpus; i++) {
> -        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
> -        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
> +    sbd = SYS_BUS_DEVICE(&s->a7mpcore);
> +    d = DEVICE(&s->cpu);
>  
> -        irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
> -        sysbus_connect_irq(sbd, i, irq);
> -        sysbus_connect_irq(sbd, i + smp_cpus, qdev_get_gpio_in(d, ARM_CPU_FIQ));
> -        sysbus_connect_irq(sbd, i + 2 * smp_cpus,
> -                           qdev_get_gpio_in(d, ARM_CPU_VIRQ));
> -        sysbus_connect_irq(sbd, i + 3 * smp_cpus,
> -                           qdev_get_gpio_in(d, ARM_CPU_VFIQ));
> -    }
> +    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
> +    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
> +    sysbus_connect_irq(sbd, 2, qdev_get_gpio_in(d, ARM_CPU_VIRQ));
> +    sysbus_connect_irq(sbd, 3, qdev_get_gpio_in(d, ARM_CPU_VFIQ));
>  
>      /*
>       * A7MPCORE DAP
> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
> index bbffb11c2a8..1f6f4aed97c 100644
> --- a/hw/arm/mcimx6ul-evk.c
> +++ b/hw/arm/mcimx6ul-evk.c
> @@ -71,7 +71,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
>      }
>  
>      if (!qtest_enabled()) {
> -        arm_load_kernel(&s->soc.cpu[0], &boot_info);
> +        arm_load_kernel(&s->soc.cpu, &boot_info);
>      }
>  }
>  
> 
