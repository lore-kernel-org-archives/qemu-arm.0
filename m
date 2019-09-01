Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2695045wrs;
        Sat, 31 Aug 2019 23:40:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyN4BKef9lC0u2w0QT0GeK3EfPHxGy/ecfTCflWUktCzOsgZg9GmAYu4WmCH1vpSlQfD4pX
X-Received: by 2002:ad4:5288:: with SMTP id v8mr14707656qvr.159.1567320051809;
        Sat, 31 Aug 2019 23:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567320051; cv=none;
        d=google.com; s=arc-20160816;
        b=BcRIr7Ko5oaiIKEvvRIIh7lu5E6MPJDe1MkBCJPqa8GcDmEy6SSJ+LASOsLhXjJqbn
         VVjqekqLb9K8JYEOOivvBajnCejGoZ1iD9MiQqEKfYNEErLEL0Fwqqpnb+LOnP5kMexQ
         IAa0SkPVROm9I/4KUuFUvUBmYmV+r71vtr0KJ1sjpv8essrLotbmr4BHU7g3MNhfnKdh
         TDdLQ/xSJiA0M5XhIBGCindaAE5OAeR4xiwDhUBtXOVoFojudkd4FFgofPtxq2foV3hA
         8fyjGKkkPhBt13b55bnIGj0xLy8pPUeQMikY6yal4DvYiRRhi7SYEC+pMkAc4r6pPcOv
         8ZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5zdFrJ9FIuBPrgpCkkwRbQyOzWx1L1bpP58regqQ2Ds=;
        b=soSAKCVhnPOIfs+xPiRpZoXCdJRdwf8spS9RezpAPEFdNLkHaiDdWXa1TKJ2DRyM0p
         FH+YX/Ub/AiBjdAm/Qkt6Lh8N5XEwX/OICt67L4X7NMd10cHKGEStDgSVxnNhbSnnU8B
         v+4lyqd3ifH+q6F771q4AOTXD0oy7md9ooqOpB3sIyVKL+aQcqpcdy4wu8X/Kz5+Ssb1
         yo7kdefmx/A0EvDfgOrXnWyNpsJKh72/VRH6hcbjqsGsZZ7BmAiHpN0d28DWfAC5Oy3V
         6JudA1D140Gfpj+POxspze03Hb0nXGJbBnh2SbwmjqII4ohJS6XKqOuXDX+z390tldHP
         IaVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 50si8297177qvn.29.2019.08.31.23.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2019 23:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4JXf-0003QI-99
	for alex.bennee@linaro.org; Sun, 01 Sep 2019 02:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1i4JXS-0003Pg-MJ
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1i4JXP-0002SC-Vl
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:40:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33839)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1i4JXP-0002Qw-Mj
 for qemu-arm@nongnu.org; Sun, 01 Sep 2019 02:40:35 -0400
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1495369CA
 for <qemu-arm@nongnu.org>; Sun,  1 Sep 2019 06:40:34 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id q62so12315627qkd.3
 for <qemu-arm@nongnu.org>; Sat, 31 Aug 2019 23:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5zdFrJ9FIuBPrgpCkkwRbQyOzWx1L1bpP58regqQ2Ds=;
 b=kW9sVRHS8HNFFogbChzPUJ2qYWckOW9m7gnwd8qonhXT413au3iZPsSPn8xcPVKH22
 qLTBm+xpT+ohzfxFfWqZhNGhuwcH6R0kae/U9Ypx6X/Z53BUeetPH+XHkvGHL04XoLjM
 JNCtMkPKUlAUOvvOVOAFFe7aEC2uYjSTdCf5oJXDZmOvmX4AKH+wTyR0itawy4oJ+LbJ
 q3h83qeW7K6LqPGexpxXaQfwgB3vknC1iE64ePDVSAac2UiEzz4A53ACwQQTycH59gX6
 MXWBJCN1Ojad6R0h7Wd0lLnn3mNBy9mkcNDUTxPQuo6+E0XY99Vc5LYxu+aaYJdgfFwH
 9MJw==
X-Gm-Message-State: APjAAAW6YnFCL8oLszZX+Y53SocWl1Z8IHZojcXMnbTOlAruGKOz52QC
 aq5PQ65skXtmBew9tw7EVReyhov8di2cp0DFYuKT0OKaNrteWP4lyGdWA3w2eyZ6OWDEOGxEBPM
 1vG6UZtMDw7+P
