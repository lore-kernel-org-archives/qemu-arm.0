Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2993798ejc;
        Thu, 28 Sep 2023 21:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqts1Z/6AAvOJS3Opc+nrZM832C/NjdXRIdM9a/zRJwN1XlSRhKrmUI7S9UOHcDT4T0zEN
X-Received: by 2002:a0c:dc0a:0:b0:65c:fd45:e23c with SMTP id s10-20020a0cdc0a000000b0065cfd45e23cmr3108956qvk.30.1695960923678;
        Thu, 28 Sep 2023 21:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695960923; cv=none;
        d=google.com; s=arc-20160816;
        b=S0PUENyhmhrXfW8igs59xkLAQ4Equ6zyHIJiqvPApFDP08lSUPvjIROgZvqjoLh/m9
         072ORGSu50QPT2NYshqF5fKwo0XVzmK48gcw+wOQd+eJIoRP+CYUZjuRriJq5QPMS5qm
         4a0iyDN9owJkESNh+lHpFZNPSlJ2F4EBdVIgkNoVdp2XOX5HzRlh8zNIU0a7FbBJWefc
         NNxHmq1rhpKV8zyrwjy0iaxQ0s6KlWXEnN/wufp7ilPkCskz4qW3L7NJeJhvjzra994H
         hRuMj7Qj/g/H7ehdTHo0sFJWwPN2ZH1/MM45uZ2FM1eHTkIAUFH/9PeV/P4IAMmHzncO
         +uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J20xDGLTbKuBA30clBAfcVaDmbadwIw635CoZGQ5C3o=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=xZ/ak9BScC8XovxVVGHszGoeFGgi0zeOHXnBF5L0meJhB5iKHlAYopPe0C/4WSUNA+
         RY63G72+KqraX9WhWmDKlhFXfg8mcc6nQgrqr0MybJVCQM1+tFMLU21XPyLe8X7J0+lf
         FrwqmyfRD4JAUKROS0otVt+vCIfYC87Yw4N9U6vs/0ZQhZOe1sD/zBp0NxrGHpQPymd/
         wXFhMxwKvybo0+hda6mQzQzxpyTBVgKK1PpyYQ0Kf1JjrH6/HgM+SVFbZbkwOJgy0zeY
         9ApjadxksJM0YAyfcghC1JmWnhY5SBLYZlUXN6euVR9YDdKOYrVxqRHzE1aaB4ugDUVo
         5j+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aVe09MSi;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f4-20020a05620a280400b0076dbb867d4dsi9998101qkp.372.2023.09.28.21.15.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 21:15:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aVe09MSi;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695960923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J20xDGLTbKuBA30clBAfcVaDmbadwIw635CoZGQ5C3o=;
	b=aVe09MSiZmlOspPy6yHYRKXtMOAt0f+7OhBSnKIKmciKXZuE8tRbA0o5ai1ht/2FeofuVe
	p8rVhyp21OceDSSNa1H8Amb85Obdr+0Ql/0r7oFpPxKiG6+sONM5BMWYYWIzLIg8tuVG+4
	rFOojaUFbALMVgV4EEdzm/ap77ZZ99Q=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-zHM5CndLPvqslpBHl8dYpQ-1; Fri, 29 Sep 2023 00:15:21 -0400
X-MC-Unique: zHM5CndLPvqslpBHl8dYpQ-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-57b63eba015so24200847eaf.3
        for <alex.bennee@linaro.org>; Thu, 28 Sep 2023 21:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695960921; x=1696565721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J20xDGLTbKuBA30clBAfcVaDmbadwIw635CoZGQ5C3o=;
        b=XCe53soReOmOHIU9xr9KiVkI/vhAGHxxJxavT1KBfGvX6YXa3UbsFDdiPfFrXVrSs7
         z8QDmuoz+k+p7TByUDviois8+Z98E1mngJukUJVXeUANB+nEjrZOpyT4ngv/6uzoc3HA
         x41adbC1pEB6yVuQk2MNbmaVLYT3c3uvMQdffFuiDWysXDkniBCydrbpCxzh6jogsbgZ
         rQTNtFISbKnG2bf4JBPvcVcnR8KnG3hhugeoNteDf0TmN6SoeBUJLG6nQVoD6THQ2b3h
         QdXSAM1aO4KN+oALAkSWksOmWUT/tjQksiq2YKhPoGXSKa52oc0SDmDVbz81rFAC+Al0
         vH3w==
X-Gm-Message-State: AOJu0Yxr7OoDiIp2CKPsiyyF5VBQP1+jsZsauwonDUONvIEX5YYEd+Gv
	Lr6ut7N8u488Lm35I2DQ9LsPu6clzr8jX8Z+4T5LKHjGJSv+1vr0GVTnVV8ky1Ku7DPPm760+fh
	M1i32VTAI13EU68WE
