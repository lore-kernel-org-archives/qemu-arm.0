Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1728009ejc;
        Wed, 27 Sep 2023 03:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2R+ntlNfBS1C2sb6r/r5fBKSUBTDPmDUGtQeDPhoS2HoU7C/JpgWy3iNAa5VtcF1IBuxo
X-Received: by 2002:ac8:7e91:0:b0:412:1908:404c with SMTP id w17-20020ac87e91000000b004121908404cmr1731835qtj.10.1695809108122;
        Wed, 27 Sep 2023 03:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695809108; cv=none;
        d=google.com; s=arc-20160816;
        b=mbtv9zXGkqAG3eV5zcVo1rd7SqvnQ2hid8OJMip3O66XHevrKCmtR5MKVV4t6KzbBp
         4aWt8FSoD6KDr14osLC6AKgr/qUc1OBlQHKFwGX6oN/aq19ZiSVUyl+TDBPyRNMvKwoq
         UqMuaSCkY8c9ZgEpPOBNw/5HRPzoW+ocbNkptT1jcqnbaODcdTTTrpDFocluCFbu9CS8
         Utzp0hfuOl0whUTCUvmghY2U3wYTkvWzuBSEuaFyan1lJFbDwMfVwDDhYTJ8cpRVCe3J
         FiHZ+7z/wDpUmZnK397J642QH62DJvcWmCgox7/K5rpgqaoCnHLuNlwFlcP0xJfVF+S8
         aPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U/10JuknDXD7iTOs+uZOQSEWaEqPB2xAt4Hc+Sh7Tng=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=soMwxXp9tg0g4T4rJs1ewVlkvuTPM8mKwL6rhdAuzdJSUvSKAn5ThOcuwWkh8+qx7e
         6JQPKliANLExsPUuPz+7lJrXOnKkJpEtgK7CL94qVozk/psrmIa8khTgh7HQer94di+A
         gIx+dO+e+jRncAypoJqTVxuB8iOF++rYGASn7O58KXT/yVRQ2hvNPzFk+1JLandA40F4
         Z2vcYqE/K8nK10Lz66YQSD6T+8/+qi2x2Er1++LYxYOP393yHwG9QeYTe4glVumnd2XV
         O4oINCYEjLErpD/2Dduat9mI1ZSGjtf/MFd96Z0Javs4aQYoo66uqdidSwdZMqh30L7e
         248Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O9RF/bQ0";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a18-20020a05622a065200b00417ae86d616si8461369qtb.567.2023.09.27.03.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="O9RF/bQ0";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695809107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/10JuknDXD7iTOs+uZOQSEWaEqPB2xAt4Hc+Sh7Tng=;
	b=O9RF/bQ0rblC7DCp5plBANkaVIY6vNZzf6SXUyHhoXBDAXdNayqM6Q+s8agfi7/pvv2XVQ
	NJx5qY5lCWfoiuB0EONCkz74QR0rRmjGExrsBD3zVEvCyoSnAIMJWrDDj2nqvSwqBgksmN
	+K2sGgNi+p+qlY7rH8E0ZWOyQ3JNnFI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-UwAabg6KMvKJ9qD91aesbA-1; Wed, 27 Sep 2023 06:05:04 -0400
X-MC-Unique: UwAabg6KMvKJ9qD91aesbA-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-57be11d32b3so9334408eaf.1
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695809103; x=1696413903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/10JuknDXD7iTOs+uZOQSEWaEqPB2xAt4Hc+Sh7Tng=;
        b=B4YkWXJ9N2Kk1B5xgEz5E3LPSyg8/0fkX9mGXVffqQu4dVWPyaVld8ltWUIAzqt0Mf
         baR8DxJIXZ49SKZGIMYeqt0eigsVRAaAc/E1RdRM+hSa/EdIFdgrzIpq1+eAjIWS6xRS
         OY3yB+X6tvtiavIrMVNyIZPIFlp0/Q9Lq/Gt065W8FJv+CqzPUc8VsOM4EZ8xkTHQB0r
         PzYSNXaVvW7l24wdVOzttnOYF2dGo2AKjgzMZ3ba35tuRjNocWTRc8J/mFGh6FgXYmeh
         +ef0O/J1bMQDQ90/CzbB0e1OfP+KGbDHxoFRT+W1Cmk6MH7H5CbRXYbyI8lYayNNNyZz
         CRJg==
