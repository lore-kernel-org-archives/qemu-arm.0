Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp639117wrt;
        Wed, 26 Sep 2018 05:56:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60WgJuaHNylvzPae6Ys6kFPkFhbAJUSNCpTWuze0KKrEMu4/mPqFAxCaFmIWT6q4+qgGJTf
X-Received: by 2002:a0c:b792:: with SMTP id l18-v6mr4118876qve.110.1537966573047;
        Wed, 26 Sep 2018 05:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537966573; cv=none;
        d=google.com; s=arc-20160816;
        b=XsarBtsOG2quUrUdJYNTtU9V6whq18ugX2crTbu00JBShSk6UOeQFXCLFhoILDLM9Y
         8iVF3tb5ewxSBybQhbc6rle7sDnXoCo6vczUcso1Oc4LS4zB/D0b6F9/e1tIKaJe9Q9e
         LS7WwEVxvcYbiXKIiccYbUGhjapTOwhPbxTbeeJE/oM573dsLeLhQpk2ZgPeRPZhfeYD
         bCvwhC5ArH0ypvHQYYRGn3xX2VwI2x3P8T6rS4vYRVL+ob7BuspleAvDSsp3CGLXiifz
         6EX7TPBlvQbcDjo90vSr0tRthV1wDvRXS+KSVJ2/gHoi+l30mTPfgmYOjIqCw0eAD3Jn
         nknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=zOkP956wv5y0BdOpmzejpibSTM5/jnE0YP0oIE74CwY=;
        b=pe4DdBwp5RczOxTqFVAjdbb1quffA7W/R+JOoRVvfkzy7SqfHTwfbwC08K2Ii+0np5
         3taPqOZvNV0Sj5AMRs91Xuicq/5NWSDM245UMOJCUDxt4iwg9gTZUX35cQiXu2fTzDVE
         0PmUFtMneFBBIediMTwZdLtBIA9jlJ5UtWaW0SVUVnwr6+QGlEnxluSAkF7tIstjav+x
         9R0gPXaZc74UVdRr4QGVn4jE3vNwR2/zhAjv4ag3N6u3kNrLj9UVz98X5bKXvHzGYTzE
         RjGrouBgzJCMFhwJKiaSsQSfIblg3HBgdHcNUYJrrDJOo1vn7ohI50PxIQaYw6NH8x+D
         sVdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17-v6si4132766qtk.45.2018.09.26.05.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g59MS-0003kv-Kd
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g59MM-0003kq-C3
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g59MK-0005Qk-Tb
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 08:56:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10025)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1g59MK-0005Q9-Kr; Wed, 26 Sep 2018 08:56:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46BF53002738;
	Wed, 26 Sep 2018 12:56:03 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.205.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D30061487;
	Wed, 26 Sep 2018 12:56:01 +0000 (UTC)
Date: Wed, 26 Sep 2018 14:55:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20180926125558.jjwwdtr7qzuijgz2@kamzik.brq.redhat.com>
References: <1537994851-36254-1-git-send-email-gengdongjiu@huawei.com>
	<1537994851-36254-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537994851-36254-3-git-send-email-gengdongjiu@huawei.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 26 Sep 2018 12:56:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 2/2] target/arm: Add support for VCPU
 event states
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWCggNt+uuAS

On Wed, Sep 26, 2018 at 04:47:31PM -0400, Dongjiu Geng wrote:
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
>  target/arm/kvm32.c   | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm64.c   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c | 22 +++++++++++++++++
>  4 files changed, 167 insertions(+)
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
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 4e91c11..0b469d5 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -23,6 +23,8 @@
>  #include "hw/arm/arm.h"
>  #include "qemu/log.h"
>  
> +static bool have_inject_serror_esr;
> +
>  static inline void set_feature(uint64_t *features, int feature)
>  {
>      *features |= 1ULL << feature;
> @@ -217,6 +219,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
>  
> +    /* Check whether userspace can specify guest syndrome value */
> +    have_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> +                                                 KVM_CAP_ARM_INJECT_SERROR_ESR);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>  
> @@ -297,6 +303,60 @@ static const Reg regs[] = {
>      VFPSYSREG(FPINST2),
>  };
>  
> +static int kvm_put_vcpu_events(ARMCPU *cpu)
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
> +    if (have_inject_serror_esr) {
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
> +static int kvm_get_vcpu_events(ARMCPU *cpu)
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
> +
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -358,6 +418,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
> @@ -445,6 +510,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
> index e0b8246..e8c9c19 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -29,6 +29,7 @@
>  #include "hw/arm/arm.h"
>  
>  static bool have_guest_debug;
> +static bool have_inject_serror_esr;
>  
>  /*
>   * Although the ARM implementation of hardware assisted debugging
> @@ -546,6 +547,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      kvm_arm_init_debug(cs);
>  
> +    /* Check whether userspace can specify guest syndrome value */
> +    have_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> +                                                 KVM_CAP_ARM_INJECT_SERROR_ESR);
> +
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>  
> @@ -600,6 +605,59 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>  
> +static int kvm_put_vcpu_events(ARMCPU *cpu)
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
> +    if (have_inject_serror_esr) {
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
> +static int kvm_get_vcpu_events(ARMCPU *cpu)
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
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      struct kvm_one_reg reg;
> @@ -727,6 +785,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
> @@ -863,6 +926,11 @@ int kvm_arch_get_registers(CPUState *cs)
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

Why aren't kvm_get_vcpu_events() and kvm_put_vcpu_events() in 
target/arm/kvm.c, as I suggested in my last review? There's
no need to duplicate them for kvm32.c and kvm64.c, afaict.

Thanks,
drew
