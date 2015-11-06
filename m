Received: by 10.182.105.169 with SMTP id gn9csp1052139obb;
        Fri, 6 Nov 2015 05:05:04 -0800 (PST)
X-Received: by 10.202.183.137 with SMTP id h131mr7178619oif.58.1446815104336;
        Fri, 06 Nov 2015 05:05:04 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22e.google.com (mail-pa0-x22e.google.com. [2607:f8b0:400e:c03::22e])
        by mx.google.com with ESMTPS id t10si22757oei.83.2015.11.06.05.05.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) client-ip=2607:f8b0:400e:c03::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22e as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so126950340pas.2;
        Fri, 06 Nov 2015 05:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=5lyix0XAo0S/9DGMeoW2YFhGwClCBFw0PXozeNgBq58=;
        b=eJw8PXZCz/DuBvNWwI1wHXxxjeGJs2KCTL7ZgglTdFBk94Kq3KO2VctREWZ66oVVBr
         clWs3hmnHZW2f5Idbp+QpqjPRFTcbJQg5A+M7YLwugWu4+j1xjFXxiZUF7KNPypPJLzv
         7RJ9qX/bmoLjlWkDPploaIHjx+4gpr9mJWiMvAWt5ikJY+t1iEIQSSzfC+cF1O8wRb8I
         yhLseScp7jLQdJBOgou/UylfkMJU3XTknnEXYAIfLAVYGLfFiJ3CmPLMq5gxAMnSUfNB
         3gZx+A7qU2/m+m4qrGPJmPM/2OE/2PeCrWlRVnXGj9pqFAnJ8oY0PrrcR/w+GY0VKrtJ
         ta1w==
X-Received: by 10.66.220.33 with SMTP id pt1mr17759134pac.71.1446815103449;
        Fri, 06 Nov 2015 05:05:03 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id dd4sm72632pbb.52.2015.11.06.05.05.01
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:05:01 -0800 (PST)
Date: Fri, 6 Nov 2015 14:04:57 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 01/16] exec.c: Don't set cpu->as until
 cpu_address_space_init
Message-ID: <20151106130457.GA13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: TjVFU3vkg9Vk

On Thu, Nov 05, 2015 at 06:15:43PM +0000, Peter Maydell wrote:
> Rather than setting cpu->as unconditionally in cpu_exec_init
> (and then having target-i386 override this later), don't set
> it until the first call to cpu_address_space_init.
> 
> This requires us to initialise the address space for
> both TCG and KVM (KVM doesn't need the AS listener but
> it does require cpu->as to be set).
> 
> For target CPUs which don't set up any address spaces (currently
> everything except i386), add the default address_space_memory
> in qemu_init_vcpu().


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  cpus.c                  | 10 ++++++++--
>  exec.c                  | 16 ++++++++++++----
>  include/exec/exec-all.h | 16 +++++++++++++++-
>  target-i386/cpu.c       |  6 ++++--
>  4 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/cpus.c b/cpus.c
> index c6a5d0e..764ea75 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1291,8 +1291,6 @@ static void qemu_tcg_init_vcpu(CPUState *cpu)
>      static QemuCond *tcg_halt_cond;
>      static QemuThread *tcg_cpu_thread;
>  
> -    tcg_cpu_address_space_init(cpu, cpu->as);
> -
>      /* share a single thread for all cpus with TCG */
>      if (!tcg_cpu_thread) {
>          cpu->thread = g_malloc0(sizeof(QemuThread));
> @@ -1353,6 +1351,14 @@ void qemu_init_vcpu(CPUState *cpu)
>      cpu->nr_cores = smp_cores;
>      cpu->nr_threads = smp_threads;
>      cpu->stopped = true;
> +
> +    if (!cpu->as) {
> +        /* If the target cpu hasn't set up any address spaces itself,
> +         * give it the default one.
> +         */
> +        cpu_address_space_init(cpu, &address_space_memory, 0);
> +    }
> +
>      if (kvm_enabled()) {
>          qemu_kvm_start_vcpu(cpu);
>      } else if (tcg_enabled()) {
> diff --git a/exec.c b/exec.c
> index 1e8b51b..b5490c8 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -550,8 +550,13 @@ CPUState *qemu_get_cpu(int index)
>  }
>  
>  #if !defined(CONFIG_USER_ONLY)
> -void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as)
> +void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
>  {
> +    if (asidx == 0) {
> +        /* address space 0 gets the convenience alias */
> +        cpu->as = as;
> +    }
> +
>      /* We only support one address space per cpu at the moment.  */
>      assert(cpu->as == as);
>  
> @@ -563,8 +568,10 @@ void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as)
>      cpu->cpu_ases = g_new0(CPUAddressSpace, 1);
>      cpu->cpu_ases[0].cpu = cpu;
>      cpu->cpu_ases[0].as = as;
> -    cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
> -    memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
> +    if (tcg_enabled()) {
> +        cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
> +        memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
> +    }
>  }
>  #endif
>  
> @@ -619,8 +626,9 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
>      int cpu_index;
>      Error *local_err = NULL;
>  
> +    cpu->as = NULL;
> +
>  #ifndef CONFIG_USER_ONLY
> -    cpu->as = &address_space_memory;
>      cpu->thread_id = qemu_get_thread_id();
>  #endif
>  
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 9b93b9b..90130ca 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -85,7 +85,21 @@ void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
>  
>  #if !defined(CONFIG_USER_ONLY)
>  void cpu_reloading_memory_map(void);
> -void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as);
> +/**
> + * cpu_address_space_init:
> + * @cpu: CPU to add this address space to
> + * @as: address space to add
> + * @asidx: integer index of this address space
> + *
> + * Add the specified address space to the CPU's cpu_ases list.
> + * The address space added with @asidx 0 is the one used for the
> + * convenience pointer cpu->as.
> + * The target-specific code which registers ASes is responsible
> + * for defining what semantics address space 0, 1, 2, etc have.
> + *
> + * Note that with KVM only one address space is supported.
> + */
> +void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx);
>  /* cputlb.c */
>  /**
>   * tlb_flush_page:
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 9d0eedf..8096860 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -2856,9 +2856,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>  #ifndef CONFIG_USER_ONLY
>      if (tcg_enabled()) {
> +        AddressSpace *newas = g_new(AddressSpace, 1);
> +
>          cpu->cpu_as_mem = g_new(MemoryRegion, 1);
>          cpu->cpu_as_root = g_new(MemoryRegion, 1);
> -        cs->as = g_new(AddressSpace, 1);
>  
>          /* Outer container... */
>          memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
> @@ -2871,7 +2872,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>                                   get_system_memory(), 0, ~0ull);
>          memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
>          memory_region_set_enabled(cpu->cpu_as_mem, true);
> -        address_space_init(cs->as, cpu->cpu_as_root, "CPU");
> +        address_space_init(newas, cpu->cpu_as_root, "CPU");
> +        cpu_address_space_init(cs, newas, 0);
>  
>          /* ... SMRAM with higher priority, linked from /machine/smram.  */
>          cpu->machine_done.notify = x86_cpu_machine_done;
> -- 
> 1.9.1
> 
