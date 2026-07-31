Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6917EC54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:19:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpqsb-0002Ey-MR; Fri, 31 Jul 2026 13:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpqsZ-0002Eh-Tr
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:18:40 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpqsX-0003On-Ko
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:18:39 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-667923d86a7so1680644d50.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785518316; cv=none;
 d=google.com; s=arc-20260327;
 b=oqKkjvnXgI+Zt/jzdbm15cuXD2FJjNnGSnO0xAB9mNCzmzzgpC/48pGiMobiyODrBR
 YmbQJzDQ74dEc4HR0Ppo74YzgRfxOsrOK+XxZSv0Zfugb70ml7nn7Wc3qIXN+2Hb3NaP
 By/rF6u2zFFFOUhrFTjo+NFx+bQIAMvPZB9QWPCcdtJr/El7A+WFcCw5bmNPYX8cM1bU
 3+RWWq4j5et0pVJiOZVXYrafAy+q8ds9XOwiTyDZnyoXiiBnhMbZsvsFPVwIS1jvp67d
 yfNvC+0DAy0Db3E/Q7XEPxBLPIJtGG4iAprBe6UUlW+Sq5hE8CcMowoTuK9Ja/Ibjmhf
 nfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=omtbnAWJ7gT+EeQw4NcL/o7/7ierY46TkjZcU+nlTt8=;
 fh=jwiNBRydVGmtxB4mQBg99VZyJU6qcmEfVmj1HaCbv7o=;
 b=f0vHYYpHJ1iXPFu+M8aYU/xGAMaO7WO4uUYwAFE6eYSyNQIRxsy1RBLYEzGF5GRpjZ
 S1KzBuA/N1PkdZ4r6nCDbo0JNqnGOVSuk2zB+baqVY8qf5f+pPzVDzo2hJAgSn6J5DbC
 SBGxHOJ5gPM35V1pw6N6i57AyyjgUYbg3IeRFwPteULDRmoaC7aQlQDJ6I4/d3m2SFXK
 0PCpYxDWv3OZh7xIQHHfqL851EORgYdco1tK7TU0MLOKXpdsJ1xb81NhqaEejniOUBWy
 omIMeCFPDa1h2yGEYD0DvEUXxBOZ+xELlDYbVZ1iZ5NxwTFlqizLoI9IOslQtju7lZXq
 aOGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785518316; x=1786123116; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=omtbnAWJ7gT+EeQw4NcL/o7/7ierY46TkjZcU+nlTt8=;
 b=MBYRYPlH24WxTIWyNmfuYP3jSpOrwTdgYfc7MvfitGNUeGRgN/kUwcdRE24UmTXbfv
 tly85qZ2bkYMmxZElrN/6amuBwiVn41Q+HbVOTraBVCj8R+38veoBE3uHd64BzTVozW0
 brvFWBxrGSVw16+JpH5oGU9rm6+NaKJ9BaU0yTEvCHN+OaX3WpclBTwBTbceS3R9ki8R
 dp3q4dfYk/x+5VANoCAUOTwxIrUtxSn0Hj9XlpxSAv2jyT2jNivCk+xv8m+CHqnLvtL1
 lDi6MeIQXFZ9fqCb0caUYaFqGAvOjXkUH51LDJlgi97YDB8x6bNZ/f1G5khsu9cfg8mc
 nlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785518316; x=1786123116;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=omtbnAWJ7gT+EeQw4NcL/o7/7ierY46TkjZcU+nlTt8=;
 b=r4zmKeQXui/ramq4Y98a6u0QBHBlHb+Lmfn7Zlh9qMeZeRaq40akMZc2tnv836GVUw
 v4MoLQsDGOVp2NlcVfPmhauw1Hx4w6uw0tWPtLW+mIhhi1Ep2aEgiem8dV6zkOaklOpO
 NeDfuElpuLFVzep4AaORWZLlns+Jr0Dzbp83nKHYNlXNPjYc0hvNiCjXg2uiW/VQCgQX
 DJtBcBdVH+XBErMhyriHHj7AAwtm6kunoK4+F0hHygElx76ltP4b8xJ37xDRM75Ylk7X
 z+h+qRhW6eHVX8iG6s4wb8W8iXXJeyjUf/iqDd+WN9npumfEI7aWY3o8hLJuPq2cEx8i
 AqlQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0q/9PP6O4LZAUnfFGCgJdlyIcJ75Q8vDb+03q9RIwUcnKHhjMN/TFtSsBEDM23N0Ho2mA71/ILw==@nongnu.org
X-Gm-Message-State: AOJu0YzpMKP2OC6oVmIwIz4v0YkhR50pLSG8aDr92r4WwPfTiWakEqKs
 MjOI0S7u5+nt1sFwpWzzax67G+AHIXcP8WayVON7VlZsuMyobGuHRniLNFGobfSJu1GerTDH8fc
 5t55LTaResr3x1fVr3o2Mvnoa+7m3pTdRX14ePT1fVbuG/aosuarM
X-Gm-Gg: AR+sD12Y2rTtQl9fGPYggXkbHodBY8drUY8hRzJDvWglguwaSyn4F5troIDth5UxV3r
 547bqst5ZRQy70MrFjL3miNa3wGGJ0eK5a1TlC29rsbCYrJx6NdInIAMsngvyFyQdJt+bPyd8j/
 1moq6pyoc1KiVQ0Al1ptG0q6jqH5VIFNIEKAfahf8w9469GO+cQ+lx9UEPZkLumMWmcpKL0lYHn
 mm609XdqnXz4N5T2VZbNs2IfmCNEAOCameGKkOk5nTkxSTNw4L/plLn6ONT4TlIb/6wVz8Tr0SS
 88ngGo4IyXxJkVH/1Rj2jXHNv4CBObGXtMnlVn8D0AKdQygYOB63uj679QR+086IsqKSgG4cecJ
 us4ljp+Tpr9TmImKv0C5Urr7a/Hnt
