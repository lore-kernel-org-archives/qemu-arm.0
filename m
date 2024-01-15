Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp157692ejf;
        Mon, 15 Jan 2024 03:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3pKX+NJWvMnAtwa/FVZsCW4C7BgjzqJI9M5sHpxmZmQxiDT1tya+MOf7q93h5b3zYKwQZ
X-Received: by 2002:a05:620a:2685:b0:783:1f88:1717 with SMTP id c5-20020a05620a268500b007831f881717mr10069714qkp.13.1705316556917;
        Mon, 15 Jan 2024 03:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705316556; cv=none;
        d=google.com; s=arc-20160816;
        b=TTYasEiCcY2uCox4lFGEcIJDEj1ujsnL3tCqxZdkwj7rtjMStgiia2Z9r2uL9K1UZl
         rWHek9V+MMbb2+WBkw63+NYHHsuswJ0TTmQBO4Ddsq/tN6Z2ChFN7GX4PYqgRpJ6bhrd
         NFS4rozFRWKt4FlBAoQSZkU9OHNpQheCN4Xox9MZGhKIGZ5W3nmvvZThskulTxogGtAu
         OV1AEi6bmLQxiiDGa3Q53swXEfUqVDS5eXctWkTPvMiaCAwIKsYgyJjGNHEnxbXaTTgt
         yz/2UFE0g3GZiiOsQfRObKc/BLHCwyQ8OK9RLWtKx/jDJBxm94a9q/UL2HbavXqueUfg
         N+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dPexkEbzURvwVYCONouG/Kmx12DM35q2hLQURuQCNPw=;
        fh=Lz96kAh05Lyhn+r3BjRcKrsf0avdlDODlt5sqEZmKzo=;
        b=mGAoufR+ce9iRyTy4WJUa5jMP6TyTBz9HB41rBkuwK23nJk4shBiRDYrcWvMwtDQEV
         /+VRVcNyQ5oSz10456xIrCOCfZcX9N2jM0Lw1fWQO78DxnRQMPsEHhSldly9gK8RXFSb
         rswlGJE0XuqOaHMgCbJhs0h10B/oSp0Y7bcVE2Dydf7vuWANvBywTCUQObsgCosOJwma
         W9CoTXRBD4evMV0cIc3LLzm6uS9GysLT5j5fUijGNl6bjUfEMd3qU2VRTgj+/NfD7ftw
         R7qV4L2YFa3lYEDZmgZXgDPzJI6J5kzKD2/3R/XVPzM7o4Ra8tX76u/Sl714vYkJOSEz
         5YUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/DijTao";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05620a44c700b0078325ebdf42si8481667qkp.145.2024.01.15.03.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 03:02:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/DijTao";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPKja-0003ZM-Ti; Mon, 15 Jan 2024 06:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKjZ-0003Ym-1h
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:02:25 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKjX-0002d6-3a
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:02:24 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a2cea0563cbso367589566b.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705316541; x=1705921341; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dPexkEbzURvwVYCONouG/Kmx12DM35q2hLQURuQCNPw=;
 b=J/DijTaoBwlUxYvz4FzuaSsG0BdVw/gJepS9DMZbq9M9DOntO0+ukPGZKkQM1TW/DD
 PqN7Le0qzQCjtsQTWJ8K/KVO4wLv6bq2cP2Xc0Q45Aos4AypTszOA+Fb+vp6RfROJPy1
 8NLw0SE+CoKcKfqQcn7xtdWCgJt6gD0oxwzL7WvhsJxzV0fr8tgtpqMkIpos5emeY7RV
 pm4b5K2gVIGDUTqsUvnwvf77CQID5+EaotkJwVBADhw76csgHiWgZYNKCe5VBIIngGJb
 lUmw9BTiuJXGkn0zg2Y1g9dfUvrINkAMUq6DfOHYkNZ8pMHMh37KgKUKVrnTJhQZLPr3
 SxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316541; x=1705921341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dPexkEbzURvwVYCONouG/Kmx12DM35q2hLQURuQCNPw=;
 b=DNPSmLm2xgrXpRq7NqwlRlvsgb3qF+rsuCt6uf/LMQ4NYYLOiGSjz3eUlz4nfZ0b59
 t3JpA1/CTXrBnelIdiy95YRzQxjjqi2AQcHWIwdapBXNNId36DnlRSRH1TNh4uX6b6J7
 O5jqzAvNOVp5QRrZbHfYFh/GPqWpXAC8T6+bbwgpOMLYlj7iu5Y3H+10KFil86lUWlGh
 o7e73cxHWRNoENlsrh16gYMpDf7Qyi8tsEMLmqLgYJ2s70sGb6o/ISP6oBUzUm0isxGi
 2oBqQwSBe9txp4QYdyYbIl5EqBE7vDBRjtd4ieRWrwUbPJQt6AfU1WpIGTMWSqmd83fT
 SZtw==
X-Gm-Message-State: AOJu0YwO7JjOVaA/kEtX67RwNtc3Mc4Ls6mjc9aBS6Ol1oDv+5lzsKEy
 7fwPxjffS1WOBFUaXqp1q9GIaRWfFhJy7g==
X-Received: by 2002:a17:906:682:b0:a28:ec67:185f with SMTP id
 u2-20020a170906068200b00a28ec67185fmr2653122ejb.60.1705316541434; 
 Mon, 15 Jan 2024 03:02:21 -0800 (PST)
