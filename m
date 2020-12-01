Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp185412lfb;
        Tue, 1 Dec 2020 06:06:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD1eeLWvtUgQrYtPyQOT8WCv1gSua4K8HDnw6U8Q3rOc8htx6r7s/jJHspwfcpR3pWX+ov
X-Received: by 2002:a25:d8c6:: with SMTP id p189mr3431196ybg.407.1606831566104;
        Tue, 01 Dec 2020 06:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606831566; cv=none;
        d=google.com; s=arc-20160816;
        b=eW4v0/6MIekLq6YweCVEslFXYpkNalXVb9uoParf6Wy9t9h34r8R3XVE3y6PyUk7Xj
         h6/4ZUSkCKi+i7uW5hIIQsbGl8de8IFTu6jfvyxEjQNBtCHD9gtgZIPCJRoJYUy+9myW
         QXqfdPoHXFQHzeXAmsqPMLN0pG6Ho6z9smjeZfNOu3FKZb084evqiZaAFfRJIWVsIuoS
         MxVtp17WoR6NgNieAcM2L7PjGwXuDWyswkqLCMUOnIH+vA5IQ0Ngn+x0SX9Se2oOAE44
         4ty0JGUq2DYlQUGHtCxT4P/xsbgJvIodSqg32a/IJDkr4oD6xn2Rdz2xjVU0zjMpKcrH
         CcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JQn/dAu8lZ4g3nTDjQOn179Q1SFqKKVs2U8mDJ9dsoE=;
        b=ObH9c0I+Z504V1xwbu/3NW3DJvcbqliE5akpVpewasMvfJ9YpEdBv1lJXVq7Dza6/R
         wM1AFDVPyEiqLlFuP4pel57IeJiwMbp/SR9RO42XmcNcdLSePsBOgCF35rCIHEVxugV5
         o2oxZstkhWsCNkxcJV9pg9aD0ZyFyLRmbF2G3qCEl47h4DBnsq/dDvhSlnoJcusQ/6S6
         x4OQY0NxYFAXJ75vnJ45fDDjzNFswm6LzLoNzLTsOVBebMC+hsLAKP38PIndSkIctLPB
         dUweKWwMWhvF7ZjvPCVXRkxRM3zMC2P96gp46T7S4MV7omyKAB7DV2gnmLFqBG6NegzD
         ZYrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bqtwbyu0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si1722232ybe.230.2020.12.01.06.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bqtwbyu0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6I9-0001PS-Gn
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6I2-0001Ol-86
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:05:58 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6I0-0002Q5-AN
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:05:57 -0500
Received: by mail-oi1-x244.google.com with SMTP id l206so1807729oif.12
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JQn/dAu8lZ4g3nTDjQOn179Q1SFqKKVs2U8mDJ9dsoE=;
 b=Bqtwbyu0elaRSM9c5DaIBGutrTunj0r1IzZEuxqqouRxxmFYJlMw4uckduvIo2S9Ue
 7xWP6CwYNy6zrajBohGhbt4yeWzaHB4fZ0BEGRRpfdIXjzBwKTro8e8GKpZ1oBxXfRbL
 TxlUWsbX7FNK14Q1Dto7fD+TadJJHJ5pgURxtaHuoCEmSHZaXyonuFM4s7H2q6cQxtqR
 WVtSwKgHxQX6C8pRYlD8IvEUC/FZ8qhlK2ZmeyMNdGesSGuCcbm/jJGB1Luhh9s9w3H6
 t7KeEpRBK/EelWnmt1hd5/6QewtjhnrpY9TdVELnW+sv1PPKmSbqQOHTgM4s0aiQWz87
 MDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQn/dAu8lZ4g3nTDjQOn179Q1SFqKKVs2U8mDJ9dsoE=;
 b=Z+RIFrQovNqyTzm0xQ3de4Sqx4zvHat0imSjE7tEe6O7LKywLlDCxArtDWava9zy75
 ZCUaEgGw1F5CPFu1O3g+3dOk8GArhu9vAkxrEzE3MaaIXjw5isOml2r6i105XlfMaui6
 NncIbTSJHjQBrNM33qJfwQZPpfjEt5EwulF3rnpuKYsQLtzRJIK6sdv+OWsBwAievcE+
 dOZpWr+1uH7Pa1Axxojs73lvN7v6w1yHxqOCu9oZh+CfB0lEO8c6TKsQoI7rlrOdjpet
 fbcptX3+C4QFhLpLz1B1jNvNgbxdF87PrqviBO7RrZi2fpxUcVQq5mWLb1ABCo9TJb4n
 rnSw==
