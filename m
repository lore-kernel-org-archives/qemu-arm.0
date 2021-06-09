Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5744396lfa;
        Wed, 9 Jun 2021 14:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbuQekWm820FhQKhLC7vSew5SSfz43hdwxaWNeCYdkANiRfca+noczKwj22CW6x4u6Nri8
X-Received: by 2002:a1f:d584:: with SMTP id m126mr2425593vkg.15.1623272826175;
        Wed, 09 Jun 2021 14:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623272826; cv=none;
        d=google.com; s=arc-20160816;
        b=hBvgWWKbpPygpe7qh17nzdBQeowSHAC0NmTmRnxUtoJzPZ0plawTsA/Ln1NU6cMs9R
         pAQD6Ai8DUNT84rAZEEtXKSX5E8RNwbBx1Y3IW2+fLiaHU6lF6+pbTM1ZMfTjfZ1t9Wu
         G3AYE6TuXJhhzoI0GmUnNDCKPo0JCq8BjGfavBnIrldcceCdjwN5HU2Spo2zmBSIudgM
         ZVmQQ8DLYSg9z0xSnSqnGbFGuUlVupAA3PIG3nvrb/gX+XCQFMmpEgCzsOaAlJbQmrbo
         XV5eslbK8KjgGFnX8SqQAtfgRN8soANBdiN6zY4g7INR0kXIGEVDQCX1H0T5npf4hJ97
         mzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/v3p0iFo/toP4/bZ8Mq7dQnEpnbjBATLAwUViilE90Q=;
        b=DEnAgGt9d5NXQIsgNFxCZFLi9mFmIY5+t/RUdnoPGhlsF+6ZYEBoRNd0LX9qGM/DUD
         IhJUnwdcMsaRkC2fm2syXBpitjXJE/pINeyu1nELSMNmAKgQh4x5bOUSkS2j43Uf5aXQ
         EwY9chTsqN6XXLCqkOvE5XSBjkPjGXJhWHezrJFR3zTamFJl6ZvyzNEClq6uNnD2F3K0
         ug+EDcVtnOREZpJ0wcgqTVZTrzOCXpMwf0gJU/dIijDAfUwhMllGE4x6YrFSkgj6ZD3w
         OPICiaD1iY+gRfZuju0Uoi6UD+iLQ7hT+maitp9i274sqANVnPW53PJSUwXKk4EcAKsM
         cN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aI8U/v5h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si559537uam.190.2021.06.09.14.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 14:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aI8U/v5h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr5Pl-0006B7-Ez
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 17:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5Pc-0006Az-BE
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 17:06:56 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr5Pa-0000Jz-DB
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 17:06:55 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v11so4906198ply.6
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/v3p0iFo/toP4/bZ8Mq7dQnEpnbjBATLAwUViilE90Q=;
 b=aI8U/v5h21O/URWMyRugSKVGXxFUZfTLPzrXwbRXBdjcBfEsIuhfl6tZljBHj80xWp
 aJ1ClqnxBvIA+V0bY1652tqx/jk/KP6++CfW/mSn747CinMT8AbU55w0gAU9ZOkPMtn7
 gNvDm5v5983VXoi7wcYIxDdab0InHbgb0DLEmw0FyLY6AaR9n00V58xZ4zPnNA3EvzFC
 Wsh3MvoN0438ZDH0e2ZIK433GhA1q/f+QQG4XDimXQN5xRG6La0oOJ1lwyZj2ga1aDlp
 0hbgbcZ+MMW9mshwANbtI0VdVJygOK1dViSKEJT9GLRWyPZwPNbe0/vT+HMEplPmVdVq
 Pisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v3p0iFo/toP4/bZ8Mq7dQnEpnbjBATLAwUViilE90Q=;
 b=o906ae3EE5wu8I0/xDW3h6Xkh+G3wZ0M9vzg16yCI7UWA6vWC95Wb9jXMWesLXxQRD
 tFW+3m12BQ7tNje8tIv4kTWqRRCXtTqGl4jQXUcwq++LPNRrIctz6eXMEOtPzdOtWNYB
 DW8l09U3+X2C/dTsldUkXDKgEmVVMlAY9VUoIhxtGmBVGE+6BnmtVaUAOxTU1ER0oLyn
 9wYZDscnJKu4kQye65OArXxeB31ai7xGJjVF+Gpjpqywj41Vq7BaIOW4s2PPQYdOA114
 w0lC9GP2kVk5ErlW5OumMLmEuMd4vsNapnqsY7MoCIPrIeOyNZTTa3DW8GEt+5eHEyr+
 pH3Q==
X-Gm-Message-State: AOAM530N+pLyUJz61WbY9Lc05y9e3LxBuPocC1x7pbLBZc0hCMy6wnFm
 cB+s97F3EfxSMNmkLfiYy67eYQ==
