Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1752056lfc;
        Fri, 28 Aug 2020 13:10:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSPLjnNunkVy7sFh6lhqW2am1i4oabkOqdjy2/7dboRd+uKp5Sg5HpzzXwUvl2uc1qgoPv
X-Received: by 2002:a25:cc02:: with SMTP id l2mr4923799ybf.308.1598645447809;
        Fri, 28 Aug 2020 13:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598645447; cv=none;
        d=google.com; s=arc-20160816;
        b=poVxRfGYnanmy5e5ZJx4d7XCQfzPFFZT8ZK5u7LOqxaI2RvxBRTloYP1JPx+OOCW8q
         ccTqR/gHw7QRckjKZPMGUJUvLlFEJpwHt7uqfLsNbLYu4INyyyQQWm9Fv3waxa32Jb6S
         qndPgunrou1DK3p/zsmVI+gUNBbVr3DpMnsdVOsu/F/lDc4GYGH1eWaTgj9ckLl10yvr
         jK4mDSXVS2t/p2ZAPYJ5BAbsCDkb8/q49P3uREQ532oI8DZuLifk1y+58grLlXn9H3wd
         l4ucHbSdXV36Lia0qlitLsVrnMfF1aemuHEtG3yz1GWMBM9gfBQX88+50BdCCe9g5pmB
         A5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=khJkHNHtikGHDPRIWVieginrZpbl+J4Zmyy0VDJojLs=;
        b=Tnv7COXcswb5CHaJ3vfX6KyMNdN7Jax0+q46A9pnGvtlzZzwZinFeUMU7TqutzFkgi
         r0j9px2235Z7/D1EXrzKYDiSOWEym73vZGoKw1tblqza0gcCvpc7qcRTQlt922/7BMEW
         Cd2I2ZHQkA9unMFVSX3UbvXc4DcCkm8zRRouC93sN0pZznzUILB81KQL7BAokfbGSZWq
         wS9s3/mXYfJ6thoJareLl6BwcFebDbK7V3lbC0by6XTNWmRx+SkLymgnRNdcwP0hIxpQ
         UcZ7LHsaUMUW8NW937DaexwO7HHehdVTUFOhzUV3HuR9Ap0l9SuYi7pJN8vR7NvNL7Oc
         kNnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qtu8s/ga";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si414613ybt.344.2020.08.28.13.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qtu8s/ga";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBkhz-0000z1-1P
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkhr-0000yk-CQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:10:39 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkhp-0001bC-Ik
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:10:39 -0400
Received: by mail-pg1-x542.google.com with SMTP id w186so945050pgb.8
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=khJkHNHtikGHDPRIWVieginrZpbl+J4Zmyy0VDJojLs=;
 b=Qtu8s/gabJLYDiUfosHriu2pdkd3Srv67nc+lWMktMffvhoK5UOK+HeoVyEPOfPsk1
 PlkmnIbQfDJZpvAjZ/eQIkAiMRtT2hoIorP4SCtsKkTRWXBZ4FArx8UMTioA4q4QkE3b
 +VbMBPC/nc0hzNzKqXoMfsSLcMTy/ESFzIfOC/L81+G30YH7pMW1238vFaFTboB4cISa
 k8lzzxQChCnNC353e+yD8dKep90SNjjUWR3HYZplB1ZvdbjfwrDro06qgawAaYshl37S
 ZjJllCaBS5bWpIMc8e0GL7UT0gn7SWehAe3IdQJkiqFnVTLZs94cXAbiJmxNPz9wohqy
 w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=khJkHNHtikGHDPRIWVieginrZpbl+J4Zmyy0VDJojLs=;
 b=E4UcQUOEv7gHqF8mmpwO4Nb3k/XVWWmkMRdvvihrundqH9ZVcniN+B3LH5gPUhrn5N
 2YLFP8V+W3P0snVI0/XrmUcpgXVW+rbEqkTYa01j9i+M5ZebdJarg+N8SV1FSecuahUr
 /4pYHQWjsg0VaNC0lcpFE6cUQxfEwBWzTs/MO9QQLdhnXJq/BOngtb7QS0k5rPJXgcR4
 d9S4X8rKyjMF06x4A1ZgNjr+pOePe09cu0r4ZLGSgzJK/RtqqB+tSjzaogJ5A4wjx9Q2
 t21BqbPNrA1ffJYOvHmjRq9Gz9h/Ov/+dLdLnG8wyFr7E/mNV/I+0trjSenAY3mKsF0D
 5Y6w==
X-Gm-Message-State: AOAM533lZmVvMIqrwUlL/lT7u5rABTL1i+3Y7+ujHLQX6yYHdhMM7diC
 FciF+Q73frWvfxQBR0DMEwcRDw==
X-Received: by 2002:a62:79c5:: with SMTP id u188mr554618pfc.270.1598645435785; 
 Fri, 28 Aug 2020 13:10:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g5sm150264pjx.53.2020.08.28.13.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:10:34 -0700 (PDT)
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55675521-a61c-186c-599f-7373e9165184@linaro.org>
Date: Fri, 28 Aug 2020 13:10:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZVsKgVARCFo4

On 8/28/20 11:33 AM, Peter Maydell wrote:
> We already have gvec helpers for floating point VRECPE and
> VRQSRTE, so convert the Neon decoder to use them and
> add the fp16 support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 9d0959517fa..872f093a1fc 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -3857,13 +3857,38 @@ static bool do_2misc_fp(DisasContext *s, arg_2misc *a,
>          return do_2misc_fp(s, a, FUNC);                         \
>      }
>  
> -DO_2MISC_FP(VRECPE_F, gen_helper_recpe_f32)
> -DO_2MISC_FP(VRSQRTE_F, gen_helper_rsqrte_f32)
>  DO_2MISC_FP(VCVT_FS, gen_helper_vfp_sitos)
>  DO_2MISC_FP(VCVT_FU, gen_helper_vfp_uitos)
>  DO_2MISC_FP(VCVT_SF, gen_helper_vfp_tosizs)
>  DO_2MISC_FP(VCVT_UF, gen_helper_vfp_touizs)
>  
> +#define DO_2MISC_FP_VEC(INSN, HFUNC, SFUNC)                             \
> +    static void gen_##INSN(unsigned vece, uint32_t rd_ofs,              \
> +                           uint32_t rm_ofs,                             \
> +                           uint32_t oprsz, uint32_t maxsz)              \
> +    {                                                                   \
> +        static gen_helper_gvec_2_ptr * const fns[4] = {                 \
> +            NULL, HFUNC, SFUNC, NULL,                                   \
> +        };                                                              \
> +        TCGv_ptr fpst;                                                  \
> +        fpst = fpstatus_ptr(vece == 1 ? FPST_STD_F16 : FPST_STD);       \

Perhaps clearer with MO_16 instead of 1.

> +        tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, oprsz, maxsz, 0,       \
> +                           fns[vece]);                                  \
> +        tcg_temp_free_ptr(fpst);                                        \
> +    }                                                                   \
> +    static bool trans_##INSN(DisasContext *s, arg_2misc *a)             \
> +    {                                                                   \
> +        if (a->size == 0 ||                                             \
> +            (a->size == 1 && !dc_isar_feature(aa32_fp16_arith, s)))     \
> +        {                                                               \

Likewise, and the { is on the wrong line.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
