Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2614550lfc;
        Sun, 15 Mar 2020 23:42:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbBRnhc6bA/SQQJR5JjrwpdsjUY6+ogNhB4a94KAW64hSsw6FI2cwaa3mTvmgSuAkP2jdT
X-Received: by 2002:a37:5b82:: with SMTP id p124mr18067259qkb.130.1584340944983;
        Sun, 15 Mar 2020 23:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584340944; cv=none;
        d=google.com; s=arc-20160816;
        b=ZapSm7eOpe+JVPSQJpu9g84wOYv/uZka5jxltFJsrSvHfQIIZGoJaGysWT0Qne938V
         J/J/Uz5AFxNAlhHqwuIj0ZgEnq94gb21KU+XbKIu1uBLQFsoue+fWDjcV8tp0F+bp8xB
         GMeYanrpEhGM+BweK/ISEKGn3c0cUOZvi48QxduCnT5fnba2rXb+9LhopvIJ2xLp07cQ
         eTF+j6UuTHTRe7ptt6qh/KvDvgcneB1xYCEdPHDpoL7Cn6cFLe529y6ycmlroLrgMOqW
         pWL1QOlKama7a3mfDPKOrcM5eGz8oobR6H0VaPDvWfqpDDTtqeV1N4TwJET2x60On6e1
         NTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jHrIFWBUYTbisZLiMXCYNj6xT1LOq7327qexPzoyprU=;
        b=A53Eia6lKAxWmx1wSLvWcxf1mJkPPq2ldpt9ViBkanLiGPRNCq89F5QgGAYLU7VOwV
         Ya6ZI9TimiLicorNHa82LCUprINxNP1PUTu05DNTc3vH0vrw4BqbdlvDnJD+o0sa9tGm
         TFwO/jzXlzTMz1Pj+jxV4hmcsQgIhpa1cCn8M7khz0APwZcqjNJiI/ctMeyW1PiF563S
         Koi5xQujVifLoXvNY3PmrQ9/bF1C16imbwoayNQ91K0J0pjFv19Y+gablhLTfLIrlNRp
         3SoZeivWQUhmvcZYSM+PEk4IFd8Ere1hiJFoMt4MbEGbxAei+cebnW0eLsJ/uJCkiMMe
         uklw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SkFHmJxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si1669158qkn.377.2020.03.15.23.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 23:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SkFHmJxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDjSC-0007AM-32
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 02:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54401)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharatb.linux@gmail.com>) id 1jDjRS-00079I-Hw
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 02:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharatb.linux@gmail.com>) id 1jDjRR-0007wB-8J
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 02:41:38 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41403)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bharatb.linux@gmail.com>)
 id 1jDjRN-00078k-Nk; Mon, 16 Mar 2020 02:41:33 -0400
Received: by mail-qk1-x742.google.com with SMTP id s11so12985389qks.8;
 Sun, 15 Mar 2020 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHrIFWBUYTbisZLiMXCYNj6xT1LOq7327qexPzoyprU=;
 b=SkFHmJxFDXomPNsVp6v6tnXhIehgkKu+faslmL1lYDVZqy5jbBq7yKb3tg6RBRaWG0
 bGQBEe1dFBT0faZ5LFGt5ptkHzKYaOFGKKy0U8glbQKxuuBer78cGI/NWIQwH6n7Me2Q
 oeAM9767yoYZjIrNax9Psh9eVGqsEmRiQgNhfNjMp90paLEVii+xXkfB/57nTwGcEgYe
 nqYIgV79VyuZH9yPklKHLSgHBQWtUb9Wz8hAV6JrwmhVoiKPtpEvmfQlxbhSddh0S5bf
 CDInQfDDKcmMxwKDLmm78f8+WQVmNk3TFnMA+ftWitGURFg2Z5GsCxMQvGVYNGegt4c2
 48ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHrIFWBUYTbisZLiMXCYNj6xT1LOq7327qexPzoyprU=;
 b=hNN0ul0w0hX9JbGjdJ8U8uwIqkPxbw2/j66Wq2ew8Whn0wuzC7q/1PsVEks7qkCOp/
 SotcP5v8+ds8tr8GeyRJmkvGe4YyFHKSo6tGMtEEuQsv4Mq0FTJlkIo02XE6lZHkVD1k
 +habgBKTOeA3uW2V5/kSk/u3iOzztfJuwT4CY+YktFjzzLs1AbEvxodzoTEnNB3o02ju
 8G+zohs/QOJOA0pp7prcj95L2GpKJwvBK6KlSANhY1PeQh93TG+tu6dCpyErAj29PfTY
 WSiscmLz3akqLZVGYjMAED0WCgFzV3icJMPPV0hY4PX4z70dGjQ0atYH2CwlYaoXOo2p
 HLHg==
X-Gm-Message-State: ANhLgQ0inhxVPelkA78weHPsjb4kVsmjQZ9Gtx8NH9bc7j8M/G0VUmJK
 NXuWieqvV/xEELZZFuaPdtXj2oVHbNvE/dfhv7k=
X-Received: by 2002:a05:620a:22b:: with SMTP id
 u11mr24574374qkm.225.1584340892917; 
 Sun, 15 Mar 2020 23:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200313074811.27175-1-bbhushan2@marvell.com>
 <20200313074811.27175-4-bbhushan2@marvell.com>
 <da0a4d7b-c27d-839d-56b6-da67c94adeb7@redhat.com>
