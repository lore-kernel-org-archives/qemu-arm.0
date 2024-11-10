Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5909992njc;
        Sat, 9 Nov 2024 22:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnFWpl34CwNZ0t9W8Ge/yiv8qR7LnSBIhxtmN6quxHX/TwMeMDDcjpWb2iVe0CnzA09PovpIVfeLqTZw==@linaro.org
X-Google-Smtp-Source: AGHT+IEjwSj4f3zzLa/tHAzRTO6Qkniy4t5qTsM9xAkkRh62Hr1WLvwn/wUPOcuYq2PGq3uPO08u
X-Received: by 2002:a05:620a:4416:b0:7b1:3e41:8495 with SMTP id af79cd13be357-7b331eff70bmr1170055985a.48.1731221611379;
        Sat, 09 Nov 2024 22:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731221611; cv=none;
        d=google.com; s=arc-20240605;
        b=D/lsfBm13Vwrc0Q7B8njLA9WGh3Ndgm4ZlH5sE2n/v1z0UZYWeq5VQeoMS5puC3OK4
         4vo9huowJi0omjr9lD19zqWwwoq5ByqnNdjjyQ7trkOtC+AORq1YBybJwhKswEBhuO6h
         s8jEnDVlsVQ8H166b9eaO54UgpxNvqYWLvdSDGngbCe+lUnkCXkWjSIXhhPHaMpp1Ibi
         P2ocGa0J0YmcZRq1vzCU7Pw86qH1ymT8XO8/QH+Wq6AjreGGScycvME8Cb8cS6MBQCyJ
         HDoeu33oPCaDbMwTWGFrubgxCTND393JvQQ9E1aTRSwbK8H12zo9uX0fyIwZgYQOId/J
         RiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oLdydJGsMMyuN9iZ/4SqzcEOlt77Kx/ZB6Fk6Jo1sx4=;
        fh=h7XhBPma/yAXxnuTSpL4nDOExR+Wt/NLiIe3ybaiJgg=;
        b=lZyKRo1MjSK7+lJO7U2fl/hfUdvGa9/5WWnhZyOw5xcWwgdVDXOXo5M6tItZrhPg4l
         RSGBdBJHb1HYjzoGO6CyZy+bI2ZVJ8AbvVhXmbUd66L9VuqOGDbFEV2GWvEJ/1QP5fwA
         3dFBBIwT/clqFVZHxYNGgolzTDh8MWhZdGDK6Og+VeZUqbBtkLF9kaUv0r1Tr0hTbu93
         6edPv43FyddQ7LUeqc0Hru8pYeosDVZPPXAtkVTdKwEfUACsRYynxiNBSdwga854TxCx
         wwGj8ljHfHV8E8rwr77ehv4Xkuw+f8XpzuA1v3Ie1c357jRde2SUe1ftbf6tZnpDAxzz
         5Q1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=io9D7Cnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39621037esi84634466d6.104.2024.11.09.22.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Nov 2024 22:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=io9D7Cnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tA1p6-0000LS-Po; Sun, 10 Nov 2024 01:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tA1p5-0000L9-7n
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 01:53:23 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tA1p1-0004BL-TV
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 01:53:22 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20caea61132so31009545ad.2
 for <qemu-arm@nongnu.org>; Sat, 09 Nov 2024 22:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1731221598; x=1731826398;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oLdydJGsMMyuN9iZ/4SqzcEOlt77Kx/ZB6Fk6Jo1sx4=;
 b=io9D7Cnw8063PhEoHj18rqSCebrJndAu9qCt9S4koNla/LJW2hym3jmZ2knIo6lS+8
 et+fi3HjSZGmikHTUvX8e2XN0MtKmGYBQCKZnX+gmRp0dN+rX1DjjU0HLX7VjAmxuzwS
 nTK2xVkrKV6FspfLTeNTn4ItcPgzXA/j/7yTLex05fgwaGzqGv5+vBPnpHuIgnePEmZZ
 01BynigkQiBj8ArD1oSDEO85xd4LI6j4ZYXshkDbLW/0VEog9SeHOxWVr2jzrDUvwbt2
 9fQtePQqius4xInXhOC4gjWiWP5P8L967EUtJHD6/kPK4WWAoJFf3DZ4AyrWp0UBI0RU
 xiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731221598; x=1731826398;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oLdydJGsMMyuN9iZ/4SqzcEOlt77Kx/ZB6Fk6Jo1sx4=;
 b=fLWAyr0TPsumqCqWnEl9bypplKn34cNq61AhtchlIC9E1p7tRAC3RVsBKfLbpRMv24
 zYK4nfatMoq3OqWtG77hcyyLloZFTv1CA97BUI6kdKIZgLF6ELUBqrxw50aSXNFq1vvf
 5SDEZ4RjT7Y3iQEHA59g1fjlAGqPw4wf9c8AradK4tFiS0VwgZn1G4E4lVSNPSKTmftM
 HDvgJ8nUQvuUiHHOJnu2trVbTVFOcy5ZgODxYwlns1B8UiPDmiKKG1qnPmaJirpdm4yo
 sT48864NUjrlJwI2ClD4TvJzzVsiW56izG0PZmbZSkZ8QpButUmhM3hMRaEr5djro4cF
 j36g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVXxQkwAO4jMEDk9L+ZNeoAsi2/k88rAjqpQrwuvJeoCyR9joYDyGr4Etgjy4BWssQ96KumlG3/g==@nongnu.org
