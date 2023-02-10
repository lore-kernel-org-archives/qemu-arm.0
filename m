Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1774383ejb;
        Fri, 10 Feb 2023 03:53:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+xKS49MIbHEXioxtjTCfSJWLcb4nQ2Be3Iyh4tkuh8CCdNC1tGeXj7bloLLj0+mFL/7F/I
X-Received: by 2002:a05:6214:e69:b0:56b:f017:c2e4 with SMTP id jz9-20020a0562140e6900b0056bf017c2e4mr24385094qvb.47.1676030024220;
        Fri, 10 Feb 2023 03:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676030024; cv=none;
        d=google.com; s=arc-20160816;
        b=FJ4XsQ/881lTM3rMgLNdBzHQNsHGwhN3Ih0Q/96eVLmpa/Y8+D+8HBMdrCe+ZzWJXX
         z2Cqt03zRj1LkJcnOrxxXFReBTql7vWJozu268fWIVR/ib8tl2TSmOOGBJH3sAcackrL
         aWDLhRJxQtnENc1byLyYKx0NzSfFUZVzXKm8fY32yiKlqifZ7mboHhVX2jC4ZzSK/mOU
         5D7k63Xp/7QaKRXvmBMpZB+bvm7c3D4oyOfJtIABSPjU+of8+HI2qS0q2kg11fRrgwlt
         Atim85Wntv+MnQdIruGG2qSJHurz2UyCiW6y6T0341X6usKvgFs/HQGIyV7DHCKwZQxl
         CDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hPqb8suVsM7i1ekI7lM0jiH7JJSZYrPLQeYTwm8jU1U=;
        b=r8sZxX+gKvPNk/kCTEpvQXcFrJ7ea8lb2gZRLTfJ39zikjaj1sJiJKAddZRd8OAcSc
         Uq3GJM+r++OnekhOK5rAcezjBeBsSTF1fpscUCTC5XB9Wa0+WQ4Q3WtKhh0n6K89r+ac
         kR5gbTjA0oghAvnJCeVYWoV6BOfA6RjJaMRj7BZJpKAgHj0+tN+Q2ovCy+1MDkpzduyU
         7FqXeL9d3jZdkjltVfRgnaSlwXM6UU2D6vScXWi9NxFmMd9TtvpsE2kT81nZWlGJNnuf
         iDp0iTwVqOT+p5QW16BlQ6340mvm2f1kplD1olffql7v1s/2rtfb+seKDH/DIbbxiMs1
         8XYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gBIxjoKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a0cf405000000b005353bfe0a5bsi2654410qvl.62.2023.02.10.03.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 03:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gBIxjoKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQRy3-0003Pw-Eh; Fri, 10 Feb 2023 06:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRxy-0003P4-Qg
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 06:53:22 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQRxw-00020e-Rv
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 06:53:22 -0500
Received: by mail-pl1-x631.google.com with SMTP id d8so4986785plr.10
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676029999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hPqb8suVsM7i1ekI7lM0jiH7JJSZYrPLQeYTwm8jU1U=;
 b=gBIxjoKKoldtEMy1huQdBeCPqkzrP/GgQNgLAu8hViYG3ylej2ZfJvvU8HomNOiElD
 XuDOD9DQ17RjQS3r98ta2bg5jx+/8Xv+WQiCwAUBOpqe4y8+Z+S8IJkO6qYIQUErEn/X
 7O+cjWD5Wfv+Xz6iW3VyAZFpk3gEnR48yHdi6pX0qARjsR7T8ln6gpNYIXfhX3j/mJar
 kNSF4LI/x3j/27AGBR4+JsTj77LO8z9swA6ykcmHy597AGRAMjCeYlzHx8ksvacmp110
 oalDFJjpLMvi3MVeAdEgw9xkxN11UpmzEPm5YWRSVAO+nP8PgBx+iZvu5nzTDY3m/aRB
 hF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676029999;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPqb8suVsM7i1ekI7lM0jiH7JJSZYrPLQeYTwm8jU1U=;
 b=sRJO8V2mXXvrgEv/Rfv8MeV5OJty6VT61C8huwlewu4Ga9xueu47r7aEdicJFLfD8T
 vacFg9xRn1I9HFPbo/bG5Swxy0mQN5mDFiRq+067XjO6hc7uoJ5qinicIhKIcXwMf5MJ
 t/CAN6TNxfzzDwywh7rRRDk8lMepqv9vpfF6yaZap+EJ9CbuX24ofA1EBfXRC9b2uePE
 0THwlsy/LlcLtgUnlM+IW9FCRxsW1YdiJxVSeNF+xmSzvmjJER03uRz5MlCtj2scg5vH
 XdzS36ZbWazYPO3u9bC1yIyveoa2CRB/dSm47FgdzWI6AkNouOkvv3AH3K0ZxNMGE4Gl
 8uYA==
X-Gm-Message-State: AO0yUKX3tG1Xog+1CYx28JQ+ySJ3s6/IGsgc7wnY+CVNlOT2S5Kpn9t1
 OhbPqlAVbQ2BY8qlQbe99GEaq7L3qXLFRpR0m1Gngg==
