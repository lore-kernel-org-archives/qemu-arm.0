Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp508378wrq;
        Fri, 22 Jun 2018 00:16:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ0fbmgWvc1FFAE9xvqjwOPmlViGgLQsFOVh8QO5fKFuCiQlIFPcYukPur2yvZyMH1/iWYd
X-Received: by 2002:aed:3c42:: with SMTP id u2-v6mr362517qte.198.1529651777557;
        Fri, 22 Jun 2018 00:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529651777; cv=none;
        d=google.com; s=arc-20160816;
        b=mOgXCYDGQtkhPy9JYCz5bM5ELRYc/i4OPCxIM4rObrYnngqNdW62/FWkBYPGgB1qDG
         hjXwCGdIyjt32rtOkeit0wosu8hxauOMrL2ZDQRXuQ6F+JbZyRJpxbckLN0KYaTId4VO
         DUEdHBKSJ4Vs153/XKreTjZxIdNN8VcMDCoLyciyDilYxoPEKoRQ+JxNjRBeRo4WOVnD
         kxW7wXGqsp96jwk4seq3t3SaEQx1S28hx8iIofOQ8gr/K2VxA8CdHP+zSghG0qn8uelR
         ZaQuSoGzBzSnN72u770Hek3ntnaIGBF3EoO9649QWVWqqLKjI9wdxtrrwqAP5NPipV7h
         3s+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=QY3z3vL8/rpC9Up9NYoBXG7wcD308opi9fe1TW+zP/I=;
        b=uqlMksUKTIMiTUCkgdRkEdEdSLyEJuIBnrbfkYmAnvwegxjGVz/el+eXF5zvM5ITc1
         WhwanJZwagaRMqODZ8j0FrY4StI85J7rI3fUwzFw2rw2tWaqqNH5aDEEdhnuV5OQox0p
         1cTUfTONu+jSH/MwhLd+/G4IODNWISUi3zh1lrSBn0WRZ2M3cX6AFMlPoIZbSwifQz3K
         nR6z/1kYWi94czSPBTw05eaAvvy3ABp/HO9XtzLvrjtGspdaUIzOrm3z90Q+4I2SU1/n
         E4+BltRc2oNySu5Pn0sVB/l191DSiJvOwCsFEZuNGJ3GYbsqw0reN5xni2QcCN0pCQXS
         lm0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6bdcxSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f36-v6si6407005qtb.43.2018.06.22.00.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6bdcxSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGIr-0004Ei-1E
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWGIj-0004EM-Ay
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:16:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1fWGIf-0003Zc-7t
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:16:09 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:37108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1fWGIe-0003ZR-UQ; Fri, 22 Jun 2018 03:16:05 -0400
Received: by mail-pf0-x241.google.com with SMTP id y5-v6so2775076pfn.4;
	Fri, 22 Jun 2018 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=QY3z3vL8/rpC9Up9NYoBXG7wcD308opi9fe1TW+zP/I=;
	b=O6bdcxSrJzESazmpAMbItpEK7f7Q3y+bcCYf+yAS0gpJE8e04c0Bb8Bm1hDJCS1T9i
	216YEYpLt39uZkdsZRU/J0BoDojrQ0uyDdQTXnEX0KAEmiPfbriZA3i3m6tzDd1ZEWkK
	hRUvChjZdOLz3McOFVKLTA4Vd43Fx8zS/TOoIU232OlDvRmfd1IEPYy/9+IGG5DXI6kN
	CBMxgcLK5mo6iXQqCqwTvvh8BKhJi5eEfDu8+bO0YWdxbw+GkxELudWOV1aOh3oH8dvC
	dM6h/hhNWooEE1bkTnLsivqul/B1xiyT4195E5qFeiSW75Ohr/x0jVn8+mfB2Tn8h3i4
	/4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QY3z3vL8/rpC9Up9NYoBXG7wcD308opi9fe1TW+zP/I=;
	b=jVgsZzLJAd0KrbgRewC9dMKvlPULPtQ8S4v8Uze8CIs6PGMY8ST795xezPJhk0mtZY
	p0QfoCqxnY1GDOgQ/gn94PZ3vJ+E+qAaMTWrC0x5c9vdBC354L3KTn8fzPAVYh1wHBXF
	XjNqQoy0k5mRA3Kr27UxEBtf6ylyv2zvW7oIrC7nniB1q+4Pos9k4pugmQAX+skhlSuH
	YvSW8pLvaVRyC4ES0zDnPxZuZIiIO86VNptPJQg1+TZafN3F3gEOemucFc3tSYKC8URi
	3Yb50j4manfyrAKfbSNa03I/D3O+i4RgHAJ0eHO9j2kepcqRItrU7KkdlrnZKvYIiSbW
	EhcQ==
