Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25033CA5FA1
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDgf-0008WT-9V; Mon, 28 Sep 2026 11:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDgd-0008Vo-Lh
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:54:39 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDgc-0005wk-4a
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:54:39 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8a8f3b61da7so17288587b3.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790610877; cv=none;
 d=google.com; s=arc-20260327;
 b=mmyiy8A0GwRHPcGM3IseH9U/9OoUv0R1DLiEO6R+0tSXAbUduuRxQYAafrH2KM23Rt
 31QuXbAfeBYcjDd5WmVGz9KYUHwOMwpUKurbPhzkmPKcSn7iPu26H0jkfTovTu2fK17y
 0z0h/FMoFmH41Kv6Tjd4yV4irmLs2eEi/NYtZzmDEPG+/dtSJXfm/E1d81NTEyufF2yN
 AoBCoE6O02RgL/gwpIwQBJjBN9TLFn4TztHBd6mm8nYZY0sLxhND0xdRku98SjRlgd6Q
 6vEtKOk3V6MoK6Gb8ta8GP4v8m+miz1Mm9hPhOJmxqgzzYF7tjNBeQM9VVtppls0y9Rk
 vfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ax2F1D2PX1uU1uXDqD9Xp0uVTUshi6eeZ/YVpCH+MSs=;
 fh=0xOgKzHD+JqEQe9Q3lV5FFKh8UOlVCUexajOssHgRLs=;
 b=IwQanSY+YUR/Bm6ckamP5WVXRv6n9vzotfQzx/oexaOKniSSGRWFFvxcbBkWhuXGgK
 JOcBP8jeSZDIDSSty2uRWsPbamv7CG2Nns88sMWm5elkMF++5E6Fn9kBp2R+O1IWPhTK
 47k5LqCfDD2WkxUJFKgXWkwkYBU5i17gScMaRRQTN64rOVy/fMW/PlqUH2oOotr4TZOl
 1ozSdKK/ALJkSXcCprSDEzpdzUpEj4QycjtzBJIdGOrbi8X75F+ScsPTfyafQMhWy/tP
 DkPfzi0hABi3si39I5ApwSn/vT3/ii/S4tKj/j2Vttoxx4jZbOFgNVK3ecig1+xvuu7p
 P6Zg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790610877; x=1791215677; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ax2F1D2PX1uU1uXDqD9Xp0uVTUshi6eeZ/YVpCH+MSs=;
 b=IeifQbP0oCXO3HsOFTCY8mrF9OgfxGfI8OW03qwml4bNSbiqXfMkeukIaYwXJf07Tv
 npUG3HzcywJzwutYi3B4vMHjPbLsElFP1yOPABCUo6bLDgYu3jNqkJ2Y2WWrbiyxoAVP
 9Kz3WpVjvAEdiGgJnGeotINPyzRMDdJF/sULWziOhQM9uqPsPBMCNasKlnNOigyyA8sw
 gWFIgyNMmnm0frS+/ASqZVAOk1f8l3itN2q9s4qGNn1kdJuVtiWnNaWTnsZ05HmvpRw2
 3iy+kKsoRUARQL4HEhPKP0H60TkrDKsA0SQ0SeNg5dSXikK++2IRkgaIDcUl32wHZCSX
 OW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790610877; x=1791215677;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ax2F1D2PX1uU1uXDqD9Xp0uVTUshi6eeZ/YVpCH+MSs=;
 b=b7ZDjgIdfLvEB7wJCQTXZXT3bsB9hyzyetd4R2ArR+8lN60lPogzq+DcPLIEEPTni7
 T0eAoHhHRf8qHNPrEMeKpVzxvP/RP36pFNmDzV3K8KU3PGYefnSL5UMyuth7tFz+8ls/
 oQh45EgeJOZYND25MfuF8bIbuzsgInPEQ+Rpw408H7EIFu6LuSvFjxXiCWOsb45Qzy54
 rYyHZoNtbJLXMRq8TmyTdemM0Iz5OcyCZNWzrBIGe+ULMV3aOsADIEoGTppJHzbMhd6Q
 Hp30oms3LGG/050wVLvoM6mDtaTr6xF6pdBmDfbn1bDsCL4FIuXvhA59bCDhutOpe9xR
 qfEg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxN9SY9OyuGVEsU37HLFhXBfIC4zQgA6VLz5I35K4iQGLe8IeQILI6rdLyu5JD2d/822WvRqPWyAw==@nongnu.org
