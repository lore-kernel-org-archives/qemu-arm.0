Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD294F31E22
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 14:26:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAqKY-0005Xt-CI; Thu, 09 Apr 2026 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAqKX-0005XZ-9F
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 10:26:01 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAqKV-0003yn-9x
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 10:26:00 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-650789b22e3so1049818d50.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 07:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775744758; cv=none;
 d=google.com; s=arc-20240605;
 b=Yy0wA7s5QzelJ8MDcFurx3bRF05eY1RG7ngCo2h5oV3VLzn+sKuqIqC+3FvMb1NbZN
 NGlDmJTZotnCyp3ic3SPHJsYpSDnYdAC9HaHjP0D9i7iSWBm73M6pKUUE8VJQTcDbiLj
 F1bCJAj3DFe2cCL8sdoL7PlVzFLmFcSvsgCPOEj/kSotVlMsKMwkZqTr6AymHfxYpcxs
 mfdtoVdLBFBAObvIl1PN8He081WBMS+Q5Fvg7xE1mffp9sg8P4mrXNh1VxjbL+EdLm9z
 DLgsw1JdOJTXChFBCrwomcG5QYF9WDZEZ4ImHfXeTH6sEdh33g+V/OVuQI/WG0eMUxv2
 lCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nxxrAzHd5+huKiRg5zPhWSg6qHGni0sqhEXmJzZ7S7o=;
 fh=PMSxGYW65DL3ItlZCQbq44OdvtOxYx+rNnvPQusmo0A=;
 b=bh/RIBFmVKhwRIAaI6Y4CO/5AOi/1hHHWi9ujIvbgi2iDuqnYGvnACm9fdRGMqo7UE
 LJdrxTUFgD2vmVRv6lKFmoxOH8eoG19pTj5ZdqI616EXGAtRpryeiJwRYWUfLd1i2QAI
 LKMONXpsmdv0m354Qgxg2T5dMP45srXebxzLdWajJK22xUwVCVb9g9WyXQsJH7IeByJe
 Lf/5+/2R157VqQi3YP8l/tb5BdaPKF+lqVcSNN6VRAYk4QheIzVfF5Jcg3L/Q2DrDwUh
 ENGq5vlIy04V6oKY2ySjWdiNul38zxpk+woD33SCBV9ZXlSWu1eqhUeaJ9TJ2i7nIK2v
 jBnw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775744758; x=1776349558; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nxxrAzHd5+huKiRg5zPhWSg6qHGni0sqhEXmJzZ7S7o=;
 b=QR5aViauPsJtrG+Vx18DfH80Hkq7o94Bwb3bmlt5F9hTw+givbKnulr6Zgt02luIqw
 OviFWDkpIMKBoEIiuD9lVatC9BA67C8c1YwN0aj3tq3bPzvMu26U3dvhHcVSbDeF7ZMc
 UgP8QHhyRv++gw9lS2He2mmFq1V1ReaqfLWrFRpAiVU2lBR78h3FwMeRCt7rAgR2Q8ab
 9l4U3c/dEd1JnAIdt239jGNmKKc+hLmUzlvYc7sH/xAjI0jBbN+xXUdebo7eeksePKoi
 yIdJ8bp0wkttTYY93m9jRPiA4gO3AmtxqhyryRqbSPN0kcMREzmgNF07Xyv3FiOJ9AX7
 FtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775744758; x=1776349558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxxrAzHd5+huKiRg5zPhWSg6qHGni0sqhEXmJzZ7S7o=;
 b=MRSb7QEBX/3H9Nsv78lQ1NkNdKFcKknrG69MvxLYHU3q3q43rrgKgQPCPvx/xIUIp/
 XVcpFkRYigV+wTaR8Qi0TmMNz1C8qF3u1Os5kC9nYYlPx8AjqUZm4hJBUcxqo7i/xQOP
 3l26kVlfY1b6lhO1bqw3UVq/R97humpNRi6ME5oZ3cVIrNUSo9wOdO5/tg2VR8bBCXht
 5Mf3UbPhgXtBHG6ryNHJQvgnszpJGKuhiOlYOQXG9Ghb/j5/wJFQha3Lx8pksUwyM0p8
 Nrxbkc7SUhE6wT27pLLkUxJrU/GPYfSPsti7qGH5ElH927yc5cntKPtrT4lFN5VqK42q
 bBHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRj9OpRl7n8L8arOFhF5QJLAXOc1LlWxSRXRlbJj0RV7l1XyN6BEVzGvu0E/x+CtrzqnLLopiBew==@nongnu.org
X-Gm-Message-State: AOJu0YwXZsyIHor7gSV3ScoEUsueO8+MVSaK7854ut7ykT5Ox5ShtBqk
 pLsxhRxF3XRi194NPA1Q3jqrL3EPOa+5A32m6PJYm8oz1zoQW8BCy9ME0fOettEisMerJdHYgFf
 0rD/zN97sMiX0qMdSc/4vA4Apb64MEFDtrGJs/rK5cQ==
