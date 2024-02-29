Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp271695eja;
        Thu, 29 Feb 2024 01:38:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXfOQhiipgnGKXJUnDu6o1cnNddn9VWvnmyLqfpWVJDoSkS+BMf0VXLuPo3OsGGwki6wGoRDZrBjJJScuUcaab2ntwvaVlW
X-Google-Smtp-Source: AGHT+IFmFeD5FWYflosA0LZo4B6IRADq4XWoKQb+tch8AE2KdTzZmLk/mjXtmCSVkxPjJEJrg85t
X-Received: by 2002:ad4:41cc:0:b0:68f:e6fb:6a8 with SMTP id a12-20020ad441cc000000b0068fe6fb06a8mr1525592qvq.53.1709199488107;
        Thu, 29 Feb 2024 01:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709199488; cv=none;
        d=google.com; s=arc-20160816;
        b=ycuNd64XTH4Apx3PXYZQ47W78xJOhuYfGRK7r2wma6Xoxakm9RmdpolbxWDLwUtNsn
         7lP4uDpJM00ZfqbSyAwV1D00pCbNB1A0J43zo+IJqWcBsA6vRqA4jzk+LoNHewsbPABY
         3uFSU333KVE/YYpnGJR7aMv2+EN2Revw9XLoWYyGh1+nnvOZHvBAA9WtqlaqXFjVGL6M
         ucqYNvYsqDv2NkSR8Y/Cc5A/roGU6uWZ6IlyY8wuEZgHxS1++swO0IL8AQzx0YfJ6yof
         Tfq3z+sQZMH2JTIica3FVekmmyZ9VVXmEjkglzKIaziSh62TTT96ogEl7NgUqHUBKGGu
         Reag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nPjH10trekw37e4qJe0w6uYPsBvmQ0NkO+W+jkwup34=;
        fh=WxQYaKclb43e7AjSvAB7/3RRKOFCrdkpMaWIwV/wm4A=;
        b=YkHWm95xkIqhcokJ83DZHWroJ2aT6cC6sfjPcBDaMXQRcNQxIMUF03Nw1noLEu00Km
         BwpCi3X9UFQIEhsbRKjIXXM6qd6GQ/LEbdDkiGtoW94m7ZNHvqfVkt3UHqRLSSd4S0sA
         8XNaFnyIstAtM1exPWa/5+BjK4uTlSyq7jyVahYyjXzDrPHY4S0brInUy6FmjI94wTGm
         EUI6nHz2dSwvRdxfYiKHEUX/GEWRV0MnTKutIvWKuYe6pzSr4PTnDU+A017OUpMVYJm1
         GiNz+Zzh6wMQe29oqyagucZTob8WTmfp81W5uZdZChAQbc0X6pBPKLXXhql023FVRNVy
         R2JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXQR6alC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a0562140c2800b0068f5c3cb247si966022qvd.191.2024.02.29.01.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 01:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dXQR6alC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfcrQ-00074V-0c; Thu, 29 Feb 2024 04:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rfcrN-00074D-4z
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:37:50 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rfcrJ-0005yM-Ik
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 04:37:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d32f74833so385692f8f.3
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 01:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709199464; x=1709804264; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nPjH10trekw37e4qJe0w6uYPsBvmQ0NkO+W+jkwup34=;
 b=dXQR6alCovQ7/9Uo8NdrTgqyfmO5zrUsIVyumR6jcRumf50FWruM+sFun2rXGkounG
 6559taGWC7YinDWD/ZauWf88gjkR95mmaXaJNxfx5PPkV5A3SheLVbLC4/sFr7sttZPs
 fyl8B+fdfkNyDMEGNRrzmecU2yHqRNlbPw7V9XoU24qM+3Wx0iQNq2kPGxNuztKhL/nC
 +RMESYtZ3i6b9jwihj7Oc2Yl8shpypB2vTBGXyVvplLQAvF5sANgpgRefUY/K1h5sMJe
 YAzOjUPDKMnc4nud3MzSF3hLrqgky5GVeEMsDGlLimCY5mqwhg/tVxM/YCj9qcPxm/V5
 dJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709199464; x=1709804264;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPjH10trekw37e4qJe0w6uYPsBvmQ0NkO+W+jkwup34=;
 b=iUOXfFO0jyNcgRSpQ3H8QbGHaOhJaiyT+EKVlnW5gYHeSlsQWkkdQfmnb6HW1aDGLH
 bA3/1sZ8UlzrAR60i6/p6wbqzRltsG9cJ8LOsYSosNLCY5M95o5lS8/uHnjyIKAzru3v
 ofg5W703TeJr8X5U7vDlOYsiCMUOb0tz8nsMoy5idRtPUoR61ipbyBPeyC69n0ie+Jhr
 rl36+eRc56UMSd3wD6rhYx1eOKZqh8zD7BXW7yJHfml7SOUAXGMtCOyl4YP3hTscP9J/
 g/NMfIX/PnZp/v0C/UmPrq4nx/MDK4QuAKvDrND4LB11+OpwdIqkm6+ZmJEit27KLksz
 QwzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7jgLf+U3XSx4vVy6UTZH6H5ef4YqHDgUBOmmeP8C5Fp84DULxNyIaYiEaS4WYhDeK8oIFEMwr9IzZPhNgJL1pEnLk
