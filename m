Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1398712lfb;
        Mon, 6 Jun 2022 07:12:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/vuY6RlCrdPFEedCs5+B0eOxEIzwag7MARpSfIYoH3czAM62A7lC8FgcF6hXOEf6QYVDU
X-Received: by 2002:a05:620a:2586:b0:680:f3c1:9d4a with SMTP id x6-20020a05620a258600b00680f3c19d4amr15413002qko.619.1654524753010;
        Mon, 06 Jun 2022 07:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654524753; cv=none;
        d=google.com; s=arc-20160816;
        b=vurMHPrLXSo0Wc/Zl4aKj53CAGpeMygJWZrh8TwYiZJrQN1LU2v0Nyhxu9dQbw3R8z
         LxeebIT8B6vuzhn5QaCfvgYNhai6aHKFqs4zRtDYV2vjQFBv1FlIEtVpaZeV9OyuJg7n
         tBfxWA3WNEQz5XqkhVp/jp50z1rTR4G3EVQgv8tER56XgKvENA9grOGNkLIKYpYS7Pn/
         lauUGJpvmFzx/pAK+XDYEdNjY6y4k6xzxE9lv+VDd4SWj9+tAfj+8fXObTZuw1RdQN1c
         92JTjBy8PGrHUiZaJK+JYkLU7J7GMlEvV2fsBLJ011c+GyT9+W9oJPkQr4Hu5z5Xl1Y4
         UFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JNqGft807Lv8IOJGLml4i3T41e3Ai7izXNrCGoQno4Y=;
        b=hruzsR6rAVtaqKR8RpFvzJESukDP0DUhzzRJJJ6/CQ5NzFK94QYvULBFxkumGzzVOl
         Rtf5Z6y52issBl4s2LELHu6rrcynPwAh+kGB8/A2+97Dv9kFxpFxoqy3ohtG1dgU7ejl
         Jx/f8yYGjB27Zbu6MEjYJqGKQJnQu7gbDqiWD/t8kL27+1zeSabvj++hF5YiLbk/T8/L
         0dA2M7ZQQe4ZJQeJfi8Pmgi8xu/B2L2wztul8No2si1Tx1g6RtU1Rlz0yp3B4mJHbNM6
         hQ9TmfmBggbgwCQXkjbbpZ3diq16JmBsNkbI5kTtTQNE5WGKx2wzNZeQxvInC1hwxqZp
         IVqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ow9tlB1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020ac85aca000000b0030306d0bcf3si7952964qtd.245.2022.06.06.07.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 07:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ow9tlB1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyDT6-0003xw-EE
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 10:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCyE-00078I-Qp
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:40:38 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCyC-0005if-Tr
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:40:38 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-30ce6492a60so143098627b3.8
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JNqGft807Lv8IOJGLml4i3T41e3Ai7izXNrCGoQno4Y=;
 b=Ow9tlB1oSsBn5f8KrGb7qUTiqXWdA1DE5EeFgAtHRRP1rs5yESPMFkSr3gBugDoxlA
 3akcK0qrJxqApvL61k9JgInYALSbgqguLEODVtJMeW9CM2rNWuJgBx/R8lBbHCw3HJYe
 0kEtuaqVPaG8CmMxAHf7HtFOb0czTiqwDytA3Jbf6nffQTYe3KTK6bCF5RjlJkVNw1At
 VfcSkl7NWxxspLYK42ChSsNT+h8jOiCeAYwyEMv0bd9mOVDlCWADP/p2yzj07PuzpY5g
 1L8FlntFTX1NqkUvkldbdHxElWc4D5AeyhzOO16P01HbEMwM744bXsS5ZZRQDYPY79hk
 qv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JNqGft807Lv8IOJGLml4i3T41e3Ai7izXNrCGoQno4Y=;
 b=3zL4mCT0nfn3yrVIYC29cLHMzsfNeiIBJzduRkhSc9hvVe0cHkQQ0NVDpaxkQa7F1Z
 z6tcHj3NGh0qIRxFuUC2KBrzxWgKd5gvfpSYHeynx3nUYugqb7CoJvC6sz0aYID1GPDk
 fKyHlDJvLkZiME8e8q92BMnovmuMf9QmFB7ZTNkG5olt4npU/hUSzxj93aP+/00zwssv
 5quxhyMNeveozr+r3Mb/XaH1Ibz04rkklEN0wf+5PE87ncdifRk/qUNrLwrsoJWvu6Wl
 2t5ttqJINV0fHsj/b1IsnMYlFNBFcu/OO4E9gkfrPZjvkoGzIj3KeCkSUt/7WxUNRGeA
 5g7g==
X-Gm-Message-State: AOAM530kIzs74mtNWX4MxqREJP2InAZap7XQpRDDvpojlR64txwMX/Wh
 dXMnX3xAobv0NhrIPXs2xHlxszVENdGIBCVP+dPo2Q==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr25607513ywc.329.1654522834877; Mon, 06
 Jun 2022 06:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-26-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:40:24 +0100
Message-ID: <CAFEAcA80uRfdLR+4pJU6p8wDBgottFUaKDOCmgiHPj7B-qL=qQ@mail.gmail.com>
Subject: Re: [PATCH 25/71] target/arm: Add SVCR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hkb9s8uX3CuV

On Thu, 2 Jun 2022 at 23:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This cpreg is used to access two new bits of PSTATE
> that are not visible via any other mechanism.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  6 ++++++
>  target/arm/helper.c | 13 +++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 31f812eda7..31b764556c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -258,6 +258,7 @@ typedef struct CPUArchState {
>       *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
>       *  DAIF (exception masks) are kept in env->daif
>       *  BTYPE is kept in env->btype
> +     *  SM and ZA are kept in env->svcr
>       *  all other bits are stored in their correct places in env->pstate
>       */
>      uint32_t pstate;
> @@ -292,6 +293,7 @@ typedef struct CPUArchState {
>      uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
>      uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
>      uint64_t daif; /* exception masks, in the bits they are in PSTATE */
> +    uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
>
>      uint64_t elr_el[4]; /* AArch64 exception link regs  */
>      uint64_t sp_el[4]; /* AArch64 banked stack pointers */
> @@ -1428,6 +1430,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
>  #define PSTATE_MODE_EL1t 4
>  #define PSTATE_MODE_EL0t 0
>
> +/* PSTATE bits that are accessed via SVCR and not stored in SPRS_ELx. */

"SPSR"

> +FIELD(SVCR, SM, 0, 1)
> +FIELD(SVCR, ZA, 1, 1)
> +
>  /* Write a new value to v7m.exception, thus transitioning into or out
>   * of Handler mode; this may result in a change of active stack pointer.
>   */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 98de2c797f..366420385a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6353,11 +6353,24 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>
> +static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                       uint64_t value)
> +{
> +    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
> +    /* TODO: Side effects. */
> +    env->svcr = value;
> +}
> +
>  static const ARMCPRegInfo sme_reginfo[] = {
>      { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
>        .access = PL0_RW, .accessfn = access_tpidr2,
>        .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
> +    { .name = "SVCR", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
> +      .access = PL0_RW, .type = ARM_CP_SME,
> +      .fieldoffset = offsetof(CPUARMState, svcr),
> +      .writefn = svcr_write, .raw_writefn = raw_write },
>  };
>  #endif /* TARGET_AARCH64 */

What about the "MSR SVCR*, #<imm>" forms ? I had a quick scan
through the subject lines of the rest of the patchset and didn't
see them.

thanks
-- PMM
