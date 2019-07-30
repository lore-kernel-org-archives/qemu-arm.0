Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4740310wrv;
        Tue, 30 Jul 2019 12:36:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+e4biETOsgm4ZhIVpd0WvYKuv6dsHHl1Yb3mA3EwNrYYL8dynAYCr0g9iqig/Pmzmu153
X-Received: by 2002:ab0:3159:: with SMTP id e25mr24233848uam.81.1564515369788;
        Tue, 30 Jul 2019 12:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564515369; cv=none;
        d=google.com; s=arc-20160816;
        b=lKTiKyUbCEG1HuGa0KFChW0Ig9dF5TLZJHYRmBVp5g3A/hAvmy8kdhh3vcoihlQl4I
         xpiwbtsE6CoLr1Ncoskk/vZ3gsKol4CubbQx6Zjl7eLN5FjAwrLKaQWgyBUkQJ2c1Lru
         8IXfP95BvW0/HIL8Lfn0a5qnNXONzXV5kmCOdSsN01PUVOvEidILZwxzPSrl45bFeEIo
         ZTZHzRKgteCAznddiFdir0o8K8oB//S4qg6vjywGAoXUBNnRPzLjf2BgdBCQNdOv03A8
         H5TC9+JUO5WnbALUxU7didqvyWWb90Q1de6bnwzzjNeKE/+vYoi6A4ypsvOG3z0WdLNH
         JKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=KoB+W5mDl+LcNp17jNhxXbUNUrzulxs7NMBGX8YpGQc=;
        b=gTIuuPFKf8T+GO4gSm2fp0oNAFhfh+kbvdqDrTxTAWoQkx8Ax9GGl+7cZw7j8telT2
         AygtgKhLethf6Ey2nI1Px3FBfikIIXYRB6m+IuCazgFOhm8tBShB71PgJ/7w1yzCCgqE
         2MSW60sAEHSHMxO5gNTs1F56ugQpXitgTxYJ7ERBJey1A+L2R+7xuaxMUwJUw+Bj5oJR
         dmkhTkTUJ5SqsLrEKxFOU4hRcfzR7A0PohmKpTYdBZ5wymBTRaI/DAfuoHb40SYHQhtw
         w9OHovpGp0xVZxBjxZhIYUtC2PegGXpTZ+0nqrAOdWbHiFhMd7iOl3hQHIwOGBLEz526
         yCgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si16280948vkg.90.2019.07.30.12.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 12:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsXur-0002c5-A4
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 15:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsXuj-0002bp-Bp
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsXuh-000826-W4
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:36:01 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsXuh-00081P-RV
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 15:35:59 -0400
Received: by mail-vs1-f68.google.com with SMTP id u3so44390048vsh.6
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2019 12:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KoB+W5mDl+LcNp17jNhxXbUNUrzulxs7NMBGX8YpGQc=;
 b=qLdf/vfXAch2OXCTcnfIt3cHnlE2CKJoSXy+xlBDtNQq7jLiaxj8/LSscXA8EqtSf0
 YKnnMWE+bDsxQeTtc0lmuCdU6KVVerYGkSmsMdR7N/dRkbsRIv28u6U847lg30I8v8IF
 uBOvI4H4/7Co2t4zBcKJ4aXvKNI2RQO+ysilTL+6PjQa74T0m0uQp8A87UPZO1Oi/z2e
 rgT0ELMoFgeY/fkuAmiaMoITiuJIM8DFSUCWlrTJye+7xhpFDxbUP/YheNXd0Tpzbb5B
 CvuDFZ9/eqZDdkJIkr+9vOZHDPtYRFNStEQ5hgsx9SbfmTkZ/+oxqBy26scOmDyIPu+z
 retw==
X-Gm-Message-State: APjAAAWooQR/JEL4NB6cn5dSo6NPgi9x7+jOGcpMCdzQ7dIuFkm5yu/9
 g7OwzHXU6yj9ZckkaI7ysFF6eA==
X-Received: by 2002:a67:9946:: with SMTP id b67mr76996454vse.37.1564515358745; 
 Tue, 30 Jul 2019 12:35:58 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 y71sm15103383vsc.19.2019.07.30.12.35.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 12:35:57 -0700 (PDT)
Date: Tue, 30 Jul 2019 15:35:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190730153305-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-15-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-15-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.217.68
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 14/15] virtio-iommu-pci: Add
 virtio iommu pci support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, peter.maydell@linaro.org,
 tn@semihalf.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bZOsuITSo2x

