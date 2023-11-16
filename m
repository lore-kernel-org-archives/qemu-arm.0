Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3308521ejc;
        Wed, 15 Nov 2023 23:23:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPCbSTQDOsGEk/QhXRIt64My/qw667JXfD5G4GsYgFzZhGKInq0p/2gENRYVHXfyuPHRbV
X-Received: by 2002:ac8:7f82:0:b0:41c:b764:ca0f with SMTP id z2-20020ac87f82000000b0041cb764ca0fmr9101303qtj.58.1700119420733;
        Wed, 15 Nov 2023 23:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700119420; cv=none;
        d=google.com; s=arc-20160816;
        b=E323GJXd9AKQyux1IEggxN/Fz43bxTH//B1dBL6bbtvgSe4otorqRieVqoDfFCjqhT
         Mji2QRNeqfchGcvdJ/MRhstxCgaRvAkrzPYKUAEIDOeoaQxZWej/dheUY/kFPoS1O586
         9QSqRHIecPiCOVyTsjhLGsHCWrs9XtIuhsrjznDY7HWpymiiJVOI59TjjgkgWiTDyZSn
         qyFyyeujYy5C9nM0kcpviJ2hobGtt1URdUb6xTtnzc5SuDeIZK5R/lB8U4ypOW8AtPI8
         sCrBZDI0UUC98i9HgnqrYYQT0V9g8ptNAIEVI97EWX5Bt0VOSjIAqVBx5/gtQqtnPSSc
         ol6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dqUlFsUrudmhv6OqbCROZM7lVUnreEQP/giNLNeMJu8=;
        fh=6vqG7cGNO6LmokQUY3ba+tX6Asv8siBuykh7rn+T4Kc=;
        b=M3mMT68QquOlXibkkvZJ8uC4IAcxNM9rZkiLfh0xvDevE8P3NKUL2gugLksx54f04m
         f1ENUyrKXL7JvOPWClignVjFwCVnNVLhb9rDT9uQKEKRa/ZuOZtPHJlNEuW29RdvuEI8
         YglP632EHIiFOcHR9Yi9BS2c2jpEbQzfRnck7iJL05Ha43H+PBD7nskTqgH0WYV1q2p3
         T9TlXUccAtesSMMigLtTfEBKRXgLBIDmM/kSUP9+o/lk5ntvoSxi6ZfsMAMDo6XLDjV5
         cQ6Rqig8b+zHF4Bo13WlD5iNfIbsP+9gBOH9vmSDrAU6e+AQaJa832Yp9ce8F7Nw67gx
         lQfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYtRUAwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05622a05d000b0041cb481b92esi10961840qtb.388.2023.11.15.23.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pYtRUAwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Wik-0002iQ-Dk; Thu, 16 Nov 2023 02:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Wij-0002hj-AH
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:23:25 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Wih-0007dt-IY
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:23:25 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so615432e87.2
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700119402; x=1700724202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dqUlFsUrudmhv6OqbCROZM7lVUnreEQP/giNLNeMJu8=;
 b=pYtRUAwp5R6sx2SOl0S9W4RZdg0hri7IYtIuwE7a9d6mduM54yryT3Ngdxpxcreytr
 2iLGvImqTwGsVGs9gtEzxWOWg0sSvW2N9DatbK3qKnAqXZ46YVhJ4HpaC8pTIbW4K+tE
 xtRprRRZtakAbGeJM838ZtAiQXAIuzYi3UsbP/Ie5rSjBZ6CPLGT7vFQ4CJv77+pm/+8
 h4NH5ud96A1XVvUylrXaCoE4JraE+Ul4u1OPj5gdnNUAsN5hZX9mVlhBNz5nxZtexPQY
 vNZ9G0kdDLX/lwE/w6T0EfwqJkHk6GO6Q9F1TXiItUZCARhXq7NdjLI6rgzbH3lmQFl1
 RWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700119402; x=1700724202;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dqUlFsUrudmhv6OqbCROZM7lVUnreEQP/giNLNeMJu8=;
 b=vNC8pIwjRKZ7OHAQMXlSmJiZCm4w2MeaTGMI8nNDPQfylYo473CsxioNf0UZhCNr7G
 JOISyf37S9c1wLQ9d3d5Bh5qKHTFyzn72ym9/uRYbdW7ZK1ez7nn9+thXirlzRc+J96l
 lLkCIcFv1DShh7Qv3OKrCjIg9kiwQRxU43ZpGH+Reu575t2QKGF0Tz+ch0iYjaLoBXfB
 DiCx/vmK7e/Suz6BfN3+2ao9/wx72B5cv7318JepVgMYmy9tlDuqT/LJ9ZH5DCvnTzwO
 LeZXWV/o/uwNIJU3BdMGhz93cZZUjhXbPWPtl4tAZkR/QlBFAjaiI7zaCM41HpRJFa5N
 zBKg==
