Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp9994ejn;
        Wed, 19 Oct 2022 20:59:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dIRC2DaDhjszj4qDBRNRTEhOZTDtEe3vfOmMmnyBJzIRXBCZSIOxmi4ZWv7q0MCuJR1vo
X-Received: by 2002:a05:622a:1750:b0:39a:82aa:f4ab with SMTP id l16-20020a05622a175000b0039a82aaf4abmr9274337qtk.411.1666238350023;
        Wed, 19 Oct 2022 20:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666238350; cv=none;
        d=google.com; s=arc-20160816;
        b=Zf61SJCSEiVaAgS5xM+FawyDVsSaIL8UCakUa78kT2yFYuKHuiK93gdu3clAGzl1bf
         J//O4MujFCBFbSeDNf4/6Bo4pnvtzXSGrfMSA2pXyuLXR1GY0AfqFWDInXM921Cr9mPX
         cGAdXCy58/p5Ku36bQBSDq8y4Ph3w24NyyXBAqdpLkvL4MM1mRJKOaVGEJIdL3csYOMl
         pbjcc1Rk3MbAr87hqnPV0wSUzrSisq45o1JvQcIbbZVlPi9cOtCoM2QiRlfw6tPK9aZo
         xSW333P8Y7F9VH7tqoFhdcTukUxNsoHk+T/ohvguxby5yDe1yML5zDX9wUKlk2dNxqMX
         VguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nG4b5vJBGk65oaIZJhABwxwG7KnAqY0ae4MGiZcRUyM=;
        b=g6ISSECG5NxI8ApTTYGPLryp1ODNpSoyQFuagkgprK9zLFSmoGdlyb2B3YvXaoG7H5
         BniCqgC4yWu6J3vyokqn/7qHSNbYdqsMGA1RZTcHD7UmqO+0scEq1TS5t0nJ4KYEvCaq
         93xY4xPJqm+sVBxWARb6iiZ0h+yOEZEgEjrtQgi/m69CfPt9SBJNx8p8W2cBPPEDbFlL
         faIJyjr7mtSBGc2ZC+ewKN3yiFQPmDL7xRA/77au0XJ0x4EzX2yFVBqvuAgovUW2uPY3
         bAr5/HGERbeXlQ7IadNKMeu6GEgCvOfQ3PYD7Qid7b42P1v1GVchMD1yr1GLfLpqLRxc
         Buuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtNh5Y2T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020ac8728d000000b0039b2791cd6asi9421721qto.601.2022.10.19.20.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 20:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZtNh5Y2T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olMi4-0000Br-Gh
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:59:08 -0400
Received: from [::1] (port=51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olMi4-0007XE-9v
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 23:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMhl-0007Uq-HC
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMhj-0001yc-C9
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 23:58:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666238326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nG4b5vJBGk65oaIZJhABwxwG7KnAqY0ae4MGiZcRUyM=;
 b=ZtNh5Y2TFvnezG6qCWMhDk+rwrMjv5yqFSmDLeYBHSN39dRtcHNNBFH0+PiddcJ2LN7lhT
 o2AOD/bXKIQZyWls7J4qlbne25nn3kYi8P0C3xNl5mzxXRMqHcspeh9xjyPbXBv91rbqWe
 xHZmV6se6GUaQklIGb9MDFNk9/yeVHM=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-AghWsDP_PfGKzI95y7ZB6Q-1; Wed, 19 Oct 2022 23:58:45 -0400
X-MC-Unique: AghWsDP_PfGKzI95y7ZB6Q-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1331cbf6357so9164339fac.11
 for <qemu-arm@nongnu.org>; Wed, 19 Oct 2022 20:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nG4b5vJBGk65oaIZJhABwxwG7KnAqY0ae4MGiZcRUyM=;
 b=NlXeCq19VjXq0VPHD6vcXyAcilTaQPE7Ky+A7VZZWi1XwpMV06u04Z+NQ1rxIV/YXe
 iEv1YAdsnJlWj9hKpU6aSbvyMa2BqAD4x7U5CgDVA/R2gq2GDfdC+KT6MdT0jSSs3zgn
 Uz/m9PlJhvpAZ1tspe5PZCktMOhkwsNSf6Sxk94O9yd3MhQbKsfWn8L7NXRtlhVtkPTy
 3RbPwrlE1MT6zGVaFjz7u2xObcfj+3mwOq3oaCaEl0TFCZo9WDO5CV+gNanKG/Q2tCoc
 LFnaMDxWmyB/W3wBvRVNw1Zn7oXhZ2CU5sEL0g810v2h+w005WxDBQ5ViOwsqvExCBfB
 gA5w==
X-Gm-Message-State: ACrzQf32TSNTHmQ95MUoh2Zv6ff5UMK5LxSjj/+UF1hATSkFacDTTf3T
 hg6JMYdUbqYCJROTu5K8nFAB74eCmbIahRWtd+SVq0h0TcN1K3vghqr9bDruPbthXjOHPgOQcJI
 RmdhotRtJjpCYzQnlJR4LAPQ7YY9S
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr5879774otg.237.1666238324536; 
 Wed, 19 Oct 2022 20:58:44 -0700 (PDT)
X-Received: by 2002:a9d:12a8:0:b0:661:a06f:33d7 with SMTP id
 g37-20020a9d12a8000000b00661a06f33d7mr5879761otg.237.1666238324226; Wed, 19
 Oct 2022 20:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221019122717.1259803-1-eric.auger@redhat.com>
In-Reply-To: <20221019122717.1259803-1-eric.auger@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 11:58:32 +0800
Message-ID: <CACGkMEtL9Rf6YkHBJpNm2LXfvX51s2KDCgvBNH6cJWfp7PdfVA@mail.gmail.com>
Subject: Re: [PATCH v2] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, peterx@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, eperezma@redhat.com, 
 jean-philippe@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ixlz3a4MIogf

On Wed, Oct 19, 2022 at 8:27 PM Eric Auger <eric.auger@redhat.com> wrote:
>
> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
> notifier. This latter is supported by the intel-iommu which supports
> device-iotlb if the corresponding option is set. Then 958ec334bca3
> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
> silent fallback to the legacy UNMAP notifier if the viommu does not
> support device iotlb.
>
> Initially vhost/viommu integration was introduced with intel iommu
> assuming ats=on was set on virtio-pci device and device-iotlb was set
> on the intel iommu. vhost acts as an ATS capable device since it
> implements an IOTLB on kernel side. However translated transactions
> that hit the device IOTLB do not transit through the vIOMMU. So this
> requires a limited ATS support on viommu side. Anyway this assumed
> ATS was eventually enabled .
>
> But neither SMMUv3 nor virtio-iommu do support ATS and the integration
> with vhost just relies on the fact those vIOMMU send UNMAP notifications
> whenever the guest trigger them. This works without ATS being enabled.
>
> This patch makes sure we get a warning if ATS is set on a device
> protected by virtio-iommu or vsmmuv3, reminding that we don't have
> full support of ATS on those vIOMMUs and setting ats=on on the
> virtio-pci end-point is not a requirement.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - s/enabled/capable
> - tweak the error message on vhost side
> ---
>  include/hw/virtio/virtio-bus.h |  3 +++
>  hw/virtio/vhost.c              | 21 ++++++++++++++++++++-
>  hw/virtio/virtio-bus.c         | 14 ++++++++++++++
>  hw/virtio/virtio-pci.c         | 11 +++++++++++
>  4 files changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> index 7ab8c9dab0..23360a1daa 100644
> --- a/include/hw/virtio/virtio-bus.h
> +++ b/include/hw/virtio/virtio-bus.h
> @@ -94,6 +94,7 @@ struct VirtioBusClass {
>      bool has_variable_vring_alignment;
>      AddressSpace *(*get_dma_as)(DeviceState *d);
>      bool (*iommu_enabled)(DeviceState *d);
> +    bool (*ats_capable)(DeviceState *d);
>  };
>
>  struct VirtioBusState {
> @@ -157,4 +158,6 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
>  void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
>  /* Whether the IOMMU is enabled for this device */
>  bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
> +/* Whether ATS is enabled for this device */
> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev);
>  #endif /* VIRTIO_BUS_H */
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 5185c15295..3cf9efce5e 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -324,6 +324,16 @@ static bool vhost_dev_has_iommu(struct vhost_dev *dev)
>      }
>  }
>
> +static bool vhost_dev_ats_capable(struct vhost_dev *dev)

