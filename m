Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2610725lfc;
        Sun, 15 Mar 2020 23:37:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vssGWORmC5+r5iLRZzGfOIzHujY4WpeEEbwBl6aTy9Syo7YbHrtLiHl3t6MHGxwdUrTrQAv
X-Received: by 2002:a0c:a8e9:: with SMTP id h41mr3788465qvc.235.1584340665862;
        Sun, 15 Mar 2020 23:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584340665; cv=none;
        d=google.com; s=arc-20160816;
        b=dMNVW6moeq6D7WbZhT6/UcEbbRdPKOsbiGsMG60tNQolPWjqbil1l290S2jcum93jW
         cVL26wgmWxaJuavBUJnA8UcZ94GuhJfJTKb5wCE98fKJ4yYvUfSxUSktd2bvj2dk951C
         thc8toM58eARXK4j0U/r0h3DbJN8D7SOgP0mFN6C1uT2eWhmJGPqRtWnwAbpBxzMudn4
         fV6KTre/UDbd1hZHZWRdonvMm+o53lEba+6zdAZ2aPVK6DgJz0HCacCuDmp/+LOjbhXU
         ihQIg0DFgxhxR0wcrVbJUQVCwMwOb3oD9mbrIqv5KlUm3fHpQ6+q6z0K3LGUuNPZFo/X
         DgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4YgX/s6fHjIAKpPmSFXCCFaxKCDlRywAxoxcnd6E5yw=;
        b=GcQkf0Zhjv5sosFlE/yYsbaa0wbQnOqU2j2IlW7pkBeVdlBOuaQhxxR7gHUUftzkFx
         IM0rgdO3d8irAQYRJg+PWOunOSPvhf7kPpLIhokGyEAh9ugeVP1E7bU5O/jkUfjzCQjt
         4r/VldO0FWiQBpeXELsTQHJA1VyJRZwXEZLhk/VBYiXSKBToj9nlJoqoCpAg4sd10yMo
         1piMSPHR1nlR23OLptI7jLcFRI8CXBsGWN+bTResRxdi2MoiZNDyNo2XwxA+LVOIpY1r
         FSywCryHem6rgOD0ObPy2ORFiL+JbQQ4cnho7PsvLojIH2bPEZrXpVvdwAWX+qhx/R0B
         v5JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s96vncvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si9889914qtg.139.2020.03.15.23.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 23:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s96vncvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDjNg-0005nR-Tx
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 02:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharatb.linux@gmail.com>) id 1jDjMv-0005mh-5e
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 02:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharatb.linux@gmail.com>) id 1jDjMt-0008Hn-DX
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 02:36:57 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:38398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bharatb.linux@gmail.com>)
 id 1jDjMp-0007Oe-I3; Mon, 16 Mar 2020 02:36:51 -0400
Received: by mail-qk1-x741.google.com with SMTP id h14so24290803qke.5;
 Sun, 15 Mar 2020 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YgX/s6fHjIAKpPmSFXCCFaxKCDlRywAxoxcnd6E5yw=;
 b=s96vncvGE4/pPqr7x8HHNo+EUqIcKAwRQwfPMHrNAdxlKHUofwOMgGbVSTXc4I3HS7
 FnXb+3gkL5zrgFt238vRC3Wno9VVpDKXRUkr5bKzCz7+z1t0x3GaRfhflGIUEuJiqiat
 u6ZuSQdauwft7WM6XjRLSdRV7CIkNZuF3E/3LGhIwP2411EFmHfgjbLFGnkpyOFcuM65
 tZuLLBVwkF4JBIDQvM17dlwEOfnPckqIw9T7GcRM9U/aUGFAMkPWC4pZFKLsIChtpdfZ
 aJsO+4mchUbPyTvR4V+gwCgCEYj+uhPgNbFINe/9zNF80HFttLybjYixct44aNDfqtm6
 E9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YgX/s6fHjIAKpPmSFXCCFaxKCDlRywAxoxcnd6E5yw=;
 b=QzmzV+dH6woXqlYIL4/QLRpJQXpyM2nGbbUccZ2Pw6Q3nIDQVxcaLgSeL1a9wPp7oy
 yR6a2nZISdLZ1q3uqVVRj8Iml77nATNB4MW1ErL66FU9kN4vkz0Z2a9xk2nJNHaEhhbB
 rPf0AAngRPvRlVLGHQkZ96E1Rn7mQawJfvjhKD+bQrWzK8sDQzRWLd8yoKHIJqDMwFrw
 dgvtXIFK9jXvQdhV3XJdihDB2gombtVSagKWnqaKWvW9sLQeT5HFmpI60QxjXyI7FvZk
 wB/pjcpAV+lw/OQ/vS8tqjhWaHpfUgUHuwCKZ+ufOVwtvr38dit3MsGtyto1CPQhRLEL
 eJiA==
