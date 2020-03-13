Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2205384lfc;
        Fri, 13 Mar 2020 07:25:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtyzOIxVbn38hsIxGPCRgDk5K/ps+/3dWKP9sh6B07e72YHkrycfLRnscSbicR0NjrI5dia
X-Received: by 2002:a37:812:: with SMTP id 18mr12559799qki.139.1584109549580;
        Fri, 13 Mar 2020 07:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584109549; cv=none;
        d=google.com; s=arc-20160816;
        b=U/N7gNh0sONAZFxtngS5In0D2VJi8ITja/V1kf4KmzPLSvlF+Pb6JbPP8mInHUTfoa
         41pGn0amAovuUegjYE98SVRv5I9aGWldSAEbiVlwDz/z9jTtSWCK9LVRotykXqKEcgW8
         GXA3BHdAoP2yz8HVcDXKGhONrUP+n7RnxdsO5o16Jejx9HXbTtaA/AsIg9PYNsMXdve2
         oBNfhvG3EALAM8pJ19+XPnaS+qR7Wsxkc1ki5fPIkU77xcDJGGQM/L5zRgo8Uucp0/c4
         uiM/mR1znIP4KRlVGw/Ni+ADOeJggiptz7FbC9cGzuHhNdDGJ9Pi6avoV81hOTfILBMo
         BhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AMwHb4K8T3L+BBa95qgJaRfxhYeRkcOh+68pFgugpk8=;
        b=oSh9iY7SA+JJBZO211dURfjkI5z6l91a6dasVFvxUqRSiggDiKSgM5gnY58oF0abzN
         8g7mSxwKgbM/Q+uqLNObq1LVQiHhySdiWsOqyCo9dxpS4JnMAvmd2xruKctekAVjnRFx
         QszCdXntNV+0s/YmHw6kw4e2VrdTrvP4cCqP0G37cXYVTvHQ4+CeDwEGjXPEcxAK985j
         y1LjHWRtdsnDGKeJyyP9nMh+d1iukZtJr2K2QHx+aEYHo2Fxt+xfkKaeuTCyhXYnB1OI
         WTKLYet65N8rdQde9gSXTiNKJv3+52EPhIydfvEQvjBc/2N7TlDnqjiGXH1Eb/UhuZdz
         tisA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hYFg4NAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si1376661qvn.52.2020.03.13.07.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hYFg4NAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClG0-0006Qm-S6
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jClFr-0006QS-8g
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jClFm-0005W1-Fv
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:25:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30466
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jClFl-0005P8-V9
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584109529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMwHb4K8T3L+BBa95qgJaRfxhYeRkcOh+68pFgugpk8=;
 b=hYFg4NADGArilUW6iPk36gdxM6QJQDX8ZDuRYJDlXSGqxZE7/pJR7jG5R9gjw0S8vo132c
 St5/sD0YTZpOjEQcGGoVLaj6YISXHSh0ULYyiggU3KkfWjJknv8rcBWEYA/kkKXpXapGIW
 YMSu5y9cks832g8HRhuH9A6BabgMFjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-INS1YWi_Mviw3BX1uOfbCA-1; Fri, 13 Mar 2020 10:25:27 -0400
X-MC-Unique: INS1YWi_Mviw3BX1uOfbCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 121E0801E74;
 Fri, 13 Mar 2020 14:25:26 +0000 (UTC)
