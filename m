Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1085122lff;
        Thu, 17 Jun 2021 18:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsita63QrAZ3ZmLvLbfsHaClKHiuJH8sKUEFiyVbEhyJM/sMqjGI0eUQ7Bp50rVT+XbVVX
X-Received: by 2002:a05:6102:2375:: with SMTP id o21mr3946779vsa.41.1623979761031;
        Thu, 17 Jun 2021 18:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623979761; cv=none;
        d=google.com; s=arc-20160816;
        b=JmOriaLGW3b+t7fLtOJrnj1+yTxZzElXREeXCpuwxP+xpHQ/RsbHJEiNkSfA4iKOLu
         Y+OtOdXaEQU/QKrFgmn28FJXlHkLFgCD6rnw8exioOcRod6MzFaEZeVqJajh/R3nzSFv
         pSbi7wJYBX6107a/aVvK1K11Hj//+kmtWYSFuf3sepUnV6DkK8YtygBgJanGXpMaAvuM
         7EJ1yp4b41neBUdslRpG72DqrH9imPQlg0vRN/nHEwuMZnsR3RaSoBvpnC+had0DG2lK
         ttMytWcsjYks0MyPBIDK5LEvFLsBgjveL45bfXslmyizWVCIJxyDV512P1QR2bVTRP6A
         iRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ow/vXGyXvphU2rxqTq98jvdwFswkTb1bdsMjcjB0cFw=;
        b=jvMkCOzx4M/6cLtyKTHPWXKKLxwbsucY+uPohY4A2/u5CiKWqBT8mbc/PODwVcP05Y
         1M2x4bSrB/Laxk/r772m+L+SlByK5kZU3VlN+woKm2iKwc+qLL5jvO3JAp4RS1COT8e6
         TOZW2LNCKcZMm7Hw7goClu0KWW9jYDi24PMp44kC0HDwSUeuqdzmMwomMWEYXCREd4Yc
         QuB6G6tCW1oNNgmrIGeRpsRaDUYyiSqYAX3vAvOxlFwGm7NowqaBpoHFhY7aSJ/jsVbS
         oQOdjJvxkuFvXQbopw75dxLnHaKqNYdMNH+IwqBqKDLkwcZGPh08a8xMH8dJcta4hJAn
         vQ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UNqwEBty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si5407543vkn.27.2021.06.17.18.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 18:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UNqwEBty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lu3Jw-0002qP-9V
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 21:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3JR-0002mr-TQ; Thu, 17 Jun 2021 21:28:49 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3JP-0001Nh-R5; Thu, 17 Jun 2021 21:28:49 -0400
Received: by mail-il1-x132.google.com with SMTP id z1so7130784ils.0;
 Thu, 17 Jun 2021 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ow/vXGyXvphU2rxqTq98jvdwFswkTb1bdsMjcjB0cFw=;
 b=UNqwEBtyyC0VFIlEE24mFXXzLB3CKMmG7mFV/3NHfEFTJ6MloHEhjPAQyIMvX7AkAe
 PyK2V/MsRQjCWUcoZ/D/cC76rfBV/3ppVGArOWtpFl3xF2O4mNB/8Yuk8wcL2jV4JI8j
 etO3U+DaFNFkfiMhMo+PMJSx5NvEC5CCxTs+oQULlb0FvFghd9I5ZFCxZ/JhySOduBaR
 3myU+xV9V04MTY/m+JDzx1zMOOQndAGm/wqelZzllYnIxqVTfrMkSzFvF2NFoHcFbuea
 7nZglvw7U/BiHXA2Yjxy0Ao4ZCmRcrRTBw58zR01s6IOHWR0RR0+IxDILu8Kb780B7Lj
 gtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ow/vXGyXvphU2rxqTq98jvdwFswkTb1bdsMjcjB0cFw=;
 b=tvEdzbVBWWtrwjegvMCLWy/VuTKOTxxSTiadYDgJ3VFJHuEAV59+AD1hK2lGWP29Xh
 ibGU7YUILi4/f5MELf1afH7PVA6JkNhpjZYEdIrrcwkAXBfC7bi4Tre/njos51Ejt8kr
 ZKqLJAMiOyjV92pLaiT3uEYefFrV/rWqvz0AOMW4OvLMQoeJdsZuBg+nhVNfCgpXQLbl
 +2Iwd6tnptXLIahnSRai9ukh4Wkif03ZZCJ0MSXpWpKOd3lwpH9xtrP8K0fuQcb+RE5G
 0KluqSaMb1O8pP+wLRx0iAbcbVjKLjKMLKX7Yk6lkfLxur5ba5SQB1h4bSvGuFxpIvgE
 CRJg==