I suggest to rename this as pf_capable() since ATS is PCI specific but
vhost isn't.

> +{
> +    VirtIODevice *vdev = dev->vdev;
> +
> +    if (vdev && virtio_bus_device_ats_capable(vdev)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>                                hwaddr *plen, bool is_write)
>  {
> @@ -737,6 +747,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>      Int128 end;
>      int iommu_idx;
>      IOMMUMemoryRegion *iommu_mr;
> +    Error *err = NULL;
>      int ret;
>
>      if (!memory_region_is_iommu(section->mr)) {
> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>      iommu->iommu_offset = section->offset_within_address_space -
>                            section->offset_within_region;
>      iommu->hdev = dev;
> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>      if (ret) {
> +        if (vhost_dev_ats_capable(dev)) {
> +            error_reportf_err(err,
> +                              "%s: Although the device exposes ATS capability, "
> +                              "fallback to legacy IOMMU UNMAP notifier: ",
> +                              iommu_mr->parent_obj.name);

I'm not sure if it's a real error, or I wonder what we need to do is

1) check is ATS is enabled
2) fallback to UNMAP is ATS is not enabled

> +        } else {
> +            error_free(err);
> +        }
>          /*
>           * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
>           * UNMAP legacy message
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 896feb37a1..d46c3f8ec4 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -348,6 +348,20 @@ bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
>      return klass->iommu_enabled(qbus->parent);
>  }
>
> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev)
> +{
> +    DeviceState *qdev = DEVICE(vdev);
> +    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
> +    VirtioBusState *bus = VIRTIO_BUS(qbus);
> +    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
> +
> +    if (!klass->ats_capable) {
> +        return false;

I think it's better to check whether or not ATS is enabled. Guest may
choose to not enable ATS for various reasons.

Thanks

> +    }
> +
> +    return klass->ats_capable(qbus->parent);
> +}
> +
>  static void virtio_bus_class_init(ObjectClass *klass, void *data)
>  {
>      BusClass *bus_class = BUS_CLASS(klass);
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index e7d80242b7..c2ceba98a6 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1141,6 +1141,16 @@ static bool virtio_pci_iommu_enabled(DeviceState *d)
>      return true;
>  }
>
> +static bool virtio_pci_ats_capable(DeviceState *d)
> +{
> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
> +
> +    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static bool virtio_pci_queue_enabled(DeviceState *d, int n)
>  {
>      VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
> @@ -2229,6 +2239,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
>      k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
>      k->get_dma_as = virtio_pci_get_dma_as;
>      k->iommu_enabled = virtio_pci_iommu_enabled;
> +    k->ats_capable = virtio_pci_ats_capable;
>      k->queue_enabled = virtio_pci_queue_enabled;
>  }
>
> --
> 2.35.3
>

