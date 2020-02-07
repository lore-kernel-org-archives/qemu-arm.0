Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp490894lfp;
        Fri, 7 Feb 2020 04:01:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZSc223S1N8oBQ0EkSdKrqmZSINRRJZgxIrno23S9NW/ZpTudEPIm73hD+wfaDG2n4HdA8
X-Received: by 2002:a37:a08b:: with SMTP id j133mr6695850qke.424.1581076880422;
        Fri, 07 Feb 2020 04:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581076880; cv=none;
        d=google.com; s=arc-20160816;
        b=Rd3dXqXN66Btan5mFXkYYpV2mjlQtVtLLvNClwyKEwd0UP9FNIvz0iKdCnaUNlsIE7
         pGgiKiX3lbL4a+ymFwWoN/kQjWpeZTYuUlMFY7OBYgSMKtidC+qBfVqRJzIPufK47wKj
         yT32CtR8YG07hwZW9HEMCsrc03sCtIY6JqtO5Y08LbrGRE7AAF+kdYTv9492Pd56zGfL
         /ba3Wp/l1sLuP1u/FG1e8p6DV+FXjUq23gMoP2SxA+1pKXWMapTKpC6ijAYmqT8LzARf
         i5/roCa0CQKO/Cuynmzo4dMRyj8SelHQ77MIQVSyG9eSbloAMT1pY+FcvX1+yaeYbC/Z
         8jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=k2Mo2hN53eAfVWiUCfXmhbSOOR91bP6TiSEEZ+4ZQS0=;
        b=UoFoYovoJOvSVLKQ8A/71xySJJXxnf6jf5M62JS2wZPl/l+7RhHAagIMWIHD9syiOZ
         IroDtgOSrz8m4qsUyd7iB5mkUPGxlCKL2A4Jl+4haBxeAlXyHL3XoY7858s1nhF395NU
         DFHTlvBe9yRF6xFvHVaKDTGWlB0sEiDvuqSpYVw+jdpSsHYYdVCRInuC3AODkVR79sYx
         6RB3lBuquvBpbgXkRivFBQSlggT1ml7Ld/XsvSa82siTAFK4qscn5ue3cUsvtjmDbImc
         XueMCHu4BKqA/cXLE1CIxwSgvMAnplGPFvlrBe1ujzMFBYcDdJjDVR+6E4GLErO6+Kec
         gxZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ah+R26jZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si1132998qkh.147.2020.02.07.04.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 04:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ah+R26jZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j02Jz-00044z-PH
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 07:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j02Jj-0003ys-LL
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 07:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j02Ji-00034Y-9H
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 07:01:03 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44812
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j02Ji-00033b-4x
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 07:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581076861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2Mo2hN53eAfVWiUCfXmhbSOOR91bP6TiSEEZ+4ZQS0=;
 b=ah+R26jZ0x9UMpuUYh13L7spb718kC/p4dlrrDkmApBKHQfwVdPj6USRUwTiu8XJ/dXzUP
 hTLTncKyqfRs/G6SxtdhCUZ9kdavGawfSrCz4awqe6i2ioYjh59EbCHOuXmqMID1fNqUkS
 ws/NcctDSLuXHbmCXV6ODtRfoF2NHbE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-5xc8CFYjMLSTE2mu6Z6E_w-1; Fri, 07 Feb 2020 07:00:59 -0500
Received: by mail-qt1-f198.google.com with SMTP id p12so1491576qtu.6
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 04:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DR7ZNVVKPCmdyCngabu8uSlBaI51LugMceNYmSjQ910=;
 b=INrqUDvSxVZQ6Hcw36kaugNnhhHD4vNkmxSq3RAtx5x9gR16FAK9bROahJu4rahsjH
 deUStzkVDc52dhpdGzKZDMhE5gHBSyYeo1r7APFqF8aDnXb/LJtkWqZxlgPMTxKtMmkc
 9f69gZFeiU0CgSCea0lU1vUfbhy9aflgCbbfOSJ+WMKpxBx+aaHZj1x5eMyPgShtFqnY
 ooDihdnUu4mmMJmu1q3k3RdMSZ0ROt9ngc+kGNUb6x0WmB+GG78QWiBUUkdIgtB50Gj2
 Z7KbJqNlh9v8Bz84woxUpJ8tnmIXeJS6IXbgKw/ZL8w/EtL0gcWSand7io8UqHcMJPOQ
 4WWQ==
X-Gm-Message-State: APjAAAXYU2ppMUgNvbotSh2FTAR8VFgn+lfEdNZKbuLWKluQ3743C+/J
 qSseoqST2odSx7RH9KdgTYnATQZbG0pAGAQR4EJ9qSYyRkC/7vrMjqD/2hSQ1S7snQD4AixE+ks
 5F4isfgvPr8CW
