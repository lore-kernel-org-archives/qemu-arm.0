Received: by 10.223.188.70 with SMTP id a6csp2938347wrh;
        Sun, 20 Aug 2017 18:21:53 -0700 (PDT)
X-Received: by 10.55.184.71 with SMTP id i68mr20647098qkf.162.1503278513287;
        Sun, 20 Aug 2017 18:21:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503278513; cv=none;
        d=google.com; s=arc-20160816;
        b=r2F5P142Th6qYiBtW146CCwSoB586XzCH4MdjT4BuG7vEmanL5amZUH09KEX+79Rhj
         h4gLxKy21pzpKLYoiN/PskDrrjwmYUw+/BGgf8T7dAbdLPhdwFurs9My1rjqOUDvqRyX
         1XDiZPvTVx2vhvbJPCx1Yl46QVGvbVXxnvMKgaOrzpyjOWE9X+CXzqtwYMWskPsYf56j
         aWET8FCcdcAMicJDvfqxQhclptFDIgUpgxzmY6JYq+UEfFxM4nDDg5twQa4EISEeJ58e
         VyTuuNhJS7ceQ2Uuvm/Ng+Y/+f28jrdQu8Suqnmw9oBSL06TKETg6aAWnQOyOXeU7k6t
         IUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=TtQBd1eF2MqyAKcFwBya+yhvvcb5qvzMBFTcTV5t7k0=;
        b=aFs0n/rg6H1S99YjETgfC8aHRW9ivNXcXoIMQzRPOnV3QsMqUBhBcamxLS8b0723zf
         bbHlHwm03JHGPtOnGydGQAZe+Ob7hoKbRzDrXiHN1O3VHZWYR9x+QodmO5G3N5dmO7xV
         mMcMMj3Kfgaua+7ZVpCd8doEwQUNEwRLYTyAlRZToHdmb171j0eGkgog3OyFcIQIH9Pp
         U2PUPTH/iWOkKNy+hdgTYwCgumrJCYiYQSBcsjy0u2QzEZQ1t1tDgJnkJHrECeZjr8Vg
         1QVH3ozEc3zleVyD/pA7N07x4oaLOciG9no2+lVVQJYFqK0nVzqA1nwdixhR6PAgQ+7C
         GgqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Of6kqYcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 24si10394510qtp.137.2017.08.20.18.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Aug 2017 18:21:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Of6kqYcW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1djbPa-0006Nj-Qn
	for alex.bennee@linaro.org; Sun, 20 Aug 2017 21:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1djbPT-0006M7-Nx
	for qemu-arm@nongnu.org; Sun, 20 Aug 2017 21:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1djbPL-0001kB-9R
	for qemu-arm@nongnu.org; Sun, 20 Aug 2017 21:21:39 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:32979)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1djbPK-0001fI-U2; Sun, 20 Aug 2017 21:21:35 -0400
Received: by mail-pg0-x241.google.com with SMTP id n4so6460927pgn.0;
	Sun, 20 Aug 2017 18:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TtQBd1eF2MqyAKcFwBya+yhvvcb5qvzMBFTcTV5t7k0=;
	b=Of6kqYcWtph7JlGATZCSTVT9oV1YtOW8QhYtiv2pNRLrQ3GuqXh3QZWKnnAT1MYalH
	BhYsY43tx/oIZzlUUafPXj+Ko560hGYphkVSVwGwQGT7r9uyYUEqqcY+mvepcl7BZEge
	VfVy0AwVNCfbl145cKSB0L16jwQGB45nOv+gaII+sdKevoDfsW0Y7Uf2Q+JGNb552uN0
	m/QcsBR+B1GPkHrT8wYrXnLjLEDpmSyDoluAzvFgayXyuMuX9WAIP9+HmL69NVZcRY3o
	ib7Mawmg8Ps3n7lOkqjXn2vhAShyNnYOm6nx0H33uMJxF2VvWlypJZmrmrQrMOoe9Yfx
	2WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TtQBd1eF2MqyAKcFwBya+yhvvcb5qvzMBFTcTV5t7k0=;
	b=XwIr5e+EphyVOTL/0kWrunxjtS9jI2P8uy1h/n2tPL983iAUevmd9gpvOOEycoOGrj
	riNs4bSPazYzPtcMGj30YjwIMEbgIJugFN7c48wWecdgnPqzTxEWJzBzP24g5JtyZYJL
	fVTpVC1JvdBEInvkjPUJIardeW+yUkAYGQwGjHM+AlcBsN9Opw3CBo4kuko69tZEOZWW
	4n54HqH9dXvE/rmcGNwPU7p8l6Y7CHJu2+qMsvm6Kt401d9/akwqp8xrqXeZZBPTDGTZ
	Z/Z2mW7GrZO7GV1VST7LH5zX67qzYl1BX2uek7S5wzBrgmDa5NQNZ6x6In5wKaIUoz6y
	j8yQ==