X-Received: by 2002:a05:6358:339f:b0:142:d1cb:48ab with SMTP id i31-20020a056358339f00b00142d1cb48abmr3595571rwd.15.1695960920695;
        Thu, 28 Sep 2023 21:15:20 -0700 (PDT)
X-Received: by 2002:a05:6358:339f:b0:142:d1cb:48ab with SMTP id i31-20020a056358339f00b00142d1cb48abmr3595535rwd.15.1695960920169;
        Thu, 28 Sep 2023 21:15:20 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0068c0fcb40d3sm14149478pfn.211.2023.09.28.21.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 21:15:19 -0700 (PDT)
Message-ID: <a3ae4b88-6066-4c21-5fe5-cfe74bc58aaa@redhat.com>
Date: Fri, 29 Sep 2023 14:15:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 34/37] target/arm/kvm,tcg: Register/Handle SMCCC
 hypercall exits to VMM/Qemu
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
 <20230926103654.34424-1-salil.mehta@huawei.com>
 <20230926103654.34424-3-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926103654.34424-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AOKQoQmFtY8i

Hi Salil,

On 9/26/23 20:36, Salil Mehta wrote:
> From: Author Salil Mehta <salil.mehta@huawei.com>
> 
> Add registration and Handling of HVC/SMC hypercall exits to VMM
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   target/arm/arm-powerctl.c   | 51 +++++++++++++++++++++++++++++-------
>   target/arm/helper.c         |  2 +-
>   target/arm/internals.h      | 11 --------
>   target/arm/kvm.c            | 52 +++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c          | 46 +++++++++++++++++++++++++++++---
>   target/arm/kvm_arm.h        | 13 ++++++++++
>   target/arm/meson.build      |  1 +
>   target/arm/{tcg => }/psci.c |  8 ++++++
>   target/arm/tcg/meson.build  |  4 ---
>   9 files changed, 160 insertions(+), 28 deletions(-)
>   rename target/arm/{tcg => }/psci.c (97%)
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index 326a03153d..0184c7fb09 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -16,6 +16,7 @@
>   #include "qemu/log.h"
>   #include "qemu/main-loop.h"
>   #include "sysemu/tcg.h"
> +#include "hw/boards.h"
>   
>   #ifndef DEBUG_ARM_POWERCTL
>   #define DEBUG_ARM_POWERCTL 0
> @@ -28,18 +29,37 @@
>           } \
>       } while (0)
>   
> +static CPUArchId *arm_get_archid_by_id(uint64_t id)
> +{
> +    int n;
> +    CPUArchId *arch_id;
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    /*
> +     * At this point disabled CPUs don't have a CPUState, but their CPUArchId
> +     * exists.
> +     *
> +     * TODO: Is arch_id == mp_affinity? This needs work.
> +     */
> +    for (n = 0; n < ms->possible_cpus->len; n++) {
> +        arch_id = &ms->possible_cpus->cpus[n];
> +
> +        if (arch_id->arch_id == id) {
> +            return arch_id;
> +        }
> +    }
> +    return NULL;
> +}
> +

The @arch_id should be same thing to @mp_affinity except for the boot CPU.
For the boot CPU, its value is fetched from MPIDR, which is determined by
cs->cpu_index, passed to host via ioctl(CREATE_VCPU). Besides, another
similiar function qemu_get_cpu_archid() exists in cpus-common.c. I think
they can be combined. Again, all these information inherited from
ms->possible_cpus may be better to be managed in board level, like the
vCPU states.

