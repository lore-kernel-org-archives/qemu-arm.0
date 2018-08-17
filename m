Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp297324wrd;
        Fri, 17 Aug 2018 07:56:39 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzf9Xh0yQNGPNRb5qRRVRVJ3KbTZFTrS8GH6BU7dWsAYSqXQFWDSJcsM1cOb7L6DzO26Ir5
X-Received: by 2002:a37:642:: with SMTP id 63-v6mr1247092qkg.11.1534517799781;
        Fri, 17 Aug 2018 07:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534517799; cv=none;
        d=google.com; s=arc-20160816;
        b=vKTdIWtpGF02uGa4KFaVcXF4a+FLVzt0mfeygYxDCeItzcPJONXZZ5zhIrnLzgTi+h
         o5e3aMV1RwQbDmZk3yeZfR+m/PArpuEoSPn9w+6vCRq3UOZLOhMGHUJ7p4ZR6PtqkZbT
         gKZUqJPqLefEg4nFbGE4qpEtS//4Ka79Pg3am1KHXChx8T4AcAHzWR2FLMDHnzSsC6l5
         idTqgB70ryWwo8KKKibV7IzKRXEw124Zf7HR49qDeCHLfwPa+O3hJJJFv4Sm+ULSBiNb
         o3zDGWFObobq7B7mjTkemIbYlJgNG/AA0DYESdM6tzHsasFLnr62uGOTsJvMEOngVwjy
         obFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qz/KE1PRIkNK9ib/E3ZvLDi/NWRRHJUZp3fS3H2/A+U=;
        b=jxH7sWe3M458W0DRZjlszUZgnvDfvDXkr8+2i4Bca/sohdmvKR5+TTPnAMUgiiZs0u
         5aheZMRR4xKigMvGyXIm7H6HuyiWhh/orkApXkd0ffvU49ns4CPOO3PWAhw846GaB/d4
         FpqBil/bOqG18J890gFtlVyn12dQCUchDWSwZaR08ZjWMCDOL6JkTDutH/xDAKMNlIyP
         FQ5fGJvVY6O5VayJsy3K4bmw9Vdzp8uK88vhr5I7zVQsb95Dkv6vU/K4SpBk8R6vmtyp
         0QDIVMGamfbm8CIGtfjPe51TzzYQuXfIeRqeGSnTlr3Tq/3v5q+L2h0PPB/QWeLYKCKy
         XZJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbPyBEPP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q22-v6si2122872qte.344.2018.08.17.07.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 07:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbPyBEPP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqgB5-0000ey-8J
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 10:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqg5u-000372-1M
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqg5r-0005je-Ux
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:51:17 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39982)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqg5q-0005fO-N2
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 10:51:15 -0400
Received: by mail-oi0-x242.google.com with SMTP id w126-v6so14416847oie.7
	for <qemu-devel@nongnu.org>; Fri, 17 Aug 2018 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qz/KE1PRIkNK9ib/E3ZvLDi/NWRRHJUZp3fS3H2/A+U=;
	b=WbPyBEPPhvvUeNlB73eBG59TLV5/QxwLZb2y8flLKDmqHOQVIDSMPjONm2B2iBrKRh
	GSoBvdspQ0WvRSDtisd4oqXtys5VvFooGdWoCEoEiwJgRMak1CEd4f4PZ5ap3kUstyBC
	2DiLf0OIZ5pes95bjLipMSpP2L/uuH8zAdCI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qz/KE1PRIkNK9ib/E3ZvLDi/NWRRHJUZp3fS3H2/A+U=;
	b=Tbd4MFENIPwYDgmlowOEe5gTklJPv58P8VMR2/AvSbgoZRquQN+sigYJD/Ugo5wYqW
	19nMPoYQck93D6wh8+W8EEz59M3jA5SNCnyKQ27QJM+m24Dy4XIO/vZlFccydDS/gxxb
	/4D40Fc9YaTR8lJspNCAeMZEUKuYaxD7uzjno5mAum3AEeFSr8vtXphQ+KDUR7dEJ9ln
	MlyvRWHSTTY5n8eHULytSSNBCMGuZTQ3hoQv4dcxuFjKApkPAX41/GGrRT6YMrFpXcAT
	wDubvnYt92l9vlptJ4LGmH+Iamw9uwxKxxL53t0odkqB33gCeR7uB9nuU+s16Az81rgG
	GQwg==
X-Gm-Message-State: AOUpUlGzZNqV1/IIa7LFZJqhGxXn7NjqzNSX0heOuJVZRtQ1O8HiLaKI
	eqgOtAaI/R3rvOiIHuBqtK4gr9LVOZDzWyL+PjPGvg==
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr2865971oif.23.1534517471345; 
	Fri, 17 Aug 2018 07:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 17 Aug 2018 07:50:50
	-0700 (PDT)
