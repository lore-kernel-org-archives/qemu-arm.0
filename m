Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp155245ejb;
        Tue, 22 Aug 2023 12:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjx/TGnzcHusNTifSQVm/hmShl5M2Jwzrnu354rbzaeskligE88hiopqkmvuu6lKqI6JYZ
X-Received: by 2002:a9d:75cf:0:b0:6bc:8afe:8a15 with SMTP id c15-20020a9d75cf000000b006bc8afe8a15mr9174617otl.38.1692732971493;
        Tue, 22 Aug 2023 12:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692732971; cv=none;
        d=google.com; s=arc-20160816;
        b=Cm2O6pNWCU5Ftt2Pp9Lc/GLZMmbyTCPeYZ1GGKprEb6nEw2vtXHNcvmPzjf0QouhOF
         xcoQjEMhAs81wc4JYwxNq75bExd4MrYajCqyaBOpM+fwF1jvdDSFwhxp1GzzJDUQNtTP
         VyOJkUetDO5nEwe3UDBdTrtqXn43eCQiM25W3tnvEOXk278oUUbINpAhazmTEQ4Tnhj8
         FMT+RTjuQBcasrHzRnPdLPWbmguQx6ycufpgbn0Sn0ntKv4cmHEDU4CAgxj01LPkar3p
         URbqVYufwTE8ovJWDNWnzRXRBXuu2wFVok84cZnwi0EMrGJgBGx7Eb9jO/YNx3XxFhuu
         z41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pi6u8nhTxNWWImtIBVRDSWH2gIx5ZJYdBOHv8ddVtD4=;
        fh=1dsEDLt5sZesQVlpsBGIgGtFGeyFYKZAtTBWW8tezGs=;
        b=j6kwZ7ZNfPTgyXRdYmE39wFlMunbPA6MgYImzbWF1so23hBYj6QHHhSX3VEH59Nqhi
         bVr2G1+HuXMpY5KuO3waxeSX8cpGI8WgoXYspHEEq/i78mLJML8Vx936/ZKitLGMTmlu
         lALGcY7ovNsMwTvTvCPityZrNvk5OB/4vjTxVcXH+QrWVlmEt5bd2/hmlWpmnjVLSVcK
         BSJ+4YhkAu3jFkSeNOJqsvURpWhCG0CDf/C0qCbQDkF56PtFozqbWtCKBAb3kGJVjLPJ
         bXBA/ovi8DzNxITwt76Icx6VbjfBzVwgE2OrLh37KFTcvG1sz6S9RZfO+0KVbIW8POeN
         ZM1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=OMb2Q9uy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05622a118d00b00403cfeb4157si4540357qtk.296.2023.08.22.12.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 12:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=OMb2Q9uy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qYXAY-000759-Jk; Tue, 22 Aug 2023 15:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qYXAP-0006v8-Gl; Tue, 22 Aug 2023 15:35:56 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qYXAM-0005Ky-1L; Tue, 22 Aug 2023 15:35:53 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bd066b0fd4so3184873a34.2; 
 Tue, 22 Aug 2023 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692732948; x=1693337748;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pi6u8nhTxNWWImtIBVRDSWH2gIx5ZJYdBOHv8ddVtD4=;
 b=OMb2Q9uy311jLMpOVmJCgZ0SgOLhfwlnvtJ5fgZR82auxqwX/pcR+C+PjMvIfp7KiO
 vvXF+gKm2k/Lnkj0y+5pUNbGVmxV38L0kUwlJmo/BoWoGahbtnf90EK/z8hloIBuHwQl
 fS+Bv1uzoWYbbgCF2DyJYUVJiZfubWlzeAFLMk7GPKTmgQVi7HVUx5ByWAOkngrL+qNI
 /VTsjnaaZll9fuU7l44Ws8GWC2fADo1xMRdCkwQxl4HMGgdzNCW+X9XpVtSIZtQNLA07
 EwqRk08VTom39rY4bddRx52JA+51mDGHV7SVD6Y/SH7CayzQKGGDVuRxxLfx3nPZtSPN
 dAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692732948; x=1693337748;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pi6u8nhTxNWWImtIBVRDSWH2gIx5ZJYdBOHv8ddVtD4=;
 b=ko3jprKhgDn3hFDq1FHJN6fILYpJHHlCIFok4+/VnQgPJX2/CNXAHpZWg72bjfESfN
 AxLNcsBntDrcQwdjM/IwKfrAkUp3baP1SuAKrhIToCo15PTrX7iQzsGKrcQFt8/ASpjL
 JNwOuvZ3vLnBq1IzQQdpD06JjFzzpfYtjtQnxet0echkmy1E4skcs3S297Ex2x2LjNHc
 Ns/qK6o3X2Exy4DLysuNrLo5X0gCWRZwHU43WYQKqLi5jrhb64tKoXJnJs07rN/PwvSZ
 R1FvJKDmitDCkOKAhD9vRI2SMir/+uOimDCEWUIEgb8ZpUu0vXL3h/SKHTaVn09rQwBT
 dSdQ==