X-Gm-Message-State: AOJu0Yz6jAef1obt09FBRjRYg5W4DNYuGTl+Qhv/MXGUPE1uBVHntJmK
	Tmc7k3zVMh9chIabr58qwgre43DwG2guR6ZCTzypD/HjrixrH40o3rqVcGcb9EEjW273AiKjPG9
	TUPty7uW8nnTiS88C
X-Received: by 2002:a05:6358:726:b0:134:ed9b:15a7 with SMTP id e38-20020a056358072600b00134ed9b15a7mr1835512rwj.30.1695809103118;
        Wed, 27 Sep 2023 03:05:03 -0700 (PDT)
X-Received: by 2002:a05:6358:726:b0:134:ed9b:15a7 with SMTP id e38-20020a056358072600b00134ed9b15a7mr1835492rwj.30.1695809102729;
        Wed, 27 Sep 2023 03:05:02 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id i13-20020aa7908d000000b0068fe39e6a46sm11350063pfa.112.2023.09.27.03.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 03:05:02 -0700 (PDT)
Message-ID: <b9dd8569-e95d-2085-9965-08686ce6666d@redhat.com>
Date: Wed, 27 Sep 2023 20:04:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 06/37] arm/virt,kvm: Pre-create disabled possible
 vCPUs @machine init
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-7-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-7-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 2RVsYDClwS/Y

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> In ARMv8 architecture, GIC needs all the vCPUs to be created and present when
> it is initialized. This is because:
> 1. GICC and MPIDR association must be fixed at the VM initialization time.
>     This is represented by register GIC_TYPER(mp_afffinity, proc_num)
> 2. GICC(cpu interfaces), GICR(redistributors) etc all must be initialized
>     at the boot time as well.
> 3. Memory regions associated with GICR etc. cannot be changed(add/del/mod)
>     after VM has inited.
> 
> This patch adds the support to pre-create all such possible vCPUs within the
> host using the KVM interface as part of the virt machine initialization. These
> vCPUs could later be attached to QOM/ACPI while they are actually hot plugged
> and made present.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> [VP: Identified CPU stall issue & suggested probable fix]
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c         | 53 +++++++++++++++++++++++++++++++++++++++++--
>   include/hw/core/cpu.h |  1 +
>   target/arm/cpu64.c    |  1 +
>   target/arm/kvm.c      | 32 ++++++++++++++++++++++++++
>   target/arm/kvm64.c    |  9 +++++++-
>   target/arm/kvm_arm.h  | 11 +++++++++
>   6 files changed, 104 insertions(+), 3 deletions(-)
> 

The subject looks a bit misleading. (possible && disabled) == (disabled). So it
can be simplified to something like below:

arm/virt,kvm: Pre-create KVM objects for hotpluggable vCPUs

I think the commit log can be improved to something like below:

All possible vCPUs are classified to cold-booting and hotpluggable vCPUs.
In ARMv8 architecture, GIC needs all the possible vCPUs to be existing
and present when it is initialized for several factors. After the initializaion,
the CPU instances for those hotpluggable vCPUs aren't needed, but the
KVM objects like vCPU's file descriptor should be kept as they have been
shared to host.

1. GICC and MPIDR association must be fixed at the VM initialization time.
    This is represented by register GIC_TYPER(mp_afffinity, proc_num)
2. GICC(cpu interfaces), GICR(redistributors) etc all must be initialized
    at the boot time as well.
3. Memory regions associated with GICR etc. cannot be changed(add/del/mod)
    after VM has inited.

