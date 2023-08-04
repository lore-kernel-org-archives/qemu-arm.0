Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1796778ejb;
        Fri, 4 Aug 2023 07:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7NK8lm/2arX3MQmDc0YdZy0UUTVRbZuixSI6uDBJi5X92uBVvVj/rDIDX/bHliFUvK9hP
X-Received: by 2002:a05:6358:9041:b0:123:5664:e493 with SMTP id f1-20020a056358904100b001235664e493mr2667273rwf.27.1691159969183;
        Fri, 04 Aug 2023 07:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691159969; cv=none;
        d=google.com; s=arc-20160816;
        b=zP/0Db4CM4+qLkDo7stfPFG6oSRepuoAPelNaVSeDPREJBvewbcpa8igW9ktTwMd2I
         GEJr20lUbRNVDDPOhO58LHAcr3e6X84/D3BIiP/WnUcY+iGCDS/lP1cyrC9DrxGOwt0I
         VQCg18+ZUDQdqCMauOE81gBl7M9v2KTx1J90w1DzuFo0VHEx0DOy5kuvxDnphieZh4vu
         SEDkGgA4COu2AbRnd0j2V/lxcwroxYx8KYS3kZW1fYJhggayWQEzOOh8CmisEKmNlFr8
         hxdl3r+JmbBXgWeoddlsBEe+gPZanhm2d/Bpg+vhKz+/yb3VHK4iwjtO+hKArkeLhkQa
         MeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nX5Maeg6RmQRSsbIs4jnLskz8NvE7Q7ToV8RPzYLre0=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=qiJ8gR6TImgJNSTKLNCrTSGZ9Fc4TYA5pg5OYhb1R4xcrWN5gzk2TqW83pVZU+XdEj
         g0MqSygvbIcpRxy0PpiFHrRfy6SafVgl6WZ2SdT/l2s6btZth/QDNerMbJ2Borfu4Y7+
         lxmjdYgv6DSxIAGgpoJROdEL4uso6xJLrs/GPbnwvxkkBzMq8SQ6FdNxm64omRPbLHcP
         9tpcUbBKNWPTFYeuVK3axmoKSfgrjzUt03z2xHBTpD2pXvd9dJA3ElPpmkE1K+sh4kCu
         jZw6Zx+5Uz/AOy3bWq3vZ6yztdD8VDFgaSRjJZ1pA+9uCWwoSvDGbPki9IsjQWYomC1M
         o37w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvLoqSAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj19-20020a05620a191300b007681acac9d9si1306334qkb.770.2023.08.04.07.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvLoqSAn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRvxZ-0001Lq-Bl; Fri, 04 Aug 2023 10:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvxV-0001Ib-57
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:39:17 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRvxT-0005Bb-Ew
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:39:16 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52256241b76so2682400a12.1
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691159954; x=1691764754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nX5Maeg6RmQRSsbIs4jnLskz8NvE7Q7ToV8RPzYLre0=;
 b=QvLoqSAntAsHiTaa1mjGQee2uFvUQotFidbbMaADOElhDnjqs+mrPisqYW7nhZprfb
 DTfY1DSVfoBRmyvfCvnS0x9VCsQvTgk3hLIHx3No+2+KEh0Txssr1zjmY/IVWLdvdfBS
 q2cSFGJI0yKqJIf7MEiLiiv4U1Qy4gyd/E5fPDVVLAfaKcKgBvRSCWaGf8o7TqwkJ+A7
 b2GGqCJ6hpHGQ69jXZBxNUDoolL5Q223q6lCwBl20VPYwPbB5RKtytIyaoW/23R5bsjM
 QtKePc+RD3Gg3NQ/ey9ydxoEYF9oMV+VItXBQ8oIpljtKm+zpvYutGOIdaLu8iJIOK2T
 UzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691159954; x=1691764754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nX5Maeg6RmQRSsbIs4jnLskz8NvE7Q7ToV8RPzYLre0=;
 b=jyNIf3x/mkQOuU+x+R41ztudqNhxK7mphMyoCi/WZIhXDnH+Mltljrph7w47fuanF4
 k4n3jbZDqw22BE2KDQG1icGZYuytWyiKuVgmn/kgb77TQSRyxLSjtECJnRVN10uRwW0r
 1YOJmPtktLMsumbT5INosHrclJAP9CHSECNBHhjBKvfHTO72KhV9CXmFKmkc80GTU5iq
 5qS90bojvjp0zzdm6v23d4b4ZpIXWs/wqXyyKInSA5HiQycxHf37fOC6bGYjJry4MOPu
 r2nXMIjRjnT3cQ/qrUDzF3It+JedJlE9Wq7rNilRV+O74qF2fruA2qDgf8R1+7UkKElf
 8ogg==
X-Gm-Message-State: AOJu0YzeHnZ64yjye0mOH3RIXGcaYeWn82YrwDCIsrQM3b7cu83/Ab3l
 2bWmNAJhCJkHc09Z5/J6BANC1ofzhMXzExvrYCvasQ==
X-Received: by 2002:a05:6402:493:b0:521:7779:d918 with SMTP id
 k19-20020a056402049300b005217779d918mr1736605edv.19.1691159953808; Fri, 04
 Aug 2023 07:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-22-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-22-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:39:02 +0100
Message-ID: <CAFEAcA-X3Kz3=MiC4m2MvH40LcjW9rggixVJ7mVj36VLMQrszw@mail.gmail.com>
Subject: Re: [PATCH 21/44] Add clock_isp stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: PnGOaWsjqYF7

On Wed, 26 Jul 2023 at 14:55, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 6 ++++++
>  include/hw/arm/bcm2838_peripherals.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index e7a9db97ab..60ed535673 100644
> --- a/hw/arm/bcm2838_peripherals.c
> +++ b/hw/arm/bcm2838_peripherals.c
> @@ -17,6 +17,9 @@
>  #define PCIE_MMIO_ARM_OFFSET    0x600000000
>  #define PCIE_MMIO_SIZE          0x40000000
>
> +#define CLOCK_ISP_OFFSET        0xc11000
> +#define CLOCK_ISP_SIZE          0x100
> +
>  /* Lower peripheral base address on the VC (GPU) system bus */
>  #define BCM2838_VC_PERI_LOW_BASE 0x7c000000
>
> @@ -224,6 +227,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(get_system_memory(), PCIE_MMIO_ARM_OFFSET,
>                                  &s->pcie_mmio_alias);
>
> +    create_unimp(s_base, &s->clkisp, "bcm2835-clkisp", CLOCK_ISP_OFFSET,
> +                 CLOCK_ISP_SIZE);
> +
>      /* GPIO */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
>          return;


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
