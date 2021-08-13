Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp881254lff;
        Thu, 12 Aug 2021 18:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVDGmBh2JETJFHGlgflma/lTvz3N2c90RybZX1K3caBARvs+M905affCOaOOOV5wpJaoox
X-Received: by 2002:a37:586:: with SMTP id 128mr7811677qkf.366.1628818752480;
        Thu, 12 Aug 2021 18:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628818752; cv=none;
        d=google.com; s=arc-20160816;
        b=sr3qO1S8gGAjkccZN2OZ20gUwBjz9l9yPQ4LhIGjuIjapxgwB8dsgqTeN2CUCxxmUu
         Psrl9WI1N79In9jxxi/fFCeRs8vqBuZ5w/LKLnk8eEkX4UyfP2XIXUE75gEkMusdnZl3
         EYSK8kQLvlgv/syD68goqnaxCgK6aiShN0RR3pLr5i4ey3cqNGwkKcqY7jmQCSR6DgKL
         bSACf57MbnoA/9lo1VLjSDoFO08QkYKY4bVljbnIl+/Isr6kLoddTnitgsnw5OmpmzB7
         LuzjBQ7X9enbPy+6zn1i4QeYN3K6/XX4OVatUh7aW7YTjGIgmlzoUd8mOLjf3F4nHGxS
         NNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JW4oMW//NL+fhxqetKj/F+bufdpVqjh4TxSO34/nyQk=;
        b=SiaNPTX3GJNxfud/kVfsvFkTOzsoC9FjYUw/Ev6Dp4VajYhFeRcNow20ctjYNk02zN
         TG4iUr+ItrxwbS7vkzhq/t6jOve/94/WY4fdcMmnG3i2Htu/kmAODXnHIcWX08XXF0i+
         6k0xrt0MUxyMFGl4dl1H5I5eUF2XsQBpk4hAfA7xtrVurMEYMPP1d54IYAJi6yHgBkTl
         PBpX42GmKt6hUTX+vOIRN+sEnh6pn8u08aJ4aIkTeRHxn/s5M8igImf/v5/dlMGlQ+A7
         TqzgfuP16doe8fXH+5wagLcMn6lmx5bf3J961ti2F/IDPv++2rfQ4uKNOhnUkDKqyeP7
         DSUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qcRU7zP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si29752qkb.96.2021.08.12.18.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 18:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qcRU7zP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEMAB-0001kP-Pb
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 21:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM97-0008W6-5c; Thu, 12 Aug 2021 21:38:05 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:33507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM95-0002DA-F2; Thu, 12 Aug 2021 21:38:04 -0400
Received: by mail-il1-x12e.google.com with SMTP id z2so9249418iln.0;
 Thu, 12 Aug 2021 18:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JW4oMW//NL+fhxqetKj/F+bufdpVqjh4TxSO34/nyQk=;
 b=qcRU7zP5qVZfz841k70YtTDJ+cuOSVMBt4Nv6CoDcuOrJfyG55TQ1mZK3uqDvTqOx5
 actIkiTQqLkKVQtlrLPFo1l3SZpbMO6WT+EMM8gbCfpuQot5g1dfqBzUjk1qTvYvMyvk
 9HgF+7B/xJGmaYVpGUWUgTuKv/xbcqKnIFGQEStpWKOORxszYIt7xquoCHSYOIEn1RFZ
 66GGB7Zyg3a7JTI10rUEMS/rhjPJIGQ9Ey40nsQZCzJuejvRI83RkVRUdnNXGLEeC+jC
 8sEi1OA/PCNDseYU5EBGqxJFGM0X9m/BL6Its2X8WiuvU3slA3GJtptuhxMGmQLXeYdi
 Ljcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JW4oMW//NL+fhxqetKj/F+bufdpVqjh4TxSO34/nyQk=;
 b=My1nX0e84AZ6J0fVWSbPng0zCTnO7xhMtnwK3xQxOQW+PYZhFhO5HAFBVeuX46AW/l
 87HCNVi2WT6QtsUkG5YHi6f+99EmXhxLefPHWMcMeRwkI3GDgHAVkSHLkKuIZZy8fklp
 i2QXs7fkJsH3eVRvz+Md0KQh7jz+76UFuSD8WSC/8r9IZMhIGTqULIyFg36R8mW13z+c
 KkY6jsnsYNys4NJGlbkkkhIO506ANFw+wR1nODgnsMMRryQ4H4ANcQONaO1lJuAV6tsT
 0+dI1h136hqypgtlFUcz/d2cYbx6UK4aRZh32SVbDjTJD7iRTMIg2dI07WLJLc7tIx6S
 KBtQ==
