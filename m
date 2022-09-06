Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2970046ejh;
        Tue, 6 Sep 2022 06:57:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Xc/IsvNKZeJXqTUmBWJ8BS/wsbUN72B+JS6isBwp3NLsVdpQJJ9hkEhwINY0FduCtoJkA
X-Received: by 2002:a05:620a:198e:b0:6bb:7651:fc7 with SMTP id bm14-20020a05620a198e00b006bb76510fc7mr35058762qkb.376.1662472661766;
        Tue, 06 Sep 2022 06:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662472661; cv=none;
        d=google.com; s=arc-20160816;
        b=Fndt5MdATDauwaosntDM2eJw+AKSsT46VQGRfIH70Hw5qq6PWawB7T9hwi3E8t/RGS
         AQB7CpUzmUXLWl3C6qFJMC4Hv9LWpZrDa+nTJVDE04iRvYi4zuoDN7ffE9ks37KMBpL/
         u6iipeEBOB0ERfn11MfLDWaQlkYymTrO8WOMxu3qdywTjucLQGAV25/w7yfbgHpBkifC
         shv3htmgzvn5K930RqXZyMfitZ1Ye+nD4g6JFQvE8/qxoGmE/g5Tuvm+M7zvQwoZpJFL
         d5ErzM+ruhz/IEGwlDIWDDzjxHV4aJf9hVq9z6y1Kvcr4/FJc1TsJ1e8WUS6XN9Dh2J9
         uTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/UPj5ZUAmK0lgUPCIE0D7bFsjXDQOqLmIMDoos0kklc=;
        b=XEoDa4SwsRzn8wVICrXI2VxvaZzLeZuR5gzJwQo3zlBax1SUSQERDlPcc+Fe+wNP1/
         Qsv78KCXJCzJXnt/osQm4Y1zG782ymzo3i6uBKmbdxhrcseO0MiK8V4VC1zpxXEtqFY7
         aF/NabZO0lUx/rEeWdIJTkJ+vIuT0XLHgPSD2kZbe2mrXVA8KnBGicCIRkq+20yZsdzN
         m2hSUWXlPOMlHdx4zaZSfwaKkC9SJQvIEG7U42hDfsvt3TSUGpGEZF53X6rTu1Od65Xm
         /7JXxHxQifgL5e/KWjRBUTJP848DqBaY28N26XWGHyR902GoijETcpxbbpzQPnTd1AnY
         Jmvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=qm72ScYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac853ca000000b0034303b74996si6438310qtq.308.2022.09.06.06.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 06:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=qm72ScYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVZ5B-0001Hi-7K
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 09:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVY43-0004Mf-Jk; Tue, 06 Sep 2022 08:52:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVY3y-0001NX-AW; Tue, 06 Sep 2022 08:52:25 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z9-20020a17090a468900b001ffff693b27so9868464pjf.2; 
 Tue, 06 Sep 2022 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=/UPj5ZUAmK0lgUPCIE0D7bFsjXDQOqLmIMDoos0kklc=;
 b=qm72ScYULvncSeZWUiFyc7839I0T/p5VELjMkjAIvgnTHgGTskrfCmA6RcEj+JU7Pc
 LTvw1kqB+ppLzFYPtlmz3LcDgvgsyBkTi1B0sVP4ygPINJ3trt46GDUheEe0cUw7jXIE
 tkVKsmJWsbRp01/y5Y2HARxmVBtuMLP/PCVwK2ORAZhN6XfvGBZun+TL0ncsrYNXq0V0
 6OLI+871U8WwrqjFmzSfmX92nTyXhXQSqwUiwKVf6ARyc+4h9RO8MJXJMKttKrORz1dG
 ClvihIMgut2aj/nskyZZxvYw8lmEZIDqfDdV19S0WTzxwAgu0QSsik10Eoed64AMJkrN
 cLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=/UPj5ZUAmK0lgUPCIE0D7bFsjXDQOqLmIMDoos0kklc=;
 b=1UFnI2WcpF6Lxhkn2J7wCYyaXXtFOEJfum6x3eDsG4gXOlfKN21lCiskfxGNiDt6BR
 sOs1OfghoFsVI5pOJ/9FN4gYHDPsbNkx79YeOT75mQ+5bFMQzQk7eILQnV9Vazj7MESj
 W0+BGk+NuTaHPAqSBHUZSU9Uq9iCeCLFEMkRU1qKU8IH6gNScdcooEBbHYAtWAn0YZmT
 9uu2BqjQahkNt14Tp7c+RBb24lJdwyCYz8AOUyc8SobgDwMd6dRst4vyNiCuhfvGcTs3
 CxwCmMYN6CaRGXK8ATcC2+h+xkN+Li+p/M8+zVW/6pyueHok5E1MSS7cG06kJXzuEwSz
 DjWA==
