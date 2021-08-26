Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp627511lfb;
        Thu, 26 Aug 2021 06:46:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycXdGsO/OLv7nttFFYCnkJndcblTdYgTokwb91ruVgKuxEDBLzAErFwxcvzLyf3o/twf1i
X-Received: by 2002:aa7:d3c7:: with SMTP id o7mr4258483edr.288.1629985581469;
        Thu, 26 Aug 2021 06:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629985581; cv=none;
        d=google.com; s=arc-20160816;
        b=DrmDVuM/daYI9UG4IwZOt/eCleQFpkE7zePSsOMFSKDOlrZKTuiP+lr5TMMXuLpUHL
         XgYE6W9wn0g9E6rpYsDPP28s77ACsSChwulXfLXbTM3TkIQ0mZv1I7vEJ5OcSug25XEj
         TCK9BLkj9PRl6tcMsG0GNqjEqqHeYC+Ed7dJdVLhp15efb6Z2EZkpfhCxE3n6NfQK7Ge
         RsfgvmQvPitsB3yMPI4auziAAS9yxFORnYI7I8qnoL1P/KfRrCLrzRDE6ITE69mPk0K2
         TAH/EQ6CNryULcqHgXP91BMXyrw/wi4uyoxI99YIU+sh4RM7KD2UWzvjtQbrSAzWaU8S
         4DVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KEC4E4LNCJ54uW1RSX/0c6cbVF12aAFz5VvWL801FqI=;
        b=MqoQEmySq8Tp/9W5cctv/AcWZnrsmh+zIOsLwpVEbV6xcHEzXKH5mn6xuPGOLD6TrB
         63bpzSqq4h6TL6mdmOk7dLFnaczYTjhni2pqHS5G2g5ui7Emhz0KnPNFhwgrYc9xRvcl
         2D7bne+SWXMgL/9Bfy6ZdWsw0lqdG5V6bagWfRisMWnPBOCPplQQaJln+z6byUcoNc/B
         zUaviMgJC+MXobDz+Vm5rC8QsSImme17CQYmuZU1fQRtlLKBBOKxTC+F70bShyp5dj6Z
         gxzPwWCO/SDbX3N6P62bo+Fv/g4EltPi+2+1/mmCYRd1mbkO3J64+w00UXe2zwj+B1GO
         p1Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E+Shgu9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si3433210eja.706.2021.08.26.06.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E+Shgu9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFi0-0007dR-Fp
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFhh-0007YN-Em
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:46:01 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFhf-0008CL-Ko
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:46:00 -0400
Received: by mail-ej1-x631.google.com with SMTP id i21so6447565ejd.2
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEC4E4LNCJ54uW1RSX/0c6cbVF12aAFz5VvWL801FqI=;
 b=E+Shgu9X2kC+w/0ls4I3pcxUX0QeXgCFwnPb1Cn/tAY4wvwnToGrme2fQ3c+INcOwP
 PWC9Mw1UJBY6ZzKEEDnGMEtbDb2bwDSfgrrEesmtvhFAVmYq6n8dVdvm41cdLW3G5KHj
 RdWBYAJlQO2oR8EqodjZMUBqlavKBP0tFMfJWcKrbUPdSEdJcS9CwtYnNIOuoddFyul+
 X64m6vtwp53O7/SAoKBSFkM0QuqifBJgv1ueg0koSKzbicP89xHxRQLtOuJPo2PzRwFR
 V2UDwklx7ifujO0A4obNwgAvRU0VfPcFAeXsj5wNHkl07zBi9Z01Drz+4r+N7gTCB7Q0
 4Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEC4E4LNCJ54uW1RSX/0c6cbVF12aAFz5VvWL801FqI=;
 b=eTSBk1a+DC6LmXWQ6RyVqHMv5j9FaT0U6b1IStwqVz2ViqxmOc+bKalsX84pXo9btD
 vMXz+5cbG/NAJ+qiyVc9S31Vc9Rns7+h7Grx7GZ6an9CZrVPKxa3a5/hHPAfJKTWeN+G
 cCPLD6473FLHFX2ti8uHjUESb8N66IyR2m3NKo0+WjiMiOKxVgP+n9W8wk1gHfRQVOB3
 o7f650vmmMIusiIZrDSF7hkRfVpg6DVcqun/QNSYJ9obhb7vWabHn9DhkE2ma6HiS2Se
 iUbG9GpoB3gci41fv8f3D/jWQ0YBhRtbSeoE3C5rjpPst0GT3gIQVE5r5prXrHFNKP+l
 5f/g==
X-Gm-Message-State: AOAM533E7KhV5NElECEMAJSZ5RWHLWrHamrq3MO5mk5D5uUAWjpfye1F
 tQdkd07KfR6Ic6lQulQLHBTuCFTgsLbtQYaC/9Ot+A==
X-Received: by 2002:a17:907:923:: with SMTP id
 au3mr2192295ejc.482.1629985557446; 
 Thu, 26 Aug 2021 06:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:45:10 +0100
Message-ID: <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bYg/wZG1W2yi

On Sat, 21 Aug 2021 at 21:00, Richard Henderson
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
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  1 +
>  target/arm/syndrome.h      |  5 +++++
>  target/arm/tlb_helper.c    | 24 +++++++++++++++++++++++
>  target/arm/translate-a64.c | 21 ++++++++++++++++++--
>  target/arm/translate.c     | 39 +++++++++++++++++++++++++++++++-------
>  5 files changed, 81 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 248569b0cd..d629ee6859 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>  DEF_HELPER_2(exception_internal, void, env, i32)
>  DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
>  DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
> +DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
>  DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_2(wfi, void, env, i32)
>  DEF_HELPER_1(wfe, void, env)
> diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
> index 54d135897b..e9d97fac6e 100644
> --- a/target/arm/syndrome.h
> +++ b/target/arm/syndrome.h
> @@ -275,4 +275,9 @@ static inline uint32_t syn_illegalstate(void)
>      return (EC_ILLEGALSTATE << ARM_EL_EC_SHIFT) | ARM_EL_IL;
>  }
>
> +static inline uint32_t syn_pcalignment(void)
> +{
> +    return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
> +}
> +
>  #endif /* TARGET_ARM_SYNDROME_H */
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 3107f9823e..25c422976e 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -9,6 +9,7 @@
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
>
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
> @@ -123,6 +124,29 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>  }
>
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

I don't think you should need to special case AArch64 vs AArch32 like this;
you can do
   env->exception.vaddress = pc;
   env->exception.fsr = the_fsr;
   raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);

for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
and AArch32-not-Hyp entry will ignore exception.syndrome.

We could probably do with factoring out the
"if (something) { fsr = arm_fi_to_lfsc(&fi) }  else { fsr =
arm_fi_to_sfsc(&fi); }"
logic which we currently duplicate in arm_deliver_fault() and
do_ats_write() and arm_debug_exception_fsr() and also want here.
(NB I haven't checked these really are doing exactly the same
condition check...)


-- PMM
