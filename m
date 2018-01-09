Received: by 10.28.173.206 with SMTP id w197csp3943469wme;
        Tue, 9 Jan 2018 09:30:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBosUPR4v2xN0Fg4dlp+rr5sOWJScqSR8B+kdSE0KzD28++y4Mk2fmvDVujTfcnbHaP7QSfPE
X-Received: by 10.84.133.193 with SMTP id f59mr16272218plf.72.1515519033432;
        Tue, 09 Jan 2018 09:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515519033; cv=none;
        d=google.com; s=arc-20160816;
        b=YrPX8KVrTAaXfa+GCZk3mmTPGntVtZuM6MsOkxzUs4WRdHyAvV1+slLNDnh3DwZ9Ky
         Wx7wCp/DGIg46zriOECqiFaaNjAdPtRDxGqaCglw60ngjVzMNnJ5jvP/N9h/GWwfvESL
         gobE76ZImd0JgbWQpU3wZMJ+fZEN/sFNS1n/NSz0ijtNCuTW/DY29MMz2yCB59epZWpT
         s4v11V8Kg/BjboGKz8rkfSidXZuY5gv6NK0H1utVW5YHdgRSPkspsxOn5JWvdf1KHb/M
         8IBx33aV1pQ14pDrMhi+yTN4dWsJBok74m4/WjWE04LZWjMo2+Bj3S7dV+UxN4nf+K49
         LiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TLqCucZke6ZaMo60KWbNtC8NndWhBdqqjz/Ln8tBzt0=;
        b=d3LXdsjSB4Na14B4sjpPmkPzHBffDEeFDB+RhyjDwLLB454BOAkD69zYHOlsPBmusT
         CFSzjUjIBOKjAwcwSGoUBdH6J8vE9CSduqw921EDvIvYZ9moCiaJFGDNo8UrRfFFHbcb
         sGxKdTQpuy2hP3qugiDuDrw0z2+ylU7dTFlTkDr+cE63YjMgFLbiXRPtJiTifS4k3nTI
         kTpriUw+YHIfHBnh1RJPPvYC3S5Q7uxSpjK1efZk14ipUZB0UuqSU/LUPFfL1bWuXqS1
         ujLiepH+6BrROVtEoeX+iUU4LZoXS570LB30KjqxyKYdDs6FuDcG49dCH1+eTm8KTS/4
         lewg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM8SHUEu;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g31si10662654pld.67.2018.01.09.09.30.33;
        Tue, 09 Jan 2018 09:30:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM8SHUEu;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754244AbeAIRab (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 9 Jan 2018 12:30:31 -0500
Received: from mail-oi0-f46.google.com ([209.85.218.46]:46497 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753179AbeAIRaa (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 Jan 2018 12:30:30 -0500
Received: by mail-oi0-f46.google.com with SMTP id d124so6889781oib.13
        for <kvm@vger.kernel.org>; Tue, 09 Jan 2018 09:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TLqCucZke6ZaMo60KWbNtC8NndWhBdqqjz/Ln8tBzt0=;
        b=gM8SHUEudDPmk2yVdWjwuOyhekNjnAfSEoH583QtsN3eCdQNTCyImDjZFIqCWyrBUr
         tUX7TNhP4uTt8ZfDZJ1Cg3FjvSOohHJmmf2R9+IBgka3c1eknnQ7bEhRDkJRrv3GPfFG
         sbiu8jbojZ45Xhrd5ihipmQmS0N3XAzT2b2us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TLqCucZke6ZaMo60KWbNtC8NndWhBdqqjz/Ln8tBzt0=;
        b=rFfCs9MfKZelHXZK5SCmeS23Ldh7I7tz4DpE0YnCmYXdP4uroOQv9Pl3B+KuibTjuU
         ZWA7JIzX+1hOpCZW8MHZxmqqbyTPlXyyZF3+0yBdFsHegcByzLBOhOELS8ZJjmJV+Pqj
         ITp2h232+5OWmfDUFqmcG8iP8Dv5MMAwcmm0DICkhzaPRORkdLJfWx+RV+sDQ6r4Jkxg
         wndK//Fy2lOqpEWdIS9yNCSyYNCYc2IIQKhh+tsH6FHpXhBe2D+urI0lnkk8FxE2dLkW
         OxKPx+QQXLvXlaHQnsRw9mbRlqnTWnnDzHFLqdPQfuijrM8f7sinLvhmgORoSQGWrvfQ
         S2xw==
X-Gm-Message-State: AKwxytfAAGbeW7HLmemxWjhbt4ZKMVdIO5N6uRNtIomcY0UKLafOH7hS
        priDX2DOBfyJPXFGrDGEsvdBplYYZqPnj01FHa364g==
X-Received: by 10.202.244.131 with SMTP id s125mr1048175oih.327.1515519029496;
 Tue, 09 Jan 2018 09:30:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 09:30:09 -0800 (PST)
In-Reply-To: <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com> <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 9 Jan 2018 17:30:09 +0000
Message-ID: <CAFEAcA-RC6hUMR5jPrgOB7nkWjXaPxo6dYEXO=kgC=59k7EVrw@mail.gmail.com>
Subject: Re: [PATCH v14 5/9] target-arm: kvm64: inject synchronous External Abort
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        James Morse <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: eVUz66t6FqsG

On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Add synchronous external abort injection logic, setup
> exception type and syndrome value. When switch to guest,
> guest will jump to the synchronous external abort vector
> table entry.
>
> The ESR_ELx.DFSC is set to synchronous external abort(0x10),
> and ESR_ELx.FnV is set to not valid(0x1), which will tell
> guest that FAR is not valid and holds an UNKNOWN value.
> These value will be set to KVM register structures through
> KVM_SET_ONE_REG IOCTL.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Marc is against that KVM inject the synchronous external abort(SEA) in [1],
> so user space how to inject it. The test result that injection SEA to guest by Qemu
> is shown in [2].
>
> [1]: https://lkml.org/lkml/2017/3/2/110
> [2]:
> Taking exception 4 [Data Abort]
> ...from EL0 to EL1
> ...with ESR 0x24/0x92000410
> ...with FAR 0x0
> ...with ELR 0x40cf04
> ...to EL1 PC 0xffffffc000084c00 PSTATE 0x3c5
> after kvm_inject_arm_sea
> Unhandled fault: synchronous external abort (0x92000410) at 0x0000007fa234c12c
> CPU: 0 PID: 536 Comm: devmem Not tainted 4.1.0+ #20
> Hardware name: linux,dummy-virt (DT)
> task: ffffffc019ab2b00 ti: ffffffc008134000 task.ti: ffffffc008134000
> PC is at 0x40cf04
> LR is at 0x40cdec
> pc : [<000000000040cf04>] lr : [<000000000040cdec>] pstate: 60000000
> sp : 0000007ff7b24130
> x29: 0000007ff7b24260 x28: 0000000000000000
> x27: 00000000000000ad x26: 000000000049c000
> x25: 000000000048904b x24: 000000000049c000
> x23: 0000000040600000 x22: 0000007ff7b243a0
> x21: 0000000000000002 x20: 0000000000000000
> x19: 0000000000000020 x18: 0000000000000000
> x17: 000000000049c6d0 x16: 0000007fa22c85c0
> x15: 0000000000005798 x14: 0000007fa2205f1c
> x13: 0000007fa241ccb0 x12: 0000000000000137
> x11: 0000000000000000 x10: 0000000000000000
> x9 : 0000000000000000 x8 : 00000000000000de
> x7 : 0000000000000000 x6 : 0000000000002000
> x5 : 0000000040600000 x4 : 0000000000000003
> x3 : 0000000000000001 x2 : 0000000000000000
> x1 : 0000000000000000 x0 : 0000007fa2418000
> ---
>  target/arm/kvm64.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index a16abc8..c00450d 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -582,6 +582,71 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>      return KVM_PUT_RUNTIME_STATE;
>  }
>
> +static int kvm_arm_cpreg_value(ARMCPU *cpu, ptrdiff_t fieldoffset)
> +{
> +    int i;
> +
> +    for (i = 0; i < cpu->cpreg_array_len; i++) {

This is still absolutely the wrong thing to do. Nothing should
need to scan this array like this.

> +        uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
> +        const ARMCPRegInfo *ri;
> +        ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
> +        if (!ri) {
> +            continue;
> +        }
> +
> +        if (ri->type & ARM_CP_NO_RAW) {
> +            continue;
> +        }
> +
> +        if (ri->fieldoffset == fieldoffset) {
> +            cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
> +            return 0;
> +        }
> +    }
> +    return -EINVAL;
> +}
> +
> +/* Inject synchronous external abort */
> +static void kvm_inject_arm_sea(CPUState *c)
> +{
> +    ARMCPU *cpu = ARM_CPU(c);
> +    CPUARMState *env = &cpu->env;
> +    unsigned long cpsr = pstate_read(env);
> +    uint32_t esr, ret;
> +
> +    /* This exception is synchronous data abort*/

Missing space before */

> +    c->exception_index = EXCP_DATA_ABORT;
> +    /* Inject the exception to guest El1 */

"EL1", all caps.

> +    env->exception.target_el = 1;
> +    CPUClass *cc = CPU_GET_CLASS(c);

Don't declare variables in the middle of the code -- check QEMU's
CODING_STYLE doc for more info.

> +
> +    /* Set the DFSC to synchronous external abort and set FnV to not valid,
> +     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
> +     */
> +    esr = (0x10 | (1 << 10));
> +
> +    /* This exception comes from lower or current exception level. */
> +    if ((cpsr & 0xf) == PSTATE_MODE_EL0t) {

This looks like it'll be wrong for AArch32 guests (which you can
still have with KVM with a 64-bit host), and even for AArch32
userspace in a 64-bit guest. The correct way to find out what the
current EL is is to use arm_current_el().

> +        esr |= (EC_DATAABORT << ARM_EL_EC_SHIFT);
> +    } else {
> +        esr |= (EC_DATAABORT_SAME_EL << ARM_EL_EC_SHIFT);
> +    }

I'm pretty sure in a previous round of review I said you shouldn't
be manually constructing ESR values. We have helper functions for
those (syn_data_abort_*).

> +
> +    /* For the AArch64, instruction length is 32-bit */
> +    esr |= ARM_EL_IL;
> +    env->exception.syndrome = esr;
> +
> +    cc->do_interrupt(c);
> +
> +    /* set ESR_EL1 */
> +    ret = kvm_arm_cpreg_value(cpu, offsetof(CPUARMState, cp15.esr_el[1]));

Breakpoint injection doesn't need to do this. Neither should this code.

> +    if (ret) {
> +        fprintf(stderr, "<%s> failed to set esr_el1\n", __func__);
> +        abort();
> +    }
> +}
> +
>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>
> --
> 1.8.3.1

thanks
-- PMM