X-Gm-Message-State: AOJu0YwfPiy0uTtJgVIZpAJZcE+5FBrgx79zSNO7bIpeiXpPbG0oq+S6
 WPcX8jKKQeaP5ckwxdlMV0d+lg==
X-Received: by 2002:a19:5210:0:b0:509:4bd1:6b63 with SMTP id
 m16-20020a195210000000b005094bd16b63mr10106788lfb.16.1700119401890; 
 Wed, 15 Nov 2023 23:23:21 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d526b000000b0031c52e81490sm12656679wrc.72.2023.11.15.23.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:23:21 -0800 (PST)
Message-ID: <1f657e11-909f-433a-8642-3a0176019b4a@linaro.org>
Date: Thu, 16 Nov 2023 08:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? 1/6] hw/arm/stm32f405: Report error when
 incorrect CPU is used
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115232154.4515-1-philmd@linaro.org>
 <20231115232154.4515-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231115232154.4515-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: Miej3XXPrtwY

On 16/11/23 00:21, Philippe Mathieu-Daudé wrote:
> Both 'netduinoplus2' and 'olimex-stm32-h405' machines ignore the
> CPU type requested by the command line. This might confuse users,
> since the following will create a machine with a Cortex-M4 CPU:
> 
>    $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f
> 
> Set the MachineClass::valid_cpu_types field (introduced in commit
> c9cf636d48 "machine: Add a valid_cpu_types property").
> Remove the now unused MachineClass::default_cpu_type field.
> 
> We now get:
> 
>    $ qemu-system-aarch64 -M netduinoplus2 -cpu cortex-r5f
>    qemu-system-aarch64: Invalid CPU type: cortex-r5f-arm-cpu
>    The valid types are: cortex-m4-arm-cpu
> 
> Since the SoC family can only use Cortex-M4 CPUs, hard-code the
> CPU type name at the SoC level, removing the QOM property
> entirely.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/stm32f405_soc.h | 4 ----
>   hw/arm/netduinoplus2.c         | 7 ++++++-
>   hw/arm/olimex-stm32-h405.c     | 8 ++++++--
>   hw/arm/stm32f405_soc.c         | 8 +-------
>   4 files changed, 13 insertions(+), 14 deletions(-)


> diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
> index 3aa61c91b7..694b1dd6ed 100644
> --- a/hw/arm/olimex-stm32-h405.c
> +++ b/hw/arm/olimex-stm32-h405.c
> @@ -47,7 +47,6 @@ static void olimex_stm32_h405_init(MachineState *machine)
>       clock_set_hz(sysclk, SYSCLK_FRQ);
>   
>       dev = qdev_new(TYPE_STM32F405_SOC);
> -    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
>       qdev_connect_clock_in(dev, "sysclk", sysclk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
> @@ -58,9 +57,14 @@ static void olimex_stm32_h405_init(MachineState *machine)
>   
>   static void olimex_stm32_h405_machine_init(MachineClass *mc)
>   {
> +    static const char *machine_valid_cpu_types[] = {

const char * const

(in all this series).

> +        ARM_CPU_TYPE_NAME("cortex-m4"),
> +        NULL
> +    };
> +
>       mc->desc = "Olimex STM32-H405 (Cortex-M4)";
>       mc->init = olimex_stm32_h405_init;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +    mc->valid_cpu_types = machine_valid_cpu_types;
>   
>       /* SRAM pre-allocated as part of the SoC instantiation */
>       mc->default_ram_size = 0;

