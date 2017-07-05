Received: by 10.25.44.15 with SMTP id s15csp344153lfs;
        Tue, 4 Jul 2017 23:40:37 -0700 (PDT)
X-Received: by 10.200.42.181 with SMTP id b50mr19080619qta.122.1499236836998;
        Tue, 04 Jul 2017 23:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499236836; cv=none;
        d=google.com; s=arc-20160816;
        b=OyH6rqrSLtfaPrRSU/8eAG1TGOKYZG94UrUCDLYDNz6XXpJXQFQlcaqirNcC6l4IHJ
         yEKHzdYtrYHA3hjCVW6eWzAuxkWG3S13Vt7aQWz7XudiCkZ5L94+hMHp1bj3KF8stJ4f
         P+Y5z/1CZ36IneDmsGjNZTYnwcr107/5gC6qiv8EXwOgGfCvBVUKQYpx9D7QqDrlDLRU
         4KS+DBDVFqsotMG2qHwXM/nGkmecklC2y3QMG+8Quzb5ZCY4lU3kn6uXApcjt3rLLQ8b
         YxqA4qTfnZlv02TFhKWBrboatBrE2EY+Tx8yGR+rxUuS84MUpQr5hmXANGdIPC7sV8lY
         FKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=UvCqJxTkf84OxV6xExbZf1Wo/f3Ly0VPLGBaRAuDnOQ=;
        b=pByBaGcG+Urk6n2u4EzceF3H42/MmfACM5hPkcnWsAcEsH615qPyOBO0E7fgOsKIua
         0WmYmexZ0f9N0hNStgm2Ug394lUrGfjNXG9QT7iZ9UXwICGGHXX4R0QHmfWZ7OPtIbJc
         PIvpnwglWrXTSoCm9FcFQrNTMDxMhfefOpBD7Lbt1TRewqdR6RhCoYf4oD2YqeOH9jbU
         zrqZUW3bz2lWQ1GzoGFge1IeyQPN7FRNEVU/liOS/2QdPNlZX3ya3fMojxi78PSVgw4h
         68BPUbxpWZTMEBT7KyjY4yQhnxCCBFhJ3Clas9PCp4Bo4XQuUyHWj4MwKPTYAjYzdKud
         Qwlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d46si20537258qtd.51.2017.07.04.23.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jul 2017 23:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSdzG-0001zb-8P
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 02:40:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dSdzA-0001zF-2L
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 02:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dSdz6-0002Bf-AP
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 02:40:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dSdz5-0002BH-Vo; Wed, 05 Jul 2017 02:40:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D024E4CB;
	Wed,  5 Jul 2017 06:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A5D024E4CB
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A5D024E4CB
Received: from localhost.localdomain (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 029C77E8EE;
	Wed,  5 Jul 2017 06:40:04 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545DC8F3114607C77E57AF19AD70@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0d5076bf-fb7c-7b17-671e-643b36564250@redhat.com>
Date: Wed, 5 Jul 2017 08:40:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB2545DC8F3114607C77E57AF19AD70@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 05 Jul 2017 06:40:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: puvd0ApHuu8R

Hi Bharat,

On 04/07/2017 11:13, Bharat Bhushan wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Eric Auger [mailto:eric.auger@redhat.com]
>> Sent: Wednesday, June 07, 2017 9:31 PM
>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
>> philippe.brucker@arm.com
>> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
>> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
>> wei@redhat.com; tn@semihalf.com; Bharat Bhushan
>> <bharat.bhushan@nxp.com>
>> Subject: [RFC v2 6/8] virtio-iommu: Implement the translation and
>> commands
>>
>> This patch adds the actual implementation for the translation routine
>> and the virtio-iommu commands.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - fix compilation issue reported by autobuild system
>> ---
>>  hw/virtio/trace-events   |   6 ++
>>  hw/virtio/virtio-iommu.c | 202
>> +++++++++++++++++++++++++++++++++++++++++++++--
>>  2 files changed, 202 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>> index 341dbdf..9196b63 100644
>> --- a/hw/virtio/trace-events
>> +++ b/hw/virtio/trace-events
>> @@ -33,3 +33,9 @@ virtio_iommu_detach(uint32_t dev, uint32_t flags)
>> "dev=%d flags=%d"
>>  virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr,
>> uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64"
>> virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
>>  virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint32_t
>> reserved) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64" reserved=%d"
>>  virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int
>> flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
>> +virtio_iommu_new_asid(uint32_t asid) "Allocate a new asid=%d"
>> +virtio_iommu_new_devid(uint32_t devid) "Allocate a new devid=%d"
>> +virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t
>> next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"],
>> new interval=[0x%"PRIx64",0x%"PRIx64"]"
>> +virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t
>> next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"],
>> new interval=[0x%"PRIx64",0x%"PRIx64"]"
>> +virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc
>> [0x%"PRIx64",0x%"PRIx64"]"
>> +virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr,
>> uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 902c779..cd188fc 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -32,10 +32,37 @@
>>  #include "hw/virtio/virtio-bus.h"
>>  #include "hw/virtio/virtio-access.h"
>>  #include "hw/virtio/virtio-iommu.h"
>> +#include "hw/pci/pci_bus.h"
>> +#include "hw/pci/pci.h"
>>
>>  /* Max size */
>>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>>
>> +typedef struct viommu_as viommu_as;
>> +
>> +typedef struct viommu_mapping {
>> +    uint64_t virt_addr;
>> +    uint64_t phys_addr;
>> +    uint64_t size;
>> +    uint32_t flags;
>> +} viommu_mapping;
>> +
>> +typedef struct viommu_interval {
>> +    uint64_t low;
>> +    uint64_t high;
>> +} viommu_interval;
>> +
>> +typedef struct viommu_dev {
>> +    uint32_t id;
>> +    viommu_as *as;
>> +} viommu_dev;
>> +
>> +struct viommu_as {
>> +    uint32_t id;
>> +    uint32_t nr_devices;
>> +    GTree *mappings;
>> +};
>> +
>>  static inline uint16_t smmu_get_sid(IOMMUDevice *dev)
>>  {
>>      return  ((pci_bus_num(dev->bus) & 0xff) << 8) | dev->devfn;
>> @@ -88,6 +115,19 @@ static void virtio_iommu_init_as(VirtIOIOMMU *s)
>>      }
>>  }
>>
>> +static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer
>> user_data)
>> +{
>> +    viommu_interval *inta = (viommu_interval *)a;
>> +    viommu_interval *intb = (viommu_interval *)b;
>> +
>> +    if (inta->high <= intb->low) {
>> +        return -1;
>> +    } else if (intb->high <= inta->low) {
>> +        return 1;
>> +    } else {
>> +        return 0;
>> +    }
>> +}
>>
>>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>>                                 struct virtio_iommu_req_attach *req)
>> @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>>      uint32_t asid = le32_to_cpu(req->address_space);
>>      uint32_t devid = le32_to_cpu(req->device);
>>      uint32_t reserved = le32_to_cpu(req->reserved);
>> +    viommu_as *as;
>> +    viommu_dev *dev;
>>
>>      trace_virtio_iommu_attach(asid, devid, reserved);
>>
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
>> +    if (dev) {
>> +        return -1;
>> +    }
>> +
>> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
>> +    if (!as) {
>> +        as = g_malloc0(sizeof(*as));
>> +        as->id = asid;
>> +        as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
>> +                                         NULL, NULL, (GDestroyNotify)g_free);
> 
> Created the tree here but seems like missed destroy tree on detach.
Sure, I will fix that.