In-Reply-To: <da0a4d7b-c27d-839d-56b6-da67c94adeb7@redhat.com>
From: Bharat Bhushan <bharatb.linux@gmail.com>
Date: Mon, 16 Mar 2020 12:11:21 +0530
Message-ID: <CAAeCc_m=PKV0T8DmaE06F9NMYfU792f9TDdoyKkaPaEN3597ag@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for attach/detach
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
 mst@redhat.com, drjones@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, qemu-arm@nongnu.org,
 Bharat Bhushan <bbhushan2@marvell.com>, linuc.decode@gmail.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCuMI1Tbj3av

Hi Eric,

On Fri, Mar 13, 2020 at 8:11 PM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Bharat
>
> On 3/13/20 8:48 AM, Bharat Bhushan wrote:
> > iommu-notifier are called when a device is attached
> IOMMU notifiers
> > or detached to as address-space.
> > This is needed for VFIO.
> and vhost for detach
> >
> > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > ---
> >  hw/virtio/virtio-iommu.c | 47 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index e51344a53e..2006f72901 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -49,6 +49,7 @@ typedef struct VirtIOIOMMUEndpoint {
> >      uint32_t id;
> >      VirtIOIOMMUDomain *domain;
> >      QLIST_ENTRY(VirtIOIOMMUEndpoint) next;
> > +    VirtIOIOMMU *viommu;
> This needs specal care on post-load. When migrating the EPs, only the id
> is migrated. On post-load you need to set viommu as it is done for
> domain. migration is allowed with vhost.

ok, I have not tried vhost/migration. Below change set viommu when
reconstructing endpoint.

@@ -984,6 +973,7 @@ static gboolean reconstruct_endpoints(gpointer
key, gpointer value,

     QLIST_FOREACH(iter, &d->endpoint_list, next) {
         iter->domain = d;
+       iter->viommu = s;
         g_tree_insert(s->endpoints, GUINT_TO_POINTER(iter->id), iter);
     }
     return false; /* continue the domain traversal */

> >  } VirtIOIOMMUEndpoint;
> >
> >  typedef struct VirtIOIOMMUInterval {
> > @@ -155,8 +156,44 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
> >      memory_region_notify_iommu(mr, 0, entry);
> >  }
> >
> > +static gboolean virtio_iommu_mapping_unmap(gpointer key, gpointer value,
> > +                                           gpointer data)
> > +{
> > +    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
> > +    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
> > +
> > +    virtio_iommu_notify_unmap(mr, interval->low,
> > +                              interval->high - interval->low + 1);
> > +
> > +    return false;
> > +}
> > +
> > +static gboolean virtio_iommu_mapping_map(gpointer key, gpointer value,
> > +                                         gpointer data)
> > +{
> > +    VirtIOIOMMUMapping *mapping = (VirtIOIOMMUMapping *) value;
> > +    VirtIOIOMMUInterval *interval = (VirtIOIOMMUInterval *) key;
> > +    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
> > +
> > +    virtio_iommu_notify_map(mr, interval->low, mapping->phys_addr,
> > +                            interval->high - interval->low + 1);
> > +
> > +    return false;
> > +}
> > +
> >  static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
> >  {
> > +    VirtioIOMMUNotifierNode *node;
> > +    VirtIOIOMMU *s = ep->viommu;
> > +    VirtIOIOMMUDomain *domain = ep->domain;
> > +
> > +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +        if (ep->id == node->iommu_dev->devfn) {
> > +            g_tree_foreach(domain->mappings, virtio_iommu_mapping_unmap,
> > +                           &node->iommu_dev->iommu_mr);
> I understand this should fo the job for domain removal

did not get the comment, are you saying we should do this on domain removal?

> > +        }
> > +    }
> > +
> >      if (!ep->domain) {
> >          return;
> >      }
> > @@ -178,6 +215,7 @@ static VirtIOIOMMUEndpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> >      }
> >      ep = g_malloc0(sizeof(*ep));
> >      ep->id = ep_id;
> > +    ep->viommu = s;
> >      trace_virtio_iommu_get_endpoint(ep_id);
> >      g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
> >      return ep;
> > @@ -272,6 +310,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >  {
> >      uint32_t domain_id = le32_to_cpu(req->domain);
> >      uint32_t ep_id = le32_to_cpu(req->endpoint);
> > +    VirtioIOMMUNotifierNode *node;
> >      VirtIOIOMMUDomain *domain;
> >      VirtIOIOMMUEndpoint *ep;
> >
> > @@ -299,6 +338,14 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >
> >      ep->domain = domain;
> >
> > +    /* Replay existing address space mappings on the associated memory region */
> maybe use the "domain" terminology here.

ok,

Thanks
-Bharat

> > +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +        if (ep_id == node->iommu_dev->devfn) {
> > +            g_tree_foreach(domain->mappings, virtio_iommu_mapping_map,
> > +                           &node->iommu_dev->iommu_mr);
> > +        }
> > +    }
> > +
> >      return VIRTIO_IOMMU_S_OK;
> >  }
> >
> >
> Thanks
>
> Eric
>
