Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp404120lfp;
        Fri, 7 Feb 2020 02:24:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyB0U9TdUBTMxbf7FlqPXm+4ZAbSbhgJqbg53Fc2FE4XsO/7a1RTX7a0odx78Q0Y/geMIfm
X-Received: by 2002:a05:6214:118d:: with SMTP id t13mr6008126qvv.5.1581071043368;
        Fri, 07 Feb 2020 02:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581071043; cv=none;
        d=google.com; s=arc-20160816;
        b=NKM0jxwnlVDOLQywiMYwWQItVw3JbyAuekzraxHvD7/JI6U2jhF3nLVUlIrllM+r9j
         PnSo2QM7Yh460Oxkihf75SpGW7c59oapsDesukNIQWgXr/pF7cr0PJCWrxcDeY5BwJM/
         LnEr7Si0/5yra+38id4X+RSYKj95BxPGFavKiIje0857XJxjIlBU3zV4BHVlIb3wCmf+
         Z/cuc9gdEpZ5YacVXfkkkIPRxwdUbq0X2EFeCwkRNRVkSrt3Uuamah+0lrWvQfCKQuAz
         i2kYUqo6reYpgfLXjkgsFFMbOtMYRzE4hf5VMrMmWDz5qiV+n+yD7ator34gG7j7tjX5
         2/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=9s1Qx6A91TLMd+q11aMBXC3QFrx0W4N2W57XoqufQh8=;
        b=qWZtTM0fbOCVmXPsdKVBbF3wzooCvAn0wE/Rl46vg7vinteDQuqrPz5P33jfsWBsK6
         XEoFhQsi1FTkF3PKC2pzq+LKwbyZKhSnyH8PPjdEqBRi3/AvYAXJxrdekczj9U9emTdO
         pJ8vT6vKQFKHf/JprhUDpeEAbMJSKSdxvEMJlFYEOFRASZ9thpQu4++AewXkCwikOyaW
         szZ8Nmyma3SmC4eNTBl85/cRhTWWqXG0GIDwYHn97ZOCp+3cHorntEIUwvKzCEryW/cI
         av4/XhaWJ4DDLhM1zv3nnyEiCwd7eTp0HkG0j5ubTGpyyBbsjtxP4Y6EmbJc2k6acCPX
         7qsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dUKZ3h8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si1247415qtc.6.2020.02.07.02.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dUKZ3h8b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00nq-0001D1-RH
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j00nj-0001Az-06
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j00nh-0003CT-Op
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:23:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j00nh-0003Bf-Kq
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9s1Qx6A91TLMd+q11aMBXC3QFrx0W4N2W57XoqufQh8=;
 b=dUKZ3h8bk15xyECsEJK9uAyDRrr3gFqZ24lKFPqWnsvS21uB4eAO9kkx9TtfAZhDvB0xkT
 nuXfn9x5GMVgep11W69wflfbfC8/UZLF2ZDsYu5YNB31qrYVOqr+ZFACiF5qL6SOA3C2P0
 etL8/jhN1KN2GaBNuXXxMaFbeTb7vF0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-zzOVGy5TPa2mwU0KZn_TWg-1; Fri, 07 Feb 2020 05:23:51 -0500
Received: by mail-qv1-f72.google.com with SMTP id d7so845110qvq.12
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 02:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZnxDCvmuPZ5pZ0PeIwsxPJFJk2jcdWwkHN/1vNPLLDk=;
 b=gPBKCdSDGl7Yi57giBNdY6K6hFqBIrgap6Mgcxtu79rU7mFOWENxbCU8sg7rGftjCJ
 kGMGZTu9w2JfuS068OtucNkLlHHCAR5yVmDabv1J0+i5U/kHUSitDiRLOZdYe90k6N1s
 kI1HNrsd/2rwqxCsU/NEmTS3Jfoa5Gp1Ql10CIYUzBxdzcIo3s4CCfq7KrvlHDYHR27Q
 SeijPZzvVWbhN+l16x4B0qZ7aPijAD2TboC41ElBDlkiGVr1W/SSgUhvWbYwAaZMB/41
 IL77U6xvTLKvDmh5oICyzWnv/oZ/nqhvPIdaIYvdw9aPG2wBOyVb/kao+k0BTxeuhCOF
 nzbA==
X-Gm-Message-State: APjAAAWecU8magUdeRPCvbXZKwReDGVZmEr8wv4taYd/K+PKGUhdjym7
 njGCBN5MI/d9vc3usWNkxAlw/LRgZKoEi86d4IPlNvZIjNGMcvqbJmXqWGIjzcTeo95OPHZ0/pw
 PKQ9fbpy1H1TM
X-Received: by 2002:ac8:607:: with SMTP id d7mr6659137qth.271.1581071031048;
 Fri, 07 Feb 2020 02:23:51 -0800 (PST)
X-Received: by 2002:ac8:607:: with SMTP id d7mr6659116qth.271.1581071030771;
 Fri, 07 Feb 2020 02:23:50 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id e130sm1056520qkb.72.2020.02.07.02.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 02:23:49 -0800 (PST)
Date: Fri, 7 Feb 2020 05:23:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200207052214-mutt-send-email-mst@kernel.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200207093203.3788-9-eric.auger@redhat.com>
X-MC-Unique: zzOVGy5TPa2mwU0KZn_TWg-1
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
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+i/IWuJ4LaD

On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> At the moment, the kernel only supports device tree
> integration of the virtio-iommu. DT bindings between the
> PCI root complex and the IOMMU must be created by the machine
> in conformance to:
>=20
> Documentation/devicetree/bindings/virtio/iommu.txt.
>=20
> To make sure the end-user is aware of this, force him to use the
> temporary device option "x-dt-binding" and also double check the
> machine has a hotplug handler for the virtio-iommu-pci device.
> This hotplug handler is in charge of creating those DT bindings.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>

how about setting it by default from machine class?
See
[PATCH 1/2] spapr: Disable legacy virtio devices for pseries-5.0 and later
[PATCH 2/2] spapr: Enable virtio iommu_platform=3Don by default
which does it for spapr.

> ---
>=20
> May be squashed with previous patch
> ---
>  hw/virtio/virtio-iommu-pci.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index d539fcce75..3d06e14000 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -14,6 +14,7 @@
>  #include "virtio-pci.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> =20
>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> =20
> @@ -27,10 +28,12 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
>  struct VirtIOIOMMUPCI {
>      VirtIOPCIProxy parent_obj;
>      VirtIOIOMMU vdev;
> +    bool dt_binding;
>  };
> =20
>  static Property virtio_iommu_pci_properties[] =3D {
>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_BOOL("x-dt-binding", VirtIOIOMMUPCI, dt_binding, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *v=
pci_dev, Error **errp)
>      VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> =20
> +    if (!dev->dt_binding) {
> +        error_setg(errp,
> +                   "Instantiation currently only is possible if the mach=
ine "
> +                   "creates device tree iommu-map bindings, ie. ACPI is =
not "
> +                   "yet supported");
> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
> +        return;
> +    }
> +
> +    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> +        error_setg(errp,
> +                   "The machine does not implement a virtio-iommu-pci ho=
tplug "
> +                   " handler that creates the device tree iommu-map bind=
ings");
> +       return;
> +    }
>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
>      object_property_set_link(OBJECT(dev),
>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> --=20
> 2.20.1