X-Received: by 2002:ac8:4289:: with SMTP id o9mr7049080qtl.277.1581076859281; 
 Fri, 07 Feb 2020 04:00:59 -0800 (PST)
X-Received: by 2002:ac8:4289:: with SMTP id o9mr7049044qtl.277.1581076858857; 
 Fri, 07 Feb 2020 04:00:58 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id k4sm1227300qtj.74.2020.02.07.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 04:00:57 -0800 (PST)
Date: Fri, 7 Feb 2020 07:00:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200207065915-mutt-send-email-mst@kernel.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207052214-mutt-send-email-mst@kernel.org>
 <25d39300-46b9-571c-6fa6-44c5f8d0be99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <25d39300-46b9-571c-6fa6-44c5f8d0be99@redhat.com>
X-MC-Unique: 5xc8CFYjMLSTE2mu6Z6E_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vLwLApyFfE8s

On Fri, Feb 07, 2020 at 11:51:55AM +0100, Auger Eric wrote:
> Hi,
>=20
> On 2/7/20 11:23 AM, Michael S. Tsirkin wrote:
> > On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> >> At the moment, the kernel only supports device tree
> >> integration of the virtio-iommu. DT bindings between the
> >> PCI root complex and the IOMMU must be created by the machine
> >> in conformance to:
> >>
> >> Documentation/devicetree/bindings/virtio/iommu.txt.
> >>
> >> To make sure the end-user is aware of this, force him to use the
> >> temporary device option "x-dt-binding" and also double check the
> >> machine has a hotplug handler for the virtio-iommu-pci device.
> >> This hotplug handler is in charge of creating those DT bindings.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> >=20
> > how about setting it by default from machine class?
> Do you mean in ARM virt machine class? But this wouldn't prevent a user
> from launching an ACPI booted guest. I thought you wanted the end-user
> to know what he does.
>=20
> I don't figure out a way to know if the guest is booted in dt or acpi
> mode. I can get access to those info:
> - whether acpi is enabled
> - whether a FW is loaded
>=20
> But a FW can be loaded, acpi enabled and eventually the guest is DT
> booted with acpi=3Doff in kernel opts.

So let's say this configuration does not support the virtio-iommu
at the moment. Is that a big deal?

> Maybe at this point I could only support the case where no FW is loaded.
> In machvirt I would not register the virtio-iommu-pci hotplug handler in
> case a FW is loaded. Then I could get rid of the new x-dt-binding prop.
>=20
> Thoughts?
>=20
> Eric

Also an option.

> > See
> > [PATCH 1/2] spapr: Disable legacy virtio devices for pseries-5.0 and la=
ter
> > [PATCH 2/2] spapr: Enable virtio iommu_platform=3Don by default
> > which does it for spapr.
>=20
> >=20
> >> ---
> >>
> >> May be squashed with previous patch
> >> ---
> >>  hw/virtio/virtio-iommu-pci.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci=
.c
> >> index d539fcce75..3d06e14000 100644
> >> --- a/hw/virtio/virtio-iommu-pci.c
> >> +++ b/hw/virtio/virtio-iommu-pci.c
> >> @@ -14,6 +14,7 @@
> >>  #include "virtio-pci.h"
> >>  #include "hw/virtio/virtio-iommu.h"
> >>  #include "hw/qdev-properties.h"
> >> +#include "qapi/error.h"
> >> =20
> >>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> >> =20
> >> @@ -27,10 +28,12 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> >>  struct VirtIOIOMMUPCI {
> >>      VirtIOPCIProxy parent_obj;
> >>      VirtIOIOMMU vdev;
> >> +    bool dt_binding;
> >>  };
> >> =20
> >>  static Property virtio_iommu_pci_properties[] =3D {
> >>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> >> +    DEFINE_PROP_BOOL("x-dt-binding", VirtIOIOMMUPCI, dt_binding, fals=
e),
> >>      DEFINE_PROP_END_OF_LIST(),
> >>  };
> >> =20
> >> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy=
 *vpci_dev, Error **errp)
> >>      VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
> >>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> >> =20
> >> +    if (!dev->dt_binding) {
> >> +        error_setg(errp,
> >> +                   "Instantiation currently only is possible if the m=
achine "
> >> +                   "creates device tree iommu-map bindings, ie. ACPI =
is not "
> >> +                   "yet supported");
> >> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n=
");
> >> +        return;
> >> +    }
> >> +
> >> +    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> >> +        error_setg(errp,
> >> +                   "The machine does not implement a virtio-iommu-pci=
 hotplug "
> >> +                   " handler that creates the device tree iommu-map b=
indings");
> >> +       return;
> >> +    }
> >>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
> >>      object_property_set_link(OBJECT(dev),
> >>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> >> --=20
> >> 2.20.1
> >=20

