Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp976995njh;
        Mon, 12 Aug 2024 17:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt/2FNAA8G/6NGBGoneTovcnL86aOrDtSdkfEJ5+LST6gqEPxl+jN8IROHnfDGbvzb59hxO3bL31d2eMgwtcQMAQ7oUIwB
X-Google-Smtp-Source: AGHT+IGIHntcLHKoGknqMJsUUb/6DjT7kIW79yEWAkvWqditWLWs12DV2zdJAMg1JtWluB+eMEUV
X-Received: by 2002:a05:6214:3990:b0:6bb:841c:ec72 with SMTP id 6a1803df08f44-6bf4f64437amr19156866d6.10.1723510743353;
        Mon, 12 Aug 2024 17:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723510743; cv=none;
        d=google.com; s=arc-20160816;
        b=UR4VVgzUiQExYThmOwxRb+tmc6CxtDJnyLLoh1uKN2ogjnlVYp3ruNa83NIpF9PNRG
         XyNdtes6NEppagudOFQpoiXCqWwOiv9pKSt802sC/io39HE8fw2zZ2qSeMiVPwCVATpr
         S5Sy5V//89S0dlcy9P9G76v7MY7B81oyoYbtJuIihitRiZwAqYHHlL704uGEZ2vq1YUM
         Np16MdyQgcXiuRxQH0/KKaKM5MLDq9dCPPgZVlbtPjgDgnnzktLkpakXP2pU4IG8kPu3
         8w6nOSaDN4NabVL2wXgmdPxa2tz254VPicJkLOqrKv5MrKQ8vb70QwEoHq/87JrYrG4m
         m69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nV8Xc8YlKV+JuEIM5/YPpDaqb0wYvN4enutlkVVh7kw=;
        fh=j7+n5jpihrZ/DBzyYKbP7vZQBPhVM4s5vitgXhNKGVk=;
        b=fzWM7ymDOkw1uLulUeuiZ4PgEDq/AvpETNv22z9Z+kXwgPt0elA749vFkBVvsZfaqm
         TYYlpkSC1iAAhphEWHnHJIx/+8CGQq29HSWqTXsYt67bunpmsJSr6DWZrsr+vIBcEL5c
         Ht8oTNXOIuJDb0H1zTUgz6olF7iD65zTFdALpIoslcavq/kEX7Kw5+6WrhbpCoZHaNEG
         ifWlM1TVH3JoQfdfOkUWTOWqNz5PhFt/PooqusFQAj1kuUQNvDWbWaBoHH/LGvy30INP
         9jcUbosX5E3j3O86BLmdFsTrEjqOHwBhRwAsXY4maxKcyJVNmPGkbksfdthDbmWlG0sv
         faYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZLMzfsxU;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82c60893si73415956d6.23.2024.08.12.17.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 17:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZLMzfsxU;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723510743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nV8Xc8YlKV+JuEIM5/YPpDaqb0wYvN4enutlkVVh7kw=;
	b=ZLMzfsxUieoBm3wltXQNLRpecx7fM2BNqXFiytTatwMzNy3v0MlifBU1lvVn4pNNitZcf7
	DdaCnbGDFB95HiKzih6p4XCfHcHo8uhL3uD6+hsouJV8ZNYzPmClUX4MnCwvG9ViaBGMmd
	Ixaj4nJ5Ui8vueJ2engGoxpP6iuopwk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-2HJPXxd6MRC6D_sZMyQRDg-1; Mon, 12 Aug 2024 20:59:01 -0400
X-MC-Unique: 2HJPXxd6MRC6D_sZMyQRDg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1fc58790766so51171785ad.3
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 17:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723510740; x=1724115540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nV8Xc8YlKV+JuEIM5/YPpDaqb0wYvN4enutlkVVh7kw=;
        b=a9MhqAiUf8UVfdh4FcBOp+vTI2lbt/g/apuyLENke1A64wO8vUSSib6XpZRgavrkUA
         zXSLlCiUE/w7jNa4w9K8DbZ3T4bqtj14HewZGS/tUEGZ1sGr+BAk/4HmV55EDAGq5QXP
         IgeKSTIuUWo5M+Zgkiaf/G6qDcZ4vYy9n+zO0AQYwRTZb+DXCDB1rs3YqYa1dx847PxL
         GhKlAKaiymIW61xxF6hE05zoYS8GbMMnVwaRqFbypxovfK5mvo6CVOPyjo7dG1U0rS2n
         HsNpQFqYg0scYTXMIyaJG+qfz1zY/LH1TZq8njrUvGuXSwpJM+KA+nbD6YHirXFhjQqk
         er7g==