X-Gm-Message-State: ANhLgQ3GLR4cP/yfrY/WREWY/nq/G/Kdh2vfxD6nTFZpzST7KBLCvx/1
 N3tN79F0uWZDVDd7LmCxysHE/mSJC77IqulSQVk=
X-Received: by 2002:a37:85c2:: with SMTP id
 h185mr24573070qkd.446.1584340602241; 
 Sun, 15 Mar 2020 23:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200313074811.27175-1-bbhushan2@marvell.com>
 <20200313074811.27175-3-bbhushan2@marvell.com>
 <369b162f-3a0c-6861-0737-96aa8914b915@redhat.com>
In-Reply-To: <369b162f-3a0c-6861-0737-96aa8914b915@redhat.com>
From: Bharat Bhushan <bharatb.linux@gmail.com>
Date: Mon, 16 Mar 2020 12:06:31 +0530
Message-ID: <CAAeCc_mEoFLUux6mScyCbA_9n9eJf7Tt9tGrGOG-ENN5Kmr_7A@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] virtio-iommu: Add iommu notifier for map/unmap
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
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
X-TUID: vdspf4EJDm8p

Hi Eric,

On Fri, Mar 13, 2020 at 7:55 PM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Bharat,
> On 3/13/20 8:48 AM, Bharat Bhushan wrote:
> > This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request to
> > notify registered iommu-notifier. Which will call vfio
> s/iommu-notifier/iommu-notifiers
> > notifier to map/unmap region in iommu.
> can be any notifier (vhost/vfio).
> >
> > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > ---
> >  hw/virtio/trace-events           |  2 +
> >  hw/virtio/virtio-iommu.c         | 66 +++++++++++++++++++++++++++++++-
> >  include/hw/virtio/virtio-iommu.h |  6 +++
> >  3 files changed, 73 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index e83500bee9..d94a1cd8a3 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -73,3 +73,5 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
> >  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
> >  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
> >  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
> > +virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
> > +virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index 4cee8083bc..e51344a53e 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -123,6 +123,38 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
> >      }
> >  }
> >
> > +static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
> > +                                    hwaddr paddr, hwaddr size)
> > +{
> > +    IOMMUTLBEntry entry;
> > +
> > +    entry.target_as = &address_space_memory;
> > +    entry.addr_mask = size - 1;
> > +
> > +    entry.iova = iova;
> > +    trace_virtio_iommu_notify_map(mr->parent_obj.name, iova, paddr, size);
> > +    entry.perm = IOMMU_RW;
> > +    entry.translated_addr = paddr;
> > +
> > +    memory_region_notify_iommu(mr, 0, entry);
> > +}
> > +
> > +static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
> > +                                      hwaddr size)
> > +{
> > +    IOMMUTLBEntry entry;
> > +
> > +    entry.target_as = &address_space_memory;
> > +    entry.addr_mask = size - 1;
> > +
> > +    entry.iova = iova;
> > +    trace_virtio_iommu_notify_unmap(mr->parent_obj.name, iova, size);
> > +    entry.perm = IOMMU_NONE;
> > +    entry.translated_addr = 0;
> > +
> > +    memory_region_notify_iommu(mr, 0, entry);
> > +}
> > +
> >  static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
> >  {
> >      if (!ep->domain) {
> > @@ -307,9 +339,12 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >      uint64_t virt_start = le64_to_cpu(req->virt_start);
> >      uint64_t virt_end = le64_to_cpu(req->virt_end);
> >      uint32_t flags = le32_to_cpu(req->flags);
> > +    hwaddr size = virt_end - virt_start + 1;
> > +    VirtioIOMMUNotifierNode *node;
> >      VirtIOIOMMUDomain *domain;
> >      VirtIOIOMMUInterval *interval;
> >      VirtIOIOMMUMapping *mapping;
> > +    VirtIOIOMMUEndpoint *ep;
> >
> >      if (flags & ~VIRTIO_IOMMU_MAP_F_MASK) {
> >          return VIRTIO_IOMMU_S_INVAL;
> > @@ -339,9 +374,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >
> >      g_tree_insert(domain->mappings, interval, mapping);
> >
> > +    /* All devices in an address-space share mapping */
> > +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
> > +            if (ep->id == node->iommu_dev->devfn) {
> > +                virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
> > +                                        virt_start, phys_start, size);
> > +            }
> > +        }
> > +    }
> > +
> >      return VIRTIO_IOMMU_S_OK;
> >  }
> >
> > +static void virtio_iommu_remove_mapping(VirtIOIOMMU *s, VirtIOIOMMUDomain *domain,
> > +                                        VirtIOIOMMUInterval *interval)
> > +{
> > +    VirtioIOMMUNotifierNode *node;
> > +    VirtIOIOMMUEndpoint *ep;
> > +
> > +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
> > +            if (ep->id == node->iommu_dev->devfn) {
> > +                virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr,
> > +                                          interval->low,
> > +                                          interval->high - interval->low + 1);
> > +            }
> > +        }
> > +    }
> > +    g_tree_remove(domain->mappings, (gpointer)(interval));
> > +}
> What about virtio_iommu_put_domain() where you destroy the mapping
> gtree. I guess you also need to send invalidations there?