X-Received: by 2002:a17:90a:ff12:: with SMTP id
 ce18mr1490061pjb.215.1623272812584; 
 Wed, 09 Jun 2021 14:06:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m5sm564143pgl.75.2021.06.09.14.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 14:06:52 -0700 (PDT)
Subject: Re: [PATCH 51/55] target/arm: Implement MVE VADC, VSBC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-52-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81de6b94-0b9a-4173-4307-253a6b46a286@linaro.org>
Date: Wed, 9 Jun 2021 14:06:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-52-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: u3xQk2lNr5B5

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +#define DO_VADC(OP, INV)                                                \
> +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,         \
> +                                    void *vn, void *vm, uint32_t nzcv)  \
> +    {                                                                   \
> +        uint32_t *d = vd, *n = vn, *m = vm;                             \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        int carry = (nzcv & FPCR_C) ? 1 : 0;                            \
> +        /* If we do no additions at all the flags are preserved */      \
> +        bool updates_flags = (mask & 0x1111) != 0;                      \
> +        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
> +            uint64_t r = (uint64_t)n[H4(e)] + INV(m[H4(e)]) + carry;    \
> +            if (mask & 1) {                                             \
> +                carry = r >> 32;                                        \
> +            }                                                           \
> +            uint64_t bytemask = mask_to_bytemask4(mask);                \
> +            d[H4(e)] &= ~bytemask;                                      \
> +            d[H4(e)] |= (r & bytemask);                                 \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +        if (updates_flags) {                                            \
> +            nzcv = carry ? FPCR_C : 0;                                  \
> +        }                                                               \
> +        return nzcv;                                                    \
> +    }
...
> +    /*
> +     * This insn is subject to beat-wise execution.  Partial execution
> +     * of an I=1 (initial carry input fixed) insn which does not
> +     * execute the first beat must start with the current FPSCR.NZCV
> +     * value, not the fixed constant input.
> +     */
> +    if (a->i && !mve_skip_first_beat(s)) {
> +        /* Carry input is 0 (VADCI) or 1 (VSBCI), NZV zeroed */
> +        nzcv = tcg_const_i32(fixed_carry);
> +    } else {
> +        /* Carry input from existing NZCV flag values */
> +        nzcv = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
> +        tcg_gen_andi_i32(nzcv, nzcv, FPCR_NZCV_MASK);
> +    }
> +    qd = mve_qreg_ptr(a->qd);
> +    qn = mve_qreg_ptr(a->qn);
> +    qm = mve_qreg_ptr(a->qm);
> +    fn(nzcv, cpu_env, qd, qn, qm, nzcv);
> +    fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
> +    tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
> +    tcg_gen_or_i32(fpscr, fpscr, nzcv);
> +    store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);

Hmm.  It seems like you're having to work extra hard in tcg to extract and 
store nzcv.

How about four helper functions instead of 2.  E.g.

static void do_vadc(CPUARMState *env, uint32_t *d,
                     uint32_t *n, uint32_t *m,
                     uint32_t inv, uint32_t carry_in,
                     bool update_flags)
{
     uint16_t mask = mve_element_mask(env);
     unsigned e;

     /* If any additions trigger, we will update flags. */
     if (mask & 0x1111) {
         update_flags = true;
     }

     for (e = 0; e < 16 / 4; e++, mask >>= 4) {
         uint32_t bmask = mask_to_bytemask4(mask);
         uint64_t r = carry_in;
         r += n[H4(e)];
         r += m[H4(e)] ^ inv;
         if (mask & 1) {
             carry_in = r >> 32;
         }
         d[H4(e)] = (d[H4(e)] & ~bmask) | ((uint32_t)r & bmask);
     }

     if (update_flags) {
         /* Store C, clear NZV. */
         env->vfp.xregs[ARM_VFP_FPSCR] &= ~FPCR_NZCV_MASK;
         env->vfp.xregs[ARM_VFP_FPSCR] |= carry_in * FPCR_C;
     }
     mve_advance_vpt(env);                                           }

void HELPER(mve_vadc)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
     do_vadc(env, vd, vn, vm, 0, carry_in, false);
}

void HELPER(mve_vsbc)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
     do_vadc(env, vd, vn, vm, -1, carry_in, false);
}

void HELPER(mve_vadci)(CPUARMState *env, void *vd,
                        void *vn, void *vm)
{
     do_vadc(env, vd, vn, vm, 0, 0, true);
}

void HELPER(mve_vsbci)(CPUARMState *env, void *vd,
                       void *vn, void *vm)
{
     do_vadc(env, vd, vn, vm, -1, 1, true);
}


r~
