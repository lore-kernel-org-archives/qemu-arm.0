Received: by 10.182.105.169 with SMTP id gn9csp1070430obb;
        Fri, 6 Nov 2015 05:38:04 -0800 (PST)
X-Received: by 10.66.219.228 with SMTP id pr4mr17574911pac.99.1446817084324;
        Fri, 06 Nov 2015 05:38:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22b.google.com (mail-pa0-x22b.google.com. [2607:f8b0:400e:c03::22b])
        by mx.google.com with ESMTPS id wk3si249660pab.93.2015.11.06.05.38.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:38:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22b as permitted sender) client-ip=2607:f8b0:400e:c03::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22b as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by padhx2 with SMTP id hx2so115385696pad.1;
        Fri, 06 Nov 2015 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=ogsD87I61g6VapomJVImdLBM67RQ4zUhiPeEbYxm7dg=;
        b=QZfRP2FDWnQzniRQTFSLDp0ovo76jYYd12vKp1tXq6Bkj+0SiWkc/gbws62iCnAPHm
         E6i1jluLMjQpixrwyXT9KWbtKPrm/MEeW2aZgJj806WYOhsLh9l2DGeijOXz+35fr7qr
         sztjp0v3ZncoRd17+8pX9m91FvEPz4ApRx/9lSFlIjXWdENGt01vGqdOxbaU9VsXovak
         JUaiG2jDjGY4oyq4oxVQChazezOVOzTu5WMNUI1JDgL+OZzEoqW00ePxKuKZItoEINop
         94LqhB427+UQcuNkYnjJLDI9mlKg+6T/n0R3HsEeZnNyfMc3UlqldjeAZy8/wvj71MvV
         C4pA==
X-Received: by 10.68.203.168 with SMTP id kr8mr17677399pbc.60.1446817083803;
        Fri, 06 Nov 2015 05:38:03 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id wq1sm236487pbc.49.2015.11.06.05.38.01
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:38:02 -0800 (PST)
Date: Fri, 6 Nov 2015 14:37:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 06/16] include/qom/cpu.h: Add new
 get_phys_page_asidx_debug method
Message-ID: <20151106133758.GE13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-7-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-7-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: kDa/7XpBiFNh

On Thu, Nov 05, 2015 at 06:15:48PM +0000, Peter Maydell wrote:
> Add a new optional method get_phys_page_asidx_debug to CPUClass.
> This is like the existing get_phys_page_debug, but also returns
> the address space index to use for the access. This is necessary
> for CPUs which have multiple address spaces.
> 
> We provide a wrapper function cpu_get_phys_page_asidx_debug()
> which falls back to the existing get_phys_page_debug(), so we
> don't need to change every target CPU.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qom/cpu.h | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index ae17932..10ef5cc 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -98,6 +98,9 @@ struct TranslationBlock;
>   * #TranslationBlock.
>   * @handle_mmu_fault: Callback for handling an MMU fault.
>   * @get_phys_page_debug: Callback for obtaining a physical address.
> + * @get_phys_page_asidx_debug: Callback for obtaining a physical address and the
> + *       associated address index. CPUs which have more than one AddressSpace
> + *       should implement this instead of get_phys_page_debug.
>   * @gdb_read_register: Callback for letting GDB read a register.
>   * @gdb_write_register: Callback for letting GDB write a register.
>   * @debug_excp_handler: Callback for handling debug exceptions.
> @@ -152,6 +155,7 @@ typedef struct CPUClass {
>      int (*handle_mmu_fault)(CPUState *cpu, vaddr address, int rw,
>                              int mmu_index);
>      hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> +    hwaddr (*get_phys_page_asidx_debug)(CPUState *cpu, vaddr addr, int *asidx);
>      int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
>      int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>      void (*debug_excp_handler)(CPUState *cpu);
> @@ -445,6 +449,32 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
>  
>  #ifndef CONFIG_USER_ONLY
>  /**
> + * cpu_get_phys_page_asidx_debug:
> + * @cpu: The CPU to obtain the physical page address for.
> + * @addr: The virtual address.
> + * @asidx: Updated on return with the address space index for this access.
> + *
> + * Obtains the physical page corresponding to a virtual one, together
> + * with the corresponding address space index indicating which AddressSpace
> + * to look the physical address up in.
> + * Use it only for debugging because no protection checks are done.
> + *
> + * Returns: Corresponding physical page address or -1 if no page found.
> + */
> +static inline hwaddr cpu_get_phys_page_asidx_debug(CPUState *cpu, vaddr addr,
> +                                                   int *asidx)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->get_phys_page_asidx_debug) {
> +        return cc->get_phys_page_asidx_debug(cpu, addr, asidx);
> +    }
> +    /* Fallback for CPUs which don't have multiple address spaces */
> +    *asidx = 0;
> +    return cc->get_phys_page_debug(cpu, addr);
> +}
> +
> +/**
>   * cpu_get_phys_page_debug:
>   * @cpu: The CPU to obtain the physical page address for.
>   * @addr: The virtual address.
> @@ -456,9 +486,9 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
>   */
>  static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
>  {
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    int asidx;
>  
> -    return cc->get_phys_page_debug(cpu, addr);
> +    return cpu_get_phys_page_asidx_debug(cpu, addr, &asidx);
>  }
>  #endif
>  
> -- 
> 1.9.1
> 