X-Gm-Message-State: ACgBeo02VdXCUqxG9A2wBPJEOLH2NWP82Q2tFQ8u+L3ZEzUDxCn8xWyw
 cc84L39X/u5qeDT5KxizomI=
X-Received: by 2002:a17:903:234e:b0:174:d56d:3f0d with SMTP id
 c14-20020a170903234e00b00174d56d3f0dmr40529391plh.47.1662468739919; 
 Tue, 06 Sep 2022 05:52:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 202-20020a6216d3000000b0053e2ffa9652sm1544302pfw.88.2022.09.06.05.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 05:52:19 -0700 (PDT)
Message-ID: <f8c471d1-7f4c-e491-d7fa-1df73aedc20b@amsat.org>
Date: Tue, 6 Sep 2022 14:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/9] target/arm: Change gen_goto_tb to work on
 displacements
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-3-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: HIKN/ltrTcl+

Hi Richard,

On 6/9/22 12:05, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 40 ++++++++++++++++++++------------------
>   target/arm/translate.c     | 10 ++++++----
>   2 files changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b7787e7786..f7a13bddea 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -378,8 +378,10 @@ static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
>       return translator_use_goto_tb(&s->base, dest);
>   }
>   
> -static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
> +static void gen_goto_tb(DisasContext *s, int n, int diff)
>   {
> +    uint64_t dest = s->pc_curr + diff;
> +
>       if (use_goto_tb(s, dest)) {
>           tcg_gen_goto_tb(n);
>           gen_a64_set_pc_im(dest);
> @@ -1362,7 +1364,7 @@ static inline AArch64DecodeFn *lookup_disas_fn(const AArch64DecodeTable *table,
>    */
>   static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
>   {
> -    uint64_t addr = s->pc_curr + sextract32(insn, 0, 26) * 4;
> +    int diff = sextract32(insn, 0, 26) * 4;
>   
>       if (insn & (1U << 31)) {
>           /* BL Branch with link */
> @@ -1371,7 +1373,7 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
>   
>       /* B Branch / BL Branch with link */
>       reset_btype(s);
> -    gen_goto_tb(s, 0, addr);
> +    gen_goto_tb(s, 0, diff);
>   }
>   
>   /* Compare and branch (immediate)
> @@ -1383,14 +1385,14 @@ static void disas_uncond_b_imm(DisasContext *s, uint32_t insn)
>   static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
>   {
>       unsigned int sf, op, rt;
> -    uint64_t addr;
> +    int diff;
>       TCGLabel *label_match;
>       TCGv_i64 tcg_cmp;
>   
>       sf = extract32(insn, 31, 1);
>       op = extract32(insn, 24, 1); /* 0: CBZ; 1: CBNZ */
>       rt = extract32(insn, 0, 5);
> -    addr = s->pc_curr + sextract32(insn, 5, 19) * 4;
> +    diff = sextract32(insn, 5, 19) * 4;
>   
>       tcg_cmp = read_cpu_reg(s, rt, sf);
>       label_match = gen_new_label();
> @@ -1399,9 +1401,9 @@ static void disas_comp_b_imm(DisasContext *s, uint32_t insn)
>       tcg_gen_brcondi_i64(op ? TCG_COND_NE : TCG_COND_EQ,
>                           tcg_cmp, 0, label_match);
>   
> -    gen_goto_tb(s, 0, s->base.pc_next);
> +    gen_goto_tb(s, 0, 4);

Why not use curr_insn_len() here?

>       gen_set_label(label_match);
> -    gen_goto_tb(s, 1, addr);
> +    gen_goto_tb(s, 1, diff);
>   }
