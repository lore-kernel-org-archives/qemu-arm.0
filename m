Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2923452lff;
        Tue, 15 Jun 2021 05:55:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKpCiK4mBEIdFIO44LnJtOUHHYODo5ww/mFkfzID4phQejIWqiFUNvDK8r0T9EFVgEQvTj
X-Received: by 2002:ab0:8e:: with SMTP id 14mr5888712uaj.103.1623761721925;
        Tue, 15 Jun 2021 05:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623761721; cv=none;
        d=google.com; s=arc-20160816;
        b=uAGZAM+y3rz/GZoZXHSJp9g7XCLbC6njR57L5fFiPwIvspBZEc3gD1XKo0mx4dWj/3
         a/OVrIPVADHSNJk94CGu6+vEht1+tra/mXspjOR2bfI7nYCPrl4YRPjjFr+JcgJMUCqt
         om/HZYNK78CAVb4L59UeZAxwgNfuDHTZIp90Z95JQ0BYj+I60uL8W1EpYLcFlA0FIMPa
         hzeL7AlGwg1BPBkZvPZ2E/88ulxcmikyNUbHtsjAjPU5ukOpJoNMf5LYU362mWFJRNjI
         Eqa8+bWCWtifTs83VgnrlVB5vp4rTrmLiCNxiJvL6nVLqVVCQ3kwRCK7saH+gI9vHpze
         NiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SttRVsuOeUIrqIsH1LMx9Q9SZS1d06FixTeiaKxCb38=;
        b=xwSWasLKktBulzqYA9D6goDJsvZjFwiJs+CN80Ih63vAW1UAdke1XEVeUS5JNjXFZg
         6DTIjQazS12x8bxHGs9noHZCi9ftWXlnHmouTgeh73pj0yD2S9jZEzPCQZlQ2RpoGVdu
         Oy6C6Sh3ltEKrn/ruPCqVzBfsqKic9k0Myzq8pLL0j4XazGSO8rAp4OXl4jPx6YJuUt7
         SOxpPZ8draAnEsWgAETGLio7ge3HWAEimJ4VDTujYrvZg3eDRO2sOnp1ZHyTRqay4Nw0
         xnSGs5gRRNfnHKkGXL+VMBmE+cfUTLnPhlvBpzeFl4c9rZrmTjHPK+h46pqQingts0kY
         0BhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAvTbnDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si7475845uav.218.2021.06.15.05.55.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 05:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fAvTbnDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt8bB-00005S-60
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 08:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8ax-00005K-EZ
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 08:55:07 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt8ar-0000Zh-VD
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 08:55:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id he7so22189189ejc.13
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SttRVsuOeUIrqIsH1LMx9Q9SZS1d06FixTeiaKxCb38=;
 b=fAvTbnDFYmvpbUGPAipzB3ggWQCU4zWiRl/+799+7zcP4mcGjvtGZgiShgQv7Muea4
 xpwFZey8ha3NtRqn4tngpmY+YgdQqTMet9wRe10uE45tMRAsBVk5wXQrMtFILeO+yuiw
 nxTItGFBYqcHRthf85/jtA0RVxjhuJDOm1dPM0NeADZLHibTOpuLTZb8CjMEbLk8GsKu
 xFuZ9bgMeBMU2+SCZPyz1Vw13oJpgXqIQfW72bC12JRhDtRFNEb/pYJVj7px9UYi9u0V
 wO8or/lBhe9fsRGPOnolL8KDsVTOGkfWGjbakOJo+RMhKdiAWCEBJ9zJIQQzGyPIFgI+
 Rk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SttRVsuOeUIrqIsH1LMx9Q9SZS1d06FixTeiaKxCb38=;
 b=s7wsG4jqPa6JogxwWmhIv60RTCQYS3/pw5m5K9hqrsdMSKINz98Gs4LjB42HyXqrZD
 h+KiP3klQO8NPiNB7Vd8kFiDEsk0ZKoBoqg+EDnll2Som3Avo6Vclroa56Kw2ywIlKSN
 UHfH4L2stPuswS7e3YcuQcjKCpzbSY+GWvVuVEJIPoyO9tSeHm5PS0UUBBo4tbQtGOy0
 vIQeITznakCV/0WLlppBPMGwANonVwNy9cz1c4YuTPNcjUABXmofkNFvtaBrivpwAGsg
 LdTvWF72IMrzOzLpURZksdYsnkdAFOl368MDqxB/itlpPBLgYGCXQ2cA38CgAauLUG04
 kVyA==
X-Gm-Message-State: AOAM533uh9t0D1d2UyC/6lNUbIBYxK38zdOjedlOHY5g8Sh9z/yXHeNj
 5mvUmBqMIMLerC4jwhUEGG1EHKBSs5wEzGebVo2NVA==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr20275465ejz.382.1623761700319; 
 Tue, 15 Jun 2021 05:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-17-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 13:54:25 +0100
