Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp770600ejn;
        Thu, 20 Oct 2022 19:39:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76Ni3WAwLh5C5S2OUOs+yL8LNiHo/FQvApYQf9BoZUb+kyhU88tRWKKSsSMDWiUt1pmW7X
X-Received: by 2002:a05:6214:21c9:b0:4b4:52bd:5805 with SMTP id d9-20020a05621421c900b004b452bd5805mr15047624qvh.71.1666319989901;
        Thu, 20 Oct 2022 19:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666319989; cv=none;
        d=google.com; s=arc-20160816;
        b=bXlPoA4bja6uvfLyTEqhdMkx3OwWDul2MB55eWKFsfVnn+WsnLqQbt2hG0qrkxvScP
         kIFZy4Odl1V89nFIHM8+y/25arg+zxUfoQksw+QIX/Sf8cRwV7dTOIshl8kpuZlhtMsJ
         U7C1ODagAMFkyj40NJ2lgZcaZVALlsr0vJz9E+X1wkdq2p9B5FkO4e60fBnfCdBukhyu
         uxv2W7qHmpHeDJ9xPX9dKeOCmmkRo8NdWvJAYYh5XpOFDb+sl9k18tgV9JjZZnl8Mvso
         ueO4dDjgKNT8d/RlmgPNJGi9spmkGHeaafAon0wCdAtL1awFRWwdKr66uRUiyluk44B7
         yvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1utgquKqJ/cRD8wZqTiRF7IZkAAaMUoxnId7MjWDRN8=;
        b=DQxbWz+EOyvMDPkOEJQSKhxv7KC18Pic47MAbWGi2aO97F3NWwp7CI50rBuOtCtL3u
         sEmDiLv9Lyp++I/KNLXzsD0zhj/InBGZxi5oGAW5RNtnoPxOXCKxJqamGW9q7LVMg0Wl
         Znu9UIJbG3KWgg2sUHtZBfpMdd2raTfC2wOe9zdw2oBko5aTOQFe/9hRB6UrIR6G29jf
         EXDg5deufSA9hyNEZhaPUR16En5wHTlCOA6iYcbo9nqjrmqrytlpG2A8sYZewcHbBQmZ
         4bEuYURIhRfkVrjy6RoJ2g4jszgCYaUaX5B78Oj2GUcY8sIKtHgTiJT8bUtjbqsPzAMp
         ZwwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DSo3ypH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea17-20020a05620a489100b006b90fe172d4si11432534qkb.179.2022.10.20.19.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 19:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DSo3ypH/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olhwo-0007nf-CW
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 22:39:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olhvm-00059G-Hr
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 22:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olhvh-00054W-1n
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 22:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olhvf-0000Rx-4f
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 22:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666319913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1utgquKqJ/cRD8wZqTiRF7IZkAAaMUoxnId7MjWDRN8=;
 b=DSo3ypH/iOlF6ZJZiCjc+07FMjFgbYZsSqvisRunh2OLlNhDK1splka4y63NzAXfqdhX3w
 lpHsOugMsHmQW3V3gT+bJVvZg0fzOqeMZbM+MW6cGruu/3ZBwdAxgvrRxlnw9ONYCPr4YH
 JkEzL/FRk11QjQEQycmd8Ccga1m1wmM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-VZjt1m7fMKCulZV0KK3f8g-1; Thu, 20 Oct 2022 22:38:31 -0400
X-MC-Unique: VZjt1m7fMKCulZV0KK3f8g-1
Received: by mail-ot1-f70.google.com with SMTP id
 t11-20020a9d590b000000b00655fad88dacso897867oth.1
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 19:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1utgquKqJ/cRD8wZqTiRF7IZkAAaMUoxnId7MjWDRN8=;
 b=Noul27f3vgSt/K0iWzZY2XoZIMnlbSKkzFLXyqrk25KqsD58AelhrBpQnKgqMqJ6zC
 2nYPi3hQMhjmIh/5+6RIE66CEsCgZjAWSKL5PR9nWNMaU+hFnCIhgzjUDpsohawAtRYy
 ItNKTxB6cn0jvWMfrxMMDVQ6E9o+AdBKmhd1GEEh7gKue3waXC8so93nul7ovHGBheht
 mK6Ni7WFYmFxckqpOt38934wHsJgNlFiekoB8ATOW/d++c2oEYDApHmJQmkbtHomJ7Rh
 iFcbjpx8DUlI04DTwQYkaiNR2fAQSKURCSuYSmbgLGf1ZjoxzC63jZ9tkS5dVirHpY5a
 NjIA==