X-Received: by 2002:a05:690e:483:b0:668:9a36:b229 with SMTP id
 956f58d0204a3-6694f9c809fmr516112d50.21.1785518316000; Fri, 31 Jul 2026
 10:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260724030616.76180-1-richard.henderson@linaro.org>
 <20260724030616.76180-5-richard.henderson@linaro.org>
In-Reply-To: <20260724030616.76180-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:18:23 +0100
X-Gm-Features: AUfX_myXAONAjc7DMz64_rxqPZNqjd8vJMPxypMkFWAQqdUKmqSBMY_faOiGkDk
Message-ID: <CAFEAcA-M+oQ2O_GojNK-S3iYP4GPxYMqaiZsB0t9sPvvFvazDw@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/arm: Implement FGWTE3 traps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/op_helper.c     | 36 ++++++++++++++++++++++------------
>  target/arm/tcg/translate-a64.c | 13 +++++++++++-
>  2 files changed, 35 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index c4433be2ed..f040a3fc87 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -1067,12 +1067,10 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
>       * higher priority than trap-to-EL3, and we don't care about priority
>       * order with other EL2 traps because the syndrome value is the same.
>       */

We should extend this comment, e.g something like:
   FGWTE3 traps are exclusively traps to EL3 on EL3-accessible-only
   registers, so there's no possibility of a trap to EL2, and we
   can check these here also.

> -    if (arm_fgt_active(env, arm_current_el(env))) {
> +    if (ri->fgt) {
>          uint64_t trapword = 0;
>          unsigned int idx = FIELD_EX32(ri->fgt, FGT, IDX);
>          unsigned int bitpos = FIELD_EX32(ri->fgt, FGT, BITPOS);
> -        bool rev = FIELD_EX32(ri->fgt, FGT, REV);
> -        bool nxs = FIELD_EX32(ri->fgt, FGT, NXS);
>          bool trapbit;
>
>          if (ri->fgt & FGT_EXEC) {
> @@ -1085,19 +1083,31 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
>              assert(idx < ARRAY_SIZE(env->cp15.fgt_write));
>              trapword = env->cp15.fgt_write[idx];
>          }
> +        trapbit = extract64(trapword, bitpos, 1);
>
> -        if (nxs && (arm_hcrx_el2_eff(env) & HCRX_FGTNXS)) {
> +        if ((ri->access & ~PL3_RW) == 0) {
>              /*
> -             * If HCRX_EL2.FGTnXS is 1 then the fine-grained trap for
> -             * TLBI maintenance insns does *not* apply to the nXS variant.
> +             * EL3 cpreg -- must be FGWTE3, and FGWTE3_EL3 can only be
> +             * set from AArch64, and if the feature is enabled.
>               */
> -            trapbit = 0;
> -        } else {
> -            trapbit = extract64(trapword, bitpos, 1);
> -        }
> -        if (trapbit != rev) {
> -            res = CP_ACCESS_TRAP_EL2;
> -            goto fail;
> +            if (trapbit) {
> +                res = CP_ACCESS_TRAP_EL3;
> +                goto fail;
> +            }
> +        } else if (arm_fgt_active(env, arm_current_el(env))) {
> +            bool nxs = FIELD_EX32(ri->fgt, FGT, NXS);
> +            bool rev = FIELD_EX32(ri->fgt, FGT, REV);
> +            if (nxs && (arm_hcrx_el2_eff(env) & HCRX_FGTNXS)) {
> +                /*
> +                 * If HCRX_EL2.FGTnXS is 1 then the fine-grained trap for
> +                 * TLBI maintenance insns does *not* apply to the nXS variant.
> +                 */
> +                trapbit = 0;
> +            }
> +            if (trapbit != rev) {
> +                res = CP_ACCESS_TRAP_EL2;
> +                goto fail;
> +            }
>          }
>      }
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 1780490065..ff880eab8d 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -2886,6 +2886,7 @@ static void handle_sys(DisasContext *s, bool isread,
>  {
>      uint32_t key = ENCODE_AA64_CP_REG(op0, op1, crn, crm, op2);
>      const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
> +    bool need_helper = false;
>      bool need_exit_tb = false;
>      bool nv_trap_to_el2 = false;
>      bool nv_redirect_reg = false;
> @@ -2999,7 +3000,17 @@ static void handle_sys(DisasContext *s, bool isread,
>          ri = redirect_cpreg(s, key, isread);
>      }
>
> -    if (ri->accessfn || (ri->fgt && s->fgt_active)) {
> +    if (ri->accessfn) {
> +        need_helper = true;
> +    } else if (ri->fgt) {

I might add a comment here:
   /*
    * EL3-only access means this must be an FGWTE3 trap (which are always
    * active); otherwise it's an FGT trap to EL2.
    */

> +        if ((ri->access & ~PL3_RW) == 0) {
> +            need_helper = (arm_dc_feature(s, ARM_FEATURE_EL3) &&
> +                           dc_isar_feature(aa64_fgwte3, s));
> +        } else {
> +            need_helper = s->fgt_active;
> +        }
> +    }
> +    if (need_helper) {
>          /* Emit code to perform further access permissions checks at
>           * runtime; this may result in an exception.
>           */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

