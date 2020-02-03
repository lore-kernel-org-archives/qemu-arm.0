Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3971323lfp;
        Mon, 3 Feb 2020 05:47:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPlaNcfTmj8ZY/8HHw7ZS+uq0Atkd1T+Szt7jKWp1+pzvrDo9ddr/0YjsnLts9R/l4VjjQ
X-Received: by 2002:ac8:7501:: with SMTP id u1mr23819838qtq.149.1580737633981;
        Mon, 03 Feb 2020 05:47:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580737633; cv=none;
        d=google.com; s=arc-20160816;
        b=VlNxMTZKkpGqDPcz3f2O/ZzR42sSlFclCWRGq1WLd3//EAqvMEp9K74mSAlwnmrR7T
         q8GDI0JNOQ5XICHxaMqgZbPpkhsvp5Jq/dNYXAwnH8cs6OPGdhTq0XbqydKY602IUzmk
         qkryqakVRUes2PsNhv9ES0jO8z6DkCGf5W0Cj8zcQrM7VhS5hLyO0k33/PlZ3gvzaL1U
         ucIBWOTzHKcnu5khHmUZ5sBeMnM00D+rSnoz9MZnySalWYPC+BuXHHOOzrjrSk0FYuvl
         WxEftfDUE6NTmxJ7NsQNVa8DwqaeH3ZSZ8jXfwjAn1kdIMjpVfGh/o8To2h91v4Dretp
         jgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=z+NqdDMvr6ibk08mTZ/OLpIXPh9vAD+oGLkGG2+p9eQ=;
        b=R/ftZgW2x6cmCOWRu/sZ3Xq0qNxoyeqrMYpKBgnCcw2YsZC4QCyUPX+mjVzLoCi/At
         RGquKmDuwWDI6JzPgSAz9hh6g5OD6QS/kCCIZQgUmiBCwWEuSdTOpWLxM7Tm+rX+xsDe
         DKLtPDae+eZUG+4zbpOVT20CEIrJpC0e3eBJEWbo2nDfnvg1BTcJ+AzxfJxTnprnJKJ6
         /he52J9sittaG3rpc3yEB9tgRxWS7hMmmp4F4KWE8R3imFOu8/Zxlo+uP3vcYUcQRRgN
         jy3NRP0NJNa0cmS2EEslEJlrws9A/TJYbO0nQMEpU3CTD5rLAO3R9H/Qsmrc0ghSmdzj
         vS6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BuS+yNkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si11768529qtg.329.2020.02.03.05.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:47:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BuS+yNkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyc4H-0000nK-A1
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyc47-0000mg-Ds
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyc45-00011h-HB
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:47:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45139
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyc45-0000zc-Bf
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580737621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+NqdDMvr6ibk08mTZ/OLpIXPh9vAD+oGLkGG2+p9eQ=;
 b=BuS+yNkc4JNdmuoZ6C1NzWfjLuEjyaHAgR0iObHi5rWckYnAVrcsivoVrsMQlXyoLb3ngS
 A3/mEFllQn/A/wAnhKuELSg/3Y4Il5rXemeQhiyrRyJEjH7zmo5XVTEyXlrw/pAjS4Occm
 yNVbsdz8scwBtbsGdreP9Y4w8y3VYzM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-_AeEAoFRNVu-7bRc6cVz0Q-1; Mon, 03 Feb 2020 08:46:58 -0500
Received: by mail-qt1-f200.google.com with SMTP id e37so9911017qtk.7
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 05:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=autq2jCamxuS1Bu9hLKFxQZqaz4BeF/L0ATO2KLLmpk=;
 b=l21Jq2374vo/54PaXbvuM/bqOsc/YCepkV5+CHH3gvPMqBB+9dXyT3a2KAErBc5yAy
 i/mNvTgCDn9WZ8R8uVamTu0PbxyuyC4cpxrzb++8y/p453DQ7wFkRBE7IDSLIWJgJri5
 NOEWY7fnzal6yNpKe+XIPMSDmvpvSwHHuCSEMPvxxqu3ITzp/uAgeNDN6xgh+nyOtVi4
 DcBH+dPI5Yf47XicJgO3FVbYb4glQR2qUOHkXSaUfAvhXigoQuhnyKdERG8dGOf9le36
 ULUx/VBkBuWimAolUbmKYe2Iob45UCYGyu+J9RV4Chs/7fAxFTsXwmPortoWXr7QKvA2
 csmA==
X-Gm-Message-State: APjAAAWQ65eqx7c6LcuwUa0qTBurB7nzJ+6zzJEslb5+Ju0MZsq+O9C7
 RrFcOx4H/aPy05+VV2PDXfHMiVg52qHhE4cfHUX1wSeAIZU1HHjTE+AkCglKTeRRMchOX8FMkzl
 Y8701oVtecwVG
X-Received: by 2002:a05:620a:2104:: with SMTP id
 l4mr21942831qkl.240.1580737618022; 
 Mon, 03 Feb 2020 05:46:58 -0800 (PST)
