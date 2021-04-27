Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4816698lfb;
        Tue, 27 Apr 2021 07:06:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn94ZvMWecWFvGM/YWOpeTBfO0J0PQRZDjt/HWMVUIP5wg44PZJi1ptEbPWIW/1cF/yQqA
X-Received: by 2002:a05:6512:3583:: with SMTP id m3mr16549121lfr.329.1619532366871;
        Tue, 27 Apr 2021 07:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619532366; cv=none;
        d=google.com; s=arc-20160816;
        b=1E3EWA/raWgsp4259drrBrs6842WOsIvSTSdle25a+COlWXJDqGaYf+vBtuVAnaHgs
         p7SJubMr21Ep3XLVB+p8eTS0mVMFD3MHXDmiKbsZQirj66dY5PyxKgp+9NAipJTACfSk
         LkyP+JlV05re8XXCmt97VLEW5PHHelWVGodbGkTrT6Z9lRD+zyT1HH89YGYhAzqTuZSg
         kkLGkAJ84IQZp2KLf3nH4bTLNorj7JP2PchljiAlPTkKbEy/N2WIP3kItzz6TrtBeAoW
         BYdTtaymoa5N0sw5qyI+c3XskBWOSGP68vAVHo3FurMIigDRhNYdzu1Ho5VJjQgo8YJ1
         FaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=eEOEX5jd2FZ2J6agfFdwNtSLAwz2W8dl7KNAbPJO7xM=;
        b=zittzpP7xJ+Gra4PE2Gstm3x+Jb+RaRl606rAOQdOdRpaVbNYfmR5vWwhQ2zt8mlWH
         cFUjQXEr22U2asVEDtkdKZ9uFy85Xpuxu2SxkX8e/YwUlm92fqV7M3L36LMKEPyf7c5n
         cZ9gXj/HW+rLtD3C6wQ1FKqtNvXoAmauWenfi+8StKzwWMAbUKesPi+JqCeorDY+bBmo
         vbkKA7x7dCLKB91Pmc5uE5WbfQxh2C9SFNoL5zr699nahGkdKkWwP9LbDHdX4oXp8Rfw
         TaFiEgo3b4+rBeCYo8aBjBGKfBDwYtrZwLjXnJN9uJlPnmseM8Dwhf+2MGlimeGJQr1B
         5kZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u27si20050915lfq.259.2021.04.27.07.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 07:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbOLj-0002Rd-PY
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 10:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lbOLI-0002PH-Nh; Tue, 27 Apr 2021 10:05:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lbOLE-0006CM-5A; Tue, 27 Apr 2021 10:05:36 -0400
Received: from dggeml709-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FV3Mq5rBKzWcHm;
 Tue, 27 Apr 2021 22:01:27 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml709-chm.china.huawei.com (10.3.17.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 22:05:23 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 22:05:22 +0800
Subject: Re: [RFC v9 14/29] vfio: Introduce helpers to DMA map/unmap a RAM
 section
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <alex.williamson@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
 <20210411120912.15770-15-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <7e3defd3-50b5-c2df-77a7-9fa85fc3a448@huawei.com>
Date: Tue, 27 Apr 2021 22:05:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411120912.15770-15-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, vdumpa@nvidia.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ITczMCvSRdE

Hi Eric,

On 2021/4/11 20:08, Eric Auger wrote:
> Let's introduce two helpers that allow to DMA map/unmap a RAM
> section. Those helpers will be called for nested stage setup in
> another call site. Also the vfio_listener_region_add/del()
> structure may be clearer.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v8 -> v9
> - rebase on top of
>    1eb7f642750c ("vfio: Support host translation granule size")
>
> v5 -> v6:
> - add Error **
> ---
>   hw/vfio/common.c     | 199 +++++++++++++++++++++++++------------------
>   hw/vfio/trace-events |   4 +-
>   2 files changed, 119 insertions(+), 84 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a8f835328e..0cd7ef2139 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -662,13 +662,126 @@ hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
>       return NULL;
>   }
>   
> +static int vfio_dma_map_ram_section(VFIOContainer *container,
> +                                    MemoryRegionSection *section, Error **err)
> +{
> +    VFIOHostDMAWindow *hostwin;
> +    Int128 llend, llsize;
> +    hwaddr iova, end;
> +    void *vaddr;
> +    int ret;
> +
> +    assert(memory_region_is_ram(section->mr));
> +
> +    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> +    end = int128_get64(int128_sub(llend, int128_one()));
> +
> +    vaddr = memory_region_get_ram_ptr(section->mr) +
> +            section->offset_within_region +
> +            (iova - section->offset_within_address_space);
> +
> +    hostwin = hostwin_from_range(container, iova, end);
> +    if (!hostwin) {
> +        error_setg(err, "Container %p can't map guest IOVA region"
> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
> +        return -EFAULT;
> +    }
> +
> +    trace_vfio_dma_map_ram(iova, end, vaddr);
> +
> +    llsize = int128_sub(llend, int128_make64(iova));
> +
> +    if (memory_region_is_ram_device(section->mr)) {
> +        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> +
> +        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
> +            trace_vfio_listener_region_add_no_dma_map(
> +                memory_region_name(section->mr),
> +                section->offset_within_address_space,
> +                int128_getlo(section->size),
> +                pgmask + 1);
> +            return 0;
> +        }
> +    }
> +
> +    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> +                       vaddr, section->readonly);
> +    if (ret) {
> +        error_setg(err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> +                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                   container, iova, int128_get64(llsize), vaddr, ret);
> +        if (memory_region_is_ram_device(section->mr)) {
> +            /* Allow unexpected mappings not to be fatal for RAM devices */
> +            error_report_err(*err);
> +            return 0;
> +        }
> +        return ret;
> +    }
> +    return 0;
> +}
> +
> +static void vfio_dma_unmap_ram_section(VFIOContainer *container,
> +                                       MemoryRegionSection *section)
> +{
> +    Int128 llend, llsize;
> +    hwaddr iova, end;
> +    bool try_unmap = true;
> +    int ret;
> +
> +    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> +
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return;
> +    }
> +    end = int128_get64(int128_sub(llend, int128_one()));
> +
> +    llsize = int128_sub(llend, int128_make64(iova));
> +
> +    trace_vfio_dma_unmap_ram(iova, end);
> +
> +    if (memory_region_is_ram_device(section->mr)) {
> +        hwaddr pgmask;
> +        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
> +
> +        assert(hostwin); /* or region_add() would have failed */
> +
> +        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> +        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
> +    }
> +
> +    if (try_unmap) {
> +        if (int128_eq(llsize, int128_2_64())) {
> +            /* The unmap ioctl doesn't accept a full 64-bit span. */
> +            llsize = int128_rshift(llsize, 1);
> +            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> +            if (ret) {
> +                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> +                             "0x%"HWADDR_PRIx") = %d (%m)",
> +                             container, iova, int128_get64(llsize), ret);
> +            }
> +            iova += int128_get64(llsize);
> +        }
> +        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> +        if (ret) {
> +            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> +                         "0x%"HWADDR_PRIx") = %d (%m)",
> +                         container, iova, int128_get64(llsize), ret);
> +        }
> +    }
> +}
> +
>   static void vfio_listener_region_add(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>       hwaddr iova, end;
> -    Int128 llend, llsize;
> -    void *vaddr;
> +    Int128 llend;
>       int ret;
>       VFIOHostDMAWindow *hostwin;
>       Error *err = NULL;
> @@ -814,39 +927,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>       }
>   
>       /* Here we assume that memory_region_is_ram(section->mr)==true */
> -
> -    vaddr = memory_region_get_ram_ptr(section->mr) +
> -            section->offset_within_region +
> -            (iova - section->offset_within_address_space);
> -
> -    trace_vfio_listener_region_add_ram(iova, end, vaddr);
> -
> -    llsize = int128_sub(llend, int128_make64(iova));
> -
> -    if (memory_region_is_ram_device(section->mr)) {
> -        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> -
> -        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
> -            trace_vfio_listener_region_add_no_dma_map(
> -                memory_region_name(section->mr),
> -                section->offset_within_address_space,
> -                int128_getlo(section->size),
> -                pgmask + 1);
> -            return;
> -        }
> -    }
> -
> -    ret = vfio_dma_map(container, iova, int128_get64(llsize),
> -                       vaddr, section->readonly);
> -    if (ret) {
> -        error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                   container, iova, int128_get64(llsize), vaddr, ret);
> -        if (memory_region_is_ram_device(section->mr)) {
> -            /* Allow unexpected mappings not to be fatal for RAM devices */
> -            error_report_err(err);
> -            return;
> -        }
> +    if (vfio_dma_map_ram_section(container, section, &err)) {
>           goto fail;
>       }
>   
> @@ -880,10 +961,6 @@ static void vfio_listener_region_del(MemoryListener *listener,
>                                        MemoryRegionSection *section)
>   {
>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> -    hwaddr iova, end;
> -    Int128 llend, llsize;
> -    int ret;
> -    bool try_unmap = true;
>   
>       if (vfio_listener_skipped_section(section)) {
>           trace_vfio_listener_region_del_skip(
> @@ -923,49 +1000,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
>            */
>       }
There are some codes of vfio_listener_region_del() that just doesn't 
show up.
I post it below.

> if (memory_region_is_iommu(section->mr)) {
>         VFIOGuestIOMMU *giommu;
>
>         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
>             if (MEMORY_REGION(giommu->iommu) == section->mr &&
>                 giommu->n.start == section->offset_within_region) {
> memory_region_unregister_iommu_notifier(section->mr,
> &giommu->n);
>                 QLIST_REMOVE(giommu, giommu_next);
>                 g_free(giommu);
>                 break;
>             }
>         }
>
>         /*
>          * FIXME: We assume the one big unmap below is adequate to
>          * remove any individual page mappings in the IOMMU which
>          * might have been copied into VFIO. This works for a page table
>          * based IOMMU where a big unmap flattens a large range of 
> IO-PTEs.
>          * That may not be true for all IOMMU types.
>          */
>     }
I think we need a check here. If it is nested mode, just return after
g_free(giommu). Because in nested mode, stage 2 (gpa->hpa) and the
stage 1 (giova->gpa) are set separately.

When hot delete a pci device,  we are going to call
vfio_listener_region_del() and vfio_prereg_listener_region_del().
So it's not appropriate to unmap RAM section in
vfio_listener_region_del(). The RAM section will be unmap in
vfio_prereg_listener_region_del().

Thanks,
Kunkun Jiang
>   
> -    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> -
> -    if (int128_ge(int128_make64(iova), llend)) {
> -        return;
> -    }
> -    end = int128_get64(int128_sub(llend, int128_one()));
> -
> -    llsize = int128_sub(llend, int128_make64(iova));
> -
> -    trace_vfio_listener_region_del(iova, end);
> -
> -    if (memory_region_is_ram_device(section->mr)) {
> -        hwaddr pgmask;
> -        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
> -
> -        assert(hostwin); /* or region_add() would have failed */
> -
> -        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
> -        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
> -    }
> -
> -    if (try_unmap) {
> -        if (int128_eq(llsize, int128_2_64())) {
> -            /* The unmap ioctl doesn't accept a full 64-bit span. */
> -            llsize = int128_rshift(llsize, 1);
> -            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> -            if (ret) {
> -                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                             "0x%"HWADDR_PRIx") = %d (%m)",
> -                             container, iova, int128_get64(llsize), ret);
> -            }
> -            iova += int128_get64(llsize);
> -        }
> -        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
> -        if (ret) {
> -            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> -                         "0x%"HWADDR_PRIx") = %d (%m)",
> -                         container, iova, int128_get64(llsize), ret);
> -        }
> -    }
> +    vfio_dma_unmap_ram_section(container, section);
>   
>       memory_region_unref(section->mr);
>   
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 2a41326c0f..936d29d150 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -99,10 +99,10 @@ vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "i
>   vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add 0x%"PRIx64" - 0x%"PRIx64
>   vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>   vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
> -vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_dma_map_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
> -vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
> +vfio_dma_unmap_ram(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>   vfio_disconnect_container(int fd) "close container->fd=%d"
>   vfio_connect_existing_container(int groupid, int container_fd) "group=%d existing container fd=%d"
>   vfio_connect_new_container(int groupid, int container_fd) "group=%d new container fd=%d"


