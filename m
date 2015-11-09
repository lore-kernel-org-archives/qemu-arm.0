Received: by 10.182.105.169 with SMTP id gn9csp1084574obb;
        Mon, 9 Nov 2015 02:49:27 -0800 (PST)
X-Received: by 10.13.243.135 with SMTP id c129mr24884364ywf.113.1447066167260;
        Mon, 09 Nov 2015 02:49:27 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g124si7137695ywa.317.2015.11.09.02.49.26
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 78549C05786D;
	Mon,  9 Nov 2015 10:49:26 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9AnH1r001979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:49:20 -0500
Subject: Re: [PATCH 08/16] exec.c: Have one io_mem_watch per AddressSpace
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407A2C.7050906@redhat.com>
Date: Mon, 9 Nov 2015 11:49:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-TUID: 5XvF2C1V2ljx



On 05/11/2015 19:15, Peter Maydell wrote:
> The io_mem_watch MemoryRegion's read and write callbacks pass the
> accesses through to an underlying address space. Now that that
> might be something other than address_space_memory, we need to
> pass the correct AddressSpace in via the opaque pointer. That
> means we need to have one io_mem_watch MemoryRegion per address
> space, rather than sharing one between all address spaces.
> 
> This should also fix gdbstub watchpoints in x86 SMRAM, which would
> previously not have worked correctly.
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

current_cpu is available here, so it should be possible to have only one
io_mem_watch per CPU address space index (i.e. two).

But actually, if the address space can be derived from the attributes,
you just need to fish the right address space out of current_cpu.

> +    as->io_mem_watch = g_new0(MemoryRegion, 1);

This is leaked when the address space goes away.  You can allocate it
statically inside AddressSpace if my alternative plan from above doesn't
work out.

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
