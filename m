Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DDDC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6T5b-0004YB-W2; Tue, 15 Sep 2026 09:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T5a-0004XZ-TL
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:20:46 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6T5W-0001A9-Jt
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:20:46 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab19127so3319611d50.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789478441; cv=none;
 d=google.com; s=arc-20260327;
 b=HfVm6mT6XNA50HU7coZTyia+IlVWx0nVqZhWQoHGMOJj6btnCcAg3bTGiGBxweia5p
 hTYu6KXm8YYvJejg0aGd5C/ktkRgKIrXExVpFN46COBTcKEe7WWnW3aHm/nDfO6Di3rr
 GIY1WXJqVaNyD+DDH9A8TFT25zsstUTKd6abdfJ4/Cm5N13F5ubF8f8TGE7dGzmBbizV
 CV9K1Q4fhVJ4uoy5dtBry6FGIR6/h2TZ0MgTrf0KSCdY1BO0W4qVks6f/c4gNS1KTQJe
 yD6jnjhxH9L7l3wDXN4Ynk2uSrJmxOoQeiZ6nVziO3VpSpDg1NKxVvJO+JxEcKqDPAL+
 vAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ydLYY4SqBlxXdXCaVhbLtWJhfLG4FbNsEY5dxxALhXs=;
 fh=r8sRTcBKdsKKwWIFR0gUrIgZmJh76OpYFp/DPNYXKfQ=;
 b=X4CqxFDxre10IGtGxN3lpDbNR68u/aouvQHcysDauvwyoAK/cjfyMggBHUA2FXPShb
 Xhyw9Eu/eA99LNk9xk+uE2kGogZRWds9YMsJM/xW5t+WfP0pc3JLFf67K3t1fU+NP+uM
 YMZfBQOtQz/e+woSBM3KWhmUpoUZyD2MdSuCkaS5POn4AG5n4VesGds0mOrehdkM43QH
 0infZgX6d6RdS0niISdGl7TvTdxjbVal2W3cKXOCxuPU125Q1XtCvaKqaxBvp5Mq2j1s
 xb3DIL3nzqb2GV770g27dg7NCldznyeS0caCs501HR8nkHe/xJM93ytikV8+ziPzxwWP
 Y+Jg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789478441; x=1790083241; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ydLYY4SqBlxXdXCaVhbLtWJhfLG4FbNsEY5dxxALhXs=;
 b=I00UdDpYgKLEATrIKcWgLYhcdSUQfdFu/eMS1Cu6r/3SNMs8Rzb8dL9TXhynPqXn/a
 XwBB+cMsHKce0IP32yAB07x+YuLLzzAbp6dxJVGb5DdSQHMs2uwo8tVmHbYGUVO6rsb8
 p8o6RFV0u3JzdsfPkbI5SuRJGpQttnJ6ToMmFdPkgX2wV9Z5wS+058pILyxm2fIAdmiN
 0c53Uazqj4ryfITeCzSTy/e7bwnO4o29oVLAjUSomcLJtv0IbJxniczjgbg7RHx58VTE
 2PcFQ4eSLnYVY2QWJfSeKsId6UsFLyfJ4I+ovRfEWuFYKCMmsSU91PqJWp980LCwUWRc
 5IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789478441; x=1790083241;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ydLYY4SqBlxXdXCaVhbLtWJhfLG4FbNsEY5dxxALhXs=;
 b=OkS0N0WAx/mhZAn7Vxl0rPfx2Z4zef6htMBg8O1PSfANGkLAqUv2cDN6QkjfZRh/rb
 ueI6pZeaHgrHhplkVMk4vBJLfSYNhlD9lgUtWsDCzyiTQ4ri/GCqYkiaW2/ZR7jzNdRn
 knqMwozi1EYKxgqw/B1zaOcRdMAd2U0VNVB0inJ4xj2NAlQkxGGIpkmD2b4nMYF/25PO
 mwuf1CGmJ8upKVvEuzzaKj6aaMyXJDLA4i9A9l1ZSJh1Mz2MiExvNceO7LNh6VwQtoUE
 SxIQg2CQuR65qjHDcaPSC2zwVxaRxS1A9ePEuIrJgqv1Y2xLUNWlXAUaevZD+OZVsvIg
 d1ww==
X-Forwarded-Encrypted: i=1;
 AKwUvByzPVE//Uj+uccH54lfKB854cmZbyboLYUsrMK5YelmKIsykg/UGeJ+cYnrRKsWjhEyvr68ylLOiw==@nongnu.org
