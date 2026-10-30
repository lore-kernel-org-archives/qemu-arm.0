Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2898606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l9ij8ay8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMjFE-0000bl-HE; Fri, 30 Oct 2026 05:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xMjFC-0000bU-33
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 05:49:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xMjFA-00027m-9D
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 05:49:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48e0d1da913so370471f8f.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793353790; x=1793958590; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LHbh+1Jnn6glRo1MQNGzjEqhZoDb7S3h6VZGlHJo/Ls=;
 b=l9ij8ay8Cx4Qe1l+LKs65yISiLwEsT8MOzA6Kri0GUOGxlnGr1rXn8Bb9YHlNiTfS3
 cCJwawdmNvUsN8GBEY/FPnYRKVrK+zvD5ySaSFMkgoWJYvNYXQL4DtkXyaYY1tVUaIsE
 PeI+B9VV3rYxLZu/2jHrdzTE/m7Y+qnmirUberGh9FXJGDZJ3CFqy+hSz/X91+QkIENz
 IYuqPiezjRImPXRPocYtJeJo5KLU05IZ/xuMCIbbpcAF6AWk8An3jif9qnVYZxgn8TTm
 7fuP0BkcCNZbz77rrvuBGIkW+lhyxiwboab/BeUNDc6SEC1YW8+z9bsIc6Hwtyuvz71W
 64bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793353790; x=1793958590;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LHbh+1Jnn6glRo1MQNGzjEqhZoDb7S3h6VZGlHJo/Ls=;
 b=i4c2D95hYpIOB20GwUR1LZ7vjH4rrz7E5Qz2O6+Me+KeHYY1ifWmIQs621Ff2Z+Kdz
 jj7u/PnB7ztrZmy0mxKGDj1rmtIBMt6R2mGqZmdkuIQzN5Wc1Y19xhT+ARQiok9vy0yL
 3cH+Q68sTPh4phD+DeFQr1OoholAg8ic3IAQ2HnbU87OfGrtYaKil3KCNdnuic0rgj8I
 sgXu2GXdQSkMAfMpNVjudOHOtYbHkxSNb1e6DdwGVS7K1yTZiywfmHtas7Z0jFF/Ql5v
 lal+7Hv9+bLJVH90iKtlmvicZfsK+VLr20+y/aUsC8Zqpi783sSQfMU7QQCQxvoORx1B
 ofCA==
X-Gm-Message-State: AFq9FYJHlpvSXOElUXUB4mf4jNzx1DfBo9e9patOn1O6l/NhzdJd3KDu
 wXXAMYXC7FULOPEFNYoSfjpAVfXlooesKoS52iijB4V3di3lxsCEhpec8TihghiGVTU9Wg7KRhD
 r011sAzI=
X-Gm-Gg: AYBFou2eqgXeLGLRJviKZwRsYzfPVzyIC211zFmjPN7RX/bWHp2zq6O5G6PBDWJxXEJ
 2W/Szz80kYYoScRA0U8LEPEq6kcLuNdEA5MCHY1B/4NjKvir7jAF0hv8LcC2/Q1kB6aPgo7xSi2
 ofgbkJnwK2SXZ/FW8Hp6cZbMH25wLZW3vr+UBuxEivsM4t0lfF8fAJf/ri5oWjKhGEr+NXf1HG0
 L16jGzuA7n/qgMwvdlierV2W4a5jNKRuMshGUvZ5TYxU4VHx06tDyn8Do35UPfwGY71yyKajFZW
 DLEbPi5yLoyJq7gv75b2nUZIM5yALqhTtDnD4RuK3pC5VyHaIuPWe4LQW+GanttlcRBC2ceqaq8
 unespGKAKH4NF3Zq+QfGLtl6+X8uOWI7AxSau47Ak6ruvXOXgr8q9cX9rgTG9w4QbxI/0BZB4dF
 JDjvjhSyY8enx/by2r1pgkH/z941LPrpK/X/dUNsthuu5RQ2YRU62rkpqi3a8IzPe0Diy+eMn5N
 w++zj5auWYM0nzc9eQ/QfrHzfYqYcdVZqT8VPs+DDygj6U9+hoohPCxTMUdlB1eM8Wr02fzU/Vn
 srrWq1KA3/Qf23xdHxpca71yNBKOaUI=
