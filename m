Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1994883wre;
        Thu, 24 May 2018 08:29:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLTCPwnKbaKd1TSXxo42DTc//CUqCQZFLqeTHWcNYl3k7mMgv9DBUXHM1yZzgJuYTxOXisP
X-Received: by 2002:a37:83c4:: with SMTP id f187-v6mr6750247qkd.97.1527175771201;
        Thu, 24 May 2018 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527175771; cv=none;
        d=google.com; s=arc-20160816;
        b=mfHRwQnQjQH24Gp63YINklEWTkW7yP1Bk3jWoKKZDvYffpknuHyBuTdpbkhx0GF+OA
         Cw+HYWfZVTSVe7ruJY0VVV6V5YOvZGpVMICP6Jcnpm+VlwDk1usXlAQGt2KA3CmVnaQl
         2V9QbZSsv6nZk6H3QgWbLbVBd34eHzwbDTqteKidg/sdFjRUNjxNudaKOibJVnzi4/fx
         Uh14NYxjNBWCRCsepCFQjixH53bWMxSvhZZFnWP+WyPQsd3eYKyA1fun84NYtIRnR9DS
         YQT7EnsRIPMPwp81WWRLd1bO6bcGA1+gNnR/O7M+L0LN8xrjbiVxDO0jZc6xEUDF6+yy
         cpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=YNEdE92roAKoLspWOoTB0oPzGXkeW5d/05/8su4NYug=;
        b=auFg25CaT4tbJPf+FfcKYbaoiDfProMYcMHKB8rNSSIkF3Ws4If65Zz56Lhhjd5Wqh
         LrcqCRuKfvUr+/gyAzPXurlQeZB9U0kvjw3vV5M+wpTMMw6Kumrl3il+u272lbubf9dj
         M6WgJgNidmkyIVQwYABCn0H0zoL5Zzv/DNiAdTY/4QHxHNy6x8Gzx38flqps9Lx+wqQi
         msFuHcdNBER8WaFVtgMMdWcZnxycN8qAP0tTJkHZiF/7aiFBkbEwXj8cLnIdXPJYTA+H
         ML3z2oHjVMzBHIynutTtudBJh+myJgyl68R4Mo9of/feCEa0V5p85q+LjHdim/41F8zQ
         ZbaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id f48-v6si5678132qta.78.2018.05.24.08.29.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 May 2018 08:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5309818BAF8;
	Thu, 24 May 2018 15:29:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5EB946B0;
	Thu, 24 May 2018 15:29:29 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 15/27] iommu: Add IOMMU index argument to
 notifier APIs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0774094d-d3e1-5983-ccb8-3d3412bf44fc@redhat.com>
Date: Thu, 24 May 2018 17:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 24 May 2018 15:29:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 24 May 2018 15:29:30 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: 433N3wcGoaeN

Hi Peter,

