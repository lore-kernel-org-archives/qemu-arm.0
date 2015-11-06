Received: by 10.182.105.169 with SMTP id gn9csp1099796obb;
        Fri, 6 Nov 2015 06:31:44 -0800 (PST)
X-Received: by 10.67.23.135 with SMTP id ia7mr17951373pad.77.1446820304686;
        Fri, 06 Nov 2015 06:31:44 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x234.google.com (mail-pa0-x234.google.com. [2607:f8b0:400e:c03::234])
        by mx.google.com with ESMTPS id c6si547400pbu.46.2015.11.06.06.31.44
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:31:44 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) client-ip=2607:f8b0:400e:c03::234;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::234 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so128764415pas.2;
        Fri, 06 Nov 2015 06:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=6Jn9l71J/zsMfbbmY2Tf2okTJ7IUA3v80f0ygJHYsGE=;
        b=W58v6bBcVJ8tE9x84JKp78TI71LC2XGxJTumfgKbC2+F0qZ5x86mXyWjE5iJVP0+sM
         Ku4CKIavQvqwQzDWWRioe/GxdYQyyeVpcjgBugkIP5BlNcK1cFO6nyBndbN5PEh5F9Dw
         Khg/xbu5cCBmMcfEKF5FnOrvgMQiOGX7pyHrJVsMS8TNcBCp6ysMms8xliUzS7jtOSEP
         EK1usQZ6AAFktl6ljyyguTvahbwUoLjC3lwr6bXT99JO0mvSfJBzglFL4WAWktPP/fef
         SBaGVeV0mT0DaC3iBhDc1gTD7PZ/aiIMF5ploFdlwNSMZGHEGre4cq760q2J2yeBISzR
         1yuQ==
X-Received: by 10.68.223.70 with SMTP id qs6mr18063554pbc.109.1446820304044;
        Fri, 06 Nov 2015 06:31:44 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id hl2sm465679pbb.58.2015.11.06.06.31.41
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:31:42 -0800 (PST)
Date: Fri, 6 Nov 2015 15:31:39 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 12/16] qom/cpu: Add MemoryRegion property
Message-ID: <20151106143139.GO13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-13-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-13-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: uSuYk9vDsfQw

On Thu, Nov 05, 2015 at 06:15:54PM +0000, Peter Maydell wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Add a MemoryRegion property, which if set is used to construct
> the CPU's initial (default) AddressSpace.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> [PMM: code is moved from qom/cpu.c to exec.c to avoid having to
>  make qom/cpu.o be a non-common object file; code to use the
>  MemoryRegion and to default it to system_memory added.]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  cpus.c            |  4 +++-
>  exec.c            | 13 +++++++++++++
>  include/qom/cpu.h |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 764ea75..b7c19e0 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1356,7 +1356,9 @@ void qemu_init_vcpu(CPUState *cpu)
>          /* If the target cpu hasn't set up any address spaces itself,
>           * give it the default one.
>           */
> -        cpu_address_space_init(cpu, &address_space_memory, 0);
> +        AddressSpace *as = address_space_init_shareable(cpu->memory,
> +                                                        "cpu-memory");
> +        cpu_address_space_init(cpu, as, 0);
>      }
>  
>      if (kvm_enabled()) {
> diff --git a/exec.c b/exec.c
> index 9998fa0..21b1b57 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -637,6 +637,19 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
>  
>  #ifndef CONFIG_USER_ONLY
>      cpu->thread_id = qemu_get_thread_id();
> +
> +    /* This is a softmmu CPU object, so create a property for it
> +     * so users can wire up its memory. (This can't go in qom/cpu.c
> +     * because that file is compiled only once for both user-mode
> +     * and system builds.) The default if no link is set up is to use
> +     * the system address space.
> +     */
> +    object_property_add_link(OBJECT(cpu), "memory", TYPE_MEMORY_REGION,
> +                             (Object **)&cpu->memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             &error_abort);
> +    cpu->memory = system_memory;
>  #endif
>  
>  #if defined(CONFIG_USER_ONLY)
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 10ef5cc..39a9a24 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -292,6 +292,7 @@ struct CPUState {
>      CPUAddressSpace *cpu_ases;
>      int num_ases;
>      AddressSpace *as;
> +    MemoryRegion *memory;
>  
>      void *env_ptr; /* CPUArchState */
>      struct TranslationBlock *current_tb;
> -- 
> 1.9.1
> 