X-Received: by 2002:a05:620a:2104:: with SMTP id
 l4mr21942814qkl.240.1580737617696; 
 Mon, 03 Feb 2020 05:46:57 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id q5sm9178141qkf.14.2020.02.03.05.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:46:56 -0800 (PST)
Date: Mon, 3 Feb 2020 08:46:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v13 07/10] virtio-iommu-pci: Add virtio iommu pci support
Message-ID: <20200203084532-mutt-send-email-mst@kernel.org>
References: <20200125171955.12825-1-eric.auger@redhat.com>
 <20200125171955.12825-8-eric.auger@redhat.com>
 <20200203080122-mutt-send-email-mst@kernel.org>
 <037666c2-6124-0db6-3688-a134f9f0845a@redhat.com>
 <20200203082637-mutt-send-email-mst@kernel.org>
 <462756c1-b4fd-e0f0-7fca-61b9b1fd8157@redhat.com>
MIME-Version: 1.0
In-Reply-To: <462756c1-b4fd-e0f0-7fca-61b9b1fd8157@redhat.com>
X-MC-Unique: _AeEAoFRNVu-7bRc6cVz0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3ixh+EKurMt

On Mon, Feb 03, 2020 at 02:38:22PM +0100, Auger Eric wrote:
> Hi Michael,
>=20
> On 2/3/20 2:28 PM, Michael S. Tsirkin wrote:
> > On Mon, Feb 03, 2020 at 02:20:55PM +0100, Auger Eric wrote:
> >> Hi Michael,
> >>
> >> On 2/3/20 2:03 PM, Michael S. Tsirkin wrote:
> >>> On Sat, Jan 25, 2020 at 06:19:52PM +0100, Eric Auger wrote:
> >>>> This patch adds virtio-iommu-pci, which is the pci proxy for
> >>>> the virtio-iommu device.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >>>
> >>> I commented on v11 of this patch:
> >>>>> Could you send a smaller patchset without pci/acpi bits for now?
> >>> And you answered:
> >>>> Yes I am about to send v12.
> >>>
> >>> I guess this patch is here by mistake then?
> >>>
> >>> I think PCI devices should always have config space so guests are
> >>> not tempted to find work-arounds. Right?
> >> No it is not here by mistake. I removed everything related non DT
> >> integration as we discussed.
> >>
> >> DT support is fully upstream even for virtio-iommu-pci.
> >> https://github.com/torvalds/linux/blob/master/Documentation/devicetree=
/bindings/virtio/iommu.txt
> >>
> >> So what's wrong implementing that at the moment. As we discussed we
> >> would use the PCIe config space integration for non DT.
> >>
> >> If I use the MMIO based device, I am forced to lock an MMIO region for
> >> it in the machvirt memory map:
> >> https://elixir.bootlin.com/linux/latest/source/Documentation/devicetre=
e/bindings/virtio/mmio.txt
> >>
> >> I guess Peter (Maydell) will not be happy with this situation either.
> >>
> >> Thanks
> >>
> >> Eric
> >=20
> > I see. Can't we limit this to DT platforms for now then?
> That is the case. virtio-iommu does not work with ACPI.


Right. But nothing seems to prevent users from creating it
on systems without dt, and there won't be an easy way for
management to detect it when qemu added  this support down the road.



