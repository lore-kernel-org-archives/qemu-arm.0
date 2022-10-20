Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp405479dlb;
        Thu, 20 Oct 2022 08:54:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LoCaiqqiDmhL/Hd4fpXYVAz1urlgDNtjtJ7ul7Hh6GILfIVr2u4WCy8JbJx3a9crA9xsQ
X-Received: by 2002:a05:620a:1710:b0:6ee:d8bc:7469 with SMTP id az16-20020a05620a171000b006eed8bc7469mr9992774qkb.487.1666281268771;
        Thu, 20 Oct 2022 08:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666281268; cv=none;
        d=google.com; s=arc-20160816;
        b=c3x4Y9UlHs+40YlWBAw0Dwvl0keYeVW5NbUNCIp70/WBzX/dFxoLbnWg+2Lohdae27
         pimritciW0l+AawAQuOPiWMIC6YV6Lp88qNVWtYPmc7QOCQ6GDFD6hRQnym626EE5SWv
         JWGJeS2/8xF4Y3bdKp7A7D0PY1LcQgl+oaSgsW2afVySLdSN+YvZ+qrgPXjC8wLPR16/
         7+pB1ZmYGmsv6/d6JG2bpdIM7WauoQ4dwAR/8D98pV9xqyCxgM4DBrkbEacZ88RF8wdU
         L74+1ZFU5W06fZkOFd48HGacYcv/1VJz4+0xsv8PebPLifpsnFWIBVBw/tVM4BcoTt2T
         xWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8DMuV3wDr6tVPv25BMvx9ku2WH6rPvclvf2gIdh2vek=;
        b=dPj9MnMTtpyBatZCOVZrTKaqy09+AjJtg9vEGcu8z9Ck8pPE47qEJ1uwEU2phDwTk9
         RVfy2XP2Y5Xk4S8EMbph+tsoFFP1ycmeALrHtKTtf+64d0iBPe/wub1x2e/QS+25NXmH
         UDQX9QmYOhClU3V7FzCm0bKqbpm+Pnra/Uq0CbwP8mGG302sb5CB31h1MxCu3t8YKObV
         TJrHinWJJ8vlsVr74xjOWJzQWnQ3qP+RSQZLDuMnn+WfdLC0sQIq7L+tCwhkszGf7cKE
         5HqxPW5yP0puPEVwItV9+rSXD5ErfaiZTx7V3iklaiw+ojNcUy2umRU1NZ6TOOA5Wu1I
         h9UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ak/5hJHS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a0562140c4900b004af95e25749si9282382qvj.324.2022.10.20.08.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 08:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ak/5hJHS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olXsI-0002ID-Vl
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 11:54:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olXrl-0003Sj-Pa
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 11:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1olWjb-0001Bt-7e
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:41:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1olWjY-0004iA-MA
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:41:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2510813wme.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8DMuV3wDr6tVPv25BMvx9ku2WH6rPvclvf2gIdh2vek=;
 b=Ak/5hJHSHVSWpWb45Hvf1M95HaQpFQK+tZssDXaxyNW/QCY+D17iHq7fyoxpqkmjAP
 oWPgUkpOxpLddiXaBeTVy7k7BVbay0pA+nwO4Yza52MxlV1RkDD1+18ddQA+chLdpmDV
 RNyDSnc1VDFp6A9qkzbIJRxoLEAyTnk4uEBcIOAjCocKkJHLmbLRAB0Yg7LvjU6jHCBj
 N7KdipHlKw0YDpVivcpSJSJWfTP2bn2ID8hrAHoIghD6qIYzL3So+fBbbh2kKdF0ohHf
 sH+7Jh17fbGzaH7AvApcTwYZtJ+DEld1x0RGPnaaVgRD0K1orJQEaiK+aM/hqkt3lkga
 5ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DMuV3wDr6tVPv25BMvx9ku2WH6rPvclvf2gIdh2vek=;
 b=OsxwPc+33rLqedvzuFqCrzorp0ZaA4JtSe2XCjTsA/9rQISY/0IZVgQFTJmR2OVWl7
 Z65WcodkMZqMw7o3sbjVwcPCWJRnyX9BNfkWGKzl3pGytpKhBIyYAHD3tVcTXL68SSw0
 92HuGfZcdB1cQ/xXci1J0kKRhL3Ci6VN/VIR9GZWbSRaJ5LqLWD8KGY8D/OuDw3TFZVO
 5I0ze3HGZ0g/yjMmmHKHwpYfb1o+HA1oqkKvk36GMh02gEAgUj7i5Fi00thOiBfr+Dg2
 G/1S3APyACDKjYXxH5SDQu8IHva3dJnLqlTLji1pTy39ZZ/Lk8+fO3wxGsKzpGVP8wso
 KDrQ==
