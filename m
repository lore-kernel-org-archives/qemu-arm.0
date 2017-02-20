Received: by 10.25.0.147 with SMTP id 141csp117840lfa;
        Mon, 20 Feb 2017 09:48:08 -0800 (PST)
X-Received: by 10.55.198.212 with SMTP id s81mr10018349qkl.132.1487612888886;
        Mon, 20 Feb 2017 09:48:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 72si4312504qtb.310.2017.02.20.09.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 09:48:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfs4G-0003su-BY
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 12:48:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs2V-0002WY-Fq
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:46:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs2R-000276-Do
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 12:46:19 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfs2R-000272-9m; Mon, 20 Feb 2017 12:46:15 -0500
Received: by mail-qt0-x243.google.com with SMTP id b16so11410048qte.2;
	Mon, 20 Feb 2017 09:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=i3pFku1HdAETu0vcoW7UGqfFLF67ox+timq6AEeYe+s=;
	b=sv9hGPyiwxio+CCYEPcPsq1ivxgtb0HMBg1zK7g78vdQTY++EHInjy1a62+u0UrCjX
	LeZAsUSGjoZspotVLDPM7fEj2LUOuUW57nAXirzwzD6Pq0hC9EpGsCAsjDYyXd6Q2ofV
	Dwipo8U2Duz0x88uquURIXCj4MIbsSOI3T4ZSs/OBlIWqMPyCP5EZmydeMON4v5DlzbC
	p1sYRkQnbg0mokQGEg1tE1QoSKb5f1NAKhOM9JMi65yiNypzFPSx1odyS/G82sXG3dAM
	bIIT4JWfM020bdgUx8LKF7v5J57WwYh1ljO4hOclfNsAtxr5E+6p/6bnhh0Q8y5GhMOj
	PEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=i3pFku1HdAETu0vcoW7UGqfFLF67ox+timq6AEeYe+s=;
	b=f+x6a0tPcEcMzBGPI3fcBX26MgYtIXJPMOz6GG/sCcNf7bM49ed3yG7eeAK11R/N2d
	Y4FN0FZhBfM0K9PPzmW2Pl3QxilUlB3eyQ6tXza6gBGNCIEYZQL4Mw8dhUeol8KPimvr
	hNYRX+VZXwBDzGhb7HG7Ck+jHyMrggvyBhQplP0Lm9xS4Vm3yB6rHvvOYO38fDl+Kxvw
	g18wtrBU5YDIDDesnbLyQntbiS8TsrzfuC4FltMDH6qS2GM5r5PA5kQrcnqY79qN9AnW
	D8TjT41ACX3UIl4LmurCPVPdUyyEUgISCJ/G+Nx+FbO5Ygs/A+jD/U23WqfWL27/W67K
	g3KQ==
X-Gm-Message-State: AMke39kns38GOPh/1r3FTPkcxq4UDX3Y/aVgDdillW1XPVIMiWu2Zj5GgMJn+7lbJGZ3sQ==
X-Received: by 10.237.35.84 with SMTP id i20mr23243784qtc.247.1487612774682;
	Mon, 20 Feb 2017 09:46:14 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	a54sm12391805qta.48.2017.02.20.09.46.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 09:46:14 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ff4146f-3ec0-615e-ff57-6df1041662ba@amsat.org>
Date: Mon, 20 Feb 2017 14:46:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 11/11] stm32f205: Rename 'nvic'
 local to 'armv7m'
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqvIlyMCeq9y

On 02/20/2017 12:36 PM, Peter Maydell wrote:
> The local variable 'nvic' in stm32f205_soc_realize() no longer
> holds a direct pointer to the NVIC device; it is a pointer to
> the ARMv7M container object. Rename it 'armv7m' accordingly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/stm32f205_soc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index e6bd73a..6e1260d 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -85,7 +85,7 @@ static void stm32f205_soc_initfn(Object *obj)
>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      STM32F205State *s = STM32F205_SOC(dev_soc);
> -    DeviceState *dev, *nvic;
> +    DeviceState *dev, *armv7m;
>      SysBusDevice *busdev;
>      Error *err = NULL;
>      int i;
> @@ -113,9 +113,9 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      vmstate_register_ram_global(sram);
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
>
> -    nvic = DEVICE(&s->armv7m);
> -    qdev_prop_set_uint32(nvic, "num-irq", 96);
> -    qdev_prop_set_string(nvic, "cpu-model", s->cpu_model);
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
> +    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
>                                       "memory", &error_abort);
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
> @@ -133,7 +133,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      busdev = SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0x40013800);
> -    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, 71));
> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
>
>      /* Attach UART (uses USART registers) and USART controllers */
>      for (i = 0; i < STM_NUM_USARTS; i++) {
> @@ -147,7 +147,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, usart_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, usart_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq[i]));
>      }
>
>      /* Timer 2 to 5 */
> @@ -161,7 +161,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, timer_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, timer_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, timer_irq[i]));
>      }
>
>      /* ADC 1 to 3 */
> @@ -173,7 +173,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          return;
>      }
>      qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
> -                          qdev_get_gpio_in(nvic, ADC_IRQ));
> +                          qdev_get_gpio_in(armv7m, ADC_IRQ));
>
>      for (i = 0; i < STM_NUM_ADCS; i++) {
>          dev = DEVICE(&(s->adc[i]));
> @@ -198,7 +198,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>          }
>          busdev = SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, spi_addr[i]);
> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, spi_irq[i]));
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
>      }
>  }
>
>
