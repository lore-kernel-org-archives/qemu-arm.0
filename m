Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F786606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E2jxBgMp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKEP3-0000sC-0p; Fri, 23 Oct 2026 08:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEOq-0000qi-JG
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:29:33 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKEOm-0004TB-0h
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:29:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8b0a28a720aso8136577b3.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758567; cv=none;
 d=google.com; s=arc-20260327;
 b=KJB9xB24gxnOMa/qZzhJslx7e5z94UU74ybx+O7v/YXjMxTOcu0J9mqFDN99wCy6Su
 a67RhOViZ+6yeErhGQUA8y8r7k1YFxglDbP2eHiDSBQo1qFwviEHwJ3Lfe5hQQhxWrBV
 S3BlIrelfpIcH7f1Y/CSiw4MoyS3P90yhMawTqTe+JnFyi4+AAVyI0gakiZB+iBufMOd
 3Xxuyv3HawK+H4NbO8ygvFFL17P4ehEPFMXFGjZSnYvlo1Qaun4W2wEWl/mMP91QBt7B
 86chuThuHLF3/fB6dP9xaYkZBbSzxuVZS8VP8YDARE7/xl2R+c3LQWDy1TUrs/aPWbYk
 +P/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4YZAGZDx7IhYcqVvBvHlwEMnU40NIq3uzYxo/jNYcu4=;
 fh=4qLFARACTaiov6u+87KTt5VCNcms3YoVXWnS6JOkets=;
 b=oqlbdvARNthcYLRE9VGKPQuBK5KCsmZzI76NgucdUtAUWt3E8+zhmiNUTBPSKSGA9Y
 jECsiZSm9YPwASN1UjcCDFX44iWA+YiTlM+v0C0M3cNxQwwPt4mTIYF+k8oQcDO/uFXQ
 PzXPjV+1cbtCDzZhXjxjyJb5z2QD4s8mXjLqznDBCn8rosajySgGdkxPwp7hep43Q87w
 opTTsKuz3m49gkn/zVOYO4xllNCEiIriZfc4UchfyxBZcaxjcEINGz6/uLss0bjCruWV
 zF+1Jk77E8TU0RSMg7wL97JRFSn9qJzKNSpH560VozfEhi5/ezP/SnxWxzNDXd6G4jEg
 lniQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792758567; x=1793363367; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4YZAGZDx7IhYcqVvBvHlwEMnU40NIq3uzYxo/jNYcu4=;
 b=E2jxBgMpdrIP2Ys7tTSzPPHe5nCYzXi03DKee27PO5S3orJRXEjHBxm6WskNFwHgcn
 J9pWKBro3baggIoNXCoooP5Mm8Khn4pnNpixMbSTwm46WWN2IhUWRkJMvkAZNIF2l72W
 odIVIyo/zE9y7RkeQDk0txukll3u3jw6KlMpmnKz173DxvSVE3Dfcw4G4nMTr4IgSQ3d
 io8kx/aXyQwI76PZG+0CBZDIzcB7kaZhLv+MgHq4glX+83i+FUUAA5OBh831RQHefFM6
 i88yEhPu+Hc3kiA+nSFpjP/iGuMOXdJPJpA7pH8x3sBLOlrY8e9EsoZMtSdMM4a3UJLE
 f+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792758567; x=1793363367;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=4YZAGZDx7IhYcqVvBvHlwEMnU40NIq3uzYxo/jNYcu4=;
 b=cXGHwRQZlTEGqB+IxGlGFU+aLFSngurSOkNGOpPNFiBsCopOP7WBdsXoBZktBSfOKL
 DKUNNtIYBr7Dn/6RHEugrVM4O6w6h+WzNQLSjnyd0mQR4427ztuyufuT3WL9gL7cFUMV
 F0IsFTMQKhjkWNy65d5yXonO/kSJfQ8bL8pIoUBzaapcSAJ0VB6k16+cUYG9eAwmnERr
 Q2ooU578Q1lo3OPMu28gMo3eao7TL9d6Qi5DV8oE7z0cP6tAA2b988n+U9SahtJMPLsh
 YPWTZwXpq/E8rNH5z3S/dRmCt2S1r3ALkbksQ3TmdP6em1llOabVGMSrDfFSsuEduBHz
 DGDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxZF+b5PtaBH8xYxHk8bIDoKKKHFF0jk/NUPcTFV5fhf0IwV1tlQ2ZcMxh985kfs9QJ5hYGADcHTw==@nongnu.org
X-Gm-Message-State: AFq9FYIRLoDqQp7p3jtE9WBD6RkiUdbDrZR7lT6DvGSIvS/nx6Gaepzo
 wWCPf3iYw4/kwVDfWzICQpJrCRYf0/+I5ax1eL/5nd2LH7GxHw2wHp8de5XP94kpzmYEQiTOikp
 OuS7/dDUJL+4BnLyuGf1JHHsDckjKY4v21ZzvDescBQ==