X-Gm-Message-State: AHYfb5gKdB44kMJ953jrS5gcVmyaT3MG4GGPqk2e3bI20NIs44CVCdbi
	2tX2Je2aGnnQ9A==
X-Received: by 10.84.172.1 with SMTP id m1mr17195131plb.174.1503278492354;
	Sun, 20 Aug 2017 18:21:32 -0700 (PDT)
Received: from virtx40 ([111.93.218.67]) by smtp.gmail.com with ESMTPSA id
	p10sm20043380pfk.103.2017.08.20.18.21.26
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 20 Aug 2017 18:21:31 -0700 (PDT)
Date: Mon, 21 Aug 2017 06:51:13 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170821012113.GA12220@virtx40>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
	<1502461354-11327-9-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502461354-11327-9-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [RFC v6 8/9] hw/arm/smmuv3: VFIO integration
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	will.deacon@arm.com, qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 019MQPSpOWOy

Hi Eric,


On Fri Aug 11, 2017 at 04:22:33PM +0200, Eric Auger wrote:
> This patch allows doing PCIe passthrough with a guest exposed
> with a vSMMUv3. It implements the replay and notify_flag_changed
> iommu ops. Also on TLB and data structure invalidation commands,
> we replay the mappings so that the physical IOMMU implements
> updated stage 1 settings (Guest IOVA -> Guest PA) + stage 2 settings.
> 
> This works only if the guest smmuv3 driver implements the
> "tlbi-on-map" option.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>

