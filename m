Received: by 10.182.105.169 with SMTP id gn9csp1068745obb;
        Fri, 6 Nov 2015 05:34:53 -0800 (PST)
X-Received: by 10.68.230.42 with SMTP id sv10mr17686374pbc.70.1446816893699;
        Fri, 06 Nov 2015 05:34:53 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x236.google.com (mail-pa0-x236.google.com. [2607:f8b0:400e:c03::236])
        by mx.google.com with ESMTPS id ff7si183909pac.213.2015.11.06.05.34.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) client-ip=2607:f8b0:400e:c03::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::236 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pabfh17 with SMTP id fh17so123400116pab.0;
        Fri, 06 Nov 2015 05:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=KRhcK4psWdNT0xFKnrIWmPAV+wT6OzZrMW0RRiGqrLI=;
        b=Xjdy0JCCPQxueMK02mdeOx5tHJm4+yjHqzWlr1hYaoQr3WasjE5bkjeVTNDcHIYUZI
         9eboyYs4xwHGL+i7SKqJqvXdBGSvXgL42aPr19lhiZDUzEMYv7fTU/1GqTQbwMPm4JWx
         gPvmVPj5qkyQDBi0tZjM3ng9XVz7518bPfMsBzrm4VaQwpQTgxJAzRy1fc6vNfIE38o1
         r91gs6Fywf/wj3HvaIgoqfjvgSWtngMMpdk7r9D3IG9OM6TOSJw8gvZcSpvgyJFEi5Q+
         p55e9mrTlZPjKS8gA2eamYK53ADCiqMRj7FiiJUVx8b8SFugYMotI6mOeH5aIwVAh0sT
         jhsQ==
X-Received: by 10.68.69.6 with SMTP id a6mr18093885pbu.62.1446816893252;
        Fri, 06 Nov 2015 05:34:53 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id t13sm184761pbs.88.2015.11.06.05.34.50
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:34:51 -0800 (PST)
Date: Fri, 6 Nov 2015 14:34:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 04/16] exec.c: Add address space index to CPUIOTLBEntry
Message-ID: <20151106133448.GD13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 50o2bAdjvVi6

On Thu, Nov 05, 2015 at 06:15:46PM +0000, Peter Maydell wrote:
> Add the address space index to CPUIOTLBEntry, and use this to pass it
> to iotlb_to_region(), so that we use the correct AddressSpace when
> doing IO path lookups.

Hi Peter,

I think this works but eventually when we add support for CPUs behind
IOMMUs I think things will be easier if we store a pointer to the
AS instead of an index in the IOTLB. address_space_translate_for_iotlb()
with IOMMU support may be implemented so that it returns a different
address space as it walks tha memory hierarchy and translate things.

Do you see any issues with storing pointers to the AS instead of an
index?

Cheers,
Edgar


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cputlb.c                | 7 +++++--
>  exec.c                  | 4 ++--
>  include/exec/cpu-defs.h | 1 +
>  include/exec/exec-all.h | 2 +-
>  softmmu_template.h      | 4 ++--
>  5 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/cputlb.c b/cputlb.c
> index e753083..ae55035 100644
> --- a/cputlb.c
> +++ b/cputlb.c
> @@ -397,6 +397,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
>      /* refill the tlb */
>      env->iotlb[mmu_idx][index].addr = iotlb - vaddr;
>      env->iotlb[mmu_idx][index].attrs = attrs;
> +    env->iotlb[mmu_idx][index].asidx = asidx;
>      te->addend = addend - vaddr;
>      if (prot & PAGE_READ) {
>          te->addr_read = address;
> @@ -448,6 +449,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
>      void *p;
>      MemoryRegion *mr;
>      CPUState *cpu = ENV_GET_CPU(env1);
> +    CPUIOTLBEntry *iotlbentry;
>  
>      page_index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
>      mmu_idx = cpu_mmu_index(env1, true);
> @@ -455,8 +457,9 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
>                   (addr & TARGET_PAGE_MASK))) {
>          cpu_ldub_code(env1, addr);
>      }
> -    pd = env1->iotlb[mmu_idx][page_index].addr & ~TARGET_PAGE_MASK;
> -    mr = iotlb_to_region(cpu, pd);
> +    iotlbentry = &env1->iotlb[mmu_idx][page_index];
> +    pd = iotlbentry->addr & ~TARGET_PAGE_MASK;
> +    mr = iotlb_to_region(cpu, pd, iotlbentry->asidx);
>      if (memory_region_is_unassigned(mr)) {
>          CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> diff --git a/exec.c b/exec.c
> index 92e76fa..5e78d82 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2228,9 +2228,9 @@ static uint16_t dummy_section(PhysPageMap *map, AddressSpace *as,
>      return phys_section_add(map, &section);
>  }
>  
> -MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index)
> +MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index, int asidx)
>  {
> -    CPUAddressSpace *cpuas = &cpu->cpu_ases[0];
> +    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
>      AddressSpaceDispatch *d = atomic_rcu_read(&cpuas->memory_dispatch);
>      MemoryRegionSection *sections = d->map.sections;
>  
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 5093be2..d102d79 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -129,6 +129,7 @@ QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
>  typedef struct CPUIOTLBEntry {
>      hwaddr addr;
>      MemTxAttrs attrs;
> +    int asidx;
>  } CPUIOTLBEntry;
>  
>  #define CPU_COMMON_TLB \
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 472d0fc..5dba8aa 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -398,7 +398,7 @@ extern uintptr_t tci_tb_ptr;
>  #if !defined(CONFIG_USER_ONLY)
>  
>  struct MemoryRegion *iotlb_to_region(CPUState *cpu,
> -                                     hwaddr index);
> +                                     hwaddr index, int asidx);
>  
>  void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_idx,
>                uintptr_t retaddr);
> diff --git a/softmmu_template.h b/softmmu_template.h
> index 6803890..31a0f62 100644
> --- a/softmmu_template.h
> +++ b/softmmu_template.h
> @@ -150,7 +150,7 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
>      uint64_t val;
>      CPUState *cpu = ENV_GET_CPU(env);
>      hwaddr physaddr = iotlbentry->addr;
> -    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
> +    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->asidx);
>  
>      physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
>      cpu->mem_io_pc = retaddr;
> @@ -357,7 +357,7 @@ static inline void glue(io_write, SUFFIX)(CPUArchState *env,
>  {
>      CPUState *cpu = ENV_GET_CPU(env);
>      hwaddr physaddr = iotlbentry->addr;
> -    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
> +    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->asidx);
>  
>      physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
>      if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
> -- 
> 1.9.1
> 
