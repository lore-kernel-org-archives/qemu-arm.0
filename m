Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1888028lfp;
        Mon, 20 Sep 2021 02:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMWZ6Rsi3ql7K0Ru6+4M7d+g5zEy5GE/G1uYNozKlrm0I999JDOrj1YkFOerDsd+zuttCK
X-Received: by 2002:a6b:c3cb:: with SMTP id t194mr17966956iof.50.1632128791635;
        Mon, 20 Sep 2021 02:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632128791; cv=none;
        d=google.com; s=arc-20160816;
        b=dZ2AulMZCrAhgWtlhDzdyE3PhA5/4eHfvaze5ylP6CiiffC1eW8A87l7Rbs9DPkVx0
         Ns0BuThPdqx91NOsvDB3j9wvz6AUy1eTlEjpnDrsUcBbb39md0uWn+GPDNi6Q9nYgscj
         Q1oepU+eMwAFAlFXp9KM/5d0mEYrAT8YSXlsP2u0EEUq1PLf/dHng+k4j9A9TEyFSMhb
         7LWk1+caGvQdS5spbrIrEd0Cj4z+++qdEAgvlLkPKZiiwf91FHVBCZlkHDsgfYjFbxEm
         LCPvOUzkMOv49xa97t1THi+8vKMVXEdZWLnnVMfDWa4BdUJ6tTKdZ+4iSZn/4jHiFWym
         QGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XWAOERrqt8II32RW94iJfQH2Z0r2B9A+v2EpDOWpHlY=;
        b=p+Cv+q19cV8AGIN2irQ67KeUXCjJt/zxkkeok/8LgqQSCZO02b5Xu+ZY7F//qpuW3N
         WKFHzGujaNPB27dxvoTeiNRA9nT4ZM060IaZn0Slv2Z1BxmVA16yKUxN/F2qUH/UgFJH
         2OyhEdS63MIawRFWBn8qdAjRNpi93uZ3IfuqfUG3Nk4fJWAnzwfuwkihAeBOw2ySi79t
         ah1833IH6Xwh18osz2M7y+OiIsEgavNBXe/g0+BO0kGY+3/xdvc1VE/GFEtXyH1DiaHr
         mVCa4/oeLr5MYqNxQz4Ne22UM3Ko75cOTKPGU5THXtkGLXs62QJi80KhxEQ/j3RxS7rX
         bnpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H2NfGtFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si6792239iom.108.2021.09.20.02.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 02:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H2NfGtFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSFFv-0007zw-0p
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 05:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFFi-0007wu-8F
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 05:06:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFFf-0000yx-Ch
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 05:06:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id d21so27519757wra.12
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 02:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWAOERrqt8II32RW94iJfQH2Z0r2B9A+v2EpDOWpHlY=;
 b=H2NfGtFEqRGBmQaL4PNfmpfG6YVS/PtKtj0AdHEYaDck8J+K/YMfrCqpT+az260a4S
 wpn59qN4AKEVjOfNOVMxXr2ATicn9LXVuP8oo6ijqFO+e28Vdq+wdaxitd6fa4djjfhk
 xGNjUANtzNsabHQFgNdgUHOLllAfDmi7nWzFPMyKe5zzc09TBjtR8JaFGDwPjM8jDca2
 +cpQoSZ8JTksJcP2SGKZ21IgLyz58gjvuIOLdw+5M2iat0Kj51MMTrko02IoY+8dSXut
 mxWujGI8dSSOvJR7eYfkNR/xHWB2a1hncAIfXPoLx1LrjoiEUaBsWEuWtU7LDIYZhPot
 T9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWAOERrqt8II32RW94iJfQH2Z0r2B9A+v2EpDOWpHlY=;
 b=by3LPuq3SRAJS2PazqJYg52QsxZPgk/h/UgArB1hFz9eKTeOJ9/cApqzEgZxBCrDv7
 /j5GcuQB+L9EiCLHgn41VqRcvMd90C5sWTYQEPT82g+cCym77tILOSLfIcOD25puTaxs
 etj0F1xwubmM7mkgOioFd9jHFUYIXIH9QW2WysTzI1DdVV8Wr2JUrzTikJyyXpBlWWzx
 sga+ZQa7lgy+HiRroV1dG91KaEIAAfNlybYlOhEnYG0z1H+tMtfD61ePrRft/SyQMPQ+
 JuzPqjwvqMX1OQfwMdjrE/zABhGACN+sEfLE5re/i6P9Z/w22piCmfgeHRl0iZnswHCM
 EtIA==
X-Gm-Message-State: AOAM533hYLnKYrVC7MPm0vDdk5F3Z8ut6y1mmF9QFHdXQT4oIvL/X22T
 nKozstCkd9XWE5C+yu76K/H8Y5B39anCdhVduru1Qw==
X-Received: by 2002:adf:f185:: with SMTP id h5mr27539771wro.302.1632128773725; 
 Mon, 20 Sep 2021 02:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210920024504.625965-1-richard.henderson@linaro.org>
 <20210920024504.625965-4-richard.henderson@linaro.org>
In-Reply-To: <20210920024504.625965-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 10:05:21 +0100
Message-ID: <CAFEAcA_NPSnXQYTNcT56xs-37gys-biF-Ra8sbXzmRkmwR34Dg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bPHQm3oVQuAO

On Mon, 20 Sept 2021 at 03:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNPREDICTABLE and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.

> +void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
> +{
> +    int target_el = exception_target_el(env);
> +
> +    if (target_el == 2 || arm_el_is_aa64(env, target_el)) {
> +        /*
> +         * To aarch64 and aarch32 el2, pc alignment has a
> +         * special exception class.
> +         */
> +        env->exception.vaddress = pc;
> +        env->exception.fsr = 0;
> +        raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
> +    } else {
> +        /*
> +         * To aarch32 el1, pc alignment is like data alignment
> +         * except with a prefetch abort.
> +         */
> +        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
> +        arm_deliver_fault(env_archcpu(env), pc, MMU_INST_FETCH,
> +                          cpu_mmu_index(env, true), &fi);
> +    }

I still don't believe that you need to special case AArch32-non-Hyp
like this. Can you expand on what you think the difference is?

> +}
> +
>  #if !defined(CONFIG_USER_ONLY)
>
>  /*
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ab6b346e35..8c72e37de3 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14752,8 +14752,10 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *s = container_of(dcbase, DisasContext, base);
>      CPUARMState *env = cpu->env_ptr;
> +    uint64_t pc = s->base.pc_next;
>      uint32_t insn;
>
> +    /* Singlestep exceptions have the highest priority. */
>      if (s->ss_active && !s->pstate_ss) {
>          /* Singlestep state is Active-pending.
>           * If we're in this state at the start of a TB then either
> @@ -14768,13 +14770,28 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>          assert(s->base.num_insns == 1);
>          gen_swstep_exception(s, 0, 0);
>          s->base.is_jmp = DISAS_NORETURN;
> +        s->base.pc_next = pc + 4;

Why are we adding this in this patch? Isn't this a separate
bugfix ?

>          return;
>      }

thanks
-- PMM
