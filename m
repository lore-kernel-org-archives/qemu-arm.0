Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1172861lfi;
        Mon, 23 Mar 2020 01:43:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvIgtOMSJr3uKcMX96Eg/Y/UN/MV5hRul9+FDtHHxqMCCTgk5RqHefGcgvGkcnEZepsaTAg
X-Received: by 2002:a37:a89:: with SMTP id 131mr8263567qkk.137.1584953018085;
        Mon, 23 Mar 2020 01:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953018; cv=none;
        d=google.com; s=arc-20160816;
        b=zFqvtFEnoqsSXnMeMGJb4fIX+IWlW/ZgVYtStZAFn+LhlpRBurPU4z8clDH17Qnm5N
         PJznxPc/Ob3xq1V4g/S1GfcoEhxGntBKnhJqERn9pxRyeQFVFmpNn+iPRDwvWCdDG69i
         G+VxUCJRZM1HoBT+SseG/TbzGqwnFJi7bPzLOx4LJazE6yX0sd/WskfExsMkgun4BrLW
         qMsbuYCddJxoE/zI2mk760g4n7/UBQKG/W8hmKaE2lief5furbtluKYfU+EYatk3QRbE
         6K/DBUoLDxmneBTdxykBaSDV6TWhgVtOD6rju4UB6htmIPvvUw7YcZDoutTAGfJTJ9QO
         Ubgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7OcFTB2KbnTgJqYJ3I8tRvFdDgVPyjMvLszgu2VeGrs=;
        b=tjXv1FBBj07x483Qez6Id6FIiZm2thIgkNjERQ8ATHQ6yepcUSc/PjgiIla2CT+FmF
         qXQKggPljmjXOo9LOuyb2E04hjSY9NPPUYzdINsaCc/poF8GIfgLI9+cLXBhiN3+p2Cs
         dORpFcaxHZ+5YJgbRZDCf5jEgq49ZmtQQhzKQlOyLWo7w5xANhy+Pr+Q4uyE2g1F8BgQ
         GV/CNNRb1plGiTnlJr1kHkLYA3DDWCMUrkFAll7hi9GTn+GxZ9/EpsDkFqZIF5Z0fF1V
         d4Arj9TnFxeMQsp0s65RAkG0rpQJ8eDA7E1i01F7ve2XcklEoju5ItfH4WbW8dxFvZ0v
         Irgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IQZ9tHJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si7500756qto.215.2020.03.23.01.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IQZ9tHJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIgL-0005w4-GG
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47973)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharatb.linux@gmail.com>) id 1jGIgD-0005tE-4f
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharatb.linux@gmail.com>) id 1jGIgC-0001qB-2W
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:43:29 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:35082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bharatb.linux@gmail.com>)
 id 1jGIg9-0001pJ-Nn; Mon, 23 Mar 2020 04:43:25 -0400
Received: by mail-qk1-x744.google.com with SMTP id k13so2673008qki.2;
 Mon, 23 Mar 2020 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OcFTB2KbnTgJqYJ3I8tRvFdDgVPyjMvLszgu2VeGrs=;
 b=IQZ9tHJIGmF0j+AMfuxYyrsJRjRzWP4F7VDevtEw+vLOSk2iUL2nVOXD3oGV15cqlO
 9bdzu407oRhNnGZlpKb7DFcv6Htf3VtoZAPibDIcd1VqQVp6hlqwzwu6Ox1/Gj+NKTKm
 hJAQPI/BODq264AVYCuBBoXdbO4F+M5qNTcxescM5vXq0ua2RQ/tOawv7nZK/l7v7ebn
 4jdlnrwNFTJUsPJGvvPQvqt6zmAfSS/+U7iXGbc4s6vFrB97t11+vatPvJjay3/buMk9
 vwLL81ognxcRG9QRnld6jlyKR0HZyuksf0BgOFej3V0ckpU/RgjjJ/6pvuoI3H/ZtbN7
 PuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OcFTB2KbnTgJqYJ3I8tRvFdDgVPyjMvLszgu2VeGrs=;
 b=TeS9AaegVdLZGB/YToF46ipcS3I9lwj/Htm6sw0BOvZzumxAX1o6XBX7CXCpbT+OTz
 nXANucoyt3X49/VBRziNm1wAGog6VadwQydzOX+DjN+EucFS35fhi2AQNpdPdlqaKuTF
 paZB0JvVEx/0pctEcSsQIlqCNzEiJSoAd/5n1g4BkJPHWZO6QvyIGwN5koRx/GDT4VGN
 IwrpkWwE27DWsapnFUyF1RpLjYgYn849jHMU4n9l7/5zidDBg3PRqVGVHXPEXtP/rD5t
 jp1sggSOYMLsQ3KMOmG3yGv83QC1jlzPFcbwTm/m1GC8vXFemErH2Lxlmo2GJtStf7O2
 IzAA==