>   CPUState *arm_get_cpu_by_id(uint64_t id)
>   {
> -    CPUState *cpu;
> +    CPUArchId *arch_id;
>   
>       DPRINTF("cpu %" PRId64 "\n", id);
>   
> -    CPU_FOREACH(cpu) {
> -        ARMCPU *armcpu = ARM_CPU(cpu);
> -
> -        if (armcpu->mp_affinity == id) {
> -            return cpu;
> -        }
> +    arch_id = arm_get_archid_by_id(id);
> +    if (arch_id && arch_id->cpu) {
> +        return CPU(arch_id->cpu);
>       }
>   
>       qemu_log_mask(LOG_GUEST_ERROR,
> @@ -148,6 +168,7 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>   {
>       CPUState *target_cpu_state;
>       ARMCPU *target_cpu;
> +    CPUArchId *arch_id;
>       struct CpuOnInfo *info;
>   
>       assert(qemu_mutex_iothread_locked());
> @@ -168,12 +189,24 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>       }
>   
>       /* Retrieve the cpu we are powering up */
> -    target_cpu_state = arm_get_cpu_by_id(cpuid);
> -    if (!target_cpu_state) {
> +    arch_id = arm_get_archid_by_id(cpuid);
> +    if (!arch_id) {
>           /* The cpu was not found */
>           return QEMU_ARM_POWERCTL_INVALID_PARAM;
>       }
>   
> +    target_cpu_state = CPU(arch_id->cpu);
> +    if (!qemu_enabled_cpu(target_cpu_state)) {
> +        /*
> +         * The cpu is not plugged in or disabled. We should return appropriate
> +         * value as introduced in DEN0022E PSCI 1.2 issue E
                                                        ^^^^^^^
                                                        issue E, which is QEMU_PSCI_RET_DENIED.
> +         */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "[ARM]%s: Denying attempt to online removed/disabled "
> +                      "CPU%" PRId64"\n", __func__, cpuid);
> +        return QEMU_ARM_POWERCTL_IS_OFF;
> +    }
> +
>       target_cpu = ARM_CPU(target_cpu_state);
>       if (target_cpu->power_state == PSCI_ON) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 272d6ba139..4d396426f2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11187,7 +11187,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>                         env->exception.syndrome);
>       }
>   
> -    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
> +    if (arm_is_psci_call(cpu, cs->exception_index)) {
>           arm_handle_psci_call(cpu);
>           qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>           return;

We may still limit the capability to handle PSCI calls to TCG and KVM,
meaning HVF and QTest won't have this capability.

> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fe330e89e7..7ffefc2d58 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -305,21 +305,10 @@ vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len);
>   /* Callback function for when a watchpoint or breakpoint triggers. */
>   void arm_debug_excp_handler(CPUState *cs);
>   
> -#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_TCG)
> -static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
> -{
> -    return false;
> -}
> -static inline void arm_handle_psci_call(ARMCPU *cpu)
> -{
> -    g_assert_not_reached();
> -}
> -#else
>   /* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
>   bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
>   /* Actually handle a PSCI call */
>   void arm_handle_psci_call(ARMCPU *cpu);
> -#endif
>   
>   /**
>    * arm_clear_exclusive: clear the exclusive monitor
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8e7c68af6a..6f3fd5aecd 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -250,6 +250,7 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
>   int kvm_arch_init(MachineState *ms, KVMState *s)
>   {
>       int ret = 0;
> +
   ^^^^
Unnecessary change.

>       /* For ARM interrupt delivery is always asynchronous,
>        * whether we are using an in-kernel VGIC or not.
>        */
> @@ -280,6 +281,22 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           }
>       }
>   
> +    /*
> +     * To be able to handle PSCI CPU ON calls in QEMU, we need to install SMCCC
                                         ^^
                                         ON/OFF
> +     * filter in the Host KVM. This is required to support features like
> +     * virtual CPU Hotplug on ARM platforms.
> +     */
> +    if (kvm_arm_set_smccc_filter(PSCI_0_2_FN64_CPU_ON,
> +                                 KVM_SMCCC_FILTER_FWD_TO_USER)) {
> +        error_report("CPU On PSCI-to-user-space fwd filter install failed");
> +        abort();
> +    }
> +    if (kvm_arm_set_smccc_filter(PSCI_0_2_FN_CPU_OFF,
> +                                 KVM_SMCCC_FILTER_FWD_TO_USER)) {
> +        error_report("CPU Off PSCI-to-user-space fwd filter install failed");
> +        abort();
> +    }
> +
>       kvm_arm_init_debug(s);
>   
>       return ret;

The PSCI_ON and PSCI_OFF will be unconditionally handled by QEMU if KVM is
enabled, even vCPU hotplug isn't supported on hw/arm/virt board. Do we need to
enable it only when vCPU hotplug is supported?

