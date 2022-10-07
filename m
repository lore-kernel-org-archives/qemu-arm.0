Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp527665ocg;
        Fri, 7 Oct 2022 07:57:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GG9Qp+5ZAtHPmXosBZOFbqrBcbGW4FFKk+graWXWUhgUwZl7HUBB1opqRlAJSWcbZbmmP
X-Received: by 2002:a05:622a:138b:b0:35b:b619:b87d with SMTP id o11-20020a05622a138b00b0035bb619b87dmr4521042qtk.146.1665154670869;
        Fri, 07 Oct 2022 07:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665154670; cv=none;
        d=google.com; s=arc-20160816;
        b=gZDfLXyMD0dKTToWfbJAQ+gHErlN8xh92/HTtLdZvzeNepEvHm0nRQ4ukHUDMNGMBp
         YEKhqzbrZUavu2VVRtDfrK/pv+RVpwVYV1u0LPcxgnx1Hy4DeeZxpHCuzJNj+yssBL4F
         DX7hNeAlHkIHsuxNPt/OKaAUAB5AI8KUytDqr+wMOYHXXt7iWpYmzu3gGCqIFfGH0Do6
         nIoIoAOlN/P46QT62JQBhSlrfzAaxmVX31ev3OW47hDs1S8Su+c18GtoMNOIXp0SG0VO
         7OarxkOnd437wruUYPpy3lUgpw+LgVwFwX8bwKRu7D8Uh2udk3tGqij4HOLEsJcud5fy
         m8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+PrtEfpecHSBapt/r6+/1FmwH25AdXTSiY4baPW2Vxg=;
        b=c9j4FJ+1GmqN395uukXdFf+f4n7f23/61UXlCn+U+GTHD2vwVAhfsamP3uApYdEONH
         T7CVaIEb/mhC6GhA1bkT2EtCIfaV8cL/wL/cxkUiZRCCRK/WgHCefvAdYlYENCM0TYFy
         uRXaj4juJ/5UqlhK1yoY5Ynwp5LTi9qGAn9BdyVrWtXIzuGxOLqMGPn5K3l/G4gkkPFS
         Pfffs+AIDHQcFpa5VLHf0jp3XX6B0fGW96BlCs4Y3FLHQLTqubGE7YUorm1AJkSlh58I
         b/4ncOKZyz2+Or9ewu631/FPoDgXXD3erLSkbd3ND4ZJPuEJ4KKA29Ux6QE5Sin5VMgY
         wr9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZ53uNVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020ac81e08000000b0035ba3fd8ccasi1259852qtl.269.2022.10.07.07.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 07:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZ53uNVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogonO-0002bz-EQ
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 10:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognhl-0002RP-Nk
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 09:47:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ognhj-0007GZ-LE
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 09:47:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c24so4603444plo.3
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+PrtEfpecHSBapt/r6+/1FmwH25AdXTSiY4baPW2Vxg=;
 b=PZ53uNVIgWd/MmxpxxjjQqBF9oPdnKaSj809whMJzTNiFaWvuEnnNsBScTliU5B9Ts
 uTL/Tkgev5iyF2fcqR08ZMj2FapNqqT8CNSLJAfVV8Urm9/SK9W0ye7UBvfnAg+BQxYh
 1ayqr0Cy8y67QTx/P+I91zk+aPXo8uFuK/iGxeleAx25v3UzL3Qyp4rErHsPWS8q2j6Z
 Tft5JjS1Og0dl6zMDECT1ImoYr61K3EczpUD0lP+aQzMSOKMQf2MqlQt94mymCt67sW0
 nGN4qrTq/11YH2k/+f9BZ+wKp5FfOiHv/Ws63lwqnuSf4y1c2M46jx9OJGmPIQV89D4J
 sFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+PrtEfpecHSBapt/r6+/1FmwH25AdXTSiY4baPW2Vxg=;
 b=jHtgdt1orj9mOXuLXy5Shd0JB0B5CnMwOZdqClLqxyVOjMmzlybJV3O1Byy0Vm8Ky0
 orTteyyN9+Bu2Nbaa1mK3ctmc57v3ZuOu78Fk8xYdlVxMJ5Yq265MOiU+kYwXDDl6Hhw
 9V2CSLHgf60EKH59PjtKyJBkms7dUXl+LTyJ/F0MtLkEuz1PShKjbsx3pXZFZTlZGseF
 UjNIidHHFIuRwT4CEzXVYvi1od/J6IPqa4VLnacughBAxpGoP+1tJ12ww8s4rFou6mZw
 SZw+nqG2OkIm9iVEiXU2HV0bbsF/kHaehYgm9EmiWrm7Zqdbu3fuj6hQ6smZLhFl7JjW
 QDPw==
