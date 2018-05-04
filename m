Received: by 10.28.4.212 with SMTP id 203csp211679wme;
        Fri, 4 May 2018 09:24:38 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqo6EJYym5TxK58z5Ah49t4aa6qP+JZzIGZty9NfVhvOc5dcza1MP7TLMfxuS3Nkc/SHS2e
X-Received: by 10.55.24.229 with SMTP id 98mr22330402qky.347.1525451078541;
        Fri, 04 May 2018 09:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525451078; cv=none;
        d=google.com; s=arc-20160816;
        b=ucsNybuY27JDxQPdjlmq2a/9FG/WzpMne3D0hepeIRu89qzppdQwj4YYkkojXMmYYH
         +xojIUGSgvL9rHnjIRvTFgc7cu3J3QBRHcfdBr66SaV1zjtTksl5U2D+ablJELf61IOH
         H1BN9NutMW/LjV1M4xXJXG6GUxY7Opx6fLpC2t9CTC+DDL/+5+nsUKnDjbOFBqKgHPJe
         xx/U95mEqTgG+yR/Y5IUa/9k5h7y3DRUFvecMazhHJ8uLkhoz4QiYyTpvRxL3MWuWEOA
         JvG6g9OcA2crqiaRmzodV3xgOIp8Cjc+/v2q7FdBWRTxkKIuTPCrtl2+ULZJxngcPhsZ
         IPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=j4p3uPtTK4F2hPKkxlV2AD5yDWGggeiaZV9PAoYe5Cw=;
        b=rFby+bvRHj7mIMPVrQ65cI2RgbZGjln0BP7PTbcYev4RUC85l5Ls6VQFkL5iQPa3vX
         C8uGRdGJB/sFGlQJI/J3x//ADnlgCGDMYFM+yddbrKXdKAZX6j5Hh7d+i5/6zw4GIbrN
         NsTcp75ZVXF76DO+B0K9pTEH4Sq03iB/mwxJqKyYtBRgwTuy9Cxjhh+CVHs0ixupMQPE
         IDq8xxMu+anGx/XW/U5hhXOllrUW2v8UkQQUTMNOuxTBe2+t+NA9m4B8AP1wX3kEOsOX
         Je5dwhEhsGeJl3XDntakKpRJ7cjgBLgheN8WKqdSjHGw5iGRESicedqvripvKQ0vXEeO
         WLtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YZ/jrM24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i51-v6si10021950qta.358.2018.05.04.09.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YZ/jrM24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdVe-0007Fa-1i
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEdQ8-0002QK-9N
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEdQ6-0006ON-W2
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:18:56 -0400
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:38391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fEdQ6-0006O5-Rs; Fri, 04 May 2018 12:18:54 -0400
Received: by mail-qk0-x233.google.com with SMTP id b39so17024690qkb.5;
	Fri, 04 May 2018 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j4p3uPtTK4F2hPKkxlV2AD5yDWGggeiaZV9PAoYe5Cw=;
	b=YZ/jrM24A0SjyZqlePrrkFx/TmMeUjC9AgfL2TsRpBkSadySuL78d38fzd5LlcPOvL
	R3V8D/fL1uGr8InBvmH4VVq8E4zU/F68wdbwdLYS4A4jQEgYFj/Qucr/QFTS+qhJGcuC
	X4IHHQ9djpQm2LcnpPagqVslI9k/+ceJZNRTjCqD2gd6zUcB9G9v2C4EXQD4BybxXPW7
	dzuZSvCOY1V8lr/fZASrq79/tny/4QCzIbo43A2RQ3wwYBrIbjUt+wNa6FwrULrKxIv/
	XQh5r9tjeohsrY7MzY0U/mCTHmyqQL//WDbwA9OpR2rXFueWDgANLP+btv6mMZd31Tgm
	3f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=j4p3uPtTK4F2hPKkxlV2AD5yDWGggeiaZV9PAoYe5Cw=;
	b=UqE504tuBlc2/IYxBzjDGMYWYyi9T2Mnozg6NsgVt3dewhR8CcSdwpYeILlnJBoj7c
	ZSYCVpCqLH3fEp9KyQDMlwn6j90zuW6r7Vc1sScro2GDUPB/0c6hzOqP6lHPODwS+eQg
	3VtLDu/dLuL7I9mCQj5Ou1hx2RKrZ73ufaXpK/urVh2DAd2IKT2FPBjv9j6kreZzhOjb
	/z3XLmkMBLUPVqKbHjobD65P24dzQSAS8cnlc+WvIY166XkD1LPrCBppb0CF/9cAd+w9
	AvH+9DJK3AzBm8g9uRFnm/8ktyMbXXTItmar5im1srZQNVsoM7tH5rcupknOMMvzBxqt
	vdhQ==
