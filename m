Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp68680ejo;
        Thu, 4 Jan 2024 05:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuVSy/5vlTNnoz+cr+Al8bVG2tuUQrGB8UrRkt7GRMEubJYagRDoRYVRzldS43x9Ddzkvq
X-Received: by 2002:a1f:7cc6:0:b0:4b6:c771:47e8 with SMTP id x189-20020a1f7cc6000000b004b6c77147e8mr256188vkc.20.1704373963404;
        Thu, 04 Jan 2024 05:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704373963; cv=none;
        d=google.com; s=arc-20160816;
        b=dsnCjBTiNxhH0/JRYY01B+L0X/P7AJ3gzcM5hbosV5h8fudiBkOaxQDQCl17ltzci3
         P2Z7/DuftJGOooZxwOpLWZnna0QDpiu4g0UzHM7NctFWf7O1uLIYXu4OVmqNUCPVgkYz
         Po4S4YeSajcID8edGXmjSAyyYGEFtccD5xV5Tdy05kVc3uGnK5NXeQB317MalgH789mO
         YER8C0Vxj/7b4BXXbLuvm5r5kScvoYAYCROF0v1Js59L7WPydV6mZp3eeet/1ebMV8VI
         n63E4x8MsohqsDiHMCL5Bo+TGxmF0qJoxd6Viy4GDAjXQRWvdKbsLl68PQm4yo0P1Zzo
         EwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QCQK2YHF40/oVZdGanpblAG0qjgj40cOa4xxTM9PKAY=;
        fh=xoLlTeCHUa3c1rGcl+ClR2Y4muigpeJPtfA+8BXqciM=;
        b=OrOr5JVkDuJrqWax+wb2WdOi5ICvcYxvvtSVexnY3N7ctU3YYSYfIJNc3aUPIeYPas
         cKASf7F6m9IDpkt3jEd85269dTM7awzFvq9j/LioDKBb+EcoOdbDm1WEB2dPsTdXT2uG
         W5I4oYZq8ttRKSh+lVMrII7A5+MT47PHzDh4tfLXw45cXvIfx8AEHptFLuZwr0Pne+Hg
         gWfIKrktTEIe87JgN5G/QTa7TCoigInJGXPc0CuhRU5kRACVmWgUP5owrHJUEjOFq7sT
         ret3O7Kn2E2t3UtJE5HY9gruUOfxeHw7VCh1DjlRVe+SZqCNisXFits10+7II9oBgXBW
         iKBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/5U+jgR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch33-20020a05612231a100b004b74f03630bsi2921797vkb.108.2024.01.04.05.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/5U+jgR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNW2-00030B-OU; Thu, 04 Jan 2024 08:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNW0-0002zd-Vf
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:12:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNVy-0006Jl-L7
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:12:04 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33677fb38a3so451193f8f.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704373920; x=1704978720; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCQK2YHF40/oVZdGanpblAG0qjgj40cOa4xxTM9PKAY=;
 b=y/5U+jgRNNU2gBPxRgtjwPUqe4v4mcfvj8L1yIOxk2nPdWfsNZnGRYJtgWGXN7H4r1
 M/xKUsEsTfPtrpZ51u7/qOd1WLzYmX84ROHGS2WCVSzM6k4H3ZnS5Z/JhoAscWgICkh0
 TlNRqZ+ojfcqKk3CYGJZLMMNuu8uhluVlfAH4trHIv2pJItL5K/BKYaGa87F7IpGTDnQ
 m55MJz96beZNeikRjl6v9m+FpRcqlRohA9s+PuRXAuKQcHRTcWARG3lJyubmeYhqhoK6
 gLzVDATM5z+XDU0opA7IchkFYjXAPRnhsTAnbfM4MQZ9iklYYTdPEljZwaWuVTkcT2dJ
 Q8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704373920; x=1704978720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCQK2YHF40/oVZdGanpblAG0qjgj40cOa4xxTM9PKAY=;
 b=rk5kS6zS0CqWpA7RFUi7KzYUwbszK5x2qzMFADYz7QiIkMS4beoh+U+44qXv3wX3Sg
 P6Ol/fTywMrCTkDqhJgmc60gvbGUgeI6xDVywIj+N9YY+uoYeb89pkUSf8TEcWOuY7HY
 q1XjE1EDp0cXbxkXPgEjHy2CVBMqQFXMOBFNpKeEqfSByGt6FDHuHi3zUb46/lq++09A
 vkvo5udmImV4set0Ct4HEh+L2h+2BIDm8hn5QRlf6OyFSeLYPM6GvAw+Pxjgp9mpw+AJ
 um9srPdmf28KzlewE5GCaf0Nnt8mrx0CJzbF5mv1vd+LA58SaEpRctQmzqdGPaTNxh9O
 f5vw==
X-Gm-Message-State: AOJu0YxqIwoSEIW3vjwPqQKSiZOl4fmuG/aDydtnmbTqnaaEiByKMcE7
 qQpaCJEGMcUzwXdADzRmAh+mO/AvX7RGEg==
