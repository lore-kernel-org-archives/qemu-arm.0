Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp650762njl;
        Wed, 2 Oct 2024 00:14:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvJWQZXokjhru+DMwRjIskGvbhU44A9TvLBI/i3P4Zw42hXxVGGn5TFQ6MU7GkCvk28j5JpUaZqXkMvw==@linaro.org
X-Google-Smtp-Source: AGHT+IHzMt+xI+wsVHpC6croso4mhaM8iQwG2yOLqF3S/T21p/gfTVBwq6DzJksv0a1paiCXvyoS
X-Received: by 2002:a05:622a:8b:b0:44f:f83d:469f with SMTP id d75a77b69052e-45d804b1d23mr28587891cf.14.1727853291589;
        Wed, 02 Oct 2024 00:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727853291; cv=none;
        d=google.com; s=arc-20240605;
        b=geN0k2v4dcv/2w0nHEuZ3CFoZF/eMbq737SrfTwJJdrozMjYsafAuno/IIGGpa3rar
         1R1/wBp8i/J2LL3DXuitCYpClICPfPItiynnFoTpTDmdL95dfvpa5ek4d07TXUUlxpoe
         5I8CcQXVKTjKJuqFPgU8LK6Vw1YxtVMUNkQrjz+9l4VsAOc544/3qmbsEnxfhIMRQnke
         7nsnfXisLhOdsiaPQG4N8VADvv3wYZu51EGMVHcRiTUNPYUR8wKidDXIGa8ZZtyv9N3Z
         5YiI37HjGQn/+Om7wAC/eXh+IVTYk0U6l12eEdQ3C4f5TiKsSAiG7to8AsDD7aBsSEtd
         Q1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cXjNOVggWhetQP7XT+54A42VGIbB4jWQTZFfhGomX2Y=;
        fh=6qR+G9sNe1JdY/ddu8iNPRVTAO2YDqAMy3HvBRJ3CAk=;
        b=GWx84WkdC9BbuiZkR7IrkreY10C609RtrAZtc+tFTa2HSDECoBzH8pJkcG02p0lLwl
         WnQhwilOyzkIiJHxp3CzZgUwNfGcTVWg3cWQ5fdAyaePcLqYB509O3g3wve2J+b4N78B
         tXKULwZvGFVC+Tb/7mzJKrW2grlu63wR3OeD1CPt8Darb/J9Zy3ipefKPOwHCYi84F+c
         lx3CLbfyCoSmchUCvifWRqokf45ZfnYm1Fv+xYJq8o9VFxuOP++HGuProvaO0GAVDQpX
         cgpakUYGhF04z+CLa4vM4OzGaxQ6eHkCpp58gVLTN01mkvPeF41DBtFIH2PqmyAksvvE
         nmOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CnjZMubz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f3a0a3bsi124401201cf.760.2024.10.02.00.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 00:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CnjZMubz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svtZL-0008T3-7L; Wed, 02 Oct 2024 03:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1svtZJ-0008SO-NC
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 03:14:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1svtZG-0005Gi-J9
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 03:14:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20b6c311f62so33518825ad.0
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1727853277; x=1728458077;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXjNOVggWhetQP7XT+54A42VGIbB4jWQTZFfhGomX2Y=;
 b=CnjZMubzXG9AXe0KtFW5F/g0ampQ5ja30EKP9e8jx2gOyFMTTkDTT4Z0c0N7xJqNCb
 MV/I/rqkCvDZNKK+4DgHwqh2zyOZd2olHX6l/PWpJd7ioVqRcRBFY/RXCqYYHyi8zv4n
 McBBBlAmmyj2R24WzTq50EtrAaXPDWJ3n8vtJcrTwz08cSD4httPAHo03GUIz356Huc2
 BXJ7b8I5TkFteuayq5Spg6k/dtuaWga/BEQrn13MPpddLPUvPkr4SBDqjPKff1orbFeK
 wssnp8k3d5sxauSiSajCfcPoMD3hZqiH8xWP3pzAoHHpt073bIUD70u5sdhJEi8WjeBO
 hQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727853277; x=1728458077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXjNOVggWhetQP7XT+54A42VGIbB4jWQTZFfhGomX2Y=;
 b=g3NHPOfjbV9iMAEhBAuD7Hg7A9G4zTlvMsMXjuXabBzFEJ8jqIhH4dFnAEB7EICyig
 o87obhrQWBBnbOVD679dePS1LULY54dwgYvBCWrSddOAf9+BNANnOJ1nhIWvzLw8rbNH
 9lhKNj31kutxiFr/4lyhIITQP3kVDNX1JEUiGe/LUDmpmqWsf/Voix9si+dzaJzq9qsJ
 RSlBDP34QmoY9Ly76GEM8mbEIsqPoqVNTtLGFn/XmW4MpY1eeeiSDf1MgwZORZbHakLO
 H7GVsXmQyv+lri8+QBRVg/Ygn1C81WriVgvi1pF/fFCHI9AH2R6Xpb5M3oE5bbq5PUjd
 Ennw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVStxw6BuDRYXDm+PIdREa20L3tfBUnz+vbVQLfmPMiL6G/eIYTneWOkEbUwsD43tP15qf52zzBvg==@nongnu.org