This creates and realizes CPU instances for those cold-booting vCPUs. They
becomes enabled eventually. For these hotpluggable vCPUs, the vCPU instances
are created, but not realized. They become present eventually.


> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3668ad27ec..6ba131b799 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2293,8 +2293,10 @@ static void machvirt_init(MachineState *machine)
>       assert(possible_cpus->len == max_cpus);
>       for (n = 0; n < possible_cpus->len; n++) {
>           Object *cpuobj;
> +        CPUState *cs;
>   
>           cpuobj = object_new(possible_cpus->cpus[n].type);
> +        cs = CPU(cpuobj);
>   
>           aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
>           object_property_set_int(cpuobj, "socket-id",
> @@ -2306,8 +2308,55 @@ static void machvirt_init(MachineState *machine)
>           object_property_set_int(cpuobj, "thread-id",
>                                   virt_get_thread_id(machine, n), NULL);
>   
> -        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> -        object_unref(cpuobj);
> +        if (n < smp_cpus) {
> +            qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +            object_unref(cpuobj);
> +        } else {
> +            CPUArchId *cpu_slot;
> +
> +            /* handling for vcpus which are yet to be hot-plugged */
> +            cs->cpu_index = n;
> +            cpu_slot = virt_find_cpu_slot(machine, cs->cpu_index);
> +
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

                /*
                 * For KVM, the associated objects like vCPU's file descriptor
                 * is reserved so that they can reused when the vCPU is hot added.
                 * :
                 */

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
> +             cpu_slot->cpu = OBJECT(cs);
> +        }

            /*
             * Make the hotpluggable vCPU present because ....
             */
>       }
>       fdt_add_timer_nodes(vms);
>       fdt_add_cpu_nodes(vms);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e5af79950c..b2201a98ee 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -401,6 +401,7 @@ struct CPUState {
>       uint32_t kvm_fetch_index;
>       uint64_t dirty_pages;
>       int kvm_vcpu_stats_fd;
> +    VMChangeStateEntry *vmcse;
>   
>       /* Use by accel-block: CPU is executing an ioctl() */
>       QemuLockCnt in_ioctl_lock;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index a660e3f483..3a38e7ccaf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -748,6 +748,7 @@ static void aarch64_cpu_initfn(Object *obj)
>        * enabled explicitly
>        */
>       cs->disabled = true;
> +    cs->thread_id = 0;
>   }
>   
>   static void aarch64_cpu_finalizefn(Object *obj)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b4c7654f49..0e1d0692b1 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -637,6 +637,38 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
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
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 94bbd9661f..364cc21f81 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -566,7 +566,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           return -EINVAL;
>       }
>   
> -    qemu_add_vm_change_state_handler(kvm_arm_vm_state_change, cs);
> +    /*
> +     * Install VM change handler only when vCPU thread has been spawned
> +     * i.e. vCPU is being realized
> +     */
> +    if (cs->thread_id) {
> +        cs->vmcse = qemu_add_vm_change_state_handler(kvm_arm_vm_state_change,
> +                                                     cs);
> +    }
>   
>       /* Determine init features for this CPU */
>       memset(cpu->kvm_init_features, 0, sizeof(cpu->kvm_init_features));
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 051a0da41c..31408499b3 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -163,6 +163,17 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
>    */
>   void kvm_arm_reset_vcpu(ARMCPU *cpu);
>   
> +/**
> + * kvm_arm_create_host_vcpu:
> + * @cpu: ARMCPU
> + *
> + * Called at to pre create all possible kvm vCPUs within the the host at the
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
              to create instances for the hotpluggable vCPUs

> + * virt machine init time. This will also init this pre-created vCPU and
> + * hence result in vCPU reset at host. These pre created and inited vCPUs
> + * shall be parked for use when ARM vCPUs are actually realized.
> + */
> +void kvm_arm_create_host_vcpu(ARMCPU *cpu);
> +
>   /**
>    * kvm_arm_init_serror_injection:
>    * @cs: CPUState

Thanks,
Gavin