X-Received: by 2002:a17:902:9a87:b0:199:5374:b831 with SMTP id
 w7-20020a1709029a8700b001995374b831mr2003773plp.11.1676029999244; Fri, 10 Feb
 2023 03:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-14-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 11:53:07 +0000
Message-ID: <CAFEAcA8JECH9dCjGhDM18bJTuTMEAsMQUOwLM-FZEgPJ7f+ijQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] target/arm: Handle Block and Page bits for security
 space
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AWCHcvKeFGA9

On Tue, 24 Jan 2023 at 00:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With Realm security state, bit 55 of a block or page descriptor during
> the stage2 walk becomes the NS bit; during the stage1 walk the bit 5
> NS bit is RES0.  With Root security state, bit 11 of the block or page
> descriptor during the stage1 walk becomes the NSE bit.
>
> Rather than collecting an NS bit and applying it later, compute the
> output pa space from the input pa space and unconditionally assign.
> This means that we no longer need to adjust the output space earlier
> for the NSTable bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 74 +++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index ddafb1f329..849f5e89ca 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1250,11 +1250,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      int32_t stride;
>      int addrsize, inputsize, outputsize;
>      uint64_t tcr = regime_tcr(env, mmu_idx);
> -    int ap, ns, xn, pxn;
> +    int ap, xn, pxn;
>      uint32_t el = regime_el(env, mmu_idx);
>      uint64_t descaddrmask;
>      bool aarch64 = arm_el_is_aa64(env, el);
>      uint64_t descriptor, new_descriptor;
> +    ARMSecuritySpace out_space;
>
>      /* TODO: This code does not support shareability levels. */
>      if (aarch64) {
> @@ -1434,8 +1435,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>          ptw->in_ptw_idx += 1;
>          ptw->in_secure = false;
>          ptw->in_space = ARMSS_NonSecure;
> -        result->f.attrs.secure = false;
> -        result->f.attrs.space = ARMSS_NonSecure;
>      }
>
>      if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
> @@ -1552,12 +1551,66 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      }
>
>      ap = extract32(attrs, 6, 2);
> +    out_space = ptw->in_space;
>      if (regime_is_stage2(mmu_idx)) {
> -        ns = mmu_idx == ARMMMUIdx_Stage2;
> +        /*
> +         * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
> +         * The bit remains ignored for other security states.
> +         */
> +        if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
> +            out_space = ARMSS_NonSecure;
> +        }
>          xn = extract64(attrs, 53, 2);
>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> -        ns = extract32(attrs, 5, 1);
> +        int ns = extract32(attrs, 5, 1);
> +        switch (out_space) {
> +        case ARMSS_Root:
> +            /*
> +             * R_GVZML: Bit 11 becomes the NSE field in the EL3 regime.
> +             * R_XTYPW: NSE and NS together select the output pa space.
> +             */
> +            int nse = extract32(attrs, 11, 1);
> +            out_space = (nse << 1) | ns;
> +            if (out_space == ARMSS_Secure &&
> +                !cpu_isar_feature(aa64_sel2, cpu)) {
> +                out_space = ARMSS_NonSecure;
> +            }
> +            break;
> +        case ARMSS_Secure:
> +            if (ns) {
> +                out_space = ARMSS_NonSecure;
> +            }
> +            break;
> +        case ARMSS_Realm:
> +            switch (mmu_idx) {
> +            case ARMMMUIdx_Stage1_E0:
> +            case ARMMMUIdx_Stage1_E1:
> +            case ARMMMUIdx_Stage1_E1_PAN:
> +                /* I_CZPRF: For Realm EL1&0 stage1, NS bit is RES0. */
> +                break;
> +            case ARMMMUIdx_E2:
> +            case ARMMMUIdx_E20_0:
> +            case ARMMMUIdx_E20_2:
> +            case ARMMMUIdx_E20_2_PAN:
> +                /*
> +                 * R_LYKFZ, R_WGRZN: For Realm EL2 and EL2&1,
> +                 * NS changes the output to non-secure space.
> +                 */
> +                if (ns) {
> +                    out_space = ARMSS_NonSecure;
> +                }
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }
> +            break;
> +        case ARMSS_NonSecure:
> +            /* R_QRMFF: For NonSecure state, the NS bit is RES0. */
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
>          xn = extract64(attrs, 54, 1);
>          pxn = extract64(attrs, 53, 1);
>          result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, ns, xn, pxn);

Various of these cases say "NS is RES0", but the code is
still extracting it from the attrs bit 5 and passing it
to get_S1prot(), which relies on being passed 1 for any case
where the translation table indicates that the memory is
Non-secure, whether the NS bit in the final block or page descriptor
was 1 or not (it uses it to implement the SCR_EL3.SIF bit).
This used to happen automatically because we set tableattrs to
1 << 4 if the initial access was non-secure, and then that bit
would always end up in attrs bit 5 regardless of what the various
NSTable and NS bits in the descriptors were, but the refactoring
in the previous patch changes that and so we need to do something
else I think.

thanks
-- PMM