X-Gm-Message-State: AFq9FYIKv0yqrpziW/xoV5V5cm7qWzMFWWweZPPuigrU9pXixefsMsrX
 VtvxVPpROGzFSYMEnhvuWJ59VG2/U16vyeb//WxQpD2BNBJrkyEOoAOGUwXYrN1/kVj8h/TdxbA
 V1KDHps1MLDHNrAd5s91dYzwlfLJNDRjDx5PTQ+xOJA==
X-Gm-Gg: AYBFou16rSXm/fyji2rSbh1Fj8sAeAItubZnXZjn5OMLth2ygycNoIxUDHjBbVmAfBG
 x2vBL+EleqKWYUpa/a4leN3bQ4e3sBlWisII9MR3NmSZrCObFqoFLVXmyfcSF2oHvMXfi8OZr57
 v/POF3Ol6YO1o5Hiry6ThXnjk3cuAdPpG8HaT0UA/fk0U8GPC4MAKGd52Cpc+TMx3MKOpMAuaAA
 QuOHiG6OUe25u+7qtI/bNKbGIxnY3FnHSzxgZVhq0eIy31q8SXFg3BMptN1MuTBMFtVMFjcvQ5R
 H3hW2eWkeA6iJ8PAvl6y3m7SCesFoCBWxNOKuHI0a3sCF63XOu0Llh90jPjlzm3FfE7cWpck/3/
 XxaBn9S7oq426oWhnVfME0tvoffakawd8csUQwts=
X-Received: by 2002:a05:690e:4383:b0:671:2ab1:899c with SMTP id
 956f58d0204a3-672ed50c6c5mr4645316d50.89.1790610876515; Mon, 28 Sep 2026
 08:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043742.96613-1-mohamed@unpredictable.fr>
 <20260904043742.96613-2-mohamed@unpredictable.fr>
In-Reply-To: <20260904043742.96613-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:54:24 +0100
X-Gm-Features: AclHuK8hiTp7wdex--eqxPA2GUbHVI9vSkxHVsbO9w2KsIOrj8Tqob0Z4uEB4Vw
Message-ID: <CAFEAcA8XVZVehzwCAfy_a3V+KFfxOErhxo3dg1NObmco9kEj1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hvf: arm: advertise ID_AA64PFR0_EL1.GIC
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
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

On Fri, 4 Sept 2026 at 05:37, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> For the kernel-irqchip=on case, advertise ID_AA64PFR0_EL1.GIC.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  target/arm/hvf/hvf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index da3ec521fc..f881d6cc67 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1229,6 +1229,18 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          FIELD_DP64_IDREG(&host_isar, ID_AA64PFR1, SME, 0);
>      }
>
> +    /*
> +     * On HVF, kernel-irqchip implies GICv3.
> +     * The kernel-irqchip=off,gic-version=3 legacy case also supports
> +     * the host CPU interface but advertising it in ID_AA64PFR0_EL1
> +     * is not implemented yet.
> +     */
> +
> +    if (hvf_irqchip_in_kernel()) {
> +        /* Advertise the GIC system register interface */
> +        FIELD_DP64_IDREG(&host_isar, ID_AA64PFR0, GIC, 1);
> +    }

How does this interact with the existing code in
hvf_arch_init_vcpu() that does:

    pfr = GET_IDREG(&arm_cpu->isar, ID_AA64PFR0);
    pfr |= env->gicv3state ? (1 << 24) : 0;
    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);

?

env->gicv3state should be non-NULL for both HVF and TCG
GICv3, I think, so aren't we already advertising the GIC
in ID_AA64PFR0 ?

thanks
-- PMM