Received: from [192.168.1.102] ([176.187.209.30])
 by smtp.gmail.com with ESMTPSA id
 qc21-20020a170906d8b500b00a26ac5e3683sm5143656ejb.100.2024.01.15.03.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:02:20 -0800 (PST)
Message-ID: <56f692d8-41b1-4126-96b9-80d274624984@linaro.org>
Date: Mon, 15 Jan 2024 12:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/arm: Add EHCI/OHCI controllers to Allwinner R40
 and Bananapi board
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240113191651.1313226-1-linux@roeck-us.net>
 <20240113191651.1313226-2-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240113191651.1313226-2-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: R5kD+Q06NE9O

Hi,

On 13/1/24 20:16, Guenter Roeck wrote:
> Allwinner R40 supports two USB host ports shared between a USB 2.0 EHCI
> host controller and a USB 1.1 OHCI host controller. Add support for both
> of them.
> 
> If machine USB support is not enabled, create unimplemented devices
> for the USB memory ranges to avoid crashes when booting Linux.

I never really understood the reason for machine_usb() and had on my
TODO to do some archeology research to figure it out since quite some
time. Having to map an UnimpDevice due to CLI options seems like an
anti-pattern when the device is indeed implemented in the repository.

IIUC MachineState was introduced by a big rework during 2014-2015,
and ::usb became a property.

Reading git-history and mailing list threads, apparently it was not
easy for the mac99 machine (read whole thread):
https://lore.kernel.org/qemu-devel/1420550957-22337-2-git-send-email-marcel@redhat.com/
A bit later commit c6e765035b ("powerpc: fix -machine usb=no for
newworld and pseries machines") introduced the ::usb_disabled property
to deal with CLI -nodefaults with these 2 specific machines.

(-nodefaults is yet another CLI option I never really understood but
take it as legacy heritage with biggest maintenance headaches).


The R40 is a SoC photolithographied on silicon as a single piece
with a set of in-silicon peripherals, we can not remove peripherals
from this HW. We can not remove its USB controller.

What we can do is play at the external devices connected on buses
exposed by the SoC.

I can understand it is convenient for CLI users to start a machine
with a console and a keyboard, so if a machine provides a USB bus,
then it is created with a USB to UART converter and a USB keyboard.

So I'd interpret '-machine usb=off' as "if this machine has a USB
controller providing a USB bus which is not exposed outside of the
machine", but certainly not as "any mmio-mapped USB controller is
removed from chipsets".


To the extend I can understand floppy/cdrom/sdcard drives can be
inserted into available controllers used as buses, but I don't
really understand how to do that with serial/parallel.


> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   docs/system/arm/bananapi_m2u.rst |  2 +-
>   hw/arm/Kconfig                   |  2 +
>   hw/arm/allwinner-r40.c           | 70 +++++++++++++++++++++++++++++++-
>   include/hw/arm/allwinner-r40.h   |  9 ++++
>   4 files changed, 80 insertions(+), 3 deletions(-)


> @@ -407,6 +427,37 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
>       sysbus_realize(SYS_BUS_DEVICE(&s->ccu), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_R40_DEV_CCU]);
>   
> +    /* USB */
> +    if (machine_usb(current_machine)) {
> +        int i;
> +
> +        for (i = 0; i < AW_R40_NUM_USB; i++) {
> +            g_autofree char *bus = g_strdup_printf("usb-bus.%d", i);
> +
> +            object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
> +                                     true, &error_fatal);
> +            sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), &error_fatal);
> +            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                            allwinner_r40_memmap[i ? AW_R40_DEV_EHCI2
> +                                                   : AW_R40_DEV_EHCI1]);
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                               qdev_get_gpio_in(DEVICE(&s->gic),
> +                                                i ? AW_R40_GIC_SPI_EHCI2
> +                                                  : AW_R40_GIC_SPI_EHCI1));
> +
> +            object_property_set_str(OBJECT(&s->ohci[i]), "masterbus", bus,
> +                                    &error_fatal);
> +            sysbus_realize(SYS_BUS_DEVICE(&s->ohci[i]), &error_fatal);
> +            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
> +                            allwinner_r40_memmap[i ? AW_R40_DEV_OHCI2
> +                                                   : AW_R40_DEV_OHCI1]);
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
> +                               qdev_get_gpio_in(DEVICE(&s->gic),
> +                                                i ? AW_R40_GIC_SPI_OHCI2
> +                                                  : AW_R40_GIC_SPI_OHCI1));
> +        }
> +    }
> +
>       /* SD/MMC */
>       for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
>           qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->gic),
> @@ -498,6 +549,21 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
>                                       r40_unimplemented[i].base,
>                                       r40_unimplemented[i].size);
>       }
> +    if (!machine_usb(current_machine)) {
> +        /* unimplemented if USB is not enabled */
> +        create_unimplemented_device("usb-ehci1",
> +                                    allwinner_r40_memmap[AW_R40_DEV_EHCI1],
> +                                    0x800);
> +        create_unimplemented_device("usb-ehci2",
> +                                    allwinner_r40_memmap[AW_R40_DEV_EHCI2],
> +                                    0x800);
> +        create_unimplemented_device("usb-ohci1",
> +                                    allwinner_r40_memmap[AW_R40_DEV_OHCI1],
> +                                    0x800);
> +        create_unimplemented_device("usb-ohci2",
> +                                    allwinner_r40_memmap[AW_R40_DEV_OHCI2],
> +                                    0x800);
> +    }
>   }


