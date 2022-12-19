Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3353356ejb;
        Mon, 19 Dec 2022 02:07:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Fe32b3R57G4Chpn3p9n8nczovYFz3DQFQQzOkpTLiNq+dNw5Qf/NIZuM7S3Q2tqN0DrzG
X-Received: by 2002:ac8:748b:0:b0:3a6:a7a2:57b with SMTP id v11-20020ac8748b000000b003a6a7a2057bmr54496423qtq.6.1671444423356;
        Mon, 19 Dec 2022 02:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671444423; cv=none;
        d=google.com; s=arc-20160816;
        b=t8Htv3JBRN6ASIvDN5x5UtlNhXQz23iZmD4x7htdmfFcolvq10V5LgaychcFlSruli
         JCAaYytNk9vMPPuHR8Cp7iyPeYz76lFvDU7KFSyEllez82NSPQonh+ZIqp4igPZWYfUw
         slRrNyR4F0r+yeSH9VLPs6kl3lWMfs4C+svlK2+CiNQFbV6YnN2L1v+tkSC7RNGVsDNB
         OSJQ51kmWNSHDV4QkwnYnbyG18+dzZ8DQToT21AtA/VzUQX1SDVaTv+aOUZD4rZrShbr
         a9sZ/9w9JCG6nhCp0f5XqcQeuVutnBQqHYa79JRyHvZc5jPCvCkcRRLMeBvXn/nRLn8S
         RQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p5vobpLCGYWdbc7gQIQciiVdJDcp4U1kgeur119aaMc=;
        b=BZ4OSOUznduSuQpuwcQnP95TdIUL5esDucck2E8/Y+S32fucdFTbuwuCLMEl27+x5R
         I8gdgKB1vHKJ3E2an7PXMEaWAzwwgIgKbDaBHx8XIOYHdpXPQ3jToSzOvzWHjJZDH1y2
         hka/+Ln3/myKP4j5UoqUFQbVBDlyD5YDtIy4Z/2+/td4IfqV2U/un8FOph0Tv32iEv8v
         Tq/YTwDdt4yiibAu44gPlhOSi1xxXhLDn7dtH/EG2rClVQ5oiBPTac8K4wSTx9WY4Bdn
         hpSf0o4L/uDpCNjgkpBrSJ0PR6HrUB1RxwXe4IcHeqqQIXdksJ2DrwKx/4JXd0KdNrru
         iklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ll8zR8Ho;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05620a294a00b006e9ecdb478asi4111568qkp.193.2022.12.19.02.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 02:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ll8zR8Ho;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7D2Y-0005XL-QR; Mon, 19 Dec 2022 05:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7D2W-0005Wc-K8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:06:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7D2T-0004a6-Az
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:06:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id bg10so6039107wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5vobpLCGYWdbc7gQIQciiVdJDcp4U1kgeur119aaMc=;
 b=Ll8zR8Hod+J8d5zDCPMCuvrqGOkX3UNeFf0KePTO8W2O9EamvBznXMUeSQJk9nzcZp
 SmFwxLUwyb6hWfnom8qfMnFXPq+zBB5FGQI0/hLvvnWge2Z5D3cwoINpLqWCF4/TS9Sv
 FdJHd8qvzVlXc+/Md9ThRMjKBXAnmpGgqsQXNHRofuW8ASAfZpzL0NCF0f8Gtp7rwhRN
 y0R3QiOoxLknQE8sAL/fjcQ2Ds1BbbeVy1locLyjBkbOnsgAKIsnJZSphMS41uewAqFx
 hQtRvAPk83xO6HNioIRu7zbeY9fEnd4jOhFc49JCYhkjE7efI3WVJLuNgIetF/yg1huP
 Vqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5vobpLCGYWdbc7gQIQciiVdJDcp4U1kgeur119aaMc=;
 b=t3WmXSZnmuoIGMHqB/YRNQik1LuQUI1EnLW1MDyAo/nIwbbwPfZ7Hee/YlxwIlcLzV
 xFxO5XYu9lD1N4GWnFX3y/gkwy/n9JNvnsvwsmhcbAhZdsv6HFIqaonvFucIOuooF+rr
 FBnbi5ueG6wlaARhJWdwONjRSDLBhIGevCkH160SmEM342P3QjewqTIrpmZxEnbY75nK
 I8SlbB4uWilOfFEJJ7mDbyzvUESoCpZy2rig56pBIxIHex7mB6DpxdB0beRQ6K5J3idX
 p07stkFL09ehzH9nH/bz8BEkdl8NbWKPQcqUNt2MZVuiMSgvNVAKgBanDPXM3e78AHh/
 Suvw==
