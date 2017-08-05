Received: by 10.25.221.202 with SMTP id w71csp143599lfi;
        Fri, 4 Aug 2017 18:16:07 -0700 (PDT)
X-Received: by 10.55.146.133 with SMTP id u127mr5276167qkd.17.1501895766984;
        Fri, 04 Aug 2017 18:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501895766; cv=none;
        d=google.com; s=arc-20160816;
        b=jwOkDJbagsXdH2PpnndwYPWhfFYOU6WkwaT7jElq7c0nAzhnQEVzknH65esLntxPu+
         9LjgTJ++XsJx0jEUSQJbdlwtQIO1zCVWXcxDYV3gWnODbm2o3//KbtIBLvfvduRDdyHx
         Q0ppe7hnhPCOEhJFG6OZkjkyD94TH+txtFvEM0d04nxwVoaDguewFuxq/5MHEeV1AXNG
         Xb47Xn8OYUCzynyDiEeDnckUfv3uPji01UgaEskL84solcHi+D93B5k1cCYNxmVuP2tm
         9kV24t0I/3G+8gLEjj0BBdJUVuP7tkJ+keNnfFzFYNYy3k2M0HDTE0ST/iR5gi/suojq
         BIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=nCytR8/ihAtqRJi6UyUEGrHlo92hiL6bMzDIVBLRLac=;
        b=ht+df8RB02lKWiduKBB/IpivTzwDzyXfmJDkE2gblX/BIeho703dr/UmLyuAVt0MyN
         2+/1e3G60zMYz+wuVIRZUQhwkl0rnvJfgsnarFU2QaeXoaTvKI/wgvzh24YwFxX5SIxx
         jR6nITnGugL6CY5B67AlThXiJ8QAaf7MjMYx2jlO2111sMXEb3l0LdHyyvRYpdzpDonh
         P1dmy+6iBPVKCS/Gcc+FnVKVkT94SNJnQTe36Mmg9VkCr+QMvtgTULdSmokoTSVpdewT
         U6Do9oWTj0eem8BQHOkeziqWrJqUvBn855LEGY4uzoGsAN4xJ8AiBkNF4KjWol0o6G+P
         kddg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=kbcKm1ZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si2944247qkp.394.2017.08.04.18.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=kbcKm1ZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddnhE-0003n5-FS
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnh7-0003ma-Nc
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnh5-0000we-1a
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:15:57 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:37689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddnh4-0000u6-M1; Fri, 04 Aug 2017 21:15:54 -0400
Received: by mail-lf0-x242.google.com with SMTP id x16so2016960lfb.4;
	Fri, 04 Aug 2017 18:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nCytR8/ihAtqRJi6UyUEGrHlo92hiL6bMzDIVBLRLac=;
	b=kbcKm1ZKqce06+qkn1WBPrVPzLcm/1BqY5ayy9JMmejvpVxfO5pEvTyXxOzB/1PzBH
	/KJrTlrU89KFsg4Acemr/RLnHriW+4QT+KRbiyhc0nTfMnD2DuUlUMX5IfedCXsH6bs/
	opJ1vxIlYX40Wn39efFUChbGX1Y6CB6wfW+HJJC5hkaHBG5VbsKD/eKfIv5m9++roMfF
	8ArOJGbHLqWL+7GjG9WtG4759lGImRS3b8iPcAXLuMim70KBPuSsrTzPT5Fqez5G7fW2
	e0HtYVJiDN/07C34l9u0bsTRtbnPA/d9OWLL2ROtgdm7q1H6ZsO24kPnsMW7UuNcCljf
	XDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nCytR8/ihAtqRJi6UyUEGrHlo92hiL6bMzDIVBLRLac=;
	b=gq9GxS7Cj+lGuYiCFzrPSr9zdKDKcbOcAEQl6ve0fsY7EtRnFEBgKSRkdpIFKupXHG
	s0spjfDne0dKEsd3OQXzwAbhnrxTmAWIEQvjHeYPBCnxG8dkjy4IeVe7vTnYJdkcxt9z
	Mpr1Xtg9toFHXnSkR56X6tKacQoCB50GY9hlZn+X5KRfHSUbsj1FrrxraT4OG24E1Ujh
	S8jrBpxuDc35lyNxCc7TSaj8+y9mXmy1fAYzZYrE229BfWiDnla3t0o/KRsBZVFKcJIR
	MpT4tiDxIKcioJtFQaw7u1pZAeXgkJc6NkcQA3TIb2ykAt5TZbAfW/eLhuv6y5/XtZnz
	UEEQ==
X-Gm-Message-State: AHYfb5gZNyuDPhLMpi7GtfeI+8CLyxe+W55DpRQ+ScBcFyKnkjghw/S8
	KJEQ/lDbQL7e4w==
X-Received: by 10.25.146.9 with SMTP id u9mr1506816lfd.88.1501895753255;
	Fri, 04 Aug 2017 18:15:53 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id y1sm1382421lja.24.2017.08.04.18.15.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 18:15:52 -0700 (PDT)
