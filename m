Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp173803wrg;
        Fri, 7 Jun 2019 06:07:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynBb2eDBC9SfHIrwThpgFGwjGIJlfJKYonhonYTHQgiD3LzJGvKIA613TUuw7ytfgJY9w9
X-Received: by 2002:ac8:3742:: with SMTP id p2mr38399213qtb.121.1559912833601;
        Fri, 07 Jun 2019 06:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559912833; cv=none;
        d=google.com; s=arc-20160816;
        b=gdOiI2hcdLIXQUjBUBGmSZRDMOsh2Km9VKCJtqX4LzKPag6YZUHK5BeIEqodFPG+z/
         AAtRVHTZrII2qJlkPxbL8I6DAUcC13fvCeq1F7QsYzJwsw/OTK3ygD9lCSwRUdNRrf1p
         Vq26WfLDdpLei48whNomCNH7UA0qfSJVBnh3gcVESEyDTSnca5NtLb9QlVl1U0ATG9G9
         IICsbGThuSQvlp6XAq6fNZttssvYMLgtMexV8DZVlccvVs0rJ3ewbsswp0Uqygc1EDhh
         dDi7plHB66QAUiYov9lPjCGFeQxXOcD6rnpph9EfCPsAUMxTwjnK1njQMic8CVqRzwzT
         vq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cI6qVar/GplES/T834XGOnsU08ypLGNAaozaLc69CYE=;
        b=q4tu31+0ojAnZw+5CpYAa9SFDH24K3JGP7HOuV8ZpERnQLQtCJKJ8AQPu4NG3gHzs1
         5fne91cAuCiwtxS0FDcrNUhDBYiRkSIPe6L57exPKl5578f6361C0i+cXCHl6jAJoMHQ
         tyWWC+VR5wRq7RGc+YzKb2FWEhhy2oB0OBb1ywyRIugI8rWz+1DA7DrfZLr3uekXkXNj
         fyzSa+nCuQfUH+o5s9guVhqA5o9eNKbwtlLoWxTn0IUGKeMmPXufAIB/+ULEawrYwE1p
         U2ypr9dUg+nzEc/CinhsWJuswm7EqBCpVttenxxEXy/ZD0C6X/KIJYTkC33EWWxwykUF
         LZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cPbPscjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id r54si1262593qtk.10.2019.06.07.06.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 06:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cPbPscjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZEaP-0000OF-5U
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 09:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZEaF-0000Lp-Lb
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:07:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZEaA-0002np-6o
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:07:01 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZEa9-0002WW-TP
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:06:58 -0400
Received: by mail-ot1-x344.google.com with SMTP id n2so1731955otl.12
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cI6qVar/GplES/T834XGOnsU08ypLGNAaozaLc69CYE=;
 b=cPbPscjgw3ZW4z/lKPYMTC8Z+R3xs00PZ2OoSsg+UQuF7Sx/ox/zkAJIjn2/Mwsa+G
 1vm9TQfe3VNE/4gwxKt2DDRJXWckXLu92DeOdB5E7GZQ6ZoCGJbGpM6I/ZaWPHPzm0gB
 gxYUI9LF8x9yjwfFnoYxGnX4EOOlqr90rE3TMW+SAh4XtYyD6Wlul1uJVcyL5Wn6zdSw
 F1MUfmmme9ncwo5KoNxj8o4Fs1+cgEmnH8eQM1IjkCGhNqxuxfO1S0qjlsIfL6ZQKRIK
 PzC28wlPBwJzMv8gY3OFxiDWTa6zMSScBQBh5it4m5l9ylzaOF6CvfOerQMa2yHLL15L
 5k9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cI6qVar/GplES/T834XGOnsU08ypLGNAaozaLc69CYE=;
 b=Ub6jCWAdlcBqsaf17s67JAW5gZIr+a1kz0hfDWzvqpV/3pHFhJ6EzizgszE899l/aX
 QQH04uwopxChwv4+2NdyfpW4KMfmk3bOCefWNXgSyt4mlkKDCJHE2mq+Hw884RrNMata
 EGF8hGJuJ1e9wraL4w+D5w1Qjl0nITBLuxxZlkCjB2cz4nQsMRTpuZAuwtLA6soilV9d
 IzSap1Mxku+NUUjIeXf7m6so93U8MeEkI6NFj6mqAVdBeRqlDEYuYJP5BVMcAZA8C51q
 xZDdLD4Q5S+lmUPhoJd5A/fv/PCRa1PW0ubDM4Rn9qDXN1Nz3prxkGdTqNcpAEyNx1Ke
 fEwA==
X-Gm-Message-State: APjAAAUFpNAZAhKOzLkCg5u68H0mJlr7yImxJyeA1P1ljGaObsO0mylO
 FgCeNyrAMmWgPsweaaTZU4BRzOZNQBZZEcJ9L4um9U83nCs=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr19503710otp.91.1559912808666; 
 Fri, 07 Jun 2019 06:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190510110357.18825-1-peter.maydell@linaro.org>