X-Gm-Message-State: ACrzQf28yUMhDIx0J3NfvMBoN9xb5PAxQAqV1svOXhKnpUqi5oRoz5fd
 WDNlaTuJwlft2zPVfcyu12S8yfwzBN9MF1HORHClUU94Fx5ZR6TtABiwjGbFXoU+1hwb1gw1Rv4
 YXqtCBIaauco1f7OCP8T47Ikf0pqZ
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr9122434oib.280.1666319910889; 
 Thu, 20 Oct 2022 19:38:30 -0700 (PDT)
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr9122424oib.280.1666319910605; Thu, 20
 Oct 2022 19:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221019122717.1259803-1-eric.auger@redhat.com>
 <CACGkMEtL9Rf6YkHBJpNm2LXfvX51s2KDCgvBNH6cJWfp7PdfVA@mail.gmail.com>
 <5d4d1994-8560-80da-dbc7-babb5cd4ee0b@redhat.com>
In-Reply-To: <5d4d1994-8560-80da-dbc7-babb5cd4ee0b@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 10:38:18 +0800
Message-ID: <CACGkMEssGqm8vMr3=WP-4KJw03pbdmbWjmx0Z99dhD=i-Rpo_g@mail.gmail.com>
Subject: Re: [PATCH v2] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, mst@redhat.com, peterx@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, eperezma@redhat.com, 
 jean-philippe@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-TUID: zTNElGsOaDZi

On Thu, Oct 20, 2022 at 9:03 PM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Jason,
>
> On 10/20/22 05:58, Jason Wang wrote:
> > On Wed, Oct 19, 2022 at 8:27 PM Eric Auger <eric.auger@redhat.com> wrote:
> >> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> >> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
> >> notifier. This latter is supported by the intel-iommu which supports
> >> device-iotlb if the corresponding option is set. Then 958ec334bca3
> >> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
> >> silent fallback to the legacy UNMAP notifier if the viommu does not
> >> support device iotlb.
> >>
> >> Initially vhost/viommu integration was introduced with intel iommu
> >> assuming ats=on was set on virtio-pci device and device-iotlb was set
> >> on the intel iommu. vhost acts as an ATS capable device since it
> >> implements an IOTLB on kernel side. However translated transactions
> >> that hit the device IOTLB do not transit through the vIOMMU. So this
> >> requires a limited ATS support on viommu side. Anyway this assumed
> >> ATS was eventually enabled .
> >>
> >> But neither SMMUv3 nor virtio-iommu do support ATS and the integration
> >> with vhost just relies on the fact those vIOMMU send UNMAP notifications
> >> whenever the guest trigger them. This works without ATS being enabled.
> >>
> >> This patch makes sure we get a warning if ATS is set on a device
> >> protected by virtio-iommu or vsmmuv3, reminding that we don't have
> >> full support of ATS on those vIOMMUs and setting ats=on on the
> >> virtio-pci end-point is not a requirement.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v1 -> v2:
> >> - s/enabled/capable
> >> - tweak the error message on vhost side
> >> ---
> >>  include/hw/virtio/virtio-bus.h |  3 +++
> >>  hw/virtio/vhost.c              | 21 ++++++++++++++++++++-
> >>  hw/virtio/virtio-bus.c         | 14 ++++++++++++++
> >>  hw/virtio/virtio-pci.c         | 11 +++++++++++
> >>  4 files changed, 48 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
> >> index 7ab8c9dab0..23360a1daa 100644
> >> --- a/include/hw/virtio/virtio-bus.h
> >> +++ b/include/hw/virtio/virtio-bus.h
> >> @@ -94,6 +94,7 @@ struct VirtioBusClass {
> >>      bool has_variable_vring_alignment;
> >>      AddressSpace *(*get_dma_as)(DeviceState *d);
> >>      bool (*iommu_enabled)(DeviceState *d);
> >> +    bool (*ats_capable)(DeviceState *d);
> >>  };
> >>
> >>  struct VirtioBusState {
> >> @@ -157,4 +158,6 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
> >>  void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
> >>  /* Whether the IOMMU is enabled for this device */
> >>  bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev);
> >> +/* Whether ATS is enabled for this device */
> >> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev);
> >>  #endif /* VIRTIO_BUS_H */
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index 5185c15295..3cf9efce5e 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -324,6 +324,16 @@ static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> >>      }
> >>  }
> >>
> >> +static bool vhost_dev_ats_capable(struct vhost_dev *dev)
> > I suggest to rename this as pf_capable() since ATS is PCI specific but
> > vhost isn't.
> Does pf sound for page fault?

Yes.

