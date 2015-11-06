Received: by 10.182.105.169 with SMTP id gn9csp1095228obb;
        Fri, 6 Nov 2015 06:23:16 -0800 (PST)
X-Received: by 10.66.97.8 with SMTP id dw8mr17679519pab.113.1446819796197;
        Fri, 06 Nov 2015 06:23:16 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22f.google.com (mail-pa0-x22f.google.com. [2607:f8b0:400e:c03::22f])
        by mx.google.com with ESMTPS id jg7si419777pac.239.2015.11.06.06.23.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22f as permitted sender) client-ip=2607:f8b0:400e:c03::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22f as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by padhx2 with SMTP id hx2so116327138pad.1;
        Fri, 06 Nov 2015 06:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=KLG1rZHPPj56JfEDQKQytjVjE/W/9ttvGffEWPJ6Y/A=;
        b=SIUjPOaa6jpvUHrvFgrcPnUPsFtrIYWUb8orlww0NXK4eNxlYF1m/z2S/3TNfkdhIo
         MTr6BXGGMHIR0v3oi1ti+vdLhl4yiFjWDua4gS8yMgV5VjWdsQfO0Qx7Iuk5KbICI3f7
         occEYi5t5OS9Dq1v18fAHosB1Ggeiq6AGlnI1WNlGvF0AGwDye2Im1gUmwGj4D3/ooq7
         r5+FpEU5MopY4vc2nHyZbe+6eCdGd3+4jSJ5eT9hYWF7hB2/D0VmRLjEhCQWuU96eVi8
         YjLEd8MAqB1zMZjgB7ILF0iZ73K9mKit2okg0uS0vXCWBpL45oZUXXH3v/Gj4h9BK/oG
         5QHA==
X-Received: by 10.66.254.73 with SMTP id ag9mr17981051pad.116.1446819795796;
        Fri, 06 Nov 2015 06:23:15 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id dd4sm433117pbb.52.2015.11.06.06.23.14
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:23:14 -0800 (PST)
Date: Fri, 6 Nov 2015 15:23:11 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 10/16] target-arm: Implement cpu_get_phys_page_asidx_debug
Message-ID: <20151106142311.GM13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-11-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-11-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: nQAgpGb7Er0i

On Thu, Nov 05, 2015 at 06:15:52PM +0000, Peter Maydell wrote:
> Implement cpu_get_phys_page_asidx_debug instead of cpu_get_phys_page_debug.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu-qom.h | 2 +-
>  target-arm/cpu.c     | 2 +-
>  target-arm/helper.c  | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 25fb1ce..53d3129 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -216,7 +216,7 @@ bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
>                          int flags);
>  
> -hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> +hwaddr arm_cpu_get_phys_page_asidx_debug(CPUState *cpu, vaddr addr, int *asidx);
>  
>  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 30739fc..7789d50 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -1417,7 +1417,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
>  #else
>      cc->do_interrupt = arm_cpu_do_interrupt;
> -    cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
> +    cc->get_phys_page_asidx_debug = arm_cpu_get_phys_page_asidx_debug;
>      cc->vmsd = &vmstate_arm_cpu;
>      cc->virtio_is_big_endian = arm_cpu_is_big_endian;
>  #endif
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 242928d..db7e81a 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -7327,7 +7327,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
>      return ret;
>  }
>  
> -hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> +hwaddr arm_cpu_get_phys_page_asidx_debug(CPUState *cs, vaddr addr, int *asidx)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -7346,6 +7346,7 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>          return -1;
>      }
>  
> +    *asidx = arm_asidx(cs, attrs.secure);
>      return phys_addr;
>  }
>  
> -- 
> 1.9.1
> 
