Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6011058wrv;
        Wed, 31 Jul 2019 12:25:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAfgaRePvfR897GaNqsogNwmrQvi8OXvu2aKY4UQDI79aL+oZF6wY0EpjbWUF1myQ3Sdw/
X-Received: by 2002:a17:906:7cd6:: with SMTP id h22mr3124632ejp.254.1564601134210;
        Wed, 31 Jul 2019 12:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564601134; cv=none;
        d=google.com; s=arc-20160816;
        b=L6Vxi4uCUEuIv1R7OpiZ/V+dTXwqpqyEdXMRZAaYP+8Zz3UmbsjcmM+GMQeDXotUp/
         arnZPtN9ucFfNYZs6IslIsVG5Nqp9Wm4j44nZx/okui08oizE6jmbkwmT6RkcfX+pYfw
         7LPGVvNsRnHUSOkRqyfr+3LvskMRmDjfTO0KlwvocC/j5DrR4zP5KsUw84gP4mPnlFvt
         pKshpGQaoNWkFM4sEBzYoKQvk6USa8iccssRWtNnS64JzCMtquD3y4v5E02fSVQPBh0Q
         wdeCACJoB5040MEkH7oHik6/i7R5BU56G8zeTQ5ObToSu0Ftgbky8rsCQnS5UDcIW6CI
         JRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=+CbvwvbnfA818mkjtNcJHKeaTSPk5Cv2KGP0rJtEuwE=;
        b=NUAjujoKPh8Ay5yVUV27QDlEOWIIP9y/2zAaD47Q9kixBbK2rAzqKdXsdwxG6DK2SE
         NRXvUHaHj++pqeFFcioimwsogHZQN0KGa0atKrsm9gSmUPkflucRy5/uWeDc8vEiYyhC
         7eNhwgeDYpRiBhbWjluxFeRvVZgvcseOLD4sFGyxh8k+lM8ZFLs3C8V5LyuY2eJbedd2
         Kd963S0yof8Jp/SLKSQ9OE5Y9QMzxM0qMZyl6Tyr1h/goxFuGphHP+GDesi3Ix5diwVD
         XbffEYECaMQ51IkAmd5lAalxVBk4s4cIV7z603wmCkjnxiiiYuaIJgORZLH+Z4YUWOQt
         6c3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si19194799ejd.101.2019.07.31.12.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 12:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsuE9-0003c1-AY
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 15:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39313)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hsuDw-0003bo-AG
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 15:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hsuDu-0001VX-QC
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 15:25:20 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:39899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hsuDu-0001VL-KN
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 15:25:18 -0400
Received: by mail-ua1-f68.google.com with SMTP id j8so27402044uan.6
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 12:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+CbvwvbnfA818mkjtNcJHKeaTSPk5Cv2KGP0rJtEuwE=;
 b=ioXf5QpF9bbAsAPuhs8JhgpdhvD+0X/syw8lknrPmulN6M1LZUQnGojN/pqFbldfvW
 1vvk6ZU/YseX0pbDn7+MfAKfWVBlu7NkunCYRVZZ/SjVgmDiyPyoxLmx8NeczDo/5ngT
 jN3rPVy1MsKgYOGEG+bdOxkmJxALSN2eufmc34g2JRL+9F2aQJ7qPZ2o0UwYcChaf4Yf
 xrPcz6xQrSwO8IW76n9UVLHY/hzVIhXCo2sekNikDfS5BWsnsYms2NDh3uva5q0lz0Rj
 dTIeD4r2b5o7YHCuc5x+R0xfksKWmNbITgiyF98uwJceZaWvVE5XkQvQVcZwIpFIN7WG
 4Z5g==
X-Gm-Message-State: APjAAAWiJcLswJJvTdWCW3BKhAx8PEZMWKebGm+66StDu3T3Vj+geckr
 A22HMy9T30BCBNLmI04WgoPSbg==
X-Received: by 2002:a9f:3c24:: with SMTP id u36mr47313326uah.60.1564601117676; 
 Wed, 31 Jul 2019 12:25:17 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 m3sm18662671vkl.55.2019.07.31.12.25.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 12:25:16 -0700 (PDT)
Date: Wed, 31 Jul 2019 15:25:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20190731151834-mutt-send-email-mst@kernel.org>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-12-eric.auger@redhat.com>
 <20190730153628-mutt-send-email-mst@kernel.org>
 <AADFC41AFE54684AB9EE6CBC0274A5D19CAF8E1B@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19CAF8E1B@SHSMSX104.ccr.corp.intel.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.222.68
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 11/15] virtio-iommu: Expose the
 IOAPIC MSI reserved region when relevant
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRCySs1Vtclu

On Tue, Jul 30, 2019 at 11:20:44PM +0000, Tian, Kevin wrote:
> > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > Sent: Wednesday, July 31, 2019 3:38 AM
> > 
> > On Tue, Jul 30, 2019 at 07:21:33PM +0200, Eric Auger wrote:
> > > We introduce a new msi_bypass field which indicates whether
> > > the IOAPIC MSI window [0xFEE00000 - 0xFEEFFFFF] must be exposed
> 
> it's not good to call it IOAPIC MSI window. any write to this range, either
> from IOAPIC or PCI device, is interpreted by the platform as interrupt
> request. I'd call it "x86 interrupt address range".