In-Reply-To: <20190510110357.18825-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 14:06:37 +0100
Message-ID: <CAFEAcA_FnpYF_AegaYUqfPhr_k9ZXUS=JCamtD3+nSvonHC1vg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2] target/arm: Implement NSACR gating of
 floating point
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOd4LpfA6Ubc

Ping for code review, please?

thanks
-- PMM

On Fri, 10 May 2019 at 12:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The NSACR register allows secure code to configure the FPU
> to be inaccessible to non-secure code. If the NSACR.CP10
> bit is set then:
>  * NS accesses to the FPU trap as UNDEF (ie to NS EL1 or EL2)
>  * CPACR.{CP10,CP11} behave as if RAZ/WI
>  * HCPTR.{TCP11,TCP10} behave as if RAO/WI
>
> Note that we do not implement the NSACR.NSASEDIS bit which
> gates only access to Advanced SIMD, in the same way that
> we don't implement the equivalent CPACR.ASEDIS and HCPTR.TASE.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * fixed bug in cptr_el2_read() that meant we were forcing
>    HCPTR.{TCP11,TCP10} to 0 when they should be 1
> ---
>  target/arm/helper.c | 75 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1e6eb0d0f36..f1fcce0313b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -928,9 +928,36 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>          value &= mask;
>      }
> +
> +    /*
> +     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
> +     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value &= ~(0xf << 20);
> +        value |= env->cp15.cpacr_el1 & (0xf << 20);
> +    }
> +
>      env->cp15.cpacr_el1 = value;
>  }
>
> +static uint64_t cpacr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /*
> +     * For A-profile AArch32 EL3 (but not M-profile secure mode), if NSACR.CP10
> +     * is 0 then CPACR.{CP11,CP10} ignore writes and read as 0b00.
> +     */
> +    uint64_t value = env->cp15.cpacr_el1;
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value &= ~(0xf << 20);
> +    }
> +    return value;
> +}
> +
> +
>  static void cpacr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
>      /* Call cpacr_write() so that we reset with the correct RAO bits set
> @@ -996,7 +1023,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>      { .name = "CPACR", .state = ARM_CP_STATE_BOTH, .opc0 = 3,
>        .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 2, .accessfn = cpacr_access,
>        .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.cpacr_el1),
> -      .resetfn = cpacr_reset, .writefn = cpacr_write },
> +      .resetfn = cpacr_reset, .writefn = cpacr_write, .readfn = cpacr_read },
>      REGINFO_SENTINEL
>  };
>
> @@ -4681,6 +4708,36 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
>      return ret;
>  }
>
> +static void cptr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    /*
> +     * For A-profile AArch32 EL3, if NSACR.CP10
> +     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value &= ~(0x3 << 10);
> +        value |= env->cp15.cptr_el[2] & (0x3 << 10);
> +    }
> +    env->cp15.cptr_el[2] = value;
> +}
> +
> +static uint64_t cptr_el2_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /*
> +     * For A-profile AArch32 EL3, if NSACR.CP10
> +     * is 0 then HCPTR.{TCP11,TCP10} ignore writes and read as 1.
> +     */
> +    uint64_t value = env->cp15.cptr_el[2];
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +        !arm_is_secure(env) && !extract32(env->cp15.nsacr, 10, 1)) {
> +        value |= 0x3 << 10;
> +    }
> +    return value;
> +}
> +
>  static const ARMCPRegInfo el2_cp_reginfo[] = {
>      { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_IO,
> @@ -4728,7 +4785,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
>        .access = PL2_RW, .accessfn = cptr_access, .resetvalue = 0,
> -      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]) },
> +      .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[2]),
> +      .readfn = cptr_el2_read, .writefn = cptr_el2_write },
>      { .name = "MAIR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[2]),
> @@ -13527,6 +13585,19 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>          break;
>      }
>
> +    /*
> +     * The NSACR allows A-profile AArch32 EL3 and M-profile secure mode
> +     * to control non-secure access to the FPU. It doesn't have any
> +     * effect if EL3 is AArch64 or if EL3 doesn't exist at all.
> +     */
> +    if ((arm_feature(env, ARM_FEATURE_EL3) && !arm_el_is_aa64(env, 3) &&
> +         cur_el <= 2 && !arm_is_secure_below_el3(env))) {
> +        if (!extract32(env->cp15.nsacr, 10, 1)) {
> +            /* FP insns act as UNDEF */
> +            return cur_el == 2 ? 2 : 1;
> +        }
> +    }
> +
>      /* For the CPTR registers we don't need to guard with an ARM_FEATURE
>       * check because zero bits in the registers mean "don't trap".
>       */
> --
> 2.20.1
