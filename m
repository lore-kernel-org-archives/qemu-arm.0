Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3108721lfb;
        Sun, 12 Sep 2021 13:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9DDKShCuU7euIdCf5VwtV2kO5tgsozat+MILQ5DshHBhEofKP+YbAj+9F/xrMHZlH1Z8R
X-Received: by 2002:a6b:8d8a:: with SMTP id p132mr6056360iod.81.1631479043745;
        Sun, 12 Sep 2021 13:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631479043; cv=none;
        d=google.com; s=arc-20160816;
        b=WWscM6pULaVvSgHmP29j8oN263XaPl+ej8EP7wkt9yPhip0AskHTM5sJ+FE+N3wniG
         WBuImbGsyXZq1EpgKSgr/LW/OMvn8A6ddywZ2c2OGndwzbNSn7XQ5G5wnG3KuMo+jCqa
         pQVMCuMjQKr9goB54wbxu1PAAthfyTn578Z/7g4sTNC42I4Q4CNTIFzJJDIxeMHbRxmX
         D9z8uLZRKwN7L2bPSC8jrkpmSQlT75xWDkKJQdeBa8/Iwo9UwXdHwKTdKNwRB9iCZtP5
         QXnyWCacWwvV/xyv4dCA1AB5WSaqMrbzMr5Z371ZJmwBBmml7S2RssOBdCoUE5+1N4G1
         Q0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=klL7b0xLMfAR+1YO3LpKK00ow7Y3CX7ZmtnMYbKNKcA=;
        b=Ak1qi1e4WtLe7iZFxU4NYIg5zPEJZ0F2D0zVAfJJV2lBA1NVBKLKtIi2qKwv19Kseh
         79WeZwI5tCE3GgdeAFCIse2Tl6U9ny997KS94Qtu6ZpY29wXLo5wyfGD77fT4MkhO++4
         4bbBc5OYKZ5jeYVSvujg7m0mKL2xZZCLqP4GCU7leDP8WJpBOYCbO7GiPUSvYUUPac1r
         IyygN0Jhim3jwBWcAcI7h1uSZpTf6sva4RMs204eEp9cpF23YzAhnbqLZXfr4KOlUbjQ
         crf35A2pf5ycjIjIGiAZf5APKb0L1jGh1PLkfhDNb5m2vlpMGdHTLHRPLcCWVucuv8Ah
         jheg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si5606654iov.71.2021.09.12.13.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 13:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPWE7-0008F8-2J
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 16:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPWDo-0008Au-Ae; Sun, 12 Sep 2021 16:37:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43414 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPWDm-00049J-9v; Sun, 12 Sep 2021 16:37:04 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 20309608037D;
 Sun, 12 Sep 2021 22:36:59 +0200 (CEST)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
Date: Sun, 12 Sep 2021 22:36:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iIIOa3ZJRQkh


On 15.06.21 14:54, Peter Maydell wrote:
> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>> We need to handle PSCI calls. Most of the TCG code works for us,
>> but we can simplify it to only handle aa64 mode and we need to
>> handle SUSPEND differently.
>>
>> This patch takes the TCG code as template and duplicates it in HVF.
>>
>> To tell the guest that we support PSCI 0.2 now, update the check in
>> arm_cpu_initfn() as well.
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>
>> ---
>>
>> v6 -> v7:
>>
>>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>>
>> v7 -> v8:
>>
>>   - Do not advance for HVC, PC is already updated by hvf
>>   - Fix checkpatch error
>
>> +static int /(ARMCPU *arm_cpu)
>> +{
>> +    int32_t ret = 0;
>> +    ret = arm_set_cpu_off(arm_cpu->mp_affinity);
>> +    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
>> +
>> +    return 0;
> If you're always returning 0 you might as well just make
> it return void.
>
>> +}
>> +
>> +static int hvf_handle_psci_call(CPUState *cpu)
> I think the callsites would be clearer if you made the function
> return true for "PSCI call handled", false for "not recognised,
> give the guest an UNDEF". Code like
>          if (hvf_handle_psci_call(cpu)) {
>              stuff;
>          }
>
> looks like the 'stuff' is for the "psci call handled" case,
> which at the moment it isn't.


This function merely follows standard C semantics along the lines of "0
means success, !0 is error". Isn't that what you would usually expect?


>
> Either way, a comment for this function describing what its
> return value semantics are would be useful.


Sure, I can add one :)