X-Gm-Gg: AYBFou1R5xviS5ZPSFge8tg/K6hK+bY2yIhnTComZD09kXZf95f0FI6DGEP5J04sdB7
 7hyCIBxuPXa64m+++9NEV7uE4Ck4XXrholkSibYtUoW0tfbRoFkfReAJWiQBwJNuhJvSxgUGBED
 pvZTvwnxF0Kwt+Dpv5FV9VRiI5+PuY+iIUYdiHQN7pojYymzI++cJY+SoLLwQ2R5jX7jc9bKhhH
 ui0DfKfsM5dEiZC2cJnryEpzCSiArOuml/mkWyNqWuQSabUcx1/HoXjsXZzBgmZjXNPuuUg+DiM
 qA+X6odFmzMugSMCo52kg5EavCKDeOnDy6HqP7Qc8QntHtxsURL+ETHZzu9I02S+Jf8HQIWKeRJ
 wm3bch4C2LxspnL7h3CAQRTt+UVL1HrsYdf5FMKh987v//hl/7bVqCRCsRxAb+DOVthfTr2lMz5
 bKl2adGuQlYe9J8hz8xtjUptYwTLVQYq9GtOGJIK12BA==
X-Received: by 2002:a05:690c:f07:b0:890:c0ab:2303 with SMTP id
 00721157ae682-8b157cf460amr16460077b3.21.1792758566544; Fri, 23 Oct 2026
 05:29:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022213647.21665-1-mohamed@unpredictable.fr>
 <20261022213647.21665-7-mohamed@unpredictable.fr>
In-Reply-To: <20261022213647.21665-7-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Oct 2026 13:29:14 +0100
X-Gm-Features: AclHuK9wBflQsqTb9s62TrIDbGQoLFyMTLecgm1h43H2ahBknPaMeV-aAaHCu-0
Message-ID: <CAFEAcA8B8iGW0hcfyOSzCZa-wByuguGS8c2NeLP4_u+dVVJLCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] hvf: arm: fetch more features
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 22 Oct 2026 at 22:37, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> macOS 27.0 has some more feature registers available. Fetch them (but not using the values yet).
>
> Also fetch DCZID_EL0 at the same time.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index e813f14ed4..3426fcdb86 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1142,16 +1142,14 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      } regs[] = {
>          { HV_FEATURE_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_IDX },
> -        /* Add ID_AA64PFR2_EL1 here when HVF supports it */
>          { HV_FEATURE_REG_ID_AA64DFR0_EL1, ID_AA64DFR0_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64DFR1_EL1, ID_AA64DFR1_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64ISAR0_EL1, ID_AA64ISAR0_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64ISAR1_EL1, ID_AA64ISAR1_EL1_IDX },
> -        /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
>          { HV_FEATURE_REG_ID_AA64MMFR0_EL1, ID_AA64MMFR0_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64MMFR1_EL1, ID_AA64MMFR1_EL1_IDX },
>          { HV_FEATURE_REG_ID_AA64MMFR2_EL1, ID_AA64MMFR2_EL1_IDX },
> -        /* Add ID_AA64MMFR3_EL1 here when HVF supports it */
> +        { HV_FEATURE_REG_DCZID_EL0, DCZID_EL0_IDX},
>      };
>      hv_return_t r = HV_SUCCESS;
>      hv_vcpu_config_t config = hv_vcpu_config_create();
> @@ -1191,6 +1189,22 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          }
>      }
>
> +    if (__builtin_available(macOS 27.0, *)) {
> +        static const struct isar_regs {
> +            hv_feature_reg_t reg;
> +            ARMIDRegisterIdx index;
> +        } new_regs[] = {
> +        {HV_FEATURE_REG_ID_AA64ISAR2_EL1, ID_AA64ISAR2_EL1_IDX},
> +        {HV_FEATURE_REG_ID_AA64PFR2_EL1, ID_AA64PFR2_EL1_IDX},
> +        {HV_FEATURE_REG_ID_AA64MMFR3_EL1, ID_AA64MMFR3_EL1_IDX},
> +        {HV_FEATURE_REG_ID_AA64MMFR4_EL1, ID_AA64MMFR4_EL1_IDX},

Spaces after { and before } to match the existing code, please.

> +        };
> +        for (i = 0; i < ARRAY_SIZE(new_regs); i++) {
> +            r |= hv_vcpu_config_get_feature_reg(config, new_regs[i].reg,
> +                                            &host_isar.idregs[new_regs[i].index]);
> +        }
> +    }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I note that we now have three places in this function which duplicate
this "array which repeats the definition of struct isar_regs, and loop
around calling hv_vcpu_config_get_feature_reg()" pattern. We could
factor that out into a proper typedef for the struct and a helper
function that does the "iterate through getting the values" part.

thanks
-- PMM

