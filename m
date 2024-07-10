Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp320747njb;
        Wed, 10 Jul 2024 05:21:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgNlPVJQTVLkBvE5E0JIohXS2ITccKpe9buEym8gAxH+j+nHx/Vf/N44/odTyUF/1zZZGjDMpy0ALOzMGYW3oiCRGBFazp
X-Google-Smtp-Source: AGHT+IF6+CN0XI/YV7+0K40X6tQso2ywfq4XDX42z2e7JSYhu0W2EE4FMawARadIWdp73in7KKN4
X-Received: by 2002:a9d:7383:0:b0:703:5e9e:bab1 with SMTP id 46e09a7af769-70375a17aeemr5354632a34.20.1720614097254;
        Wed, 10 Jul 2024 05:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720614097; cv=none;
        d=google.com; s=arc-20160816;
        b=UrbFAeINFsrYL+iBYfqxUZkXu8ki2qRnCm1PlIH8FfmCxxdBkfC1bu16Etp32nH1We
         1SU6tPxbbqV5VXRmYBIHeiSMkDSZn/2StoLjpmjGKEzpkAfaiRTaK/lE9BsCuCvhyhza
         NxuI67PJbZBv+F7epGWtZJ17PpfrYKOdlgvwcKXTqvaJx+I97B2Z87/3SKZ5j6Dm3T7Y
         W7YjPxhpIgg0tbxwQx8J96tUEfnd+11gGwh59/0OdBtGJyhRQpB3guTkcMv7o33YPQIH
         4NnXy/YReHyQB0QKnqWcmh2TQCIVUOeIZQeG9m+hT9L/vwqioXdJDYxmTGeEHqGFptgb
         8ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=P4DWcLVTg6w8/fF/ZdWvfVx7QeyjMcC3et0+FOWkTW0=;
        fh=rm/kdaPET133yykskS8xfxkdHKlgdt+Au8v/zfBGSUQ=;
        b=XNL2mxSIJIustNdZ00JZEw2wHT4+n51pGWZmEAeDlPxdUdPhh3rKz3Qrpsk4FU1C4X
         zXQ8SBcFuAlb87IlhEImr8T2V06QT2fR2/YHmdmaF5TNLVagdAOK0FeEO6ldI91SxXDN
         Ea5ZseXvFDm8grcXI6e97r6Bxh9JLedySRX6N5HnjvKB5dOc8Yuh3We40sLT/h+uUkN3
         DWE507rzmku5CoH/pLBnzyOD6xFB+FyksD+HeYh5/d/FzZGU5e9Ut4P6YC7Uyoe/e5ND
         AhNRtTtpq4lLS7KPxoZ9PAFYKxR63YABLTHDQd/lTecHoCQb/dUWtCXVZMQ4HwIjbtJa
         uiSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9be60e0si44665211cf.570.2024.07.10.05.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 05:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRWJk-0007bX-Di; Wed, 10 Jul 2024 08:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWJi-0007Xa-4K; Wed, 10 Jul 2024 08:21:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWJg-0007uG-G5; Wed, 10 Jul 2024 08:21:01 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E40BA4E6005;
 Wed, 10 Jul 2024 14:20:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id pxwWvReYOXsD; Wed, 10 Jul 2024 14:20:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 028624E601B; Wed, 10 Jul 2024 14:20:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 00C79746E3B;
 Wed, 10 Jul 2024 14:20:55 +0200 (CEST)
Date: Wed, 10 Jul 2024 14:20:55 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
Subject: Re: [PATCH v2 08/13] target/ppc: Merge helper_{dcbz,dcbzep}
In-Reply-To: <20240710032814.104643-9-richard.henderson@linaro.org>
Message-ID: <e5887250-eabd-f04b-e95f-0ea27ad8876a@eik.bme.hu>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-9-richard.henderson@linaro.org>
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
X-TUID: 3G15Qb0Q9CvN

On Tue, 9 Jul 2024, Richard Henderson wrote:
> Merge the two and pass the mmu_idx directly from translation.
> Swap the argument order in dcbz_common to avoid extra swaps.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/ppc/helper.h     |  3 +--
> target/ppc/mem_helper.c | 14 ++++----------
> target/ppc/translate.c  |  4 ++--
> 3 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index afc56855ff..4fa089cbf9 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -46,8 +46,7 @@ DEF_HELPER_FLAGS_3(stmw, TCG_CALL_NO_WG, void, env, tl, i32)
> DEF_HELPER_4(lsw, void, env, tl, i32, i32)
> DEF_HELPER_5(lswx, void, env, tl, i32, i32, i32)
> DEF_HELPER_FLAGS_4(stsw, TCG_CALL_NO_WG, void, env, tl, i32, i32)
> -DEF_HELPER_FLAGS_2(dcbz, TCG_CALL_NO_WG, void, env, tl)
> -DEF_HELPER_FLAGS_2(dcbzep, TCG_CALL_NO_WG, void, env, tl)
> +DEF_HELPER_FLAGS_3(dcbz, TCG_CALL_NO_WG, void, env, tl, int)
> #ifdef TARGET_PPC64
> DEF_HELPER_FLAGS_2(dcbzl, TCG_CALL_NO_WG, void, env, tl)

Why only dcbz but not dcbzl as well to make them uniform?

Regards,
BALATON Zoltan

> #endif
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index d4957efd6e..24bae3b80c 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -271,7 +271,7 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
> }
>
> static void dcbz_common(CPUPPCState *env, target_ulong addr,
> -                        int dcbz_size, int mmu_idx, uintptr_t retaddr)
> +                        int mmu_idx, int dcbz_size, uintptr_t retaddr)
> {
>     target_ulong mask = ~(target_ulong)(dcbz_size - 1);
>     void *haddr;
> @@ -296,15 +296,9 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>     }
> }
>
> -void helper_dcbz(CPUPPCState *env, target_ulong addr)
> +void helper_dcbz(CPUPPCState *env, target_ulong addr, int mmu_idx)
> {
> -    dcbz_common(env, addr, env->dcache_line_size,
> -                ppc_env_mmu_index(env, false), GETPC());
> -}
> -
> -void helper_dcbzep(CPUPPCState *env, target_ulong addr)
> -{
> -    dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
> +    dcbz_common(env, addr, mmu_idx, env->dcache_line_size, GETPC());
> }
>
> #ifdef TARGET_PPC64
> @@ -320,7 +314,7 @@ void helper_dcbzl(CPUPPCState *env, target_ulong addr)
>         dcbz_size = 32;
>     }
>
> -    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
> +    dcbz_common(env, addr, ppc_env_mmu_index(env, false), dcbz_size, GETPC());
> }
> #endif
>
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 2664c94522..285734065b 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4458,7 +4458,7 @@ static void gen_dcbz(DisasContext *ctx)
>     }
> #endif
>
> -    gen_helper_dcbz(tcg_env, tcgv_addr);
> +    gen_helper_dcbz(tcg_env, tcgv_addr, tcg_constant_i32(ctx->mem_idx));
> }
>
> /* dcbzep */
> @@ -4468,7 +4468,7 @@ static void gen_dcbzep(DisasContext *ctx)
>
>     gen_set_access_type(ctx, ACCESS_CACHE);
>     gen_addr_reg_index(ctx, tcgv_addr);
> -    gen_helper_dcbzep(tcg_env, tcgv_addr);
> +    gen_helper_dcbz(tcg_env, tcgv_addr, tcg_constant_i32(PPC_TLB_EPID_STORE));
> }
>
> /* dst / dstt */
>