X-Gm-Message-State: AOJu0Yy2KolmmgEA9+qhb3v2TFtP0JctZJLghC2J3QBKBjUbHLmdv39k
 R/chA7UxQVjjRdvBXr4Bt3o=
X-Received: by 2002:a05:6830:1447:b0:6b9:c5b5:6a96 with SMTP id
 w7-20020a056830144700b006b9c5b56a96mr8875768otp.6.1692732947666; 
 Tue, 22 Aug 2023 12:35:47 -0700 (PDT)
Received: from [192.168.68.108] ([179.93.21.19])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a9d6b82000000b006b9a98b9659sm1264419otq.19.2023.08.22.12.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 12:35:47 -0700 (PDT)
Message-ID: <d09c805d-dcc3-83eb-c7ab-19de2e215d52@gmail.com>
Date: Tue, 22 Aug 2023 16:35:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/12] target/ppc: Use generic hrev64_i64() in BRH /
 BSWAP16x8 opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125332.55086-1-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230822125332.55086-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.767,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: +KdGZQJPM/fZ



On 8/22/23 09:53, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate.c              | 10 +---------
>   target/ppc/translate/vsx-impl.c.inc | 19 ++-----------------
>   2 files changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 74796ec7ba..91a9ec2d1c 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6435,15 +6435,7 @@ static void gen_brw(DisasContext *ctx)
>   /* brh */
>   static void gen_brh(DisasContext *ctx)
>   {
> -    TCGv_i64 mask = tcg_constant_i64(0x00ff00ff00ff00ffull);
> -    TCGv_i64 t1 = tcg_temp_new_i64();
> -    TCGv_i64 t2 = tcg_temp_new_i64();
> -
> -    tcg_gen_shri_i64(t1, cpu_gpr[rS(ctx->opcode)], 8);
> -    tcg_gen_and_i64(t2, t1, mask);
> -    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], mask);
> -    tcg_gen_shli_i64(t1, t1, 8);
> -    tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
> +    tcg_gen_hrev64_i64(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)]);
>   }
>   #endif
>   
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 0f5b0056f1..639ab7f1bc 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -154,23 +154,8 @@ static void gen_lxvdsx(DisasContext *ctx)
>   static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
>                             TCGv_i64 inh, TCGv_i64 inl)
>   {
> -    TCGv_i64 mask = tcg_constant_i64(0x00FF00FF00FF00FF);
> -    TCGv_i64 t0 = tcg_temp_new_i64();
> -    TCGv_i64 t1 = tcg_temp_new_i64();
> -
> -    /* outh = ((inh & mask) << 8) | ((inh >> 8) & mask) */
> -    tcg_gen_and_i64(t0, inh, mask);
> -    tcg_gen_shli_i64(t0, t0, 8);
> -    tcg_gen_shri_i64(t1, inh, 8);
> -    tcg_gen_and_i64(t1, t1, mask);
> -    tcg_gen_or_i64(outh, t0, t1);
> -
> -    /* outl = ((inl & mask) << 8) | ((inl >> 8) & mask) */
> -    tcg_gen_and_i64(t0, inl, mask);
> -    tcg_gen_shli_i64(t0, t0, 8);
> -    tcg_gen_shri_i64(t1, inl, 8);
> -    tcg_gen_and_i64(t1, t1, mask);
> -    tcg_gen_or_i64(outl, t0, t1);
> +    tcg_gen_hrev64_i64(outh, inh);
> +    tcg_gen_hrev64_i64(outl, inl);
>   }
>   
>   static void gen_bswap32x4(TCGv_i64 outh, TCGv_i64 outl,
