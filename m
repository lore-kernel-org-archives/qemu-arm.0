Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1534967njm;
        Mon, 1 Jul 2024 11:43:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiaQIfe5SU5SDHplDcNSdDyavixFiX96vMdj8JZygYl3vqRZZ6JrtQz0pbb2oPlU1MRIu7/tFhGG+UAz3O8GVU5PTptfTN
X-Google-Smtp-Source: AGHT+IGzZInXGBDi3lIjGWRwkdfQjiNmDyhczipRflBgxiegiafkECQRf+J4Br09xGmdYk0xor2T
X-Received: by 2002:ac8:7c46:0:b0:446:589b:cea8 with SMTP id d75a77b69052e-446616d9f5fmr108928021cf.28.1719859410652;
        Mon, 01 Jul 2024 11:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719859410; cv=none;
        d=google.com; s=arc-20160816;
        b=GdvmcgbdrLtrILdMNs2V9WWq7qXTk22Ko2TjC7hG3keWwCf3B+UUTgzXZrTorGs/+e
         OwrvxH3LUb3f8VcUgk3mxlf5cYHa0gblwFdHCe+0UJeo1GeNksFMg9Ykqgm2ryjFlN6O
         fe6EnoCTDzkzmQ52DCI1SitVk87w5JYPXJDES5uqg1MspuMsTwXM8G7PvFv6MRtV1hpU
         TmM7G1mQetoQCJflv3qi6R/7TEhDl1JnGCzbd/t8bIntrmCk+QX/o/RwC6zInWF9WXy4
         P3BVgS1f+TQfPWvX3id2omkre4zu+wv0+PLnlMGPriVC7PB0rRpjBFYK2jOti3EXe8Rg
         kymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=j1v3Xg951EwOwpNoGTSKpIyP2V/47MHyhgBSfhTH658=;
        fh=mz6QU+R2ARrFGaX6AFbNQuoDoDh2mdgHQCuz2bNdl94=;
        b=R8fYmqaG6mnTTE1Qfx+gKF9VUb0Hilqw6OXmtE+249DGSnd4XLKI2W9ZUJ6adFJlQS
         D9DsZf+juPWs8Z39zvI+7MOoFCgFvW/Y+9jFMckn5a/QVKlD0+axwI+CtsX9ywj+pCZW
         c/4309mIcI3RwXuNUpXDaKufj90ICBqobQZ5Vx4vvtVewkkCe2usb2dmnYo423RH+XyD
         OnG4TB74D5USU/TygUNqSP8fRs/8jHrYn7heuRYitEJueMBKB/faOlTgpXwNhz97grio
         5GZpfnJ3XD/th+x9Xcz6JAN2S+12UiuHLUk03yAV7Q0czOfxxCkPaCcvrDWTSVafxLlX
         s4gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=Jc1rcOl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44651485caasi96314031cf.315.2024.07.01.11.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 11:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=Jc1rcOl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOLzo-0005Fy-43; Mon, 01 Jul 2024 14:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sOLzm-0005Ef-FD; Mon, 01 Jul 2024 14:43:22 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sOLzj-0001e5-K5; Mon, 01 Jul 2024 14:43:22 -0400
Received: from localhost (sekoia-laptop.home.lmichel.fr [192.168.61.102])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 787E1C602A4;
 Mon,  1 Jul 2024 20:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1719859394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j1v3Xg951EwOwpNoGTSKpIyP2V/47MHyhgBSfhTH658=;
 b=Jc1rcOl7bdzXBdQv6z1zWkoq0BtNs45rtmnJ/gbG5tO92CQau1qJtvx7njAnGSdE5i39OU
 yEHxraoCRIm+F9XPhmX9MjosJHDa/sIZjuzvZOkXPDNOZxjWAbEDdE0W+FXcSWU2zPB9KS
 TBem/E1o+1bwVZhK0iUPUrHsDC6w3rALWz9gcZgu36sHPipRokXtCRdOYUqq/V48J9clrw
 XeYKDTAcoOY8zUCEMHqcGBCyd4LDrqnlp3Ii/864Aq8Zidm/feZLSTnIkLoL7+lML5h+8K
 yXKAuFxD8HD3xxf5sVksQ08ORDQZ+F2vtmQFjSn1gE+LsqedFFZ6t2BqjlMN+Q==
Date: Mon, 1 Jul 2024 20:43:13 +0200
From: Luc Michel <luc@lmichel.fr>
To: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Damien Hedde <damien.hedde@dahe.fr>
Subject: Re: [PATCH v4 3/3] tests/qtest: Check STM32L4x5 clock connections
Message-ID: <ZoL4wV9hacj7ubn0@michell-laptop.localdomain>
References: <20240622094402.244604-1-ines.varhol@telecom-paris.fr>
 <20240622094402.244604-4-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240622094402.244604-4-ines.varhol@telecom-paris.fr>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gu7yH00QVydl