Date: Sat, 5 Aug 2017 03:15:52 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805011551.GB4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 3/8] cputlb: Support generating CPU
 exceptions on memory transaction failures
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +NWPRIg3Tbnt

On Fri, Aug 04, 2017 at 06:20:44PM +0100, Peter Maydell wrote:
> Call the new cpu_transaction_failed() hook at the places where
> CPU generated code interacts with the memory system:
>  io_readx()
>  io_writex()
>  get_page_addr_code()
> 
> Any access from C code (eg via cpu_physical_memory_rw(),
> address_space_rw(), ld/st_*_phys()) will *not* trigger CPU exceptions
> via cpu_transaction_failed().  Handling for transactions failures for
> this kind of call should be done by using a function which returns a
> MemTxResult and treating the failure case appropriately in the
> calling code.
> 
> In an ideal world we would not generate CPU exceptions for
> instruction fetch failures in get_page_addr_code() but instead wait
> until the code translation process tried a load and it failed;
> however that change would require too great a restructuring and
> redesign to attempt at this point.

You're right but onsidering the lack of models for I caches and
prefetching, I don't think that matters much...

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  softmmu_template.h |  4 ++--
>  accel/tcg/cputlb.c | 32 ++++++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/softmmu_template.h b/softmmu_template.h
> index 4a2b665..d756329 100644
> --- a/softmmu_template.h
> +++ b/softmmu_template.h
> @@ -101,7 +101,7 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
>                                                uintptr_t retaddr)
>  {
>      CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
> -    return io_readx(env, iotlbentry, addr, retaddr, DATA_SIZE);
> +    return io_readx(env, iotlbentry, mmu_idx, addr, retaddr, DATA_SIZE);
>  }
>  #endif
>  
> @@ -262,7 +262,7 @@ static inline void glue(io_write, SUFFIX)(CPUArchState *env,
>                                            uintptr_t retaddr)
>  {
>      CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
> -    return io_writex(env, iotlbentry, val, addr, retaddr, DATA_SIZE);
> +    return io_writex(env, iotlbentry, mmu_idx, val, addr, retaddr, DATA_SIZE);
>  }
>  
>  void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 85635ae..e72415a 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -747,6 +747,7 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
>  }
>  
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
> +                         int mmu_idx,
>                           target_ulong addr, uintptr_t retaddr, int size)
>  {
>      CPUState *cpu = ENV_GET_CPU(env);
> @@ -754,6 +755,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
>      uint64_t val;
>      bool locked = false;
> +    MemTxResult r;
>  
>      physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
>      cpu->mem_io_pc = retaddr;
> @@ -767,7 +769,12 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    memory_region_dispatch_read(mr, physaddr, &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, physaddr,
> +                                    &val, size, iotlbentry->attrs);
> +    if (r != MEMTX_OK) {
> +        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_LOAD,
> +                               mmu_idx, iotlbentry->attrs, r, retaddr);
> +    }
>      if (locked) {
>          qemu_mutex_unlock_iothread();
>      }
> @@ -776,6 +783,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>  }
>  
>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
> +                      int mmu_idx,
>                        uint64_t val, target_ulong addr,
>                        uintptr_t retaddr, int size)
>  {
> @@ -783,6 +791,7 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      hwaddr physaddr = iotlbentry->addr;
>      MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
>      bool locked = false;
> +    MemTxResult r;
>  
>      physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
>      if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
> @@ -795,7 +804,12 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    memory_region_dispatch_write(mr, physaddr, val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, physaddr,
> +                                     val, size, iotlbentry->attrs);
> +    if (r != MEMTX_OK) {
> +        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
> +                               mmu_idx, iotlbentry->attrs, r, retaddr);
> +    }
>      if (locked) {
>          qemu_mutex_unlock_iothread();
>      }
> @@ -845,6 +859,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>      MemoryRegion *mr;
>      CPUState *cpu = ENV_GET_CPU(env);
>      CPUIOTLBEntry *iotlbentry;
> +    hwaddr physaddr;
>  
>      index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
>      mmu_idx = cpu_mmu_index(env, true);
> @@ -868,6 +883,19 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
>          }
>          qemu_mutex_unlock_iothread();
>  
> +        /* Give the new-style cpu_transaction_failed() hook first chance
> +         * to handle this.
> +         * This is not the ideal place to detect and generate CPU
> +         * exceptions for instruction fetch failure (for instance
> +         * we don't know the length of the access that the CPU would
> +         * use, and it would be better to go ahead and try the access
> +         * and use the MemTXResult it produced). However it is the
> +         * simplest place we have currently available for the check.
> +         */
> +        physaddr = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> +        cpu_transaction_failed(cpu, physaddr, addr, 0, MMU_INST_FETCH, mmu_idx,
> +                               iotlbentry->attrs, MEMTX_DECODE_ERROR, 0);
> +
>          cpu_unassigned_access(cpu, addr, false, true, 0, 4);
>          /* The CPU's unassigned access hook might have longjumped out
>           * with an exception. If it didn't (or there was no hook) then
> -- 
> 2.7.4
> 
> 