X-Gm-Gg: AeBDietOkrpS4ueGqW6FdeaN9Y/XN+g2e6/zldk4Vt4Ry+935vHjMiP8l0I1uviODH7
 MSoymf9719VJgG8JkC3pd9TKtG0CRNMuIa4ng2nX5xGnZ3HbjtmixaFfGheP3RNVUwmwosPshUt
 VRrfCOSD6EJ7Ue58R9maaDM8T7QXY20rcu0ONmyC63j0xwLAaJb5gmRO2sf5uh1t3H8tUbZag3e
 vECPZ9Flm2UoeWFz9cnFahE3lloVNAWs29k6TrdAM9g7CE1Uk0JQw9oPHUeoev0clvAQlVyt/jP
 fQLimdxGRwad2Ctek4/WV2QHRQGx6ruoahdOHW9kjlUnARYn+8e4NoGEdwr9F6jKd/U=
X-Received: by 2002:a53:d8c6:0:b0:64a:e781:891f with SMTP id
 956f58d0204a3-65187659f69mr2643675d50.28.1775744757816; Thu, 09 Apr 2026
 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260303143157.80437-1-1486344514@qq.com>
 <tencent_4FB81C02E16BA91F62B23A5B45EB89A80F07@qq.com>
In-Reply-To: <tencent_4FB81C02E16BA91F62B23A5B45EB89A80F07@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 15:25:46 +0100
X-Gm-Features: AQROBzDwd4pNkcXRDjJGFBsaeiQdxpqs0o7eqVbvuGi7Hd5NofAnYds5nt1DKqE
Message-ID: <CAFEAcA-jK9FLMNKqVOtCGWBJeoGYAcpLo+iG60K7WgmW3pd3Eg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/arm/fsl-imx6ul: Wire in the LCDIF device model
To: Yucai Liu <1486344514@qq.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jcd@tribudubois.net, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 3 Mar 2026 at 14:32, Yucai Liu <1486344514@qq.com> wrote:
>
> Instantiate LCDIF as a child object of the i.MX6UL SoC and realize\nit in the SoC realize path before MMIO/IRQ hookup.\n\nAlso make FSL_IMX6UL select CONFIG_IMX6UL_LCDIF and adjust the LCDIF\nMMIO size to 0x1000.
>
> Signed-off-by: Yucai Liu <1486344514@qq.com>
> ---
>  hw/arm/Kconfig              |  1 +
>  hw/arm/fsl-imx6ul.c         | 12 ++++++++++--
>  include/hw/arm/fsl-imx6ul.h |  4 +++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index c66c452737..6655f6c34e 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -641,6 +641,7 @@ config FSL_IMX6UL
>      imply I2C_DEVICES
>      select A15MPCORE
>      select IMX
> +    select IMX6UL_LCDIF
>      select IMX_FEC
>      select IMX_I2C
>      select IMX_USBPHY
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index 225e179126..1863558a0d 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -19,6 +19,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/arm/fsl-imx6ul.h"
> +#include "hw/display/imx6ul_lcdif.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/usb/imx-usb-phy.h"
>  #include "hw/core/boards.h"
> @@ -136,6 +137,11 @@ static void fsl_imx6ul_init(Object *obj)
>          object_initialize_child(obj, name, &s->usb[i], TYPE_CHIPIDEA);
>      }
>
> +    /*
> +     * LCDIF
> +     */
> +    object_initialize_child(obj, "lcdif", &s->lcdif, TYPE_IMX6UL_LCDIF);
> +
>      /*
>       * SDHCIs
>       */
> @@ -656,8 +662,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>      /*
>       * LCD
>       */
> -    create_unimplemented_device("lcdif", FSL_IMX6UL_LCDIF_ADDR,
> -                                FSL_IMX6UL_LCDIF_SIZE);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->lcdif), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lcdif), 0, FSL_IMX6UL_LCDIF_ADDR);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lcdif), 0,
> +                       qdev_get_gpio_in(gic, FSL_IMX6UL_LCDIF_IRQ));
>
>      /*
>       * CSU
> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index 4e3209b25b..5af85dc8ff 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h
> @@ -33,6 +33,7 @@
>  #include "hw/net/imx_fec.h"
>  #include "hw/usb/chipidea.h"
>  #include "hw/usb/imx-usb-phy.h"
> +#include "hw/display/imx6ul_lcdif.h"
>  #include "system/memory.h"
>  #include "cpu.h"
>  #include "qom/object.h"
> @@ -84,6 +85,7 @@ struct FslIMX6ULState {
>      IMX2WdtState       wdt[FSL_IMX6UL_NUM_WDTS];
>      IMXUSBPHYState     usbphy[FSL_IMX6UL_NUM_USB_PHYS];
>      ChipideaState      usb[FSL_IMX6UL_NUM_USBS];
> +    IMX6ULLCDIFState   lcdif;
>      MemoryRegion       rom;
>      MemoryRegion       caam;
>      MemoryRegion       ocram;
> @@ -143,7 +145,7 @@ enum FslIMX6ULMemoryMap {
>      FSL_IMX6UL_PXP_SIZE             = (16 * KiB),
>
>      FSL_IMX6UL_LCDIF_ADDR           = 0x021C8000,
> -    FSL_IMX6UL_LCDIF_SIZE           = 0x100,
> +    FSL_IMX6UL_LCDIF_SIZE           = 0x1000,

Are you sure this (4K) is right? The IMX6ULRM reference manual I have
says the LCDIF block is 16K, so SIZE should be (16 * KiB).

Otherwise this patch looks good.

>
>      FSL_IMX6UL_CSI_ADDR             = 0x021C4000,
>      FSL_IMX6UL_CSI_SIZE             = 0x100,
> --

thanks
-- PMM

