Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1726714ejb;
        Fri, 4 Aug 2023 05:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHECTxN16nOxGIJYcadrHYvYGVOm+fyhSLiVSuyKBnmbJQuFYgEU61i/FLken0u7ECGquDs
X-Received: by 2002:a05:622a:1648:b0:40a:fc6a:e86e with SMTP id y8-20020a05622a164800b0040afc6ae86emr1929823qtj.62.1691153804265;
        Fri, 04 Aug 2023 05:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691153804; cv=none;
        d=google.com; s=arc-20160816;
        b=lXMjZ7P+UrD0qcanvBYIfOsdyrxCC2WwRAWMHFBz/YZqvqHPezrMkEOaDUSpiiInhn
         tmGLjDjDYkpN/OgBOe5F8D0/JihrnvYESNxBWqQ7rOJZHWW29OZZ5b5iSR6YxhQAqQ4O
         7ZlX4we0+9gO7kx7OSTIyCyEy0D8fCMuI/UouG7rVlUheenV46Z1ohG1JR3luT2lzP51
         0Hlj7lHvrzZ4ov/XsbAoLyh/hKXHXyU15CShdb+QGBYo2Vkaq+ZE92spFaAZM92LyGy0
         cRLZgW/KAalev+akIiiQyGnZmmX4uzf2Cu3LUdox1HaPWimJUqqZqZ6WNXS1v9PmJsoD
         +f+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6U61MjXLtP3NkaKUtU+YZZFVPUnYtCxQmJilaj4LaMY=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=aBCroEJi5NtrT3w72+D7/94CGcxI7YKPWRTUUlImtb07g/LIYJpZrSS9V9Zn9cHgd9
         5qoPkRRKVUMqx+0fzxalHkm2rYXXCZq31os5NIWel+FMOtCfWPPCqyf6zzmAj13cGe+i
         UOh5VUBwyYNwv1QbMPxJQFKf4K4B2Dczw9vK/93rS36bM8hRn8JrF+3rSUYPJJRB1lZl
         aVBfjh5u3Y8gyV5nD8Ir+jlKN3Kh6P7KWtA4G68cbGpPzJfq4XAF8oUSPZDbM1LRaDl8
         781UD1SZ0CPyMHt4WqUvvnF7MmjUnJfkM9Sy3EIPcY9D1kj29YCk1iNudM4rzbYTtGWz
         2jSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvJf6e+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05622a01c500b00403f3141703si1213150qtw.619.2023.08.04.05.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 05:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvJf6e+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qRuLw-0006N0-KG; Fri, 04 Aug 2023 08:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuLv-0006Df-As
 for qemu-devel@nongnu.org; Fri, 04 Aug 2023 08:56:23 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRuLt-00054I-KL
 for qemu-devel@nongnu.org; Fri, 04 Aug 2023 08:56:23 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52256241c66so4467518a12.1
 for <qemu-devel@nongnu.org>; Fri, 04 Aug 2023 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691153780; x=1691758580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6U61MjXLtP3NkaKUtU+YZZFVPUnYtCxQmJilaj4LaMY=;
 b=QvJf6e+bhz2+08a0ab3k0FkaW42OOU/NAlioA7pOC23XN18RIueCEZ/DjPQx9muHbN
 ZQmK545Bc/My5TMcy1Tk82i8t75QNqv0ZxaPZ9e1tfXVM4Y0pdaSeYc4CDqdoo762VGe
 eLy+TIVLf+wGKe+mhpckImFhGEv1MUYy0YLMGLE1wOUNA/L26elHPD+3t84KMDVKwhjQ
 nekT+Of0Aa0i34yE0l4MwDLaD0IHTdik2t8agz75RVm9hPeIJLymUAZgpFMTF+TfUzFh
 0ZCKxgZxcVNAez940o6m7yQwGJdvsQEF6RIjsZrRnhJvqhQ1jJCyacFgLHyhlIygyalq
 B7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691153780; x=1691758580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6U61MjXLtP3NkaKUtU+YZZFVPUnYtCxQmJilaj4LaMY=;
 b=ihUhMmugDWEpgmhVJm9AhYjLL+zIiHbewtdLkjBJKBocNPqqOiDq3zv+AqHQgq39mR
 p+RIBQfFub4W7bUJb9ST7ThiQcFSCo/OHR166ZE19JtIEq53xcGVqM4CEUcmeaH6YYrP
 g2N8ugwbiNfc89kdmhtXldVRrcumcnBXmKGclEpTUO4uHNLxXQX1Bhvsz4O004a6nM7O
 zChV+bDEVVzI8Gj9srhgIgPzYIUBaVwHnK7XpKoU8W/nXQJggE8Dsge1clMvYF4QYuRL
 5S+v5iNAw/OytQduoDX4cGH6FWu2tddsi975Zqd2tO4oROCNn/r+NOsHxPaqUpcFPAAW
 C/Jg==
X-Gm-Message-State: AOJu0YxeyvNIHiDXYEF8EgIwecYRruSLibu73k3hbqNYU2xMsSugKoio
 lXr+JcfGFDMLFKQ3q6uCNKnf7IVFhSMRPrrz8ZD22je3BdCx5hbq
X-Received: by 2002:a05:6402:3507:b0:522:ddeb:cdcb with SMTP id
 b7-20020a056402350700b00522ddebcdcbmr1996213edd.18.1691153780047; Fri, 04 Aug
 2023 05:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-14-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-14-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 13:56:09 +0100
Message-ID: <CAFEAcA8VBK5orZWSUVRs5bOVK3kgTxkCCwpKRPWowRQeo=kA0g@mail.gmail.com>
Subject: Re: [PATCH 13/44] Add memory region for BCM2837 RPiVid ASB
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GZR/lk09ZoOA

On Wed, 26 Jul 2023 at 14:34, Sergey Kambalin <serg.oker@gmail.com> wrote:

I notice that all these patches have no commit message
except for the subject line. Generally we prefer commits
to have more description of what they're doing and why than
that, although for simple patches it doesn't need to be
very much.

> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 3 +++
>  include/hw/arm/bcm2838_peripherals.h | 3 ++-
>  include/hw/arm/raspi_platform.h      | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index 0c5e716853..f689e16535 100644
> --- a/hw/arm/bcm2838_peripherals.c
> +++ b/hw/arm/bcm2838_peripherals.c
> @@ -182,6 +182,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
>          sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
>
>      object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
> +
> +    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
> +    create_unimp(s_base, &s->asb, "bcm2838-asb", RPI4B_ASB_OFFSET, 0x24);
>  }
>
>  static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
> index aba38a18f0..ebed11dd40 100644
> --- a/include/hw/arm/bcm2838_peripherals.h
> +++ b/include/hw/arm/bcm2838_peripherals.h
> @@ -66,12 +66,13 @@ struct BCM2838PeripheralState {
>      MemoryRegion mphi_mr_alias;
>
>      SDHCIState emmc2;
> -    UnimplementedDeviceState clkisp;

Rebase/patch split artefact ? This got added in an earlier
patch, so rather than adding and then removing it, better
to not add the line at all.

>      BCM2838GpioState gpio;
>
>      OrIRQState mmc_irq_orgate;
>      OrIRQState dma_7_8_irq_orgate;
>      OrIRQState dma_9_10_irq_orgate;
> +
> +    UnimplementedDeviceState asb;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