On 11:43 Sat 22 Jun     , Inès Varhol wrote:
> For USART, GPIO and SYSCFG devices, check that clock frequency before
> and after enabling the peripheral clock in RCC is correct.
> 
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  tests/qtest/stm32l4x5.h             | 42 +++++++++++++++++++++++++++++
>  tests/qtest/stm32l4x5_gpio-test.c   | 23 ++++++++++++++++
>  tests/qtest/stm32l4x5_syscfg-test.c | 20 ++++++++++++--
>  tests/qtest/stm32l4x5_usart-test.c  | 26 ++++++++++++++++++
>  4 files changed, 109 insertions(+), 2 deletions(-)
>  create mode 100644 tests/qtest/stm32l4x5.h
> 
> diff --git a/tests/qtest/stm32l4x5.h b/tests/qtest/stm32l4x5.h
> new file mode 100644
> index 0000000000..2d21cc666c
> --- /dev/null
> +++ b/tests/qtest/stm32l4x5.h
> @@ -0,0 +1,42 @@
> +/*
> + * QTest testcase header for STM32L4X5 :
> + * used for consolidating common objects in stm32l4x5_*-test.c
> + *
> + * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2024 Inès Varhol <ines.varhol@telecom-paris.fr>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "libqtest.h"
> +
> +/* copied from clock.h */
> +#define CLOCK_PERIOD_1SEC (1000000000llu << 32)
> +#define CLOCK_PERIOD_FROM_HZ(hz) (((hz) != 0) ? CLOCK_PERIOD_1SEC / (hz) : 0u)
> +/*
> + * MSI (4 MHz) is used as system clock source after startup
> + * from Reset.
> + * AHB, APB1 and APB2 prescalers are set to 1 at reset.
> + */
> +#define SYSCLK_PERIOD CLOCK_PERIOD_FROM_HZ(4000000)
> +#define RCC_AHB2ENR 0x4002104C
> +#define RCC_APB1ENR1 0x40021058
> +#define RCC_APB1ENR2 0x4002105C
> +#define RCC_APB2ENR 0x40021060
> +
> +
> +static inline uint64_t get_clock_period(QTestState *qts, const char *path)
> +{
> +    uint64_t clock_period = 0;
> +    QDict *r;
> +
> +    r = qtest_qmp(qts, "{ 'execute': 'qom-get', 'arguments':"
> +        " { 'path': %s, 'property': 'qtest-clock-period'} }", path);
> +    g_assert_false(qdict_haskey(r, "error"));
> +    clock_period = qdict_get_int(r, "return");
> +    qobject_unref(r);
> +    return clock_period;
> +}
> +
> +
> diff --git a/tests/qtest/stm32l4x5_gpio-test.c b/tests/qtest/stm32l4x5_gpio-test.c
> index 72a7823406..c0686c7b30 100644
> --- a/tests/qtest/stm32l4x5_gpio-test.c
> +++ b/tests/qtest/stm32l4x5_gpio-test.c
> @@ -10,6 +10,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "libqtest-single.h"
> +#include "stm32l4x5.h"
>  
>  #define GPIO_BASE_ADDR 0x48000000
>  #define GPIO_SIZE      0x400
> @@ -505,6 +506,26 @@ static void test_bsrr_brr(const void *data)
>      gpio_writel(gpio, ODR, reset(gpio, ODR));
>  }
>  
> +static void test_clock_enable(void)
> +{
> +    /*
> +     * For each GPIO, enable its clock in RCC
> +     * and check that its clock period changes to SYSCLK_PERIOD
> +     */
> +    unsigned int gpio_id;
> +
> +    for (uint32_t gpio = GPIO_A; gpio <= GPIO_H; gpio += GPIO_B - GPIO_A) {
> +        gpio_id = get_gpio_id(gpio);
> +        g_autofree char *path = g_strdup_printf("/machine/soc/gpio%c/clk",
> +                                                gpio_id + 'a');
> +        g_assert_cmpuint(get_clock_period(global_qtest, path), ==, 0);
> +        /* Enable the gpio clock */
> +        writel(RCC_AHB2ENR, readl(RCC_AHB2ENR) | (0x1 << gpio_id));
> +        g_assert_cmpuint(get_clock_period(global_qtest, path), ==,
> +                         SYSCLK_PERIOD);
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int ret;
> @@ -556,6 +577,8 @@ int main(int argc, char **argv)
>      qtest_add_data_func("stm32l4x5/gpio/test_bsrr_brr2",
>                          test_data(GPIO_D, 0),
>                          test_bsrr_brr);
> +    qtest_add_func("stm32l4x5/gpio/test_clock_enable",
> +                   test_clock_enable);
>  
>      qtest_start("-machine b-l475e-iot01a");
>      ret = g_test_run();
> diff --git a/tests/qtest/stm32l4x5_syscfg-test.c b/tests/qtest/stm32l4x5_syscfg-test.c
> index 506ca08bc2..8eaffe43ea 100644
> --- a/tests/qtest/stm32l4x5_syscfg-test.c
> +++ b/tests/qtest/stm32l4x5_syscfg-test.c
> @@ -10,6 +10,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "libqtest-single.h"
> +#include "stm32l4x5.h"
>  
>  #define SYSCFG_BASE_ADDR 0x40010000
>  #define SYSCFG_MEMRMP 0x00
> @@ -26,7 +27,9 @@
>  #define INVALID_ADDR 0x2C
>  
>  /* SoC forwards GPIOs to SysCfg */
> -#define SYSCFG "/machine/soc"
> +#define SOC "/machine/soc"
> +#define SYSCFG "/machine/soc/syscfg"
> +#define SYSCFG_CLK "/machine/soc/syscfg/clk"
>  #define EXTI "/machine/soc/exti"
>  
>  static void syscfg_writel(unsigned int offset, uint32_t value)
> @@ -41,7 +44,7 @@ static uint32_t syscfg_readl(unsigned int offset)
>  
>  static void syscfg_set_irq(int num, int level)
>  {
> -   qtest_set_irq_in(global_qtest, SYSCFG, NULL, num, level);
> +   qtest_set_irq_in(global_qtest, SOC, NULL, num, level);
>  }
>  
>  static void system_reset(void)
> @@ -301,6 +304,17 @@ static void test_irq_gpio_multiplexer(void)
>      syscfg_writel(SYSCFG_EXTICR1, 0x00000000);
>  }
>  
> +static void test_clock_enable(void)
> +{
> +    g_assert_cmpuint(get_clock_period(global_qtest, SYSCFG_CLK), ==, 0);
> +
> +    /* Enable SYSCFG clock */
> +    writel(RCC_APB2ENR, readl(RCC_APB2ENR) | (0x1 << 0));
> +
> +    g_assert_cmpuint(get_clock_period(global_qtest, SYSCFG_CLK), ==,
> +                                       SYSCLK_PERIOD);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int ret;
> @@ -325,6 +339,8 @@ int main(int argc, char **argv)
>                     test_irq_pin_multiplexer);
>      qtest_add_func("stm32l4x5/syscfg/test_irq_gpio_multiplexer",
>                     test_irq_gpio_multiplexer);
> +    qtest_add_func("stm32l4x5/syscfg/test_clock_enable",
> +                   test_clock_enable);
>  
>      qtest_start("-machine b-l475e-iot01a");
>      ret = g_test_run();
> diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_usart-test.c
> index 8902518233..4bad3603e8 100644
> --- a/tests/qtest/stm32l4x5_usart-test.c
> +++ b/tests/qtest/stm32l4x5_usart-test.c
> @@ -12,6 +12,7 @@
>  #include "libqtest.h"
>  #include "hw/misc/stm32l4x5_rcc_internals.h"
>  #include "hw/registerfields.h"
> +#include "stm32l4x5.h"
>  
>  #define RCC_BASE_ADDR 0x40021000
>  /* Use USART 1 ADDR, assume the others work the same */
> @@ -296,6 +297,30 @@ static void test_send_str(void)
>      qtest_quit(qts);
>  }
>  
> +static void check_clock(QTestState *qts, const char *path, uint32_t rcc_reg,
> +                        uint32_t reg_offset)
> +{
> +    g_assert_cmpuint(get_clock_period(qts, path), ==, 0);
> +    qtest_writel(qts, rcc_reg, qtest_readl(qts, rcc_reg) | (0x1 << reg_offset));
> +    g_assert_cmpuint(get_clock_period(qts, path), ==, SYSCLK_PERIOD);
> +}
> +
> +static void test_clock_enable(void)
> +{
> +    /*
> +     * For each USART device, enable its clock in RCC
> +     * and check that its clock frequency is SYSCLK_PERIOD
> +     */
> +    QTestState *qts = qtest_init("-M b-l475e-iot01a");
> +
> +    check_clock(qts, "machine/soc/usart[0]/clk", RCC_APB2ENR, 14);
> +    check_clock(qts, "machine/soc/usart[1]/clk", RCC_APB1ENR1, 17);
> +    check_clock(qts, "machine/soc/usart[2]/clk", RCC_APB1ENR1, 18);
> +    check_clock(qts, "machine/soc/uart[0]/clk", RCC_APB1ENR1, 19);
> +    check_clock(qts, "machine/soc/uart[1]/clk", RCC_APB1ENR1, 20);
> +    check_clock(qts, "machine/soc/lpuart1/clk", RCC_APB1ENR2, 0);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int ret;
> @@ -308,6 +333,7 @@ int main(int argc, char **argv)
>      qtest_add_func("stm32l4x5/usart/send_char", test_send_char);
>      qtest_add_func("stm32l4x5/usart/receive_str", test_receive_str);
>      qtest_add_func("stm32l4x5/usart/send_str", test_send_str);
> +    qtest_add_func("stm32l4x5/usart/clock_enable", test_clock_enable);
>      ret = g_test_run();
>  
>      return ret;
> -- 
> 2.43.2
> 

-- 