X-Gm-Message-State: AOJu0Yyrf/4yeon5/kSr9mEXpDQyAgeB3IZ5aYaa8TE/DGXjeDIH50IK
 RJUJWnGRvWLJeEHtQqFflS127TDqcv5YA3MlSktXt9VSifBylMkZs/arg8Ickhc=
X-Received: by 2002:a17:902:cec7:b0:20b:b40b:3454 with SMTP id
 d9443c01a7336-21183327a44mr117626975ad.0.1731221598458; 
 Sat, 09 Nov 2024 22:53:18 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e580easm55134335ad.180.2024.11.09.22.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2024 22:53:18 -0800 (PST)
Message-ID: <39b526be-7ef8-493c-9e1e-50f5f46396d4@daynix.com>
Date: Sun, 10 Nov 2024 15:53:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/15] hw/display/apple-gfx: Adds PCI implementation
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20241108144709.95498-1-phil@philjordan.eu>
 <20241108144709.95498-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241108144709.95498-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vRVkOhNka+xc

On 2024/11/08 23:46, Phil Dennis-Jordan wrote:
> This change wires up the PCI variant of the paravirtualised
> graphics device, mainly useful for x86-64 macOS guests, implemented
> by macOS's ParavirtualizedGraphics.framework. It builds on code
> shared with the vmapple/mmio variant of the PVG device.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
> 
> v4:
> 
>   * Threading improvements analogous to those in common apple-gfx code
>     and mmio device variant.
>   * Smaller code review issues addressed.
> 
> v5:
> 
>   * Minor error handling improvement.
> 
> v6:
> 
>   * Removed an unused function parameter.
> 
>   hw/display/Kconfig         |   4 +
>   hw/display/apple-gfx-pci.m | 148 +++++++++++++++++++++++++++++++++++++
>   hw/display/meson.build     |   1 +
>   3 files changed, 153 insertions(+)
>   create mode 100644 hw/display/apple-gfx-pci.m
> 
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 6a9b7b19ada..2b53dfd7d26 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -149,3 +149,7 @@ config MAC_PVG_MMIO
>       bool
>       depends on MAC_PVG && AARCH64
>   
> +config MAC_PVG_PCI
> +    bool
> +    depends on MAC_PVG && PCI
> +    default y if PCI_DEVICES
> diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
> new file mode 100644
> index 00000000000..8bd7c0df443
> --- /dev/null
> +++ b/hw/display/apple-gfx-pci.m
> @@ -0,0 +1,148 @@
> +/*
> + * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant
> + *
> + * Copyright © 2023-2024 Phil Dennis-Jordan
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * ParavirtualizedGraphics.framework is a set of libraries that macOS provides
> + * which implements 3d graphics passthrough to the host as well as a
> + * proprietary guest communication channel to drive it. This device model
> + * implements support to drive that library from within QEMU as a PCI device
> + * aimed primarily at x86-64 macOS VMs.
> + */
> +
> +#include "apple-gfx.h"
> +#include "hw/pci/pci_device.h"
> +#include "hw/pci/msi.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
> +
> +struct AppleGFXPCIState {
> +    PCIDevice parent_obj;
> +
> +    AppleGFXState common;
> +};
> +
> +static const char* apple_gfx_pci_option_rom_path = NULL;
> +
> +static void apple_gfx_init_option_rom_path(void)
> +{
> +    NSURL *option_rom_url = PGCopyOptionROMURL();
> +    const char *option_rom_path = option_rom_url.fileSystemRepresentation;
> +    apple_gfx_pci_option_rom_path = g_strdup(option_rom_path);
> +    [option_rom_url release];
> +}
> +
> +static void apple_gfx_pci_init(Object *obj)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
> +
> +    if (!apple_gfx_pci_option_rom_path) {
> +        /* The following is done on device not class init to avoid running
> +         * ObjC code before fork() in -daemonize mode. */
> +        PCIDeviceClass *pci = PCI_DEVICE_CLASS(object_get_class(obj));
> +        apple_gfx_init_option_rom_path();
> +        pci->romfile = apple_gfx_pci_option_rom_path;
> +    }
> +
> +    apple_gfx_common_init(obj, &s->common, TYPE_APPLE_GFX_PCI);
> +}
> +
> +typedef struct AppleGFXPCIInterruptJob {
> +    PCIDevice *device;
> +    uint32_t vector;
> +} AppleGFXPCIInterruptJob;
> +
> +static void apple_gfx_pci_raise_interrupt(void *opaque)
> +{
> +    AppleGFXPCIInterruptJob *job = opaque;
> +
> +    if (msi_enabled(job->device)) {
> +        msi_notify(job->device, job->vector);
> +    }
> +    g_free(job);
> +}
> +
> +static void apple_gfx_pci_interrupt(PCIDevice *dev, uint32_t vector)
> +{
> +    AppleGFXPCIInterruptJob *job;
> +
> +    trace_apple_gfx_raise_irq(vector);
> +    job = g_malloc0(sizeof(*job));
> +    job->device = dev;
> +    job->vector = vector;
> +    aio_bh_schedule_oneshot(qemu_get_aio_context(),
> +                            apple_gfx_pci_raise_interrupt, job);
> +}
> +
> +static void apple_gfx_pci_realize(PCIDevice *dev, Error **errp)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(dev);
> +    int ret;
> +
> +    pci_register_bar(dev, PG_PCI_BAR_MMIO,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->common.iomem_gfx);
> +
> +    ret = msi_init(dev, 0x0 /* config offset; 0 = find space */,
> +                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
> +                   false /*msi_per_vector_mask*/, errp);