> @@ -952,6 +969,38 @@ static int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
>       return -1;
>   }
>   
> +static int kvm_arm_handle_hypercall(CPUState *cs, struct kvm_run *run)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    kvm_cpu_synchronize_state(cs);
> +
> +    /*
> +     * hard coding immediate to 0 as we dont expect non-zero value as of now
                                            ^^^^
                                            don't
> +     * This might change in future versions. Hence, KVM_GET_ONE_REG  could be
> +     * used in such cases but it must be enhanced then only synchronize will
> +     * also fetch ESR_EL2 value.
> +     */
> +    if (run->hypercall.flags == KVM_HYPERCALL_EXIT_SMC) {
> +        cs->exception_index = EXCP_SMC;
> +        env->exception.syndrome = syn_aa64_smc(0);
> +    } else {
> +        cs->exception_index = EXCP_HVC;
> +        env->exception.syndrome = syn_aa64_hvc(0);
> +    }
> +    env->exception.target_el = 1;
> +    qemu_mutex_lock_iothread();
> +    arm_cpu_do_interrupt(cs);
> +    qemu_mutex_unlock_iothread();
> +
> +    /*
> +     * For PSCI, exit the kvm_run loop and process the work. Especially
> +     * important if this was a CPU_OFF command and we can't return to the guest.
> +     */
> +    return EXCP_INTERRUPT;
> +}
> +
>   int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>   {
>       int ret = 0;
> @@ -967,6 +1016,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>           ret = kvm_arm_handle_dabt_nisv(cs, run->arm_nisv.esr_iss,
>                                          run->arm_nisv.fault_ipa);
>           break;
> +    case KVM_EXIT_HYPERCALL:
> +          ret = kvm_arm_handle_hypercall(cs, run);
> +        break;
>       default:
>           qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                         __func__, run->exit_reason);
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 38de0b4148..efe24e3f90 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -113,6 +113,25 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
>       return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
>   }
>   
> +static bool kvm_arm_set_vm_attr(struct kvm_device_attr *attr, const char *name)
> +{
> +    int err;
> +
> +    err = kvm_vm_ioctl(kvm_state, KVM_HAS_DEVICE_ATTR, attr);
> +    if (err != 0) {
> +        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
> +        return false;
> +    }
> +
> +    err = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, attr);
> +    if (err != 0) {
> +        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
>                                       const char *name)
>   {
> @@ -183,6 +202,28 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
>       }
>   }
>   
> +int kvm_arm_set_smccc_filter(uint64_t func, uint8_t faction)
> +{
> +    struct kvm_smccc_filter filter = {
> +        .base = func,
> +        .nr_functions = 1,
> +        .action = faction,
> +    };
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VM_SMCCC_CTRL,
> +        .attr = KVM_ARM_VM_SMCCC_FILTER,
> +        .flags = 0,
> +        .addr = (uintptr_t)&filter,
> +    };
> +
> +    if (!kvm_arm_set_vm_attr(&attr, "SMCCC Filter")) {
> +        error_report("failed to set SMCCC filter in KVM Host");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>   static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
>   {
>       uint64_t ret;
> @@ -633,9 +674,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>       }
>   
>       /*
> -     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
> -     * Currently KVM has its own idea about MPIDR assignment, so we
> -     * override our defaults with what we get from KVM.
> +     * KVM may emulate PSCI in-kernel. Currently KVM has its own idea about
> +     * MPIDR assignment, so we override our defaults with what we get from KVM.
>        */
>       ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
>       if (ret) {
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 31408499b3..bf4df54c96 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -388,6 +388,15 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
>   
>   int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>   
> +/**
> + * kvm_arm_set_smccc_filter
> + * @func: funcion
> + * @faction: SMCCC filter action(handle, deny, fwd-to-user) to be deployed
> + *
> + * Sets the ARMs SMC-CC filter in KVM Host for selective hypercall exits
> + */
> +int kvm_arm_set_smccc_filter(uint64_t func, uint8_t faction);
> +
>   #else
>   
>   /*
> @@ -462,6 +471,10 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>       g_assert_not_reached();
>   }
>   
> +static inline int kvm_arm_set_smccc_filter(uint64_t func, uint8_t faction)
> +{
> +    g_assert_not_reached();
> +}
>   #endif
>   
>   /**
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index e645e456da..fdfc8b958f 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -23,6 +23,7 @@ arm_system_ss.add(files(
>     'arm-qmp-cmds.c',
>     'cortex-regs.c',
>     'machine.c',
> +  'psci.c',
>     'ptw.c',
>   ))
>   
> diff --git a/target/arm/tcg/psci.c b/target/arm/psci.c
> similarity index 97%
> rename from target/arm/tcg/psci.c
> rename to target/arm/psci.c
> index 6c1239bb96..a8690a16af 100644
> --- a/target/arm/tcg/psci.c
> +++ b/target/arm/psci.c
> @@ -21,7 +21,9 @@
>   #include "exec/helper-proto.h"
>   #include "kvm-consts.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/error-report.h"
>   #include "sysemu/runstate.h"
> +#include "sysemu/tcg.h"
>   #include "internals.h"
>   #include "arm-powerctl.h"
>   
> @@ -157,6 +159,11 @@ void arm_handle_psci_call(ARMCPU *cpu)
>       case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
>       case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
>       case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
> +       if (!tcg_enabled()) {
> +            warn_report("CPU suspend not supported in non-tcg mode");
> +            break;
> +       }
> +#ifdef CONFIG_TCG
>           /* Affinity levels are not supported in QEMU */
>           if (param[1] & 0xfffe0000) {
>               ret = QEMU_PSCI_RET_INVALID_PARAMS;
> @@ -169,6 +176,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
>               env->regs[0] = 0;
>           }
>           helper_wfi(env, 4);
> +#endif
>           break;
>       case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
>           switch (param[1]) {
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 6fca38f2cc..ad3cfcb3bd 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -51,7 +51,3 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>     'sme_helper.c',
>     'sve_helper.c',
>   ))
> -
> -arm_system_ss.add(files(
> -  'psci.c',
> -))

Thanks,
Gavin