Thanks!

Eric
> 
> Thanks
> -Bharat
> 
>> +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
>> +        trace_virtio_iommu_new_asid(asid);
>> +    }
>> +
>> +    dev = g_malloc0(sizeof(*dev));
>> +    dev->as = as;
>> +    dev->id = devid;
>> +    as->nr_devices++;
>> +    trace_virtio_iommu_new_devid(devid);
>> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
>> +
>> +    return VIRTIO_IOMMU_S_OK;
>>  }
>>
>>  static int virtio_iommu_detach(VirtIOIOMMU *s,
>> @@ -106,10 +170,13 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>>  {
>>      uint32_t devid = le32_to_cpu(req->device);
>>      uint32_t reserved = le32_to_cpu(req->reserved);
>> +    int ret;
>>
>>      trace_virtio_iommu_detach(devid, reserved);
>>
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
>> +
>> +    return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
>>  }
>>
>>  static int virtio_iommu_map(VirtIOIOMMU *s,
>> @@ -120,10 +187,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>>      uint64_t virt_addr = le64_to_cpu(req->virt_addr);
>>      uint64_t size = le64_to_cpu(req->size);
>>      uint32_t flags = le32_to_cpu(req->flags);
>> +    viommu_as *as;
>> +    viommu_interval *interval;
>> +    viommu_mapping *mapping;
>> +
>> +    interval = g_malloc0(sizeof(*interval));
>> +
>> +    interval->low = virt_addr;
>> +    interval->high = virt_addr + size - 1;
>> +
>> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
>> +    if (!as) {
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>> +
>> +    mapping = g_tree_lookup(as->mappings, (gpointer)interval);
>> +    if (mapping) {
>> +        g_free(interval);
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>>
>>      trace_virtio_iommu_map(asid, phys_addr, virt_addr, size, flags);
>>
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    mapping = g_malloc0(sizeof(*mapping));
>> +    mapping->virt_addr = virt_addr;
>> +    mapping->phys_addr = phys_addr;
>> +    mapping->size = size;
>> +    mapping->flags = flags;
>> +
>> +    g_tree_insert(as->mappings, interval, mapping);
>> +
>> +    return VIRTIO_IOMMU_S_OK;
>>  }
>>
>>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
>> @@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>>      uint64_t virt_addr = le64_to_cpu(req->virt_addr);
>>      uint64_t size = le64_to_cpu(req->size);
>>      uint32_t flags = le32_to_cpu(req->flags);
>> +    viommu_mapping *mapping;
>> +    viommu_interval interval;
>> +    viommu_as *as;
>>
>>      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
>>
>> -    return VIRTIO_IOMMU_S_UNSUPP;
>> +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
>> +    if (!as) {
>> +        error_report("%s: no as", __func__);
>> +        return VIRTIO_IOMMU_S_INVAL;
>> +    }
>> +    interval.low = virt_addr;
>> +    interval.high = virt_addr + size - 1;
>> +
>> +    mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
>> +
>> +    while (mapping) {
>> +        viommu_interval current;
>> +        uint64_t low  = mapping->virt_addr;
>> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
>> +
>> +        current.low = low;
>> +        current.high = high;
>> +
>> +        if (low == interval.low && size >= mapping->size) {
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +            interval.low = high + 1;
>> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +        } else if (high == interval.high && size >= mapping->size) {
>> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
>> +                interval.low, interval.high);
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +            interval.high = low - 1;
>> +        } else if (low > interval.low && high < interval.high) {
>> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
>> +            g_tree_remove(as->mappings, (gpointer)&current);
>> +        } else {
>> +            break;
>> +        }
>> +        if (interval.low >= interval.high) {
>> +            return VIRTIO_IOMMU_S_OK;
>> +        } else {
>> +            mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
>> +        }
>> +    }
>> +
>> +    if (mapping) {
>> +        error_report("****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
>> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported",
>> +                     __func__, interval.low, size,
>> +                     mapping->virt_addr, mapping->size);
>> +    } else {
>> +        error_report("****** %s: no mapping for
>> [0x%"PRIx64",0x%"PRIx64"]",
>> +                     __func__, interval.low, interval.high);
>> +    }
>> +
>> +    return VIRTIO_IOMMU_S_INVAL;
>>  }
>>
>>  #define get_payload_size(req) (\
>> @@ -266,19 +414,46 @@ static IOMMUTLBEntry
>> virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
>>                                              IOMMUAccessFlags flag)
>>  {
>>      IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
>> +    VirtIOIOMMU *s = sdev->viommu;
>>      uint32_t sid;
>> +    viommu_dev *dev;
>> +    viommu_mapping *mapping;
>> +    viommu_interval interval;
>> +
>> +    interval.low = addr;
>> +    interval.high = addr + 1;
>>
>>      IOMMUTLBEntry entry = {
>>          .target_as = &address_space_memory,
>>          .iova = addr,
>>          .translated_addr = addr,
>> -        .addr_mask = ~(hwaddr)0,
>> -        .perm = IOMMU_NONE,
>> +        .addr_mask = (1 << 12) - 1, /* TODO */
>> +        .perm = 3,
>>      };
>>
>>      sid = smmu_get_sid(sdev);
>>
>>      trace_virtio_iommu_translate(mr->name, sid, addr, flag);
>> +    qemu_mutex_lock(&s->mutex);
>> +
>> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
>> +    if (!dev) {
>> +        /* device cannot be attached to another as */
>> +        printf("%s sid=%d is not known!!\n", __func__, sid);
>> +        goto unlock;
>> +    }
>> +
>> +    mapping = g_tree_lookup(dev->as->mappings, (gpointer)&interval);
>> +    if (!mapping) {
>> +        printf("%s no mapping for 0x%"PRIx64" for sid=%d\n", __func__,
>> +               addr, sid);
>> +        goto unlock;
>> +    }
>> +    entry.translated_addr = addr - mapping->virt_addr + mapping-
>>> phys_addr,
>> +    trace_virtio_iommu_translate_result(addr, entry.translated_addr, sid);
>> +
>> +unlock:
>> +    qemu_mutex_unlock(&s->mutex);
>>      return entry;
>>  }
>>
>> @@ -341,6 +516,12 @@ static inline guint as_uint64_hash(gconstpointer v)
>>      return (guint)*(const uint64_t *)v;
>>  }
>>
>> +static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>> +{
>> +    uint ua = GPOINTER_TO_UINT(a);
>> +    uint ub = GPOINTER_TO_UINT(b);
>> +    return (ua > ub) - (ua < ub);
>> +}
>>
>>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>  {
>> @@ -362,12 +543,21 @@ static void
>> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>                                              as_uint64_equal,
>>                                              g_free, g_free);
>>
>> +    s->address_spaces = g_tree_new_full((GCompareDataFunc)int_cmp,
>> +                                         NULL, NULL, (GDestroyNotify)g_free);
>> +    s->devices = g_tree_new_full((GCompareDataFunc)int_cmp,
>> +                                         NULL, NULL, (GDestroyNotify)g_free);
>> +
>>      virtio_iommu_init_as(s);
>>  }
>>
>>  static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
>>  {
>>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
>> +
>> +    g_tree_destroy(s->address_spaces);
>> +    g_tree_destroy(s->devices);
>>
>>      virtio_cleanup(vdev);
>>  }
>> --
>> 2.5.5
> 
> 