Let's add whitespaces around msi_per_vector_mask for consistency:
/* msi_per_vector_mask */

> +    if (ret != 0) {
> +        return;
> +    }
> +
> +    @autoreleasepool {
> +        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
> +        desc.raiseInterrupt = ^(uint32_t vector) {
> +            apple_gfx_pci_interrupt(dev, vector);
> +        };
> +
> +        apple_gfx_common_realize(&s->common, desc, errp);
> +        [desc release];
> +        desc = nil;
> +    }
> +}
> +
> +static void apple_gfx_pci_reset(Object *obj, ResetType type)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
> +    [s->common.pgdev reset];
> +}
> +
> +static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pci = PCI_DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    rc->phases.hold = apple_gfx_pci_reset;
> +    dc->desc = "macOS Paravirtualized Graphics PCI Display Controller";
> +    dc->hotpluggable = false;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +
> +    pci->vendor_id = PG_PCI_VENDOR_ID;
> +    pci->device_id = PG_PCI_DEVICE_ID;
> +    pci->class_id = PCI_CLASS_DISPLAY_OTHER;
> +    pci->realize = apple_gfx_pci_realize;
> +
> +    // TODO: Property for setting mode list
> +}
> +
> +static TypeInfo apple_gfx_pci_types[] = {
> +    {
> +        .name          = TYPE_APPLE_GFX_PCI,
> +        .parent        = TYPE_PCI_DEVICE,
> +        .instance_size = sizeof(AppleGFXPCIState),
> +        .class_init    = apple_gfx_pci_class_init,
> +        .instance_init = apple_gfx_pci_init,
> +        .interfaces = (InterfaceInfo[]) {
> +            { INTERFACE_PCIE_DEVICE },
> +            { },
> +        },
> +    }
> +};
> +DEFINE_TYPES(apple_gfx_pci_types)
> +
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 619e642905a..78e1c41ea0a 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -65,6 +65,7 @@ system_ss.add(when: 'CONFIG_MAC_PVG',         if_true: [files('apple-gfx.m'), pv
>   if cpu == 'aarch64'
>     system_ss.add(when: 'CONFIG_MAC_PVG_MMIO',  if_true: [files('apple-gfx-mmio.m'), pvg, metal])
>   endif
> +system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true: [files('apple-gfx-pci.m'), pvg, metal])
>   
>   if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>     virtio_gpu_ss = ss.source_set()

