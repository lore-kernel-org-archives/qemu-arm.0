Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5452633ejb;
        Tue, 7 Feb 2023 07:08:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8bB7vJlZLTcmm/bKGVZCQ+b23DhJrGPyXHlfMg3c770qByBdu4x63iVyj4IMd9dt8Q0cj0
X-Received: by 2002:a05:6214:5182:b0:56b:f09e:9ab0 with SMTP id kl2-20020a056214518200b0056bf09e9ab0mr5653933qvb.5.1675782489523;
        Tue, 07 Feb 2023 07:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675782489; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3URjgTCjLEAllZWi+Gxq+LWFL36AfMkbdZwKkCyWsQo2malMShN0an7gn51j3k5Xv
         ZBZudYIK1Y3lphgMmN5N56L/7q8jluPGStZWXVK8HaghK8B6ohymNSHXu10/EpAAcLld
         zUWadVODs0xXZnUV8guIIqHpkviEwn7MbxOuk93A/uCuyD7QMtWz9+O6wnVBG58yWtjB
         3Gig9UTdQ/w+QM6EYmzvIqtbtMMTWkXADf1Ye7U3WjcnXkDhOCn5MCDP0yRXfxH8f5BN
         SyFgwS6KDR6xSa5REHAE2emXmQhTh5FtZg5aat7fwJQH4pb6KoMoS2NAwonbPk08fuZT
         TGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fAltMcuXk5nHD2gmnYFO7HpFbgteV7lw0CrjjJIcs38=;
        b=X4MwVvFgQv0nh4Orq64ipVh2q56CvbB+0FotPd2itgU27Mf4A8i4iacxM44l+oRRL3
         4MQEWP3qnz2zB2gKpfJXy+pmQgxo7sQ8Kjnw7hlaEFK1jnGsj16rnOZUAdu0IjWhzsmC
         aaH+nNSR7gG/Eu5tdRXHUshSPqrDI7rCxIN3qu4hgnqy8UE5UtyzxiVayrgcztQapONk
         XHNjVDQPcOjXPcx2VJTHNU4ndBlyInvhPBK4I64s6wYg29/EFg00sGs1Yq61gTVQq8XM
         IybatPsCxqAwsbHRujottfCFq833e2G3El7F0ZEAQqCshdXXzq379LfDU0AXdX9AeNd5
         MP9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgwXULle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a29c300b00735c89846desi1096691qkp.131.2023.02.07.07.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 07:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgwXULle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPPZc-0001mn-KO; Tue, 07 Feb 2023 10:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPZb-0001lz-7l
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 10:07:55 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPZZ-0007Ok-6X
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 10:07:55 -0500
Received: by mail-pf1-x436.google.com with SMTP id 194so514585pfy.4
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 07:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fAltMcuXk5nHD2gmnYFO7HpFbgteV7lw0CrjjJIcs38=;
 b=jgwXULle1QOoPatKUrkd3WNvuUyLNHyCDatn6MCPcm92b3fh1cpLotW1KrKD/Dyf6O
 yh94cShlB4yjuVLcffNQKAjlthS0Mlj3Owc2jBBsQceyWCbsz8nzy22mavnFoIbe3NCb
 Iw1A9EshTcaF21fLeKp9mhVgd2CVAjotkrAZRt6F4GzfWaD/OBQn31ECy0oKookaZ3NR
 n9GWTMZO/qM0ZmIY7ev3YoWi3MF/J7YyR4cXl4zUNlhDzWO5yTBLQSSN0Jt9s2sCJRx9
 VdnktgUMZFXxZ5nP2LoJzys9PChuVlCfrSFYVKfIVyoyA4QXOIcp5SUQ3PkjlalGkWJC
 2MPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fAltMcuXk5nHD2gmnYFO7HpFbgteV7lw0CrjjJIcs38=;
 b=s1Edh/cNwkumKk/zC04xp+B0tGq8L5U6HxoJ8cScAUC0Lb9uJyP6DwhNa8qoIwbNPB
 gGpgQFkQPjYFoxlooAhc+6E5PDoujOfrY5uZCsPv+Ey/PXNgOFqA7dGIklPZ9BJVmvUs
 DCPU+eRiQgXN5+glxwOykuj59BjEWfiA9u7ncKoLcpab+qT8/GHDV/wlnJbFkhga+yG+
 JTO11UUWJI3cWrlECXQKdCqULKnUPRM2r39BK1UXfGA+8/pyDjR7Do+L6a5mZgvPv6+k
 jad5QcAXHw+uCbglu+vJz9P/sNdJMXhkK09m+E8D8Vzg+cX02g93KoCXDSo+lCzyUkZr
 IEpQ==
X-Gm-Message-State: AO0yUKXW9f00UGWEAxeze6bc7EoJjIfKavunl8oP4OcZACYjCk3gmMXf
 ESJLOIX1VOGg4sPJAOSO+Qq0xYodp9FB49p5vgv8ag==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr849940pfb.48.1675782471538; Tue, 07
 Feb 2023 07:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-10-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:07:40 +0000
Message-ID: <CAFEAcA-7Fj5bVn8dTBSR-4jddogWi54MWZJmgXnnycvjnQvZSA@mail.gmail.com>
Subject: Re: [PATCH 09/22] target/arm: Adjust the order of Phys and Stage2
 ARMMMUIdx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PzYF7pvlwakr

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It will be helpful to have ARMMMUIdx_Phys_* to be in the same
> relative order as ARMSecuritySpace enumerators. This requires
> the adjustment to the nstable check. While there, check for being
> in secure state rather than rely on clearing the low bit making
> no change to non-secure state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 12 ++++++------
>  target/arm/ptw.c | 10 ++++------
>  2 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cfc62d60b0..0114e1ed87 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3057,18 +3057,18 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
>      ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
>
> -    /* TLBs with 1-1 mapping to the physical address spaces. */
> -    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
> -
>      /*
>       * Used for second stage of an S12 page table walk, or for descriptor
>       * loads during first stage of an S1 page table walk.  Note that both
>       * are in use simultaneously for SecureEL2: the security state for
>       * the S2 ptw is selected by the NS bit from the S1 ptw.
>       */
> -    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
> +
> +    /* TLBs with 1-1 mapping to the physical address spaces. */
> +    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
>
>      /*
>       * These are not allocated TLBs and are used only for AT system
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 437f6fefa9..59cf64d0a6 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1410,16 +1410,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr |= (address >> (stride * (4 - level))) & indexmask;
>      descaddr &= ~7ULL;
>      nstable = extract32(tableattrs, 4, 1);
> -    if (nstable) {
> +    if (nstable && ptw->in_secure) {
>          /*
>           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>           * Assert that the non-secure idx are even, and relative order.
>           */

Comment needs updating to match the code change (we're no
longer asserting that the NS indexes are even).

> -        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
> -        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
> -        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
> -        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
> -        ptw->in_ptw_idx &= ~1;
> +        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
> +        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
> +        ptw->in_ptw_idx += 1;
>          ptw->in_secure = false;
>      }
>      if (!S1_ptw_translate(env, ptw, descaddr, fi)) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