X-Gm-Message-State: ANoB5pkjM7TPc2grvTEz8HJwnLKEMj1Bdt/gCnVvvpp89QA1L8+DClfO
 OzxBaFXUuEiTtcyQVo0qO9NqNw==
X-Received: by 2002:a05:600c:1e26:b0:3d2:2043:9cb7 with SMTP id
 ay38-20020a05600c1e2600b003d220439cb7mr24622783wmb.5.1671444387439; 
 Mon, 19 Dec 2022 02:06:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003cfa80443a0sm11324506wmb.35.2022.12.19.02.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 02:06:27 -0800 (PST)
Message-ID: <b9820a50-1ec6-aac6-20fd-a248176fe862@linaro.org>
Date: Mon, 19 Dec 2022 11:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] hw/arm: Add Olimex H405
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-3-balbi@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218071229.484944-3-balbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: xI2mzPTl/9Ea

On 18/12/22 08:12, Felipe Balbi wrote:
> Olimex makes a series of low-cost STM32 boards. This commit introduces
> the minimum setup to support SMT32-H405. See [1] for details
> 
> [1] https://www.olimex.com/Products/ARM/ST/STM32-H405/
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
>   MAINTAINERS                             |  6 +++
>   configs/devices/arm-softmmu/default.mak |  1 +
>   hw/arm/Kconfig                          |  4 ++
>   hw/arm/meson.build                      |  1 +
>   hw/arm/olimex-stm32-h405.c              | 65 +++++++++++++++++++++++++
>   5 files changed, 77 insertions(+)
>   create mode 100644 hw/arm/olimex-stm32-h405.c

See also docs/system/arm/stm32.rst

> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 92f9f6e000ea..76d4d650e42e 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -12,6 +12,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
>   arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
>   arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
>   arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
> +arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
>   arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
>   arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
>   arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
> diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
> new file mode 100644
> index 000000000000..5171a66074bb
> --- /dev/null
> +++ b/hw/arm/olimex-stm32-h405.c
> @@ -0,0 +1,65 @@
> +/*
> + * ST STM32VLDISCOVERY machine
> + * Olimex STM32-H405 machine
> + *
> + * Copyright (c) 2022 Felipe Balbi <balbi@kernel.org>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/stm32f405_soc.h"
> +#include "hw/arm/boot.h"
> +
> +/* olimex-stm32-h405 implementation is derived from netduinoplus2 */
> +
> +/* Main SYSCLK frequency in Hz (168MHz) */
> +#define SYSCLK_FRQ 168000000ULL

No need to comment if named MAIN_SYSCLK_FREQ_HZ.

> +static void olimex_stm32_h405_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    Clock *sysclk;

I like the simplicity, but wonder if we shouldn't add checks such
the MPS2 machines, in case one use different -cpu / -m values:

        if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
            error_report("This board can only be used with CPU %s",
                         mc->default_cpu_type);
            exit(1);
        }

        if (machine->ram_size != mc->default_ram_size) {
            g_autofree char *sz = size_to_str(mc->default_ram_size);
            error_report("Invalid RAM size, should be %s", sz);
            exit(1);
        }

Or maybe better would be to refactor that since this pattern is common
to SoC/SoM.

> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    dev = qdev_new(TYPE_STM32F405_SOC);
> +    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       0, FLASH_SIZE);
> +}
> +
> +static void olimex_stm32_h405_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Olimex STM32-H405 (Cortex-M4)";
> +    mc->init = olimex_stm32_h405_init;

Per previous comment:

        mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
        mc->default_ram_size = 0; /* SRAM already allocated in SoC */

> +}
> +
> +DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)

