Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3290681wrd;
        Fri, 21 Sep 2018 08:47:23 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbyZEAN8HFsBqb4/2sVhMpX0jq5EUn+dDwrhahNQ3N7mM3Sxq8VlUApqXLRzamj65GsDxd9
X-Received: by 2002:a37:c50f:: with SMTP id p15-v6mr5032729qki.61.1537544843528;
        Fri, 21 Sep 2018 08:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537544843; cv=none;
        d=google.com; s=arc-20160816;
        b=UzTce0gESvNptxxTaH9ECnOHtU7BDxPUUBYMmMWfR0x14VWgmbo4yXzYe5pNc3cZs0
         tDnnpBGJfOiNLvWaARwJODzxsBqavlrHJvS/tB77CCnu1uHZedcsrVv3U5YZkXEPMALP
         d1S11TGfT9dXXAfZu6CU0ZGguBY36GzkSsRiAE5B2yVOulqfzsvQ+ixnpoIE6zwaGM4X
         3nk9WUQoouphb9NYpZJ0aP+YVRQWEcp/fHsKdzT5xTZGnVeWybd0NOetT7/mYfxdROoD
         YRZqbuz8q524tKQRd3oQXdBQG908I9hp6rDe8sg50RF5JfVciDAFBNly5O9tDXPSGNzY
         VKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=6pgz+wUxWhEk8uJGnYehWspiAsv1Ia+0+NgP4hu2pN4=;
        b=K3DninMZol/MIh7J+lUl8+hSdbR29w1epoTWUlJa+ad3p495gRuzP5IiofVcvwO+Tl
         tEUr/S87gUVcIJeM6LJp5/vwhfpRQLnOR+VkI/taydFbAhAGEvMsKgahvaximJbBMgX/
         MQCIFlpK4svGdB4ORAw32Jxwdzj5e4k/cmAkgnWQi7P7xX0RtrqZFLcoXYKHJRb3OCrv
         jnnx5z7UIRlVZ2BqOe8P8MaKAdlHhASDiI2eY79uzPfZ1nJHuayCUOwW0xFAHks7Y130
         1BuFcZpr7SCQ7DlYxP92CD3rfZTlEaO+MJmfYaCS3xZ0WUasIzmN+fYlIqFNIEbLpQvs
         5E6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w17-v6si916824qkf.277.2018.09.21.08.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 08:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3NeN-00068U-0a
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 11:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g3Ne4-00067O-Pz
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 11:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1g3Ne2-0007og-07
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 11:47:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1g3Ne1-0007ns-Lj; Fri, 21 Sep 2018 11:47:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB7803097031;
	Fri, 21 Sep 2018 15:46:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0D46106A78C;
	Fri, 21 Sep 2018 15:46:58 +0000 (UTC)
Date: Fri, 21 Sep 2018 17:46:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <20180921154656.ib5uvqxcbokmq3cm@kamzik.brq.redhat.com>
References: <1537032727-29397-1-git-send-email-gengdongjiu@huawei.com>
	<1537032727-29397-3-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537032727-29397-3-git-send-email-gengdongjiu@huawei.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 21 Sep 2018 15:47:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 2/2] target: arm: Add support
 for VCPU event states
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1gSoE+XFJPY4

On Sat, Sep 15, 2018 at 01:32:07PM -0400, Dongjiu Geng wrote:
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
> Change since v8:
> 1. Update the commit message
> 
> Change since v7:
> 1. Change "pending" and "has_esr" from uint32_t to uint8_t for CPUARMState
> 2. Add error_report() in kvm_get_vcpu_events()
> 
> Change since v6:
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
>  target/arm/kvm64.c   | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c | 22 +++++++++++++++++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 62c36b4..034b035 100644
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
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e0b8246..e8705e2 100644
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
> @@ -600,6 +605,60 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>  
> +static int kvm_put_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events = {};
> +    int ret;
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));

nit: this memset is redundant with the '= {}' above. I'd probably keep it
and remove the '= {}' though.

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
> +

nit: no need for this blank line

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
> @@ -727,6 +786,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
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
> @@ -863,6 +927,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
> 1.8.3.1
> 
>

Hmm. kvm_vcpu_events is defined for both 32-bit and 64-bit and the
vmstate isn't in the '#ifdef TARGET_AARCH64', like vmstate_sve, yet
only the target/arm/kvm64.c file is getting updated. Shouldn't we
put kvm_get/put_vcpu_events() in target/arm/kvm.c and then also
update target/arm/kvm32.c?

Thanks,
drew