X-Gm-Message-State: ACrzQf3cL0Vrj4/8ZhWelK7uSPFlX+YvaTola5d6xrqTlhsng12M64Xa
 JOgjq578qmBv8K7MVXPhK+LVqg==
X-Received: by 2002:a05:600c:2104:b0:3c6:b7f0:cfd0 with SMTP id
 u4-20020a05600c210400b003c6b7f0cfd0mr30447793wml.128.1666276877505; 
 Thu, 20 Oct 2022 07:41:17 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003a6a3595edasm3204728wmb.27.2022.10.20.07.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:41:17 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:41:13 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, eric.auger.pro@gmail.com,
 mst@redhat.com, peterx@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com
Subject: Re: [PATCH v2] vhost: Warn if DEVIOTLB_UNMAP is not supported and
 ats is set
Message-ID: <Y1FeCUQV/z2Ar3Uw@myrica>
References: <20221019122717.1259803-1-eric.auger@redhat.com>
 <CACGkMEtL9Rf6YkHBJpNm2LXfvX51s2KDCgvBNH6cJWfp7PdfVA@mail.gmail.com>
 <5d4d1994-8560-80da-dbc7-babb5cd4ee0b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d4d1994-8560-80da-dbc7-babb5cd4ee0b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K0/D0hkrRA8z

Hi,

On Thu, Oct 20, 2022 at 03:03:10PM +0200, Eric Auger wrote:
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

Maybe the name Vt-d uses for ATC, "device TLB" makes more sense as a
generic term, because page fault is a separate concept. However it might
be a little confusing for other architectures. The Arm SMMU can support
both OS-visible and transparent device TLBs:

(a) PCIe ATS requires special ATC invalidate commands, separate from the
  normal TLB invalidate commands. Like the Device-TLB invalidate command
  on Vt-d.

(b) But a SMMU can also be distributed, with multiple per-device TLBs
  talking to one translation component, and in that case the TLBs are
  coherent, invisible to the OS, and the normal TLB invalidate command
  invalidates all device TLBs.

Even though the term "device TLB" could apply to both cases, this function
is only about the first one so "ats_capable" may be clearer overall.

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
> "pf" (would it be though DEVIOTLB_UNMAP or UNMAP). Don't UNMAP
> notifications also implement part of ATS protocol? I guess this is the
> reason why you mandated ats in the first place.
> 
> So if ATS is not enabled, shouldn't we fallback to virtio instead of vhost?

But do we need ATS in order to support vhost?  As long as we're capable of
keeping the vhost IOTLB coherent with the IOMMU by using the vhost-iotlb
protocol, then we should be able to support vhost. The guest can send
normal TLB invalidate commands (not special dev-iotlb commands), and
doesn't need to be aware that the TLB is implemented outside of QEMU
because the notifiers can maintain coherency transparently (model (b)
above).

So I agree with the reasoning in this patch, though I'm not sure it's
worth a warning. If the vIOMMU doesn't support ATS commands, then the OS
won't enable it in PCIe devices, but vhost can work in both cases.

Thanks,
Jean

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