X-Gm-Message-State: ALQs6tAFAFtCu44V6HOChwglaKT/KGbGIYV38vHa1wKgpQnsP17QiAHG
	xCweoOboV5SR1mWXwmrFY9Y=
X-Received: by 10.55.168.140 with SMTP id r134mr22722981qke.41.1525450734235; 
	Fri, 04 May 2018 09:18:54 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g199sm13338986qke.29.2018.05.04.09.18.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 09:18:53 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1525326811-3233-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e25a5a9f-9738-18b2-c30d-890bf136dd46@amsat.org>
Date: Fri, 4 May 2018 13:18:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525326811-3233-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::233
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Don't fail qtest due to missing SD
 card in -nodefaults mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mOno+tpFzSAb

On 05/03/2018 02:53 AM, Thomas Huth wrote:
> When running omap1/2 or pxa2xx based ARM machines with -nodefaults,
> they bail out immediately complaining about a "missing SecureDigital
> device". That's not how the "default" devices in vl.c are meant to
> work - it should be possible for a board to also start up without
> default devices. So let's turn the error message and exit() into
> a warning instead.

Ideally we'd QOM'ify them.

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/omap1.c  |  8 ++++----
>  hw/arm/omap2.c  |  8 ++++----
>  hw/arm/pxa2xx.c | 15 +++++++--------
>  3 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 24673ab..e54c1f8 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -30,6 +30,7 @@
>  #include "hw/arm/soc_dma.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
> +#include "sysemu/qtest.h"
>  #include "qemu/range.h"
>  #include "hw/sysbus.h"
>  #include "qemu/cutils.h"
> @@ -3987,12 +3988,11 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
>                                  omap_findclk(s, "dpll3"));
>  
>      dinfo = drive_get(IF_SD, 0, 0);
> -    if (!dinfo) {
> -        error_report("missing SecureDigital device");
> -        exit(1);
> +    if (!dinfo && !qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
>      }
>      s->mmc = omap_mmc_init(0xfffb7800, system_memory,
> -                           blk_by_legacy_dinfo(dinfo),
> +                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                             qdev_get_gpio_in(s->ih[1], OMAP_INT_OQN),
>                             &s->drq[OMAP_DMA_MMC_TX],
>                      omap_findclk(s, "mmc_ck"));
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 8066353..b8d0910 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -25,6 +25,7 @@
>  #include "cpu.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
> +#include "sysemu/qtest.h"
>  #include "hw/boards.h"
>  #include "hw/hw.h"
>  #include "hw/arm/arm.h"
> @@ -2486,12 +2487,11 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
>                               s->drq[OMAP24XX_DMA_GPMC]);
>  
>      dinfo = drive_get(IF_SD, 0, 0);
> -    if (!dinfo) {
> -        error_report("missing SecureDigital device");
> -        exit(1);
> +    if (!dinfo && !qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
>      }
>      s->mmc = omap2_mmc_init(omap_l4tao(s->l4, 9),
> -                    blk_by_legacy_dinfo(dinfo),
> +                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->ih[0], OMAP_INT_24XX_MMC_IRQ),
>                      &s->drq[OMAP24XX_DMA_MMC1_TX],
>                      omap_findclk(s, "mmc_fclk"), omap_findclk(s, "mmc_iclk"));
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 928a043..a2803fd 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -21,6 +21,7 @@
>  #include "chardev/char-fe.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
> +#include "sysemu/qtest.h"
>  #include "qemu/cutils.h"
>  
>  static struct {
> @@ -2095,12 +2096,11 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
>      s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 121);
>  
>      dinfo = drive_get(IF_SD, 0, 0);
> -    if (!dinfo) {
> -        error_report("missing SecureDigital device");
> -        exit(1);
> +    if (!dinfo && !qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
>      }
>      s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
> -                    blk_by_legacy_dinfo(dinfo),
> +                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
>                      qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
>                      qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
> @@ -2220,12 +2220,11 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
>      s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 85);
>  
>      dinfo = drive_get(IF_SD, 0, 0);
> -    if (!dinfo) {
> -        error_report("missing SecureDigital device");
> -        exit(1);
> +    if (!dinfo && !qtest_enabled()) {
> +        warn_report("missing SecureDigital device");
>      }
>      s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
> -                    blk_by_legacy_dinfo(dinfo),
> +                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>                      qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
>                      qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
>                      qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
> 