X-Received: by 2002:ac8:748a:: with SMTP id v10mr23265049qtq.386.1567320033892; 
 Sat, 31 Aug 2019 23:40:33 -0700 (PDT)
X-Received: by 2002:ac8:748a:: with SMTP id v10mr23265036qtq.386.1567320033653; 
 Sat, 31 Aug 2019 23:40:33 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
 by smtp.gmail.com with ESMTPSA id f22sm4702043qkk.45.2019.08.31.23.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2019 23:40:32 -0700 (PDT)
Date: Sun, 1 Sep 2019 02:40:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190901023827-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-15-eric.auger@redhat.com>
 <20190730153305-mutt-send-email-mst@kernel.org>
 <a0e88a60-083b-2730-5db8-7bba0299974b@redhat.com>
 <20190801090027-mutt-send-email-mst@kernel.org>
 <ff726b89-a1b1-9b9e-a767-ef72da520053@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff726b89-a1b1-9b9e-a767-ef72da520053@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.2 v10 14/15]
 virtio-iommu-pci: Add virtio iommu pci support
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
X-TUID: ThNkX8YSFqgt

On Thu, Aug 01, 2019 at 03:49:37PM +0200, Auger Eric wrote:
> Hi Michael,
> 
> On 8/1/19 3:06 PM, Michael S. Tsirkin wrote:
> > On Thu, Aug 01, 2019 at 02:15:03PM +0200, Auger Eric wrote:
> >> Hi Michael,
> >>
> >> On 7/30/19 9:35 PM, Michael S. Tsirkin wrote:
> >>> On Tue, Jul 30, 2019 at 07:21:36PM +0200, Eric Auger wrote:
> >>>> This patch adds virtio-iommu-pci, which is the pci proxy for
> >>>> the virtio-iommu device.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>
> >>> This part I'm not sure we should merge just yet.  The reason being I
> >>> think we should limit it to mmio where DT can be used to describe iommu
> >>> topology. For PCI I don't see why we shouldn't always expose this
> >>> in the config space, and I think it's preferable not to
> >>> need to support a mix of DT,ACPI and PCI as options.
> >>
> >> For context, some discussion related to this topic already arose on v7
> >> revision of the driver:
> >>
> >> [1] Re: [PATCH v7 0/7] Add virtio-iommu driver
> >> https://lore.kernel.org/linux-pci/87a7ioby9u.fsf@morokweng.localdomain/
> >>
> >> Some additional thoughts.
> >>
> >> First considering DT boot.
> >>
> >> THE DT description features an iommu-map property in the
> >> pci-host-ecam-generic node that describes which RIDs are handled by the
> >> virtio-iommu and a possible offset/mask to be applied inbetween the RID
> >> and the streamID at the input of the IOMMU
> >> (Documentation/devicetree/bindings/pci/pci-iommu.txt)
> >>
> >> As far as I understand when a DMA capable device is setup, its DMA
> >> configuration is built using that call chain:
> >>
> >> pci_dma_configure
> >> |_ of_dma_configure
> >>    |_ of_iommu_configure
> >>       |_ of_pci_iommu_init
> >>          |_ of_map_rid
> >>
> >> I understand you would like the iommu-map/iommu-map-mask info to be
> >> exposed directly into the config space of the device instead of inside
> >> the DT or IORT table. Assuming a module is initialized sufficiently
> >> early to retrieve this info, we would need the resulting info to be
> >> consolidated to allow pci_dma_configure chain to work seemlessly. This
> >> sounds a significant impact on above kernel infrastructure.
> > 
> > I don't really know what consolidated means.
> > It is pretty common for IOMMUs to expose config through
> > PCI registers. This typically happens as a fixup.
> I meant: instead of retrieving the info through the of_* code you need
> to interoperate with the module to retrieve the same info and detect
> when you need to take that path instead of the of one.

The way to do it would be with a quirk,
and the quirk would not be part of the
virtio module - it can poke at the device using
virtio_pci_cfg_cap.

