Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2610723lfb;
        Wed, 23 Mar 2022 11:17:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydnho2kXx6sQe78T04SRFbkAuF/6TwyaJwc3IpMdn9rtYUBY8GHtf8R34Ub54Nyhraq8pn
X-Received: by 2002:a25:1f04:0:b0:625:3660:a64a with SMTP id f4-20020a251f04000000b006253660a64amr1163517ybf.615.1648059451064;
        Wed, 23 Mar 2022 11:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648059451; cv=none;
        d=google.com; s=arc-20160816;
        b=dEHRLwupIdOzdV3kBqH3lehYakJOpP3Ng2PQxcHtZwnE55UgDMtIT25P8jOGZl3OXK
         ZoH86qFLgSb3H3RPEwy9f05Ktyc4SzSw1DiLjpjEUBiQor9i7Svl67N0cFw5py8yuJQR
         YMGOeAJya9hVbrO38SztA2ICnav5sfFpKcO7l7cGcb5faPMPMBrQ+ckMx6zFeoZ16iPW
         UhJi+R0G6+8sXzh24CvXV2rkU5LB+WqB1Ec4T2c0eDen/9SHdI6E4xrW69rwuixl7zXt
         QHP6dV2SwEdpirs/HNRtES42k8QwscxAa8UZ5IflKNe8VwCxt38OP9qAZPU7ut+a4EPz
         4x/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfCHr43bU4sI6seQUAYYKwl71D3g54GkYfS2nXMELEg=;
        b=WYpi6/QI9a8F/fc1feaR4oc681Rk+4zg+HueApqhherLisW11f1YtviRl5FLsQdVmX
         WoU91FCooNliqUH9S8OGHvk42jMRFD2XN5xf3xoMilUsM41qG19B6jU8lZGHC1ZgRsMH
         TpkjcJUNzyCnDLflo5h33E4bDaBMyMkI7iKvodZ9Aw1uTGVl3B3bv3P4SzjAkfcKBy8Q
         L/3m0hf1ELLadKbXV9voVYXfSpEforYv1VvbrVXsLdtG//ED6JHAlPaiYOGsmD7KcmMC
         kJMyvcsAAlWoj33HrQCR2rU/xtGRT+vjFObPL37TRW+w3oRX/k/PLpX+gg9oJyYHmo4c
         vd8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n2+XAnSt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020a81340f000000b002e5bb9dc998si13328038ywa.33.2022.03.23.11.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 11:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n2+XAnSt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX5Y2-0001ca-Ey
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 14:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5Vk-0000HU-5C
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:15:09 -0400
Received: from [2607:f8b0:4864:20::112c] (port=35463
 helo=mail-yw1-x112c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5Vi-00085q-9S
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:15:07 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so27030797b3.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mfCHr43bU4sI6seQUAYYKwl71D3g54GkYfS2nXMELEg=;
 b=n2+XAnStYiTkXLFELT18Q1U9dj2Q2b1L+PE+E4IHrbbPgl6Xjchw5ju2s9QFVd7fZf
 V48zzW30IuiIBZa0AFajE19WrUE4Kdd5bTeaX+AVy1qv8GZ6XB8DXOuh3qkG34XWRSjQ
 GRigvvDwkyaODhamD613Fi7NTXhbRWcJMKu1PcOmzUETWnA4MoqvZLsJiq2UoeqOuk3n
 xTlq1ZooXA3V/uI6VW4QArO+CKjHPMZBCkplOure8NOTCW4UNFkpNEJ5o+djVRgRRyW8
 T4wTzq0j8SSKYGfwcYwVjo9jQSw3uYtygbN6kpE5yl8A+9bafdoE3ruGJsocJm+iYW0I
 yaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mfCHr43bU4sI6seQUAYYKwl71D3g54GkYfS2nXMELEg=;
 b=dNClYPckO/p7rECgH8ojVqj7P8xCtN7f9Em9LU53znJhCRw8ZKRdGVXT/JCkmO1Q10
 +Wz0XAKQKcf1hKEwVhTeKsTOXhmuC1/zRoveSa67knQKUmCEUlQBCMwsYcpCeGkRaEgQ
 5J8aQLoOXivnbK6oGWwd+rHagMTJxciLmrALtxGsUJJJ7VdYdKc51jdieeUic+YpUMO1
 aNRvKCeR4qfVdTDYS7j+Z2N9DJ3MhY0vFCSUw7pKpLIpYUPoTepRjCmy7YA1KAwv/uTX
 jGtzQ7TqaiM4bNeHNXu6Gdoj4cdkx7xduk1GsGk/NCaB87liJ0X1oQ05GxRauHliOFxn
 ckkg==
X-Gm-Message-State: AOAM532ou0/yXVF20tscgyFZ2zNCatFr5GqeGt+dwxs3xCGE6e/IT6p7
 ASqOdooPaoctiZMlCzs0xDe9FmjBVhp9W1taG9P9gA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr1245661ywb.257.1648059303475; Wed, 23 Mar
 2022 11:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-4-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-4-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:14:50 +0000
Message-ID: <CAFEAcA-xyfQBi+pSbYGWO1u9hKK9pT3jKmKPbXtocv81SGF=jg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/intc/exynos4210_combiner: replace
 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBJTCStxwRYA

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/intc/exynos4210_combiner.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
>
> diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
> index 4534ee248d..18dade35d3 100644
> --- a/hw/intc/exynos4210_combiner.c
> +++ b/hw/intc/exynos4210_combiner.c
> @@ -31,10 +31,12 @@
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "qemu/module.h"
> +#include "qapi/error.h"
>
>  #include "hw/arm/exynos4210.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/qdev-properties.h"
>  #include "qom/object.h"
>
> @@ -105,6 +107,22 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
>      }
>  };
>
> +static qemu_irq split_irq(qemu_irq out1, qemu_irq out2) {
> +    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> +
> +    qdev_prop_set_uint32(splitter, "num-lines", 2);
> +
> +    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
> +        hw_error("exynos4210.combiner: unable to realize split irq device");
> +        return NULL;
> +    }
> +
> +    qdev_connect_gpio_out(splitter, 0, out1);
> +    qdev_connect_gpio_out(splitter, 1, out2);
> +
> +    return qdev_get_gpio_in(splitter, 0);
> +}

This is an device object, so it needs to handle the splitter device
differently to how board code does it. The splitters should be struct
fields in the device's state struct. The device instance init
method should initialize the devices with object_initialize_child().
The realize method should call qdev_realize() (not _realize_and_undef)
and wire up the gpio lines. There's an example in hw/arm/armsse.c.

thanks
-- PMM