X-Gm-Message-State: AOJu0Yx+b/XLJWbKpss/7aod33TQt8h9AUn6wOanS3q7W8qA7R0ES44m
 BmdM0sg4sCxXcZm0GJtp2yF8rLs5kSbiKoKjTuattz+gjGhY7O96qUUzpgAOJb4=
X-Received: by 2002:a5d:4c4d:0:b0:33d:3072:e38d with SMTP id
 n13-20020a5d4c4d000000b0033d3072e38dmr869899wrt.21.1709199463548; 
 Thu, 29 Feb 2024 01:37:43 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 bj12-20020a0560001e0c00b0033db0bbc2ccsm1331197wrb.3.2024.02.29.01.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:37:43 -0800 (PST)
Message-ID: <01a71754-e278-439a-aea7-439c0bc26722@linaro.org>
Date: Thu, 29 Feb 2024 10:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] aspeed/soc: Add AST2700 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240229072315.743963-1-jamin_lin@aspeedtech.com>
 <20240229072315.743963-8-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240229072315.743963-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-TUID: YSvhjhy2ssSN

Hi Jamin,

On 29/2/24 08:23, Jamin Lin via wrote:
> Initial definitions for a simple machine using an AST2700 SOC (Cortex-a35 CPU).
> 
> AST2700 SOC and its interrupt controller are too complex to handle
> in the common Aspeed SoC framework. We introduce a new ast2700
> class with instance_init and realize handlers.
> 
> AST2700 is a 64 bits quad core cpus and support 8 watchdog.
> Update maximum ASPEED_CPUS_NUM to 4 and ASPEED_WDTS_NUM to 8.
> In addition, update AspeedSocState to support scuio, sli, sliio and intc.
> 
> Update silicon_rev data type to 64bits from AspeedSoCClass and
> add TYPE_ASPEED27X0_SOC machine type.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c     | 462 ++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build          |   1 +
>   include/hw/arm/aspeed_soc.h |  26 +-
>   3 files changed, 486 insertions(+), 3 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast27x0.c


> +#define AST2700_MAX_IRQ 288
> +
> +/* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
> +static const int aspeed_soc_ast2700_irqmap[] = {
> +    [ASPEED_DEV_UART0]     = 132,
> +    [ASPEED_DEV_UART1]     = 132,
> +    [ASPEED_DEV_UART2]     = 132,
> +    [ASPEED_DEV_UART3]     = 132,
> +    [ASPEED_DEV_UART4]     = 8,
> +    [ASPEED_DEV_UART5]     = 132,
> +    [ASPEED_DEV_UART6]     = 132,
> +    [ASPEED_DEV_UART7]     = 132,
> +    [ASPEED_DEV_UART8]     = 132,
> +    [ASPEED_DEV_UART9]     = 132,
> +    [ASPEED_DEV_UART10]    = 132,
> +    [ASPEED_DEV_UART11]    = 132,
> +    [ASPEED_DEV_UART12]    = 132,

When multiple devices output IRQ lines are connected to the same
input one, a IRQ OR gate has to be used.

See previous explanations here:
https://lore.kernel.org/qemu-devel/5a7594d9-3fbd-4d90-a5f9-81b7b845fba7@linaro.org/

(Pre-existing issue in aspeed_soc_ast2600_irqmap[])

> +    [ASPEED_DEV_FMC]       = 131,
> +    [ASPEED_DEV_SDMC]      = 0,
> +    [ASPEED_DEV_SCU]       = 12,
> +    [ASPEED_DEV_ADC]       = 130,
> +    [ASPEED_DEV_XDMA]      = 5,
> +    [ASPEED_DEV_EMMC]      = 15,
> +    [ASPEED_DEV_GPIO]      = 11,
> +    [ASPEED_DEV_GPIO_1_8V] = 130,
> +    [ASPEED_DEV_RTC]       = 13,
> +    [ASPEED_DEV_TIMER1]    = 16,
> +    [ASPEED_DEV_TIMER2]    = 17,
> +    [ASPEED_DEV_TIMER3]    = 18,
> +    [ASPEED_DEV_TIMER4]    = 19,
> +    [ASPEED_DEV_TIMER5]    = 20,
> +    [ASPEED_DEV_TIMER6]    = 21,
> +    [ASPEED_DEV_TIMER7]    = 22,
> +    [ASPEED_DEV_TIMER8]    = 23,
> +    [ASPEED_DEV_WDT]       = 131,
> +    [ASPEED_DEV_PWM]       = 131,
> +    [ASPEED_DEV_LPC]       = 128,
> +    [ASPEED_DEV_IBT]       = 128,
> +    [ASPEED_DEV_I2C]       = 130,
> +    [ASPEED_DEV_PECI]      = 133,
> +    [ASPEED_DEV_ETH1]      = 132,
> +    [ASPEED_DEV_ETH2]      = 132,
> +    [ASPEED_DEV_ETH3]      = 132,
> +    [ASPEED_DEV_HACE]      = 4,
> +    [ASPEED_DEV_KCS]       = 128,
> +    [ASPEED_DEV_DP]        = 28,
> +    [ASPEED_DEV_I3C]       = 131,
> +};

