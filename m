Received: by 10.182.105.169 with SMTP id gn9csp1074191obb;
        Fri, 6 Nov 2015 05:46:03 -0800 (PST)
X-Received: by 10.69.25.40 with SMTP id in8mr11613951pbd.96.1446817563378;
        Fri, 06 Nov 2015 05:46:03 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com. [2607:f8b0:400e:c03::22e])
        by mx.google.com with ESMTPS id yo3si232699pab.227.2015.11.06.05.46.03
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:46:03 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) client-ip=2607:f8b0:400e:c03::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so127796683pas.2;
        Fri, 06 Nov 2015 05:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=zW8x36/1hRLgkDL4pX3UhdpolFl6tSlKbX9xxLt1lpU=;
        b=jtYzKIKqpaK6sjJ22iaT7tsOSPnwOV1LRVv0Aq8p5exHkTjKHggL8f0yqTTEp2NYRk
         Aam271p3LhcWFp4/F4xdewiaVTS4Lz00oh8qeaAE7ibWFOnK/fT9uu33Z6clYzN0slcE
         K1wkMi3DCkuxmb0GTh0nDUCPQXBnNBBW+xn4UpNNBGBqPVSX18zeknYs8Dao6+ZdGHx2
         y1hEY44/+tUV6uuPQGjPDD2QECsd9y5yK5dhyWqZc+XBILn/U8MmLmMy/9+oWp1o3vrj
         KrIt2/WXpmEmAPrj9FKqH/Qn7nXMoDaSso5Hlcr256mW/P1nXE/GhkhhCmXHpQK1JArb
         eqww==
X-Received: by 10.66.140.39 with SMTP id rd7mr18115089pab.86.1446817562923;
        Fri, 06 Nov 2015 05:46:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id yn8sm66068pac.32.2015.11.06.05.46.00
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:46:01 -0800 (PST)
Date: Fri, 6 Nov 2015 14:45:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 08/16] exec.c: Have one io_mem_watch per AddressSpace
Message-ID: <20151106134558.GG13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: nMELbysGEmow

