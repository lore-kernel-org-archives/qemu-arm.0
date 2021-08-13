Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp880382lff;
        Thu, 12 Aug 2021 18:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHr0UG9psLHTPh9u8CdnDWW8cLLtsbUlntuFh43c30SnpR6e+gTT0ZekW9xtuUvCjRyCTO
X-Received: by 2002:a05:6102:21b3:: with SMTP id i19mr63004vsb.9.1628818659538;
        Thu, 12 Aug 2021 18:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628818659; cv=none;
        d=google.com; s=arc-20160816;
        b=AWReN959rWoknKhFyNpa+KK8KGaBPUq3GET1SExTu39dfIAQWHzKn1eWxlAA+T/10/
         4KuztJUQ2EcRdHSPXcGSmtT1P9L2o2i2l07CJWIjY8Mz1VZtdrFUgBMvps+1wnex5g6K
         jeI0pIuJW4RoimVfMEZr5IQyatyWBsEMj13eTa4TydvJ0jhQgAyjVAhS2paW8/4ta5O8
         /OQYQSrYLjsAUFsn2+wNENVCLS+nB3rxWoDjpYrqxk8JeYsOV1mR7gNkSiki5c/ae56j
         lXZn3rmGrwgqqGG0mqF9/0ROPX/UxrJiQ/jqFMuHO5e8Cu92OKWpH2Mju/pAOQizqm6D
         EymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stckWfUInqX6cgAQEYA0ejRBQCOZnjvZZ1q30MXXPVM=;
        b=ARqoIuOgO5Xy26VQhEV9TbJKMbwQI8LpkrVQfJp3lDRgI0PEs4tAAngf3xlVguZAS7
         HI57/vlJqFBAelFCHYxlUJjgriWtOG7YpCZYPrmHD0GjTeIISZOIt2DnEh+Nh1/Jr/ry
         XBXVsBC35paxJFtIbKCoUXlrSh6499gf6McicS++HX1srhn2JkA0kW/maAffVXa+HuR7
         6Hh5vvMdllZuCylu05JJ3ZGgG3EbyB7esIRTrq63PIjV8zMvPEmJJeeeJw/iLvzCrgPl
         BvmsoISZyyQIAYFm5kQHvyi/KHjSJpI63YH2sU7irbnWpcBpA5tfHqRusBkWzk9zvslf
         gP/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T6flCWJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si10052vsb.35.2021.08.12.18.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 18:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T6flCWJu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEM8g-0007Tm-TA
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 21:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM8V-0007TJ-Tq; Thu, 12 Aug 2021 21:37:27 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:36482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM8U-0001o8-4O; Thu, 12 Aug 2021 21:37:27 -0400
Received: by mail-il1-x132.google.com with SMTP id w6so4232072ill.3;
 Thu, 12 Aug 2021 18:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=stckWfUInqX6cgAQEYA0ejRBQCOZnjvZZ1q30MXXPVM=;
 b=T6flCWJu2nEfmZuQ36uvooqdy8oYrpLvIsXnRqm7J8glSq2PZikMeAdj+HQ9K/S7+Z
 SrdR4nEiOOVbdEHZZxG6fcYyerDiQ7BOHmaFsPX3EMFb/jTyvlHWlmYMqjz9i43A444e
 Q8Mj2VX9f1tn2zw269s5Nq5oQhIjL/Cc2nafiJ/V5welxwHBLjqXy2jufiTQl+AciCqk
 nN/HmgrmABv8wGjds05VpW9NVQM32TQ7muUbZ39xzybpTacL3xIVb76EbD0DgnOT83Aq
 nC3zNESjQQ/354ENfrQS0MgNdbKNea6w2crBYggEg/uzLU6R4rlS+seeOlTqBKV3IVKm
 JOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=stckWfUInqX6cgAQEYA0ejRBQCOZnjvZZ1q30MXXPVM=;
 b=ahxDEcOqGu8ymolcmv4ITga6+/tvLxDgC1al2v/inHTsXYRQPTlvU8Vo2jqMOrZ4IP
 Up+B7KhzP1W6bULXh2e8Jmzc8oGJq+J1PjfOoLV1uCRIDf9zG0zdcEjjSyLPnVg2Rcmp
 US4OzN6sx5Xgk57OkHMD3tCjJjcUJYKb1/WDOxYpj86kv5liueH0pIicQQb7n5GewcPY
 WsYzaTAvETYvt/0N3poQvg5bOLr4mIIQO/tXgBqAKgKBJQ8qIGC4sdfdhygISApKnPDL
 Xe/33eAiTn7SriBfWc7c5pGVR2qYQ3KtRWMPi40Hcl3KbRETUx34QlWqoBJCc0yiDRMU
 qnwQ==
