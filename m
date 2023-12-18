Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp920537eji;
        Mon, 18 Dec 2023 08:38:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVWI19rD29702YUMVm9Qe7McOuO/v8gIOeNTgxz1QMfBqqnEIN7J3RF9ISrY2D88TRmUAV
X-Received: by 2002:a05:6214:130e:b0:67a:bc90:7a01 with SMTP id pn14-20020a056214130e00b0067abc907a01mr26333787qvb.124.1702917538451;
        Mon, 18 Dec 2023 08:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702917538; cv=none;
        d=google.com; s=arc-20160816;
        b=DkC3IUni/iubdT3m2yFUthuDOUk20nH7iFPSoEArO6h2b+wUbzsVggdhhf5P2uU05f
         vF9BcUdI77DleTjU6DycmcDXC+E66VYLtefwyha7E4SX6OjBr6/MtXraTGgkKLK9uBRm
         WeR92cvivq23wZepVfX1cu3vu+7z8iaddHx9kTp0LtqPowXM56SKFUPQ6wu1iauA2RFp
         ojyu8NF2mgbTQHsbAUm+iWJkuGzfV49xiURQuoTxFmqQJe3i3QNJ+Zp5N2Xi+OpPscH7
         20nESv1XJMmWNheBJqNh3qmqrclFPQV893Cmy4A+KIJq2inQnJ8DKJJDAO07Avhy3bZ+
         7xjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=toBNsCFDoFPx4hkIUBYvrnKvlfiFFUob+jY0w+gvlPA=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=RvRGIlhDdn5iaNu+ZqjunapoEjAsXUTZl+pM9J9Aqlt/L23SgzKZCkUMImEACmliRU
         AnfY/1Ht36dM4B6kehCD/Q/jwZrPz9TGZpEq7az+i43zIc+m/dKDagIfhgEZcxbJbWdv
         rKW0cyC/cxobYARgMHvTr0M5Bqg+TgEPIHXfSaLRCfCVyEuLsGNfb3SgSftm+QU7Es53
         vHIZkxdGf73YoxpJYXwiydwRg0QIn8tf1T3WUw1+wM08wvTcM9zH9xY9x0XfBMa7lskD
         9Kk9t8jmbV78kKx12LVd9SUla58gk70/63xpFLhOBfh7NXq5ufVzsgNY4yONGX8NMvbo
         mNPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb2ugNzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05620a410900b0077f0cca5f4asi25836826qko.681.2023.12.18.08.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yb2ugNzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFGdS-0004iY-Hm; Mon, 18 Dec 2023 11:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGdR-0004hS-8f
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:38:29 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGdP-0000yA-Lh
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:38:29 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cc5e48779aso23808251fa.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 08:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702917505; x=1703522305; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=toBNsCFDoFPx4hkIUBYvrnKvlfiFFUob+jY0w+gvlPA=;
 b=Yb2ugNzFWxJ1sQv0wJLALuKnNqsRx3MvDKxvzcuWWDkSVzA4DAFNRBzouvItaQgKkr
 YXnVSnDVcPo2KVWQ8mtVliSI9HxwNrkMBMpkQkv9ALRLl6Ayxtp7UWfTXT76tBq5hEG7
 jSxFiCCpGADhnRqSm/6cqQtVOz3dOj8rJPaqQVbAyE3libUB/KxQUINCNhcEwFI0JKJi
 M+QNtI0mfIFw5Pnu7xWVMxxqgtOlLbjOI1CuECTedpa53TYSpte4i5khVer94QqsaBhN
 zvrs4KXIAuC6g3t3xMjzHbBWkd33H/CwpGtRd55iUQgIIYb5KE8nXt+3yAoAheBudtZ+
 vzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702917505; x=1703522305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=toBNsCFDoFPx4hkIUBYvrnKvlfiFFUob+jY0w+gvlPA=;
 b=q6pXuJo9j6AGzXTo2k99Na4WSP4oQsl51HYf6OoWB5wpcnQx+yKeR3w10cWreaSV2t
 ers430++wLiFzF2H2FeI7V19C3CrdWI5TRLI91jOG7ZQ8KyfMBfhulyNm9AqpHAmbfk7
 EiHy4/o0kYY7kTavMT7/pJB/LR7mJVAp+c1nQ6jflmpAkiluyNEHUX4K++soDG7qWlhg
 UMGP2peW8DSeC1yNlAKinPKKmVlG6kW5H2SnlPLbesEl2/r3wtPc7Vv4r6Vtj72+XIU6
 cuLm/V7SzF2Pusiu25lxHf7kQ/ZGazPtxBPYAshggxRNLzGwZbmU6uFtAZvHAcQQbgN1
 nV2A==
X-Gm-Message-State: AOJu0YyNhGkp1jWYahyNp590IFUonXyNa9MuhoPx3rUOKffomSTGNkMW
 vFgnkWDuAn9Vk1+OHr59rZ9dOR8PrAiKbVbTIBv81w==
X-Received: by 2002:a05:651c:1696:b0:2cc:6d6e:b1f8 with SMTP id
 bd22-20020a05651c169600b002cc6d6eb1f8mr514816ljb.205.1702917504884; Mon, 18
 Dec 2023 08:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-9-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-9-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 16:38:13 +0000
Message-ID: <CAFEAcA8+BrvRERoZ5xpPedKYfQEJUVDYRwLmvp6SUTB_ZGaKmA@mail.gmail.com>
Subject: Re: [PATCH v4 08/45] Connect SD controller to BCM2838 GPIO
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fVWanRL0j3Pv

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/gpio/bcm2838_gpio.c         | 59 +++++++++++++++++++++++++++++++---
>  include/hw/gpio/bcm2838_gpio.h |  5 +++
>  2 files changed, 60 insertions(+), 4 deletions(-)
>
> diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
> index 51eb55b00a..f166ce7959 100644
> --- a/hw/gpio/bcm2838_gpio.c
> +++ b/hw/gpio/bcm2838_gpio.c
> @@ -17,9 +17,10 @@
>  #include "qemu/timer.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> -#include "migration/vmstate.h"
> +#include "hw/sd/sd.h"
>  #include "hw/gpio/bcm2838_gpio.h"
>  #include "hw/irq.h"
> +#include "migration/vmstate.h"

Put the #include in the order you want in the first place,
please, rather than putting it in one place in one patch and
then moving it around in a second patch.

>
>  #define GPFSEL0   0x00
>  #define GPFSEL1   0x04
> @@ -64,6 +65,16 @@

> @@ -302,15 +343,25 @@ static void bcm2838_gpio_init(Object *obj)
>      DeviceState *dev = DEVICE(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>
> -    memory_region_init_io(&s->iomem, obj, &bcm2838_gpio_ops, s,
> -                          "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);
> +    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(s), "sd-bus");
> +
> +    memory_region_init_io(
> +        &s->iomem, obj,
> +        &bcm2838_gpio_ops, s, "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);

Oddly placed newline after the "(" here.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