On Thu, Nov 05, 2015 at 06:15:50PM +0000, Peter Maydell wrote:
> The io_mem_watch MemoryRegion's read and write callbacks pass the
> accesses through to an underlying address space. Now that that
> might be something other than address_space_memory, we need to
> pass the correct AddressSpace in via the opaque pointer. That
> means we need to have one io_mem_watch MemoryRegion per address
> space, rather than sharing one between all address spaces.
> 
> This should also fix gdbstub watchpoints in x86 SMRAM, which would
> previously not have worked correctly.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c                | 40 +++++++++++++++++++++++-----------------
>  include/exec/memory.h |  2 ++
>  2 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index bc6ab8a..9998fa0 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -163,8 +163,6 @@ static void io_mem_init(void);
>  static void memory_map_init(void);
>  static void tcg_commit(MemoryListener *listener);
>  
> -static MemoryRegion io_mem_watch;
> -
>  /**
>   * CPUAddressSpace: all the information a CPU needs about an AddressSpace
>   * @cpu: the CPU whose AddressSpace this is
> @@ -334,12 +332,6 @@ static MemoryRegionSection *phys_page_find(PhysPageEntry lp, hwaddr addr,
>      }
>  }
>  
> -bool memory_region_is_unassigned(MemoryRegion *mr)
> -{
> -    return mr != &io_mem_rom && mr != &io_mem_notdirty && !mr->rom_device
> -        && mr != &io_mem_watch;
> -}
> -
>  /* Called from RCU critical section */
>  static MemoryRegionSection *address_space_lookup_region(AddressSpaceDispatch *d,
>                                                          hwaddr addr,
> @@ -2045,17 +2037,18 @@ static MemTxResult watch_mem_read(void *opaque, hwaddr addr, uint64_t *pdata,
>  {
>      MemTxResult res;
>      uint64_t data;
> +    AddressSpace *as = opaque;
>  
>      check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_READ);
>      switch (size) {
>      case 1:
> -        data = address_space_ldub(&address_space_memory, addr, attrs, &res);
> +        data = address_space_ldub(as, addr, attrs, &res);
>          break;
>      case 2:
> -        data = address_space_lduw(&address_space_memory, addr, attrs, &res);
> +        data = address_space_lduw(as, addr, attrs, &res);
>          break;
>      case 4:
> -        data = address_space_ldl(&address_space_memory, addr, attrs, &res);
> +        data = address_space_ldl(as, addr, attrs, &res);
>          break;
>      default: abort();
>      }
> @@ -2068,17 +2061,18 @@ static MemTxResult watch_mem_write(void *opaque, hwaddr addr,
>                                     MemTxAttrs attrs)
>  {
>      MemTxResult res;
> +    AddressSpace *as = opaque;
>  
>      check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_WRITE);
>      switch (size) {
>      case 1:
> -        address_space_stb(&address_space_memory, addr, val, attrs, &res);
> +        address_space_stb(as, addr, val, attrs, &res);
>          break;
>      case 2:
> -        address_space_stw(&address_space_memory, addr, val, attrs, &res);
> +        address_space_stw(as, addr, val, attrs, &res);
>          break;
>      case 4:
> -        address_space_stl(&address_space_memory, addr, val, attrs, &res);
> +        address_space_stl(as, addr, val, attrs, &res);
>          break;
>      default: abort();
>      }
> @@ -2091,6 +2085,15 @@ static const MemoryRegionOps watch_mem_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> +bool memory_region_is_unassigned(MemoryRegion *mr)
> +{
> +    /* Checking the ops pointer of the MemoryRegion is strictly
> +     * speaking looking at private information of the MemoryRegion :-(
> +     */
> +    return mr != &io_mem_rom && mr != &io_mem_notdirty && !mr->rom_device
> +        && mr->ops != &watch_mem_ops;
> +}
> +
>  static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
>                                  unsigned len, MemTxAttrs attrs)
>  {
> @@ -2251,8 +2254,6 @@ static void io_mem_init(void)
>                            NULL, UINT64_MAX);
>      memory_region_init_io(&io_mem_notdirty, NULL, &notdirty_mem_ops, NULL,
>                            NULL, UINT64_MAX);
> -    memory_region_init_io(&io_mem_watch, NULL, &watch_mem_ops, NULL,
> -                          NULL, UINT64_MAX);
>  }
>  
>  static void mem_begin(MemoryListener *listener)
> @@ -2267,7 +2268,7 @@ static void mem_begin(MemoryListener *listener)
>      assert(n == PHYS_SECTION_NOTDIRTY);
>      n = dummy_section(&d->map, as, &io_mem_rom);
>      assert(n == PHYS_SECTION_ROM);
> -    n = dummy_section(&d->map, as, &io_mem_watch);
> +    n = dummy_section(&d->map, as, as->io_mem_watch);
>      assert(n == PHYS_SECTION_WATCH);
>  
>      d->phys_map  = (PhysPageEntry) { .ptr = PHYS_MAP_NODE_NIL, .skip = 1 };
> @@ -2315,6 +2316,10 @@ static void tcg_commit(MemoryListener *listener)
>  
>  void address_space_init_dispatch(AddressSpace *as)
>  {
> +    as->io_mem_watch = g_new0(MemoryRegion, 1);
> +    memory_region_init_io(as->io_mem_watch, NULL, &watch_mem_ops, as,
> +                          NULL, UINT64_MAX);
> +
>      as->dispatch = NULL;
>      as->dispatch_listener = (MemoryListener) {
>          .begin = mem_begin,
> @@ -2339,6 +2344,7 @@ void address_space_destroy_dispatch(AddressSpace *as)
>      if (d) {
>          call_rcu(d, address_space_dispatch_free, rcu);
>      }
> +    memory_region_unref(as->io_mem_watch);
>  }
>  
>  static void memory_map_init(void)
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0f07159..e5d98f8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -246,6 +246,8 @@ struct AddressSpace {
>      struct AddressSpaceDispatch *next_dispatch;
>      MemoryListener dispatch_listener;
>  
> +    MemoryRegion *io_mem_watch;
> +
>      QTAILQ_ENTRY(AddressSpace) address_spaces_link;
>  };
>  
> -- 
> 1.9.1
> 
