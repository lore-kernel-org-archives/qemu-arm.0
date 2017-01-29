Received: by 10.25.77.65 with SMTP id a62csp1014424lfb;
        Sun, 29 Jan 2017 03:53:17 -0800 (PST)
X-Received: by 10.55.203.74 with SMTP id d71mr15971386qkj.269.1485690797328;
        Sun, 29 Jan 2017 03:53:17 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id l198si7472207qke.24.2017.01.29.03.53.16;
        Sun, 29 Jan 2017 03:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D82FD40905;
	Sun, 29 Jan 2017 06:53:00 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bheBfVBOCRQX; Sun, 29 Jan 2017 06:52:59 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AE507405DA;
	Sun, 29 Jan 2017 06:52:59 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 33E9C405DA
 for <kvmarm@lists.cs.columbia.edu>; Sun, 29 Jan 2017 06:52:58 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKyrO6-sistV for <kvmarm@lists.cs.columbia.edu>;
 Sun, 29 Jan 2017 06:52:57 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id DD96440187
 for <kvmarm@lists.cs.columbia.edu>; Sun, 29 Jan 2017 06:52:56 -0500 (EST)
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
 [10.5.11.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 10F314E4F3;
 Sun, 29 Jan 2017 11:53:13 +0000 (UTC)
Received: from hawk.localdomain (vpn1-4-142.ams2.redhat.com [10.36.4.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF45B3249;
 Sun, 29 Jan 2017 11:53:08 +0000 (UTC)
Date: Sun, 29 Jan 2017 12:53:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-devel] [PATCH RFC 3/6] arm: kvm64: Check if kvm supports
 cross type vCPU
Message-ID: <20170129115306.iuhvofl3y65x7sjw@hawk.localdomain>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
 <1484558821-15512-4-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1484558821-15512-4-git-send-email-zhaoshenglong@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sun, 29 Jan 2017 11:53:13 +0000 (UTC)
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
 wu.wubin@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: SRn7HqPS81no

On Mon, Jan 16, 2017 at 05:26:58PM +0800, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> If user requests a specific type vCPU which is not same with the
> physical ones and if kvm supports cross type vCPU, we set the
> KVM_ARM_VCPU_CROSS bit and set the CPU ID registers.
> 
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  target/arm/kvm64.c | 182 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 6111109..70442ea 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -481,7 +481,151 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
>      return true;
>  }
>  
> +#define ARM_CPU_ID_MIDR        3, 0, 0, 0, 0
>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
> +/* ID group 1 registers */
> +#define ARM_CPU_ID_REVIDR      3, 0, 0, 0, 6
> +#define ARM_CPU_ID_AIDR        3, 1, 0, 0, 7
> +
> +/* ID group 2 registers */
> +#define ARM_CPU_ID_CCSIDR      3, 1, 0, 0, 0
> +#define ARM_CPU_ID_CLIDR       3, 1, 0, 0, 1
> +#define ARM_CPU_ID_CSSELR      3, 2, 0, 0, 0
> +#define ARM_CPU_ID_CTR         3, 3, 0, 0, 1
> +
> +/* ID group 3 registers */
> +#define ARM_CPU_ID_PFR0        3, 0, 0, 1, 0
> +#define ARM_CPU_ID_PFR1        3, 0, 0, 1, 1
> +#define ARM_CPU_ID_DFR0        3, 0, 0, 1, 2
> +#define ARM_CPU_ID_AFR0        3, 0, 0, 1, 3
> +#define ARM_CPU_ID_MMFR0       3, 0, 0, 1, 4
> +#define ARM_CPU_ID_MMFR1       3, 0, 0, 1, 5
> +#define ARM_CPU_ID_MMFR2       3, 0, 0, 1, 6
> +#define ARM_CPU_ID_MMFR3       3, 0, 0, 1, 7
> +#define ARM_CPU_ID_ISAR0       3, 0, 0, 2, 0
> +#define ARM_CPU_ID_ISAR1       3, 0, 0, 2, 1
> +#define ARM_CPU_ID_ISAR2       3, 0, 0, 2, 2
> +#define ARM_CPU_ID_ISAR3       3, 0, 0, 2, 3
> +#define ARM_CPU_ID_ISAR4       3, 0, 0, 2, 4
> +#define ARM_CPU_ID_ISAR5       3, 0, 0, 2, 5
> +#define ARM_CPU_ID_MMFR4       3, 0, 0, 2, 6
> +#define ARM_CPU_ID_MVFR0       3, 0, 0, 3, 0
> +#define ARM_CPU_ID_MVFR1       3, 0, 0, 3, 1
> +#define ARM_CPU_ID_MVFR2       3, 0, 0, 3, 2
> +#define ARM_CPU_ID_AA64PFR0    3, 0, 0, 4, 0
> +#define ARM_CPU_ID_AA64PFR1    3, 0, 0, 4, 1
> +#define ARM_CPU_ID_AA64DFR0    3, 0, 0, 5, 0
> +#define ARM_CPU_ID_AA64DFR1    3, 0, 0, 5, 1
> +#define ARM_CPU_ID_AA64AFR0    3, 0, 0, 5, 4
> +#define ARM_CPU_ID_AA64AFR1    3, 0, 0, 5, 5
> +#define ARM_CPU_ID_AA64ISAR0   3, 0, 0, 6, 0
> +#define ARM_CPU_ID_AA64ISAR1   3, 0, 0, 6, 1
> +#define ARM_CPU_ID_AA64MMFR0   3, 0, 0, 7, 0
> +#define ARM_CPU_ID_AA64MMFR1   3, 0, 0, 7, 1
> +#define ARM_CPU_ID_MAX         36

We don't need ARM_CPU_ID_MAX, I'll show you why below

> +
> +static int kvm_arm_set_id_registers(CPUState *cs)
> +{
> +    int ret = 0;
> +    uint32_t i;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    struct kvm_one_reg id_regitsers[ARM_CPU_ID_MAX];
> +
> +    memset(id_regitsers, 0, ARM_CPU_ID_MAX * sizeof(struct kvm_one_reg));
> +
> +    id_regitsers[0].id = ARM64_SYS_REG(ARM_CPU_ID_MIDR);
> +    id_regitsers[0].addr = (uintptr_t)&cpu->midr;
> +
> +    id_regitsers[1].id = ARM64_SYS_REG(ARM_CPU_ID_REVIDR);
> +    id_regitsers[1].addr = (uintptr_t)&cpu->revidr;
> +

We can condense this nicely with list initialization

 struct kvm_one_reg id_regitsers[] = {
   { ARM64_SYS_REG(ARM_CPU_ID_MIDR), (uintptr_t)&cpu->midr },
   { ARM64_SYS_REG(ARM_CPU_ID_REVIDR), (uintptr_t)&cpu->revidr },
   ...
   { 0, 0 }
 };

...
> +
> +    for (i = 0; i < ARM_CPU_ID_MAX; i++) {
> +        if(id_regitsers[i].id != 0) {

Not sure why this check was here before, as there shouldn't have been
any zero ids in the list, but now we need the test, just not here.
The for loop should be written as

 for (i = 0; id_regitsers[i].id; i++) {

> +            ret = kvm_set_one_reg(cs, id_regitsers[i].id,
> +                                  (void *)id_regitsers[i].addr);
> +            if (ret) {
> +                fprintf(stderr, "set ID register 0x%llx failed\n",
> +                        id_regitsers[i].id);
> +                return ret;
> +            }
> +        } else {
> +            break;
> +        }
> +    }
> +
> +    /* TODO: Set CCSIDR */
> +    return ret;
> +}
>  
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
> @@ -489,6 +633,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      uint64_t mpidr;
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> +    bool heterogeneous = false, cross = false;
> +    struct kvm_vcpu_init init;
>  
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
> @@ -518,12 +664,48 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
>  
> +    /*
> +     * Check if host is a heterogeneous system. It doesn't support -cpu host on
> +     * heterogeneous system. If user requests a specific type VCPU, it should
> +     * set the KVM_ARM_VCPU_CROSS bit to tell KVM that userspace want a specific
> +     * vCPU. If KVM supports cross type vCPU, then set the ID registers.
> +     */
> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_HETEROGENEOUS)) {
> +        heterogeneous = true;
> +    }