Received: from [10.36.118.12] (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CDE43AA;
 Fri, 13 Mar 2020 14:25:12 +0000 (UTC)
Subject: Re: [PATCH v7 2/5] virtio-iommu: Add iommu notifier for map/unmap
To: Bharat Bhushan <bbhushan2@marvell.com>, peter.maydell@linaro.org,
 peterx@redhat.com, eric.auger.pro@gmail.com, alex.williamson@redhat.com,
 kevin.tian@intel.com, mst@redhat.com, tnowicki@marvell.com,
 drjones@redhat.com, linuc.decode@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, bharatb.linux@gmail.com
References: <20200313074811.27175-1-bbhushan2@marvell.com>
 <20200313074811.27175-3-bbhushan2@marvell.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <369b162f-3a0c-6861-0737-96aa8914b915@redhat.com>
Date: Fri, 13 Mar 2020 15:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200313074811.27175-3-bbhushan2@marvell.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zb3D5lmWX1Pj

Hi Bharat,
On 3/13/20 8:48 AM, Bharat Bhushan wrote:
> This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request to
> notify registered iommu-notifier. Which will call vfio
s/iommu-notifier/iommu-notifiers
> notifier to map/unmap region in iommu.
can be any notifier (vhost/vfio).
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/trace-events           |  2 +
>  hw/virtio/virtio-iommu.c         | 66 +++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-iommu.h |  6 +++
>  3 files changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index e83500bee9..d94a1cd8a3 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -73,3 +73,5 @@ virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=%d"
>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=%d"
>  virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>  virtio_iommu_report_fault(uint8_t reason, uint32_t flags, uint32_t endpoint, uint64_t addr) "FAULT reason=%d flags=%d endpoint=%d address =0x%"PRIx64
> +virtio_iommu_notify_map(const char *name, uint64_t iova, uint64_t paddr, uint64_t map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64
> +virtio_iommu_notify_unmap(const char *name, uint64_t iova, uint64_t map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 4cee8083bc..e51344a53e 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -123,6 +123,38 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>      }
>  }
>  
> +static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
> +                                    hwaddr paddr, hwaddr size)
> +{
> +    IOMMUTLBEntry entry;
> +
> +    entry.target_as = &address_space_memory;
> +    entry.addr_mask = size - 1;
> +
> +    entry.iova = iova;
> +    trace_virtio_iommu_notify_map(mr->parent_obj.name, iova, paddr, size);
> +    entry.perm = IOMMU_RW;
> +    entry.translated_addr = paddr;
> +
> +    memory_region_notify_iommu(mr, 0, entry);
> +}
> +
> +static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
> +                                      hwaddr size)
> +{
> +    IOMMUTLBEntry entry;
> +
> +    entry.target_as = &address_space_memory;
> +    entry.addr_mask = size - 1;
> +
> +    entry.iova = iova;
> +    trace_virtio_iommu_notify_unmap(mr->parent_obj.name, iova, size);
> +    entry.perm = IOMMU_NONE;
> +    entry.translated_addr = 0;
> +
> +    memory_region_notify_iommu(mr, 0, entry);
> +}
> +
>  static void virtio_iommu_detach_endpoint_from_domain(VirtIOIOMMUEndpoint *ep)
>  {
>      if (!ep->domain) {
> @@ -307,9 +339,12 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>      uint64_t virt_start = le64_to_cpu(req->virt_start);
>      uint64_t virt_end = le64_to_cpu(req->virt_end);
>      uint32_t flags = le32_to_cpu(req->flags);
> +    hwaddr size = virt_end - virt_start + 1;
> +    VirtioIOMMUNotifierNode *node;
>      VirtIOIOMMUDomain *domain;
>      VirtIOIOMMUInterval *interval;
>      VirtIOIOMMUMapping *mapping;
> +    VirtIOIOMMUEndpoint *ep;
>  
>      if (flags & ~VIRTIO_IOMMU_MAP_F_MASK) {
>          return VIRTIO_IOMMU_S_INVAL;
> @@ -339,9 +374,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>  
>      g_tree_insert(domain->mappings, interval, mapping);
>  
> +    /* All devices in an address-space share mapping */
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
> +            if (ep->id == node->iommu_dev->devfn) {
> +                virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
> +                                        virt_start, phys_start, size);
> +            }
> +        }
> +    }
> +
>      return VIRTIO_IOMMU_S_OK;
>  }
>  
> +static void virtio_iommu_remove_mapping(VirtIOIOMMU *s, VirtIOIOMMUDomain *domain,
> +                                        VirtIOIOMMUInterval *interval)
> +{
> +    VirtioIOMMUNotifierNode *node;
> +    VirtIOIOMMUEndpoint *ep;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        QLIST_FOREACH(ep, &domain->endpoint_list, next) {
> +            if (ep->id == node->iommu_dev->devfn) {
> +                virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr,
> +                                          interval->low,
> +                                          interval->high - interval->low + 1);
> +            }
> +        }
> +    }
> +    g_tree_remove(domain->mappings, (gpointer)(interval));
> +}
What about virtio_iommu_put_domain() where you destroy the mapping
gtree. I guess you also need to send invalidations there?
> +
>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
>                                struct virtio_iommu_req_unmap *req)
>  {
> @@ -368,7 +431,7 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>          uint64_t current_high = iter_key->high;
>  
>          if (interval.low <= current_low && interval.high >= current_high) {
> -            g_tree_remove(domain->mappings, iter_key);
> +            virtio_iommu_remove_mapping(s, domain, iter_key);
>              trace_virtio_iommu_unmap_done(domain_id, current_low, current_high);
>          } else {
>              ret = VIRTIO_IOMMU_S_RANGE;
> @@ -655,6 +718,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>  
> +    QLIST_INIT(&s->notifiers_list);
>      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
>                  sizeof(struct virtio_iommu_config));
>  
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 6f67f1020a..4539c8ae72 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -44,6 +44,11 @@ typedef struct IOMMUPciBus {
>      IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
>  } IOMMUPciBus;
>  
> +typedef struct VirtioIOMMUNotifierNode {
> +    IOMMUDevice *iommu_dev;
> +    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
> +} VirtioIOMMUNotifierNode;
You may use scripts/git.orderfile for a better diff ordering.
> +
>  typedef struct VirtIOIOMMU {
>      VirtIODevice parent_obj;
>      VirtQueue *req_vq;
> @@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> +    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
See what was done in smmuv3 and intel. We now directly use a list of
IOMMUDevice directly. VirtioIOMMUNotifierNode does not bring anything extra.
>  } VirtIOIOMMU;
>  
>  #endif
> 

Thanks

Eric

