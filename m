Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp381566wrd;
        Mon, 20 Aug 2018 00:21:55 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwbcTvnzFB2vFb/vdRW2kxaK+uQa71WlcHMOhyljloVkJ8cbEl8Sjaw3NQ4PiUUZ92dOOh9
X-Received: by 2002:a0c:f101:: with SMTP id i1-v6mr40373206qvl.67.1534749715302;
        Mon, 20 Aug 2018 00:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534749715; cv=none;
        d=google.com; s=arc-20160816;
        b=n++FrT1dIPdCBpGqBJku9yz+PkcbMDQebD9JPbORLnreNaZJxHhZBiKxWVDq2mNUuL
         q14mVYMbYFsB8Tp2BmYNBuT5pBOqE0SUyaiuRbnIxecJS6nDu2tQn0ZlUKW74Y9cQztp
         UY+TXOjwZ0CNEQvgOPY9SmE79TeTqtPGNOHZEUD0hN1mmdUZ/rW8IvyddOvAXuLgnGoD
         x/vM3yv54ajEJHLEJp1Yq+7UKZY0IeyivdcrXT1ZTIvUebjEOdi1AJnSQGMJk4soiW9D
         SuQPNgOhk7pXHkIMY9KlelHXmNo0YnETMuoJTa0v5Q2hGzyXBw3ZoGOTNHbXMyVB2u6d
         m/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ug+keudDGrn22AJdZbQgpMm8K2aE0Z96bmOWDAWt40M=;
        b=08e2xzlPNUVH/jv986RjobygF716+sJYAxYTIyiAn9sXES2q5MuugkES/ZdjI+98az
         oC/WtXxu/4/GLpebPvnZEz6pmafsPrBrnp6Lh7StWxpppjlXj6wu70zplJyQlKoE+cQn
         /oyEn/UOAqD/J7N3Sh6YzB/fqZVZ+wy7tTxnWogccXa8KWohyp6ci4OYautR3mfMaXS2
         mBoSbMMjbs/if/RgA/R87M3Xc7K6o9DKPx3chgmxQVfDZjo2PvmFgR1zEEOFbbwiK/L1
         6qu7hyLDTstjYFEjWulEZDPkHWkpz4RUfLhNY99gW5hjBi6882TdBPoTgRlHuEXLVton
         43Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q28-v6si2699711qtq.186.2018.08.20.00.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 00:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1freVe-000637-Rl
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 03:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1freVQ-00060W-81
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 03:21:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1freVN-0005iK-3B
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 03:21:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2563 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1freVM-0005fh-BM; Mon, 20 Aug 2018 03:21:37 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 91A1ED15CC744;
	Mon, 20 Aug 2018 15:21:26 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.399.0; Mon, 20 Aug 2018
	15:21:18 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1532195863-23945-1-git-send-email-gengdongjiu@huawei.com>
	<1532195863-23945-4-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA8EssRi0WbcKNJK5RQ1KUWNNLb5xmFK2+E_bRwwhDBfBQ@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <d99648cd-db15-1dcc-d027-1dde1170edba@huawei.com>
Date: Mon, 20 Aug 2018 15:21:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8EssRi0WbcKNJK5RQ1KUWNNLb5xmFK2+E_bRwwhDBfBQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH v5 3/3] target: arm: Add support for VCPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5H6GNjrM0jo


On 2018/8/17 22:50, Peter Maydell wrote:
> On 21 July 2018 at 18:57, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> This patch extends the qemu-kvm state sync logic with support for
>> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
>> And also it can support the exception state migration.
> 
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> ---
>> change since v4:
>> 1. Rebase the code to latest
>>
>> change since v3:
>> 1. Add a new new subsection with a suitable 'ras_needed' function
>>    controlling whether it is present
>> 2. Add a ARM_FEATURE_RAS feature bit for CPUARMState
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> Hi; sorry it's taken me so long to get to this patchset.
> I think it's basically the right shape, but I have some
> changes to suggest below.

You are welcome, thanks for your time that give below  precious suggestion and review comments.

> 
>> ---
>>  target/arm/cpu.h     |  6 ++++++
>>  target/arm/kvm64.c   | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/machine.c | 22 ++++++++++++++++++++
>>  3 files changed, 87 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index e310ffc..f00f0b6 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -645,6 +645,11 @@ typedef struct CPUARMState {
>>      const struct arm_boot_info *boot_info;
>>      /* Store GICv3CPUState to access from this struct */
>>      void *gicv3state;
>> +    struct {
>> +        uint32_t pending;
>> +        uint32_t has_esr;
>> +        uint64_t esr;
>> +    } serror;
> 
> I recommend putting this earlier in the CPUARMState struct.
> Specifically, you want to put it somewhere before the
> "end_reset_fields" marker. All fields before that are cleared
> to zero on CPU reset. If you put the struct after that then
> you would need manual code in the cpu reset function to
> reset it appropriately.
Ok, I will move it to the right place. thanks for the pointing out.

> 
>>  } CPUARMState;
>>
>>  /**
>> @@ -1486,6 +1491,7 @@ enum arm_features {
>>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>>      ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
>>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>> +    ARM_FEATURE_RAS_EXT, /* has RAS Extension */
>>  };
>>
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>> index e0b8246..ebf7a00 100644
>> --- a/target/arm/kvm64.c
>> +++ b/target/arm/kvm64.c
>> @@ -527,6 +527,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>          unset_feature(&env->features, ARM_FEATURE_PMU);
>>      }
>>
>> +    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_INJECT_SERROR_ESR)) {
>> +        set_feature(&env->features, ARM_FEATURE_RAS_EXT);
>> +    }
> 
> I think this is confusing two things. Whether the host kernel
> has support for injecting SError ESRs is not the same as
> whether the guest CPU has the RAS extensions. So you don't want
> to use an ARM_FEATURE_* bit to track whether we need to migrate
> the SError ESR state.
> 
> Instead you should just use a bool variable local to this file
> to track whether the kernel has state we need to migrate.
> Compare the way we use "have_guest_debug" to track whether
> KVM_CAP_SET_GUEST_DEBUG is set. You can call this
> have_inject_serror_esr.

