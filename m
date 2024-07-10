Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp319083njb;
        Wed, 10 Jul 2024 05:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu1LvTM5NN1jEg5gaqbx33L8X8lJdxdqLHQXhDmDV+8HDlPioUk8k5xsPtcw8gpDRJo5d0bU8VYynXprmjwxj7gXlQpy7m
X-Google-Smtp-Source: AGHT+IFf+f987cYEoVMRSpq2MPqYJwVQKiDP+ksSL3M1883W7SpT2Nwu+5hpUnHkY45D8eRRGbpN
X-Received: by 2002:a05:620a:269b:b0:79f:78a:f7b4 with SMTP id af79cd13be357-79f19a805aamr698005485a.42.1720613924233;
        Wed, 10 Jul 2024 05:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720613924; cv=none;
        d=google.com; s=arc-20160816;
        b=o6OGXobGb06Hzp1jKWztvtE1ra0mZeuf8doTcWCA+3s4in6G9/JSXp/NNSDGAPoamW
         7S7S3BJGK1TPXTwOROoZKl2TYdJN3/gM05qb4pMFGtNeWWV39OBuOyiKw7PoG9KcvnU3
         GQb2WjIMqy753ZONniGpkf3OR7QTR5HfA1uJq6JrmbGcoz35Co+Mf0NjqDNlkhgscsM0
         0z/n54lPDUtn38g/gPBLrWQBtpLFiRT52OmJ6mQj/0zyDeGY1Kb1sShkcjvUPMqEuaE2
         LUmfZXzoV0ihZ6jgUt7Ru27qtKcTzuWTqyOeQFu7mkbnEZ6rT6P53GK8+KFi5kIyH/UX
         45Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=860wqQ7Tyhy53ZCHqsN0cdaLsoXTeIHTvFBh5Q2nRdo=;
        fh=rm/kdaPET133yykskS8xfxkdHKlgdt+Au8v/zfBGSUQ=;
        b=YKlAoqxoFzjdPaZlt6OXBrmBWXuCj5eGP1MpvJYu7Q/nSRbqXyMToDh+F+Jtbr1+gd
         g9QV+wsA33KNgxHXu9UfoMN74ox/qVTjiOH3HRee/7V6RKGS4SQNi5Ae9EwIaa/9rn6I
         7zA0ljXZoHLJeMpttYHrX43bJWnd8Kx6b8wS4MBxVRV1WXYZD5IcdJTc/aJezg+aiESf
         8G4ONX3UT3L/gJ5A4WcALk884f5sZkHRxc/nnj9FPuWMqb1bOnju3Y2Sdt9J71H8lzby
         RlJZGuBHPHCi38vZJ2zSXjGiRro3bWOJY9iSFD2/MHJS2wyCYm+a6SZZDdoDrLbnTtSC
         Z6qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f1902abf6si441805185a.204.2024.07.10.05.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 05:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRWGp-0001sc-8j; Wed, 10 Jul 2024 08:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWGn-0001qs-BK; Wed, 10 Jul 2024 08:18:01 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWGc-0007DY-Sh; Wed, 10 Jul 2024 08:17:53 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E6BC4E601B;
 Wed, 10 Jul 2024 14:17:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id djzZqR-pUrO3; Wed, 10 Jul 2024 14:17:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8B4354E6005; Wed, 10 Jul 2024 14:17:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8983A746E3B;
 Wed, 10 Jul 2024 14:17:45 +0200 (CEST)
Date: Wed, 10 Jul 2024 14:17:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
Subject: Re: [PATCH v2 07/13] target/ppc: Split out helper_dbczl for 970
In-Reply-To: <20240710032814.104643-8-richard.henderson@linaro.org>
Message-ID: <66e91236-02d1-5e81-20df-5db4146b624b@eik.bme.hu>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-8-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 4oEy6uP0fRAz

On Tue, 9 Jul 2024, Richard Henderson wrote:
> We can determine at translation time whether the insn is or
> is not dbczl.  We must retain a runtime check against the
> HID5 register, but we can move that to a separate function
> that never affects other ppc models.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan

> ---
> target/ppc/helper.h     |  7 +++++--
> target/ppc/mem_helper.c | 34 +++++++++++++++++++++-------------
> target/ppc/translate.c  | 24 ++++++++++++++----------
> 3 files changed, 40 insertions(+), 25 deletions(-)
>
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 76b8f25c77..afc56855ff 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -46,8 +46,11 @@ DEF_HELPER_FLAGS_3(stmw, TCG_CALL_NO_WG, void, env, tl, i32)
> DEF_HELPER_4(lsw, void, env, tl, i32, i32)
> DEF_HELPER_5(lswx, void, env, tl, i32, i32, i32)
> DEF_HELPER_FLAGS_4(stsw, TCG_CALL_NO_WG, void, env, tl, i32, i32)
> -DEF_HELPER_FLAGS_3(dcbz, TCG_CALL_NO_WG, void, env, tl, i32)
> -DEF_HELPER_FLAGS_3(dcbzep, TCG_CALL_NO_WG, void, env, tl, i32)
> +DEF_HELPER_FLAGS_2(dcbz, TCG_CALL_NO_WG, void, env, tl)
> +DEF_HELPER_FLAGS_2(dcbzep, TCG_CALL_NO_WG, void, env, tl)
> +#ifdef TARGET_PPC64
> +DEF_HELPER_FLAGS_2(dcbzl, TCG_CALL_NO_WG, void, env, tl)
> +#endif
> DEF_HELPER_FLAGS_2(icbi, TCG_CALL_NO_WG, void, env, tl)
> DEF_HELPER_FLAGS_2(icbiep, TCG_CALL_NO_WG, void, env, tl)
> DEF_HELPER_5(lscbx, tl, env, tl, i32, i32, i32)
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index 5067919ff8..d4957efd6e 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -296,26 +296,34 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>     }
> }
>
> -void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
> +void helper_dcbz(CPUPPCState *env, target_ulong addr)
> {
> -    int dcbz_size = env->dcache_line_size;
> -
> -#if defined(TARGET_PPC64)
> -    /* Check for dcbz vs dcbzl on 970 */
> -    if (env->excp_model == POWERPC_EXCP_970 &&
> -        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
> -        dcbz_size = 32;
> -    }
> -#endif
> -
> -    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
> +    dcbz_common(env, addr, env->dcache_line_size,
> +                ppc_env_mmu_index(env, false), GETPC());
> }
>
> -void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
> +void helper_dcbzep(CPUPPCState *env, target_ulong addr)
> {
>     dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
> }
>
> +#ifdef TARGET_PPC64
> +void helper_dcbzl(CPUPPCState *env, target_ulong addr)
> +{
> +    int dcbz_size = env->dcache_line_size;
> +
> +    /*
> +     * The translator checked for POWERPC_EXCP_970.
> +     * All that's left is to check HID5.
> +     */
> +    if (((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
> +        dcbz_size = 32;
> +    }
> +
> +    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
> +}
> +#endif
> +
> void helper_icbi(CPUPPCState *env, target_ulong addr)
> {
>     addr &= ~(env->dcache_line_size - 1);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0bc16d7251..2664c94522 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -200,6 +200,7 @@ struct DisasContext {
>     uint32_t flags;
>     uint64_t insns_flags;
>     uint64_t insns_flags2;
> +    powerpc_excp_t excp_model;
> };
>
> #define DISAS_EXIT         DISAS_TARGET_0  /* exit to main loop, pc updated */
> @@ -4445,27 +4446,29 @@ static void gen_dcblc(DisasContext *ctx)
> /* dcbz */
> static void gen_dcbz(DisasContext *ctx)
> {
> -    TCGv tcgv_addr;
> -    TCGv_i32 tcgv_op;
> +    TCGv tcgv_addr = tcg_temp_new();
>
>     gen_set_access_type(ctx, ACCESS_CACHE);
> -    tcgv_addr = tcg_temp_new();
> -    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
>     gen_addr_reg_index(ctx, tcgv_addr);
> -    gen_helper_dcbz(tcg_env, tcgv_addr, tcgv_op);
> +
> +#ifdef TARGET_PPC64
> +    if (ctx->excp_model == POWERPC_EXCP_970 && !(ctx->opcode & 0x00200000)) {
> +        gen_helper_dcbzl(tcg_env, tcgv_addr);
> +        return;
> +    }
> +#endif
> +
> +    gen_helper_dcbz(tcg_env, tcgv_addr);
> }
>
> /* dcbzep */
> static void gen_dcbzep(DisasContext *ctx)
> {
> -    TCGv tcgv_addr;
> -    TCGv_i32 tcgv_op;
> +    TCGv tcgv_addr = tcg_temp_new();
>
>     gen_set_access_type(ctx, ACCESS_CACHE);
> -    tcgv_addr = tcg_temp_new();
> -    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
>     gen_addr_reg_index(ctx, tcgv_addr);
> -    gen_helper_dcbzep(tcg_env, tcgv_addr, tcgv_op);
> +    gen_helper_dcbzep(tcg_env, tcgv_addr);
> }
>
> /* dst / dstt */
> @@ -6480,6 +6483,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>     ctx->hv = (hflags >> HFLAGS_HV) & 1;
>     ctx->insns_flags = env->insns_flags;
>     ctx->insns_flags2 = env->insns_flags2;
> +    ctx->excp_model = env->excp_model;
>     ctx->access_type = -1;
>     ctx->need_access_type = !mmu_is_64bit(env->mmu_model);
>     ctx->le_mode = (hflags >> HFLAGS_LE) & 1;
>