X-Forwarded-Encrypted: i=1; AJvYcCU8PISi2gRrqp+JmZX784J8GvZYzbCB5hb+jrh+ukWPwTZLk77udhshkEmo8M3J+BAuREicSX1f/YgB4sZYiJL1JekZbFn6
X-Gm-Message-State: AOJu0YynCJz1xd7onnxdGLLvXEoTm1rD38AM5GD03t0TL9FFll59V+iA
	Vq7YhEJ7VvTC4kDAsHmS1ZwZZkidVWLZHsaQZYpGGaFRlroaxRlSjEzCNKTWpkmL6SdTsUqCw32
	jSvY2+6YyzCvPnjk2CvWLJ036fboNhw83l9edHVUqW4ep3tvP8BXB5A==
X-Received: by 2002:a17:902:ecc3:b0:1ff:393d:5e56 with SMTP id d9443c01a7336-201ca1743aamr27020825ad.36.1723510740334;
        Mon, 12 Aug 2024 17:59:00 -0700 (PDT)
X-Received: by 2002:a17:902:ecc3:b0:1ff:393d:5e56 with SMTP id d9443c01a7336-201ca1743aamr27020365ad.36.1723510739863;
        Mon, 12 Aug 2024 17:58:59 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14b098sm2710835ad.115.2024.08.12.17.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 17:58:59 -0700 (PDT)
Message-ID: <4082d244-3102-48d8-99b2-3f6a2182e379@redhat.com>
Date: Tue, 13 Aug 2024 10:58:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 06/29] arm/virt,kvm: Pre-create disabled possible
 vCPUs @machine init
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-7-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240613233639.202896-7-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DJSkL7c39p36

On 6/14/24 9:36 AM, Salil Mehta wrote:
> In the ARMv8 architecture, the GIC must know all the CPUs it is connected to
> during its initialization, and this cannot change afterward. This must be
> ensured during the initialization of the VGIC as well in KVM, which requires all
> vCPUs to be created and present during its initialization. This is necessary
> because:
> 
> 1. The association between GICC and MPIDR must be fixed at VM initialization
>     time. This is represented by the register `GIC_TYPER(mp_affinity, proc_num)`.
> 2. GICC (CPU interfaces), GICR (redistributors), etc., must all be initialized
>     at boot time.
> 3. Memory regions associated with GICR, etc., cannot be changed (added, deleted,
>     or modified) after the VM has been initialized.
> 
> This patch adds support to pre-create all possible vCPUs within the host using
> the KVM interface as part of the virtual machine initialization. These vCPUs can
> later be attached to QOM/ACPI when they are actually hot-plugged and made
> present.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> [VP: Identified CPU stall issue & suggested probable fix]
> ---
>   hw/arm/virt.c         | 56 +++++++++++++++++++++++++++++++++++--------
>   include/hw/core/cpu.h |  1 +
>   target/arm/cpu64.c    |  1 +
>   target/arm/kvm.c      | 41 ++++++++++++++++++++++++++++++-
>   target/arm/kvm_arm.h  | 11 +++++++++
>   5 files changed, 99 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a285139165..81e7a27786 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2383,14 +2383,8 @@ static void machvirt_init(MachineState *machine)
>           Object *cpuobj;
>           CPUState *cs;
>   
> -        if (n >= smp_cpus) {
> -            break;
> -        }
> -
>           cpuobj = object_new(possible_cpus->cpus[n].type);
> -
>           cs = CPU(cpuobj);
> -        cs->cpu_index = n;
>   

Fixed @cpu_index assignment is removed here...