Ok, I will use your suggested method to do it in this file.

> 
>> +
>>      /* Do KVM_ARM_VCPU_INIT ioctl */
>>      ret = kvm_arm_vcpu_init(cs);
>>      if (ret) {
>> @@ -600,6 +604,50 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>>  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>>
>> +static int kvm_put_vcpu_events(ARMCPU *cpu)
>> +{
>> +    CPUARMState *env = &cpu->env;
>> +    struct kvm_vcpu_events events = {};
>> +
>> +    if (!kvm_has_vcpu_events()) {
>> +        return 0;
>> +    }
>> +
>> +    memset(&events, 0, sizeof(events));
>> +    events.exception.serror_pending = env->serror.pending;
>> +
>> +    if (arm_feature(env, ARM_FEATURE_RAS_EXT)) {
> 
> Here you can check have_inject_serror_esr.

Got it, will change it.

> 
>> +        events.exception.serror_has_esr = env->serror.has_esr;
>> +        events.exception.serror_esr = env->serror.esr;
>> +    }
>> +
>> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
>> +}
>> +
>> +static int kvm_get_vcpu_events(ARMCPU *cpu)
>> +{
>> +    CPUARMState *env = &cpu->env;
>> +    struct kvm_vcpu_events events;
>> +    int ret;
>> +
>> +    if (!kvm_has_vcpu_events()) {
>> +        return 0;
>> +    }
>> +
>> +    memset(&events, 0, sizeof(events));
>> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_VCPU_EVENTS, &events);
>> +
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    env->serror.pending = events.exception.serror_pending;
>> +    env->serror.has_esr = events.exception.serror_has_esr;
>> +    env->serror.esr = events.exception.serror_esr;
>> +
>> +    return 0;
>> +}
>> +
>>  int kvm_arch_put_registers(CPUState *cs, int level)
>>  {
>>      struct kvm_one_reg reg;
>> @@ -727,6 +775,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>>          return ret;
>>      }
>>
>> +    ret = kvm_put_vcpu_events(cpu);
>> +    if (ret) {
>> +        printf("return error kvm_put_vcpu_events: %d\n", ret);
> 
> Stray debug printf() left in?
I will remove this printf().

> 
>> +        return ret;
>> +    }
>> +
>>      if (!write_list_to_kvmstate(cpu, level)) {
>>          return EINVAL;
>>      }
>> @@ -863,6 +917,11 @@ int kvm_arch_get_registers(CPUState *cs)
>>      }
>>      vfp_set_fpcr(env, fpr);
>>
>> +    ret = kvm_get_vcpu_events(cpu);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>      if (!write_kvmstate_to_list(cpu)) {
>>          return EINVAL;
>>      }
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 2e28d08..ead8b2a 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -172,6 +172,27 @@ static const VMStateDescription vmstate_sve = {
>>  };
>>  #endif /* AARCH64 */
>>
>> +static bool ras_needed(void *opaque)
>> +{
>> +    ARMCPU *cpu = opaque;
>> +    CPUARMState *env = &cpu->env;
>> +
>> +    return arm_feature(env, ARM_FEATURE_RAS_EXT);
> 
> I think the best check to use here is
> "return env.serror.pending != 0". If no SError is
> pending then there's no new state to migrate.

Ok, it looks reasonable to check "return env.serror.pending != 0",
I will change it.

> 
> We should also call this VMState something other than
> "ras", because it doesn't contain RAS-specific data.
> "serror" will do (so "vmstate_serror", "cpu/serror", etc).

OK, I will rename it to "vmstate_serror" from vmstate_ras.

> 
>> +}
>> +
>> +static const VMStateDescription vmstate_ras = {
>> +    .name = "cpu/ras",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .needed = ras_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
>> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
>> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static bool m_needed(void *opaque)
>>  {
>>      ARMCPU *cpu = opaque;
>> @@ -723,6 +744,7 @@ const VMStateDescription vmstate_arm_cpu = {
>>  #ifdef TARGET_AARCH64
>>          &vmstate_sve,
>>  #endif
>> +        &vmstate_ras,
>>          NULL
>>      }
>>  };
> 
> thanks
> -- PMM
> 
> .
> 

