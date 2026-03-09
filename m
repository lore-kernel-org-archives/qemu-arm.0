Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA6DEF3719
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 08:34:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzW3h-0003jK-Dc; Mon, 09 Mar 2026 04:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzW3Y-0003iC-3I
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 04:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vzW3V-0006b4-A3
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 04:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773045216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbdNvya7kbawkID3Vz8L2UqnKad7zVntjmyb7WsZeQY=;
 b=HBhyWI5oty92F447fdq+wBT7cbVluTXGoz2QflXP4EyyU9dXghpilk/+hg1nOCQclJSUF5
 oQ6egs/XPA7iZKxmpNHpQC+V+zJt3t0/IIUbd5Mb9Ed6QXBIX5kngXLqlvWlBf/Lp6zbZH
 dPGYCJi2UL4eN5iRLBxYRrgygWnn9DY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-RuHSKmrsNeKm9e5rIrV1EQ-1; Mon, 09 Mar 2026 04:33:33 -0400
X-MC-Unique: RuHSKmrsNeKm9e5rIrV1EQ-1
X-Mimecast-MFC-AGG-ID: RuHSKmrsNeKm9e5rIrV1EQ_1773045212
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-439b8bc43aeso5809604f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 01:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773045212; x=1773650012;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbdNvya7kbawkID3Vz8L2UqnKad7zVntjmyb7WsZeQY=;
 b=J/N/ev/6g3x0ElEE2DfPjRpq4B+sWniGWPSZ68klFfaUeWZnlwICmwqJQKblhO9IM1
 habYGP5mZsMWE8AKaRmj19g8LjvbY1j9u3GLGrOe/CExR4/AsGUIfCr80Xtf3hBr4L7P
 AQPU9NtUwid6DJOHTYfQsiZyxbZzJxMyvb0dGqJM7kZM8svTUAnVhp04WeYLNATF+x4V
 5bMPbI9JXUYN5V147XIcRDKSFBf9ZDQnA+2O+hcm5LbBNrMFbWCK9nv9ctQyd6yQccQ3
 aV9liO8DHEuHqn2Bmd5uOc+DJJDbR8NCICPJt85RcjHlKI1Y2RLxgCzIO6BxTdzw4yZM
 wiXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPyphv2T12YkA3tl0LBASfPsIZJil1fGNEzYacf7PVaCe5lam9nFTmg0jcvYujKuRaZY65tcEyFg==@nongnu.org
X-Gm-Message-State: AOJu0YwgdkjXjn29XDnfLAjjWS/gr+wFwT1uCkhXipUTGjlCKmZkd/xS
 4hMS0z1K4KkhcmRVoss4L2wydpBXsJDn24WcrmFWlwE3jWYBCBhyt/79VO4X1m/Yr5hxWZV0AHq
 w6ltfFouFWbFJnMzeBRTdiXdoueNBaVLC3UWZnTdnnXtx067vjSS18w==
X-Gm-Gg: ATEYQzwR2NnRhqdO7ASBJ8x1zILkouydwV+wnib9MJPT06DZou6LBHd2QMZDaf2QQL6
 dmr4XjuNRtqFCbg6VxgBcnpLHOy6oWXTpqP/BAvzMPXXFapLJuFWGW1iJaVeu/7rhjxd7IAmgqq
 OKOlNwxHS8nANCNnIhSX6Cj1RJ60QCV5DW5d6fqLphJhlrEUlGJker5gfbItFOwRov1sEUEeIJt
 p8UuznUyL9NuLoaV7voPeMj9xXMvfkmkur0vYb8OketxMtXg1/jINTM0gSgQ0/+U8MSB/uFp/fN
 ND0cAIo+AQ8E59z/Fl3BrNhZ+8fhSm9p+nCtY71hpE+qou9qa+Qsj4pqArHfZzFqgrIF9Zr/FzF
 bF4t6TkGv/VN4qP/8yYZEkXFBQCHeyArNp9C5NRd+A5e+2d3EojIfV7WOw2ro/w6qc5WAiHFoIj
 4JHRo3ir+bqYOx9PQwJR5MeZt00UA=
X-Received: by 2002:a05:6000:2681:b0:439:8d76:853e with SMTP id
 ffacd0b85a97d-439da8955b1mr16607707f8f.45.1773045211954; 
 Mon, 09 Mar 2026 01:33:31 -0700 (PDT)