>
>> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
>> +    CPUARMState *env = &arm_cpu->env;
>> +    uint64_t param[4] = {
>> +        env->xregs[0],
>> +        env->xregs[1],
>> +        env->xregs[2],
>> +        env->xregs[3]
>> +    };
>> +    uint64_t context_id, mpidr;
>> +    bool target_aarch64 = true;
>> +    CPUState *target_cpu_state;
>> +    ARMCPU *target_cpu;
>> +    target_ulong entry;
>> +    int target_el = 1;
>> +    int32_t ret = 0;
>> +
>> +    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
>> +                        arm_cpu->mp_affinity);
>> +
>> +    switch (param[0]) {
>> +    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
>> +        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
>> +        break;
>> +    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
>> +        ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
>> +        break;
>> +    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
>> +    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
>> +        mpidr = param[1];
>> +
>> +        switch (param[2]) {
>> +        case 0:
>> +            target_cpu_state = arm_get_cpu_by_id(mpidr);
>> +            if (!target_cpu_state) {
>> +                ret = QEMU_PSCI_RET_INVALID_PARAMS;
>> +                break;
>> +            }
>> +            target_cpu = ARM_CPU(target_cpu_state);
>> +
>> +            ret = target_cpu->power_state;
>> +            break;
>> +        default:
>> +            /* Everything above affinity level 0 is always on. */
>> +            ret = 0;
>> +        }
>> +        break;
>> +    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
>> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> +        /* QEMU reset and shutdown are async requests, but PSCI
>> +         * mandates that we never return from the reset/shutdown
>> +         * call, so power the CPU off now so it doesn't execute
>> +         * anything further.
>> +         */
>> +        return hvf_psci_cpu_off(arm_cpu);
>> +    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
>> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> +        return hvf_psci_cpu_off(arm_cpu);
>> +    case QEMU_PSCI_0_1_FN_CPU_ON:
>> +    case QEMU_PSCI_0_2_FN_CPU_ON:
>> +    case QEMU_PSCI_0_2_FN64_CPU_ON:
>> +        mpidr = param[1];
>> +        entry = param[2];
>> +        context_id = param[3];
>> +        ret = arm_set_cpu_on(mpidr, entry, context_id,
>> +                             target_el, target_aarch64);
>> +        break;
>> +    case QEMU_PSCI_0_1_FN_CPU_OFF:
>> +    case QEMU_PSCI_0_2_FN_CPU_OFF:
>> +        return hvf_psci_cpu_off(arm_cpu);
>> +    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
>> +    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
>> +    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
>> +        /* Affinity levels are not supported in QEMU */
>> +        if (param[1] & 0xfffe0000) {
>> +            ret = QEMU_PSCI_RET_INVALID_PARAMS;
>> +            break;
>> +        }
>> +        /* Powerdown is not supported, we always go into WFI */
>> +        env->xregs[0] = 0;
>> +        hvf_wfi(cpu);
>> +        break;
>> +    case QEMU_PSCI_0_1_FN_MIGRATE:
>> +    case QEMU_PSCI_0_2_FN_MIGRATE:
>> +        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
>> +        break;
>> +    default:
>> +        return 1;
>> +    }
>> +
>> +    env->xregs[0] = ret;
>> +    return 0;
>> +}
>> +
>>  static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>>  {
>>      ARMCPU *arm_cpu = ARM_CPU(cpu);
>> @@ -716,6 +823,8 @@ int hvf_vcpu_exec(CPUState *cpu)
>>      }
>>
>>      if (cpu->halted) {
>> +        /* On unhalt, we usually have CPU state changes. Prepare for them. */
>> +        cpu_synchronize_state(cpu);
>>          return EXCP_HLT;
>>      }
> This seems odd. If I understand the control flow correctly, this
> is neither:
>  (a) just before we're about to emulate a PSCI call so we need
> the current values of the registers from hvf
>  (b) when we've just changed the CPU registers because we made
> a PSCI call and we want to push them back to hvf
>  (c) when we're about to resume the CPU because it's gone from
> halted to not-halted, which might also be a good time to push
> register state back to hvf
>
> So what's it for ?


I agree, it's pretty superfluous. I'll remove it :)

Alex


>
> My expectation would be that we would ensure the state is in sync
> (ie that hvf has any local changes) before we call hv_cpu_run(),
> and that we would go the other way before we access any local
> register CPU struct state.
>
> thanks
> -- PMM
