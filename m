Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp3685317ejc;
        Sun, 26 Feb 2023 05:00:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8FlPOQf+OYCpu3+XD4qkI+lb9l6ugD+CIBkkLqOAZGrIu28mepPYmHVMXc1L1xyKk89c6i
X-Received: by 2002:a05:6214:21a3:b0:56e:b966:4089 with SMTP id t3-20020a05621421a300b0056eb9664089mr39126859qvc.23.1677416400312;
        Sun, 26 Feb 2023 05:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677416400; cv=none;
        d=google.com; s=arc-20160816;
        b=Nl7f9GJ87s2BX9HrgFZpJwI83W7E9XzoFa+OZAuHS5nTuYImsDbrcPL7fDpTGA1A/B
         IwrQnfmTDN3P2jDpD1fHERmXzRc3L7Qqv7PRLasyvoU3bvjoa7iCP+0+XsCJa37bchDV
         x0s1wQJ0F/6XduGCpXuczPIcLhvufIYYKaPKuXjRs+oTkx/cdjVK4MN7Vs9soP0SyoRj
         znyIDYiYR8jsr8rZTZKF243JkSrTsUlZqcavpTR8buOKsPAGPxc26iVeb7pOamHGcFC7
         VsfjKlOCDH/gHC8a2fees18xzpnTzcYC32QenrbBrzVWNnta0AnAH0FiTcb6nzgrwm3V
         STZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=+bA4yXFYS1VYPgg1jm4Tnc0ICn9PuOPmlWUNl5y13RA=;
        b=qe4+rroc/o90JxRGssCYa8vBfxQoozBCweFbGMPuYWtVr+FHXlQuMynDbrmiLbt+ZA
         ZtEub3x1C+v9HYM2sJxjqIdfKL4agDpi87aT6r4yM36XPVrwiLYnBVCREQS3+Pj46VD0
         Ph1Yj2X06j0mSriQC+0YK8UQO9glTwML0K6uEKH9N6GZCKQeJxNEkP8q2D/hwjtyWk0e
         VfscWWfzUt7eICQczbUPuADnGhnWZ5tmP6zvk+3rQTRW3YeB9wKoZKMjNMiwgJ/VOXGP
         pZmoa6oRtxLNOGBRKFsB0p4dA0QP1Ne/Q+BWdbjTM6W/9Su/H1XrRy364Lj7feawgFuN
         3xjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm27-20020a05620a1d5b00b00742834c03b5si3682952qkb.24.2023.02.26.05.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 05:00:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWGc4-0006Wl-QM; Sun, 26 Feb 2023 07:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGc2-0006Vu-4x; Sun, 26 Feb 2023 07:58:46 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWGbz-0001J5-3t; Sun, 26 Feb 2023 07:58:45 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3OqBqV_tjFdi7CA--.55403S2;
 Sun, 26 Feb 2023 20:58:19 +0800 (CST)
Message-ID: <0c1f5d05-9dc3-24d7-af0d-679d8402572e@iscas.ac.cn>
Date: Sun, 26 Feb 2023 20:58:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 51/76] target/riscv: Drop ftemp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-52-richard.henderson@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230225091427.1817156-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAB3OqBqV_tjFdi7CA--.55403S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1UWF1fJr48Kw1fZw47Jwb_yoW5Zryrpr
 4Sk342vF1FqrySva9rtw4DZF15Zr4xCF1UK3s0gw48Cr42qr1kJ395K34YvFW09FZ5Zr4Y
 kF4DCry5Aa12qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x07j8GYLUUUUU=
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B4q5jeJPECpu


On 2023/2/25 17:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

How about the temp_new?

Regards,

Weiwei Li

> ---
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

