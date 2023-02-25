Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2686586ejc;
        Sat, 25 Feb 2023 02:34:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/XHorlcyIECqyqkn7lM+lvI6rWpNNJTkXp5xKN8BqXpBm4iRyQ3l1beo8sJrVjzyFuCj2i
X-Received: by 2002:ad4:5c4c:0:b0:572:dbc8:23f6 with SMTP id a12-20020ad45c4c000000b00572dbc823f6mr7722212qva.45.1677321260079;
        Sat, 25 Feb 2023 02:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677321260; cv=none;
        d=google.com; s=arc-20160816;
        b=cIQAh8lTtkiqs3jMvsupembLgkKnUQR2gBKGP9cMW9EQEjLDnE08971rjJKD759OaS
         TU27KmYFxgAC/lODwTZ72DIdcwF4E6KiDr2bLExUsTmQgm+bgQsBzDjVW25hnYam/J+L
         ICYe2mN1lZtAZWpRk853NN8ps+1Y9JhoWuiwx5a7SjAeSYCC9FEBAEQCmwKJseAdBgt4
         OTLckNVuuI/C0/pPSnVRBV5UVOHQYZlNBY/yDtVWVHpVBv8A0gh6fotAlbPUPkV48LLx
         PPo92HR80kivilq+/uBLCWaqEhz8xiMa4QV6OypzE8Wu7H2TkKlYiss5/C/KGjLY4J6e
         M8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7ECmqiOxl/WbBgpvqRmEGupHEyPuAxiWmANQ5KYPZv0=;
        b=REIszza+0ZyX3ZY/2Am+nIwPVzZbWy0jibxdcX0DVEJ/u7o1PqfcWBwtHegFJp9h3Y
         eUHgZKo7ctHEewkrChj0jKwVA1a1/SglqQ2w3qllqHzArT3t+aKBAJr6mUY7SvnLKdQv
         H4AH0UXGAXlHTlu0WfyMQ2/QDtQIEsEr16mYS8+0w7acvtXPt/DtrN8tDeWYEQl/RqXQ
         HF0goW3nDG1ZtRYZAOUR5ba/NTMV/uL+QCEB0CnECBX0gItHMCBpto3GpuNWHzBRGNTd
         NgjtcjRJIgJFqwp7415CtElTuDJbs+ofgeevwzJxlUCI99LoVOBAwxlR47E4kwDgpyxk
         BSoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Z96E//v3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a0cf548000000b00571bb7c3c01si1421470qvm.337.2023.02.25.02.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Z96E//v3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVrrr-0005WR-KX; Sat, 25 Feb 2023 05:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrrq-0005K3-0O
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:33:26 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrrn-0001P3-1e
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:33:25 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-172a623ad9aso2358706fac.13
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ECmqiOxl/WbBgpvqRmEGupHEyPuAxiWmANQ5KYPZv0=;
 b=Z96E//v37D9Xes3n5jdxdDPX2HU8ogmhQkp2E4GpEPV8KdP0TBn72eGcMhTNV5L03G
 PzSBUNmKT3jI4J4LVX5/0L+gzyN8FIRfMRbozaLVdIouHT/KeDvlqIWcwwVvN+PsrpoD
 N3ycyQ/td1EuU+rfX+Ra4w5GLdmblOCtgq/J5iNdArNhdZiySbahc35gupxgaJ2pUg7N
 1ULcjqMI59jOb3VEWaFuFrqI7/Hkns9EhdWoCZMpv2lkr5m52eG2Y9irJyXa6TewhhxG
 j+tCdjv2UtO57sEvyz0xtDoVNEV/RqFMIANioMaoStFB+dWZty3lSiDUMo9w4OjomYMh
 eyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ECmqiOxl/WbBgpvqRmEGupHEyPuAxiWmANQ5KYPZv0=;
 b=gMPMcL3pM68pH4ee7agYEldGGo/0mpo5a69H6kwyV8rZO4gYa4Kfqx9431D/ZAhNNM
 +PgnmTLye1YKYsYerGLeA+f6YytQXsn3k5j1IQ8tqdEnXXXMk/kodpxb9J6oC0vcJfIl
 9odzhjv7Pfph2e4s6kEv7VloccakhI+1EwMZg29egvO4bkMwi5v0aD+TCOl5ksN11w7b
 aaCZ7wb/nyU8Zinr38czaij8sfjtCzLVAC2L5X37kkvP99MY9HJ/Qyh9sDJ6/9iz+3Oe
 2n4Ky6uQmNHKs8xiXMU46/1XKXx9+jKD6QZ6YnTOb+xafr79dlktSXc4v7k8nsy0bNUw
 JNnA==
X-Gm-Message-State: AO0yUKWgPrXnPaE6y2Dowx8zVuGtqJreAWbi6tcUvAQfbtduPucBiTSM
 iYN3sZJ9Inwk1A4oHNBPt/0e4A==
X-Received: by 2002:a05:6870:ea97:b0:16d:c5c3:de1b with SMTP id
 s23-20020a056870ea9700b0016dc5c3de1bmr14064121oap.45.1677321198133; 
 Sat, 25 Feb 2023 02:33:18 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 du1-20020a0568703a0100b0016a310dc4a9sm500921oab.9.2023.02.25.02.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:33:17 -0800 (PST)
Message-ID: <c9d96abc-50ce-6c30-acff-368e74c04aca@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:33:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 51/76] target/riscv: Drop ftemp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-52-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: 1fjfnDC+ExH9



On 2/25/23 06:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f9d5d1097e..273e566d66 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -106,9 +106,6 @@ typedef struct DisasContext {
>       TCGv zero;
>       /* Space for 3 operands plus 1 extra for address computation. */
>       TCGv temp[4];
> -    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
> -    TCGv_i64 ftemp[4];
> -    uint8_t nftemp;
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> @@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
>       }
>   }
>   
> -static TCGv_i64 ftemp_new(DisasContext *ctx)
> -{
> -    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
> -    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
> -}
> -
>   static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>   {
>       if (!ctx->cfg_ptr->ext_zfinx) {
> @@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>       case MXL_RV32:
>   #ifdef TARGET_RISCV32
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
>           return t;
>       }
> @@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
>           return t;
>       }
> @@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
>       }
>   
>       if (reg_num == 0) {
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>       }
>   
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
>           return cpu_gpr[reg_num];
> @@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cs = cs;
>       ctx->ntemp = 0;
>       memset(ctx->temp, 0, sizeof(ctx->temp));
> -    ctx->nftemp = 0;
> -    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> @@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>           ctx->temp[i] = NULL;
>       }
>       ctx->ntemp = 0;
> -    for (i = ctx->nftemp - 1; i >= 0; --i) {
> -        tcg_temp_free_i64(ctx->ftemp[i]);
> -        ctx->ftemp[i] = NULL;
> -    }
> -    ctx->nftemp = 0;
>   
>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>       if (ctx->base.is_jmp == DISAS_NEXT) {
