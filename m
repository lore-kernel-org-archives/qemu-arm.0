Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2804987lff;
        Tue, 15 Jun 2021 03:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy7xH3O0xazj4gZZEDeg5rNjKIezx0kHNFPBZ2xpUuwh5o2BqzJS2U+k3myhWyFHj32HzG
X-Received: by 2002:a67:f69a:: with SMTP id n26mr3803891vso.26.1623752562720;
        Tue, 15 Jun 2021 03:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623752562; cv=none;
        d=google.com; s=arc-20160816;
        b=BeKm9Y8N55QxYu67phkq5+T8Mpi7XEdaTq9HnTGDtj6EQ5cEpz5RHuPeAnS0zOfDK3
         5mnzulr3yyWkQvv/uhw1IF8ggpmuIQoMdDKoxul+JqOkZp2upW0f1PyQ2d92G9WdkZAC
         va2fe/y0AtzmtfLAKEweK9A06RHRCsIskW89YFm4d/8gf1Fi3ONGXGgZ3L0zh4STkFnu
         x8yAe06bluCKb3Qm+c99CpvbZjqvMrRwPHd1W19JyLY4ZB00Hsm/grlvGvuK1+v7uMc2
         U4dDuZN4cl0ge/cYLgaJ6u0ZTnXfpD/loVWtvsJdu0dLXtFDTMtc/14YFYR71UFEV7Ac
         XNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9azD7iTlX04ScARs1Si5lnLC62HE78SxPt9JKnk/ps8=;
        b=vtE4acZUqc/EQjtRubKCWCcnoKw/MPxY4uFDQxmP/OcxMohfLBUgzq2xrLFU/CPZd1
         GFbc4/nSwULW1V0eJyq07rGRMZ2/D7hV51kkY0ppHAWeEYEngjGgfp7plcr8jV6ZoFtI
         ywMAI2rwvEE1YfjD2jARExohHHen2TzdqzXO4UG8Ixtk5Rea7XNuF2lP2nEFIa696Q20
         yCbBJmJA/ke/CWS5dqhKVmIcKsVow85T9z0z1gz3FbdcdGZn20JhTAGBxUdac5X9ZHxb
         LxR4NmtW0BQ/IO+3oKGmcXAhEvqQT5ODmxUmse7VjZuVR4jMr7l1hETzZWheT/2wGr3H
         Izkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cP1EN7je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si5494712vsk.153.2021.06.15.03.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 03:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cP1EN7je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt6DR-0007Nv-V5
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 06:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6DG-0007KV-J9
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:22:30 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6DD-00033a-Tb
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 06:22:30 -0400
Received: by mail-ej1-x632.google.com with SMTP id og14so21708816ejc.5
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9azD7iTlX04ScARs1Si5lnLC62HE78SxPt9JKnk/ps8=;
 b=cP1EN7je0CzRNq4jLRNEoIhoVO5gc4pywaWkHI0BoiePnmRlpLuvUdh+zLbCAa71da
 VyWg2EUVN+uFs3ltKzl9T48ST8d3FNjMOUdkDACCdCVhYw5Bx8FzpxEOgDunfRUVtz0I
 ICbSEW42iZ00VhV67uD6Pe9wV2cR6qpsbPvRkPDelbT6WNvmXet5+x0SVtstqYBTqa0k
 0CUvmF9KxNM6lUIKy+AJQUPSh5fDZCpX/3rxHybDbpadlJ4arlE++RO+abuFcADXr/86
 6TPrLDwEQHoToCMU8jQOOORXno15+G8TiyIQX8D+CtCdVg6XRxTYAOwn36/bqMeNEd0K
 efGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9azD7iTlX04ScARs1Si5lnLC62HE78SxPt9JKnk/ps8=;
 b=TM3t14JQw35eq1HFyAy2C6MipT6vOdGIA/K0nHLoRvZBLVOCzEvdRn2NikXXn+cAB+
 Bw/HxamomfduNSSSLffJZ+VMRjzLeQgievmBLBCnrFkte9j57kL7a15xrhEwDRlA7NYw
 +U3cFWJpW5z2rub5jBoq+Vqb3XGn+NmPs8SRHfZFFRwaQr4etOBPYdX7ocEh6Txda2WD
 D/VWPzUccRpLjRa5DQjAoMZFI1y6aC1mjBIP4kZSygzJ8PcKCB2HpTSuZX8PjaRYP8VT
 BCvdsvf9S5ttYmQaCKV2yNpAl5GcLFHrhf8kTzTxV93OJ4AmG+00CEuyua8L8r4lYhci
 RyFA==