In-Reply-To: <1532195863-23945-4-git-send-email-gengdongjiu@huawei.com>
References: <1532195863-23945-1-git-send-email-gengdongjiu@huawei.com>
	<1532195863-23945-4-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Aug 2018 15:50:50 +0100
Message-ID: <CAFEAcA8EssRi0WbcKNJK5RQ1KUWNNLb5xmFK2+E_bRwwhDBfBQ@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v5 3/3] target: arm: Add support for VCPU
 event states
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+deAW6IznCO

On 21 July 2018 at 18:57, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.

> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> change since v4:
> 1. Rebase the code to latest
>
> change since v3:
> 1. Add a new new subsection with a suitable 'ras_needed' function
>    controlling whether it is present
> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Hi; sorry it's taken me so long to get to this patchset.
I think it's basically the right shape, but I have some
changes to suggest below.

> ---
>  target/arm/cpu.h     |  6 ++++++
>  target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c | 22 ++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e310ffc..f00f0b6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -645,6 +645,11 @@ typedef struct CPUARMState {
>      const struct arm_boot_info *boot_info;
>      /* Store GICv3CPUState to access from this struct */
>      void *gicv3state;
> +    struct {
> +        uint32_t pending;
> +        uint32_t has_esr;
> +        uint64_t esr;
> +    } serror;

I recommend putting this earlier in the CPUARMState struct.
Specifically, you want to put it somewhere before the
"end_reset_fields" marker. All fields before that are cleared
to zero on CPU reset. If you put the struct after that then
you would need manual code in the cpu reset function to
reset it appropriately.

>  } CPUARMState;
>
>  /**
> @@ -1486,6 +1491,7 @@ enum arm_features {
>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>      ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> +    ARM_FEATURE_RAS_EXT, /* has RAS Extension */
>  };
>
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e0b8246..ebf7a00 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -527,6 +527,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
>
> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR)) {
> +        set_feature(&env->features, ARM_FEATURE_RAS_EXT);
> +    }

I think this is confusing two things. Whether the host kernel
has support for injecting SError ESRs is not the same as
whether the guest CPU has the RAS extensions. So you don't want
to use an ARM_FEATURE_* bit to track whether we need to migrate
the SError ESR state.

Instead you should just use a bool variable local to this file
to track whether the kernel has state we need to migrate.
Compare the way we use "have_guest_debug" to track whether
KVM_CAP_SET_GUEST_DEBUG is set. You can call this
have_inject_serror_esr.

> +
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
>      if (ret) {
> @@ -600,6 +604,50 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>
> +static int kvm_put_vcpu_events(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_vcpu_events events = {};
> +
> +    if (!kvm_has_vcpu_events()) {
> +        return 0;
> +    }
> +
> +    memset(&events, 0, sizeof(events));
> +    events.exception.serror_pending = env->serror.pending;
> +
> +    if (arm_feature(env, ARM_FEATURE_RAS_EXT)) {

Here you can check have_inject_serror_esr.

> +        events.exception.serror_has_esr = env->serror.has_esr;
> +        events.exception.serror_esr = env->serror.esr;
> +    }
> +
> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
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
> +    if (ret < 0) {
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
> @@ -727,6 +775,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          return ret;
>      }
>
> +    ret = kvm_put_vcpu_events(cpu);
> +    if (ret) {
> +        printf("return error kvm_put_vcpu_events: %d\n", ret);

Stray debug printf() left in?

> +        return ret;
> +    }
> +
>      if (!write_list_to_kvmstate(cpu, level)) {
>          return EINVAL;
>      }
> @@ -863,6 +917,11 @@ int kvm_arch_get_registers(CPUState *cs)
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
> index 2e28d08..ead8b2a 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
>  };
>  #endif /* AARCH64 */
>
> +static bool ras_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    return arm_feature(env, ARM_FEATURE_RAS_EXT);

I think the best check to use here is
"return env.serror.pending != 0". If no SError is
pending then there's no new state to migrate.

We should also call this VMState something other than
"ras", because it doesn't contain RAS-specific data.
"serror" will do (so "vmstate_serror", "cpu/serror", etc).

> +}
> +
> +static const VMStateDescription vmstate_ras = {
> +    .name = "cpu/ras",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = ras_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static bool m_needed(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -723,6 +744,7 @@ const VMStateDescription vmstate_arm_cpu = {
>  #ifdef TARGET_AARCH64
>          &vmstate_sve,
>  #endif
> +        &vmstate_ras,
>          NULL
>      }
>  };

thanks
-- PMM