X-Gm-Message-State: AOAM530slIt8Fob1CG25osblj9wvMotG7DTO8IDyNxCZLKSPv8aArDnq
 XX8PvBRlC2C7ko/BV8/G/lOwViYb4wq5CIVapO0=
X-Received: by 2002:a92:c56d:: with SMTP id b13mr5673385ilj.267.1623979726647; 
 Thu, 17 Jun 2021 18:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210617165647.2575955-1-erdnaxe@crans.org>
 <20210617165647.2575955-3-erdnaxe@crans.org>
In-Reply-To: <20210617165647.2575955-3-erdnaxe@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 11:28:20 +1000
Message-ID: <CAKmqyKOo24UKMxX1U6U4ho0Zf9aeq=qpRnDTi5rBKC-dQLvtZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
To: Alexandre Iooss <erdnaxe@crans.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yPy+B3WMwIk4

On Fri, Jun 18, 2021 at 2:56 AM Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This is a Cortex-M3 based machine. Information can be found at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                             |  6 +++
>  default-configs/devices/arm-softmmu.mak |  1 +
>  hw/arm/Kconfig                          |  4 ++
>  hw/arm/meson.build                      |  1 +
>  hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++++
>  5 files changed, 78 insertions(+)
>  create mode 100644 hw/arm/stm32vldiscovery.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62dfa31800..0aa8016936 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -891,6 +891,12 @@ F: hw/*/stellaris*
>  F: include/hw/input/gamepad.h
>  F: docs/system/arm/stellaris.rst
>
> +STM32VLDISCOVERY
> +M: Alexandre Iooss <erdnaxe@crans.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/stm32vldiscovery.c
> +
>  Versatile Express
>  M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..cdc0e97f9d 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -18,6 +18,7 @@ CONFIG_CHEETAH=y
>  CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
> +CONFIG_STM32VLDISCOVERY=y
>  CONFIG_REALVIEW=y
>  CONFIG_VERSATILE=y
>  CONFIG_VEXPRESS=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0bc3ee3e91..dc4e47b721 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -239,6 +239,10 @@ config STELLARIS
>      select STELLARIS_ENET # ethernet
>      select UNIMP
>
> +config STM32VLDISCOVERY
> +    bool
> +    select STM32F100_SOC
> +
>  config STRONGARM
>      bool
>      select PXA2XX
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 0e637e6a9e..721a8eb8be 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -24,6 +24,7 @@ arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
>  arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
>  arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
>  arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
> +arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
>  arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
>  arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
>  arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> new file mode 100644
> index 0000000000..7e8191ebf5
> --- /dev/null
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -0,0 +1,66 @@
> +/*
> + * ST STM32VLDISCOVERY machine
> + *
> + * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/stm32f100_soc.h"
> +#include "hw/arm/boot.h"
> +
> +/* stm32vldiscovery implementation is derived from netduinoplus2 */
> +
> +/* Main SYSCLK frequency in Hz (24MHz) */
> +#define SYSCLK_FRQ 24000000ULL
> +
> +static void stm32vldiscovery_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
> +    dev = qdev_new(TYPE_STM32F100_SOC);
> +    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       FLASH_SIZE);
> +}
> +
> +static void stm32vldiscovery_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "ST STM32VLDISCOVERY (Cortex-M3)";
> +    mc->init = stm32vldiscovery_init;
> +}
> +
> +DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
> +
> --
> 2.25.1
>
