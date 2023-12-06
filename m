Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp574412ejb;
        Tue, 5 Dec 2023 17:19:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzgrPn8D9cpvAmmMnqfDFZWFuuwVKH79/juiN3bwYqCSBIVunnfGI+fmWjSWdwQbrmE9N3
X-Received: by 2002:a05:622a:1883:b0:423:98ce:48e with SMTP id v3-20020a05622a188300b0042398ce048emr192733qtc.22.1701825574235;
        Tue, 05 Dec 2023 17:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701825574; cv=none;
        d=google.com; s=arc-20160816;
        b=gd9lOaJOX73+poQLLIORCSkR9dtizCuC6McDnak1CQNA1Cia/4r4b0cFECqA/B0eVY
         QyZabQCcBGikMHr00DdTF7MVd8lpvoJXhmSh3ACI9mJCiJZTQmY1GG2hHWY0OTb2FSk9
         +eeB1/+yE9svlxOdTGDkoQIPfRLXdWWhI7rypSd7GA1TCzRSnsbJN0Rejn+rn/4YTVBr
         w5+LJBGuj4BC87+v8YeloHECab3/xri9Me5AZnVAJPw3BluWp7uFLxUcbaHgNvjuZN2U
         oIvJiHXNWtrL3325yBM3DyYC5j4JRpnDjc8jGVxRaFHVd4Oqvtu95Fl4fvzv5GNSvs5s
         XyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RDm/jX8202kF/EkxfVk5PLtM5te3c97qkJxPbC/Pf3s=;
        fh=/LYgw7cjenuZHh1AdjNLJVyUid9oyKPPbsg85Sc1t6U=;
        b=hQ4YY0kG2XWqVv3krZ8o1e3AUrzNdFDe0+FxTlAjKV7z7GZ/xrPxXEKGSjQ/4Hcfoi
         lEq4OLzovtg91/X8+xIo0KIgXM8PQiHRp9rOs7h+B07AaTm5/6M5SEvB7nzWizs/30lM
         AzpoIHRfSlU2RkqDKBkKFgkrVIsNaSOd9VGADCmoQpH/0y0dOeqo4/BLuqaykzg3Iey5
         qqC5vgZVwJFftj8TFnbJ911wNcEnqJO+0gBQDpFt6mEcnSfZzzjGkxwSGRDVYzelK+eJ
         O7JhsVnT/MS9pv1MP2elNXu9SjUSYgIs/j0fsZJE4zbAFRjaBWTA6fEEWnwgnezdIdI7
         Uu8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJqmxBy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fy12-20020a05622a5a0c00b004238b1500easi13766278qtb.603.2023.12.05.17.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 17:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJqmxBy9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rAgZG-0003J1-Iy; Tue, 05 Dec 2023 20:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgZD-0003IT-UD; Tue, 05 Dec 2023 20:19:11 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgZ9-0006ce-1j; Tue, 05 Dec 2023 20:19:11 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54c74b3cd4cso767125a12.1; 
 Tue, 05 Dec 2023 17:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701825545; x=1702430345; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RDm/jX8202kF/EkxfVk5PLtM5te3c97qkJxPbC/Pf3s=;
 b=bJqmxBy9gHMwmlClLJn4o1WxZ8b3xX+egKPzyQ+AKlaAuNV9vjosAhhYpTmQ0L15ek
 0eVxddo3iZ3lex23wiOHAgX+KBBPoI4kDz/THsoVxYekdh1FbrgTSDx25Om2Sum8iIHG
 PtS5spySq72LRr75SLqWypDqur0f/TXEBAiSHTWvzvW0uq58xJOrkmVuJQ4NyT4lWtAA
 mju+GdMtsho0M7EOmhwfguUwQXy20zCAFW9aoOr9uAnzgr4Kjdx0cpJIxUKd/J32Yu0q
 M2M68p54DQboQft6gYULcZXSfFnFG+kgFk4WFN1F9gorZq8bsFF3/rninSdaWlw1dIuf
 FW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701825545; x=1702430345;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RDm/jX8202kF/EkxfVk5PLtM5te3c97qkJxPbC/Pf3s=;
 b=ObNY2c2tDSsgXUCCZ7RP2NnePmRgiiI73hFe9WogurJqkMUyTeAuIaf9e8OzC3+MA6
 I39TIwGJ5svky5F19KFJoiwP2FLzyhJKkejLuW5+j5qT4JdnU6P+ASFMIEFosv1ORsYy
 zLcunKDK9li5+66zFPlHWdEQc8fEfSnSEIUr30F6Y92I04+pw8kALguSx2B6SJGtv7i8
 qTjhX8Uu3djrwNO9aggL3qRu+ECtX7hrivalUizWCDoxSZ82AXVIyeig062EjeVd1vBA
 bDeBeD2oJTQqbnnPCWcljYjqYYeEgUjc6GCel1VxLiVWbshE+9ZDkbYdKwKnZ61N4NMl
 jfcQ==
