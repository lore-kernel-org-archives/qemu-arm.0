Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1572942lfg;
        Tue, 25 Feb 2020 03:44:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/25/sylhD8rDxECPkgpOi2fpoF2MMID3C6Y9yMypMn8tVePpfduRhj6BNXzwwuetWRKkZ
X-Received: by 2002:a37:5887:: with SMTP id m129mr19740352qkb.321.1582631080018;
        Tue, 25 Feb 2020 03:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582631080; cv=none;
        d=google.com; s=arc-20160816;
        b=lp63bS+reRTreOvk7AYqzDJztAb7X2x20e0WYiMuEdii2gPUVsK4SfTCm7po7oIWHa
         aIrvJGsn/mR265i33P4P8hdpWd+aapDSTUS1kyU1QTQA+/yhcejJc1Q9N0D/bv39aSb1
         vkXIE5rNpj2H/cY3+vmGmpXKO0J2bmEsaFcTtq2/zDzZZLgIzpYeGSxEwTvUD+BdMQx1
         HFLZR71HvcNaa0FEas01nlgyxTpxFeLwl/CEyVN6y9t6ufB5he67dCk4B3n2ngnPFFqS
         kP50gTryxtAPuZ0aYcO5DUacnzRVD9RQkn6vBlIw9Xm+HEFKSdQrrQT94uC1PzTc+LKw
         IAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGUcQGexJ/5mmgi4mqxcVj6PXdsu59Z1YDhGoJZiEcQ=;
        b=VUbuR5y0TEFLmr2PKlm/gb6/9gd3Hx5sw/RG1p0Y+uzy0wx4xELtu1hWfYSvswfVEO
         5sgDqtJ4B42/SUsJ8AnmeadKy/NyQrgK0rtHN5BwPCbpbQBDy/noYXsmn+aO7TwQghK/
         SkBtF68P1LYDM3Vzc5q7t/p0fiS/7uHTKC8Bdz+bx1wwq5kG2WTB8Vsq30FliPy50854
         mSpt/ODmPa7s09sSUlbldpRhil4WgpI2A6UCL1vhI9ta0zYzx/CC4/77xpTpDHrT1cp1
         Sn9ceqJpm2SZZk7qvlup60C+IUt/M1qgD3b8iW+BMm5rMUhcELyDdpOaElKqsPKHqQ9O
         sjrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F/dzTKR9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id db18si6591964qvb.4.2020.02.25.03.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 03:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="F/dzTKR9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Ydi-0003rx-Eg
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 06:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YdY-0003qy-Pu
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:44:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YdX-0006tF-8i
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:44:28 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6YdX-0006ry-3h
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:44:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id b18so12258377oie.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cGUcQGexJ/5mmgi4mqxcVj6PXdsu59Z1YDhGoJZiEcQ=;
 b=F/dzTKR9j8oF7VQe6WDSEwfLkfHNAZekVRweoWqeytv3An9cIPTVKREROGM0GnuCZR
 +tK3YE4ldMaF5rTCLqr52TKSeKDqKnToUOALJnLvwuGh3/CKJoPpBmUJMP6HWxBCmcD5
 +zamd20ZFoc9sv5rtX/jOMsl0RXwyhCnpZ+UKXaz1JEZmC8oSd5KDkPMaqMJv7Bdy5qR
 rSBy7iBR92DoAKhvV6O93ZHL54zHZvCWETbpf2qcPj1Iu6eneiFvPTGRUWOjkt4knoXh
 RXacTtY34FIjlM+WioSQLSW/aBjeGe+LxbiK2BFw3LIbUZCvd5eJsjZCYld0BY+8bxP4
 8tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cGUcQGexJ/5mmgi4mqxcVj6PXdsu59Z1YDhGoJZiEcQ=;
 b=otARnRbQ8DTXAZUMFIx8CykWoFrCax21bv7Y+ZEv2opOlm51euFYd+9Fb9P1xezIgD
 fR2IJ2pUwBLKgzDLVU3dtTLZEyGIaRNrFWJmk6WRDMinTWLGljs71YeoGg0hrMRP7o0g
 CT1a/ZS+7Qojdp0YJxCexHPDEp177sVW0zgBXADZ7DZFnl+a1TszQpq9W1XHXzHRalxJ
 Zo6vq16cu72DHzPxwFsvRydvngSXPABjEo4FFYWo6rLa2xUXLnLBYUrZx2UjLG40UsY4
 MHP/8hPRRrZpzAQrhx8lRoq7Wk/7U7HTsrUSHtzsR8spNvenC91sSQ2Zd4kaMWjXTgN7
 doLA==
X-Gm-Message-State: APjAAAUCwzbvvjDT4bzPOykfFb3uO1jBQ9fNT4skbfrrP+6CTRI7Egkd
 cCpOoDPj895wZxnH/q3sKz4Gxy5AKBEdDHViQ1nwjQ==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3316039oiy.170.1582631065954; 
 Tue, 25 Feb 2020 03:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-3-richard.henderson@linaro.org>
