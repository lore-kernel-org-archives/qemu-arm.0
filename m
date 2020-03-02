Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2362318lfg;
        Mon, 2 Mar 2020 04:08:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvSK0uwTKVnz1f04DTwemag7PImw3bKZIKz8DmChPQefwzaLN02/A1GX9QIbtOyyjFGiaT
X-Received: by 2002:ac8:3778:: with SMTP id p53mr13174633qtb.158.1583150905930;
        Mon, 02 Mar 2020 04:08:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583150905; cv=none;
        d=google.com; s=arc-20160816;
        b=lm5jtbvdf2KyZDwlXjtfr1zRumBckHIJvrX3gW2KQ8Op+2Ryzb9bVxhlha6mANxYix
         I0urfoH1/ucdeGSpy16Yf8c7fPACu129L1BmHvx/W456nBh+1yqJDnKkmJEv3j2zWV/f
         nox8y5NqyQ8IRkCUqbOFQdXl+b+Oej3BEaOdT6lfoVvmIBDeQoBXH1L+q4kZ1HdRyJ13
         /eNmNJPrtxAfKrshiBKBLatMJGJ0pWxtvNaJ10UA4csCJHLQAmbQwOJ1Mf86+cI5jews
         AoGfEcVCZiIt4xoFbKXko6q+rg5tWMhqDCCc/IjbAb+qbwhTZsNKqmZebdsT0jn4Gw6o
         6FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Eq5eUuDb/LmF1e3qVTfRbfQjtiEljJIwf0GKIRN+T/g=;
        b=mvJwIp2Z7aMw5Qtb4EZQjMTsRRxN/UftczvRrS0xeSLwHtgf+bWNDRHNvVM/9G69Qu
         K0VO6hEJX79ujGah5Sel9BTqA44HOH26U3IRFqMzzKT7GVICd8vQMGwwY3k8/odB9H+X
         iI1j0JPnbiEX6Z4iikv+nbZuI94sQiW1ly6YNFm1fEW34zgz3Zn8sughkuNjc8p+wL+4
         a4eghiUK9l6Jydgp9I8II12uynkBWFIIh2qic4XuF1naznXeUX9nG+z38L4tCODhlGcs
         HCRxkrU3f8pBWKe+YPsgA7eL8F/UQ8JSSVnViGaXnUwwXGFLLS4a5WD5nuQ7SepTmbt1
         aMaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tnz0lXxH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si5636261qtv.238.2020.03.02.04.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:08:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tnz0lXxH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8js1-0006yG-E0
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:08:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jrt-0006xn-AP
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jrs-0006TV-28
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jrr-0006So-TX
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:08:16 -0500
Received: by mail-ot1-x342.google.com with SMTP id x19so4622062otp.7
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 04:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eq5eUuDb/LmF1e3qVTfRbfQjtiEljJIwf0GKIRN+T/g=;
 b=tnz0lXxH7ivjiEYOGlAHmqcCgszi8dzvUa31bh69VmrCcJmtwnmbNDv4Bju6wvkTGt
 GgTFuUo/moUrWBFyC99sZ8IDP9e8Ku8wM1fr1tVon54SnTk9v8i5chPLx8yPCxSDm1I9
 f/az0fgtZmrmI0SmNTiKxPRghw9g17fL1/YnS8twlCClvz/rSierJFKxx6pdseCYuiqH
 QQxkJgK45qaeIyamwpzp44YCzz200WIu3u5q+9QfjSzpZXUz2y9eJTnjvfCkxwo8UVJL
 krhhgl1oAdwfMsbuvca9i46+y1B+3wkVVvFWjqYKtH5osFPd7gQYokLWgoHd7CRsmbdT
 5Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eq5eUuDb/LmF1e3qVTfRbfQjtiEljJIwf0GKIRN+T/g=;
 b=bFjgaPqDdTyUMVebiZS8/plaB8W22fHEa7j2gSpbXaRcuhmKRrxCkDVWu05XfuTKvW
 z3bL6Pce4SBKTEj2yJ1p4/XxkTWej/pxPmNLmsgHK94WX98+MqIhT5lsRa43IXerVDgR
 JU5H3N24ycI6sYSVJd8TDxHNGrqyJwor4EQsy0/+UPlGoMgVKJFvKxB7K+mCrLt0T9wB
 PeCbMjDlnywPv760PTnehm/ZKMJK2NMxr1xHGyvVD7h5sQN2aT3gs6pR6ciL2arBbmMN
 vQfBY0hY1zCizXucMU3aL/q6ss9NXvqMvpSzoJdolZojWefZeLtpGPad9IYtZIIUkkES
 rarA==
X-Gm-Message-State: ANhLgQ05731qnmam0aQPIHOSKSKu2BPWTaahaz3Gd3AHtCg6L0hWn3TY
 YkvitdHQ/WsOkihc9PDXQB7ILs1VhRKZeWvLLmY36g==
X-Received: by 2002:a9d:75ca:: with SMTP id c10mr1862741otl.97.1583150894740; 
 Mon, 02 Mar 2020 04:08:14 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
 <20200225031414.15649-2-richard.henderson@linaro.org>
In-Reply-To: <20200225031414.15649-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:08:03 +0000
Message-ID: <CAFEAcA9VQBzdJ-fJjgxgVuTUYFL=Yqx=eNtimBaVhUGtbuOAZg@mail.gmail.com>
Subject: Re: [PATCH 3/8] target/arm: Apply TBI to ESR_ELx in
 helper_exception_return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: uRA5ScNiec9P

On Tue, 25 Feb 2020 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We missed this case within AArch64.ExceptionReturn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 509ae93069..95e9e879ca 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -1031,6 +1031,8 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
>                        "AArch32 EL%d PC 0x%" PRIx32 "\n",
>                        cur_el, new_el, env->regs[15]);
>      } else {
> +        int tbii;
> +
>          env->aarch64 = 1;
>          spsr &= aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
>          pstate_write(env, spsr);
> @@ -1038,8 +1040,27 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
>              env->pstate &= ~PSTATE_SS;
>          }
>          aarch64_restore_sp(env, new_el);
> -        env->pc = new_pc;
>          helper_rebuild_hflags_a64(env, new_el);
> +
> +        /*
> +         * Apply TBI to the exception return address.  We had to delay this
> +         * until after we selected the new EL, so that we could select the
> +         * correct TBI+TBID bits.  This is made easier by waiting until after
> +         * the hflags rebuild, since we can pull the composite TBII field
> +         * from there.
> +         */
> +        tbii = FIELD_EX32(env->hflags, TBFLAG_A64, TBII);
> +        if ((tbii >> extract64(new_pc, 55, 1)) & 1) {
> +            /* TBI is enabled. */
> +            int core_mmu_idx = cpu_mmu_index(env, false);
> +            if (regime_has_2_ranges(core_mmu_idx | ARM_MMU_IDX_A)) {

We have core_to_arm_mmu_idx() so you don't need to open-code this.
Or just call arm_mmu_idx(env) to get the ARMMMUIdx directly.

> +                new_pc = sextract64(new_pc, 0, 56);
> +            } else {
> +                new_pc = extract64(new_pc, 0, 56);
> +            }
> +        }
> +        env->pc = new_pc;
> +
>          qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
>                        "AArch64 EL%d PC 0x%" PRIx64 "\n",
>                        cur_el, new_el, env->pc);

thanks
-- PMM