Isn't this APIC_DEFAULT_ADDRESS? I'm not sure guests can't change it
even though I'm not sure qemu supports changing it.

And if so I'd say integrating IOAPIC defaults into the device itself is
inelegant.  How about having guest supply the range through config
space? It's a small change that won't be too late for Linux.

> > > as a reserved region. By default the field is set to true at
> > > instantiation time. Later on we will introduce a property at
> > > virtio pci proxy level to turn it off.
> > >
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > >
> > > ---
> > >
> > > v8 -> v9:
> > > - pass IOAPIC_RANGE_END to virtio_iommu_register_resv_region
> > > - take into account the change in the struct virtio_iommu_probe_resv_mem
> > >   definition
> > > - We just introduce the field here. A property will be introduced later on
> > >   at pci proxy level.
> > > ---
> > >  hw/virtio/virtio-iommu.c         | 36 ++++++++++++++++++++++++++++++++
> > >  include/hw/virtio/virtio-iommu.h |  1 +
> > >  2 files changed, 37 insertions(+)
> > >
> > > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > > index 66be9a4627..74038288b0 100644
> > > --- a/hw/virtio/virtio-iommu.c
> > > +++ b/hw/virtio/virtio-iommu.c
> > > @@ -39,6 +39,9 @@
> > >  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
> > >  #define VIOMMU_PROBE_SIZE 512
> > >
> > > +#define IOAPIC_RANGE_START      (0xfee00000)
> > > +#define IOAPIC_RANGE_END        (0xfeefffff)
> > > +
> > >  #define SUPPORTED_PROBE_PROPERTIES (\
> > >      1 << VIRTIO_IOMMU_PROBE_T_RESV_MEM)
> > >
> > 
> > Sorry where are these numbers coming from?
> 
> this is architecturally defined in x86 SDM.
> 
> > Does this really work on all platforms?
> 
> x86 only. 

But you seem to add this code for all platforms:

	@@ -6,6 +6,11 @@ config VIRTIO_RNG
	     default y
	     depends on VIRTIO

	+config VIRTIO_IOMMU
	+    bool
	+    default y
	+    depends on VIRTIO
	+    


> > With all guests?
> 
> yes.
> 
> > 
> > > @@ -100,6 +103,30 @@ static void
> > virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
> > >      ep->domain = NULL;
> > >  }
> > >
> > > +static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
> > > +                                              uint8_t subtype,
> > > +                                              uint64_t start, uint64_t end)
> > > +{
> > > +    viommu_interval *interval;
> > > +    struct virtio_iommu_probe_resv_mem *resv_reg_prop;
> > > +    size_t prop_size = sizeof(struct virtio_iommu_probe_resv_mem);
> > > +    size_t value_size = prop_size -
> > > +                sizeof(struct virtio_iommu_probe_property);
> > > +
> > > +    interval = g_malloc0(sizeof(*interval));
> > > +    interval->low = start;
> > > +    interval->high = end;
> > > +
> > > +    resv_reg_prop = g_malloc0(prop_size);
> > > +    resv_reg_prop->head.type = VIRTIO_IOMMU_PROBE_T_RESV_MEM;
> > > +    resv_reg_prop->head.length = cpu_to_le64(value_size);
> > > +    resv_reg_prop->subtype = cpu_to_le64(subtype);
> > > +    resv_reg_prop->start = cpu_to_le64(start);
> > > +    resv_reg_prop->end = cpu_to_le64(end);
> > > +
> > > +    g_tree_insert(ep->reserved_regions, interval, resv_reg_prop);
> > > +}
> > > +
> > >  static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> > >                                                    uint32_t ep_id)
> > >  {
> > > @@ -117,6 +144,12 @@ static viommu_endpoint
> > *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> > >      ep->reserved_regions =
> > g_tree_new_full((GCompareDataFunc)interval_cmp,
> > >                                              NULL, (GDestroyNotify)g_free,
> > >                                              (GDestroyNotify)g_free);
> > > +    if (s->msi_bypass) {
> > > +        virtio_iommu_register_resv_region(ep,
> > VIRTIO_IOMMU_RESV_MEM_T_MSI,
> > > +                                          IOAPIC_RANGE_START,
> > > +                                          IOAPIC_RANGE_END);
> > > +    }
> > > +
> > >      return ep;
> > >  }
> > >
> > > @@ -822,6 +855,9 @@ static void virtio_iommu_set_status(VirtIODevice
> > *vdev, uint8_t status)
> > >
> > >  static void virtio_iommu_instance_init(Object *obj)
> > >  {
> > > +    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
> > > +
> > > +    s->msi_bypass = true;
> > >  }
> > >
> > >  static const VMStateDescription vmstate_virtio_iommu = {
> > > diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-
> > iommu.h
> > > index f55f48d304..56c8b4e57f 100644
> > > --- a/include/hw/virtio/virtio-iommu.h
> > > +++ b/include/hw/virtio/virtio-iommu.h
> > > @@ -59,6 +59,7 @@ typedef struct VirtIOIOMMU {
> > >      GTree *domains;
> > >      QemuMutex mutex;
> > >      GTree *endpoints;
> > > +    bool msi_bypass;
> > >  } VirtIOIOMMU;
> > >
> > >  #endif
> > > --
> > > 2.20.1
