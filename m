Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp64329ejo;
        Thu, 4 Jan 2024 05:06:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV6I4HmH0DC0ytNq7PzKCtubcDxFS23x9vUv6HZ1ZOWm8tMRQZH18sGeyvJwkHakgYLdrU
X-Received: by 2002:a05:6808:3088:b0:3bb:f317:1a00 with SMTP id bl8-20020a056808308800b003bbf3171a00mr669796oib.11.1704373570495;
        Thu, 04 Jan 2024 05:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704373570; cv=none;
        d=google.com; s=arc-20160816;
        b=JajPtry0uVESBFxKsg8A2kJOZXb9CYEB0PC8zquE+/gBtswZ2If7Ux5WI4YIeACV0P
         2PwYCH3NCKno48B3ziyQyiWbGKVvFxkGoLv2wNAV1dLlRSzZhoSiIIBTqZmgoAlsVt43
         YUydLYdOpwADmUG1jmx2R6m/EN6zNEa7XbIJJ7y3PZD+atc3IZA1X7GHgRXbZoAHyM5v
         UoJiwO3i/i6eX5jBeS2Wd41zXvG3tLQKZhGESHX9ZIsGWxSPkPAMR4A9c4R0JkO3LerA
         /i/1LlHQl/n8iJBULYZcwxwgUs06JdawEqpPFhsdNm4Gl4mXoMeRVye5LUpeqkFNx4Vt
         H4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s9mXFLxUqeN64aeixmwDN8xkRu8voE2p8ywSUSrenZc=;
        fh=kI1J4B+X3ZawpacFjnqhjCcnv4gFPNho/5jhpQe9K+0=;
        b=gKH98T8I2zWCfxSHGBrYt0psE0VTy/C/PkyTmQZsVQ+1p3ky8++zLgTwM0ICNDm+nc
         e+8A0wornJqlVfEXYdX93X0+6w1EDSJY7UwQ11nyCe//CtewcaHHwt3aayYZeeGmC6zE
         tJU5JdBrAGyCPUxjTcAiabKyBGHzh9iGN5Xi4p6sKTu4MG6n+P/hizdeRVtIX/Bj9sVV
         P3aGgyA01upaG7U56KowNljntfNPezgCPEAYThY9ePYgQLmFdFeez/kNYBI9Qxvw/RHa
         y6VJzDolXbm+WUC67hpFqU0j5txcGp9gruj1EDuDAlmruCwy20FHj8TbXgaexggO+2EV
         OOzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrNHHfWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs12-20020a056214226c00b006801adc03a4si24498120qvb.332.2024.01.04.05.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 05:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrNHHfWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLNQ6-0001bo-Ez; Thu, 04 Jan 2024 08:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNQ4-0001Ym-TX
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:05:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLNQ0-0001On-Rj
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 08:05:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d60c49ee7so4685995e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704373551; x=1704978351; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9mXFLxUqeN64aeixmwDN8xkRu8voE2p8ywSUSrenZc=;
 b=yrNHHfWKKH1e1aDPdZheCPluKiKau4HLTRQsfEDry2soP330OORzbD/PBYTOTmjo94
 7iiky7eXq4ahxBxOaJppwRB0E311FZy2k/bjEvwuYVIxvjkbitcKEJhkCbwYz30vRlXL
 m2FRlQL36aP3TfvjfNzDxezQOBZ7HZST7LDC9qMYdlUx41ZbaS67nBicoB0F0KFsC+Be
 n1OUF4n4HfKp73h+nPru1pFyvaXLcPA+gvHHvXmO4PNsVrCml1wxkxDmt8S3oK2gyl72
 wfo8KmN+S+iyQRlb7sb5qj2/x4E6iiVW7IA1BGn8q1v0RJiXxzsy6PfIbc7eE8UjxRxp
 WYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704373551; x=1704978351;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9mXFLxUqeN64aeixmwDN8xkRu8voE2p8ywSUSrenZc=;
 b=hI02ijV10ZOiWclZr3veN51tDAxuqkCEQ83Fx/+e0tfsgtBffny3nNA+pttFbYZ7Xi
 DWHpycORqrwu5Lq7PZtHFtJKCXi8m2kVplvj5KP9sTfV30gogdJKC6OJOhjImfTaDqhm
 WdMiF5U9U3JfYQ+Qj9pA0/DV+aKUWbwrp/er+hE823wn7C8+wtchgrLWBEa4sUOGPDNG
 umchVJY/H2KJVnX+EYUPfwBRBU1Zt4ohnRgZu8+6KXegQBsXilZmeiVVZGbEr1zyNSjP
 C6HND/OJprK4dZNPYz7Plj2Bka5Q7iPSy4a/Yx+cPPQqN6XrYM7M1nN53hkI+VVHhCz/
 9w3w==
