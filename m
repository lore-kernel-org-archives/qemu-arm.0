Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp255448njf;
        Fri, 25 Oct 2024 21:45:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTsuTFYUpE1Gz+bUsWu3sE8xLrNoGbDxYQkGLihHiDSj3pzbiH0cJMoxMVzbr5L9Vm7l2xl1gkjBnIPA==@linaro.org
X-Google-Smtp-Source: AGHT+IGqgobTGcb9owQz9faHhG9qVigx3tvCPWQ/jbFWIWEDXddU6NYrYksnI8yUTYLsJgWKk82t
X-Received: by 2002:a5d:47c2:0:b0:369:9358:4634 with SMTP id ffacd0b85a97d-380611419admr1095208f8f.19.1729917939737;
        Fri, 25 Oct 2024 21:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729917939; cv=none;
        d=google.com; s=arc-20240605;
        b=MxCqjqXN5vVNITc+T1CJ+RPlpdbu8EAmisdWPwf8HuRVHzf8wQTDtkpIEQIv53Vb/q
         2ZoFcS9+4HuDI7HLjOG2hO7sJlqho4i6IRPn81axeMTgza3kfcL4gMsgNejRXF9bfa7b
         bTiBSLLHp4TYty3uX4vim5LU47z8KK3m6atnJohXQ3W3liFW0XVNJkB1qJnSL3A6xbjv
         UIxRgA5l72bE00eY7usgMHNIr7Iz3/X/mgkYaUVXQH2j+PWYQ+XzfnXVKueLPQxD1hj/
         KBSX5CAKPOYtA0p95Mt4l/lHq+5aG+ofmVIUX1Fx7zLHZ2h80Ukcdd9QAYBZ1vBP0+i7
         K5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=huB1Ga6lljYnceb9m3ruvpTX3eRmODYt6pvwYwnD+xI=;
        fh=Osuz3Q9WPh3PiKTfvf2k3DOX2b63+5hJEmghfsAeVns=;
        b=R1y8Jwb8m3Nh9+I7CSUIQbaC+STmMM2GUkGEs39gk7qdhjhCD0peqwRpWgnSqGMQwW
         PVRUaCiJF+JpgfQndHocv0Se2H4a5oglTKQzgN18k2M1KEbWs4VxVDcntIAGQs/oO/jw
         H+zxh1ilCEu7VBYE28//9CjhC9QmyfA1DOQ7aWhpKKXuPNWxnsy7x5zMD49EL6ZhWtuF
         GUM7wrvB5q6ICNtycJpz/l3BBwoMEQXttwM4y13l+TyWyrs1nsCrxQyqZ7gg+GC3Mdhp
         1KeOvd89LcZrtNplp9A5wP86JnwrYSeWtyfBZfK3nDoc/E2i8iH9ANQpo2kDvhafU9xu
         9y4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AsZfcsT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38058ba5b45si1650072f8f.715.2024.10.25.21.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 21:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=AsZfcsT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4Yg1-0003Iu-5c; Sat, 26 Oct 2024 00:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4Yg0-0003Ie-3N
 for qemu-arm@nongnu.org; Sat, 26 Oct 2024 00:45:24 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4Yfy-0001pj-6v
 for qemu-arm@nongnu.org; Sat, 26 Oct 2024 00:45:23 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2e2e2d09decso2607466a91.1
 for <qemu-arm@nongnu.org>; Fri, 25 Oct 2024 21:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1729917921; x=1730522721;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=huB1Ga6lljYnceb9m3ruvpTX3eRmODYt6pvwYwnD+xI=;
 b=AsZfcsT+g7DNz0Ntdj/pr/ZjJopK8EnobveZtdpLLlF6ayGjdD49Pza++IxbUuD5XA
 Ypyt04PgBSh5R/xNQgVLpsg5hcghOeASbVKDH2d9M5oRryLLRu+4E7Cd70eEJTItKqRx
 yXIjQfzYZ1lIBRG/dSva+UlU7FJT6RQ7tItCoy0YGzn+vszj6Vcurt811wroqYaOQR+A
 t5w9XvHIKKWinjRKRnduroCdHQGgtFoRr4f6nErlSScf/p/Ict1cRJaNuKEbAMo1VRRo
 vDahHfOi9I8q/qUOz33OwKq4ZyP156Dr8QUfQO9wFzU8wYw0NK+AAD3zVcV7gFTREp+/
 jV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729917921; x=1730522721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=huB1Ga6lljYnceb9m3ruvpTX3eRmODYt6pvwYwnD+xI=;
 b=Tude6VgBXZdZLinSxcVBCIEaIPcyhQrqG54qh43iBa058ktvmqRhV6KOmp2EZOC+mJ
 QnnXlgG8uKyAb5yjE5C/LntR4FwmykXnLfGEaSG7JBJh1nzKcpM8us08C0/H9qk2IOrq
 E0WTQIBFaajo6WvMOgmDuo9bfJUL1cGRU77m3FsK+wA9V1UgL5+UrkXEd7klCzjT1BnI
 lZReqTSLHwK1l+tADyu1ScKYDiKW4mYkLLBLByylMqCNcgjkWT12GHWBm85fJA1MQIyh
 Zi9GJNNpiIi96C+jW82gZ/l+UX277nlkgBgnQ+hnNm5BhAWk6MohaXv02oOVV7JsdQpR
 bTzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy9/Il75ogCitqRdmlLUm4QxsylMUCWbNV6DwqQVda81T/AVVtOUmgMZHqachJlcMO2bH3nrjGjw==@nongnu.org
X-Gm-Message-State: AOJu0YwiJss76n2k4TrogAQipMTeXPoPEhdixeoR4/agwMsGREpA3fT5
 dDZ9pw2ukzZATnSeVA7+eckPh7bndFM+1AiaqN19mmOOF91/ays+zFuaGQe1Wwc=
X-Received: by 2002:a17:90a:70c2:b0:2e2:c1d0:68dc with SMTP id
 98e67ed59e1d1-2e77e5e48a7mr12209562a91.9.1729917920679; 
 Fri, 25 Oct 2024 21:45:20 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e77e558114sm4423692a91.36.2024.10.25.21.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 21:45:20 -0700 (PDT)
Message-ID: <ad48abb9-2964-43ab-b739-7d60975f3859@daynix.com>
Date: Sat, 26 Oct 2024 13:45:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] hw/display/apple-gfx: Adds PCI implementation
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
References: <20241024102813.9855-1-phil@philjordan.eu>
 <20241024102813.9855-4-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241024102813.9855-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: O9SABva0CNhm

On 2024/10/24 19:28, Phil Dennis-Jordan wrote:
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
>   hw/display/Kconfig         |   4 +
>   hw/display/apple-gfx-pci.m | 152 +++++++++++++++++++++++++++++++++++++
>   hw/display/meson.build     |   1 +
>   3 files changed, 157 insertions(+)
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
> index 00000000000..4ee26dde422
> --- /dev/null
> +++ b/hw/display/apple-gfx-pci.m
> @@ -0,0 +1,152 @@
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
> +    Error *err = NULL;
> +    int ret;
> +
> +    pci_register_bar(dev, PG_PCI_BAR_MMIO,
> +                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->common.iomem_gfx);
> +
> +    ret = msi_init(dev, 0x0 /* config offset; 0 = find space */,
> +                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
> +                   false /*msi_per_vector_mask*/, &err);
> +    if (ret != 0) {
> +        error_propagate(errp, err);

Don't use error_propaget() but just pass errp to msi_init.

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
> +    assert(rc->phases.hold == NULL);

Remove this assertion; we don't have such for other PCI devices.

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