X-Gm-Message-State: AOAM532g6gh4ff/ATVQBqTLDLnHUvfpx6CBAV+2TeH2GbHLc4Jc9974l
 Rg4w7nb6aFyOldymavDxr3/0PQXPICx05bc4/6sddPMcIoQ=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr20366348ejb.56.1623752546326; 
 Tue, 15 Jun 2021 03:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-14-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-14-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:21:51 +0100
Message-ID: <CAFEAcA_M6SB8f4X1z=P4+pZ0Q-H3vdhvgu8ZsQLxZFro5TuiVQ@mail.gmail.com>
Subject: Re: [PATCH v8 13/19] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dYxxTu94Scat

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
>
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
>
> Known limitations:
>
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> @@ -446,11 +454,17 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
>                         cpu, QEMU_THREAD_JOINABLE);
>  }
>
> +__attribute__((weak)) void hvf_kick_vcpu_thread(CPUState *cpu)
> +{
> +    cpus_kick_thread(cpu);
> +}

Why is this marked 'weak' ? If there's a reason for it then
it ought to have a comment describing the reason. If we can avoid
it then we should do so -- past experience is that 'weak' refs
are rather non-portable, though at least this one is in a
host-OS-specific file.

> +static void hvf_raise_exception(CPUARMState *env, uint32_t excp,
> +                                uint32_t syndrome)
> +{
> +    unsigned int new_el = 1;
> +    unsigned int old_mode = pstate_read(env);
> +    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> +    target_ulong addr = env->cp15.vbar_el[new_el];
> +
> +    env->cp15.esr_el[new_el] = syndrome;
> +    aarch64_save_sp(env, arm_current_el(env));
> +    env->elr_el[new_el] = env->pc;
> +    env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
> +    pstate_write(env, PSTATE_DAIF | new_mode);
> +    aarch64_restore_sp(env, new_el);
> +    env->pc = addr;
> +}

