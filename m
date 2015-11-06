Received: by 10.182.105.169 with SMTP id gn9csp1094860obb;
        Fri, 6 Nov 2015 06:22:32 -0800 (PST)
X-Received: by 10.60.220.135 with SMTP id pw7mr8270444oec.51.1446819752670;
        Fri, 06 Nov 2015 06:22:32 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x235.google.com (mail-pa0-x235.google.com. [2607:f8b0:400e:c03::235])
        by mx.google.com with ESMTPS id wg5si194853oeb.95.2015.11.06.06.22.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:22:32 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) client-ip=2607:f8b0:400e:c03::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::235 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pacdm15 with SMTP id dm15so100218611pac.3;
        Fri, 06 Nov 2015 06:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=KLgNj0Cqw6sU0GYZrbTe4FMamvZxjyHuKYZ+gNLIxzI=;
        b=WKLkdKD13Pz812wFgWmhSuNFxFKfbW/y3iliUTJbOL2FU/qRZcaEHKwNVXfieks+ls
         k1Q0D9fvf2Pca5yXYWkRShWliZoDl6NN4koJ3bDeek0aX+uciz7i1brmx4xQKK3HBf8Z
         3C3Mw2PTsKGHtqgmZmApqmWN0niF4NUpK+O65yaoB/Ww3XNRAjSh9R7tXikxxRnvdQiX
         mF6BhuC7XxOpZQNhafqDBn8294fUmch1Pnz6OX8XVj0VObvZzaT9n/Qjf20lihlEB/aL
         ntqUdDwHKV1sCen0q3Q92L25tJG4qWCv+Ac/ojcEGWN8fjCEsdjdi6p/KcokGtvv0F/+
         OFgA==
X-Received: by 10.68.143.5 with SMTP id sa5mr18170777pbb.14.1446819752075;
        Fri, 06 Nov 2015 06:22:32 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id n1sm461237pap.7.2015.11.06.06.22.29
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:22:30 -0800 (PST)
Date: Fri, 6 Nov 2015 15:22:27 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in
 page table walks
Message-ID: <20151106142227.GL13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 91DC/ZGdf1+E

On Thu, Nov 05, 2015 at 06:15:51PM +0000, Peter Maydell wrote:
> If we have a secure address space, use it in page table walks:
>  * when doing the physical accesses to read descriptors,
>    make them through the correct address space
>  * when the final result indicates a secure access, pass the
>    correct address space index to tlb_set_page_with_attrs()
> 
> (The descriptor reads are the only direct physical accesses
> made in target-arm/ for CPUs which might have TrustZone.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Nice to see how this falls into place like this :-)

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target-arm/cpu.h    | 29 +++++++++++++++++++++++++++++
>  target-arm/helper.c | 10 +++++++---
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 815fef8..8dbf4d4 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1720,6 +1720,12 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
>      return el;
>  }
>  
> +/* Indexes used when registering address spaces with cpu_address_space_init */
> +typedef enum ARMASIdx {
> +    ARMASIdx_NS = 0,
> +    ARMASIdx_S = 1,
> +} ARMASIdx;
> +
>  /* Return the Exception Level targeted by debug exceptions;
>   * currently always EL1 since we don't implement EL2 or EL3.
>   */
> @@ -1991,4 +1997,27 @@ enum {
>      QEMU_PSCI_CONDUIT_HVC = 2,
>  };
>  
> +#ifndef CONFIG_USER_ONLY
> +/* Return the address space index to use for a memory access
> + * (which depends on whether the access is S or NS, and whether
> + * the board gave us a separate AddressSpace for S accesses).
> + */
> +static inline int arm_asidx(CPUState *cs, bool is_secure)
> +{
> +    if (is_secure && cs->num_ases > 1) {
> +        return ARMASIdx_S;
> +    }
> +    return ARMASIdx_NS;
> +}
> +
> +/* Return the AddressSpace to use for a memory access
> + * (which depends on whether the access is S or NS, and whether
> + * the board gave us a separate AddressSpace for S accesses).
> + */
> +static inline AddressSpace *arm_addressspace(CPUState *cs, bool is_secure)
> +{
> +    return cpu_get_address_space(cs, arm_asidx(cs, is_secure));
> +}
> +#endif
> +
>  #endif
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 174371b..242928d 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6260,13 +6260,14 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>      MemTxAttrs attrs = {};
> +    AddressSpace *as = arm_addressspace(cs, is_secure);
>  
>      attrs.secure = is_secure;
>      addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
>      if (fi->s1ptw) {
>          return 0;
>      }
> -    return address_space_ldl(cs->as, addr, attrs, NULL);
> +    return address_space_ldl(as, addr, attrs, NULL);
>  }
>  
>  static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
> @@ -6276,13 +6277,14 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>      MemTxAttrs attrs = {};
> +    AddressSpace *as = arm_addressspace(cs, is_secure);
>  
>      attrs.secure = is_secure;
>      addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
>      if (fi->s1ptw) {
>          return 0;
>      }
> -    return address_space_ldq(cs->as, addr, attrs, NULL);
> +    return address_space_ldq(as, addr, attrs, NULL);
>  }
>  
>  static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
> @@ -7307,6 +7309,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
>      target_ulong page_size;
>      int prot;
>      int ret;
> +    int asidx;
>      MemTxAttrs attrs = {};
>  
>      ret = get_phys_addr(env, address, access_type, mmu_idx, &phys_addr,
> @@ -7315,7 +7318,8 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
>          /* Map a single [sub]page.  */
>          phys_addr &= TARGET_PAGE_MASK;
>          address &= TARGET_PAGE_MASK;
> -        tlb_set_page_with_attrs(cs, address, 0, phys_addr, attrs,
> +        asidx = arm_asidx(cs, attrs.secure);
> +        tlb_set_page_with_attrs(cs, address, asidx, phys_addr, attrs,
>                                  prot, mmu_idx, page_size);
>          return 0;
>      }
> -- 
> 1.9.1
> 