X-Gm-Message-State: AOJu0Yxia/6esginbjddfIm4CGKxaFdE50Ro0znDxV5haptW2ybF23Rc
 cyb6VfigJxhtlMLfA3B6zaBEzM36LMgyAZ9ZkSo=
X-Received: by 2002:a05:6402:1253:b0:54c:a993:888a with SMTP id
 l19-20020a056402125300b0054ca993888amr2977010edw.11.1701825544646; Tue, 05
 Dec 2023 17:19:04 -0800 (PST)
MIME-Version: 1.0
References: <170100975340.4879.5844108484092111139-0@git.sr.ht>
 <170100975340.4879.5844108484092111139-1@git.sr.ht>
In-Reply-To: <170100975340.4879.5844108484092111139-1@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 11:18:35 +1000
Message-ID: <CAKmqyKM+usN_VwrwCE68yt9nKT-LZoPw2Xgg_sV_5kw38rwjjw@mail.gmail.com>
Subject: Re: [PATCH qemu 1/2] hw/arm: Add minimal support for the STM32L4x5 SoC
To: "~inesvarhol" <inesvarhol@proton.me>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me, 
 philmd@linaro.org, peter.maydell@linaro.org, ines.varhol@telecom-paris.fr, 
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XrsBlG8shdMe

On Mon, Nov 27, 2023 at 12:44=E2=80=AFAM ~inesvarhol <inesvarhol@git.sr.ht>=
 wrote:
>
> From: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>
> This patch adds a new STM32L4x5 SoC, it is necessary to add support for
> the B-L475E-IOT01A board.
> The implementation is derived from the STM32F405 SoC.
> The implementation contains no peripherals, only memory regions are
> implemented.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  MAINTAINERS                    |   8 +
>  hw/arm/Kconfig                 |   5 +
>  hw/arm/meson.build             |   1 +
>  hw/arm/stm32l4x5_soc.c         | 277 +++++++++++++++++++++++++++++++++
>  include/hw/arm/stm32l4x5_soc.h |  68 ++++++++
>  5 files changed, 359 insertions(+)
>  create mode 100644 hw/arm/stm32l4x5_soc.c
>  create mode 100644 include/hw/arm/stm32l4x5_soc.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ff1238bb98..32458d41dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1122,6 +1122,14 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/olimex-stm32-h405.c
>
> +STM32L4x5 SoC Family
> +M: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> +M: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/stm32l4x5_soc.c
> +F: include/hw/arm/stm32l4x5_soc.h
> +
>  SmartFusion2
>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3ada335a24..d2b94d9a47 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -448,6 +448,11 @@ config STM32F405_SOC
>      select STM32F4XX_SYSCFG
>      select STM32F4XX_EXTI
>
> +config STM32L4X5_SOC
> +    bool
> +    select ARM_V7M
> +    select OR_IRQ
> +
>  config XLNX_ZYNQMP_ARM
>      bool
>      default y if PIXMAN
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 68245d3ad1..9766da10c4 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -42,6 +42,7 @@ arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm283=
6.c', 'raspi.c'))
>  arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c=
'))
>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c=
'))
>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c=
'))
> +arm_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.c=
'))
>  arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c=
', 'xlnx-zcu102.c'))
>  arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', '=
xlnx-versal-virt.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx2=
5_pdk.c'))
> diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
> new file mode 100644
> index 0000000000..f476878b2c
> --- /dev/null
> +++ b/hw/arm/stm32l4x5_soc.c
> @@ -0,0 +1,277 @@
> +/*
> + * STM32L4x5 SoC family
> + *
> + * SPDX-License-Identifier: MIT

I'm pretty sure this must be GPL to be accepted

Alistair
