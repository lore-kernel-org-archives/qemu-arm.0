Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp615798njc;
        Wed, 12 Mar 2025 16:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiA07YWcdyYyCJNZ1/hrzdrYsZvO0HGe9wDtYAGNO7wgOuDdduBC7UoWmVGg1UIijJrkvUG4rjoYnNLw==@linaro.org
X-Google-Smtp-Source: AGHT+IGLMvRXUEpxka2BzFONN1k7gox00baH40gtnoP4ZB3j7vt+axO8TKNmEI6Sgncg3FR9E47l
X-Received: by 2002:a05:622a:355:b0:476:8db0:8cc3 with SMTP id d75a77b69052e-4768db0910amr163325661cf.10.1741823921516;
        Wed, 12 Mar 2025 16:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741823921; cv=none;
        d=google.com; s=arc-20240605;
        b=Azsj6k4+HeSnAGuvS6RUZmZJTcatQ3ECi+xYU+SHaBaxok6I4L/ETI6O9rCl+EkEE5
         z+rM6vHuIJrGZtx9LuFVx2PEw2gjMENwA1nnpjXUJ/BFyUPBiJ3EyFes+U0/izo1zM1n
         nsrvUTSgenZuKi1zBgdZKrFhN/VIVuiBjxDvN6GfCUH06RNJ2ezclwr/rdm1o/Bk9PE2
         AihWRAuNQAFip2xLc6cVxhS3jmFdvD3aUcr8xJsTg+vsjb2ohBLYPuWwSifel4gIwSbV
         +Z1edwdWoQaElZFnVkPzRuHmzjcID4CTEXGdIasYlYVx4lD17CvRm9wgU0t6UkbYH3Vy
         TMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=cIV3aizfBLlcFLUOvGOwkDR0PfS5g1sDS1kMh06ygac=;
        fh=LOGikM04SvFjVUbohhbHX8dWebz3vFc+BtgU7UUJSTk=;
        b=MUn/7s7shUn+mHo4EpTwNKBxBbCkCQcwFpV20cvkP3A4jS3WcsnIrjX9u/TE58OJDn
         GgGj5vKjRmD38WDU9KjTpXP2W59lT2c8SxVBSbdXLA5S9jmJWraVr1Smtw+Zl3w/aDeT
         bJ8V7otXQT/Jgap+vqWsqN70DS1gDPAxU9bWm5bDQr/mpa9sf51ofu2NfXGl1aa8VGGe
         AAOn4V83P6K4nnSsxqwU5ziGgyT/WpRNxit34K4FscWd0GPS78FjOzppNv0rGI0C4kFN
         sK8Tkm5Cpiwfr9du516rO4Zc9xbXfsSAKYkHEF5AEn54h/fdiSVgas2++93BsqaQnvq1
         dqkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb815326si2720521cf.343.2025.03.12.16.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 16:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsVxv-0005wH-5M; Wed, 12 Mar 2025 19:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tsVxm-0005sE-Qz; Wed, 12 Mar 2025 19:58:16 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tsVxh-0004EB-8h; Wed, 12 Mar 2025 19:58:14 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A984B4E6033;
 Thu, 13 Mar 2025 00:58:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id rdJsfmTbSWm2; Thu, 13 Mar 2025 00:58:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A99B04E6032; Thu, 13 Mar 2025 00:58:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A79CD74577D;
 Thu, 13 Mar 2025 00:58:00 +0100 (CET)
Date: Thu, 13 Mar 2025 00:58:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] hw/arm/fsl-imx8mp: Make SoC not user-creatable,
 derive from TYPE_SYS_BUS_DEVICE
In-Reply-To: <20250312212611.51667-2-shentey@gmail.com>
Message-ID: <065c6990-d2dc-7b03-cd0c-344ee6b6a619@eik.bme.hu>
References: <20250312212611.51667-1-shentey@gmail.com>
 <20250312212611.51667-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uOnkF7+zXhOC

On Wed, 12 Mar 2025, Bernhard Beschow wrote:
> Fixes a crash when creating the SoC object on the command line:
>
>  $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
>  **
>  ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
>  (n < tcg_max_ctxs)
>  Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
>  assertion failed: (n < tcg_max_ctxs)
>  Aborted (core dumped)
>
> Furthermore, the SoC object should be derived from TYPE_SYS_BUS_DEVICE such that
> it gets properly reset.
>
> Fixes: a4eefc69b237 "hw/arm: Add i.MX 8M Plus EVK board"
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> include/hw/arm/fsl-imx8mp.h | 3 ++-
> hw/arm/fsl-imx8mp.c         | 4 +++-
> hw/arm/imx8mp-evk.c         | 2 +-
> 3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/fsl-imx8mp.h b/include/hw/arm/fsl-imx8mp.h
> index bc97fc416e..22fdc0d67c 100644
> --- a/include/hw/arm/fsl-imx8mp.h
> +++ b/include/hw/arm/fsl-imx8mp.h
> @@ -26,6 +26,7 @@
> #include "hw/timer/imx_gpt.h"
> #include "hw/usb/hcd-dwc3.h"
> #include "hw/watchdog/wdt_imx2.h"
> +#include "hw/sysbus.h"
> #include "qom/object.h"
> #include "qemu/units.h"
>
> @@ -49,7 +50,7 @@ enum FslImx8mpConfiguration {
> };
>
> struct FslImx8mpState {
> -    DeviceState    parent_obj;
> +    SysBusDevice   parent_obj;
>
>     ARMCPU             cpu[FSL_IMX8MP_NUM_CPUS];
>     GICv3State         gic;
> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> index 1ea98e1463..9133d49383 100644
> --- a/hw/arm/fsl-imx8mp.c
> +++ b/hw/arm/fsl-imx8mp.c
> @@ -698,13 +698,15 @@ static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
>     device_class_set_props(dc, fsl_imx8mp_properties);
>     dc->realize = fsl_imx8mp_realize;
>
> +    /* Reason: SoC can only be instantiated from a board */
> +    dc->user_creatable = false;

I think sysbus devices are not user creatable by default (that's why 
dynamic sysbus device was introduced) so either this or the .parent change 
below is enough. You can have both just in case but maybe not necessary as 
other sysbus devices usually don't set user_createble either.

Regards,
BALATON Zoltan

>     dc->desc = "i.MX 8M Plus SoC";
> }
>
> static const TypeInfo fsl_imx8mp_types[] = {
>     {
>         .name = TYPE_FSL_IMX8MP,
> -        .parent = TYPE_DEVICE,
> +        .parent = TYPE_SYS_BUS_DEVICE,
>         .instance_size = sizeof(FslImx8mpState),
>         .instance_init = fsl_imx8mp_init,
>         .class_init = fsl_imx8mp_class_init,
> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index e1a7892fd7..f17d5db466 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -37,7 +37,7 @@ static void imx8mp_evk_init(MachineState *machine)
>     s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
>     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
>     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
> -    qdev_realize(DEVICE(s), NULL, &error_fatal);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
>
>     memory_region_add_subregion(get_system_memory(), FSL_IMX8MP_RAM_START,
>                                 machine->ram);
>
