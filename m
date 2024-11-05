Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2671741njc;
        Tue, 5 Nov 2024 00:25:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMcIVGZbp31MH85LeLGsGCA73djnkz4fyDuAdUCFaFDdfmkZ79Jmy9jrFoozIyhh2/LvWcZCX/51QNsA==@linaro.org
X-Google-Smtp-Source: AGHT+IHmAQmweqBNXLmsQ054FuLHHE+D7x128BjtckVPhExRijDgzWqRkZ0BoU8WM8DzzQ6QLOow
X-Received: by 2002:a05:622a:15cd:b0:460:e9d3:e989 with SMTP id d75a77b69052e-462b86462a4mr225532131cf.8.1730795143391;
        Tue, 05 Nov 2024 00:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730795143; cv=none;
        d=google.com; s=arc-20240605;
        b=NQmWnrUreLu1dnk6zj5oTbzyfAJ5k7g3vx3kbthPlCLq4SJ3jSnKawMoQbPHpZMZL5
         FpiAMjuHO1W97Pvec/p1O0oPs31dwFwfzjAJPOHxmiA3/E/2oUHWwLOJKVNjV4QVUtci
         cbm/jJ7ajwe4zdlQzHPFNFVDq9cNU6j9z3RJJx5T5ZJLZ4OykHq8k1t6VrBAgAKDtH/o
         ZxmPMDaf+WBd5IB/T8ppW8lEWxB3yIlM/dM+Jzgu+zqJX4Mgt9eu1/IjiXsOxQb33DMH
         DY2KKE08zMz+KxT0nL1WvP30y52kgLvePgMDfryITmqveHk6e4fJsBmVs2u7cNr9GoMq
         QK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rNh009aKx4OQggTSCRDPYcuSvWplYhkBYwV9qbWJEvc=;
        fh=ynDoPIFLqzzJz+oyCL1KCymlyBieItTopWRYZ73SP8A=;
        b=DzkT18h+8LSUBJoKiy8lUMDuwcrKdgc7soLvtSruCBV6Z43F854vTiSV48TPGZfA5O
         Z2mgHVzEaJQxvYnGQdQJJwz8E3nWE1X9ICLzqOL/fZ5wGAhZ77lFx61wMISv19O3pbd/
         uw/rlvBfBweAkcXtrKKowMRw5YSt6f1BxwQhBgn/uFcyb8b22FIiEOqSKVyucKx3QGQU
         np/q4qlZFZfMeHX521dzsa5Cane8aGIwwatcHWzFaWpEnlx1/N0mfVb13ZrH1ISDgr0P
         cso19SPEHz3fVmCnWGt31rDCe3rGJrPMMFEcEODn2LkfR4vQeOf/yfmDJzMnk/TNKEjQ
         92pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wK97VusH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0d2dfdsi139222921cf.217.2024.11.05.00.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 00:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wK97VusH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Esa-0001JN-Jd; Tue, 05 Nov 2024 03:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8EsZ-0001Io-4k
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:25:35 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8EsV-0005qO-Lj
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:25:34 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7206304f93aso4887591b3a.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730795130; x=1731399930;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rNh009aKx4OQggTSCRDPYcuSvWplYhkBYwV9qbWJEvc=;
 b=wK97VusHRpAerF64WCCyB38kcv5VHxUdZjR6IclBOuJGyyCdLUFdPfYStQGfXBj1XP
 m9sfQThEHCgGtp/WUYAMJGY/fgLTeMQ84M0IzBHes7Onn25+4zPkwrMQUeyYLtHk0bpC
 bpB6jYfP/gbdIxg+lgPomHmLclIuGvSLqtzZ41xjbD5d3JNtz822tdMOQjM76q9bAsRB
 ugaVTLXK7SfXB/ufFp6pUMLe+M/3ahOy+4otnjWz/288Jwbzj8fU9L6LLcjEO2I6uCr0
 jywjpWy8G8tz+Wf+NquClPbnOKou4/BIFXsCOM+nbozoHbbcp5Gf5Jk1pdvGxjtokCit
 d5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730795130; x=1731399930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNh009aKx4OQggTSCRDPYcuSvWplYhkBYwV9qbWJEvc=;
 b=UHOSMnWcuZJfxoiPhUyJVtVqNelk98qwQVwxkOToF+Szr6mkOaUrVDHtX//r1KrrxC
 DCkWeg93wPQwXmvef+Dqu8ykRi6ovm4gMBuT2vm2DwbBTfvph/FXU968aZpz/iSHGKEh
 Tm1jqDrKL6yTn384/HNl+wwMid8JXOy3ZWV0uVJPEEw2uvGrzf+QyqyDkBJhcvrKOk7H
 fealFavCSsYKB5Rmh67KAdywRkqxUcwRUBQCg1XwNtN5qMGziWU4t0pOoIsF5KHhFBdc
 yvfYOYr7t4nu3Ce+rENob4UJ1+mhrzIFAmHKfNF11obeALLXDw3ijstjNg1bIsK6kPnF
 JVfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULjqnT4xHXhlrxrqhDanyTxi+a9tlGXv+JWJyaPaCZA5F0Bh6LuupDL6K224vZDwrFIfQoP/yazw==@nongnu.org
X-Gm-Message-State: AOJu0YwlUNCS23LjkfM+oSplFDnE9XRhwIyrOKveRqRo31a+URKGlBio
 dA5R5IFMcT4QH1kQ6QfMCo3pbc/N6aJGRS+E71fKIJ4lTQv9XuTwwHn4wPnRUF8=
X-Received: by 2002:a05:6a21:38f:b0:1d9:2994:ca2b with SMTP id
 adf61e73a8af0-1dba53001d9mr20597295637.19.1730795130205; 
 Tue, 05 Nov 2024 00:25:30 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e93daacb29sm9145520a91.14.2024.11.05.00.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 00:25:29 -0800 (PST)
Message-ID: <8f35e1c9-4633-4ef5-83e1-fead4368255f@daynix.com>
Date: Tue, 5 Nov 2024 17:25:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] hw/display/apple-gfx: Adds PCI implementation
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org
References: <20241103150037.48194-1-phil@philjordan.eu>
 <20241103150037.48194-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241103150037.48194-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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
X-TUID: GnJyvqfMG50U

On 2024/11/04 0:00, Phil Dennis-Jordan wrote:
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
>   hw/display/Kconfig         |   4 +
>   hw/display/apple-gfx-pci.m | 149 +++++++++++++++++++++++++++++++++++++
>   hw/display/meson.build     |   1 +
>   3 files changed, 154 insertions(+)
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
> index 00000000000..870d0c41e66
> --- /dev/null
> +++ b/hw/display/apple-gfx-pci.m
> @@ -0,0 +1,149 @@
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
> +static void apple_gfx_pci_interrupt(PCIDevice *dev, AppleGFXPCIState *s,

s is not used.

> +                                    uint32_t vector)
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
> +    if (ret != 0) {
> +        return;
> +    }
> +
> +    @autoreleasepool {
> +        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
> +        desc.raiseInterrupt = ^(uint32_t vector) {
> +            apple_gfx_pci_interrupt(dev, s, vector);
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