On Tue, Jul 30, 2019 at 07:21:36PM +0200, Eric Auger wrote:
> This patch adds virtio-iommu-pci, which is the pci proxy for
> the virtio-iommu device.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

This part I'm not sure we should merge just yet.  The reason being I
think we should limit it to mmio where DT can be used to describe iommu
topology. For PCI I don't see why we shouldn't always expose this
in the config space, and I think it's preferable not to
need to support a mix of DT,ACPI and PCI as options.

> ---
> 
> v8 -> v9:
> - add the msi-bypass property
> - create virtio-iommu-pci.c
> ---
>  hw/virtio/Makefile.objs          |  1 +
>  hw/virtio/virtio-iommu-pci.c     | 88 ++++++++++++++++++++++++++++++++
>  include/hw/pci/pci.h             |  1 +
>  include/hw/virtio/virtio-iommu.h |  1 +
>  qdev-monitor.c                   |  1 +
>  5 files changed, 92 insertions(+)
>  create mode 100644 hw/virtio/virtio-iommu-pci.c
> 
> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> index f42e4dd94f..80ca719f1c 100644
> --- a/hw/virtio/Makefile.objs
> +++ b/hw/virtio/Makefile.objs
> @@ -27,6 +27,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) += virtio-input-host-pci.o
>  obj-$(CONFIG_VIRTIO_INPUT) += virtio-input-pci.o
>  obj-$(CONFIG_VIRTIO_RNG) += virtio-rng-pci.o
>  obj-$(CONFIG_VIRTIO_BALLOON) += virtio-balloon-pci.o
> +obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu-pci.o
>  obj-$(CONFIG_VIRTIO_9P) += virtio-9p-pci.o
>  obj-$(CONFIG_VIRTIO_SCSI) += virtio-scsi-pci.o
>  obj-$(CONFIG_VIRTIO_BLK) += virtio-blk-pci.o
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> new file mode 100644
> index 0000000000..f9977096bd
> --- /dev/null
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -0,0 +1,88 @@
> +/*
> + * Virtio IOMMU PCI Bindings
> + *
> + * Copyright (c) 2019 Red Hat, Inc.
> + * Written by Eric Auger
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "virtio-pci.h"
> +#include "hw/virtio/virtio-iommu.h"
> +
> +typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> +
> +/*
> + * virtio-iommu-pci: This extends VirtioPCIProxy.
> + *
> + */
> +#define VIRTIO_IOMMU_PCI(obj) \
> +        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
> +
> +struct VirtIOIOMMUPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VirtIOIOMMU vdev;
> +};
> +
> +static Property virtio_iommu_pci_properties[] = {
> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_BOOL("msi-bypass", VirtIOIOMMUPCI, vdev.msi_bypass, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +
> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> +    object_property_set_link(OBJECT(dev),
> +                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> +                             "primary-bus", errp);
> +    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
> +}
> +
> +static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> +    k->realize = virtio_iommu_pci_realize;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->props = virtio_iommu_pci_properties;
> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> +    pcidev_k->class_id = PCI_CLASS_OTHERS;
> +}
> +
> +static void virtio_iommu_pci_instance_init(Object *obj)
> +{
> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VIRTIO_IOMMU);
> +}
> +
> +static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> +    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
> +    .generic_name          = "virtio-iommu-pci",
> +    .transitional_name     = "virtio-iommu-pci-transitional",
> +    .non_transitional_name = "virtio-iommu-pci-non-transitional",
> +    .instance_size = sizeof(VirtIOIOMMUPCI),
> +    .instance_init = virtio_iommu_pci_instance_init,
> +    .class_init    = virtio_iommu_pci_class_init,
> +};
> +
> +static void virtio_iommu_pci_register(void)
> +{
> +    virtio_pci_types_register(&virtio_iommu_pci_info);
> +}
> +
> +type_init(virtio_iommu_pci_register)
> +
> +
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index aaf1b9f70d..492ea7e68d 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -86,6 +86,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
>  #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> +#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
>  
>  #define PCI_VENDOR_ID_REDHAT             0x1b36
>  #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 56c8b4e57f..893ac65c0b 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -25,6 +25,7 @@
>  #include "hw/pci/pci.h"
>  
>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
>  #define VIRTIO_IOMMU(obj) \
>          OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
>  
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index 58222c2211..74cf090c61 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -63,6 +63,7 @@ static const QDevAlias qdev_alias_table[] = {
>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
>      { "virtio-input-host-pci", "virtio-input-host",
>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> +    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
>      { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
>      { "virtio-keyboard-pci", "virtio-keyboard",
>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> -- 
> 2.20.1
