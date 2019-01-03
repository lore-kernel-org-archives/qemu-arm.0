Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp488650wrt;
        Thu, 3 Jan 2019 02:41:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WxgcUkmI3mV70U1iijrp1EqOiOKPrK1mXIyyszsAPDE9B/kgKtFHMu1BV7q2HenzGmVCpV
X-Received: by 2002:ac8:3aa3:: with SMTP id x32mr46556651qte.282.1546512092439;
        Thu, 03 Jan 2019 02:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546512092; cv=none;
        d=google.com; s=arc-20160816;
        b=XnZw4wbscha7oBASGQxGNZxx19S6h0yVVsfbX3fO95UeRxVpX0yZwLHE/EbPnYxJLK
         kEuS7P+JseyYWc17yLSf2xoOOz3+TH/6/dHmnBmUrNhuAm7LFzoiYpxpbXlmHoQyTD/I
         z8dZQPMWndya3nLePbx2Hv+0Yy9xAzvmiSOVX7Kx6ZtUohcwPXZMdqmfFnR+IdWj77CO
         E8OeV1kiPwbVZBZHbfQsA0GimEEmDCe+u4FEekgXo3BIJxo8poqZQb/XQG56BKX7rfrn
         j6V1zKIq5wjQrbxi8r6EGtkhhB1nJ/QmKsx3lQelbeGhVP1or98JcQw8n73pm+F+2XCe
         oPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=aOz2CyUkkorl3Bx7bQCFTQdPq5cGL0UTSpXnvZxiD48=;
        b=ruV49aOcNYNjykpuu3XSnANXBhPDfnhmhMqqeXsKMXhBRwYwe/BPOh+mDLP/Gwduk8
         YqL8uhzVpy0I0aCyRITKVKS1opWvkbHGwe6tAXa0GGjTiGsd2eoczgyXNASTpt8eth5R
         Ct3zEPJbQhuXc8AvXAqe4sObUmRQvoTQPIAikYw8mJqrQ9jCT+950NjSV31PPC7I2LBU
         aeI1h0Wo4uxKhLctJpXASQUT/wnvmHnOl3dGwZDCHWjTJu2fpC7fPFqvEv8Cv2Ze+fQ8
         EnlpYOPQ4UUuqJThWSN7fgDBDzKBSgoa/Dr6h5Xfiyi6pQ/F/VDcSLK15O1XhG8Xe7oT
         7SIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y63si2604633qkb.69.2019.01.03.02.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 02:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gf0RP-00018h-VT
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 05:41:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gf0QY-0000Sq-R3
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 05:40:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gf0QU-0007cf-12
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 05:40:38 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gf0QT-0007cA-RQ
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 05:40:33 -0500
Received: by mail-wr1-f65.google.com with SMTP id z5so33103839wrt.11
	for <qemu-arm@nongnu.org>; Thu, 03 Jan 2019 02:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aOz2CyUkkorl3Bx7bQCFTQdPq5cGL0UTSpXnvZxiD48=;
	b=TC7wLOx4HaoxxBRjs2T3/E5dxJ2p83CW5Q8tU1l59j+feVOBOTsbB2tZ1aGKJU0jCa
	7DdN1omPBu2pgsf5CEJrFpEgbJ3x9eBf7shTUS3EghQcbOhB98yCfj+iO+VvUhlkabYm
	0ZVGxJT07d6nEZStNaoWr6E7EsYXrHsO87NTOcMruWqSGY89K68aCCwxS2iL8lpTb1tl
	gEU6mdwejDWXz5zhr4Ngas0Og2hsKXufKfmsI8M6vvE+5oGdb1T4BCROrJ84S5vk5oL3
	4XI2tyOFkQKMLibJU9GFOO+CBl85d4zioK41Ng9AhGWbxw1dY94e5ZQ52z0kGY4921Yx
	R/Eg==
X-Gm-Message-State: AJcUukdMFZSbvthRSENgh33E8otiCTeJR5NOcfErmtQF2l6meSmnsfqr
	ivP/Be7cxUJqUDNSIiHSf+/3IQ==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr43050377wrp.92.1546512032786; 
	Thu, 03 Jan 2019 02:40:32 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	h184sm31953211wmf.0.2019.01.03.02.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 02:40:32 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190103091119.9367-1-stefanha@redhat.com>
	<20190103091119.9367-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <51ac1e9a-6576-9a54-91f3-76bf66040cc7@redhat.com>
Date: Thu, 3 Jan 2019 11:40:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190103091119.9367-3-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/11] arm: Add header to host
 common definition for nRF51 SOC peripherals
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3elAOdTUFti+

