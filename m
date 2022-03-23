Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2612971lfb;
        Wed, 23 Mar 2022 11:20:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycBkllXx7cfHDo5mA7ZJlvTJywVSdA1dP3h56Y06yvmcZAV9qWqRyoMCvRdLQV/jl4N4rf
X-Received: by 2002:a81:d96:0:b0:2e5:dad2:d504 with SMTP id 144-20020a810d96000000b002e5dad2d504mr1297325ywn.20.1648059639576;
        Wed, 23 Mar 2022 11:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648059639; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgMNwuhnOVQTTyV1STsvsLiZLaUB++Jvh1H1N+bu7OqM1T9AaqRd2dlxJAb5UGC/oI
         FsqakOjZgIXYWf3JfWWc7asbSfQ8bZjPGLosdauAjqAoZc8NfKc0W1NhSfJY4zbOnKgt
         C0bOLxIcvIHO34ejgWT/JBJgz+28epyTtQJnEkzJ471C/ooVsLnv2ceKw5YjKTQwIgHn
         n95qHytdqAw87soif+XT9XBi/5iyRGwrRfno1f+5fA29XKLfi0i1D+ySAiox4EcX1us/
         JnaOFhvyAKIjJsVA6Mn/MgvuM0W99IdL0L85RZCsVSla3YCrvLOn2U45sEpfuenyWQi/
         DXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lFXlvf1PHn3Qyz28ksEvdnfuTCsA6m7TFmb6oPkshyA=;
        b=kUn3fXbRbmosagzp520mrUkuueKU0ruUgj9JSDFWJq1tiOH0LDLarEbjcHY+5dRmu/
         RyNdrAP4pRqjFPqYxHIlbnrYDNoD3AW6pc5XaRpXwHmRDdD5EN8Xdg4B0zcZ3yqUGjH0
         Ku4zm4f1Gsuvqxz9tuPgoqaCQ0BgY9Yrw0i4tUuiQLiggu1RM7ZG7mQUnkrXdWWUvkiL
         tQ0NP03rfCqF9HgtfcDYmjkXFQJGFuWZo/Txw4woTRj9Y3t/WbpRNzxfTCYBSmCOT8wI
         ENQ/ljl6hVfFc9ExWE6+jQXUZ3uiWGC5PDE9Lfm544orHUkEAR6FyJ4ZEVyQGRBZZ48D
         IJhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXFgoc3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a25b94b000000b00633eba21d44si12319786ybm.501.2022.03.23.11.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 11:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXFgoc3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX5b4-00062A-W4
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 14:20:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5aa-00061E-OB
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:20:08 -0400
Received: from [2607:f8b0:4864:20::112b] (port=46556
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5aW-0001EK-OF
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:20:06 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e5e176e1b6so26812637b3.13
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lFXlvf1PHn3Qyz28ksEvdnfuTCsA6m7TFmb6oPkshyA=;
 b=XXFgoc3QL5zCe5WRdRYpyo0uA9Z02iuu+frTQWdRQhaxxA5wUHgD8JB6UJmK78L6UO
 G7gpsbTfR0f9KT7/cGfsGDS1P86Tv4RBDm7tSg3A/MGzV069BDOepG/wzpBhWoddwijs
 +aEycu+Vk+IwiTK3aQBOdGOlXEtM97GGsfpsIeG9x1OUETFHg3s9VQQzc6+TZbsHdHib
 HkZmYDKgvilNu2dYImmvwM0TrFULw06krpRRuYwJnCl4DEyjWJiHWaIIzbVSN4WuTsvC
 mTh4IkVSPPwgSw0o7W/kxCVyZ4dsfavlNJfqFg53AjJVtQ0+5tV24pCPsY+5GIfap7FZ
 jQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lFXlvf1PHn3Qyz28ksEvdnfuTCsA6m7TFmb6oPkshyA=;
 b=x/YfB2viNHnxZXsSGg75IMDLXJhsNsJabqZ0wyemFCaoPFe4y4isGCrWiGm5722Bq+
 vvGKMSWFxZQxaIHB/7fbg54jkf7fwzBnxdLbmGbqIfm4FSZ1KEivkYkEE5Y9iOhucdVA
 XwIdfhsF+0VSIzRQMmOBSq2JL2DBtYdbGhhUSS3vDskLoyiDmnQvJA7JlXh4c+SzR22Z
 ZpQgWs51y+tgwC/Ol9+98aF2t5/KU1ZOHpO1mSFA7KUTqWYB9rskAGhaz5XUyo401fGH
 qwp9YfU+6Z/XQOtRyKbCdsqkJ2JdlTEvKNSj/OKwAdaYiK1EG5AUEjZSMbQyXgVD2z14
 810g==
X-Gm-Message-State: AOAM532tXYO2rCPbZRw3hUzmiQL4lsAlSl3JnrSbgdXrBWRHUFIa+0FL
 3zee+fSEE5j0HjOd+/eWUFC1iLq162cfdaPWEeTxYQ==
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr1243580ywh.329.1648059603715; Wed, 23
 Mar 2022 11:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-3-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-3-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:19:50 +0000
Message-ID: <CAFEAcA-m2F2fn77=3fz_pfteiPaHmUuGEbsCpYG-gnJSQ2or9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRNhUer0rtOC

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/stellaris.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index b6c8a5d609..ccc2d5def2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -9,6 +9,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/sd/sd.h"
>  #include "hw/ssi/ssi.h"
> @@ -1023,6 +1024,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      I2CBus *i2c;
>      DeviceState *dev;
>      DeviceState *ssys_dev;
> +       DeviceState *gpio_d_splitter;

Indentation seems to be off here. Also since we only use this
in one place you can put the new variable declaration in the
narrower scope that starts "if (board->peripherals & BP_OLED_SSI) {".

>      int i;
>      int j;
>      const uint8_t *macaddr;
> @@ -1237,9 +1239,20 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>                                     &error_fatal);
>
>              ssddev = ssi_create_peripheral(bus, "ssd0323");
> -            gpio_out[GPIO_D][0] = qemu_irq_split(
> -                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
> +
> +            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
> +            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
> +            if (!qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal)) {
> +                return;
> +            }

If you're passing &error_fatal to a function, it will never return
on errors, it will exit. So you don't need to have the if() here.

> +            qdev_connect_gpio_out(
> +                    gpio_d_splitter, 0,
> +                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
> +            qdev_connect_gpio_out(
> +                    gpio_d_splitter, 1,
>                      qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
> +            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
> +
>              gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);

Otherwise this looks OK.

thanks
-- PMM