> >
> >> +{
> >> +    VirtIODevice *vdev = dev->vdev;
> >> +
> >> +    if (vdev && virtio_bus_device_ats_capable(vdev)) {
> >> +        return true;
> >> +    }
> >> +    return false;
> >> +}
> >> +
> >>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> >>                                hwaddr *plen, bool is_write)
> >>  {
> >> @@ -737,6 +747,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
> >>      Int128 end;
> >>      int iommu_idx;
> >>      IOMMUMemoryRegion *iommu_mr;
> >> +    Error *err = NULL;
> >>      int ret;
> >>
> >>      if (!memory_region_is_iommu(section->mr)) {
> >> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
> >>      iommu->iommu_offset = section->offset_within_address_space -
> >>                            section->offset_within_region;
> >>      iommu->hdev = dev;
> >> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> >> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
> >>      if (ret) {
> >> +        if (vhost_dev_ats_capable(dev)) {
> >> +            error_reportf_err(err,
> >> +                              "%s: Although the device exposes ATS capability, "
> >> +                              "fallback to legacy IOMMU UNMAP notifier: ",
> >> +                              iommu_mr->parent_obj.name);
> > I'm not sure if it's a real error, or I wonder what we need to do is
> >
> > 1) check is ATS is enabled
> > 2) fallback to UNMAP is ATS is not enabled
> Isn't the problem due to the fact that vhost, by construction, requires
> "pf" (would it be though DEVIOTLB_UNMAP or UNMAP).

So the device IOTLB invalidation and miss were mapped to feature
VIRTIO_F_ACCESS_PLATFORM. So when this feature is negotiated Qemu can
send device IOTLB invalidation and process IOTLB miss (without caring
about ATS). So the only issue is when to trigger the IOTLB
invalidation. It could be done by both DEVIOTLB_UNMAP or UNMAP.

> Don't UNMAP
> notifications also implement part of ATS protocol?

I'd treat UNMAP as a way to make the device work without ATS:

1) when ATS is enabled, device IOTLB invalidation needs to be sent
from guest and vIOMMU receive device IOTLB invalidation request and
trigger DEVIOTLB_UNMAP
2) when ATS is not enabled, the device should still work per PCIe
spec, so we need find way to emulate this, since guest doesn't think
there's a device IOTLB, Qemu can only receive IOTLB invalidation. In
order to make dev devices work (receive IOTLB flush), we need to use
UNMAP in this case.

>I guess this is the
> reason why you mandated ats in the first place.
>
> So if ATS is not enabled, shouldn't we fallback to virtio instead of vhost?

If we can find a way to make vhost work that would be better and
what's more important, the fallback only work for vhost-net but not
vhost-user/vhost-vdpa.

Thanks

>
> Thanks
>
> Eric
> >
> >> +        } else {
> >> +            error_free(err);
> >> +        }
> >>          /*
> >>           * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
> >>           * UNMAP legacy message
> >> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >> index 896feb37a1..d46c3f8ec4 100644
> >> --- a/hw/virtio/virtio-bus.c
> >> +++ b/hw/virtio/virtio-bus.c
> >> @@ -348,6 +348,20 @@ bool virtio_bus_device_iommu_enabled(VirtIODevice *vdev)
> >>      return klass->iommu_enabled(qbus->parent);
> >>  }
> >>
> >> +bool virtio_bus_device_ats_capable(VirtIODevice *vdev)
> >> +{
> >> +    DeviceState *qdev = DEVICE(vdev);
> >> +    BusState *qbus = BUS(qdev_get_parent_bus(qdev));
> >> +    VirtioBusState *bus = VIRTIO_BUS(qbus);
> >> +    VirtioBusClass *klass = VIRTIO_BUS_GET_CLASS(bus);
> >> +
> >> +    if (!klass->ats_capable) {
> >> +        return false;
> > I think it's better to check whether or not ATS is enabled. Guest may
> > choose to not enable ATS for various reasons.
> >
> > Thanks
> >
> >> +    }
> >> +
> >> +    return klass->ats_capable(qbus->parent);
> >> +}
> >> +
> >>  static void virtio_bus_class_init(ObjectClass *klass, void *data)
> >>  {
> >>      BusClass *bus_class = BUS_CLASS(klass);
> >> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> >> index e7d80242b7..c2ceba98a6 100644
> >> --- a/hw/virtio/virtio-pci.c
> >> +++ b/hw/virtio/virtio-pci.c
> >> @@ -1141,6 +1141,16 @@ static bool virtio_pci_iommu_enabled(DeviceState *d)
> >>      return true;
> >>  }
> >>
> >> +static bool virtio_pci_ats_capable(DeviceState *d)
> >> +{
> >> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
> >> +
> >> +    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
> >> +        return true;
> >> +    }
> >> +    return false;
> >> +}
> >> +
> >>  static bool virtio_pci_queue_enabled(DeviceState *d, int n)
> >>  {
> >>      VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
> >> @@ -2229,6 +2239,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
> >>      k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
> >>      k->get_dma_as = virtio_pci_get_dma_as;
> >>      k->iommu_enabled = virtio_pci_iommu_enabled;
> >> +    k->ats_capable = virtio_pci_ats_capable;
> >>      k->queue_enabled = virtio_pci_queue_enabled;
> >>  }
> >>
> >> --
> >> 2.35.3
> >>
>