X-Gm-Message-State: ANhLgQ282do0+UwRAWU8jm5vVBbBEYtRvB3UDgLHGidIxLcVwsJxHTXM
 2gk7jRK81eX31Ou2WIuOUfEDCqkqG7jqXWCg4qA=
X-Received: by 2002:a05:620a:7f8:: with SMTP id
 k24mr19755001qkk.228.1584953004888; 
 Mon, 23 Mar 2020 01:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200318101159.8767-1-bbhushan2@marvell.com>
 <20200318101159.8767-5-bbhushan2@marvell.com>
 <3da60c1b-6897-7ab1-3a67-bec44fa00a54@redhat.com>
 <CAAeCc_nVJXsvEw6iqcs9UEvLJNFyPmHnPnN0VUvzUFtVvjCQsQ@mail.gmail.com>
In-Reply-To: <CAAeCc_nVJXsvEw6iqcs9UEvLJNFyPmHnPnN0VUvzUFtVvjCQsQ@mail.gmail.com>
From: Bharat Bhushan <bharatb.linux@gmail.com>
Date: Mon, 23 Mar 2020 14:13:13 +0530
Message-ID: <CAAeCc_kyXE6SpYpv=yJWKtNaE=0_OvP-uH3gipEeNm7as8e1gw@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] virtio-iommu: set supported page size mask
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: "Zhong, Yang" <yang.zhong@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, drjones@redhat.com, peterx@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, linuc.decode@gmail.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aw/tGIGj4OXo

Hi Eric/Jean,

On Wed, Mar 18, 2020 at 8:05 PM Bharat Bhushan <bharatb.linux@gmail.com> wrote:
>
> Hi Eric,
>
> On Wed, Mar 18, 2020 at 4:58 PM Auger Eric <eric.auger@redhat.com> wrote:
> >
> > Hi Bharat,
> >
> > On 3/18/20 11:11 AM, Bharat Bhushan wrote:
> > > Add optional interface to set page size mask.
> > > Currently this is set global configuration and not
> > > per endpoint.
> > >
> > > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > > ---
> > > v7->v8:
> > >  - new patch
> > >
> > >  hw/virtio/virtio-iommu.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > > index 4cee8083bc..c00a55348d 100644
> > > --- a/hw/virtio/virtio-iommu.c
> > > +++ b/hw/virtio/virtio-iommu.c
> > > @@ -650,6 +650,15 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
> > >      return (ua > ub) - (ua < ub);
> > >  }
> > >
> > > +static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
> > > +                                            uint64_t page_size_mask)
> > > +{
> > > +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> > > +    VirtIOIOMMU *s = sdev->viommu;
> > > +
> > > +    s->config.page_size_mask = page_size_mask;
> > The problem is page_size_mask is global to the VIRTIO-IOMMU.
> >
> > - Can't different VFIO containers impose different/inconsistent settings?
> > - VFIO devices can be hotplugged.
>
> This is possible if we different iommu's, which we support. correct?
>
> > So we may start with some default
> > page_size_mask which is latter overriden by a host imposed one. Assume
> > you first launch the VM with a virtio NIC. This uses 64K. Then you
> > hotplug a VFIO device behind a physical IOMMU which only supports 4K
> > pages. Isn't it a valid scenario?
>
> So we need to expose page_size_mask per endpoint?

Just sent Linux RFC patch to use page-size-mask per endpoint.
QEMU changes are also ready, will share soon.

Thanks
-Bharat

>
> Thanks
> -Bharat
>
> >
> > Thanks
> >
> > Eric
> >
> > > +}
> > > +
> > >  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> > >  {
> > >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > > @@ -865,6 +874,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
> > >      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
> > >
> > >      imrc->translate = virtio_iommu_translate;
> > > +    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
> > >  }
> > >
> > >  static const TypeInfo virtio_iommu_info = {
> > >
> >