X-Gm-Message-State: AOJu0YxhpURweuQyvsqYgQ+slHnshre2lcxL9zDFlV+YWgPtC69sBpLj
 RxlqMNq1mntUM49Jqtj5ejX4cSjOESlgfm7VZVltyXrM+jmcrcsLZTnruotxSHU=
X-Received: by 2002:a17:902:db12:b0:20b:9841:b44a with SMTP id
 d9443c01a7336-20bc5a8b9admr22736025ad.61.1727853276932; 
 Wed, 02 Oct 2024 00:14:36 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e50e0esm80070765ad.253.2024.10.02.00.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 00:14:36 -0700 (PDT)
Message-ID: <7d345ac4-249d-4865-9dcc-f137ae861214@daynix.com>
Date: Wed, 2 Oct 2024 16:14:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] hw/display/apple-gfx: Adds PCI implementation
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
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-3-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-3-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
X-TUID: yg1l9Gqm8cv9

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> This change wires up the PCI variant of the paravirtualised
> graphics device, mainly useful for x86-64 macOS guests, implemented
> by macOS's ParavirtualizedGraphics.framework. It builds on code
> shared with the vmapple/mmio variant of the PVG device.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   hw/display/Kconfig         |   5 ++
>   hw/display/apple-gfx-pci.m | 138 +++++++++++++++++++++++++++++++++++++
>   hw/display/meson.build     |   1 +
>   3 files changed, 144 insertions(+)
>   create mode 100644 hw/display/apple-gfx-pci.m
> 
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 179a479d220..c2ec268f8e9 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -152,3 +152,8 @@ config MAC_PVG_VMAPPLE
>       bool
>       depends on MAC_PVG
>       depends on ARM
> +
> +config MAC_PVG_PCI
> +    bool
> +    depends on MAC_PVG && PCI
> +    default y if PCI_DEVICES
> diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
> new file mode 100644
> index 00000000000..9370258ee46
> --- /dev/null
> +++ b/hw/display/apple-gfx-pci.m
> @@ -0,0 +1,138 @@
> +/*
> + * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant
> + *
> + * Copyright © 2023-2024 Phil Dennis-Jordan
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.

Please use SPDX-License-Identifier instead.

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

Please add #include "qemu/osdep.h" at top and reorder according to 
"Include directives" section in: docs/devel/style.rst

> +
> +typedef struct AppleGFXPCIState {
> +    PCIDevice parent_obj;
> +
> +    AppleGFXState common;
> +} AppleGFXPCIState;
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
> +
> +static const char* apple_gfx_pci_option_rom_path = NULL;
> +
> +static void apple_gfx_init_option_rom_path(void)
> +{
> +    NSURL *option_rom_url = PGCopyOptionROMURL();
> +    const char *option_rom_path = option_rom_url.fileSystemRepresentation;
> +    if (option_rom_url.fileURL && option_rom_path != NULL) {

option_rom_path != NULL is unnecessary; NSURL.h has 
NS_HEADER_AUDIT_BEGIN(nullability, sendability), which means any 
non-annotated member is non-nullable.

> +        apple_gfx_pci_option_rom_path = g_strdup(option_rom_path);
> +    }
> +    [option_rom_url release];
> +}
> +
> +static void apple_gfx_pci_init(Object *obj)
> +{
> +    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
> +
> +    if (!apple_gfx_pci_option_rom_path) {
> +        /* Done on device not class init to avoid -daemonize ObjC fork crash */

It is unclear what "-daemonize ObjC fork crash" means. Please add more 
details.

> +        PCIDeviceClass *pci = PCI_DEVICE_CLASS(object_get_class(obj));
> +        apple_gfx_init_option_rom_path();
> +        pci->romfile = apple_gfx_pci_option_rom_path;
> +    }
> +
> +    apple_gfx_common_init(obj, &s->common, TYPE_APPLE_GFX_PCI);
> +}
> +
> +static void apple_gfx_pci_interrupt(PCIDevice *dev, AppleGFXPCIState *s,

s is unused.

> +                                    uint32_t vector)
> +{
> +    bool msi_ok;
> +    trace_apple_gfx_raise_irq(vector);
> +
> +    msi_ok = msi_enabled(dev);
> +    if (msi_ok) {
> +        msi_notify(dev, vector);
> +    }
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

You can just pass errp to msi_init().

> +        return;
> +    }
> +
> +    @autoreleasepool {
> +        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
> +        desc.raiseInterrupt = ^(uint32_t vector) {
> +            apple_gfx_pci_interrupt(dev, s, vector);
> +        };
> +
> +        apple_gfx_common_realize(&s->common, desc);
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
> index 70d855749c0..ceb7bb07612 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -67,6 +67,7 @@ system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_
>   
>   system_ss.add(when: 'CONFIG_MAC_PVG',         if_true: [files('apple-gfx.m'), pvg, metal])
>   system_ss.add(when: 'CONFIG_MAC_PVG_VMAPPLE', if_true: [files('apple-gfx-vmapple.m'), pvg, metal])
> +system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true: [files('apple-gfx-pci.m'), pvg, metal])
>   
>   if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>     virtio_gpu_ss = ss.source_set()