X-Gm-Message-State: ACrzQf1cwjct4T7DaClz0wt3oAgW0Kq8QbNOBlm6OmuSKWT4G5fKkKcJ
 stSAsW3C+6l8joMIykf0DjlZVF9quUhvcAR4Z1nszQ==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr4874959plb.60.1665150473883; Fri, 07
 Oct 2022 06:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 14:47:41 +0100
Message-ID: <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLpgKlsds/gI

On Sat, 1 Oct 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the atomic update for hardware management of the access flag
> and the dirty bit.
>
> A limitation of the implementation so far is that the page table
> itself must already be writable, i.e. the dirty bit for the stage2
> page table must already be set, i.e. we cannot set both dirty bits
> at the same time.
>
> This is allowed because it is CONSTRAINED UNPREDICTABLE whether any
> atomic update happens at all.  The implementation is allowed to simply
> fall back on software update at any time.

I can't see where in the Arm ARM this is stated.

In any case, if HA is set you can't simply return ARMFault_AccessFlag
without breaking the bit in D5.4.12 which says
"When hardware updates of the Access flag are enabled for a stage of
 translation an address translation instruction that uses that stage
 of translation will not report that the address will give rise to
 an Access flag fault in the PAR"

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst |   1 +
>  target/arm/cpu64.c            |   1 +
>  target/arm/ptw.c              | 119 ++++++++++++++++++++++++++++++++--
>  3 files changed, 115 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index be7bbffe59..c3582d075e 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -31,6 +31,7 @@ the following architecture extensions:
>  - FEAT_FRINTTS (Floating-point to integer instructions)
>  - FEAT_FlagM (Flag manipulation instructions v2)
>  - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
> +- FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
>  - FEAT_HCX (Support for the HCRX_EL2 register)
>  - FEAT_HPDS (Hierarchical permission disables)
>  - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index e6314e86d2..b064dc7964 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1116,6 +1116,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;
> +    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */

I think we should split the access flag update and the
dirty-bit update into separate commits. It might be useful
for bisection purposes later, and it looks like they're pretty
cleanly separable. (Though if you look at my last comment in this
email, maybe not quite so clean as in the code as you have it here.)

