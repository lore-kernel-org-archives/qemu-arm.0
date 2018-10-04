Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp910152wrt;
        Thu, 4 Oct 2018 06:41:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV610qFkvL2Xiuu07B+bGFufsIwNf8y2sqFWvpZOdALiqR38DXrjUqliv2RHP651PyCeToPHA
X-Received: by 2002:ac8:42dd:: with SMTP id g29-v6mr5303486qtm.162.1538660496781;
        Thu, 04 Oct 2018 06:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538660496; cv=none;
        d=google.com; s=arc-20160816;
        b=SUjTuD0Sxut8T5bTZvLsewCdGM8sj98ZVLgoLvqTfbxnz6pu3Sx1Uw7tfNPJJ/l9su
         8WJIzIhN8APuqqYHGe7cmxoSgJfeMWC8QqF/cdPIjAkselhRIm3PzRZgVQpRuJ363nFN
         /YLhEDSQkDpoNcrxKvtkXpyXaD6thfWr5CkOa2U7aMKxXFdys2ggc9RrXXm1xSIxzbDQ
         ufc3ytEI7awvq17zaIAvC4iFOTPhX2p7wvX03frRJ1AI410uPpBlR/R7Oof+ITEXWHE7
         7KrnTfiaLI4XGvvUtPJna4FN+za4gY7Ilw3cMC9fHkc0L5Yv98RR3EtErEalhWHFJZ9B
         LVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1QtvlvB2qqKcxNCf0Jo+MBeraobY/UC6ICOfgzfTO8c=;
        b=ktl297tm7MzZgeF+5AOJjsMzjaZ3q+MSbJvHquBshKTJmdW0JiOVEZse+UzgjkXg+7
         bvNCLsi62UeeXyKY5HPEp0l+iatUcy9NWWVb0NM6u644XuCgMcAQzkykW/yOxun4mpCJ
         SqdvBbYfnBzjd5lca2QDxp2BHwA5xe73j5U7gSPtYjCwpjua7Z4uC9G0Az1+F7TNwXBy
         mc+H/7MJEI1O1hxGJptA+XVcKSFYoC6KJldsNNg7M5nyHmp+AlBW6pi9T5XtRTv7Bx5M
         9IlCM9DOrrU7wdgfetzCq+OQpJqLU0+cHZv8DQBMraObDb+uxwKAsSmfBiGYrp0rSmfx
         LipA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t3-v6si3114866qkb.249.2018.10.04.06.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 06:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g83sR-0000m2-BE
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 09:41:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g83sD-0000lS-Iy
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 09:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g83s9-0003qo-Sd
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 09:41:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41766)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1g83s8-0003lk-Ly; Thu, 04 Oct 2018 09:40:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12F3088308;
	Thu,  4 Oct 2018 13:40:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-124-5.rdu2.redhat.com [10.10.124.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D961822B;
	Thu,  4 Oct 2018 13:40:51 +0000 (UTC)
Date: Thu, 4 Oct 2018 08:40:49 -0500
From: Andrew Jones <drjones@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20181004134049.3sl6unwr42d2pnoi@kamzik.brq.redhat.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
	<1538067351-23931-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538067351-23931-3-git-send-email-gengdongjiu@huawei.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 Oct 2018 13:40:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC v11 2/2] target/arm: Add
 support for VCPU event states
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhengxiang9@huawei.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xMSMsJeTt4Kj