X-Received: by 2002:a05:6000:2681:b0:439:8d76:853e with SMTP id
 ffacd0b85a97d-439da8955b1mr16607669f8f.45.1773045211415; 
 Mon, 09 Mar 2026 01:33:31 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm27028160f8f.32.2026.03.09.01.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 01:33:30 -0700 (PDT)
Message-ID: <cf26c35f-a508-45bd-9398-5b4e7140d743@redhat.com>
Date: Mon, 9 Mar 2026 09:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] hw/char/serial: Inherit from SysBusDevice
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, Helge Deller <deller@gmx.de>
References: <20260305220911.131508-1-shentey@gmail.com>
 <20260305220911.131508-14-shentey@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20260305220911.131508-14-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lIRgwSjV3MNvdfzdrgCVLi4LTcnC5vPYaakS5H6L5IA_1773045212
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/5/26 23:09, Bernhard Beschow wrote:
> SerialState currently inherits just from DeviceState and serial devices
> use SerialState as an "IP block". Since DeviceState doesn't have an API
> to provide MMIO regions or IRQs, all serial devices access attributes
> internal to SerialState directly. Fix this by having SerialState inherit
> from SysBusDevice.
> 
> In addition, DeviceState doesn't participate in the reset framework
> while SysBusDevice does. This allows for implementing reset
> functionality more idiomatically.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

The lack of support for automatically resetting children other than 
buses is a pity indeed, but I don't think that this patch is correct.

SysBusDevice is for devices connected directly to the board; a device 
should not have any children objects connected to a bus (unless the bus 
is part of the device itself, as is the case for usb-storage for example).

Unfortunately I don't have a better solution, other than adding 
accessors to SerialState that retrieve the MMIO or connect the IRQ.

