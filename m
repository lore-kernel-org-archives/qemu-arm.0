Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1472414lfb;
        Mon, 6 Jun 2022 08:59:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1qoCe9E/OG/6KylwZ02uToryZdP6ONq9EAnHuUmULJN8FLHruRn4iVDJudqc2u07Cr/Ep
X-Received: by 2002:a37:6614:0:b0:6a6:9639:77f3 with SMTP id a20-20020a376614000000b006a6963977f3mr12313499qkc.516.1654531196259;
        Mon, 06 Jun 2022 08:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654531196; cv=none;
        d=google.com; s=arc-20160816;
        b=eEh+60N5e1ndriiSaa2UDs1KRM38Tp4GxOPNYPxmeTyS55LgYLDV0Ea96pJd0S/fc7
         FA330jZEOTOUIXA6gJe4YXcqvN4LxJLyMWICzmU/bC7EKr5X+vjxUlfjpCJr4lTTQRHm
         dpcpk8/p+iDTI6GQ9rDV56FQdaYm/dDXbxC4mcI2WBar7t7hzqI0jGflkboDdPZHI2Zi
         Un3brb2v+CC/XgjWUd3pYPcCSPw6VxCvZnH5QcDHi43QxScLlnPxR7STDCouLr8GeSrD
         3ts97lEhu4ZWzMcx5iQPX43rfysT+VUEuGO7IgnsIw1z9EBKplOnXrnbrXTJiEp9vkYl
         +DEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mxtE6wlon+0JeGgXupZe83o5bZdHdd7Uqv+tTpGmI1I=;
        b=go2z4+ByRYxd8tU3Je54bLHdRHdVIL3RF45pWknSy1bKY8ao+L4zIQKc4EoNubuKfE
         MqDoId9N50gTcLSDcGvO1BaX5cD5SdQ5bkwO5dweAkmCbhMWHMT/FtyHb/KSLEIF1N+D
         /+fo4w7FAO9oCcIfG9Vs4Q9fgX9kIEHeoRAXn3UNvMdXlJssvrKAfqaCS7L8Y3/vMaGY
         1PVSOvKnOP+J+0aoLAMBlwBdovi7+riKD5X1jQetNX0ezRvUfTpSATVudyH6OJCWFSBD
         OQsiCwdZl91sBBroVKxP6S5fp+0FK60pnK4RU88Nm23BUmYGA+7FGUI1ZZ9tTZtNudmP
         EWKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6hJqikw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b006a372790cd7si9210978qkp.300.2022.06.06.08.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6hJqikw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyF91-0002Gu-Mh
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF5U-0004IA-Sb
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 11:56:17 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:33556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF5L-0005py-Gm
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 11:56:16 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-30fa61b1a83so142010717b3.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxtE6wlon+0JeGgXupZe83o5bZdHdd7Uqv+tTpGmI1I=;
 b=F6hJqikwKzcNKj5FB4oyxXPEG2laVNuO/LxoPtaX1MnDgNPI1MBRjuTiWPEMGXOdh3
 HCUTP4WLfIAz2blboVdKvSNgA1Ojm/LHrSbWqizvEsj+rsZtNhJKlqe5K7/4knOUSXQw
 UifWRQ13l9EFr/e3LO/lmF8YXZxogwg5rs3xBGOvVFt9n1bLYfmROxbkdeuZRryVmibh
 cQX+MNqymigYJjxlk5UCXOkoXx01GnHNkG8TrxQ1GiJmL+y/FZagnMzykuWG6BDBTwDF
 SwVvABq7jOuY3MdLQ1aXHL/ScLhRiCGbGTAGXEXeRnz9sO9eThASH0TUO9x1AhsFNGlU
 zdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxtE6wlon+0JeGgXupZe83o5bZdHdd7Uqv+tTpGmI1I=;
 b=X6mHtWZSivqbaXVRIXYZVA9vckcXZ12tpQ9QGn0UnqLL7DAvdw5iV9XJfQHsssCa7B
 I2NtVFN14MXaRW+XWJeiWWr2wxlKAcGQxJdZ2UJlbwaSzjl76hJngp66OP03isPX6eCO
 CA1o2ivyLHJ4Gq6Podyw11r3vDO366qDAhOHhCKNnxgOfBMuoHePi2vfErWHT4Tvz3MW
 G8nhK0V2Tmi7LSeqdYyGDLOhPjt0wdTNP5HPVvNI6YUQNA/PbWXuStfXzhjvgOYNWfUv
 DaABiyw/Icj4PN0Es/FRnEhCf9qitxjPja0hjKS1R2rcpz4KH394CCr7yar+l+uHA2/T
 HKjA==
X-Gm-Message-State: AOAM5313b2Bh4lEn5+6OGvenrOR8yAxz25skCiPnIcyk5oN8XVshr8l/
 6myCkEMRKDW41R3cmrjl1NBn3EOvSkAZgUmWKVrjbw==
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr26222645ywb.64.1654530964779; Mon, 06
 Jun 2022 08:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-28-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 16:55:54 +0100
Message-ID: <CAFEAcA-Zt7pREK-AVDN0yemCawJceQo5PUhdr_8jG7WL8-+NOA@mail.gmail.com>
Subject: Re: [PATCH 27/71] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ULn/WtdMaLHO

On Thu, 2 Jun 2022 at 23:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement the streaming mode identification register, and the
> two streaming priority registers.  For QEMU, they are all RES0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4149570b95..f852fd7644 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6355,6 +6355,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>
> +static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                 bool isread)
> +{
> +    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
> +    if (arm_current_el(env) < 3
> +        && arm_feature(env, ARM_FEATURE_EL3)
> +        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}
> +
>  static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>  {
> @@ -6412,6 +6424,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
>        .access = PL3_RW, .type = ARM_CP_SME,
>        .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
>        .writefn = smcr_write, .raw_writefn = raw_write },
> +    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_aa64_tid1,

Shouldn't this be PL1_R, not _RW ?

> +      /*
> +       * IMPLEMENTOR = 0 (software)
> +       * REVISION    = 0 (implementation defined)
> +       * SMPS        = 0 (no streaming execution priority in QEMU)
> +       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
> +       */
> +      .type = ARM_CP_CONST, .resetvalue = 0, },
> +    /*
> +     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
> +     */
> +    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
> +      .access = PL1_RW, .accessfn = access_esm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
> +      .access = PL2_RW, .accessfn = access_esm,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
>  };
>  #endif /* TARGET_AARCH64 */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