X-Gm-Message-State: AFuF++lmjNV+wbv5TivRQ+3DcoxGuG9Q002k5h9tH2OLM7eJJw34TWop
 KoKuUpK55BPu9PyKiEOiOjkXa2M/2xymFTJDTFeUHV1p2zH4kjapr0LfTxPG5V/AjNyK6/HWjGM
 Hz5z7f7LTm/p17CRxLWLZS8/Y3k6dLp7IHBGCPRhy2A==
X-Gm-Gg: AYBFou3QoBjR9i2BUxtBoYA4/WMCfiFgXiAfoOIRujiz+7RhH5ARYy2tVnXNbjonKTS
 kJjR5EAOQDt04e478vjRRw1BDquoUjglSFqKT66pGQArLfZ3LES9oRPYylmcL0D/4mpLoWFWJhM
 SYACLV+sS/zdDL2iKHZCejjtafcH53M9reAxgZ9n+8NFZ/gAeomLjskwdAAbl+cm9VX2T4LDmu5
 YewQO0BkT9kNb/SDIWl3nMB8h+zZd/WJ8ALoDcZdAnrypDAtTjRvj0DFGWXAbeNajK3730SX87x
 7jCZ1bAn3kwD3yYaPvOlr2+2W1rLQDRZSLnRgqsIcIZFAAv2WmsoaMkIOvQt3nlXrA/7URrQH19
 J27MIgJZ9F6jTkt5ou7V7U6ts3tvfThmxUr0qQvpgJAxr36RIez8=
X-Received: by 2002:a05:690e:b8a:b0:671:a0c:6ea1 with SMTP id
 956f58d0204a3-6714dfdbde7mr2860817d50.13.1789478440855; Tue, 15 Sep 2026
 06:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-3-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-3-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:20:29 +0100
X-Gm-Features: AcwNN1Xu0hXFTKzeAF-1QQyTSUeE_2gx-XE6Aj0PBiUQXqzpvfS3DC8zJz0iiyQ
Message-ID: <CAFEAcA_=sRZboB1GyGDxEa4vTZe5YS4GwJV9aK=6h-fONgLVkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/6] target/arm: model Cortex-M0+ privilege
 extension
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 14 Sept 2026 at 20:25, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> The Armv6-M Unprivileged/Privileged Extension is optional. Cortex-M0 does
> not implement it, while Cortex-M0+ may implement it. The RP2040 Cortex-M0+
> configuration provides the extension.
>
> Add an ARM feature bit and a cortex-m0plus CPU type that enables it. Permit
> privileged writes to CONTROL.nPRIV when either the Main Extension or the
> optional privilege extension is present.
>
> Update the microbit Cortex-M0 test to verify that writes to nPRIV are
> ignored.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  target/arm/cpu.h                           |  1 +
>  target/arm/tcg/cpu-v7m.c                   | 11 ++++
>  target/arm/tcg/m_helper.c                  |  4 +-
>  tests/tcg/arm/system/meson.build           |  6 ++
>  tests/tcg/arm/system/test-armv6m-control.S | 66 ++++++++++++++++++++++
>  5 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/arm/system/test-armv6m-control.S
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e3f931dba2..66606b3444 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2168,6 +2168,7 @@ enum arm_features {
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> +    ARM_FEATURE_M_UNPRIV, /* M profile Unprivileged/Privileged Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
>      /*
>       * ARM_FEATURE_BACKCOMPAT_CNTFRQ makes the CPU default cntfrq be 62.5MHz
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
> +    set_feature(&cpu->env, ARM_FEATURE_M_UNPRIV);
> +    cpu->midr = 0x410cc601;
> +}

This patch should only add the feature; it shouldn't add the M0+
CPU type as well.

> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 33c9e7c55b..f8461a4d66 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -2775,7 +2775,9 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>                             !arm_v7m_is_handler_mode(env))) {
>              write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
>          }
> -        if (cur_el > 0 && arm_feature(env, ARM_FEATURE_M_MAIN)) {
> +        if (cur_el > 0 &&
> +            (arm_feature(env, ARM_FEATURE_M_MAIN) ||
> +             arm_feature(env, ARM_FEATURE_M_UNPRIV))) {

We should make ARM_FEATURE_M_MAIN imply ARM_FEATURE_M_UNPRIV
(in arm_cpu_propagate_feature_implications()) so here we only
need to test ARM_FEATURE_M_MAIN.

>              env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
>              env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
>          }

thanks
-- PMM

