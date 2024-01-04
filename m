Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp54984ejo;
        Thu, 4 Jan 2024 04:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi6blSfTljgK9uRCyRhWPb+dPfyYEnkL5lyru6snUyzl0i9t5uvfE03VR1V+F4okrKmScD
X-Received: by 2002:a05:622a:4d3:b0:41c:cc6d:bba with SMTP id q19-20020a05622a04d300b0041ccc6d0bbamr555948qtx.44.1704372613994;
        Thu, 04 Jan 2024 04:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704372613; cv=none;
        d=google.com; s=arc-20160816;
        b=X+ry9cQ3WGTNj20EIgf+h+gfHWmNXLyVfMIZN6ZOzWwCxKGw5gPMJXnbsDaxHqMktj
         k1JxpvNUdWvmdbh0Y9sDztL5IQIfKa+EIrMrhqt+R690OUmXEajME1B7UCa44qjhu/jQ
         k2U7yXik2MSQujmHcIo3ubWzNoWhI0q7Fk5h1I7ymu2BSoUMhcbb/tC3Y6wOkm9FzZy2
         0w31QgjiVFnBnk8x5olmZlaXlkxfBsTfcRPcQwmT7dXQZ1aCYtEiggtcsu1eMVhiM5DG
         NK6VVhiUBInW4q/FLUypOC6tUAN01fOtITbr5jzXWU9iR0uXZmL5Sturm+3orWKwsO/6
         VABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IMZI/vvP+7WIuO8FbPwDuGYwgWLutSdZg5OTndZk3iw=;
        fh=xoLlTeCHUa3c1rGcl+ClR2Y4muigpeJPtfA+8BXqciM=;
        b=lQ8DWKfxpRr8ayGTDQ4814TCRzJHzLEtnFibeWKKhofCzv46XY93xbXzyeiuOrI0es
         zJdmutvX70nLbQUq0QtNaJYe2TI7yDWgKY1YspjV3VS/3oZQbNoBUSAIHV5EaqtHWzGd
         gUGwlVMRohAfPsP6RqEax+g+9qe3WwQLVRMFELRohU0QR11X7juT9gT0psb7M9fXj4uh
         BKyeZlmAcRkFZSku4w4NVkMam8G/6IHgA34t5HoaQy/+n6dkGfycYppLUQMmxWOpp22s
         46PLsUCi+YnO3QvWVe3p1WCHuMhfp294GyN9wQ/T049URVCMCCLjAkdpCmWUc3+XpcSi
         EHRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IiI0r3T1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020ac85b95000000b00427f20148e1si17714088qta.304.2024.01.04.04.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 04:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IiI0r3T1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNAi-0004Eo-G0; Thu, 04 Jan 2024 07:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNAg-0004EN-90
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 07:50:02 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNAd-0008Bd-RI
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 07:50:02 -0500
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7cdb67ec4caso164764241.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704372598; x=1704977398; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMZI/vvP+7WIuO8FbPwDuGYwgWLutSdZg5OTndZk3iw=;
 b=IiI0r3T1VNKiVMBVs0KI6ORfDPhe+6laGGPPHau4a1/KaAyMCRqXojrfnIYrQvFvMJ
 WyGAxD3wjHkTNf5YxMSypmNEINBiFwfUKd8gmw9y1ABlebpCpPggmx21bF5XE4kxywlp
 VB0/RCSMYAhyRQom1Nluph3ZkA26Wc3WhGCwwtRS1mlIzWWQQA8ztsAkqtJWIIKoMJpP
 pQ9VSUj9Ulx0FDsKWDUsKvmTpcP1txvCiRgD6Dj3YLGlzI+FSX8fM6P4mVExggFSLd87
 32WeYRnlAeymKiJUt2mGqbIHQMDC/dR3kANbzptE96uoxabPKtgLTa/1+aH3qH2mrVm7
 thXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704372598; x=1704977398;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMZI/vvP+7WIuO8FbPwDuGYwgWLutSdZg5OTndZk3iw=;
 b=pjmGB6vAj7Ene3ifPiOCJqglqeWht78v4/2fRTiuzkYJ/CMCN5ob6mITpgK2haPJLa
 rU/C5sQlRZ/djMJTbuxy7CBZZSAsZVxneVm0QW8byEdKEKyJdEeRYqd2WJjJaozBDYhZ
 mDcu4EH5ioE6YXfljG5v1a5eNTWn/0ewS6ZXhcqYHewXcomB27fzqpWE2S4fRePl5Mhn
 POTXNvFjlCXdJ0VeBRaHgjqhRGFFYFmyMzPm9hPkrlEdbyttmqFzxElSWcqQN/D9gZV2
 LQC4x8UgPg7444pZ0GBEecd4psvAPzj3RBcR+7wu8NP2IKbuGB7uyqKb4+VDdTzLTYg/
 oHDA==