X-Gm-Message-State: AOAM532f8d/FYXyQ20a0uz3CDov6Y2jAsn3mjfV/+iF9iierGsZ2z+lC
 jigQtcAk4T8GhZSQdSPE+oPdFKSwI4klJ94LJt4=
X-Received: by 2002:a92:c24d:: with SMTP id k13mr7632ilo.227.1628818682009;
 Thu, 12 Aug 2021 18:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-14-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-14-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:37:36 +1000
Message-ID: <CAKmqyKOyphnH8rzHk_mvz16ENX078_uaJne=M0UTRKDrmg_JpQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 13/25] hw/arm/stm32f405: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W/ydHazsJmIv

On Thu, Aug 12, 2021 at 7:41 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Wire up the sysclk and refclk for the stm32f405 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduinoplus2 board where the
> systick reference clock was running at 1MHz rather than 21MHz.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/stm32f405_soc.h |  3 +++
>  hw/arm/netduinoplus2.c         | 12 +++++++-----
>  hw/arm/stm32f405_soc.c         | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 347105e709b..5bb0c8d5697 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -68,6 +68,9 @@ struct STM32F405State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
>  };
>
>  #endif
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index d3ad7a2b675..a5a8999cc8c 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -26,6 +26,7 @@
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f405_soc.h"
>  #include "hw/arm/boot.h"
> @@ -36,16 +37,17 @@
>  static void netduinoplus2_init(MachineState *machine)
>  {
>      DeviceState *dev;
> +    Clock *sysclk;
>
> -    /*
> -     * TODO: ideally we would model the SoC RCC and let it handle
> -     * system_clock_scale, including its ability to define different
> -     * possible SYSCLK sources.
> -     */
>      system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
>      dev = qdev_new(TYPE_STM32F405_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      armv7m_load_kernel(ARM_CPU(first_cpu),
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index cb04c111987..0019b7f4785 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -28,6 +28,7 @@
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/arm/stm32f405_soc.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/misc/unimp.h"
>
>  #define SYSCFG_ADD                     0x40013800
> @@ -80,6 +81,9 @@ static void stm32f405_soc_initfn(Object *obj)
>      }
>
>      object_initialize_child(obj, "exti", &s->exti, TYPE_STM32F4XX_EXTI);
> +
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>  }
>
>  static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -91,6 +95,30 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      Error *err = NULL;
>      int i;
>
> +    /*
> +     * We use s->refclk internally and only define it with qdev_init_clock_in()
> +     * so it is correctly parented and not leaked on an init/deinit; it is not
> +     * intended as an externally exposed clock.
> +     */
> +    if (clock_has_source(s->refclk)) {
> +        error_setg(errp, "refclk clock must not be wired up by the board code");
> +        return;
> +    }
> +
> +    if (!clock_has_source(s->sysclk)) {
> +        error_setg(errp, "sysclk clock must be wired up by the board code");
> +        return;
> +    }
> +
> +    /*
> +     * TODO: ideally we should model the SoC RCC and its ability to
> +     * change the sysclk frequency and define different sysclk sources.
> +     */
> +
> +    /* The refclk always runs at frequency HCLK / 8 */
> +    clock_set_mul_div(s->refclk, 8, 1);
> +    clock_set_source(s->refclk, s->sysclk);
> +
>      memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
>                             FLASH_SIZE, &err);
>      if (err != NULL) {
> @@ -116,6 +144,8 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(armv7m, "num-irq", 96);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
>      object_property_set_link(OBJECT(&s->armv7m), "memory",
>                               OBJECT(system_memory), &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> --
> 2.20.1
>
>