X-Gm-Message-State: APt69E3pBWpqw8n47jXLl2Mx+u1vq+t081UxlawC2SlQv8Nx3PKZl1Gh
	5/0VTvmkn8xyZacHdlxV2Os=
X-Received: by 2002:a62:c918:: with SMTP id
	k24-v6mr500003pfg.160.1529651764031; 
	Fri, 22 Jun 2018 00:16:04 -0700 (PDT)
Received: from [0.0.0.0] (67.216.217.169.16clouds.com. [67.216.217.169])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm12808367pfg.48.2018.06.22.00.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 00:16:03 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	jia.he@hxt-semitech.com
References: <1529579774-27795-1-git-send-email-eric.auger@redhat.com>
	<1529579774-27795-5-git-send-email-eric.auger@redhat.com>
From: Jia He <hejianet@gmail.com>
Message-ID: <a5fafaa4-934d-87b6-0903-0846f197ae9f@gmail.com>
Date: Fri, 22 Jun 2018 15:15:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1529579774-27795-5-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v3 4/4] hw/arm/smmuv3: Add notifications on
 invalidation
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7I77BciAXp/f

H

On 6/21/2018 7:16 PM, Eric Auger Wrote:
> On TLB invalidation commands, let's call registered
> IOMMU notifiers. Those can only be UNMAP notifiers.
> SMMUv3 does not support notification on MAP (VFIO).
> 
> This patch allows vhost use case where IOTLB API is notified
> on each guest IOTLB invalidation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2 -> v3:
> - added Peter's R-b
> ---
>  hw/arm/smmu-common.c         | 34 +++++++++++++++
>  hw/arm/smmuv3.c              | 99 +++++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/trace-events          |  5 +++
>  include/hw/arm/smmu-common.h |  6 +++
>  4 files changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index f66e444..3098915 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -385,6 +385,40 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>      return (k1->asid == k2->asid) && (k1->iova == k2->iova);
>  }
>  
> +/* Unmap the whole notifier's range */
> +static void smmu_unmap_notifier_range(IOMMUNotifier *n)
> +{
> +    IOMMUTLBEntry entry;
> +
> +    entry.target_as = &address_space_memory;
> +    entry.iova = n->start;
> +    entry.perm = IOMMU_NONE;
> +    entry.addr_mask = n->end - n->start;
> +
> +    memory_region_notify_one(n, &entry);
> +}
> +
> +/* Unmap all notifiers attached to @mr */
> +inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
> +{
> +    IOMMUNotifier *n;
> +
> +    trace_smmu_inv_notifiers_mr(mr->parent_obj.name);
> +    IOMMU_NOTIFIER_FOREACH(n, mr) {
> +        smmu_unmap_notifier_range(n);
> +    }
> +}
> +
> +/* Unmap all notifiers of all mr's */
> +void smmu_inv_notifiers_all(SMMUState *s)
> +{
> +    SMMUNotifierNode *node;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        smmu_inv_notifiers_mr(&node->sdev->iommu);
> +    }
> +}
> +
>  static void smmu_base_realize(DeviceState *dev, Error **errp)
>  {
>      SMMUState *s = ARM_SMMU(dev);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 853975a..c58e596 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -780,6 +780,68 @@ epilogue:
>      return entry;
>  }
>  
> +/**
> + * smmuv3_notify_iova - call the notifier @n for a given
> + * @asid and @iova tuple.
> + *
> + * @mr: IOMMU mr region handle
> + * @n: notifier to be called
> + * @asid: address space ID or negative value if we don't care
> + * @iova: iova
> + */
> +static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
> +                               IOMMUNotifier *n,
> +                               int asid,
> +                               dma_addr_t iova)
> +{
> +    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> +    SMMUEventInfo event = {};
> +    SMMUTransTableInfo *tt;
> +    SMMUTransCfg *cfg;
> +    IOMMUTLBEntry entry;
> +
> +    cfg = smmuv3_get_config(sdev, &event);
> +    if (!cfg) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s error decoding the configuration for iommu mr=%s\n",
> +                      __func__, mr->parent_obj.name);
> +        return;
> +    }
> +
> +    if (asid >= 0 && cfg->asid != asid) {
> +        return;
> +    }
> +
> +    tt = select_tt(cfg, iova);
> +    if (!tt) {
> +        return;
> +    }
> +
> +    entry.target_as = &address_space_memory;
> +    entry.iova = iova;
> +    entry.addr_mask = (1 << tt->granule_sz) - 1;
> +    entry.perm = IOMMU_NONE;
> +
> +    memory_region_notify_one(n, &entry);
> +}
> +
> +/* invalidate an asid/iova tuple in all mr's */
> +static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova)
> +{
> +    SMMUNotifierNode *node;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        IOMMUMemoryRegion *mr = &node->sdev->iommu;
> +        IOMMUNotifier *n;
> +
> +        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova);
> +
> +        IOMMU_NOTIFIER_FOREACH(n, mr) {
> +            smmuv3_notify_iova(mr, n, asid, iova);
> +        }
> +    }
> +}
> +
>  static int smmuv3_cmdq_consume(SMMUv3State *s)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -899,12 +961,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              uint16_t asid = CMD_ASID(&cmd);
>  
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
> +            smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_asid(bs, asid);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
>          case SMMU_CMD_TLBI_NSNH_ALL:
>              trace_smmuv3_cmdq_tlbi_nh();
> +            smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_all(bs);
>              break;
>          case SMMU_CMD_TLBI_NH_VAA:
> @@ -913,6 +977,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              uint16_t vmid = CMD_VMID(&cmd);
>  
>              trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
> +            smmuv3_inv_notifiers_iova(bs, -1, addr);
>              smmu_iotlb_inv_all(bs);
>              break;
>          }
> @@ -924,6 +989,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              bool leaf = CMD_LEAF(&cmd);
>  
>              trace_smmuv3_cmdq_tlbi_nh_va(vmid, asid, addr, leaf);
> +            smmuv3_inv_notifiers_iova(bs, asid, addr);
>              smmu_iotlb_inv_iova(bs, asid, addr);
>              break;
>          }
> @@ -1402,9 +1468,38 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                                         IOMMUNotifierFlag old,
>                                         IOMMUNotifierFlag new)
>  {
> +    SMMUDevice *sdev = container_of(iommu, SMMUDevice, iommu);
> +    SMMUv3State *s3 = sdev->smmu;
> +    SMMUState *s = &(s3->smmu_state);
> +    SMMUNotifierNode *node = NULL;
> +    SMMUNotifierNode *next_node = NULL;
> +
> +    if (new == IOMMU_NOTIFIER_MAP) {
> +        int bus_num = pci_bus_num(sdev->bus);
> +        PCIDevice *pcidev = pci_find_device(sdev->bus, bus_num, sdev->devfn);
> +
> +        warn_report("SMMUv3 does not support notification on MAP: "
> +                     "device %s will not function properly", pcidev->name);
> +    }
> +
ah, I know why there is no such warning in my testing server.
the IOMMUNotifierFlag is initialized with IOMMU_NOTIFIER_ALL=(IOMMU_NOTIFIER_MAP
| IOMMU_NOTIFIER_UNMAP). Should this condition be considerred?

Cheers,
Jia
>      if (old == IOMMU_NOTIFIER_NONE) {
> -        warn_report("SMMUV3 does not support vhost/vfio integration yet: "
> -                    "devices of those types will not function properly");
> +        trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
> +        node = g_malloc0(sizeof(*node));
> +        node->sdev = sdev;
> +        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
> +        return;
> +    }
> +
> +    /* update notifier node with new flags */
> +    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
> +        if (node->sdev == sdev) {
> +            if (new == IOMMU_NOTIFIER_NONE) {
> +                trace_smmuv3_notify_flag_del(iommu->parent_obj.name);
> +                QLIST_REMOVE(node, next);
> +                g_free(node);
> +            }
> +            return;
> +        }
>      }
>  }
>  
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index be69c5d..27b11d6 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -17,6 +17,7 @@ smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss,
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> +smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  
>  #hw/arm/smmuv3.c
>  smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> @@ -55,3 +56,7 @@ smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "vmid =%d addr=0x%"PRIx64
>  smmuv3_cmdq_tlbi_nh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
> +smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
> +smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> +smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova) "iommu mr=%s asid=%d iova=0x%"PRIx64
> +
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d173806..50e2912 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -160,4 +160,10 @@ void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
>  void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
>  
> +/* Unmap the range of all the notifiers registered to any IOMMU mr */
> +void smmu_inv_notifiers_all(SMMUState *s);
> +
> +/* Unmap the range of all the notifiers registered to @mr */
> +void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
> +
>  #endif  /* HW_ARM_SMMU_COMMON */
> 