> For non DT the plan is to use what you suggested, ie. pass the binding
> info through the PCIe config space.
>=20
> In that prospect I am waiting for Jean-Philippe's [RFC 00/13]
> virtio-iommu on non-devicetree platforms respin
> (https://lore.kernel.org/linux-iommu/20191203190136.00007171@intel.com/T/=
)
> and especially patches 12 and 13 of the series, ie. binding info through
> the PCIe config space.
>=20
> Thanks
>=20
> Eric
> >=20
> >=20
> >=20
> >>>
> >>>> ---
> >>>>
> >>>> v11 -> v12:
> >>>> - added Jean's R-b
> >>>> - remove the array of intervals. Will be introduced later?
> >>>>
> >>>> v10 -> v11:
> >>>> - add the reserved_regions array property
> >>>>
> >>>> v9 -> v10:
> >>>> - include "hw/qdev-properties.h" header
> >>>>
> >>>> v8 -> v9:
> >>>> - add the msi-bypass property
> >>>> - create virtio-iommu-pci.c
> >>>> ---
> >>>>  hw/virtio/Makefile.objs          |  1 +
> >>>>  hw/virtio/virtio-iommu-pci.c     | 88 +++++++++++++++++++++++++++++=
+++
> >>>>  include/hw/pci/pci.h             |  1 +
> >>>>  include/hw/virtio/virtio-iommu.h |  1 +
> >>>>  qdev-monitor.c                   |  1 +
> >>>>  5 files changed, 92 insertions(+)
> >>>>  create mode 100644 hw/virtio/virtio-iommu-pci.c
> >>>>
> >>>> diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
> >>>> index 2fd9da7410..4e4d39a0a4 100644
> >>>> --- a/hw/virtio/Makefile.objs
> >>>> +++ b/hw/virtio/Makefile.objs
> >>>> @@ -29,6 +29,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) +=3D virtio-input-=
host-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_INPUT) +=3D virtio-input-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_RNG) +=3D virtio-rng-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_BALLOON) +=3D virtio-balloon-pci.o
> >>>> +obj-$(CONFIG_VIRTIO_IOMMU) +=3D virtio-iommu-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_9P) +=3D virtio-9p-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_SCSI) +=3D virtio-scsi-pci.o
> >>>>  obj-$(CONFIG_VIRTIO_BLK) +=3D virtio-blk-pci.o
> >>>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-p=
ci.c
> >>>> new file mode 100644
> >>>> index 0000000000..4cfae1f9df
> >>>> --- /dev/null
> >>>> +++ b/hw/virtio/virtio-iommu-pci.c
> >>>> @@ -0,0 +1,88 @@
> >>>> +/*
> >>>> + * Virtio IOMMU PCI Bindings
> >>>> + *
> >>>> + * Copyright (c) 2019 Red Hat, Inc.
> >>>> + * Written by Eric Auger
> >>>> + *
> >>>> + *  This program is free software; you can redistribute it and/or m=
odify
> >>>> + *  it under the terms of the GNU General Public License version 2 =
or
> >>>> + *  (at your option) any later version.
> >>>> + */
> >>>> +
> >>>> +#include "qemu/osdep.h"
> >>>> +
> >>>> +#include "virtio-pci.h"
> >>>> +#include "hw/virtio/virtio-iommu.h"
> >>>> +#include "hw/qdev-properties.h"
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
> >>>> +static Property virtio_iommu_pci_properties[] =3D {
> >>>> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> >>>> +    DEFINE_PROP_END_OF_LIST(),
> >>>> +};
> >>>> +
> >>>> +static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Erro=
r **errp)
> >>>> +{
> >>>> +    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
> >>>> +    DeviceState *vdev =3D DEVICE(&dev->vdev);
> >>>> +
> >>>> +    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> >>>> +    object_property_set_link(OBJECT(dev),
> >>>> +                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)=
),
> >>>> +                             "primary-bus", errp);
> >>>> +    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
> >>>> +}
> >>>> +
> >>>> +static void virtio_iommu_pci_class_init(ObjectClass *klass, void *d=
ata)
> >>>> +{
> >>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>>> +    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> >>>> +    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
> >>>> +    k->realize =3D virtio_iommu_pci_realize;
> >>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >>>> +    dc->props =3D virtio_iommu_pci_properties;
> >>>> +    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
> >>>> +    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU;
> >>>> +    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
> >>>> +    pcidev_k->class_id =3D PCI_CLASS_OTHERS;
> >>>> +}
> >>>> +
> >>>> +static void virtio_iommu_pci_instance_init(Object *obj)
> >>>> +{
> >>>> +    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(obj);
> >>>> +
> >>>> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >>>> +                                TYPE_VIRTIO_IOMMU);
> >>>> +}
> >>>> +
> >>>> +static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info =3D {
> >>>> +    .base_name             =3D TYPE_VIRTIO_IOMMU_PCI,
> >>>> +    .generic_name          =3D "virtio-iommu-pci",
> >>>> +    .transitional_name     =3D "virtio-iommu-pci-transitional",
> >>>> +    .non_transitional_name =3D "virtio-iommu-pci-non-transitional",
> >>>> +    .instance_size =3D sizeof(VirtIOIOMMUPCI),
> >>>> +    .instance_init =3D virtio_iommu_pci_instance_init,
> >>>> +    .class_init    =3D virtio_iommu_pci_class_init,
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
> >>>> index 2acd8321af..cfedf5a995 100644
> >>>> --- a/include/hw/pci/pci.h
> >>>> +++ b/include/hw/pci/pci.h
> >>>> @@ -86,6 +86,7 @@ extern bool pci_available;
> >>>>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
> >>>>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
> >>>>  #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
> >>>> +#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> >>>> =20
> >>>>  #define PCI_VENDOR_ID_REDHAT             0x1b36
> >>>>  #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
> >>>> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/vi=
rtio-iommu.h
> >>>> index 2a2c2ecf83..f39aa0fbb4 100644
> >>>> --- a/include/hw/virtio/virtio-iommu.h
> >>>> +++ b/include/hw/virtio/virtio-iommu.h
> >>>> @@ -25,6 +25,7 @@
> >>>>  #include "hw/pci/pci.h"
> >>>> =20
> >>>>  #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
> >>>> +#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
> >>>>  #define VIRTIO_IOMMU(obj) \
> >>>>          OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
> >>>> =20
> >>>> diff --git a/qdev-monitor.c b/qdev-monitor.c
> >>>> index 3465a1e2d0..97f4022b51 100644
> >>>> --- a/qdev-monitor.c
> >>>> +++ b/qdev-monitor.c
> >>>> @@ -66,6 +66,7 @@ static const QDevAlias qdev_alias_table[] =3D {
> >>>>      { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X=
 },
> >>>>      { "virtio-input-host-pci", "virtio-input-host",
> >>>>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>>> +    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARC=
H_S390X },
> >>>>      { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
> >>>>      { "virtio-keyboard-pci", "virtio-keyboard",
> >>>>              QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
> >>>> --=20
> >>>> 2.20.1
> >>>
> >>>
> >=20