>      t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
>      t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 45734b0d28..14ab56d1b5 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -223,6 +223,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>  typedef struct {
>      bool is_secure;
>      bool be;
> +    bool rw;
>      void *hphys;
>      hwaddr gphys;
>  } S1TranslateResult;
> @@ -261,7 +262,8 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>              pte_attrs = s2.cacheattrs.attrs;
>              pte_secure = s2.f.attrs.secure;
>          }
> -        res->hphys = NULL;
> +        res->hphys = NULL;  /* force slow path */
> +        res->rw = false;    /* debug never modifies */
>      } else {
>          CPUTLBEntryFull *full;
>          int flags;
> @@ -276,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>              goto fail;
>          }
>          res->gphys = full->phys_addr;
> +        res->rw = full->prot & PAGE_WRITE;
>          pte_attrs = full->pte_attrs;
>          pte_secure = full->attrs.secure;
>      }
> @@ -381,6 +384,56 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, const S1TranslateResult *s1,
>      return data;
>  }
>
> +static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
> +                             uint64_t new_val, const S1TranslateResult *s1,
> +                             ARMMMUFaultInfo *fi)
> +{
> +    uint64_t cur_val;
> +
> +    if (unlikely(!s1->hphys)) {
> +        fi->type = ARMFault_UnsuppAtomicUpdate;
> +        fi->s1ptw = true;
> +        return 0;
> +    }
> +
> +#ifndef CONFIG_ATOMIC64
> +    /*
> +     * We can't support the atomic operation on the host.  We should be
> +     * running in round-robin mode though, which means that we would only
> +     * race with dma i/o.
> +     */
> +    qemu_mutex_lock_iothread();

Are there definitely no code paths where we might try to do
a page table walk with the iothread already locked ?

> +    if (s1->be) {
> +        cur_val = ldq_be_p(s1->hphys);
> +        if (cur_val == old_val) {
> +            stq_be_p(s1->hphys, new_val);
> +        }
> +    } else {
> +        cur_val = ldq_le_p(s1->hphys);
> +        if (cur_val == old_val) {
> +            stq_le_p(s1->hphys, new_val);
> +        }
> +    }
> +    qemu_mutex_unlock_iothread();
> +#else
> +    if (s1->be) {
> +        old_val = cpu_to_be64(old_val);
> +        new_val = cpu_to_be64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
> +                                           old_val, new_val);
> +        cur_val = be64_to_cpu(cur_val);
> +    } else {
> +        old_val = cpu_to_le64(old_val);
> +        new_val = cpu_to_le64(new_val);
> +        cur_val = qatomic_cmpxchg__nocheck((uint64_t *)s1->hphys,
> +                                           old_val, new_val);
> +        cur_val = le64_to_cpu(cur_val);
> +    }
> +#endif
> +
> +    return cur_val;
> +}
> +
>  static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
>                                       uint32_t *table, uint32_t address)
>  {
> @@ -1290,6 +1343,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>          goto do_fault;
>      }
>
> + restart_atomic_update:
>      if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
>          /* Invalid, or the Reserved level 3 encoding */
>          goto do_translation_fault;
> @@ -1365,10 +1419,28 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>       * Here descaddr is the final physical address, and attributes
>       * are all in attrs.
>       */
> -    if ((attrs & (1 << 10)) == 0) {
> +    if ((attrs & (1 << 10)) == 0 && !debug) {
>          /* Access flag */
> -        fi->type = ARMFault_AccessFlag;
> -        goto do_fault;
> +        uint64_t new_des, old_des;
> +
> +        /*
> +         * If HA is disabled, or if the pte is not writable,
> +         * pass on the access fault to software.
> +         */
> +        if (!param.ha || !s1.rw) {
> +            fi->type = ARMFault_AccessFlag;
> +            goto do_fault;
> +        }
> +
> +        old_des = descriptor;
> +        new_des = descriptor | (1 << 10); /* AF */
> +        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);
> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
> +        if (old_des != descriptor) {
> +            goto restart_atomic_update;

Do we really need to go all the way back to restart_atomic_update?
My reading of the Arm ARM is that we just need the "write the Access bit"
to be atomic, not that everything we do with the descriptor must be atomic.
Though the pseudocode does do a complete loop back like this, so I guess
that's the 'safe' interpretation. Hmm...

> +        }
>      }
>
>      ap = extract32(attrs, 6, 2);
> @@ -1385,8 +1457,43 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>      }
>
>      if (!(result->f.prot & (1 << access_type))) {
> -        fi->type = ARMFault_Permission;
> -        goto do_fault;
> +        uint64_t new_des, old_des;
> +
> +        /* Writes may set dirty if DBM attribute is set. */
> +        if (!param.hd
> +            || access_type != MMU_DATA_STORE
> +            || !extract64(attrs, 51, 1)  /* DBM */
> +            || !s1.rw) {
> +            fi->type = ARMFault_Permission;
> +            goto do_fault;
> +        }
> +
> +        old_des = descriptor;
> +        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +            new_des = descriptor | (1ull << 7);   /* S2AP[1] */
> +        } else {
> +            new_des = descriptor & ~(1ull << 7);  /* AP[2] */
> +        }

If we update the prot bits, we need to also re-calculate the exec bit,
I think, because the execute-never stuff depends on whether the page is
writeable. Alternatively you can do it the way the pseudocode does and
pre-figure-out the final permission bits value (see AArch64.S1ApplyOutputPerms()
and AArch64.S2ApplyOutputPerms()) so you only need to calculate the
exec bit once.

> +
> +        /*
> +         * If the descriptor didn't change, then attributes weren't the
> +         * reason for the permission fault, so deliver it.
> +         */
> +        if (old_des == new_des) {
> +            fi->type = ARMFault_Permission;
> +            goto do_fault;
> +        }
> +
> +        descriptor = arm_casq_ptw(env, old_des, new_des, &s1, fi);

Are we allowed to do the access and dirty bit updates with separate
atomic accesses? This bit in D5.4.12 suggests the expectation is
it will be a single atomic rmw to update the whole thing:

"For a Block or Page Translation Table descriptor for which the AF
 bit is 0, the DBM bit is 1, and either the value of the stage 1
 AP[2] bit is 1 or the value of the stage 2 S2AP[1] bit is 0, both
 AF can be set to 1, and either AP[2] set to 0 or S2AP[1] set to 1,
 in a single atomic read-modify-write operation, as a result of an
 attempted write to a memory location that uses the translation
 table entry."

(though it depends how you interpret that "can"...)

> +        if (fi->type != ARMFault_None) {
> +            goto do_fault;
> +        }
> +        if (old_des != descriptor) {
> +            goto restart_atomic_update;
> +        }
> +
> +        /* Success: the page is now writable. */
> +        result->f.prot |= 1 << MMU_DATA_STORE;
>      }
>
>      if (ns) {
> --
> 2.34.1

thanks
-- PMM
