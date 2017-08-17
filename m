Received: by 10.223.183.22 with SMTP id l22csp2312680wre;
        Thu, 17 Aug 2017 08:33:50 -0700 (PDT)
X-Received: by 10.55.169.88 with SMTP id s85mr8033192qke.115.1502984030399;
        Thu, 17 Aug 2017 08:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502984030; cv=none;
        d=google.com; s=arc-20160816;
        b=yTX8meEypfVa4/52wLo6Gwcz7OIdQfbOMhqBQ3GFYftR2urqH+P83lTfvWvWRRDsBA
         Q5PobzY/3Y53wBYWr2X4AC00ttwocAQnroJr910uVO7vKeZVJmw0Omydn4uHF9rVA5nv
         CvSw5+Lz+ijlwB6EPIKpi0TTfIiEZmf4SNlvXIkvYnYoC7tWTJJvlV+ct4+p7vHRjLbK
         3hGo5UOVwj2VvBoaGfws7EfPie2/DqtWN7WSfBd3qM12EJXmce0haO/P0VHCNm3l6916
         aA/ybNTjfwmFXeafKDmi5ZMQ8ThwFKJCy1Z1EUjmwaQ4DEc0+liKFze1Ep6azaV6oqCx
         AlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=/wMkTUB/sQVBg3E9viV3iCXO4lSYGdVKMGVZNfBayFw=;
        b=lghnD90BL5G2G1IQSFA7dgWosiYA2Y04LfjjC/WcSi/PUGAWvXY8Xz3zw+A5lDC7+l
         j/+9vFW9l/Ii6LkDFeSn2NSEV3ErRuPbVlawD0mAA+8iGZMhOvl2g4XOJADl7qLFPxrb
         j8TURX/LnirAvJEiGB1joxuwXgXdFZkoFlkmBFFY0PmNPT0I7mwylH5Higz5ezaJD6yL
         rXsgtPyX6uf5sdEwog+inI9c8SyH5teMaLSILbqXDlr/1y1ZFrJCAJssPxgii40WD8D8
         zDKL1JlxjCT6sO3mYQIag8xlmjcintUZDEE/HpZOKZ5Wuisg7Hv+j96+B89X2qxvsqzW
         UXnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l138si3329709qke.401.2017.08.17.08.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 08:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diMnr-0004zq-MZ
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 11:33:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMne-0004xH-O8
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1diMnd-0001Vt-0J
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 11:33:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1diMnc-0001VJ-Mp; Thu, 17 Aug 2017 11:33:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 886618764C;
	Thu, 17 Aug 2017 15:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 886618764C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E1E54FA22;
	Thu, 17 Aug 2017 15:33:27 +0000 (UTC)
To: Bharat Bhushan <Bharat.Bhushan@nxp.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
	<1500017104-3574-3-git-send-email-Bharat.Bhushan@nxp.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <997bdcca-b84c-300c-bca0-5950c17db8d7@redhat.com>
Date: Thu, 17 Aug 2017 17:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1500017104-3574-3-git-send-email-Bharat.Bhushan@nxp.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 17 Aug 2017 15:33:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 PATCH 2/2] virtio-iommu: vfio
 integration with virtio-iommu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKHfVvjoN9WI

Hi Bharat,

On 14/07/2017 09:25, Bharat Bhushan wrote:
> This patch allows virtio-iommu protection for PCI
> device-passthrough.
> 
> MSI region is mapped by current version of virtio-iommu driver.
> This MSI region mapping in not getting pushed on hw iommu
> vfio_get_vaddr() allows only ram-region.
Why is it an issue. As far as I understand this is not needed actually
as the guest MSI doorbell is not used by the host.
 This RFC patch needed