Message-ID: <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mnl3DoAQRmtD

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> We need to handle PSCI calls. Most of the TCG code works for us,
> but we can simplify it to only handle aa64 mode and we need to
> handle SUSPEND differently.
>
> This patch takes the TCG code as template and duplicates it in HVF.
>
> To tell the guest that we support PSCI 0.2 now, update the check in
> arm_cpu_initfn() as well.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v6 -> v7:
>
>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>
> v7 -> v8:
>
>   - Do not advance for HVC, PC is already updated by hvf
>   - Fix checkpatch error


> +static int hvf_psci_cpu_off(ARMCPU *arm_cpu)
> +{
> +    int32_t ret = 0;
> +    ret = arm_set_cpu_off(arm_cpu->mp_affinity);
> +    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
> +
> +    return 0;

If you're always returning 0 you might as well just make
it return void.

> +}
> +
> +static int hvf_handle_psci_call(CPUState *cpu)

I think the callsites would be clearer if you made the function
return true for "PSCI call handled", false for "not recognised,
give the guest an UNDEF". Code like
         if (hvf_handle_psci_call(cpu)) {
             stuff;
         }

looks like the 'stuff' is for the "psci call handled" case,
which at the moment it isn't.

Either way, a comment for this function describing what its
return value semantics are would be useful.

> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    uint64_t param[4] = {
> +        env->xregs[0],
> +        env->xregs[1],
> +        env->xregs[2],
> +        env->xregs[3]
> +    };
> +    uint64_t context_id, mpidr;
> +    bool target_aarch64 = true;
> +    CPUState *target_cpu_state;
> +    ARMCPU *target_cpu;
> +    target_ulong entry;
> +    int target_el = 1;
> +    int32_t ret = 0;
> +
> +    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
> +                        arm_cpu->mp_affinity);
> +
> +    switch (param[0]) {
> +    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
> +        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
> +        break;
> +    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
> +        ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
> +        break;
> +    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
> +    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
> +        mpidr = param[1];
> +
> +        switch (param[2]) {
> +        case 0:
> +            target_cpu_state = arm_get_cpu_by_id(mpidr);
> +            if (!target_cpu_state) {
> +                ret = QEMU_PSCI_RET_INVALID_PARAMS;
> +                break;
> +            }
> +            target_cpu = ARM_CPU(target_cpu_state);
> +
> +            ret = target_cpu->power_state;
> +            break;
> +        default:
> +            /* Everything above affinity level 0 is always on. */
> +            ret = 0;
> +        }
> +        break;
> +    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        /* QEMU reset and shutdown are async requests, but PSCI
> +         * mandates that we never return from the reset/shutdown
> +         * call, so power the CPU off now so it doesn't execute
> +         * anything further.
> +         */
> +        return hvf_psci_cpu_off(arm_cpu);
> +    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        return hvf_psci_cpu_off(arm_cpu);
> +    case QEMU_PSCI_0_1_FN_CPU_ON:
> +    case QEMU_PSCI_0_2_FN_CPU_ON:
> +    case QEMU_PSCI_0_2_FN64_CPU_ON:
> +        mpidr = param[1];
> +        entry = param[2];
> +        context_id = param[3];
> +        ret = arm_set_cpu_on(mpidr, entry, context_id,
> +                             target_el, target_aarch64);
> +        break;
> +    case QEMU_PSCI_0_1_FN_CPU_OFF:
> +    case QEMU_PSCI_0_2_FN_CPU_OFF:
> +        return hvf_psci_cpu_off(arm_cpu);
> +    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
> +    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
> +    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
> +        /* Affinity levels are not supported in QEMU */
> +        if (param[1] & 0xfffe0000) {
> +            ret = QEMU_PSCI_RET_INVALID_PARAMS;
> +            break;
> +        }
> +        /* Powerdown is not supported, we always go into WFI */
> +        env->xregs[0] = 0;
> +        hvf_wfi(cpu);
> +        break;
> +    case QEMU_PSCI_0_1_FN_MIGRATE:
> +    case QEMU_PSCI_0_2_FN_MIGRATE:
> +        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
> +        break;
> +    default:
> +        return 1;
> +    }
> +
> +    env->xregs[0] = ret;
> +    return 0;
> +}
> +
>  static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
> @@ -716,6 +823,8 @@ int hvf_vcpu_exec(CPUState *cpu)
>      }
>
>      if (cpu->halted) {
> +        /* On unhalt, we usually have CPU state changes. Prepare for them. */
> +        cpu_synchronize_state(cpu);
>          return EXCP_HLT;
>      }

This seems odd. If I understand the control flow correctly, this
is neither:
 (a) just before we're about to emulate a PSCI call so we need
the current values of the registers from hvf
 (b) when we've just changed the CPU registers because we made
a PSCI call and we want to push them back to hvf
 (c) when we're about to resume the CPU because it's gone from
halted to not-halted, which might also be a good time to push
register state back to hvf

So what's it for ?

My expectation would be that we would ensure the state is in sync
(ie that hvf has any local changes) before we call hv_cpu_run(),
and that we would go the other way before we access any local
register CPU struct state.

thanks
-- PMM
