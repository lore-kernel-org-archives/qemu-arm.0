Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3496309lfo;
        Mon, 1 Feb 2021 07:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxw6FvAoMj+ZJciY8DSMfTUjOpx2x5HbISPA4AsrMgAmXuHKm8Dtd8u5vqUB2WWmYhyu9k0
X-Received: by 2002:a25:384e:: with SMTP id f75mr11719381yba.358.1612192669927;
        Mon, 01 Feb 2021 07:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612192669; cv=none;
        d=google.com; s=arc-20160816;
        b=JHqk9R5x+dK0YZs3zoSxbJXpbS5cJj4aGL3TVLgY9LJk9KLEhn+JtHdeuZnnZCPOrm
         JjUCe5TREEhT5sFXoRR9EjtkHSEehFoxFB+O4DOIEZ9ewbLAIkG0BlGTn+QcEKIvRLRD
         IV/EwoH2SLYr9E7A6Uy91GShLE+bYNwxHrnvQWdqOi/MxapnMt6Qhk5/XUbYs8N/8+WK
         lbsT4h24NM1msenWViFRnVYlvBwjMNVd/oJAnBXi5SpKQsaNyeT1N8GSyDJ1CnLPvC1l
         axG8U5gDKvOumUYn7+68r/eHsZR5BV0UFUPU5DR5GKAVwvu5KYH/2L9hB6iTNKnBZPFw
         EAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gDOUEAMCOcVpC8+Ktm4REQG9jTibaj2y2OtvFFqaoR8=;
        b=YgG7ixSOAdttIF7esI62vxgsa1rvpWsz6Y9HfP6OEDgKefmYLdLAmbIlIiVAy5DJo1
         fETQnaarFoFmGRWBDfE4dkRwT6uLzr4sVK987rJm8s22IAgbvXby1n44tdzI2v2S5+yu
         /xcqeZ1VipAGQe4B2HKvoTIi/ZF7W4v3ThbNDrxeyCapOf7NdOmGHiho8/zxViThxQje
         foa6Tr/CwgqFX8Y9ZPzgOfQBY24ZZXtyPA9XHBeo82qSMc0MKM9rglWI0xFx3UpCqKYx
         wXYB+vrYQjTgPqjSpV3q56ei83oeKJ1DpLlIpes8dDqaS+Po5FZ1fwQrXnyF4rhhQ7zJ
         NVKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vGLCRpkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 82si18181454ybc.487.2021.02.01.07.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 07:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vGLCRpkR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6axZ-0007lI-97
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 10:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6axI-0007jd-PK; Mon, 01 Feb 2021 10:17:32 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6axH-0001xr-2z; Mon, 01 Feb 2021 10:17:32 -0500
Received: by mail-io1-xd2a.google.com with SMTP id d13so17711049ioy.4;
 Mon, 01 Feb 2021 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gDOUEAMCOcVpC8+Ktm4REQG9jTibaj2y2OtvFFqaoR8=;
 b=vGLCRpkRI2eSE9Auyv/J9729gX4sJPjIiSV7eHDWY3CVBvl095cRaLupAmvY907rnt
 oPTrR512TdhLLtu8wsyHmzKE91oWLrDGdxDLtoOqi+Nx9awtoZ0zgpun+vCQGTVC0n+Q
 7noYLo1OW53WXXzw7RkozppbwJu1p/El/OzDPpmBxa5T3MZS66Zz9DN+JHeinL2OX7/U
 gqUCzTwoWEs1jVbs1Bzm+YYOonn0vuRWCNifYcGGlZItzaZhMlbZJxrqhrV6vk/Lcm2v
 KrmOwnYQ+oMhE+2xoy0EU/vr6BrINPKvw8n7VvWPzHXW29zk/0iDsod7RpN1FhMLyLKy
 FLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gDOUEAMCOcVpC8+Ktm4REQG9jTibaj2y2OtvFFqaoR8=;
 b=GYfOJZ1kE9F9j/6F8F70jm0IY8A+anrSfpbWxUZ1aqODF6KzhzJdQfFx2CwQ4LnYE3
 kjk3hdm26+Be2A9eb6xR+KduQhQ3yB90kPiqTP11+hX0XudvwAbNaa8FLTe8614SG+vD
 VSDTzYbzDkYnXX1eUKAQ97xGOLEHf1n92YwGxaSjX83iTH+CSxxhKfHi9iCVi9YeejfK
 y/PHynN3dBMPa1ToyQVKX7pP0prd9TK71hZYFIUKm+2ry8/iGWWVF9V/U07mrxQJPzNL
 w9vE7Adf5uxzKuFThA5yc5SS20vb1Fsp0yVJIcc0d3tQeM2vUgilmbQXhJy/vpWFzzs7
 90Jw==
X-Gm-Message-State: AOAM531+imsXNm6BVtN+QpbZy8GF2vM1uXaKnsdtVzK5K7F0V6ktwFXp
 y+/lEbFZdZ7ckLI/YXMfSzW/vh55XqPedN8wiuQ=
X-Received: by 2002:a02:3b6c:: with SMTP id i44mr15143360jaf.91.1612192648963; 
 Mon, 01 Feb 2021 07:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-4-f4bug@amsat.org>
In-Reply-To: <20210131105918.228787-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 07:17:02 -0800
Message-ID: <CAKmqyKOyoXVJ14i66LmsNoj9OZ69Txv_xssNSuHq+cy6-CysJw@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] hw/arm/xlnx-versal: Versal SoC requires ZDMA
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mH1y+Dv4NNEb

On Sun, Jan 31, 2021 at 3:08 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The Versal SoC instantiates the TYPE_XLNX_ZDMA object in
> versal_create_admas(). Introduce the XLNX_ZDMA configuration
> and select it to fix:
>
>   $ qemu-system-aarch64 -M xlnx-versal-virt ...
>   qemu-system-aarch64: missing object type 'xlnx.zdma'
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> ---
>  hw/arm/Kconfig     | 2 ++
>  hw/dma/Kconfig     | 3 +++
>  hw/dma/meson.build | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 223016bb4e8..09298881f2f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -354,6 +354,7 @@ config XLNX_ZYNQMP_ARM
>      select XILINX_AXI
>      select XILINX_SPIPS
>      select XLNX_ZYNQMP
> +    select XLNX_ZDMA
>
>  config XLNX_VERSAL
>      bool
> @@ -362,6 +363,7 @@ config XLNX_VERSAL
>      select CADENCE
>      select VIRTIO_MMIO
>      select UNIMP
> +    select XLNX_ZDMA
>
>  config NPCM7XX
>      bool
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index d67492d36c1..5d6be1a7a7a 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -18,6 +18,9 @@ config ZYNQ_DEVCFG
>      bool
>      select REGISTER
>
> +config XLNX_ZDMA
> +    bool
> +
>  config STP2000
>      bool
>
> diff --git a/hw/dma/meson.build b/hw/dma/meson.build
> index b991d7698c7..47b4a7cb47b 100644
> --- a/hw/dma/meson.build
> +++ b/hw/dma/meson.build
> @@ -9,7 +9,7 @@
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdm=
a.c'))
> -softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma=
.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
>  softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dm=
a.c'))
>  softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
>  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
> --
> 2.26.2
>
>
