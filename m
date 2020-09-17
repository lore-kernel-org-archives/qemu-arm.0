Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp575156lfq;
        Thu, 17 Sep 2020 06:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp7Zg5Obs99P1Ul02vCvwrgZZn+Zt0SRxXBbWAlbn22l0YuAjvjIyOu0tnf89i7Ydk/Zd2
X-Received: by 2002:a25:3cc3:: with SMTP id j186mr39402104yba.208.1600348802605;
        Thu, 17 Sep 2020 06:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600348802; cv=none;
        d=google.com; s=arc-20160816;
        b=BAoUNscYZfQcFRJ8E4VgAPpuKsEBTTA75VWE1jp5G7ldCzkXcWISMxypshg7DPlNmn
         mFtIsLulgkTroY/gdf0aCwROtMdRL7tjNBNek26RGWPXrMAdYT5jfjXn/0vN2QrrdvUE
         N5s9PxZ8p7K2oXoP1MahVdjOLx9vStyN4VvsGvx7FyDuOuBo6NUp7MIfLAyPDUEMBFCl
         suQoV2ahhjRW3GLw/dItnvANmz/frAN0xi1CnRB8Ly8K7f8UlzhLKLyNIvPuvYcqBxBz
         OMKW2DMaQSMdJcbPbZoCpccSz/t+kNX4ztooj4A/ufxJ/FF1qZu0JvdY81K8sW+SBPYw
         31MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=rmvYIdyW7n4dirSP4kK27mTVhg/p9ZxKNq41oLU1RQk=;
        b=U02+EEemIT6fHJa2ALrge7tcUwZ10cmA+K5iWmjpwC0UkiZNSGkiQosFFArGurEeCU
         Eb1FBrfezRrzttCmYwI7N0wkdHvrFJtjUmP27r+au8mNGMD3PF1msgSPZTXa58Tj/gsz
         XcRf4535TWnMpji8UTPn/nGuLohqQM+aWM+N3afFlEsGBe21Yj7jvpB0a8DOLVXgyX1q
         XoVTWs90NKjy45mvsna6c/gTP44VHWnVtpgySSk8kOjFGe7/iyVBV+6YMH3KDscd3obk
         DlrTggP9ifgGfpXAo3vAke3dpr1ILYOurRFVg9TJ7gSRqJaU3jAbmcOl2kq9y8OTj8uy
         jtng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x143si20599131ybg.118.2020.09.17.06.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kItpS-0000oS-0J
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kItpH-0000nz-1r; Thu, 17 Sep 2020 09:19:51 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48688 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kItpD-0002m6-MV; Thu, 17 Sep 2020 09:19:50 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 06915FA146B0A7C90AC9;
 Thu, 17 Sep 2020 21:19:41 +0800 (CST)
Received: from [10.174.185.104] (10.174.185.104) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 21:19:34 +0800
Subject: Re: [RFC PATCH 02/12] target/arm/kvm64: make MPIDR consistent with
 CPU Topology
To: Andrew Jones <drjones@redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-3-fangying1@huawei.com>
 <20200917075330.7sx3xm7gd4mwqqtq@kamzik.brq.redhat.com>
 <20200917105934.3rki6xwv5t4glxxi@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <a6c1ab83-0853-30c2-089c-8e2a667cbdad@huawei.com>
Date: Thu, 17 Sep 2020 21:19:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200917105934.3rki6xwv5t4glxxi@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6uezPDiY6JWe