Paolo

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/char/serial.h   |  4 ++--
>   hw/char/diva-gsp.c         | 18 +++++++++---------
>   hw/char/serial-isa.c       | 16 ++++++++++------
>   hw/char/serial-mm.c        |  8 ++++----
>   hw/char/serial-pci-multi.c | 18 +++++++++---------
>   hw/char/serial-pci.c       | 10 +++++-----
>   hw/char/serial.c           |  5 ++++-
>   7 files changed, 43 insertions(+), 36 deletions(-)
> 
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 0cf641a860..2ee9e5984c 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -26,7 +26,7 @@
>   #ifndef HW_SERIAL_H
>   #define HW_SERIAL_H
>   
> -#include "hw/core/qdev.h"
> +#include "hw/core/sysbus.h"
>   #include "chardev/char-fe.h"
>   #include "system/memory.h"
>   #include "qemu/fifo8.h"
> @@ -35,7 +35,7 @@
>   #define UART_FIFO_LENGTH    16      /* 16550A Fifo Length */
>   
>   struct SerialState {
> -    DeviceState parent;
> +    SysBusDevice parent;
>   
>       uint16_t divider;
>       uint8_t rbr; /* receive register */
> diff --git a/hw/char/diva-gsp.c b/hw/char/diva-gsp.c
> index b0a2437c85..8e467f047d 100644
> --- a/hw/char/diva-gsp.c
> +++ b/hw/char/diva-gsp.c
> @@ -56,13 +56,13 @@ typedef struct PCIDivaSerialState {
>   static void diva_pci_exit(PCIDevice *dev)
>   {
>       PCIDivaSerialState *pci = DO_UPCAST(PCIDivaSerialState, dev, dev);
> -    SerialState *s;
>       int i;
>   
>       for (i = 0; i < pci->ports; i++) {
> -        s = pci->state + i;
> -        memory_region_del_subregion(&pci->membar, &s->io);
> -        qdev_unrealize(DEVICE(s));
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(pci->state + i);
> +        memory_region_del_subregion(&pci->membar,
> +                                    sysbus_mmio_get_region(sbd, 0));
> +        qdev_unrealize(DEVICE(sbd));
>       }
>       qemu_free_irqs(pci->irqs, pci->ports);
>   }
> @@ -116,7 +116,6 @@ static void diva_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
>       PCIDivaSerialState *pci = DO_UPCAST(PCIDivaSerialState, dev, dev);
> -    SerialState *s;
>       struct diva_info di = diva_get_diva_info(pc);
>       size_t i, offset = 0;
>       size_t portmask = di.omask;
> @@ -128,19 +127,20 @@ static void diva_pci_realize(PCIDevice *dev, Error **errp)
>       pci->irqs = qemu_allocate_irqs(multi_serial_irq_mux, pci, di.nports);
>   
>       for (i = 0; i < di.nports; i++) {
> -        s = pci->state + i;
> -        if (!qdev_realize(DEVICE(s), NULL, errp)) {
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(pci->state + i);
> +        if (!sysbus_realize(sbd, errp)) {
>               diva_pci_exit(dev);
>               return;
>           }
> -        s->irq = pci->irqs[i];
> +        sysbus_connect_irq(sbd, 0, pci->irqs[i]);
>   
>           /* calculate offset of given port based on bitmask */
>           while ((portmask & BIT(0)) == 0) {
>               offset += 8;
>               portmask >>= 1;
>           }
> -        memory_region_add_subregion(&pci->membar, offset, &s->io);
> +        memory_region_add_subregion(&pci->membar, offset,
> +                                    sysbus_mmio_get_region(sbd, 0));
>           offset += 8;
>           portmask >>= 1;
>           pci->ports++;
> diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
> index 3a48b2495e..5eb2dc6350 100644
> --- a/hw/char/serial-isa.c
> +++ b/hw/char/serial-isa.c
> @@ -58,7 +58,7 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
>       static int index;
>       ISADevice *isadev = ISA_DEVICE(dev);
>       ISASerialState *isa = ISA_SERIAL(dev);
> -    SerialState *s = &isa->state;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&isa->state);
>   
>       if (isa->index == -1) {
>           isa->index = index;
> @@ -76,11 +76,11 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
>       }
>       index++;
>   
> -    s->irq = isa_get_irq(isadev, isa->isairq);
> -    qdev_realize(DEVICE(s), NULL, errp);
> +    sysbus_realize(sbd, errp);
> +    sysbus_connect_irq(sbd, 0, isa_get_irq(isadev, isa->isairq));
>       qdev_set_legacy_instance_id(dev, isa->iobase, 3);
>   
> -    isa_register_ioport(isadev, &s->io, isa->iobase);
> +    isa_register_ioport(isadev, sysbus_mmio_get_region(sbd, 0), isa->iobase);
>   }
>   
>   static void serial_isa_build_aml(AcpiDevAmlIf *adev, Aml *scope)
> @@ -187,13 +187,17 @@ void serial_hds_isa_init(ISABus *bus, int from, int to)
>   void isa_serial_set_iobase(ISADevice *serial, hwaddr iobase)
>   {
>       ISASerialState *s = ISA_SERIAL(serial);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->state);
>   
>       serial->ioport_id = iobase;
>       s->iobase = iobase;
> -    memory_region_set_address(&s->state.io, s->iobase);
> +    memory_region_set_address(sysbus_mmio_get_region(sbd, 0), s->iobase);
>   }
>   
>   void isa_serial_set_enabled(ISADevice *serial, bool enabled)
>   {
> -    memory_region_set_enabled(&ISA_SERIAL(serial)->state.io, enabled);
> +    ISASerialState *s = ISA_SERIAL(serial);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->state);
> +
> +    memory_region_set_enabled(sysbus_mmio_get_region(sbd, 0), enabled);
>   }
> diff --git a/hw/char/serial-mm.c b/hw/char/serial-mm.c
> index 1dba4fc694..ba4061aa69 100644
> --- a/hw/char/serial-mm.c
> +++ b/hw/char/serial-mm.c
> @@ -33,14 +33,14 @@
>   static void serial_mm_realize(DeviceState *dev, Error **errp)
>   {
>       SerialMM *smm = SERIAL_MM(dev);
> -    SerialState *s = &smm->serial;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&smm->serial);
>   
> -    if (!qdev_realize(DEVICE(s), NULL, errp)) {
> +    if (!sysbus_realize(sbd, errp)) {
>           return;
>       }
>   
> -    sysbus_init_mmio(SYS_BUS_DEVICE(smm), &s->io);
> -    sysbus_init_irq(SYS_BUS_DEVICE(smm), &smm->serial.irq);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(smm), sysbus_mmio_get_region(sbd, 0));
> +    sysbus_pass_irq(SYS_BUS_DEVICE(smm), SYS_BUS_DEVICE(sbd));
>   }
>   
>   static const VMStateDescription vmstate_serial_mm = {
> diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
> index eda0d43bcf..f5ea7f4188 100644
> --- a/hw/char/serial-pci-multi.c
> +++ b/hw/char/serial-pci-multi.c
> @@ -50,13 +50,13 @@ typedef struct PCIMultiSerialState {
>   static void multi_serial_pci_exit(PCIDevice *dev)
>   {
>       PCIMultiSerialState *pci = DO_UPCAST(PCIMultiSerialState, dev, dev);
> -    SerialState *s;
>       int i;
>   
>       for (i = 0; i < pci->ports; i++) {
> -        s = pci->state + i;
> -        memory_region_del_subregion(&pci->iobar, &s->io);
> -        qdev_unrealize(DEVICE(s));
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(pci->state + i);
> +        memory_region_del_subregion(&pci->iobar,
> +                                    sysbus_mmio_get_region(sbd, 0));
> +        qdev_unrealize(DEVICE(sbd));
>       }
>   }
>   
> @@ -91,7 +91,6 @@ static void multi_serial_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
>       PCIMultiSerialState *pci = DO_UPCAST(PCIMultiSerialState, dev, dev);
> -    SerialState *s;
>       size_t i, nports = multi_serial_get_port_count(pc);
>   
>       pci->dev.config[PCI_CLASS_PROG] = 2; /* 16550 compatible */
> @@ -100,13 +99,14 @@ static void multi_serial_pci_realize(PCIDevice *dev, Error **errp)
>       pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &pci->iobar);
>   
>       for (i = 0; i < nports; i++) {
> -        s = pci->state + i;
> -        if (!qdev_realize(DEVICE(s), NULL, errp)) {
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(pci->state + i);
> +        if (!sysbus_realize(sbd, errp)) {
>               multi_serial_pci_exit(dev);
>               return;
>           }
> -        s->irq = &pci->irqs[i];
> -        memory_region_add_subregion(&pci->iobar, 8 * i, &s->io);
> +        sysbus_connect_irq(sbd, 0, &pci->irqs[i]);
> +        memory_region_add_subregion(&pci->iobar, 8 * i,
> +                                    sysbus_mmio_get_region(sbd, 0));
>           pci->ports++;
>       }
>   }
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 9a0bf2d890..b702de8219 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -46,17 +46,18 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
>   static void serial_pci_realize(PCIDevice *dev, Error **errp)
>   {
>       PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
> -    SerialState *s = &pci->state;
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(&pci->state);
>   
> -    if (!qdev_realize(DEVICE(s), NULL, errp)) {
> +    if (!sysbus_realize(sbd, errp)) {
>           return;
>       }
>   
>       pci->dev.config[PCI_CLASS_PROG] = 2; /* 16550 compatible */
>       pci->dev.config[PCI_INTERRUPT_PIN] = 1;
> -    s->irq = pci_allocate_irq(&pci->dev);
> +    sysbus_connect_irq(sbd, 0, pci_allocate_irq(&pci->dev));
>   
> -    pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
> +    pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO,
> +                     sysbus_mmio_get_region(sbd, 0));
>   }
>   
>   static void serial_pci_exit(PCIDevice *dev)
> @@ -65,7 +66,6 @@ static void serial_pci_exit(PCIDevice *dev)
>       SerialState *s = &pci->state;
>   
>       qdev_unrealize(DEVICE(s));
> -    qemu_free_irq(s->irq);
>   }
>   
>   static const VMStateDescription vmstate_pci_serial = {
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 49227830e1..fc92897376 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -991,6 +991,9 @@ static void serial_realize(DeviceState *dev, Error **errp)
>                                serial_event, serial_be_change, s, NULL, true);
>       fifo8_create(&s->recv_fifo, UART_FIFO_LENGTH);
>       fifo8_create(&s->xmit_fifo, UART_FIFO_LENGTH);
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io);
> +    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->irq);
>   }
>   
>   static void serial_unrealize(DeviceState *dev)
> @@ -1034,7 +1037,7 @@ static void serial_class_init(ObjectClass *klass, const void *data)
>   
>   static const TypeInfo serial_info = {
>       .name = TYPE_SERIAL,
> -    .parent = TYPE_DEVICE,
> +    .parent = TYPE_SYS_BUS_DEVICE,
>       .instance_size = sizeof(SerialState),
>       .class_init = serial_class_init,
>   };


