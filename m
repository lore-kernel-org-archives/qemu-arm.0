Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45971CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:32:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMy9-0006iO-4k; Wed, 07 Oct 2026 04:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEHlc-0006Tz-Sc
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:52:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEHlR-0004qj-30
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 22:52:23 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-93e4e37788cso98759685a.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 19:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791341431; cv=none;
 d=google.com; s=arc-20260327;
 b=X1OZcLiHhjsRDmaBng+o4DCl4TjQU+KLMw8mBTZP2tVaNwsM9+erH4vUY/LAW2ACPr
 sH60x49aE3v0KBG5QIQ+7JOrQel0RmK8Dl1pyzkD5f5RpO4c2bHa7/CTD2lznSatcHZ/
 T1lXudCOxiqFKj4IzM+Od3XchSqGqPbwnawU1IeuGUAFh4JcWnCp7PNQLmNhH1gFpv/f
 4/OB5FTIXCFZjdjoadB5SjHT6uEETkK79jHZHZgRS+tyxSkOQwJjvSh4RdrA7CPGMUkN
 hwFYEZZThLG+HWJ7E5ps8JZk+Gt9ffjnqPgH4H7f0cfCVZfSE+B+KEJ7FeT8oy0p01Un
 oJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Du0zmqlVKzPTLatL8CvnaXgKMPRU+UbaiplXLwqvu1c=;
 fh=sCJwQfHnbu1h4MLCdqMioxFz2tj2KP4bcA9B/lCIrHo=;
 b=K/QnyMdU0V9JEHeE0NA/FN581x2sUKL10AP/6R6VQSK5PUgMd+EnKuXKQJbs4Aszad
 9VBEtchy+WMuMvCuUA4rVedAZLHnJE90ZmoE76kIxTvVIyW29y0w7FSr9bDJha8qjfAq
 M440SECikuUm83Ya3HMwK4JUHvnyFTc+9T0kj4f5U3IBISbeZvB+tkMSeDzdzIV0lhBn
 G3qiBZ8owy0jyi7key5NBvuHWqM/rMzxEoolN5UBWvlRhL+hZH8tmV5fJRa88D37wwRB
 J1RWFt7MqEGW/HyoC0DE4lIYJ7eetb4N/HfLG9BKZEmWmQni8NnZ93HWde98dp+ttam8
 j1zw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791341431; x=1791946231; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Du0zmqlVKzPTLatL8CvnaXgKMPRU+UbaiplXLwqvu1c=;
 b=TG2gE6CcS1KA28PnphKcoVE/B7quH9BC1atjezPdRo6ywdX31xhWxYf6VWm3ieRXjG
 TnSgQ5DirI6ybusZQ0emoJE4GaG0A4GJrSt0g/B18Hd7E+YpKtiUrzawCQ3LkeZ+300W
 meGZLBzWXnh6Nb8+WKtdWhxq+RWBkmx4Vt/KH+vmUo9qsdZKl9vE7EnmRJfFrQfzaS9v
 c5RGYNqz05l3RtPYAAUaWZWfRINg81V7f0jiIACh1bIdj6NsAZ91c8g+OCj/tPB2NKkU
 nm3fF5nLZdGghNeEFHbrhCRmvacbb9vN4ENCDx7an+2y83pvaKnrtTHtFG+8joTgZ0Ez
 qxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791341431; x=1791946231;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Du0zmqlVKzPTLatL8CvnaXgKMPRU+UbaiplXLwqvu1c=;
 b=DQOn8FAQeDen3X76UAxbLHhx9HcGXeVwqAJk376s/hoMK/t465V6FfEJj2/LMbWJMl
 x5zcPeQ2PH7S/z+3C16Adg76tsQSy7bKLupThUhIgM5fVBTuh3M4Ti4fZAax0l98mRfX
 x6EtLVEtDLgZmPxiLOmXYWWA1fdpvgFg0FLZdflCLAvCOvgStSB7HdDnfYcF6CFUMygB
 4fUGhnpewL4v/LNrzLRE2IhmQvNvCiKwIOkhahJECtPVO33tDm/oRhsWGmR7ehADNkJF
 FyNeeMd4ScPRLe8MnGv16VnHQs2IJN+2xnBmPqMREQz5E2Ylk4AS0AU5AiJNr+YlbagK
 rJGw==
