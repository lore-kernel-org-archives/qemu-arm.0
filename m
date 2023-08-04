Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1804889ejb;
        Fri, 4 Aug 2023 07:53:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzD19sQwpJgcJAjDv9Aq4PadRv2AqYKMh8+Zz2LHMhkA8B616rFQ98Fi07NwnLP/muYM+Q
X-Received: by 2002:a05:6214:11af:b0:628:74d6:ba89 with SMTP id u15-20020a05621411af00b0062874d6ba89mr1887615qvv.60.1691160828719;
        Fri, 04 Aug 2023 07:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691160828; cv=none;
        d=google.com; s=arc-20160816;
        b=pCuVJ/OUDVB5qi3gp+u4a4KQwZYqb2jvKFUYwLg9s9pAiQSdR5lbz6T9jo5ho4mklL
         K39IOJASzMczUEDelAQDtkFZMLZnOqidXUujJEhctSl8MfKpiFbFVz/MD3rKuxCfACN/
         /MypJAAcJt7Ylm5o63FikAyHWsDzgL3ju+wiB0/z+G3LYZ3RojKT2VoxeHzHecUBFfua
         2NCk4LpU804z7TPBIHMk90/EqlTMzqZBqf4ViF/6sGnb+NOP5b6elXuCwug9e5z/oGSd
         TQV1DB7dQDth2rR5c5WDmmgq5vyYtDqVJapPnvdzikhv2tPOUDnPN/j6xlLLeBHouT3m
         IqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dPgzANNjAIJu38nV7Kmp6FmoYSaRLm5N/CCpwK/mNPs=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=lV/XFSTtvyB8znZpYFhC+TSIqUe2ARHtN1Z5CTS26iJWzLgoZBhq1f2U/Wj7x+UGOz
         h1LsPD2aAtAh3gsbUBJX2iKtXJYwn9KsvkCMgo4uxmX4i6EwcGspE56oPGac7LUx9WbW
         B7YUzGN0WyRaGYA8XEB5Gf/ow+iTXAOj0ieZNrFq+WbQztIrYW1R5wNeltXQZ285kuFQ
         C9cj81m7lwE+XquandNKg0JyI9l5KyOTCTwP7JceiGKsTgx4AYfY1sjdKb5BtU8YkRdy
         q2dufnEk+NLAGjBV+qQ9pM8LNsl9zoeXhFmrFCxj0aHGU3/TfJXQlJ15k2PXd+tsfjh/
         emDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yhdzu+/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23-20020a0cb357000000b00625c59cf054si1304739qvf.329.2023.08.04.07.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yhdzu+/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwB2-00065m-MC; Fri, 04 Aug 2023 10:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwB1-00065J-K9
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:53:15 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwB0-0000wp-3D
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:53:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5231f439968so731009a12.0
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691160792; x=1691765592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dPgzANNjAIJu38nV7Kmp6FmoYSaRLm5N/CCpwK/mNPs=;
 b=yhdzu+/LKtuTDv1PbP+rTZjml+s/BbpkyKav+b/QR97xiL12gPotFM3WEH7rypBaAN
 7fRgOyZmsFWHc8HoTxU3uE/2NA+76Mn+PYT3MaB3kgmDtAdf5t0dJOiWnAHOA90EvXg3
 G/bTgArmZhPn0AMbNaPlmt/qcdCwrrvxEQmK1K2Zy45OCn8mjIYZJzstvVh26FP0WBTQ
 uC6ycTOuDhnj56nkVV8h6jT3KsghHJH+fGz86SR0gwEfydOu1dP2QtoC+POMEx6M3I9k
 NnD4uy0ccHvH0t3V91gCr8PC5XPAoa/FNCMEmf+odr+pB2c6xcI09V8zK25a11wHjsZx
 NgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691160792; x=1691765592;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dPgzANNjAIJu38nV7Kmp6FmoYSaRLm5N/CCpwK/mNPs=;
 b=cISFD4Km2MDjTg4VufiNzqWhuumLwfK5uw+egW2MPkUEH+yBXPfLbQ+aghwer/gHfg
 TCdmPGLZPbQPWIKsvXPOZTVob/jhKso7DOnQSjlRpwSVQdQyiwgfR8owXz5T2Uipb6YY
 hdMF5wF7bly/jI1CwUMPb4BPdBPqUkSbiLc+dS+ZZ9sNkeBGp7W55VrABXsqfWeYi3IV
 wKSji/YaV/DN0uZw0C9OE7gMLRqLI6Kstt96SdMbnad6eTy72H9IekmSbYt8GZPSkfuU
 hJ0Wnah0y9c2IqDegDJtcns0LGAdlIVfB37z1PSpb6V/i3Cxm2Q7zC6hsDWBLEK4Unim
 9fyg==
X-Gm-Message-State: AOJu0Yyp9Mt2D2aDgOqQUkAPa4r7CbvPZswbgam+4QwlypMVSg0nqdLk
 BqSBPcUZZ3WmVQ83r4OTBb0iFxuQSrxxWag+2fyq3A==
X-Received: by 2002:a05:6402:31f1:b0:522:289d:8dcd with SMTP id
 dy17-20020a05640231f100b00522289d8dcdmr1611515edb.35.1691160792325; Fri, 04
 Aug 2023 07:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-34-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-34-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:53:01 +0100
Message-ID: <CAFEAcA8L=FHerCHuWwmAhOJaNQapGx-YdWKJHYxzKed91Bm2Og@mail.gmail.com>
Subject: Re: [PATCH 33/44] Connect RNG200, PCIE and GENET to GIC
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vn4/qzpGqMph

On Wed, 26 Jul 2023 at 15:22, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
> index a1980cc181..83bfbc2cae 100644
> --- a/hw/arm/bcm2838.c
> +++ b/hw/arm/bcm2838.c
> @@ -217,6 +217,10 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->dwc2), 0,
>                         qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_DWC2));
>
> +    /* Connect RNG200 to the interrupt controller */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->rng200), 0,
> +                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_RNG200));
> +
>      /* Connect DMA 0-6 to the interrupt controller */
>      for (int_n = GIC_SPI_INTERRUPT_DMA_0; int_n <= GIC_SPI_INTERRUPT_DMA_6;
>           int_n++) {
> @@ -239,6 +243,21 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
>      qdev_connect_gpio_out(dma_9_10_irq_orgate, 0,
>                            qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_DMA_9_10));
>
> +    /* Connect PCIe host bridge to the interrupt controller */
> +    for (n = 0; n < BCM2838_PCIE_NUM_IRQS; n++) {
> +        int_n = GIC_SPI_INTERRUPT_PCI_INT_A + n;
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&ps->pcie_host), n,
> +                           qdev_get_gpio_in(gicdev, int_n));
> +        bcm2838_pcie_host_set_irq_num(BCM2838_PCIE_HOST(&ps->pcie_host), n,
> +                                      int_n);
> +    }
> +
> +    /* Connect Gigabit Ethernet controller to the interrupt controller */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->genet), 0,
> +                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_GENET_A));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&ps->genet), 1,
> +                       qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_GENET_B));

I would be inclined to have the "connect device foo to the interrupt
controller" code change in the same patch that does "add device
foo to the board", but the code changes here are OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