In virtio_iommu_put_domain(), before destroying domain->mappings we
are calling virtio_iommu_detach_endpoint_from_domain(), which send
invalidations, no ?

> > +
> >  static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >                                struct virtio_iommu_req_unmap *req)
> >  {
> > @@ -368,7 +431,7 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >          uint64_t current_high = iter_key->high;
> >
> >          if (interval.low <= current_low && interval.high >= current_high) {
> > -            g_tree_remove(domain->mappings, iter_key);
> > +            virtio_iommu_remove_mapping(s, domain, iter_key);
> >              trace_virtio_iommu_unmap_done(domain_id, current_low, current_high);
> >          } else {
> >              ret = VIRTIO_IOMMU_S_RANGE;
> > @@ -655,6 +718,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> >      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
> >
> > +    QLIST_INIT(&s->notifiers_list);
> >      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> >                  sizeof(struct virtio_iommu_config));
> >
> > diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> > index 6f67f1020a..4539c8ae72 100644
> > --- a/include/hw/virtio/virtio-iommu.h
> > +++ b/include/hw/virtio/virtio-iommu.h
> > @@ -44,6 +44,11 @@ typedef struct IOMMUPciBus {
> >      IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
> >  } IOMMUPciBus;
> >
> > +typedef struct VirtioIOMMUNotifierNode {
> > +    IOMMUDevice *iommu_dev;
> > +    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
> > +} VirtioIOMMUNotifierNode;
> You may use scripts/git.orderfile for a better diff ordering.

ok, run "git config diff.orderFile scripts/git.orderfile"

> > +
> >  typedef struct VirtIOIOMMU {
> >      VirtIODevice parent_obj;
> >      VirtQueue *req_vq;
> > @@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
> >      GTree *domains;
> >      QemuMutex mutex;
> >      GTree *endpoints;
> > +    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
> See what was done in smmuv3 and intel. We now directly use a list of
> IOMMUDevice directly. VirtioIOMMUNotifierNode does not bring anything extra.

ok,

Thanks
-Bharat

> >  } VirtIOIOMMU;
> >
> >  #endif
> >
>
> Thanks
>
> Eric
>