X-Received: by 2002:a05:6000:4010:b0:48e:55bd:9cdf with SMTP id
 ffacd0b85a97d-48e6e2dd3a4mr4948431f8f.21.1793353790429; 
 Fri, 30 Oct 2026 02:49:50 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:d64d:812f:6ff9:48c0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8bd8esm2177654f8f.42.2026.10.30.02.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:49:50 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:49:48 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org
Subject: Re: [PATCH] target/arm: Get HVC UNDEF cases for Secure mode right
Message-ID: <auRoPIM25ZVH4Smb@linaro.org>
References: <20261030092815.573973-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030092815.573973-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 09:28:15AM +0000, Peter Maydell wrote:
> In the pre_hvc helper, we have a "bool secure = false" and a FIXME
> comment that we should use the actual Secure state. This is a
> signpost to the fact that we're not getting the UNDEF cases right.
> Specifically, we get most of them correct but are missing the ones
> related to Secure state:
> 
>  * For A64: HVC must UNDEF at EL1 if EL2 is not enabled in the
>    current Security state
> 
>  * For v8 A32/T32, HVC must UNDEF in Secure state, if EL2 is not
>    enabled in the current Security state
> 
>  * For v7, HVC must UNDEF in Secure state
> 
> The v7 requirement is identical to the v8 A32/T32 one, since
> there is no Secure EL2 in v7.
> 
> This fixes a bug where HVC should have UNDEFed but instead trapped
> when in Secure state with Secure EL2 disabled.  The bug is unlikely
> to affect real-world code, because only test code puts itself in a
> situation where HVC should UNDEF and then executes HVC and requires
> it to UNDEF.
> 
> This was noticed by Coverity, because the "if (secure && ...)"
> check was dead code.
> 
> CID: 1689834
> Cc: qemu-stable@nongnu.org
> Fixes: 35979d71c401 ("target-arm: A64: Emulate the HVC insn")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/tcg/op_helper.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 6a673e5ae6e..3d3c850a198 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -1295,8 +1295,6 @@ void HELPER(pre_hvc)(CPUARMState *env)
>  {
>      ARMCPU *cpu = env_archcpu(env);
>      int cur_el = arm_current_el(env);
> -    /* FIXME: Use actual secure state.  */
> -    bool secure = false;
>      bool undef;
>  
>      if (arm_is_psci_call(cpu, EXCP_HVC)) {
> @@ -1306,6 +1304,8 @@ void HELPER(pre_hvc)(CPUARMState *env)
>          return;
>      }
>  
> +    /* Note that we have already UNDEFed HVC from EL0 at translation time */
> +
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
>          /* If EL2 doesn't exist, HVC always UNDEFs */
>          undef = true;
> @@ -1316,12 +1316,19 @@ void HELPER(pre_hvc)(CPUARMState *env)
>          undef = env->cp15.hcr_el2 & HCR_HCD;
>      }
>  
> -    /* In ARMv7 and ARMv8/AArch32, HVC is undef in secure state.
> -     * For ARMv8/AArch64, HVC is allowed in EL3.
> -     * Note that we've already trapped HVC from EL0 at translation
> -     * time.
> +    /*
> +     * In ARMv7 and ARMv8/AArch32, HVC is undef in Secure state if
> +     * EL2 is not enabled in the current security state (which is
> +     * always for Secure in v7, as Secure EL2 doesn't exist there).
> +     *
> +     * For ARMv8/AArch64, HVC is undef at EL1 if EL2 is not enabled in
> +     * the current security state.
> +     *
> +     * Because we've already dealt with "EL2 not implemented" above,
> +     * arm_is_el2_enabled() is effectively always true here in NonSecure,
> +     * and we don't need to explicitly also check for secure/non-secure.
>       */
> -    if (secure && (!is_a64(env) || cur_el == 1)) {
> +    if (!arm_is_el2_enabled(env) && (!is_a64(env) || cur_el == 1)) {
>          undef = true;
>      }
>  
> -- 
> 2.43.0

Looks good to me

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