> > 
> > I would write a tiny driver to do exactly that,
> > and run it from the fixup.
> > 
> > 
> >> This comes in addition to the development of the "small module that
> >> loads early and pokes at the IOMMU sufficiently to get the data about
> >> which devices use the IOMMU out of it using standard virtio config
> >> space" evoked in [1] + the definition of the data formats to be put in
> >> the very cfg space.
> > 
> > That last part is true but that's exactly why I propose we
> > wait on this patch a bit.
> > 
> >> With ACPI I understand we have the same kind of infrastructure:
> >> drivers/acpi/arm64/iort.c currently extracts the mapping between RC RIDs
> >> and IOMMU streamids
> >>
> >> pci_dma_configure(
> >> |_ acpi_dma_configure
> >>    |_ iort_iommu_configure
> >>       |_ iort_pci_iommu_init
> >>          |_ iort_node_map_id
> >>             |_ iort_id_map
> >>
> >> Maybe I fail to see the easy and right way to do the integration at
> >> kernel level but I am a bit frightened by the efforts that would be
> >> requested to follow your suggestion, whereas the DT infra is ready and
> >> fully upstreamed to accept the use case.
> > 
> > Did you take a look at drivers/pci/quirks.c and how these run?
> > I think it's just a question of adding DECLARE_PCI_FIXUP_CLASS_EARLY
> > and running your hook from there.
> I will do and trace the code.
> > 
> > 
> >> For ACPI I agree AFAIK IORT was primarily defined by ARM, for ARM but we
> >> prototyped IORT integration with x86 and it worked for pc machine
> >> without major trouble.
> >>
> >> I sent the kernel and qemu patches prototyping this IORT integration:
> >>
> >> https://github.com/eauger/linux/tree/virtio-iommu-v0.9-iort-x86
> >> https://github.com/eauger/qemu/tree/v3.1.0-rc3-virtio-iommu-v0.9-x86
> >>
> >> There ACPI IORT was built for PC machine and the integration effort at
> >> both kernel and QEMU level was low. This work would need to be rebased
> >> and depends on kernel ACPI related patches that are not yet upstreamed
> >> though.
> >>
> >> Thanks
> >>
> >> Eric
> > 
> > In the end it might turn out you are right.  But it does us no harm to
> > delay this just a bit, and for now limit things to ARM where it's
> > already used and where alternatives exist.
> So if my understanding is correct, at the moment you would accept a DT
> integration using MMIO. Is that correct? Meanwhile we can prototype your
> suggestion.
> 
> Thanks
> 
> Eric

Right.

> > 
> > 
> >>>
> >>>> ---
> >>>>
> >>>> v8 -> v9:
> >>>> - add the msi-bypass property
> >>>> - create virtio-iommu-pci.c
> >>>> ---
> >>>>  hw/virtio/Makefile.objs          |  1 +
> >>>>  hw/virtio/virtio-iommu-pci.c     | 88 ++++++++++++++++++++++++++++++++
> >>>>  include/hw/pci/pci.h             |  1 +
> >>>>  include/hw/virtio/virtio-iommu.h |  1 +
> >>>>  qdev-monitor.c                   |  1 +
> >>>>  5 files changed, 92 insertions(+)
> >>>>  create mode 100644 hw/virtio/virtio-iommu-pci.c
> >>>>
> >>>> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> >>>> index f42e4dd94f..80ca719f1c 100644
> >>>> --- a/hw/virtio/Makefile.objs
> >>>> +++ b/hw/virtio/Makefile.objs
> >>>> @@ -27,6 +27,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) += virtio-input-host-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_INPUT) += virtio-input-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_RNG) += virtio-rng-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_BALLOON) += virtio-balloon-pci.o
> >>>> +obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_9P) += virtio-9p-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_SCSI) += virtio-scsi-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_BLK) += virtio-blk-pci.o
> >>>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> >>>> new file mode 100644
> >>>> index 0000000000..f9977096bd
> >>>> --- /dev/null
> >>>> +++ b/hw/virtio/virtio-iommu-pci.c
> >>>> @@ -0,0 +1,88 @@
> >>>> +/*
> >>>> + * Virtio IOMMU PCI Bindings
> >>>> + *
> >>>> + * Copyright (c) 2019 Red Hat, Inc.
> >>>> + * Written by Eric Auger
> >>>> + *
> >>>> + *  This program is free software; you can redistribute it and/or modify
> >>>> + *  it under the terms of the GNU General Public License version 2 or
> >>>> + *  (at your option) any later version.
> >>>> + */
> >>>> +
> >>>> +#include "qemu/osdep.h"
> >>>> +
> >>>> +#include "virtio-pci.h"
> >>>> +#include "hw/virtio/virtio-iommu.h"
> >>>> +
> >>>> +typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> >>>> +
> >>>> +/*
> >>>> + * virtio-iommu-pci: This extends VirtioPCIProxy.
> >>>> + *
> >>>> + */
> >>>> +#define VIRTIO_IOMMU_PCI(obj) \
> >>>> +        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
> >>>> +
> >>>> +struct VirtIOIOMMUPCI {
> >>>> +    VirtIOPCIProxy parent_obj;
> >>>> +    VirtIOIOMMU vdev;
> >>>> +};
> >>>> +
> >>>> +static Property virtio_iommu_pci_properties[] = {
> >>>> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> >>>> +    DEFINE_PROP_BOOL("msi-bypass", VirtIOIOMMUPCI, vdev.msi_bypass, true),
> >>>> +    DEFINE_PROP_END_OF_LIST(),
> >>>> +};
> >>>> +
> >>>> +static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >>>> +{
> >>>> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
> >>>> +    DeviceState *vdev = DEVICE(&dev->vdev);
> >>>> +
> >>>> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> >>>> +    object_property_set_link(OBJECT(dev),
> >>>> +                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> >>>> +                             "primary-bus", errp);
> >>>> +    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
> >>>> +}
> >>>> +
> >>>> +static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
> >>>> +{
> >>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >>>> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> >>>> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> >>>> +    k->realize = virtio_iommu_pci_realize;
> >>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >>>> +    dc->props = virtio_iommu_pci_properties;
> >>>> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> >>>> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
> >>>> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> >>>> +    pcidev_k->class_id = PCI_CLASS_OTHERS;
> >>>> +}
> >>>> +
> >>>> +static void virtio_iommu_pci_instance_init(Object *obj)
> >>>> +{
> >>>> +    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
> >>>> +
> >>>> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >>>> +                                TYPE_VIRTIO_IOMMU);
> >>>> +}
> >>>> +
> >>>> +static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
> >>>> +    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
> >>>> +    .generic_name          = "virtio-iommu-pci",
> >>>> +    .transitional_name     = "virtio-iommu-pci-transitional",
> >>>> +    .non_transitional_name = "virtio-iommu-pci-non-transitional",
> >>>> +    .instance_size = sizeof(VirtIOIOMMUPCI),
> >>>> +    .instance_init = virtio_iommu_pci_instance_init,
> >>>> +    .class_init    = virtio_iommu_pci_class_init,
> >>>> +};
> >>>> +
> >>>> +static void virtio_iommu_pci_register(void)
> >>>> +{
> >>>> +    virtio_pci_types_register(&virtio_iommu_pci_info);
> >>>> +}
> >>>> +
> >>>> +type_init(virtio_iommu_pci_register)
> >>>> +
> >>>> +
> >>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>>> index aaf1b9f70d..492ea7e68d 100644
> >>>> --- a/include/hw/pci/pci.h
> >>>> +++ b/include/hw/pci/pci.h
> >>>> @@ -86,6 +86,7 @@ extern bool pci_available;
> >>>>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
> >>>>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> >>>>  #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> >>>> +#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> >>>>  
> >>>>  #define PCI_VENDOR_ID_REDHAT             0x1b36
> >>>>  #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> >>>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> >>>> index 56c8b4e57f..893ac65c0b 100644
> >>>> --- a/include/hw/virtio/virtio-iommu.h
> >>>> +++ b/include/hw/virtio/virtio-iommu.h
> >>>> @@ -25,6 +25,7 @@
> >>>>  #include "hw/pci/pci.h"
> >>>>  
> >>>>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> >>>> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
> >>>>  #define VIRTIO_IOMMU(obj) \
> >>>>          OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
> >>>>  
> >>>> diff --git a/qdev-monitor.c b/qdev-monitor.c
> >>>> index 58222c2211..74cf090c61 100644
> >>>> --- a/qdev-monitor.c
> >>>> +++ b/qdev-monitor.c
> >>>> @@ -63,6 +63,7 @@ static const QDevAlias qdev_alias_table[] = {
> >>>>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
> >>>>      { "virtio-input-host-pci", "virtio-input-host",
> >>>>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>>> +    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>>>      { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
> >>>>      { "virtio-keyboard-pci", "virtio-keyboard",
> >>>>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>>> -- 
> >>>> 2.20.1
> >>>
> > 