X-Received: by 2002:a05:600c:518d:b0:40d:5c4d:478a with SMTP id
 fa13-20020a05600c518d00b0040d5c4d478amr291414wmb.32.1704373920463; 
 Thu, 04 Jan 2024 05:12:00 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 fa26-20020a05600c519a00b0040d5ab35657sm5731870wmb.4.2024.01.04.05.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:11:59 -0800 (PST)
Message-ID: <1d15fc3d-1334-4ef0-8484-d8dcbfa10df3@linaro.org>
Date: Thu, 4 Jan 2024 14:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hw/arm: Add minimal support for the B-L475E-IOT01A
 board
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 arnaud.minier@telecom-paris.fr
References: <20231221213838.54944-1-ines.varhol@telecom-paris.fr>
 <20231221213838.54944-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231221213838.54944-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hzI1+WlZjyC8

On 21/12/23 22:32, Inès Varhol wrote:
> This commit adds a new B-L475E-IOT01A board using the STM32L475VG SoC
> as well as a dedicated documentation file.
> The implementation is derived from the Netduino Plus 2 machine.
> There are no peripherals implemented yet, only memory regions.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   MAINTAINERS                             |  7 +++
>   configs/devices/arm-softmmu/default.mak |  1 +
>   docs/system/arm/b-l475e-iot01a.rst      | 46 ++++++++++++++++
>   docs/system/arm/stm32.rst               |  6 ++-
>   docs/system/target-arm.rst              |  1 +
>   hw/arm/Kconfig                          |  6 +++
>   hw/arm/b-l475e-iot01a.c                 | 70 +++++++++++++++++++++++++
>   hw/arm/meson.build                      |  1 +
>   8 files changed, 136 insertions(+), 2 deletions(-)
>   create mode 100644 docs/system/arm/b-l475e-iot01a.rst
>   create mode 100644 hw/arm/b-l475e-iot01a.c


> diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
> new file mode 100644
> index 0000000000..c3790e3dc8
> --- /dev/null
> +++ b/hw/arm/b-l475e-iot01a.c
> @@ -0,0 +1,70 @@
> +/*
> + * B-L475E-IOT01A Discovery Kit machine
> + * (B-L475E-IOT01A IoT Node)
> + *
> + * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2023 Inès Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * This work is heavily inspired by the netduinoplus2 by Alistair Francis.
> + * Original code is licensed under the MIT License:
> + *
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + */
> +
> +/*
> + * The reference used is the STMicroElectronics UM2153 User manual
> + * Discovery kit for IoT node, multi-channel communication with STM32L4.
> + * https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html#documentation
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/stm32l4x5_soc.h"
> +#include "hw/arm/boot.h"
> +
> +/* Main SYSCLK frequency in Hz (80MHz) */
> +#define SYSCLK_FRQ 80000000ULL
> +
> +static void b_l475e_iot01a_init(MachineState *machine)
> +{
> +    const Stm32l4x5SocClass *sc;
> +    DeviceState *dev;
> +    Clock *sysclk;
> +
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    dev = qdev_new(TYPE_STM32L4X5XG_SOC);

Missing machine parentship relation.

> +    sc = STM32L4X5_SOC_GET_CLASS(dev);
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       0, sc->flash_size);
> +}

Using:

-- >8 --
diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
index c3790e3dc8..85b8cdcd57 100644
--- a/hw/arm/b-l475e-iot01a.c
+++ b/hw/arm/b-l475e-iot01a.c
@@ -45,10 +45,11 @@ static void b_l475e_iot01a_init(MachineState *machine)
      clock_set_hz(sysclk, SYSCLK_FRQ);

      dev = qdev_new(TYPE_STM32L4X5XG_SOC);
-    sc = STM32L4X5_SOC_GET_CLASS(dev);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
      qdev_connect_clock_in(dev, "sysclk", sysclk);
      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

+    sc = STM32L4X5_SOC_GET_CLASS(dev);
      armv7m_load_kernel(ARM_CPU(first_cpu),
                         machine->kernel_filename,
                         0, sc->flash_size);
---

we get:

(qemu) info qom-tree
/machine (b-l475e-iot01a-machine)
   /SYSCLK (clock)
   /peripheral (container)
   /peripheral-anon (container)
   /soc (stm32l4x5xg-soc)
     /SRAM1[0] (memory-region)
     /SRAM2[0] (memory-region)
     /armv7m (armv7m)
       /armv7m-container[0] (memory-region)
       /bitband[0] (ARM-bitband-memory)
         /bitband[0] (memory-region)
       /bitband[1] (ARM-bitband-memory)
         /bitband[0] (memory-region)
       /cpu (cortex-m4-arm-cpu)
         /unnamed-gpio-in[0] (irq)
         /unnamed-gpio-in[1] (irq)
         /unnamed-gpio-in[2] (irq)
         /unnamed-gpio-in[3] (irq)
       /cpuclk (clock)
       /nvic (armv7m_nvic)
         /NMI[0] (irq)
         ...
