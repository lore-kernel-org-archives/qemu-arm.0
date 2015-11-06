Received: by 10.182.105.169 with SMTP id gn9csp1100821obb;
        Fri, 6 Nov 2015 06:33:34 -0800 (PST)
X-Received: by 10.68.103.130 with SMTP id fw2mr18348363pbb.43.1446820414350;
        Fri, 06 Nov 2015 06:33:34 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x234.google.com (mail-pa0-x234.google.com. [2607:f8b0:400e:c03::234])
        by mx.google.com with ESMTPS id ks4si569428pbc.15.2015.11.06.06.33.33
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:33:34 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) client-ip=2607:f8b0:400e:c03::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by padhx2 with SMTP id hx2so116542612pad.1;
        Fri, 06 Nov 2015 06:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=uJ0PMS/R4fJ09hIZNtAdJ0XsBT3PK8LTWt65TlrMgqY=;
        b=GNq6ao7LOsj7twbbekTTepAg7u4F1MTJm8EGNA87vfKp9+HbUcIGwCfv9LLHnn4gbd
         nLGrSBEptWQ8FhTJTsZlgwMxCxo3hr+5BU+HvyW4HOyHjjODT5WaA6FYvM8+xfJuN3PZ
         TiS3RkfP7JwovrWZeZcEm22SY4E9GyoQC+5NzETfUFnyFVrtns5sZtxCR+QHOKGMTwPs
         8a6o/qTMywoWpLD/i55KfaZ+gRsABmbnQ0ia0KdwlkR2tK5zuguecA5D8HobIT7F4nhP
         R61mojf7oxkBxXyu+nPcB3MPOxei6qQfZYIUNphctSBD6JbNFjVR18S8CDKuZUdessJ+
         G1yw==
X-Received: by 10.66.227.170 with SMTP id sb10mr5147086pac.80.1446820413829;
        Fri, 06 Nov 2015 06:33:33 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id i11sm505036pbq.24.2015.11.06.06.33.31
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:33:32 -0800 (PST)
Date: Fri, 6 Nov 2015 15:33:29 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 13/16] target-arm: Add QOM property for Secure memory
 region
Message-ID: <20151106143329.GP13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-14-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-14-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: BozJVPYGlPKa

On Thu, Nov 05, 2015 at 06:15:55PM +0000, Peter Maydell wrote:
> Add QOM property to the ARM CPU which boards can use to tell us what
> memory region to use for secure accesses. Nonsecure accesses
> go via the memory region specified with the base CPU class 'memory'
> property.
> 
> By default, if no secure region is specified it is the same as the
> nonsecure region, and if no nonsecure region is specified we will use
> address_space_memory.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target-arm/cpu-qom.h |  3 +++
>  target-arm/cpu.c     | 26 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 53d3129..75dc74e 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -87,6 +87,9 @@ typedef struct ARMCPU {
>      /* GPIO outputs for generic timer */
>      qemu_irq gt_timer_outputs[NUM_GTIMERS];
>  
> +    /* MemoryRegion to use for secure physical accesses */
> +    MemoryRegion *secure_memory;
> +
>      /* 'compatible' string for this CPU for Linux device trees */
>      const char *dtb_compatible;
>  
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 7789d50..85e2bc8 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -542,6 +542,15 @@ static void arm_cpu_post_init(Object *obj)
>           */
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el3_property,
>                                   &error_abort);
> +
> +#ifndef CONFIG_USER_ONLY
> +        object_property_add_link(obj, "secure-memory",
> +                                 TYPE_MEMORY_REGION,
> +                                 (Object **)&cpu->secure_memory,
> +                                 qdev_prop_allow_set_link_before_realize,
> +                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                                 &error_abort);
> +#endif
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
> @@ -665,6 +674,23 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>      init_cpreg_list(cpu);
>  
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->has_el3) {
> +        AddressSpace *as;
> +
> +        if (!cpu->secure_memory) {
> +            cpu->secure_memory = cs->memory;
> +        }
> +        as = address_space_init_shareable(cpu->secure_memory,
> +                                          "cpu-secure-memory");
> +        cpu_address_space_init(cs, as, ARMASIdx_S);
> +    }
> +    cpu_address_space_init(cs,
> +                           address_space_init_shareable(cs->memory,
> +                                                        "cpu-memory"),
> +                           ARMASIdx_NS);
> +#endif
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>  
> -- 
> 1.9.1
> 