X-Gm-Message-State: AFuF++m36VJWIeUeheUk7MwfvJcRZLe98aJYO0G5eaB7n49urTo6fqND
 PHwt0x81JfA0OPP6pQ/eTadlaZWzdq/LbkycvnwH0XYuaGUBRSEZjLGRavJRVqdQXX2mdu5Jghm
 hIKo36yieDs+bmE5YChQXNLuz1LWcQcy1p1ZDrCx5PsyFgNMaU6OrMJquYg==
X-Gm-Gg: AYBFou22rW1es3rNBxg4k7Yc8rPwKX0GqvvqV3DTEaBh4GCEt+MYgLlMRqUxwuzjFUw
 4SnOp+jFXGlve03S1DM2gUu9ZC5UCix2ZmqNKMs5WsCkxWG0Ahc5ZoWnh7iouqfpUPRJ9fapC8K
 6+wpzGJXsud6I8vUjLJ40C+7XJMUbxRs0l3W72Jb7qccih+2K2bwKgnULfYN1A7msWi32LZXkPC
 esSR8ik60H8X/0yCK2/HvM+sYscIAjsJ0SU9XRxkdcI+P1HkMnwzhUpmH5Ynx4+v/gz/0SerhJ1
 y5LETof3CFNf4GbgVjHRh1mkOC0Crc5NuJxRwSDh1301wwMrJFtTPqkAL2oGbtMwNzYEu0M8ico
 8loS4DHQk3Blozmdscv3mq5SITCcxo8Z7t/cbMzo=
X-Received: by 2002:a05:690c:e3ed:b0:88f:73b0:fa87 with SMTP id
 00721157ae682-8b04f40ec61mr5617027b3.11.1791292008877; Tue, 06 Oct 2026
 06:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260930094603.35969-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260930094603.35969-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 14:06:36 +0100
X-Gm-Features: AclHuK_NdCVVg5s2-ED_JoBTYVFQba1HCDUR72-OT7goj6rV8uHlsRg_KX_e92E
Message-ID: <CAFEAcA8jpReMhHKhxYpM7AVc70XZ9o0FV_iOg2mb-dOvwFg6VA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add Cortex-M0+ CPU type
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=peter.maydell@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 30 Sept 2026 at 10:46, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> The Armv6-M Unprivileged/Privileged Extension is optional. While the
> Cortex-M0 does not implement it, the Cortex-M0+ may - and the RP2040
> Cortex-M0+ configuration in particular provides this extension.
>
> Add the cortex-m0plus CPU type, reusing the existing Cortex-M0
> initialization logic. Enable ARM_FEATURE_M_UNPRIV, introduced by commit
> 285e929908 ("target/arm: model Cortex-M0+ privilege extension"), and set
> the Cortex-M0+ MIDR used by the RP2040.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
> The Cortex-M0+ CPU type was previously included in:
>
>   [RFC PATCH v1 2/6] target/arm: model Cortex-M0+ privilege extension
>   https://lore.kernel.org/qemu-devel/20260914192323.29250-3-gilles.grimaud@univ-lille.fr/
>
> It is now submitted separately following review feedback.
>
>  target/arm/tcg/cpu-v7m.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index 48b31d5eac..ac99c93ec3 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -76,6 +76,15 @@ static void cortex_m0_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR6, 0x00000000);
>  }
>
> +static void cortex_m0plus_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cortex_m0_initfn(obj);

Better not to call the m0's initfn; instead set all the
features etc the M0+ needs here. (The two CPUs are named
very similarly but that doesn't mean much beyond marketing;
for QEMU's purposes they're just different CPUs.)

> +    set_feature(&cpu->env, ARM_FEATURE_M_UNPRIV);
> +    cpu->midr = 0x410cc601;
> +}
> +
>  static void cortex_m3_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -325,6 +334,8 @@ static void arm_v7m_class_init(ObjectClass *oc, const void *data)
>  static const ARMCPUInfo arm_v7m_cpus[] = {
>      { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
>                               .class_init = arm_v7m_class_init },
> +    { .name = "cortex-m0plus", .initfn = cortex_m0plus_initfn,
> +                                .class_init = arm_v7m_class_init },
>      { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-m4",   .initfn = cortex_m4_initfn,

We generally prefer to add CPUs together with the board model
that uses them, so you can include this patch in your RP2040 series.

thanks
-- PMM