>           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
>           object_property_set_int(cpuobj, "socket-id",
> @@ -2402,11 +2396,53 @@ static void machvirt_init(MachineState *machine)
>           object_property_set_int(cpuobj, "thread-id",
>                                   virt_get_thread_id(machine, n), NULL);
>   
> -        cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
> -        virt_cpu_set_properties(cpuobj, cpu_slot, &error_fatal);
> +        if (n < smp_cpus) {
> +            qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +            object_unref(cpuobj);
> +        } else {
> +            /* handling for vcpus which are yet to be hot-plugged */
> +            cs->cpu_index = n;
> +            cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
>   

For hotpluggable vCPUs, we have the fixed @cpu_index assignment here and virt_cpu_pre_plug().
However, @cpu_index for non-hotpluggable vCPUs will be automatically assigned in the following
path. It causes inconsistent behaviour to hotpluggable and non-hotpluggable vCPUs. We need to
fix @cpu_index for non-hotpluggable vCPUs as well.

   qdev_realize
     arm_cpu_realizefn
       cpu_exec_realizefn
         cpu_list_add

> -        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> -        object_unref(cpuobj);
> +            /*
> +             * ARM host vCPU features need to be fixed at the boot time. But as
> +             * per current approach this CPU object will be destroyed during
> +             * cpu_post_init(). During hotplug of vCPUs these properties are
> +             * initialized again.
> +             */
> +            virt_cpu_set_properties(cpuobj, cpu_slot, &error_fatal);
> +
> +            /*
> +             * For KVM, we shall be pre-creating the now disabled/un-plugged
> +             * possbile host vcpus and park them till the time they are
> +             * actually hot plugged. This is required to pre-size the host
> +             * GICC and GICR with the all possible vcpus for this VM.
> +             */
> +            if (kvm_enabled()) {
> +                kvm_arm_create_host_vcpu(ARM_CPU(cs));
> +            }
> +            /*
> +             * Add disabled vCPU to CPU slot during the init phase of the virt
> +             * machine
> +             * 1. We need this ARMCPU object during the GIC init. This object
> +             *    will facilitate in pre-realizing the GIC. Any info like
> +             *    mp-affinity(required to derive gicr_type) etc. could still be
> +             *    fetched while preserving QOM abstraction akin to realized
> +             *    vCPUs.
> +             * 2. Now, after initialization of the virt machine is complete we
> +             *    could use two approaches to deal with this ARMCPU object:
> +             *    (i) re-use this ARMCPU object during hotplug of this vCPU.
> +             *                             OR
> +             *    (ii) defer release this ARMCPU object after gic has been
> +             *         initialized or during pre-plug phase when a vCPU is
> +             *         hotplugged.
> +             *
> +             *    We will use the (ii) approach and release the ARMCPU objects
> +             *    after GIC and machine has been fully initialized during
> +             *    machine_init_done() phase.
> +             */

For those hotpluggable vCPUs, ARMCPU objects are instanciated, providing information
for GIC's initialization and then destroyed. ARMCPU objects are a bit heavy for that.
The question is if ms->possible_cpus->cpus[] can be reused to provide information for
GIC's initialization? If it can be used for that, the left question is how to avoid
instanciating ARMCPU objects when vCPU fds are created and parked.


> +             cpu_slot->cpu = cs;
> +        }
>       }
>   
>       /* Now we've created the CPUs we can see if they have the hypvirt timer */
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 60b4778da9..62e68611c0 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -520,6 +520,7 @@ struct CPUState {
>       uint64_t dirty_pages;
>       int kvm_vcpu_stats_fd;
>       bool vcpu_dirty;
> +    VMChangeStateEntry *vmcse;
>   
>       /* Use by accel-block: CPU is executing an ioctl() */
>       QemuLockCnt in_ioctl_lock;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d6b48b3424..9b7e8b032c 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -789,6 +789,7 @@ static void aarch64_cpu_initfn(Object *obj)
>        * enabled explicitly
>        */
>       cs->disabled = true;
> +    cs->thread_id = 0;
>   }
>   
>   static void aarch64_cpu_finalizefn(Object *obj)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7cf5cf31de..01c83c1994 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1003,6 +1003,38 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
>       write_list_to_cpustate(cpu);
>   }
>   
> +void kvm_arm_create_host_vcpu(ARMCPU *cpu)
> +{
> +    CPUState *cs = CPU(cpu);
> +    unsigned long vcpu_id = cs->cpu_index;
> +    int ret;
> +
> +    ret = kvm_create_vcpu(cs);
> +    if (ret < 0) {
> +        error_report("Failed to create host vcpu %ld", vcpu_id);
> +        abort();
> +    }
> +
> +    /*
> +     * Initialize the vCPU in the host. This will reset the sys regs
> +     * for this vCPU and related registers like MPIDR_EL1 etc. also
> +     * gets programmed during this call to host. These are referred
> +     * later while setting device attributes of the GICR during GICv3
> +     * reset
> +     */
> +    ret = kvm_arch_init_vcpu(cs);
> +    if (ret < 0) {
> +        error_report("Failed to initialize host vcpu %ld", vcpu_id);
> +        abort();
> +    }
> +
> +    /*
> +     * park the created vCPU. shall be used during kvm_get_vcpu() when
> +     * threads are created during realization of ARM vCPUs.
> +     */
> +    kvm_park_vcpu(cs);
> +}
> +
>   /*
>    * Update KVM's MP_STATE based on what QEMU thinks it is
>    */
> @@ -1874,7 +1906,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           return -EINVAL;
>       }
>   
> -    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cpu);
> +    /*
> +     * Install VM change handler only when vCPU thread has been spawned
> +     * i.e. vCPU is being realized
> +     */
> +    if (cs->thread_id) {
> +        cs->vmcse = qemu_add_vm_change_state_handler(kvm_arm_vm_state_change,
> +                                                     cpu);
> +    }
>   
>       /* Determine init features for this CPU */
>       memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cfaa0d9bc7..0be7e896d2 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -96,6 +96,17 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
>    */
>   void kvm_arm_reset_vcpu(ARMCPU *cpu);
>   
> +/**
> + * kvm_arm_create_host_vcpu:
> + * @cpu: ARMCPU
> + *
> + * Called at to pre create all possible kvm vCPUs within the the host at the
> + * virt machine init time. This will also init this pre-created vCPU and
> + * hence result in vCPU reset at host. These pre created and inited vCPUs
> + * shall be parked for use when ARM vCPUs are actually realized.
> + */
> +void kvm_arm_create_host_vcpu(ARMCPU *cpu);
> +
>   #ifdef CONFIG_KVM
>   /**
>    * kvm_arm_create_scratch_host_vcpu:

Thanks,
Gavin