> to be improved.
> 
> Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> ---
> v1-v2:
>   - Added trace events
> 
>  hw/virtio/trace-events           |   5 ++
>  hw/virtio/virtio-iommu.c         | 133 +++++++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-iommu.h |   6 ++
>  3 files changed, 144 insertions(+)
> 
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 9196b63..3a3968b 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -39,3 +39,8 @@ virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low,
>  virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
>  virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
>  virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
> +virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu notifier node for memory region %s"
> +virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu notifier node for memory region %s"
> +virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
> +virtio_iommu_map_region(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
> +virtio_iommu_unmap_region(hwaddr iova, hwaddr paddr, hwaddr map_size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index cd188fc..61f33cb 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -129,6 +129,48 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>      }
>  }
>  
> +static void virtio_iommu_map_region(VirtIOIOMMU *s, hwaddr iova, hwaddr paddr,
> +                                    hwaddr size, int map)
bool map?

the function name is a bit misleading to me and does not really explain
what the function does. It "notifies" so why not using something like
virtio_iommu_map_notify and virtio_iommu_unmap_notify. I tend to think
having separate proto is cleaner and more standard.

Binding should happen on a specific IOMMUmemoryRegion (see next comment).

> +{
> +    VirtioIOMMUNotifierNode *node;
> +    IOMMUTLBEntry entry;
> +    uint64_t map_size = (1 << 12);
TODO: handle something else than 4K page.
> +    int npages;
> +    int i;
> +
> +    npages = size / map_size;
> +    entry.target_as = &address_space_memory;
> +    entry.addr_mask = map_size - 1;
> +
> +    for (i = 0; i < npages; i++) {
Although I understand we currently fail checking the consistency between
pIOMMU and vIOMMU page sizes, this will be very slow for guest DPDK use
case where hugepages are used.

Why not directly using the full size?  vfio_iommu_map_notify will report
errors if vfio_dma_map/unmap() fail.
> +        entry.iova = iova + (i * map_size);
> +        if (map) {
> +                trace_virtio_iommu_map_region(iova, paddr, map_size);
> +                entry.perm = IOMMU_RW;
> +                entry.translated_addr = paddr + (i * map_size);
> +        } else {
> +                trace_virtio_iommu_unmap_region(iova, paddr, map_size);
> +                entry.perm = IOMMU_NONE;
> +                entry.translated_addr = 0;
> +        }
> +
> +        QLIST_FOREACH(node, &s->notifiers_list, next) {
> +            memory_region_notify_iommu(&node->iommu_dev->iommu_mr, entry);
So as discussed this will notify *all* IOMMU memory regions and all
their notifiers which is not what we want. You may have a look at
vsmmuv3 v6 (or intel_iommu) where smmuv3_context_device_invalidate
retrieves the mr from the sid.

> +        }
> +    }
> +}
> +
> +static gboolean virtio_iommu_unmap_single(gpointer key, gpointer value,
> +                                          gpointer data)
> +{
> +    viommu_mapping *mapping = (viommu_mapping *) value;
> +    VirtIOIOMMU *s = (VirtIOIOMMU *) data;
> +
> +    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size, 0);
paddr=0? mapping->phys_addr as the trace() will be misleading. But as
mentioned earlier better use unmap() separate function.
> +
> +    return true;
> +}
> +
>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
>  {
> @@ -170,10 +212,26 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>  {
>      uint32_t devid = le32_to_cpu(req->device);
>      uint32_t reserved = le32_to_cpu(req->reserved);
> +    viommu_dev *dev;
>      int ret;
>  
>      trace_virtio_iommu_detach(devid, reserved);
>  
> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (!dev || !dev->as) {
> +        return -EINVAL;
> +    }
> +
> +    dev->as->nr_devices--;
> +
> +    /* Unmap all if this is last device detached */
> +    if (dev->as->nr_devices == 0) {
> +        g_tree_foreach(dev->as->mappings, virtio_iommu_unmap_single, s);
> +
> +        g_tree_remove(s->address_spaces, GUINT_TO_POINTER(dev->as->id));
> +        g_tree_destroy(dev->as->mappings);
> +    }
so this should be rebased on new ref count code.
> +
>      ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
>  
>      return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
> @@ -217,6 +275,7 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>  
>      g_tree_insert(as->mappings, interval, mapping);
>  
> +    virtio_iommu_map_region(s, virt_addr, phys_addr, size, 1);
>      return VIRTIO_IOMMU_S_OK;
>  }
>  
> @@ -267,7 +326,9 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>          } else {
>              break;
>          }
> +
>          if (interval.low >= interval.high) {
> +            virtio_iommu_map_region(s, virt_addr, 0, size, 0);
>              return VIRTIO_IOMMU_S_OK;
>          } else {
>              mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
> @@ -410,6 +471,37 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>      }
>  }
>  
> +static void virtio_iommu_notify_flag_changed(MemoryRegion *iommu,
> +                                          IOMMUNotifierFlag old,
> +                                          IOMMUNotifierFlag new)
> +{
> +    IOMMUDevice *sdev = container_of(iommu, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s = sdev->viommu;
> +    VirtioIOMMUNotifierNode *node = NULL;
> +    VirtioIOMMUNotifierNode *next_node = NULL;
> +
> +    if (old == IOMMU_NOTIFIER_NONE) {
> +        trace_virtio_iommu_notify_flag_add(iommu->name);
> +        node = g_malloc0(sizeof(*node));
> +        node->iommu_dev = sdev;
> +        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
> +        return;
> +    }
> +
> +    /* update notifier node with new flags */
> +    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
> +        if (node->iommu_dev == sdev) {
> +            if (new == IOMMU_NOTIFIER_NONE) {
> +                trace_virtio_iommu_notify_flag_del(iommu->name);
> +                QLIST_REMOVE(node, next);
> +                g_free(node);
> +            }
> +            return;
> +        }
> +    }
> +}
I think all that mechanics should be factorized somewhere else as all
vIOMMUs use that but this goes beyond the scope of this series.
> +
> +
>  static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
>                                              IOMMUAccessFlags flag)
>  {
> @@ -523,11 +615,50 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>      return (ua > ub) - (ua < ub);
>  }
>  
> +static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
> +{
> +    viommu_mapping *mapping = (viommu_mapping *) value;
> +    VirtIOIOMMU *s = (VirtIOIOMMU *) data;
> +
> +    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
> +                             mapping->size);
> +    /* unmap previous entry and map again */
> +    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size, 0);
> +
> +    virtio_iommu_map_region(s, mapping->virt_addr, mapping->phys_addr,
> +                            mapping->size, 1);
> +    return true;
> +}
> +
> +static void virtio_iommu_replay(MemoryRegion *mr, IOMMUNotifier *n)
> +{
> +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s = sdev->viommu;
> +    uint32_t sid;
> +    viommu_dev *dev;
> +
> +    sid = smmu_get_sid(sdev);
> +
> +    qemu_mutex_lock(&s->mutex);
> +
> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
> +    if (!dev) {
> +        goto unlock;
> +    }
> +
> +    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, s);
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
> +    return;
not needed

Thanks

Eric
> +}
> +
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>  
> +    QLIST_INIT(&s->notifiers_list);
>      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
>                  sizeof(struct virtio_iommu_config));
>  
> @@ -538,6 +669,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->config.input_range.end = -1UL;
>  
>      s->iommu_ops.translate = virtio_iommu_translate;
> +    s->iommu_ops.notify_flag_changed = virtio_iommu_notify_flag_changed;
> +    s->iommu_ops.replay = virtio_iommu_replay;
>      memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
>      s->as_by_busptr = g_hash_table_new_full(as_uint64_hash,
>                                              as_uint64_equal,
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 2259413..76c758d 100644
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
> +
>  typedef struct VirtIOIOMMU {
>      VirtIODevice parent_obj;
>      VirtQueue *vq;
> @@ -55,6 +60,7 @@ typedef struct VirtIOIOMMU {
>      GTree *address_spaces;
>      QemuMutex mutex;
>      GTree *devices;
> +    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
>  } VirtIOIOMMU;
>  
>  #endif
> 
