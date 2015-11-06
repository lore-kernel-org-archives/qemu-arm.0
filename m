Received: by 10.182.105.169 with SMTP id gn9csp1065271obb;
        Fri, 6 Nov 2015 05:28:04 -0800 (PST)
X-Received: by 10.66.97.105 with SMTP id dz9mr17780461pab.101.1446816484948;
        Fri, 06 Nov 2015 05:28:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x236.google.com (mail-pa0-x236.google.com. [2607:f8b0:400e:c03::236])
        by mx.google.com with ESMTPS id gt4si206188pbb.89.2015.11.06.05.28.04
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:28:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) client-ip=2607:f8b0:400e:c03::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pacdm15 with SMTP id dm15so99083679pac.3;
        Fri, 06 Nov 2015 05:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=/VKcIQG/L+QIbKZG4Fi7POlIob+vErQQdlCdgAh5Ufg=;
        b=WHeMv/SrUZRKIxhcTRiRmZVHB2v4dVNEPWWplKsgkHkbtbN1U31ML3EfMTxDDl+WNT
         WxZ4M6DLeAdRmCtu15wfDR8DxlyCmE9mYgjZmITY0js31DENjAaYsaw6oFMhsN2Pd78B
         B30M9yEA9xAvA3jiRI2OG3qd1l0C5AdK+BL6EaltfMkUALiBcdPE4k1X9b7HcwofhQ1n
         wu3GTF4hYSJx0gZYnd5k52lTDfIK1HV4WXLSqK/PHHxfehNRaYDC8BmkG+8Q85UFgHXq
         n5465cfN2Ds9hUX4PP6y3ZXZ/GBrM+yiPVmqEzsXDgirRDAwVZPEQhz2IQqMmYNJsX+0
         pr0Q==
X-Received: by 10.68.233.233 with SMTP id tz9mr17599773pbc.15.1446816484304;
        Fri, 06 Nov 2015 05:28:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id bn1sm196960pad.17.2015.11.06.05.28.02
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:28:02 -0800 (PST)
Date: Fri, 6 Nov 2015 14:27:59 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying
 AddressSpace to use
Message-ID: <20151106132759.GC13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: F72Ac+Bz6NwE

On Thu, Nov 05, 2015 at 06:15:45PM +0000, Peter Maydell wrote:
> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
> to tell the core code which AddressSpace to use.
> 
> The AddressSpace is specified by the index into the array of ASes which
> were registered with cpu_address_space_init().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cputlb.c                |  6 +++---
>  exec.c                  |  7 ++++---
>  include/exec/exec-all.h | 33 ++++++++++++++++++++++++++++++---
>  target-arm/helper.c     |  2 +-
>  target-i386/helper.c    |  2 +-
>  5 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/cputlb.c b/cputlb.c
> index bf1d50a..e753083 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -343,7 +343,7 @@ static void tlb_add_large_page(CPUArchState *env, target_ulong vaddr,
>   * Called from TCG-generated code, which is under an RCU read-side
>   * critical section.
>   */
> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> +void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
>                               hwaddr paddr, MemTxAttrs attrs, int prot,
>                               int mmu_idx, target_ulong size)
>  {
> @@ -363,7 +363,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>      }
>  
>      sz = size;
> -    section = address_space_translate_for_iotlb(cpu, paddr, &xlat, &sz);
> +    section = address_space_translate_for_iotlb(cpu, asidx, paddr, &xlat, &sz);
>      assert(sz >= TARGET_PAGE_SIZE);
>  
>  #if defined(DEBUG_TLB)
> @@ -433,7 +433,7 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size)
>  {
> -    tlb_set_page_with_attrs(cpu, vaddr, paddr, MEMTXATTRS_UNSPECIFIED,
> +    tlb_set_page_with_attrs(cpu, vaddr, 0, paddr, MEMTXATTRS_UNSPECIFIED,
>                              prot, mmu_idx, size);
>  }
>  
> diff --git a/exec.c b/exec.c
> index 6a2a694..92e76fa 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -445,12 +445,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
>  
>  /* Called from RCU critical section */
>  MemoryRegionSection *
> -address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr,
> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>                                    hwaddr *xlat, hwaddr *plen)

Does it make sense to replace the CPUState argument with an AddressSpace *
and have the callers do the cpu->cpu_ases[asidx]?
It would be more consistent and eventually maybe eliminate the need for
address_space_translate_for_iotlb in favor of calling address_space_translate
directly?



>  {
>      MemoryRegionSection *section;
> -    section = address_space_translate_internal(cpu->cpu_ases[0].memory_dispatch,
> -                                               addr, xlat, plen, false);
> +    AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
> +
> +    section = address_space_translate_internal(d, addr, xlat, plen, false);
>  
>      assert(!section->mr->iommu_ops);
>      return section;
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 90130ca..472d0fc 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -144,7 +144,34 @@ void tlb_flush_by_mmuidx(CPUState *cpu, ...);
>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size);
> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> +/**
> + * tlb_set_page_with_attrs:
> + * @cpu: CPU to add this TLB entry for
> + * @vaddr: virtual address of page to add entry for
> + * @asidx: index of the AddressSpace the physical address is in
> + * @paddr: physical address of the page
> + * @attrs: memory transaction attributes
> + * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
> + * @mmu_idx: MMU index to insert TLB entry for
> + * @size: size of the page in bytes
> + *
> + * Add an entry to this CPU's TLB (a mapping from virtual address
> + * @vaddr to physical address @paddr) with the specified memory
> + * transaction attributes. This is generally called by the target CPU
> + * specific code after it has been called through the tlb_fill()
> + * entry point and performed a successful page table walk to find
> + * the physical address and attributes for the virtual address
> + * which provoked the TLB miss.
> + *
> + * At most one entry for a given virtual address is permitted. Only a
> + * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
> + * used by tlb_flush_page.
> + *
> + * @asidx is the index of the AddressSpace in the cpu->ases array;
> + * if the CPU does not support multiple AddressSpaces then it will
> + * always be zero.
> + */
> +void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
>                               hwaddr paddr, MemTxAttrs attrs,
>                               int prot, int mmu_idx, target_ulong size);
>  void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr);
> @@ -400,8 +427,8 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
>  void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
>  
>  MemoryRegionSection *
> -address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr, hwaddr *xlat,
> -                                  hwaddr *plen);
> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> +                                  hwaddr *xlat, hwaddr *plen);
>  hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>                                         MemoryRegionSection *section,
>                                         target_ulong vaddr,
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4ecae61..174371b 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -7315,7 +7315,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
>          /* Map a single [sub]page.  */
>          phys_addr &= TARGET_PAGE_MASK;
>          address &= TARGET_PAGE_MASK;
> -        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
> +        tlb_set_page_with_attrs(cs, address, 0, phys_addr, attrs,
>                                  prot, mmu_idx, page_size);
>          return 0;
>      }
> diff --git a/target-i386/helper.c b/target-i386/helper.c
> index d18be95..1c43717 100644
> --- a/target-i386/helper.c
> +++ b/target-i386/helper.c
> @@ -962,7 +962,7 @@ do_check_protect_pse36:
>      page_offset = vaddr & (page_size - 1);
>      paddr = pte + page_offset;
>  
> -    tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
> +    tlb_set_page_with_attrs(cs, vaddr, 0, paddr, cpu_get_mem_attrs(env),
>                              prot, mmu_idx, page_size);
>      return 0;
>   do_fault_rsvd:
> -- 
> 1.9.1
> 