I don't think it should be necessary for qemu to check this. It should
just fail to create vcpus if it chooses the wrong type. Anyway, there
should be other ways for qemu to determine it's running on a
heterogeneous system without extending kvm's api.

> +
> +    if (strcmp(object_get_typename(OBJECT(cpu)), TYPE_ARM_HOST_CPU) == 0) {
> +        if (heterogeneous) {
> +            fprintf(stderr, "heterogeneous system can't support host guest CPU type\n");
> +            return -EINVAL;
> +        }

IMO, we should leave this to higher levels. E.g. libvirt can determine if
a host is heterogeneous and then output errors when a user tries to
configure a guest to use cpu host. At the QEMU level an ioctl EINVAL on
vcpu create should be sufficient.

> +    } else if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_CROSS_VCPU)) {
> +        init.features[0] = 1 << KVM_ARM_VCPU_CROSS;

As I stated in the kvm series, I don't think this feature bit should be
necessary.

> +        if (kvm_vm_ioctl(cs->kvm_state, KVM_ARM_PREFERRED_TARGET, &init) < 0) {
> +            return -EINVAL;
> +        }
> +
> +        if (init.target != (cpu->midr & 0xFF00FFF0) || heterogeneous) {
> +            cpu->kvm_target = QEMU_KVM_ARM_TARGET_GENERIC_V8;

Why force the target to be generic when we're cross? Not being possible
to do anything else, and that that's what we agreed on in Toronto is a
fair answer :-) I just don't recall right now what we said.

> +            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_CROSS;
> +            cross = true;
> +       }
> +    }
> +
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
>      if (ret) {
>          return ret;
>      }
>  
> +    if (cross) {
> +        ret = kvm_arm_set_id_registers(cs);
> +        if (ret) {
> +            fprintf(stderr, "set vcpu ID registers failed\n");

You already have an fprintf(stderr, at the point of failure. We probably
don't need two, with this one having less information. I'd just return
ret here quietly.

> +            return ret;
> +        }
> +    }
> +
>      /*
>       * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>       * Currently KVM has its own idea about MPIDR assignment, so we
> -- 
> 2.0.4
> 
> 
>

Thanks,
drew 
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