X-Gm-Message-State: AOJu0YzSmdrRFK3ndFiFXcsiWvv7gVqWTnSnlBskUdkg5WJck4691Rnf
 0D5axl0jkdwVBxoE/gmPffkjhWedtOxBdw==
X-Received: by 2002:a05:6102:374e:b0:467:aa80:299b with SMTP id
 u14-20020a056102374e00b00467aa80299bmr314694vst.1.1704372597526; 
 Thu, 04 Jan 2024 04:49:57 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056102334f00b0046695b658dcsm1911962vse.30.2024.01.04.04.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 04:49:57 -0800 (PST)
Message-ID: <fa60d7bc-da2f-4ab7-9022-03cddaf5f39b@linaro.org>
Date: Thu, 4 Jan 2024 13:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] hw/arm: Add minimal support for the STM32L4x5 SoC
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 arnaud.minier@telecom-paris.fr
References: <20231221213838.54944-1-ines.varhol@telecom-paris.fr>
 <20231221213838.54944-2-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231221213838.54944-2-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=philmd@linaro.org; helo=mail-ua1-x92f.google.com
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
X-TUID: 8kzV8l8J44de

On 21/12/23 22:32, Inès Varhol wrote:
> This patch adds a new STM32L4x5 SoC, it is necessary to add support for
> the B-L475E-IOT01A board.
> The implementation is derived from the STM32F405 SoC.
> The implementation contains no peripherals, only memory regions are
> implemented.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

(preferably drop the newline)

> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   MAINTAINERS                    |   8 +
>   hw/arm/Kconfig                 |   5 +
>   hw/arm/meson.build             |   1 +
>   hw/arm/stm32l4x5_soc.c         | 268 +++++++++++++++++++++++++++++++++
>   include/hw/arm/stm32l4x5_soc.h |  59 ++++++++
>   5 files changed, 341 insertions(+)
>   create mode 100644 hw/arm/stm32l4x5_soc.c
>   create mode 100644 include/hw/arm/stm32l4x5_soc.h


> --- /dev/null
> +++ b/include/hw/arm/stm32l4x5_soc.h
> @@ -0,0 +1,59 @@
> +/*
> + * STM32L4x5 SoC family
> + *
> + * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2023 Inès Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * This work is heavily inspired by the stm32f405_soc by Alistair Francis.
> + * Original code is licensed under the MIT License:
> + *
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + */
> +
> +/*
> + * The reference used is the STMicroElectronics RM0351 Reference manual
> + * for STM32L4x5 and STM32L4x6 advanced Arm ® -based 32-bit MCUs.
> + * https://www.st.com/en/microcontrollers-microprocessors/stm32l4x5/documentation.html
> + */
> +
> +#ifndef HW_ARM_STM32L4x5_SOC_H
> +#define HW_ARM_STM32L4x5_SOC_H
> +
> +#include "exec/memory.h"
> +#include "qemu/units.h"

"qemu/units.h" isn't used in this header,

> +#include "hw/qdev-core.h"

neither is this one.

> +#include "hw/arm/armv7m.h"
> +#include "qom/object.h"
> +
> +#define TYPE_STM32L4X5_SOC "stm32l4x5-soc"
> +#define TYPE_STM32L4X5XC_SOC "stm32l4x5xc-soc"
> +#define TYPE_STM32L4X5XE_SOC "stm32l4x5xe-soc"
> +#define TYPE_STM32L4X5XG_SOC "stm32l4x5xg-soc"
> +OBJECT_DECLARE_TYPE(Stm32l4x5SocState, Stm32l4x5SocClass, STM32L4X5_SOC)
> +
> +struct Stm32l4x5SocState {
> +    SysBusDevice parent_obj;
> +
> +    ARMv7MState armv7m;
> +
> +    MemoryRegion sram1;
> +    MemoryRegion sram2;
> +    MemoryRegion flash;
> +    MemoryRegion flash_alias;
> +
> +    Clock *sysclk;
> +    Clock *refclk;
> +};
> +
> +struct Stm32l4x5SocClass {
> +    SysBusDeviceClass parent_class;
> +
> +    size_t flash_size;
> +};
> +
> +#endif

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