On 9/17/2020 6:59 PM, Andrew Jones wrote:
> On Thu, Sep 17, 2020 at 09:53:35AM +0200, Andrew Jones wrote:
>> On Thu, Sep 17, 2020 at 11:20:23AM +0800, Ying Fang wrote:
>>> MPIDR helps to provide an additional PE identification in a multiprocessor
>>> system. This patch adds support for setting MPIDR from userspace, so that
>>> MPIDR is consistent with CPU topology configured.
>>>
>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>> ---
>>>   target/arm/kvm64.c | 46 ++++++++++++++++++++++++++++++++++++++--------
>>>   1 file changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
>>> index ef1e960285..fcce261a10 100644
>>> --- a/target/arm/kvm64.c
>>> +++ b/target/arm/kvm64.c
>>> @@ -757,10 +757,46 @@ static int kvm_arm_sve_set_vls(CPUState *cs)
>>>   
>>>   #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>>>   
>>> +static int kvm_arm_set_mp_affinity(CPUState *cs)
>>> +{
>>> +    uint64_t mpidr;
>>> +    ARMCPU *cpu = ARM_CPU(cs);
>>> +
>>> +    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_MP_AFFINITY)) {
>>> +        /* Make MPIDR consistent with CPU topology */
>>> +        MachineState *ms = MACHINE(qdev_get_machine());
>>> +
>>> +        mpidr = (kvm_arch_vcpu_id(cs) % ms->smp.threads) << ARM_AFF0_SHIFT;
>>
>> We should query KVM first to determine if it wants guests to see their PEs
>> as threads or not. If not, and ms->smp.threads is > 1, then that's an
>> error. And, in any case, if ms->smp.threads == 1, then we shouldn't waste
>> aff0 on it, as that could reduce IPI broadcast performance.
>>
>>> +        mpidr |= ((kvm_arch_vcpu_id(cs) / ms->smp.threads % ms->smp.cores)
>>> +                                    & 0xff) << ARM_AFF1_SHIFT;
>>> +        mpidr |= (kvm_arch_vcpu_id(cs) / (ms->smp.cores * ms->smp.threads)
>>> +                                    & 0xff) << ARM_AFF2_SHIFT;
> 
> Also, as pointed out in the KVM thread, we should not be attempting to
> describe topology with the MPIDR at all. Alexandru pointed out [*] as
> evidence for that.
> 
> However, we do need to consider the limits on Aff0 imposed by the GIC.
> See hw/arm/virt.c:virt_cpu_mp_affinity() for how we currently do it
> for TCG. We should do something similar for KVM guests when we're taking
> full control of the MPIDR.
> 
> [*] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=3102bc0e6ac7
> 
> Thanks,
> drew

Thanks for your information on MPIDR. As described in [*], MPIDR cannot
be trusted as the actual topology. After applying:
arm64: topology: Stop using MPIDR for topology information

Can we just use topology information from ACPI or fdt as topology and 
ignore MPIDR ?

> 
>>> +
>>> +        /* Override mp affinity when KVM is in use */
>>> +        cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>> +
>>> +        /* Bit 31 is RES1 indicates the ARMv7 Multiprocessing Extensions */
>>> +        mpidr |= (1ULL << 31);
>>> +        return kvm_vcpu_ioctl(cs, KVM_ARM_SET_MP_AFFINITY, &mpidr);
>>> +    } else {
>>> +        /*
>>> +         * When KVM_CAP_ARM_MP_AFFINITY is not supported, it means KVM has its
>>> +         * own idea about MPIDR assignment, so we override our defaults with
>>> +         * what we get from KVM.
>>> +         */
>>> +        int ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
>>> +        if (ret) {
>>> +            error_report("failed to set MPIDR");
>>
>> We don't need this error, kvm_get_one_reg() has trace support already.
>> Anyway, the wording is wrong since it says 'set' instead of 'get'.
>>
>>> +            return ret;
>>> +        }
>>> +        cpu->mp_affinity = mpidr & ARM32_AFFINITY_MASK;
>>> +        return ret;
>>> +    }
>>> +}
>>> +
>>>   int kvm_arch_init_vcpu(CPUState *cs)
>>>   {
>>>       int ret;
>>> -    uint64_t mpidr;
>>>       ARMCPU *cpu = ARM_CPU(cs);
>>>       CPUARMState *env = &cpu->env;
>>>   
>>> @@ -814,16 +850,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>>           }
>>>       }
>>>   
>>> -    /*
>>> -     * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>>> -     * Currently KVM has its own idea about MPIDR assignment, so we
>>> -     * override our defaults with what we get from KVM.
>>> -     */
>>> -    ret = kvm_get_one_reg(cs, ARM64_SYS_REG(ARM_CPU_ID_MPIDR), &mpidr);
>>> +    ret = kvm_arm_set_mp_affinity(cs);
>>>       if (ret) {
>>>           return ret;
>>>       }
>>> -    cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>>>   
>>>       kvm_arm_init_debug(cs);
>>>   
>>> -- 
>>> 2.23.0
>>>
>>>
>>
>> Thanks,
>> drew
> 
> .
> 