On 1/3/19 10:11 AM, Stefan Hajnoczi wrote:
> From: Steffen Görtz <contrib@steffen-goertz.de>
> 
> Adds a header that provides definitions that are used
> across nRF51 peripherals
> 
> Signed-off-by: Steffen Görtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/arm/nrf51.h       | 45 ++++++++++++++++++++++++++++++++++++
>  include/hw/char/nrf51_uart.h |  1 -
>  hw/arm/nrf51_soc.c           | 33 ++++++++++----------------
>  3 files changed, 57 insertions(+), 22 deletions(-)
>  create mode 100644 include/hw/arm/nrf51.h
> 
> diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
> new file mode 100644
> index 0000000000..175bb6c301
> --- /dev/null
> +++ b/include/hw/arm/nrf51.h
> @@ -0,0 +1,45 @@
> +/*
> + * Nordic Semiconductor nRF51 Series SOC Common Defines
> + *
> + * This file hosts generic defines used in various nRF51 peripheral devices.
> + *
> + * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
> + * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.pdf
> + *
> + * Copyright 2018 Steffen Görtz <contrib@steffen-goertz.de>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef NRF51_H
> +#define NRF51_H
> +
> +#define NRF51_FLASH_BASE      0x00000000
> +#define NRF51_FICR_BASE       0x10000000
> +#define NRF51_FICR_SIZE       0x00000100
> +#define NRF51_UICR_BASE       0x10001000
> +#define NRF51_SRAM_BASE       0x20000000
> +
> +#define NRF51_IOMEM_BASE      0x40000000
> +#define NRF51_IOMEM_SIZE      0x20000000
> +
> +#define NRF51_UART_BASE       0x40002000
> +#define NRF51_TIMER_BASE      0x40008000
> +#define NRF51_TIMER_SIZE      0x00001000
> +#define NRF51_RNG_BASE        0x4000D000
> +#define NRF51_NVMC_BASE       0x4001E000
> +#define NRF51_GPIO_BASE       0x50000000
> +
> +#define NRF51_PRIVATE_BASE    0xF0000000
> +#define NRF51_PRIVATE_SIZE    0x10000000
> +
> +#define NRF51_PAGE_SIZE       1024

I'd keep this file in hw/arm (not include/...).

> +
> +/* Trigger */
> +#define NRF51_TRIGGER_TASK 0x01
> +
> +/* Events */
> +#define NRF51_EVENT_CLEAR  0x00

These definitions might be the only one used out of hw/arm/.

> +
> +#endif
> diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
> index e3ecb7c81c..eb1c15b490 100644
> --- a/include/hw/char/nrf51_uart.h
> +++ b/include/hw/char/nrf51_uart.h
> @@ -16,7 +16,6 @@
>  #include "hw/registerfields.h"
>  
>  #define UART_FIFO_LENGTH 6
> -#define UART_BASE 0x40002000
>  #define UART_SIZE 0x1000
>  
>  #define TYPE_NRF51_UART "nrf51_soc.uart"
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index b89c1bdea0..55f8eaafcb 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -21,27 +21,16 @@
>  #include "qemu/log.h"
>  #include "cpu.h"
>  
> +#include "hw/arm/nrf51.h"
>  #include "hw/arm/nrf51_soc.h"
>  
> -#define IOMEM_BASE      0x40000000
> -#define IOMEM_SIZE      0x20000000
> -
> -#define FICR_BASE       0x10000000
> -#define FICR_SIZE       0x000000fc
> -
> -#define FLASH_BASE      0x00000000
> -#define SRAM_BASE       0x20000000
> -
> -#define PRIVATE_BASE    0xF0000000
> -#define PRIVATE_SIZE    0x10000000
> -
>  /*
>   * The size and base is for the NRF51822 part. If other parts
>   * are supported in the future, add a sub-class of NRF51SoC for
>   * the specific variants
>   */
> -#define NRF51822_FLASH_SIZE     (256 * 1024)
> -#define NRF51822_SRAM_SIZE      (16 * 1024)
> +#define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
> +#define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
>  
>  #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
>  
> @@ -76,14 +65,14 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>          error_propagate(errp, err);
>          return;
>      }
> -    memory_region_add_subregion(&s->container, FLASH_BASE, &s->flash);
> +    memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
>  
>      memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> -    memory_region_add_subregion(&s->container, SRAM_BASE, &s->sram);
> +    memory_region_add_subregion(&s->container, NRF51_SRAM_BASE, &s->sram);
>  
>      /* UART */
>      object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
> @@ -92,15 +81,17 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>          return;
>      }
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart), 0);
> -    memory_region_add_subregion_overlap(&s->container, UART_BASE, mr, 0);
> +    memory_region_add_subregion_overlap(&s->container, NRF51_UART_BASE, mr, 0);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0,
>                         qdev_get_gpio_in(DEVICE(&s->cpu),
> -                       BASE_TO_IRQ(UART_BASE)));
> +                       BASE_TO_IRQ(NRF51_UART_BASE)));
>  
> -    create_unimplemented_device("nrf51_soc.io", IOMEM_BASE, IOMEM_SIZE);
> -    create_unimplemented_device("nrf51_soc.ficr", FICR_BASE, FICR_SIZE);
> +    create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
> +                                NRF51_IOMEM_SIZE);
> +    create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
> +                                NRF51_FICR_SIZE);
>      create_unimplemented_device("nrf51_soc.private",
> -                                PRIVATE_BASE, PRIVATE_SIZE);
> +                                NRF51_PRIVATE_BASE, NRF51_PRIVATE_SIZE);
>  }
>  
>  static void nrf51_soc_init(Object *obj)
> 