X-Gm-Message-State: AOJu0YyIVhku46tZPNoUxQ0Pkt5zd010HFTxkz49VNR98PiYpEGjUQv8
 W2ItsrG4Sckryqe/l6TpDdWtVGAn2HMOUA==
X-Received: by 2002:a05:600c:35ca:b0:40d:60ce:1697 with SMTP id
 r10-20020a05600c35ca00b0040d60ce1697mr365895wmq.38.1704373550823; 
 Thu, 04 Jan 2024 05:05:50 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0040d18ffbeeasm5683288wmq.31.2024.01.04.05.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:05:50 -0800 (PST)
Message-ID: <61fd13b3-7cc9-4e27-bf91-bd2b4aedf97b@linaro.org>
Date: Thu, 4 Jan 2024 14:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tests/qtest: Add STM32L4x5 EXTI QTest testcase
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <20231228161944.303768-1-ines.varhol@telecom-paris.fr>
 <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231228161944.303768-3-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: +BzNAGObZUCg

+Markus for QOM tree

On 28/12/23 17:19, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/meson.build           |   5 +
>   tests/qtest/stm32l4x5_exti-test.c | 596 ++++++++++++++++++++++++++++++
>   2 files changed, 601 insertions(+)
>   create mode 100644 tests/qtest/stm32l4x5_exti-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 47dabf91d0..d5126f4d86 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -194,6 +194,10 @@ qtests_aspeed = \
>     ['aspeed_hace-test',
>      'aspeed_smc-test',
>      'aspeed_gpio-test']
> +
> +qtests_stm32l4x5 = \
> +  ['stm32l4x5_exti-test']
> +
>   qtests_arm = \
>     (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
> @@ -207,6 +211,7 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
>     (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') ? qtests_stm32l4x5 : []) + \
>     ['arm-cpu-features',
>      'boot-serial-test']
>   
> diff --git a/tests/qtest/stm32l4x5_exti-test.c b/tests/qtest/stm32l4x5_exti-test.c
> new file mode 100644
> index 0000000000..60c8297246
> --- /dev/null
> +++ b/tests/qtest/stm32l4x5_exti-test.c
> @@ -0,0 +1,596 @@
> +/*
> + * QTest testcase for STM32L4x5_EXTI
> + *
> + * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2023 Inès Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"
> +
> +#define EXTI_BASE_ADDR 0x40010400
> +#define EXTI_IMR1 0x00
> +#define EXTI_EMR1 0x04
> +#define EXTI_RTSR1 0x08
> +#define EXTI_FTSR1 0x0C
> +#define EXTI_SWIER1 0x10
> +#define EXTI_PR1 0x14
> +#define EXTI_IMR2 0x20
> +#define EXTI_EMR2 0x24
> +#define EXTI_RTSR2 0x28
> +#define EXTI_FTSR2 0x2C
> +#define EXTI_SWIER2 0x30
> +#define EXTI_PR2 0x34
> +
> +#define NVIC_ISER 0xE000E100
> +#define NVIC_ISPR 0xE000E200
> +#define NVIC_ICPR 0xE000E280
> +
> +#define EXTI0_IRQ 6
> +#define EXTI1_IRQ 7
> +#define EXTI35_IRQ 1
> +
> +static void enable_nvic_irq(unsigned int n)
> +{
> +    writel(NVIC_ISER, 1 << n);
> +}
> +
> +static void unpend_nvic_irq(unsigned int n)
> +{
> +    writel(NVIC_ICPR, 1 << n);
> +}
> +
> +static bool check_nvic_pending(unsigned int n)
> +{
> +    return readl(NVIC_ISPR) & (1 << n);
> +}
> +
> +static void exti_writel(unsigned int offset, uint32_t value)
> +{
> +    writel(EXTI_BASE_ADDR + offset, value);
> +}
> +
> +static uint32_t exti_readl(unsigned int offset)
> +{
> +    return readl(EXTI_BASE_ADDR + offset);
> +}
> +
> +static void test_reg_write_read(void)
> +{
> +    /* Test that non-reserved bits in xMR and xTSR can be set and cleared */
> +
> +    exti_writel(EXTI_IMR1, 0xFFFFFFFF);
> +    uint32_t imr1 = exti_readl(EXTI_IMR1);
> +    g_assert_cmpuint(imr1, ==, 0xFFFFFFFF);
> +    exti_writel(EXTI_IMR1, 0x00000000);
> +    imr1 = exti_readl(EXTI_IMR1);
> +    g_assert_cmpuint(imr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_EMR1, 0xFFFFFFFF);
> +    uint32_t emr1 = exti_readl(EXTI_EMR1);
> +    g_assert_cmpuint(emr1, ==, 0xFFFFFFFF);
> +    exti_writel(EXTI_EMR1, 0x00000000);
> +    emr1 = exti_readl(EXTI_EMR1);
> +    g_assert_cmpuint(emr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_RTSR1, 0xFFFFFFFF);
> +    uint32_t rtsr1 = exti_readl(EXTI_RTSR1);
> +    g_assert_cmpuint(rtsr1, ==, 0x007DFFFF);
> +    exti_writel(EXTI_RTSR1, 0x00000000);
> +    rtsr1 = exti_readl(EXTI_RTSR1);
> +    g_assert_cmpuint(rtsr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_FTSR1, 0xFFFFFFFF);
> +    uint32_t ftsr1 = exti_readl(EXTI_FTSR1);
> +    g_assert_cmpuint(ftsr1, ==, 0x007DFFFF);
> +    exti_writel(EXTI_FTSR1, 0x00000000);
> +    ftsr1 = exti_readl(EXTI_FTSR1);
> +    g_assert_cmpuint(ftsr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_IMR2, 0xFFFFFFFF);
> +    uint32_t imr2 = exti_readl(EXTI_IMR2);
> +    g_assert_cmpuint(imr2, ==, 0x000000FF);
> +    exti_writel(EXTI_IMR2, 0x00000000);
> +    imr2 = exti_readl(EXTI_IMR2);
> +    g_assert_cmpuint(imr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_EMR2, 0xFFFFFFFF);
> +    uint32_t emr2 = exti_readl(EXTI_EMR2);
> +    g_assert_cmpuint(emr2, ==, 0x000000FF);
> +    exti_writel(EXTI_EMR2, 0x00000000);
> +    emr2 = exti_readl(EXTI_EMR2);
> +    g_assert_cmpuint(emr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_RTSR2, 0xFFFFFFFF);
> +    uint32_t rtsr2 = exti_readl(EXTI_RTSR2);
> +    g_assert_cmpuint(rtsr2, ==, 0x00000078);
> +    exti_writel(EXTI_RTSR2, 0x00000000);
> +    rtsr2 = exti_readl(EXTI_RTSR2);
> +    g_assert_cmpuint(rtsr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_FTSR2, 0xFFFFFFFF);
> +    uint32_t ftsr2 = exti_readl(EXTI_FTSR2);
> +    g_assert_cmpuint(ftsr2, ==, 0x00000078);
> +    exti_writel(EXTI_FTSR2, 0x00000000);
> +    ftsr2 = exti_readl(EXTI_FTSR2);
> +    g_assert_cmpuint(ftsr2, ==, 0x00000000);
> +}
> +
> +static void test_direct_lines_write(void)
> +{
> +    /* Test that direct lines reserved bits are not written to */
> +
> +    exti_writel(EXTI_RTSR1, 0xFF820000);
> +    uint32_t rtsr1 = exti_readl(EXTI_RTSR1);
> +    g_assert_cmpuint(rtsr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_FTSR1, 0xFF820000);
> +    uint32_t ftsr1 = exti_readl(EXTI_FTSR1);
> +    g_assert_cmpuint(ftsr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_SWIER1, 0xFF820000);
> +    uint32_t swier1 = exti_readl(EXTI_SWIER1);
> +    g_assert_cmpuint(swier1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_PR1, 0xFF820000);
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +
> +    exti_writel(EXTI_RTSR2, 0x00000087);
> +    const uint32_t rtsr2 = exti_readl(EXTI_RTSR2);
> +    g_assert_cmpuint(rtsr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_FTSR2, 0x00000087);
> +    const uint32_t ftsr2 = exti_readl(EXTI_FTSR2);
> +    g_assert_cmpuint(ftsr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_SWIER2, 0x00000087);
> +    const uint32_t swier2 = exti_readl(EXTI_SWIER2);
> +    g_assert_cmpuint(swier2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_PR2, 0x00000087);
> +    const uint32_t pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +}
> +
> +static void test_reserved_bits_write(void)
> +{
> +    /* Test that reserved bits stay are not written to */
> +
> +    exti_writel(EXTI_IMR2, 0xFFFFFF00);
> +    uint32_t imr2 = exti_readl(EXTI_IMR2);
> +    g_assert_cmpuint(imr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_EMR2, 0xFFFFFF00);
> +    uint32_t emr2 = exti_readl(EXTI_EMR2);
> +    g_assert_cmpuint(emr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_RTSR2, 0xFFFFFF00);
> +    const uint32_t rtsr2 = exti_readl(EXTI_RTSR2);
> +    g_assert_cmpuint(rtsr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_FTSR2, 0xFFFFFF00);
> +    const uint32_t ftsr2 = exti_readl(EXTI_FTSR2);
> +    g_assert_cmpuint(ftsr2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_SWIER2, 0xFFFFFF00);
> +    const uint32_t swier2 = exti_readl(EXTI_SWIER2);
> +    g_assert_cmpuint(swier2, ==, 0x00000000);
> +
> +    exti_writel(EXTI_PR2, 0xFFFFFF00);
> +    const uint32_t pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +}
> +
> +static void test_software_interrupt(void)
> +{
> +    /*
> +     * Test that we can launch a software irq by :
> +     * - enabling its line in IMR
> +     * - and then setting a bit from '0' to '1' in SWIER
> +     *
> +     * And that the interruption stays pending in NVIC
> +     * even after clearing the pending bit in PR.
> +     */
> +
> +    /*
> +     * Testing interrupt line EXTI0
> +     * Bit 0 in EXTI_*1 registers (EXTI0) corresponds to GPIO Px_0
> +     */
> +
> +    enable_nvic_irq(EXTI0_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Enable interrupt line EXTI0 */
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +    /* Set the right SWIER bit from '0' to '1' */
> +    exti_writel(EXTI_SWIER1, 0x00000000);
> +    exti_writel(EXTI_SWIER1, 0x00000001);
> +
> +    /* Check that the write in SWIER was effective */
> +    uint32_t swier1 = exti_readl(EXTI_SWIER1);
> +    g_assert_cmpuint(swier1, ==, 0x00000001);
> +    /* Check that the corresponding pending bit in PR is set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000001);
> +    /* Check that the corresponding interrupt is pending in the NVIC */
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Clear the pending bit in PR */
> +    exti_writel(EXTI_PR1, 0x00000001);
> +
> +    /* Check that the write in PR was effective */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the corresponding bit in SWIER was cleared */
> +    swier1 = exti_readl(EXTI_SWIER1);
> +    g_assert_cmpuint(swier1, ==, 0x00000000);
> +    /* Check that the interrupt is still pending in the NVIC */
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    /*
> +     * Testing interrupt line EXTI35
> +     * Bit 3 in EXTI_*2 registers (EXTI35) corresponds to PVM 1 Wakeup
> +     */
> +
> +    enable_nvic_irq(EXTI35_IRQ);
> +    /* Check that there are no interrupts already pending */
> +    uint32_t pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +    g_assert_false(check_nvic_pending(EXTI35_IRQ));
> +
> +    /* Enable interrupt line EXTI0 */
> +    exti_writel(EXTI_IMR2, 0x00000008);
> +    /* Set the right SWIER bit from '0' to '1' */
> +    exti_writel(EXTI_SWIER2, 0x00000000);
> +    exti_writel(EXTI_SWIER2, 0x00000008);
> +
> +    /* Check that the write in SWIER was effective */
> +    uint32_t swier2 = exti_readl(EXTI_SWIER2);
> +    g_assert_cmpuint(swier2, ==, 0x00000008);
> +    /* Check that the corresponding pending bit in PR is set */
> +    pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000008);
> +    /* Check that the corresponding interrupt is pending in the NVIC */
> +    g_assert_true(check_nvic_pending(EXTI35_IRQ));
> +
> +    /* Clear the pending bit in PR */
> +    exti_writel(EXTI_PR2, 0x00000008);
> +
> +    /* Check that the write in PR was effective */
> +    pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +    /* Check that the corresponding bit in SWIER was cleared */
> +    swier2 = exti_readl(EXTI_SWIER2);
> +    g_assert_cmpuint(swier2, ==, 0x00000000);
> +    /* Check that the interrupt is still pending in the NVIC */
> +    g_assert_true(check_nvic_pending(EXTI35_IRQ));
> +
> +    /* Clean NVIC */
> +    unpend_nvic_irq(EXTI0_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +    unpend_nvic_irq(EXTI35_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI35_IRQ));
> +}
> +
> +static void test_edge_selector(void)
> +{
> +    enable_nvic_irq(EXTI0_IRQ);
> +
> +    /* Configure EXTI line 0 irq on rising edge */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",

Markus, this qtest use seems to expect some stability in QOM path...

Inès, Arnaud, having the SoC unattached is dubious, it belongs to
the machine.

(qemu) info qom-tree
/machine (b-l475e-iot01a-machine)
   /SYSCLK (clock)
   /peripheral (container)
   /peripheral-anon (container)
   /unattached (container)
     /device[0] (stm32l4x5xg-soc)

Eh I don't see the 'exti' here...

Indeed the test fails:

17/35 qemu:qtest+qtest-arm / qtest-arm/test-arm-mptimer 
   OK              0.44s   61 subtests passed
▶ 18/35 /arm/stm32l4x5/exti/reg_write_read 
   FAIL
▶ 18/35 /arm/stm32l4x5/exti/no_software_interrupt 
   FAIL
▶ 18/35 /arm/stm32l4x5/exti/software_interrupt 
   FAIL
▶ 18/35 /arm/stm32l4x5/exti/masked_interrupt 
   FAIL
▶ 18/35 /arm/stm32l4x5/exti/interrupt 
   FAIL
▶ 18/35 /arm/stm32l4x5/exti/test_edge_selector 
   FAIL
Listing only the last 100 lines from a long log.
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:102:test_reg_write_read: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:109:test_reg_write_read: 
assertion failed (rtsr2 == 0x00000078): (0 == 120)
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:109:test_reg_write_read: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:116:test_reg_write_read: 
assertion failed (ftsr2 == 0x00000078): (0 == 120)
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:116:test_reg_write_read: 
code should not be reached
**
ERROR:../../tests/qtest/stm32l4x5_exti-test.c:421:test_no_software_interrupt: 
assertion failed (swier1 == 0x00000001): (0 == 1)
...

You should re-order patches 2 <-> 3.

> +                     NULL, 0, 1);
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +    exti_writel(EXTI_RTSR1, 0x00000001);
> +    exti_writel(EXTI_FTSR1, 0x00000000);
> +
> +    /* Test that an irq is raised on rising edge only */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 0);
> +
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 1);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000001);
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Clean the test */
> +    exti_writel(EXTI_PR1, 0x00000001);
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    unpend_nvic_irq(EXTI0_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Configure EXTI line 0 irq on falling edge */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 0);
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +    exti_writel(EXTI_RTSR1, 0x00000000);
> +    exti_writel(EXTI_FTSR1, 0x00000001);
> +
> +    /* Test that an irq is raised on falling edge only */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 1);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 0);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000001);
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Clean the test */
> +    exti_writel(EXTI_PR1, 0x00000001);
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    unpend_nvic_irq(EXTI0_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Configure EXTI line 0 irq on falling and rising edge */
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +    exti_writel(EXTI_RTSR1, 0x00000001);
> +    exti_writel(EXTI_FTSR1, 0x00000000);
> +
> +    /* Test that an irq is raised on rising and falling edge */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 1);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000001);
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 0);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000001);
> +    g_assert_true(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Clean the test */
> +    exti_writel(EXTI_PR1, 0x00000001);
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    unpend_nvic_irq(EXTI0_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Configure EXTI line 0 irq without selecting an edge trigger */
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +    exti_writel(EXTI_RTSR1, 0x00000000);
> +    exti_writel(EXTI_FTSR1, 0x00000000);
> +
> +    /* Test that no irq is raised */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 1);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 0, 0);
> +
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +}
> +
> +static void test_no_software_interrupt(void)
> +{
> +    /*
> +     * Test that software irq doesn't happen when :
> +     * - corresponding bit in IMR isn't set
> +     * - SWIER is set to 1 before IMR is set to 1
> +     */
> +
> +    /*
> +     * Testing interrupt line EXTI0
> +     * Bit 0 in EXTI_*1 registers (EXTI0) corresponds to GPIO Px_0
> +     */
> +
> +    enable_nvic_irq(EXTI0_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Mask interrupt line EXTI0 */
> +    exti_writel(EXTI_IMR1, 0x00000000);
> +    /* Set the corresponding SWIER bit from '0' to '1' */
> +    exti_writel(EXTI_SWIER1, 0x00000000);
> +    exti_writel(EXTI_SWIER1, 0x00000001);
> +
> +    /* Check that the write in SWIER was effective */
> +    uint32_t swier1 = exti_readl(EXTI_SWIER1);
> +    g_assert_cmpuint(swier1, ==, 0x00000001);
> +    /* Check that the pending bit in PR wasn't set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /* Enable interrupt line EXTI0 */
> +    exti_writel(EXTI_IMR1, 0x00000001);
> +
> +    /* Check that the pending bit in PR wasn't set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI0_IRQ));
> +
> +    /*
> +     * Testing interrupt line EXTI35
> +     * Bit 3 in EXTI_*2 registers (EXTI35) corresponds to PVM 1 Wakeup
> +     */
> +
> +    enable_nvic_irq(EXTI35_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    uint32_t pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI35_IRQ));
> +
> +    /* Mask interrupt line EXTI35 */
> +    exti_writel(EXTI_IMR2, 0x00000000);
> +    /* Set the corresponding SWIER bit from '0' to '1' */
> +    exti_writel(EXTI_SWIER2, 0x00000000);
> +    exti_writel(EXTI_SWIER2, 0x00000008);
> +
> +    /* Check that the write in SWIER was effective */
> +    uint32_t swier2 = exti_readl(EXTI_SWIER2);
> +    g_assert_cmpuint(swier2, ==, 0x00000008);
> +    /* Check that the pending bit in PR wasn't set */
> +    pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI35_IRQ));
> +
> +    /* Enable interrupt line EXTI35 */
> +    exti_writel(EXTI_IMR2, 0x00000008);
> +
> +    /* Check that the pending bit in PR wasn't set */
> +    pr2 = exti_readl(EXTI_PR2);
> +    g_assert_cmpuint(pr2, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI35_IRQ));
> +}
> +
> +static void test_masked_interrupt(void)
> +{
> +    /*
> +     * Test that irq doesn't happen when :
> +     * - corresponding bit in IMR isn't set
> +     * - SWIER is set to 1 before IMR is set to 1
> +     */
> +
> +    /*
> +     * Testing interrupt line EXTI1
> +     * with rising edge from GPIOx pin 1
> +     */
> +
> +    enable_nvic_irq(EXTI1_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI1_IRQ));
> +
> +    /* Mask interrupt line EXTI1 */
> +    exti_writel(EXTI_IMR1, 0x00000000);
> +
> +    /* Configure interrupt on rising edge */
> +    exti_writel(EXTI_RTSR1, 0x00000002);
> +
> +    /* Simulate rising edge from GPIO line 1 */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 1, 1);
> +
> +    /* Check that the pending bit in PR wasn't set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI1_IRQ));
> +
> +    /* Enable interrupt line EXTI1 */
> +    exti_writel(EXTI_IMR1, 0x00000002);
> +
> +    /* Check that the pending bit in PR wasn't set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI1_IRQ));
> +}
> +
> +static void test_interrupt(void)
> +{
> +    /*
> +     * Test that we can launch an irq by :
> +     * - enabling its line in IMR
> +     * - configuring interrupt on rising edge
> +     * - and then setting the input line from '0' to '1'
> +     *
> +     * And that the interruption stays pending in NVIC
> +     * even after clearing the pending bit in PR.
> +     */
> +
> +    /*
> +     * Testing interrupt line EXTI1
> +     * with rising edge from GPIOx pin 1
> +     */
> +
> +    enable_nvic_irq(EXTI1_IRQ);
> +    /* Check that there are no interrupts already pending in PR */
> +    uint32_t pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that this specific interrupt isn't pending in NVIC */
> +    g_assert_false(check_nvic_pending(EXTI1_IRQ));
> +
> +    /* Enable interrupt line EXTI1 */
> +    exti_writel(EXTI_IMR1, 0x00000002);
> +
> +    /* Configure interrupt on rising edge */
> +    exti_writel(EXTI_RTSR1, 0x00000002);
> +
> +    /* Simulate rising edge from GPIO line 1 */
> +    qtest_set_irq_in(global_qtest, "/machine/unattached/device[0]/exti",
> +                     NULL, 1, 1);
> +
> +    /* Check that the pending bit in PR was set */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000002);
> +    /* Check that the interrupt is pending in NVIC */
> +    g_assert_true(check_nvic_pending(EXTI1_IRQ));
> +
> +    /* Clear the pending bit in PR */
> +    exti_writel(EXTI_PR1, 0x00000002);
> +
> +    /* Check that the write in PR was effective */
> +    pr1 = exti_readl(EXTI_PR1);
> +    g_assert_cmpuint(pr1, ==, 0x00000000);
> +    /* Check that the interrupt is still pending in the NVIC */
> +    g_assert_true(check_nvic_pending(EXTI1_IRQ));
> +
> +    /* Clean NVIC */
> +    unpend_nvic_irq(EXTI1_IRQ);
> +    g_assert_false(check_nvic_pending(EXTI1_IRQ));
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +    g_test_set_nonfatal_assertions();
> +    qtest_add_func("stm32l4x5/exti/direct_lines", test_direct_lines_write);
> +    qtest_add_func("stm32l4x5/exti/reserved_bits", test_reserved_bits_write);
> +    qtest_add_func("stm32l4x5/exti/reg_write_read", test_reg_write_read);
> +    qtest_add_func("stm32l4x5/exti/no_software_interrupt",
> +                   test_no_software_interrupt);
> +    qtest_add_func("stm32l4x5/exti/software_interrupt",
> +                   test_software_interrupt);
> +    qtest_add_func("stm32l4x5/exti/masked_interrupt", test_masked_interrupt);
> +    qtest_add_func("stm32l4x5/exti/interrupt", test_interrupt);
> +    qtest_add_func("stm32l4x5/exti/test_edge_selector", test_edge_selector);
> +
> +    qtest_start("-machine b-l475e-iot01a");
> +    ret = g_test_run();
> +    qtest_end();
> +
> +    return ret;
> +}