X-Gm-Message-State: AOAM530wSmEHEhos6zLejnehUDmtDf3xvVHJcop4ryo4K1ZLVK/PQNRK
 YcjTv3uvzA7gdRoc5SBfS2m9xg==
X-Received: by 2002:aca:a9c8:: with SMTP id s191mr1733488oie.11.1606831550075; 
 Tue, 01 Dec 2020 06:05:50 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id h3sm384103otq.33.2020.12.01.06.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:05:49 -0800 (PST)
Subject: Re: [PATCH v2 14/28] target/arm: Implement FPCXT_NS fp system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c730f827-7f31-1ac7-ec7d-6ce0c65f8145@linaro.org>
Date: Tue, 1 Dec 2020 08:05:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
X-TUID: DV8uSMlKnuX5

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Implement the v8.1M FPCXT_NS floating-point system register.  This is
> a little more complicated than FPCXT_S, because it has specific
> handling for "current FP state is inactive", and it only wants to do
> PreserveFPState(), not the full set of actions done by
> ExecuteFPCheck() which vfp_access_check() implements.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 110 ++++++++++++++++++++++++++++++---
>  1 file changed, 103 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
> index ebc59daf613..1c2d31f6f30 100644
> --- a/target/arm/translate-vfp.c.inc
> +++ b/target/arm/translate-vfp.c.inc
> @@ -647,8 +647,20 @@ typedef enum fp_sysreg_check_result {
>      fp_sysreg_check_continue, /* caller should continue generating code */
>  } fp_sysreg_check_result;
>  
> -static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
> +/*
> + * Emit code to check common UNDEF cases and handle lazy state preservation
> + * including the special casing for FPCXT_NS. For reads of sysregs, caller
> + * should provide storefn and opaque; for writes to sysregs these can be NULL.
> + * On return, if *insn_end_label is not NULL the caller needs to gen_set_label()
> + * it at the end of the other code generated for the insn.
> + */
> +static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno,
> +                                               fp_sysreg_storefn *storefn,
> +                                               void *opaque,
> +                                               TCGLabel **insn_end_label)

I think it is really ugly to bury the fpAccess check in here.

> -    if (!vfp_access_check(s)) {
> -        return fp_sysreg_check_done;

I think it would be better to do

  if (regno != ARM_VFP_FPCXT_NS && !vfp_access_check(s))

and split out

> +        /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
> +        TCGLabel *fp_active_label = gen_new_label();
> +        TCGv_i32 aspen, fpca;
> +        aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
> +        fpca = load_cpu_field(v7m.control[M_REG_S]);
> +        tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
> +        tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
> +        tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
> +        tcg_gen_or_i32(fpca, fpca, aspen);
> +        tcg_gen_brcondi_i32(TCG_COND_NE, fpca, 0, fp_active_label);
> +        tcg_temp_free_i32(aspen);
> +        tcg_temp_free_i32(fpca);
> +
> +        /* fpInactive case: FPCXT_NS reads as FPDSCR_NS, write is NOP */
> +        if (storefn) {
> +            TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
> +            storefn(s, opaque, tmp);
> +        }
> +        /* jump to end of insn */
> +        *insn_end_label = gen_new_label();
> +        tcg_gen_br(*insn_end_label);
> +
> +        gen_set_label(fp_active_label);
> +        /* !fpInactive: PreserveFPState() and handle register as normal */
> +        gen_preserve_fp_state(s);

... all of this to a separate function.

Then VLDR becomes

   case ARM_VFP_FPCXT_NS:
        lab_inactive = gen_new_label();
        gen_branch_fpInactive(s, TCG_COND_NE, lab_inactive);
        ...
        gen_set_label(lab_inactive);
        gen_lookup_tb();
        break;

and VSTR becomes

   case ARM_VFP_FPCXT_NS:
       lab_end = gen_new_label();
       lab_active = gen_new_label();
       gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
       ...
       tcg_gen_br(lab_end);
       gen_set_label(lab_active);
       /* fall through */
   case ARM_VFP_FPCXT_S:
       ...
   }
   if (lab_end) {
       gen_set_label(lab_end);
   }


r~