On Thu, Sep 27, 2018 at 12:55:51PM -0400, Dongjiu Geng wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.
> 
> The SError exception states include SError pending state and ESR value,
> the kvm_put/get_vcpu_events() will be called when set or get system
> registers. When do migration, if source machine has SError pending,
> QEMU will do this migration regardless whether the target machine supports
> to specify guest ESR value, because if target machine does not support that,
> it can also inject the SError with zero ESR value.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Because I do not have arm32 platform, only have arm64 platform,
> so I only test this patch in arm64, if somebody else can test this
> patch, I will very appreciate that.
> 
> How to test this patch:
> 1. Apply this patch to enable 32 bit KVM vcpu events support:
>    https://patchwork.kernel.org/patch/10612479/
> 2. Source machine is pending a SError, that is 'events.exception.serror_pending = 1',
>    then do migration, to see whether target machine will be also pending this SError.
> 
> Change since V10:
> Address Andrew's comments:
> 1. Put kvm_get/put_vcpu_events() into target/arm/kvm.c
> 
> Change since V9:
> address Andrew's comments:
> 1. Remove the '= {}' in kvm_put_vcpu_events()
> 2. Remove a blank line in kvm_get_vcpu_events()
> 3. Add 32 bit KVM supports
> 
> Change since v8:
> 1. Update the commit message
> 
> Change since v7:
> address shannon's comments:
> 1. Change "pending" and "has_esr" from uint32_t to uint8_t for CPUARMState
> 2. Add error_report() in kvm_get_vcpu_events()
> 
> Change since v6:
> address Peter's comments:
> 1. Add cover letter
> 2. Change name "cpu/ras" to "cpu/serror"
> 3. Add some comments and check the ioctl return value for kvm_put_vcpu_events()
> 
> Change since v5:
> address Peter's comments:
> 1. Move the "struct serror" before the "end_reset_fields" in CPUARMState
> 2. Remove ARM_FEATURE_RAS_EXT and add a variable have_inject_serror_esr
> 3. Use the variable have_inject_serror_esr to track whether the kernel has state we need to migrate
> 4. Remove printf() in kvm_arch_put_registers()
> 5. ras_needed/vmstate_ras to serror_needed/vmstate_serror
> 6. Check to use "return env.serror.pending != 0" instead of "arm_feature(env, ARM_FEATURE_RAS_EXT)" in the ras_needed()
> 
> Change since v4:
> 1. Rebase the code to latest
> ---
>  target/arm/cpu.h     |  7 ++++++
>  target/arm/kvm.c     | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm32.c   | 13 ++++++++++++
>  target/arm/kvm64.c   | 13 ++++++++++++
>  target/arm/kvm_arm.h | 24 +++++++++++++++++++++
>  target/arm/machine.c | 22 +++++++++++++++++++
>  6 files changed, 139 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 65c0fa0..a8454f5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -530,6 +530,13 @@ typedef struct CPUARMState {
>           */
>      } exception;
>  
> +    /* Information associated with an SError */
> +    struct {
> +        uint8_t pending;
> +        uint8_t has_esr;
> +        uint64_t esr;
> +    } serror;
> +
>      /* Thumb-2 EE state.  */
>      uint32_t teecr;
>      uint32_t teehbr;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 65f867d..c45eb91 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -34,6 +34,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>  };
>  
>  static bool cap_has_mp_state;
> +static bool cap_has_inject_serror_esr;
>  
>  static ARMHostCPUFeatures arm_host_cpu_features;
>  
> @@ -48,6 +49,12 @@ int kvm_arm_vcpu_init(CPUState *cs)
>      return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
>  }
>  
> +void kvm_arm_init_serror_injection(CPUState *cs)
> +{
> +    cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> +                                    KVM_CAP_ARM_INJECT_SERROR_ESR);
> +}
> +
>  bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>                                        int *fdarray,
>                                        struct kvm_vcpu_init *init)
> @@ -522,6 +529,59 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
>      return 0;
>  }
>  
> +int kvm_put_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events;
> +    int ret;
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    events.exception.serror_pending = env->serror.pending;
> +
> +    /* Inject SError to guest with specified syndrome if host kernel
> +     * supports it, otherwise inject SError without syndrome.
> +     */
> +    if (cap_has_inject_serror_esr) {
> +        events.exception.serror_has_esr = env->serror.has_esr;
> +        events.exception.serror_esr = env->serror.esr;
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
> +    if (ret) {
> +        error_report("failed to put vcpu events");
> +    }
> +
> +    return ret;
> +}
> +
> +int kvm_get_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events;
> +    int ret;
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_VCPU_EVENTS, &events);
> +    if (ret) {
> +        error_report("failed to get vcpu events");
> +        return ret;
> +    }
> +
> +    env->serror.pending = events.exception.serror_pending;
> +    env->serror.has_esr = events.exception.serror_has_esr;
> +    env->serror.esr = events.exception.serror_esr;
> +
> +    return 0;
> +}
> +
>  void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
>  {
>  }
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 4e91c11..0f1e94c 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -217,6 +217,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
>  
> +    /* Check whether userspace can specify guest syndrome value */
> +    kvm_arm_init_serror_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>  
> @@ -358,6 +361,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      /* Note that we do not call write_cpustate_to_list()
>       * here, so we are only writing the tuple list back to
>       * KVM. This is safe because nothing can change the
> @@ -445,6 +453,11 @@ int kvm_arch_get_registers(CPUState *cs)
>      }
>      vfp_set_fpscr(env, fpscr);
>  
> +    ret = kvm_get_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      if (!write_kvmstate_to_list(cpu)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e0b8246..5411486 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -546,6 +546,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      kvm_arm_init_debug(cs);
>  
> +    /* Check whether user space can specify guest syndrome value */
> +    kvm_arm_init_serror_injection(cs);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>  
> @@ -727,6 +730,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>  
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> @@ -863,6 +871,11 @@ int kvm_arch_get_registers(CPUState *cs)
>      }
>      vfp_set_fpcr(env, fpr);
>  
> +    ret = kvm_get_vcpu_events(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +
>      if (!write_kvmstate_to_list(cpu)) {
>          return EINVAL;
>      }
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 863f205..b9335fa 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -121,6 +121,30 @@ bool write_kvmstate_to_list(ARMCPU *cpu);
>   */
>  void kvm_arm_reset_vcpu(ARMCPU *cpu);
>  
> +/**
> + * kvm_arm_init_serror_injection:
> + * @cs: CPUState
> + *
> + * Check whether KVM can set guest SError syndrome.
> + */
> +void kvm_arm_init_serror_injection(CPUState *cs);
> +
> +/**
> + * kvm_get_vcpu_events:
> + * @cpu: ARMCPU
> + *
> + * Get VCPU related state from kvm.
> + */
> +int kvm_get_vcpu_events(ARMCPU *cpu);
> +
> +/**
> + * kvm_put_vcpu_events:
> + * @cpu: ARMCPU
> + *
> + * Put VCPU related state to kvm.
> + */
> +int kvm_put_vcpu_events(ARMCPU *cpu);
> +
>  #ifdef CONFIG_KVM
>  /**
>   * kvm_arm_create_scratch_host_vcpu:
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index ff4ec22..32bcde0 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
>  };
>  #endif /* AARCH64 */
>  
> +static bool serror_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    return env->serror.pending != 0;
> +}
> +
> +static const VMStateDescription vmstate_serror = {
> +    .name = "cpu/serror",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = serror_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(env.serror.pending, ARMCPU),
> +        VMSTATE_UINT8(env.serror.has_esr, ARMCPU),
> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool m_needed(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -726,6 +747,7 @@ const VMStateDescription vmstate_arm_cpu = {
>  #ifdef TARGET_AARCH64
>          &vmstate_sve,
>  #endif
> +        &vmstate_serror,
>          NULL
>      }
>  };
> -- 
> 2.7.4
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
