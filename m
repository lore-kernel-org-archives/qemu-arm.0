Received: by 10.182.105.169 with SMTP id gn9csp1070829obb;
        Fri, 6 Nov 2015 05:38:54 -0800 (PST)
X-Received: by 10.68.219.3 with SMTP id pk3mr18124960pbc.85.1446817134704;
        Fri, 06 Nov 2015 05:38:54 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22c.google.com (mail-pa0-x22c.google.com. [2607:f8b0:400e:c03::22c])
        by mx.google.com with ESMTPS id hl1si226830pac.157.2015.11.06.05.38.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22c as permitted sender) client-ip=2607:f8b0:400e:c03::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22c as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so127650623pas.2;
        Fri, 06 Nov 2015 05:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=W/Q2/1BcTzg3OF9XGJWUpcgH2wvGHHUAZzGP79guj5Q=;
        b=J4x4lTnQroCGXFQlCeNBtS8yjXlACsPCs9qJOur8Ed3ZblMf1EpuBxlvqEwcqASFHj
         rgvFaFA8YgPcbW7yx3Gq4BtF2fr9TqeJOU7CVxePB3NNPwYcJ0T2hrjOaZAevc+DwVsQ
         kPweD/J/fcusa1OUhCfe91m4cbkR0gHf2qFONGr5oYTfhARrIF2w9Ok1Y42+gDGXKk3M
         dLanpDp+Bnyn+x0FdFyXq6m25DQ9VhGFv+KpmZrIPiiDv2Z6KOA0Ji3dwIyybB8QlnAV
         gNYbI6St4nZpqMqiOKPfKNLB5YlDv9JGLTFyZE71e5uWhg9YsH67BhZHrz/BMLbRVCCT
         1bEQ==
X-Received: by 10.68.143.5 with SMTP id sa5mr17906575pbb.14.1446817134397;
        Fri, 06 Nov 2015 05:38:54 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id z12sm215678pbt.73.2015.11.06.05.38.52
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:38:52 -0800 (PST)
Date: Fri, 6 Nov 2015 14:38:48 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 07/16] exec.c: Use cpu_get_phys_page_asidx_debug
Message-ID: <20151106133848.GF13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: FIdv+He8T6h8

On Thu, Nov 05, 2015 at 06:15:49PM +0000, Peter Maydell wrote:
> Use cpu_get_phys_page_asidx_debug() when doing virtual-to-physical
> conversions in debug related code, so that we can obtain the right
> address space index and thus select the correct AddressSpace,
> rather than always using cpu->as.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 13da780..bc6ab8a 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -684,9 +684,10 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>  #else
>  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>  {
> -    hwaddr phys = cpu_get_phys_page_debug(cpu, pc);
> +    int asidx;
> +    hwaddr phys = cpu_get_phys_page_asidx_debug(cpu, pc, &asidx);
>      if (phys != -1) {
> -        tb_invalidate_phys_addr(cpu->as,
> +        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
>                                  phys | (pc & ~TARGET_PAGE_MASK));
>      }
>  }
> @@ -3502,8 +3503,10 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>      target_ulong page;
>  
>      while (len > 0) {
> +        int asidx;
> +
>          page = addr & TARGET_PAGE_MASK;
> -        phys_addr = cpu_get_phys_page_debug(cpu, page);
> +        phys_addr = cpu_get_phys_page_asidx_debug(cpu, page, &asidx);
>          /* if no physical page mapped, return an error */
>          if (phys_addr == -1)
>              return -1;
> @@ -3512,9 +3515,11 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>              l = len;
>          phys_addr += (addr & ~TARGET_PAGE_MASK);
>          if (is_write) {
> -            cpu_physical_memory_write_rom(cpu->as, phys_addr, buf, l);
> +            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
> +                                          phys_addr, buf, l);
>          } else {
> -            address_space_rw(cpu->as, phys_addr, MEMTXATTRS_UNSPECIFIED,
> +            address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
> +                             MEMTXATTRS_UNSPECIFIED,
>                               buf, l, 0);
>          }
>          len -= l;
> -- 
> 1.9.1
> 