On 05/21/2018 04:03 PM, Peter Maydell wrote:
> Add support for multiple IOMMU indexes to the IOMMU notifier APIs.
> When initializing a notifier with iommu_notifier_init(), the caller
> must pass the IOMMU index that it is interested in. When a change
> happens, the IOMMU implementation must pass
> memory_region_notify_iommu() the IOMMU index that has changed and
> that notifiers must be called for.
> 
> IOMMUs which support only a single index don't need to change.
> Callers which only really support working with IOMMUs with a single
> index can use the result of passing MEMTXATTRS_UNSPECIFIED to
> memory_region_iommu_attrs_to_index().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h    | 11 ++++++++++-
>  hw/i386/intel_iommu.c    |  4 ++--
>  hw/ppc/spapr_iommu.c     |  2 +-
>  hw/s390x/s390-pci-inst.c |  4 ++--
>  hw/vfio/common.c         |  6 +++++-
>  hw/virtio/vhost.c        |  7 ++++++-
>  memory.c                 |  8 +++++++-
>  7 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index f6226fb263..4e6b125add 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -71,6 +71,7 @@ struct IOMMUTLBEntry {
>      hwaddr           iova;
>      hwaddr           translated_addr;
>      hwaddr           addr_mask;  /* 0xfff = 4k translation */
> +    int              iommu_idx;
I don't get why ne need iommu_idx field here. On translate the caller
has it. On notify the notifier has it?
>      IOMMUAccessFlags perm;
>  };
>  
> @@ -98,18 +99,21 @@ struct IOMMUNotifier {
>      /* Notify for address space range start <= addr <= end */
>      hwaddr start;
>      hwaddr end;
> +    int iommu_idx;
>      QLIST_ENTRY(IOMMUNotifier) node;
>  };
>  typedef struct IOMMUNotifier IOMMUNotifier;
>  
>  static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>                                         IOMMUNotifierFlag flags,
> -                                       hwaddr start, hwaddr end)
> +                                       hwaddr start, hwaddr end,
> +                                       int iommu_idx)
>  {
>      n->notify = fn;
>      n->notifier_flags = flags;
>      n->start = start;
>      n->end = end;
> +    n->iommu_idx = iommu_idx;
>  }
>  
>  /*
> @@ -323,7 +327,10 @@ typedef struct IOMMUMemoryRegionClass {
>       * Optional method: if this method is not provided, then
>       * memory_region_iommu_num_indexes() will return 1, indicating that
>       * only a single IOMMU index is supported.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
>       */
> +    int (*num_indexes)(IOMMUMemoryRegion *iommu);
>  } IOMMUMemoryRegionClass;
>  
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> @@ -1028,11 +1035,13 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr);
>   * should be notified with an UNMAP followed by a MAP.
>   *
>   * @iommu_mr: the memory region that was changed
> + * @iommu_idx: the IOMMU index for the translation table which has changed
>   * @entry: the new entry in the IOMMU translation table.  The entry
>   *         replaces all old entries for the same virtual I/O address range.
>   *         Deleted entries have .@perm == 0.
>   */
>  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
> +                                int iommu_idx,
>                                  IOMMUTLBEntry entry);
>  
>  /**
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index fb31de9416..b8c9354b0b 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1376,7 +1376,7 @@ static void vtd_iotlb_domain_invalidate(IntelIOMMUState *s, uint16_t domain_id)
>  static int vtd_page_invalidate_notify_hook(IOMMUTLBEntry *entry,
>                                             void *private)
>  {
> -    memory_region_notify_iommu((IOMMUMemoryRegion *)private, *entry);
> +    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry);
>      return 0;
>  }
>  
> @@ -1826,7 +1826,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
>      entry.iova = addr;
>      entry.perm = IOMMU_NONE;
>      entry.translated_addr = 0;
> -    memory_region_notify_iommu(&vtd_dev_as->iommu, entry);
> +    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, entry);
>  
>  done:
>      return true;
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index aaa6010d5c..301708e45e 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -428,7 +428,7 @@ static target_ulong put_tce_emu(sPAPRTCETable *tcet, target_ulong ioba,
>      entry.translated_addr = tce & page_mask;
>      entry.addr_mask = ~page_mask;
>      entry.perm = spapr_tce_iommu_access_flags(tce);
> -    memory_region_notify_iommu(&tcet->iommu, entry);
> +    memory_region_notify_iommu(&tcet->iommu, 0, entry);
>  
>      return H_SUCCESS;
>  }
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index d1a5f79678..7b61367ee3 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -589,7 +589,7 @@ static void s390_pci_update_iotlb(S390PCIIOMMU *iommu, S390IOTLBEntry *entry)
>              }
>  
>              notify.perm = IOMMU_NONE;
> -            memory_region_notify_iommu(&iommu->iommu_mr, notify);
> +            memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
>              notify.perm = entry->perm;
>          }
>  
> @@ -601,7 +601,7 @@ static void s390_pci_update_iotlb(S390PCIIOMMU *iommu, S390IOTLBEntry *entry)
>          g_hash_table_replace(iommu->iotlb, &cache->iova, cache);
>      }
>  
> -    memory_region_notify_iommu(&iommu->iommu_mr, notify);
> +    memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
>  }
>  
>  int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 8e57265edf..fb396cf00a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -507,6 +507,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      if (memory_region_is_iommu(section->mr)) {
>          VFIOGuestIOMMU *giommu;
>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +        int iommu_idx;
>  
>          trace_vfio_listener_region_add_iommu(iova, end);
>          /*
> @@ -523,10 +524,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          llend = int128_add(int128_make64(section->offset_within_region),
>                             section->size);
>          llend = int128_sub(llend, int128_one());
> +        iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +                                                       MEMTXATTRS_UNSPECIFIED);
In that case VFIO ideally wants to be notified for any guest update
(whatever the page set) to reprogram the physical IOMMU corresponding
entries and doesn't want to register a notifier per iommu_idx. Also it
does not know which ones are supported. Is there a corresponding
iommu_idx value? MEMTXATTRS_ANY?

Thanks

Eric
>          iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
>                              IOMMU_NOTIFIER_ALL,
>                              section->offset_within_region,
> -                            int128_get64(llend));
> +                            int128_get64(llend),
> +                            iommu_idx);
>          QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
>  
>          memory_region_register_iommu_notifier(section->mr, &giommu->n);
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 48f4fd7cc9..6218df7683 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -657,6 +657,8 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>                                           iommu_listener);
>      struct vhost_iommu *iommu;
>      Int128 end;
> +    int iommu_idx;
> +    IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
>  
>      if (!memory_region_is_iommu(section->mr)) {
>          return;
> @@ -666,10 +668,13 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>      end = int128_add(int128_make64(section->offset_within_region),
>                       section->size);
>      end = int128_sub(end, int128_one());
> +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +                                                   MEMTXATTRS_UNSPECIFIED);
>      iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
>                          IOMMU_NOTIFIER_UNMAP,
>                          section->offset_within_region,
> -                        int128_get64(end));
> +                        int128_get64(end),
> +                        iommu_idx);
>      iommu->mr = section->mr;
>      iommu->iommu_offset = section->offset_within_address_space -
>                            section->offset_within_region;
> diff --git a/memory.c b/memory.c
> index 07d5fa7862..accb28d694 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1802,6 +1802,9 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
>      iommu_mr = IOMMU_MEMORY_REGION(mr);
>      assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
>      assert(n->start <= n->end);
> +    assert(n->iommu_idx >= 0 &&
> +           n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
> +
>      QLIST_INSERT_HEAD(&iommu_mr->iommu_notify, n, node);
>      memory_region_update_iommu_notify_flags(iommu_mr);
>  }
> @@ -1894,6 +1897,7 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
>  }
>  
>  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
> +                                int iommu_idx,
>                                  IOMMUTLBEntry entry)
>  {
>      IOMMUNotifier *iommu_notifier;
> @@ -1901,7 +1905,9 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
>      assert(memory_region_is_iommu(MEMORY_REGION(iommu_mr)));
>  
>      IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
> -        memory_region_notify_one(iommu_notifier, &entry);
> +        if (iommu_notifier->iommu_idx == iommu_idx) {
> +            memory_region_notify_one(iommu_notifier, &entry);
> +        }
>      }
>  }
>  
> 