Appreciate if you could point to some documentation that explains 
the attach, detach, map,unmap flows for a passthrough device 
with emulated IOMMU. 
Thanks. 
> ---
> 
> v5 -> v6:
> - use IOMMUMemoryRegion
> - handle implementation defined SMMU_CMD_TLBI_NH_VA_AM cmd
>   (goes along with TLBI_ON_MAP FW quirk)
> - replay systematically unmap the whole range first
> - smmuv3_map_hook does not unmap anymore and the unmap is done
>   before the replay
> - add and use smmuv3_context_device_invalidate instead of
>   blindly replaying everything
> ---
>  hw/arm/smmuv3-internal.h |   1 +
>  hw/arm/smmuv3.c          | 265 ++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/arm/trace-events      |  14 +++
>  3 files changed, 277 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index e255df1..ac4628f 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -344,6 +344,7 @@ enum {
>      SMMU_CMD_RESUME          = 0x44,
>      SMMU_CMD_STALL_TERM,
>      SMMU_CMD_SYNC,          /* 0x46 */
> +    SMMU_CMD_TLBI_NH_VA_AM   = 0x8F, /* VIOMMU Impl Defined */
>  };
>  
>  static const char *cmd_stringify[] = {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e195a0e..89fb116 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -25,6 +25,7 @@
>  #include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
> +#include "exec/target_page.h"
>  
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
> @@ -143,6 +144,71 @@ static MemTxResult smmu_read_cmdq(SMMUV3State *s, Cmd *cmd)
>      return ret;
>  }
>  
> +static void smmuv3_replay_all(SMMUState *s)
> +{
> +    SMMUNotifierNode *node;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        trace_smmuv3_replay_all(node->sdev->iommu.parent_obj.name);
> +        memory_region_iommu_replay_all(&node->sdev->iommu);
> +    }
> +}
> +
> +/* Replay the mappings for a given streamid */
> +static void smmuv3_context_device_invalidate(SMMUState *s, uint16_t sid)
> +{
> +    uint8_t bus_n, devfn;
> +    SMMUPciBus *smmu_bus;
> +    SMMUDevice *smmu;
> +
> +    trace_smmuv3_context_device_invalidate(sid);
> +    bus_n = PCI_BUS_NUM(sid);
> +    smmu_bus = smmu_find_as_from_bus_num(s, bus_n);
> +    if (smmu_bus) {
> +        devfn = PCI_FUNC(sid);
> +        smmu = smmu_bus->pbdev[devfn];
> +        if (smmu) {
> +            memory_region_iommu_replay_all(&smmu->iommu);
> +        }
> +    }
> +}
> +
> +static void smmuv3_replay_single(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
> +                                 uint64_t iova);
> +
> +static void smmuv3_replay_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
> +                                 uint64_t iova, size_t nb_pages);
> +
> +static void smmuv3_notify_single(SMMUState *s, uint64_t iova)
> +{
> +    SMMUNotifierNode *node;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        IOMMUMemoryRegion *mr = &node->sdev->iommu;
> +        IOMMUNotifier *n;
> +
> +        trace_smmuv3_notify_all(node->sdev->iommu.parent_obj.name, iova);
> +        IOMMU_NOTIFIER_FOREACH(n, mr) {
> +            smmuv3_replay_single(mr, n, iova);
> +        }
> +    }
> +}
> +
> +static void smmuv3_notify_range(SMMUState *s, uint64_t iova, size_t size)
> +{
> +    SMMUNotifierNode *node;
> +
> +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> +        IOMMUMemoryRegion *mr = &node->sdev->iommu;
> +        IOMMUNotifier *n;
> +
> +        trace_smmuv3_notify_all(node->sdev->iommu.parent_obj.name, iova);
> +        IOMMU_NOTIFIER_FOREACH(n, mr) {
> +            smmuv3_replay_range(mr, n, iova, size);
> +        }
> +    }
> +}
> +
>  static int smmu_cmdq_consume(SMMUV3State *s)
>  {
>      uint32_t error = SMMU_CMD_ERR_NONE;
> @@ -178,28 +244,38 @@ static int smmu_cmdq_consume(SMMUV3State *s)
>              break;
>          case SMMU_CMD_PREFETCH_CONFIG:
>          case SMMU_CMD_PREFETCH_ADDR:
> +            break;
>          case SMMU_CMD_CFGI_STE:
>          {
>               uint32_t streamid = cmd.word[1];
>  
>               trace_smmuv3_cmdq_cfgi_ste(streamid);
> -            break;
> +             smmuv3_context_device_invalidate(&s->smmu_state, streamid);
> +             break;
>          }
>          case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
>          {
> -            uint32_t start = cmd.word[1], range, end;
> +            uint32_t start = cmd.word[1], range, end, i;
>  
>              range = extract32(cmd.word[2], 0, 5);
>              end = start + (1 << (range + 1)) - 1;
>              trace_smmuv3_cmdq_cfgi_ste_range(start, end);
> +            for (i = start; i <= end; i++) {
> +                smmuv3_context_device_invalidate(&s->smmu_state, i);
> +            }
>              break;
>          }
>          case SMMU_CMD_CFGI_CD:
>          case SMMU_CMD_CFGI_CD_ALL:
> +        {
> +             uint32_t streamid = cmd.word[1];
> +
> +            smmuv3_context_device_invalidate(&s->smmu_state, streamid);
>              break;
> +        }
>          case SMMU_CMD_TLBI_NH_ALL:
>          case SMMU_CMD_TLBI_NH_ASID:
> -            printf("%s TLBI* replay\n", __func__);
> +            smmuv3_replay_all(&s->smmu_state);
>              break;
>          case SMMU_CMD_TLBI_NH_VA:
>          {
> @@ -210,6 +286,20 @@ static int smmu_cmdq_consume(SMMUV3State *s)
>              uint64_t addr = high << 32 | (low << 12);
>  
>              trace_smmuv3_cmdq_tlbi_nh_va(asid, vmid, addr);
> +            smmuv3_notify_single(&s->smmu_state, addr);
> +            break;
> +        }
> +        case SMMU_CMD_TLBI_NH_VA_AM:
> +        {
> +            int asid = extract32(cmd.word[1], 16, 16);
> +            int am = extract32(cmd.word[1], 0, 16);
> +            uint64_t low = extract32(cmd.word[2], 12, 20);
> +            uint64_t high = cmd.word[3];
> +            uint64_t addr = high << 32 | (low << 12);
> +            size_t size = am << 12;
> +
> +            trace_smmuv3_cmdq_tlbi_nh_va_am(asid, am, addr, size);
> +            smmuv3_notify_range(&s->smmu_state, addr, size);
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_VAA:
> @@ -222,6 +312,7 @@ static int smmu_cmdq_consume(SMMUV3State *s)
>          case SMMU_CMD_TLBI_S12_VMALL:
>          case SMMU_CMD_TLBI_S2_IPA:
>          case SMMU_CMD_TLBI_NSNH_ALL:
> +            smmuv3_replay_all(&s->smmu_state);
>              break;
>          case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
> @@ -804,6 +895,172 @@ out:
>      return entry;
>  }
>  
> +static int smmuv3_replay_hook(IOMMUTLBEntry *entry, void *private)
> +{
> +    trace_smmuv3_replay_hook(entry->iova, entry->translated_addr,
> +                             entry->addr_mask, entry->perm);
> +    memory_region_notify_one((IOMMUNotifier *)private, entry);
> +    return 0;
> +}
> +
> +static int smmuv3_map_hook(IOMMUTLBEntry *entry, void *private)
> +{
> +    trace_smmuv3_map_hook(entry->iova, entry->translated_addr,
> +                          entry->addr_mask, entry->perm);
> +    memory_region_notify_one((IOMMUNotifier *)private, entry);
> +    return 0;
> +}
> +
> +/* Unmap the whole range in the notifier's scope. */
> +static void smmuv3_unmap_notifier(SMMUDevice *sdev, IOMMUNotifier *n)
> +{
> +    IOMMUTLBEntry entry;
> +    hwaddr size;
> +    hwaddr start = n->start;
> +    hwaddr end = n->end;
> +
> +    size = end - start + 1;
> +
> +    entry.target_as = &address_space_memory;
> +    /* Adjust iova for the size */
> +    entry.iova = n->start & ~(size - 1);
> +    /* This field is meaningless for unmap */
> +    entry.translated_addr = 0;
> +    entry.perm = IOMMU_NONE;
> +    entry.addr_mask = size - 1;
> +
> +    /* TODO: check start/end/size/mask */
> +
> +    trace_smmuv3_unmap_notifier(pci_bus_num(sdev->bus),
> +                                PCI_SLOT(sdev->devfn),
> +                                PCI_FUNC(sdev->devfn),
> +                                entry.iova, size);
> +
> +    memory_region_notify_one(n, &entry);
> +}
> +
> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
> +{
> +    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> +    SMMUV3State *s = sdev->smmu;
> +    SMMUBaseClass *sbc = SMMU_DEVICE_GET_CLASS(s);
> +    SMMUTransCfg cfg = {};
> +    int ret;
> +
> +    smmuv3_unmap_notifier(sdev, n);
> +
> +    ret = smmuv3_decode_config(mr, &cfg);
> +    if (ret) {
> +        error_report("%s error decoding the configuration for iommu mr=%s",
> +                     __func__, mr->parent_obj.name);
> +    }
> +
> +    if (cfg.disabled || cfg.bypassed) {
> +        return;
> +    }
> +    /* is the smmu enabled */
> +    sbc->page_walk_64(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
> +                      smmuv3_replay_hook, n);
> +}
> +static void smmuv3_replay_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
> +                                 uint64_t iova, size_t size)
> +{
> +    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> +    SMMUV3State *s = sdev->smmu;
> +    SMMUBaseClass *sbc = SMMU_DEVICE_GET_CLASS(s);
> +    SMMUTransCfg cfg = {};
> +    IOMMUTLBEntry entry;
> +    int ret;
> +
> +    trace_smmuv3_replay_range(mr->parent_obj.name, iova, size, n);
> +    ret = smmuv3_decode_config(mr, &cfg);
> +    if (ret) {
> +        error_report("%s error decoding the configuration for iommu mr=%s",
> +                     __func__, mr->parent_obj.name);
> +    }
> +
> +    if (cfg.disabled || cfg.bypassed) {
> +        return;
> +    }
> +
> +    /* first unmap */
> +    entry.target_as = &address_space_memory;
> +    entry.iova = iova & ~(size - 1);
> +    entry.addr_mask = size - 1;
> +    entry.perm = IOMMU_NONE;
> +
> +    memory_region_notify_one(n, &entry);
> +
> +    /* then figure out if a new mapping needs to be applied */
> +    sbc->page_walk_64(&cfg, iova, iova + entry.addr_mask , false,
> +                      smmuv3_map_hook, n);
> +}
> +
> +static void smmuv3_replay_single(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
> +                                 uint64_t iova)
> +{
> +    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
> +    SMMUV3State *s = sdev->smmu;
> +    size_t target_page_size = qemu_target_page_size();
> +    SMMUBaseClass *sbc = SMMU_DEVICE_GET_CLASS(s);
> +    SMMUTransCfg cfg = {};
> +    IOMMUTLBEntry entry;
> +    int ret;
> +
> +    trace_smmuv3_replay_single(mr->parent_obj.name, iova, n);
> +    ret = smmuv3_decode_config(mr, &cfg);
> +    if (ret) {
> +        error_report("%s error decoding the configuration for iommu mr=%s",
> +                     __func__, mr->parent_obj.name);
> +    }
> +
> +    if (cfg.disabled || cfg.bypassed) {
> +        return;
> +    }
> +
> +    /* first unmap */
> +    entry.target_as = &address_space_memory;
> +    entry.iova = iova & ~(target_page_size - 1);
> +    entry.addr_mask = target_page_size - 1;
> +    entry.perm = IOMMU_NONE;
> +
> +    memory_region_notify_one(n, &entry);
> +
> +    /* then figure out if a new mapping needs to be applied */
> +    sbc->page_walk_64(&cfg, iova, iova + 1, false,
> +                      smmuv3_map_hook, n);
> +}
> +
> +static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> +                                       IOMMUNotifierFlag old,
> +                                       IOMMUNotifierFlag new)
> +{
> +    SMMUDevice *sdev = container_of(iommu, SMMUDevice, iommu);
> +    SMMUV3State *s3 = sdev->smmu;
> +    SMMUState *s = &(s3->smmu_state);
> +    SMMUNotifierNode *node = NULL;
> +    SMMUNotifierNode *next_node = NULL;
> +
> +    if (old == IOMMU_NOTIFIER_NONE) {
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
> +    }
> +}
>  
>  static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
>                                          uint64_t val)
> @@ -1125,6 +1382,8 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
>  
>      imrc->translate = smmuv3_translate;
> +    imrc->notify_flag_changed = smmuv3_notify_flag_changed;
> +    imrc->replay = smmuv3_replay;
>  }
>  
>  static const TypeInfo smmuv3_type_info = {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index f9b9cbe..8228e26 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -27,6 +27,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
>  smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
>  smmuv3_cmdq_tlbi_nh_va(int asid, int vmid, uint64_t addr) "     |_ asid =%d vmid =%d addr=0x%"PRIx64
> +smmuv3_cmdq_tlbi_nh_va_am(int asid, int am, size_t size, uint64_t addr) "     |_ asid =%d am =%d size=0x%lx addr=0x%"PRIx64
>  smmuv3_cmdq_consume_sev(void) "CMD_SYNC CS=SEV not supported, ignoring"
>  smmuv3_cmdq_consume_out(uint8_t prod_wrap, uint32_t prod, uint8_t cons_wrap, uint32_t cons) "prod_wrap:%d, prod:0x%x cons_wrap:%d cons:0x%x"
>  smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
> @@ -50,3 +51,16 @@ smmuv3_dump_ste(int i, uint32_t word0, int j,  uint32_t word1) "STE[%2d]: 0x%x\t
>  smmuv3_dump_cd(int i, uint32_t word0, int j,  uint32_t word1) "CD[%2d]: 0x%x\t CD[%2d]: 0x%x"
>  smmuv3_dump_cmd(int i, uint32_t word0, int j,  uint32_t word1) "CMD[%2d]: 0x%x\t CMD[%2d]: 0x%x"
>  smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, uint32_t granule_sz, int initial_level) "TransCFG stage:%d oas:%d tsz:%d ttbr:0x%"PRIx64"  aa64:%d granule_sz:%d, initial_level = %d"
> +
> +smmuv3_replay(uint16_t sid, bool enabled) "sid=%d, enabled=%d"
> +smmuv3_replay_hook(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
> +smmuv3_map_hook(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
> +smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
> +smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> +smmuv3_replay_single(const char *name, uint64_t iova, void *n) "iommu mr=%s iova=0x%"PRIx64" n=%p"
> +smmuv3_replay_range(const char *name, uint64_t iova, size_t size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
> +smmuv3_replay_all(const char *name) "iommu mr=%s"
> +smmuv3_notify_all(const char *name, uint64_t iova) "iommu mr=%s iova=0x%"PRIx64
> +smmuv3_unmap_notifier(uint8_t bus, uint8_t slot, uint8_t fn, uint64_t iova, uint64_t size) "Device %02x:%02x.%x start 0x%"PRIx64" size 0x%"PRIx64
> +smmuv3_context_device_invalidate(uint32_t sid) "sid=%d"
> +
> -- 
> 2.5.5
> 
> 

-- 
Linu cherian