KVM does "raise an exception" by calling arm_cpu_do_interrupt()
to do the "set ESR_ELx, save SPSR, etc etc" work (see eg
kvm_arm_handle_debug()". Does that not work here ?

> +
> +static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    uint64_t val = 0;
> +
> +    switch (reg) {
> +    case SYSREG_CNTPCT_EL0:
> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
> +              gt_cntfrq_period_ns(arm_cpu);
> +        break;

Does hvf handle the "EL0 access which should be denied because
CNTKCTL_EL1.EL0PCTEN is 0" case for us, or should we have
an access-check here ?

> +    case SYSREG_PMCCNTR_EL0:
> +        val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);

This is supposed to be a cycle counter, not a timestamp...

> +        break;
> +    default:
> +        trace_hvf_unhandled_sysreg_read(reg,
> +                                        (reg >> 20) & 0x3,
> +                                        (reg >> 14) & 0x7,
> +                                        (reg >> 10) & 0xf,
> +                                        (reg >> 1) & 0xf,
> +                                        (reg >> 17) & 0x7);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
> +{
> +    switch (reg) {
> +    case SYSREG_CNTPCT_EL0:
> +        break;

CNTPCT_EL0 is read-only (ie writes should fault) but this
makes it writes-ignored, doesn't it ?

> +    default:
> +        trace_hvf_unhandled_sysreg_write(reg,
> +                                         (reg >> 20) & 0x3,
> +                                         (reg >> 14) & 0x7,
> +                                         (reg >> 10) & 0xf,
> +                                         (reg >> 1) & 0xf,
> +                                         (reg >> 17) & 0x7);
> +        break;
> +    }
> +}

> +    switch (ec) {
> +    case EC_DATAABORT: {
> +        bool isv = syndrome & ARM_EL_ISV;
> +        bool iswrite = (syndrome >> 6) & 1;
> +        bool s1ptw = (syndrome >> 7) & 1;
> +        uint32_t sas = (syndrome >> 22) & 3;
> +        uint32_t len = 1 << sas;
> +        uint32_t srt = (syndrome >> 16) & 0x1f;
> +        uint64_t val = 0;
> +
> +        trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
> +                             hvf_exit->exception.physical_address, isv,
> +                             iswrite, s1ptw, len, srt);
> +
> +        assert(isv);

This seems dubious -- won't we just crash if the guest does
a data access to a device or to unmapped memory with an insn that
doesn't set ISV ? With KVM we feed this back to the guest as an
external data abort (see the KVM_EXIT_ARM_NISV handling).

> +
> +        if (iswrite) {
> +            val = hvf_get_reg(cpu, srt);
> +            address_space_write(&address_space_memory,
> +                                hvf_exit->exception.physical_address,
> +                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +        } else {
> +            address_space_read(&address_space_memory,
> +                               hvf_exit->exception.physical_address,
> +                               MEMTXATTRS_UNSPECIFIED, &val, len);
> +            hvf_set_reg(cpu, srt, val);
> +        }
> +
> +        advance_pc = true;
> +        break;
> +    }
> +    case EC_SYSTEMREGISTERTRAP: {
> +        bool isread = (syndrome >> 0) & 1;
> +        uint32_t rt = (syndrome >> 5) & 0x1f;
> +        uint32_t reg = syndrome & SYSREG_MASK;
> +        uint64_t val = 0;
> +
> +        if (isread) {
> +            val = hvf_sysreg_read(cpu, reg);
> +            trace_hvf_sysreg_read(reg,
> +                                  (reg >> 20) & 0x3,
> +                                  (reg >> 14) & 0x7,
> +                                  (reg >> 10) & 0xf,
> +                                  (reg >> 1) & 0xf,
> +                                  (reg >> 17) & 0x7,
> +                                  val);
> +            hvf_set_reg(cpu, rt, val);
> +        } else {
> +            val = hvf_get_reg(cpu, rt);
> +            trace_hvf_sysreg_write(reg,
> +                                   (reg >> 20) & 0x3,
> +                                   (reg >> 14) & 0x7,
> +                                   (reg >> 10) & 0xf,
> +                                   (reg >> 1) & 0xf,
> +                                   (reg >> 17) & 0x7,
> +                                   val);
> +            hvf_sysreg_write(cpu, reg, val);
> +        }

This needs support for "this really was a bogus system register
access, feed the guest an exception".

> +
> +        advance_pc = true;
> +        break;
> +    }
> +    case EC_WFX_TRAP:
> +        advance_pc = true;
> +        break;
> +    case EC_AA64_HVC:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_unknown_hvf(env->xregs[0]);
> +        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
> +        break;
> +    case EC_AA64_SMC:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_unknown_smc(env->xregs[0]);
> +        hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
> +        break;
> +    default:
> +        cpu_synchronize_state(cpu);
> +        trace_hvf_exit(syndrome, ec, env->pc);
> +        error_report("0x%llx: unhandled exit 0x%llx", env->pc, exit_reason);
> +    }
> +
> +    if (advance_pc) {
> +        uint64_t pc;
> +
> +        flush_cpu_state(cpu);
> +
> +        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
> +        assert_hvf_ok(r);
> +        pc += 4;
> +        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
> +        assert_hvf_ok(r);
> +    }
> +
> +    return 0;
> +}

thanks
-- PMM