X-Gm-Message-State: AOAM530sk1iXYafWHC907rAGZLexj88XZ5OVbdMxUle/SXV005FnRYw+
 rWotoKKyjO2gWeN5PChNuQh/+e+Q5AuiH+3Zxl8=
X-Received: by 2002:a05:6e02:1d8d:: with SMTP id
 h13mr39030ila.40.1628818644950; 
 Thu, 12 Aug 2021 18:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-12-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-12-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:36:59 +1000
Message-ID: <CAKmqyKMs5W8C62U5xUJUFxtn9ydRS2UgQ7YVf4JG-+m17W3W_g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 11/25] hw/arm/stm32f100: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-TUID: AzqX9cLpo73Q

On Thu, Aug 12, 2021 at 7:37 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Wire up the sysclk and refclk for the stm32f100 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the stm32vldiscovery board where the
> systick reference clock was running at 1MHz rather than 3MHz.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/stm32f100_soc.h |  4 ++++
>  hw/arm/stm32f100_soc.c         | 30 ++++++++++++++++++++++++++++++
>  hw/arm/stm32vldiscovery.c      | 12 +++++++-----
>  3 files changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
> index b7d71c6c634..40cd415b284 100644
> --- a/include/hw/arm/stm32f100_soc.h
> +++ b/include/hw/arm/stm32f100_soc.h
> @@ -29,6 +29,7 @@
>  #include "hw/ssi/stm32f2xx_spi.h"
>  #include "hw/arm/armv7m.h"
>  #include "qom/object.h"
> +#include "hw/clock.h"
>
>  #define TYPE_STM32F100_SOC "stm32f100-soc"
>  OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
> @@ -56,6 +57,9 @@ struct STM32F100State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
>  };
>
>  #endif
> diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
> index 0be92b2c475..f7b344ba9fb 100644
> --- a/hw/arm/stm32f100_soc.c
> +++ b/hw/arm/stm32f100_soc.c
> @@ -30,6 +30,7 @@
>  #include "exec/address-spaces.h"
>  #include "hw/arm/stm32f100_soc.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
>
> @@ -57,6 +58,9 @@ static void stm32f100_soc_initfn(Object *obj)
>      for (i = 0; i < STM_NUM_SPIS; i++) {
>          object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
>      }
> +
> +    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
> +    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
>  }
>
>  static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -68,6 +72,30 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      MemoryRegion *system_memory = get_system_memory();
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
>      /*
>       * Init flash region
>       * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
> @@ -89,6 +117,8 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(armv7m, "num-irq", 61);
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
>      object_property_set_link(OBJECT(&s->armv7m), "memory",
>                               OBJECT(get_system_memory()), &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 7e8191ebf5f..07e401a818d 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -27,6 +27,7 @@
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/stm32f100_soc.h"
>  #include "hw/arm/boot.h"
> @@ -39,16 +40,17 @@
>  static void stm32vldiscovery_init(MachineState *machine)
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
>      dev = qdev_new(TYPE_STM32F100_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      armv7m_load_kernel(ARM_CPU(first_cpu),
> --
> 2.20.1
>
>