In-Reply-To: <20200218190958.745-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:44:14 +0000
Message-ID: <CAFEAcA-crDkFHf4kW9DYAoRn_g165+j8dy-=+jDZMvj16epKig@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: E2Bv/8F1ruVB

On Tue, 18 Feb 2020 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits trap EL1 access to various virtual memory controls.
>
> Buglink: https://bugs.launchpad.net/bugs/1855072
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Include TTBCR.
> ---
>  target/arm/helper.c | 77 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 52 insertions(+), 25 deletions(-)

> +/* Check for traps from EL1 due to HCR_EL2.TVM and HCR_EL2.TRVM.  */
> +static CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                      bool isread)
> +{
> +    if (arm_current_el(env) == 1) {
> +        uint64_t trap = isread ? HCR_TRVM : HCR_TVM;
> +        if (arm_hcr_el2_eff(env) & trap) {
> +            return CP_ACCESS_TRAP_EL2;
> +        }
> +    }
> +    return CP_ACCESS_OK;
> +}

v7 doesn't have HCR_TRVM -- we should stop the guest being
able to write to that bit if we don't want to do a version
check on the CPU here to see whether to honour it.

> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = env_archcpu(env);
> @@ -785,7 +798,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
>       */
>      { .name = "CONTEXTIDR_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
> -      .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
> +      .access = PL1_RW, .accessfn = access_tvm_trvm,
> +      .secure = ARM_CP_SECSTATE_NS,
>        .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
>        .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
>      { .name = "CONTEXTIDR_S", .state = ARM_CP_STATE_AA32,

We could I guess add the accessfn to CONTEXTIDR_S, which will
do nothing now but would save us forgetting it if we ever
implement emulation of secure EL2... (For the other regs
touched by this patch this happens automatically because they
don't specify a secure-state and so one regdef does both.)

> @@ -877,9 +891,11 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
>        .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W, .writefn = tlbimvaa_write,
>        .type = ARM_CP_NO_RAW },
>      { .name = "PRRR", .cp = 15, .crn = 10, .crm = 2,
> -      .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
> +      .opc1 = 0, .opc2 = 0, .access = PL1_RW, .accessfn = access_tvm_trvm,
> +      .type = ARM_CP_NOP },
>      { .name = "NMRR", .cp = 15, .crn = 10, .crm = 2,
> -      .opc1 = 0, .opc2 = 1, .access = PL1_RW, .type = ARM_CP_NOP },
> +      .opc1 = 0, .opc2 = 1, .access = PL1_RW, .accessfn = access_tvm_trvm,
> +      .type = ARM_CP_NOP },

Why are we adding an accessfn that checks bits in a v7-and-later
register to regdefs in the "not_v7_cp_reginfo" array? These only
get used for v6 and earlier CPUs...

> @@ -4158,12 +4185,12 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
>      /* NOP AMAIR0/1 */
>      { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 0,
> -      .access = PL1_RW, .type = ARM_CP_CONST,
> -      .resetvalue = 0 },
> +      .access = PL1_RW, .accessfn = access_tvm_trvm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      /* AMAIR1 is mapped to AMAIR_EL1[63:32] */
>      { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
> -      .access = PL1_RW, .type = ARM_CP_CONST,
> -      .resetvalue = 0 },
> +      .access = PL1_RW, .accessfn = access_tvm_trvm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>      { .name = "PAR", .cp = 15, .crm = 7, .opc1 = 0,
>        .access = PL1_RW, .type = ARM_CP_64BIT, .resetvalue = 0,
>        .bank_fieldoffsets = { offsetof(CPUARMState, cp15.par_s),

I think you have missed adding the accessfn to the 64-bit
TTBR0 and TTBR1 regdefs in lpae_cp_reginfo[].

> @@ -4889,7 +4916,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .type = ARM_CP_NOP, .access = PL1_W },
>      /* MMU Domain access control / MPU write buffer control */
>      { .name = "DACR", .cp = 15, .opc1 = 0, .crn = 3, .crm = 0, .opc2 = 0,
> -      .access = PL1_RW, .resetvalue = 0,
> +      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
>        .writefn = dacr_write, .raw_writefn = raw_write,
>        .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
>                               offsetoflow32(CPUARMState, cp15.dacr_ns) } },

There is also a DACR definition in not_v8_cp_reginfo[] which
I think needs the accessfn as well.

> @@ -7716,7 +7743,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          ARMCPRegInfo sctlr = {
>              .name = "SCTLR", .state = ARM_CP_STATE_BOTH,
>              .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
> -            .access = PL1_RW,
> +            .access = PL1_RW, .accessfn = access_tvm_trvm,
>              .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
>                                     offsetof(CPUARMState, cp15.sctlr_ns) },
>              .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,

thanks
-- PMM
