Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2686715ejc;
        Sat, 25 Feb 2023 02:34:31 -0800 (PST)
X-Google-Smtp-Source: AK7set90JKRlKHqG1vr6HOIbpDX47h3ddLpbPiA7njkddjt08ooZSqjWc55SybMucetV7HJzpCX8
X-Received: by 2002:a05:622a:1009:b0:3bf:c04a:8d47 with SMTP id d9-20020a05622a100900b003bfc04a8d47mr6934735qte.18.1677321271598;
        Sat, 25 Feb 2023 02:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677321271; cv=none;
        d=google.com; s=arc-20160816;
        b=BVPG012P9afVr3+IEEpYjv7dCDpwFZHrk4/V/Ww0xUvMHwCU6DTf+/C/WNe2l7HfaJ
         EdPeuiiUpvw0kS+z4cN1RTvFzoGZTjFrnfH5Klcfx/R5PMxEww5qV+kXDM+ibPyilbhm
         acvLbLQDfRTcYhpA6HR+ndYv8xpwNV14J6ygvm9pnGcFZ+ZsMDjg/M+nftfBn/hAGmPB
         O3wRIBcWmd3Rrp24NasCsDQmezrJl465zM+D3HIDFrph5UvvTXpK/8E0GQKbPEku0Bih
         1nT+hXHJVXr0zVS7Cea8g1DbOPfbfJAK1LQw7C8Ryi0oPsxfZoLRbNkvvCNaF/ErQLZI
         YaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VzH8lq4mNx6FyWsU/chpFxbwzQ1aRqzWc6WI4EXlfCI=;
        b=kOSMiZ+aEc8kYaNUSX9K4x0sLdsS4Jwu8SjdbLN/jsJx1bkxslNOpzYKx3LRPP34Ok
         XYD7cxNfZ4de573fhZFxHTmh2zeu42aPxngrLFtX1tEmkvkcd+nNVn30HkUJgPGgPQMe
         2QHhHXYCLHqBw+ZxCz7ktnZU4YQU5nCIveiQHP8XXIdz6MRjeMExTrJ3t2ljn8dwIAmr
         NdOn2H1vQ1MHI3Fidj3+Q4Vt6+l+rXYHzSPQP4CPqgVC2ZYEGF73rYmSjNeMFZ1m6glB
         abL7qZh8c+wPR31tgUD7EVkuK6VgXH1U/egBqBxJmUPzdkkktZX+LmRp6cU/2R/dAOZ3
         ZPMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AxW47Egv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b003bac7925889si1653473qta.412.2023.02.25.02.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 02:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AxW47Egv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVrse-0006Er-Ea; Sat, 25 Feb 2023 05:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrsN-000693-Bm
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:34:00 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrsJ-0001UI-Ut
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 05:33:59 -0500
Received: by mail-oi1-x22e.google.com with SMTP id s41so663453oiw.13
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 02:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VzH8lq4mNx6FyWsU/chpFxbwzQ1aRqzWc6WI4EXlfCI=;
 b=AxW47EgvTsSUBVRv3FyGC/9fognBjBESBWVLlfhR0WIuo8NxaP1+o2K3fxT4j9f+os
 KYYK9PVcorrQ34WjQ7kNnrECL7UgX711Yz3XHk9udUiH3Q3mZM0oO4VU3bekBhQ/twPn
 9WeIerkoIDfy9uL6onpOEbLpcaFaePn2fCk9zoyxr50vnQRgDXpkpLW83vMA+RfB5L96
 Nr4C9I8rq8hJNrAJNcHPiWeNylhAM7pZ6rF/5vDIiIaTjO0wx2jJIHYuF4NXXJFGAXjI
 rgJemHGLt1ENl7iM4cTtP/uPO4sl76bhNQREfYPEkBmg4EdeQjZRUGmUNR3dplO9P902
 bNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VzH8lq4mNx6FyWsU/chpFxbwzQ1aRqzWc6WI4EXlfCI=;
 b=6B1IyorXWefKnksezCPm7uRfvU5XrmyrY9HELSNrpsk3DRGs/VNXHZ1lxgt2bGdgE3
 45+VVDQU/JrObOFKZN3ClrLxRVSJicB+XDAEPqQyWehEGEcB35AC7e5Izh4pyFP3Vibh
 fIs576MfIkdy6CKLtX8h3pOslGqMXIx5A6ym8Br8mewKWdH4hEEp4q9Q+uYYzLC3XKWi
 8D5pxpVMnfuIwIrreP89jL1YhERfVEfmtihg81n6cwt8rxepzUPDSUfIrSsr0olXGgha
 U+MwiDlmxjFwFolA685oairwnqbTty5qzZ1U8Y/gmvD2zWzIv9gUgTPCj17gbtJEOkJu
 IR/Q==
X-Gm-Message-State: AO0yUKUvaZBylzMAbcVcpHOzkUKrJ9v712DbznsiVGAZ44W0/LKShLnI
 OZ+CGYGdKokfI6ISBregF+4eKQ==
X-Received: by 2002:aca:180a:0:b0:37f:cc3d:a342 with SMTP id
 h10-20020aca180a000000b0037fcc3da342mr4132112oih.1.1677321234210; 
 Sat, 25 Feb 2023 02:33:54 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 r129-20020acaa887000000b0037fa035f4f3sm734880oie.53.2023.02.25.02.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:33:53 -0800 (PST)
Message-ID: <2d5eddd1-095d-f168-2b93-2101b00171c8@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:33:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 53/76] target/riscv: Drop tcg_temp_free
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-54-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-54-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LJJW1NvrhB5s



On 2/25/23 06:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c                   |  7 ---
>   target/riscv/insn_trans/trans_rvb.c.inc    | 24 ----------
>   target/riscv/insn_trans/trans_rvd.c.inc    |  2 -
>   target/riscv/insn_trans/trans_rvf.c.inc    |  9 ----
>   target/riscv/insn_trans/trans_rvi.c.inc    | 37 ---------------
>   target/riscv/insn_trans/trans_rvk.c.inc    | 15 ------
>   target/riscv/insn_trans/trans_rvm.c.inc    | 33 -------------
>   target/riscv/insn_trans/trans_rvv.c.inc    | 55 ----------------------
>   target/riscv/insn_trans/trans_rvzfh.c.inc  | 10 ----
>   target/riscv/insn_trans/trans_xthead.c.inc | 24 +---------
>   10 files changed, 1 insertion(+), 215 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b5d8080a6f..180fa5d30d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -205,8 +205,6 @@ static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
>       TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
>   
>       tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
> -    tcg_temp_free_i64(t_max);
> -    tcg_temp_free_i64(t_nan);
>   }
>   
>   static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
> @@ -621,7 +619,6 @@ static void mark_fs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -        tcg_temp_free(tmp);
>       }
>   
>       if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> @@ -632,7 +629,6 @@ static void mark_fs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_temp_free(tmp);
>       }
>   }
>   #else
> @@ -657,7 +653,6 @@ static void mark_vs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -        tcg_temp_free(tmp);
>       }
>   
>       if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
> @@ -668,7 +663,6 @@ static void mark_vs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_temp_free(tmp);
>       }
>   }
>   #else
> @@ -1019,7 +1013,6 @@ static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
>           f128(dest, desth, src1, src1h, ext2);
>           gen_set_gpr128(ctx, a->rd, dest, desth);
>       }
> -    tcg_temp_free(ext2);
>       return true;
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 990bc94b98..e4dcc7c991 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -64,7 +64,6 @@ static void gen_clzw(TCGv ret, TCGv arg1)
>       TCGv t = tcg_temp_new();
>       tcg_gen_shli_tl(t, arg1, 32);
>       tcg_gen_clzi_tl(ret, t, 32);
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_clz(DisasContext *ctx, arg_clz *a)
> @@ -161,8 +160,6 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
>   
>       gen_sbop_mask(t, shamt);
>       tcg_gen_or_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_bset(DisasContext *ctx, arg_bset *a)
> @@ -183,8 +180,6 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
>   
>       gen_sbop_mask(t, shamt);
>       tcg_gen_andc_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
> @@ -205,8 +200,6 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
>   
>       gen_sbop_mask(t, shamt);
>       tcg_gen_xor_tl(ret, arg1, t);
> -
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_binv(DisasContext *ctx, arg_binv *a)
> @@ -252,9 +245,6 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
>   
>       /* sign-extend 64-bits */
>       tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>   }
>   
>   static bool trans_ror(DisasContext *ctx, arg_ror *a)
> @@ -270,8 +260,6 @@ static void gen_roriw(TCGv ret, TCGv arg1, target_long shamt)
>       tcg_gen_trunc_tl_i32(t1, arg1);
>       tcg_gen_rotri_i32(t1, t1, shamt);
>       tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
>   }
>   
>   static bool trans_rori(DisasContext *ctx, arg_rori *a)
> @@ -294,9 +282,6 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
>   
>       /* sign-extend 64-bits */
>       tcg_gen_ext_i32_tl(ret, t1);
> -
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>   }
>   
>   static bool trans_rol(DisasContext *ctx, arg_rol *a)
> @@ -340,8 +325,6 @@ static void gen_orc_b(TCGv ret, TCGv source1)
>   
>       /* Replicate the lsb of each byte across the byte. */
>       tcg_gen_muli_tl(ret, tmp, 0xff);
> -
> -    tcg_temp_free(tmp);
>   }
>   
>   static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
> @@ -357,8 +340,6 @@ static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
>                                                                  \
>       tcg_gen_shli_tl(t, arg1, SHAMT);                           \
>       tcg_gen_add_tl(ret, t, arg2);                              \
> -                                                               \
> -    tcg_temp_free(t);                                          \
>   }
>   
>   GEN_SHADD(1)
> @@ -446,8 +427,6 @@ static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
>                                                                     \
>       tcg_gen_shli_tl(t, t, SHAMT);                                 \
>       tcg_gen_add_tl(ret, t, arg2);                                 \
> -                                                                  \
> -    tcg_temp_free(t);                                             \
>   }
>   
>   GEN_SHADD_UW(1)
> @@ -472,7 +451,6 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
>       TCGv t = tcg_temp_new();
>       tcg_gen_ext32u_tl(t, arg1);
>       tcg_gen_add_tl(ret, t, arg2);
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
> @@ -531,7 +509,6 @@ static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
>   
>       tcg_gen_ext8u_tl(t, src2);
>       tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
> -    tcg_temp_free(t);
>   }
>   
>   static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
> @@ -540,7 +517,6 @@ static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
>   
>       tcg_gen_ext16s_tl(t, src2);
>       tcg_gen_deposit_tl(ret, src1, t, 16, TARGET_LONG_BITS - 16);
> -    tcg_temp_free(t);
>   }
>   
>   static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 6e3159b797..1597bf31d8 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -250,7 +250,6 @@ static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
>           TCGv_i64 t0 = tcg_temp_new_i64();
>           tcg_gen_not_i64(t0, src2);
>           tcg_gen_deposit_i64(dest, t0, src1, 0, 63);
> -        tcg_temp_free_i64(t0);
>       }
>       gen_set_fpr_d(ctx, a->rd, dest);
>       mark_fs_dirty(ctx);
> @@ -273,7 +272,6 @@ static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
>           TCGv_i64 t0 = tcg_temp_new_i64();
>           tcg_gen_andi_i64(t0, src2, INT64_MIN);
>           tcg_gen_xor_i64(dest, src1, t0);
> -        tcg_temp_free_i64(t0);
>       }
>       gen_set_fpr_d(ctx, a->rd, dest);
>       mark_fs_dirty(ctx);
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 965e1f8d11..052408f45c 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -233,9 +233,6 @@ static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
>   
>               /* This formulation retains the nanboxing of rs2 in normal 'F'. */
>               tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
> -
> -            tcg_temp_free_i64(rs1);
> -            tcg_temp_free_i64(rs2);
>           } else {
>               tcg_gen_deposit_i64(dest, src2, src1, 0, 31);
>               tcg_gen_ext32s_i64(dest, dest);
> @@ -281,15 +278,12 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
>           tcg_gen_nor_i64(rs2, rs2, mask);
>           tcg_gen_and_i64(dest, mask, rs1);
>           tcg_gen_or_i64(dest, dest, rs2);
> -
> -        tcg_temp_free_i64(rs2);
>       }
>       /* signed-extended intead of nanboxing for result if enable zfinx */
>       if (ctx->cfg_ptr->ext_zfinx) {
>           tcg_gen_ext32s_i64(dest, dest);
>       }
>       gen_set_fpr_hs(ctx, a->rd, dest);
> -    tcg_temp_free_i64(rs1);
>       mark_fs_dirty(ctx);
>       return true;
>   }
> @@ -329,14 +323,11 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
>            */
>           tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(31, 1));
>           tcg_gen_xor_i64(dest, rs1, dest);
> -
> -        tcg_temp_free_i64(rs2);
>       }
>       /* signed-extended intead of nanboxing for result if enable zfinx */
>       if (ctx->cfg_ptr->ext_zfinx) {
>           tcg_gen_ext32s_i64(dest, dest);
>       }
> -    tcg_temp_free_i64(rs1);
>       gen_set_fpr_hs(ctx, a->rd, dest);
>       mark_fs_dirty(ctx);
>       return true;
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 4496f21266..4ad54e8a49 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -62,7 +62,6 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>           misaligned = gen_new_label();
>           tcg_gen_andi_tl(t0, cpu_pc, 0x2);
>           tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
> -        tcg_temp_free(t0);
>       }
>   
>       gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
> @@ -108,8 +107,6 @@ static TCGCond gen_compare_i128(bool bz, TCGv rl,
>               tcg_gen_xor_tl(tmp, ah, bh);
>               tcg_gen_and_tl(rl, rl, tmp);
>               tcg_gen_xor_tl(rl, rh, rl);
> -
> -            tcg_temp_free(tmp);
>           }
>           break;
>   
> @@ -128,8 +125,6 @@ static TCGCond gen_compare_i128(bool bz, TCGv rl,
>               /* seed third word with 1, which will be result */
>               tcg_gen_sub2_tl(tmp, rh, ah, one, tmp, zero);
>               tcg_gen_sub2_tl(tmp, rl, tmp, rh, bh, zero);
> -
> -            tcg_temp_free(tmp);
>           }
>           break;
>   
> @@ -140,8 +135,6 @@ static TCGCond gen_compare_i128(bool bz, TCGv rl,
>       if (invert) {
>           cond = tcg_invert_cond(cond);
>       }
> -
> -    tcg_temp_free(rh);
>       return cond;
>   }
>   
> @@ -169,8 +162,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>           cond = gen_compare_i128(a->rs2 == 0,
>                                   tmp, src1, src1h, src2, src2h, cond);
>           tcg_gen_brcondi_tl(cond, tmp, 0, l);
> -
> -        tcg_temp_free(tmp);
>       } else {
>           tcg_gen_brcond_tl(cond, src1, src2, l);
>       }
> @@ -254,8 +245,6 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
>       }
>   
>       gen_set_gpr128(ctx, a->rd, destl, desth);
> -
> -    tcg_temp_free(addrl);
>       return true;
>   }
>   
> @@ -344,8 +333,6 @@ static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
>           tcg_gen_addi_tl(addrl, addrl, 8);
>           tcg_gen_qemu_st_tl(src2h, addrl, ctx->mem_idx, MO_TEUQ);
>       }
> -
> -    tcg_temp_free(addrl);
>       return true;
>   }
>   
> @@ -568,14 +555,6 @@ static void gen_sll_i128(TCGv destl, TCGv desth,
>   
>       tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, zero, ll);
>       tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, ll, h1);
> -
> -    tcg_temp_free(ls);
> -    tcg_temp_free(rs);
> -    tcg_temp_free(hs);
> -    tcg_temp_free(ll);
> -    tcg_temp_free(lr);
> -    tcg_temp_free(h0);
> -    tcg_temp_free(h1);
>   }
>   
>   static bool trans_sll(DisasContext *ctx, arg_sll *a)
> @@ -618,14 +597,6 @@ static void gen_srl_i128(TCGv destl, TCGv desth,
>   
>       tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
>       tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, zero, h1);
> -
> -    tcg_temp_free(ls);
> -    tcg_temp_free(rs);
> -    tcg_temp_free(hs);
> -    tcg_temp_free(ll);
> -    tcg_temp_free(lr);
> -    tcg_temp_free(h0);
> -    tcg_temp_free(h1);
>   }
>   
>   static bool trans_srl(DisasContext *ctx, arg_srl *a)
> @@ -659,14 +630,6 @@ static void gen_sra_i128(TCGv destl, TCGv desth,
>   
>       tcg_gen_movcond_tl(TCG_COND_NE, destl, hs, zero, h1, h0);
>       tcg_gen_movcond_tl(TCG_COND_NE, desth, hs, zero, lr, h1);
> -
> -    tcg_temp_free(ls);
> -    tcg_temp_free(rs);
> -    tcg_temp_free(hs);
> -    tcg_temp_free(ll);
> -    tcg_temp_free(lr);
> -    tcg_temp_free(h0);
> -    tcg_temp_free(h1);
>   }
>   
>   static bool trans_sra(DisasContext *ctx, arg_sra *a)
> diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
> index 90f4eeff60..6600c710a7 100644
> --- a/target/riscv/insn_trans/trans_rvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvk.c.inc
> @@ -161,9 +161,6 @@ static bool gen_sha256(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>       tcg_gen_ext_i32_tl(dest, t1);
>   
>       gen_set_gpr(ctx, a->rd, dest);
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
> -    tcg_temp_free_i32(t2);
>       return true;
>   }
>   
> @@ -212,9 +209,6 @@ static bool gen_sha512_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
>       tcg_gen_trunc_i64_tl(dest, t1);
>   
>       gen_set_gpr(ctx, a->rd, dest);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>       return true;
>   }
>   
> @@ -271,9 +265,6 @@ static bool gen_sha512h_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext,
>       tcg_gen_trunc_i64_tl(dest, t1);
>   
>       gen_set_gpr(ctx, a->rd, dest);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>       return true;
>   }
>   
> @@ -310,9 +301,6 @@ static bool gen_sha512_rv64(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>       tcg_gen_trunc_i64_tl(dest, t1);
>   
>       gen_set_gpr(ctx, a->rd, dest);
> -    tcg_temp_free_i64(t0);
> -    tcg_temp_free_i64(t1);
> -    tcg_temp_free_i64(t2);
>       return true;
>   }
>   
> @@ -359,9 +347,6 @@ static bool gen_sm3(DisasContext *ctx, arg_r2 *a, int32_t b, int32_t c)
>       tcg_gen_xor_i32(t1, t1, t0);
>       tcg_gen_ext_i32_tl(dest, t1);
>       gen_set_gpr(ctx, a->rd, dest);
> -
> -    tcg_temp_free_i32(t0);
> -    tcg_temp_free_i32(t1);
>       return true;
>   }
>   
> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
> index ec7f705aab..2f0fd1f700 100644
> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> @@ -45,9 +45,6 @@ static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv bl, TCGv bh)
>   
>       tcg_gen_mulu2_tl(tmpl, tmph, ah, bh);
>       tcg_gen_add2_tl(r2, r3, r2, r3, tmpl, tmph);
> -
> -    tcg_temp_free(tmpl);
> -    tcg_temp_free(tmph);
>   }
>   
>   static void gen_mul_i128(TCGv rl, TCGv rh,
> @@ -63,10 +60,6 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
>       tcg_gen_add2_tl(rh, tmpx, rh, zero, tmpl, tmph);
>       tcg_gen_mulu2_tl(tmpl, tmph, rs1h, rs2l);
>       tcg_gen_add2_tl(rh, tmph, rh, tmpx, tmpl, tmph);
> -
> -    tcg_temp_free(tmpl);
> -    tcg_temp_free(tmph);
> -    tcg_temp_free(tmpx);
>   }
>   
>   static bool trans_mul(DisasContext *ctx, arg_mul *a)
> @@ -92,11 +85,6 @@ static void gen_mulh_i128(TCGv rl, TCGv rh,
>       tcg_gen_and_tl(t1h, t1h, rs1h);
>       tcg_gen_sub2_tl(t0l, t0h, rl, rh, t0l, t0h);
>       tcg_gen_sub2_tl(rl, rh, t0l, t0h, t1l, t1h);
> -
> -    tcg_temp_free(t0l);
> -    tcg_temp_free(t0h);
> -    tcg_temp_free(t1l);
> -    tcg_temp_free(t1h);
>   }
>   
>   static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
> @@ -104,7 +92,6 @@ static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
>       TCGv discard = tcg_temp_new();
>   
>       tcg_gen_muls2_tl(discard, ret, s1, s2);
> -    tcg_temp_free(discard);
>   }
>   
>   static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
> @@ -132,9 +119,6 @@ static void gen_mulhsu_i128(TCGv rl, TCGv rh,
>       tcg_gen_and_tl(t0l, t0h, rs2l);
>       tcg_gen_and_tl(t0h, t0h, rs2h);
>       tcg_gen_sub2_tl(rl, rh, rl, rh, t0l, t0h);
> -
> -    tcg_temp_free(t0l);
> -    tcg_temp_free(t0h);
>   }
>   
>   static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
> @@ -147,9 +131,6 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
>       tcg_gen_sari_tl(rl, arg1, TARGET_LONG_BITS - 1);
>       tcg_gen_and_tl(rl, rl, arg2);
>       tcg_gen_sub_tl(ret, rh, rl);
> -
> -    tcg_temp_free(rl);
> -    tcg_temp_free(rh);
>   }
>   
>   static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
> @@ -160,8 +141,6 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv arg2)
>       tcg_gen_ext32s_tl(t1, arg1);
>       tcg_gen_ext32u_tl(t2, arg2);
>       tcg_gen_mul_tl(ret, t1, t2);
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
>       tcg_gen_sari_tl(ret, ret, 32);
>   }
>   
> @@ -177,7 +156,6 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
>       TCGv discard = tcg_temp_new();
>   
>       tcg_gen_mulu2_tl(discard, ret, s1, s2);
> -    tcg_temp_free(discard);
>   }
>   
>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
> @@ -223,9 +201,6 @@ static void gen_div(TCGv ret, TCGv source1, TCGv source2)
>       tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, temp2);
>   
>       tcg_gen_div_tl(ret, temp1, temp2);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
>   }
>   
>   static bool trans_div(DisasContext *ctx, arg_div *a)
> @@ -258,9 +233,6 @@ static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
>       tcg_gen_movcond_tl(TCG_COND_EQ, temp1, source2, zero, max, source1);
>       tcg_gen_movcond_tl(TCG_COND_EQ, temp2, source2, zero, one, source2);
>       tcg_gen_divu_tl(ret, temp1, temp2);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
>   }
>   
>   static bool trans_divu(DisasContext *ctx, arg_divu *a)
> @@ -306,9 +278,6 @@ static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
>   
>       /* If div by zero, the required result is the original dividend. */
>       tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp1);
> -
> -    tcg_temp_free(temp1);
> -    tcg_temp_free(temp2);
>   }
>   
>   static bool trans_rem(DisasContext *ctx, arg_rem *a)
> @@ -342,8 +311,6 @@ static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
>   
>       /* If div by zero, the required result is the original dividend. */
>       tcg_gen_movcond_tl(TCG_COND_EQ, ret, source2, zero, source1, temp);
> -
> -    tcg_temp_free(temp);
>   }
>   
>   static bool trans_remu(DisasContext *ctx, arg_remu *a)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index bbb5c3a7b5..0607eff5e6 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -198,11 +198,6 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>       gen_set_pc_imm(s, s->pc_succ_insn);
>       lookup_and_goto_ptr(s);
>       s->base.is_jmp = DISAS_NORETURN;
> -
> -    if (rd == 0 && rs1 == 0) {
> -        tcg_temp_free(s1);
> -    }
> -
>       return true;
>   }
>   
> @@ -673,9 +668,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>   
>       fn(dest, mask, base, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -
>       if (!is_store) {
>           mark_vs_dirty(s);
>       }
> @@ -838,9 +830,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>   
>       fn(dest, mask, base, stride, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -
>       if (!is_store) {
>           mark_vs_dirty(s);
>       }
> @@ -949,10 +938,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>   
>       fn(dest, mask, base, index, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -    tcg_temp_free_ptr(index);
> -
>       if (!is_store) {
>           mark_vs_dirty(s);
>       }
> @@ -1092,8 +1077,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>   
>       fn(dest, mask, base, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
>       mark_vs_dirty(s);
>       gen_set_label(over);
>       return true;
> @@ -1154,8 +1137,6 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
>   
>       fn(dest, base, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -
>       if (!is_store) {
>           mark_vs_dirty(s);
>       }
> @@ -1311,9 +1292,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>   
>       fn(dest, mask, src1, src2, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -    tcg_temp_free_ptr(src2);
>       mark_vs_dirty(s);
>       gen_set_label(over);
>       return true;
> @@ -1344,7 +1322,6 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>           gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                   src1, MAXSZ(s), MAXSZ(s));
>   
> -        tcg_temp_free_i64(src1);
>           mark_vs_dirty(s);
>           return true;
>       }
> @@ -1479,9 +1456,6 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>   
>       fn(dest, mask, src1, src2, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -    tcg_temp_free_ptr(src2);
>       mark_vs_dirty(s);
>       gen_set_label(over);
>       return true;
> @@ -1850,7 +1824,6 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
>           gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                   src1, MAXSZ(s), MAXSZ(s));
>   
> -        tcg_temp_free_i32(src1);
>           mark_vs_dirty(s);
>           return true;
>       }
> @@ -2145,7 +2118,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>                   tcg_gen_ext_tl_i64(s1_i64, s1);
>                   tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
>                                        MAXSZ(s), MAXSZ(s), s1_i64);
> -                tcg_temp_free_i64(s1_i64);
>               } else {
>                   tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
>                                       MAXSZ(s), MAXSZ(s), s1);
> @@ -2166,9 +2138,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>                                                 s->cfg_ptr->vlen / 8, data));
>               tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>               fns[s->sew](dest, s1_i64, cpu_env, desc);
> -
> -            tcg_temp_free_ptr(dest);
> -            tcg_temp_free_i64(s1_i64);
>           }
>   
>           mark_vs_dirty(s);
> @@ -2210,7 +2179,6 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>               tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
>               fns[s->sew](dest, s1, cpu_env, desc);
>   
> -            tcg_temp_free_ptr(dest);
>               mark_vs_dirty(s);
>               gen_set_label(over);
>           }
> @@ -2407,10 +2375,6 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>   
>       fn(dest, mask, t1, src2, cpu_env, desc);
>   
> -    tcg_temp_free_ptr(dest);
> -    tcg_temp_free_ptr(mask);
> -    tcg_temp_free_ptr(src2);
> -    tcg_temp_free_i64(t1);
>       mark_vs_dirty(s);
>       gen_set_label(over);
>       return true;
> @@ -2814,11 +2778,9 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>   
>               fns[s->sew - 1](dest, t1, cpu_env, desc);
>   
> -            tcg_temp_free_ptr(dest);
>               mark_vs_dirty(s);
>               gen_set_label(over);
>           }
> -        tcg_temp_free_i64(t1);
>           return true;
>       }
>       return false;
> @@ -3200,10 +3162,6 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>   
>           gen_helper_vcpop_m(dst, mask, src2, cpu_env, desc);
>           gen_set_gpr(s, a->rd, dst);
> -
> -        tcg_temp_free_ptr(mask);
> -        tcg_temp_free_ptr(src2);
> -
>           return true;
>       }
>       return false;
> @@ -3233,9 +3191,6 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>   
>           gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
>           gen_set_gpr(s, a->rd, dst);
> -
> -        tcg_temp_free_ptr(mask);
> -        tcg_temp_free_ptr(src2);
>           return true;
>       }
>       return false;
> @@ -3430,8 +3385,6 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
>       /* Perform the load. */
>       load_element(dest, base,
>                    vreg_ofs(s, vreg), s->sew, false);
> -    tcg_temp_free_ptr(base);
> -    tcg_temp_free_i32(ofs);
>   
>       /* Flush out-of-range indexing to zero.  */
>       t_vlmax = tcg_constant_i64(vlmax);
> @@ -3440,8 +3393,6 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
>   
>       tcg_gen_movcond_i64(TCG_COND_LTU, dest, t_idx,
>                           t_vlmax, dest, t_zero);
> -
> -    tcg_temp_free_i64(t_idx);
>   }
>   
>   static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
> @@ -3501,9 +3452,6 @@ static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
>           vec_element_loadi(s, t1, a->rs2, 0, true);
>           tcg_gen_trunc_i64_tl(dest, t1);
>           gen_set_gpr(s, a->rd, dest);
> -        tcg_temp_free_i64(t1);
> -        tcg_temp_free(dest);
> -
>           return true;
>       }
>       return false;
> @@ -3531,7 +3479,6 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           s1 = get_gpr(s, a->rs1, EXT_NONE);
>           tcg_gen_ext_tl_i64(t1, s1);
>           vec_element_storei(s, a->rd, 0, t1);
> -        tcg_temp_free_i64(t1);
>           mark_vs_dirty(s);
>           gen_set_label(over);
>           return true;
> @@ -3590,7 +3537,6 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>           do_nanbox(s, t1, cpu_fpr[a->rs1]);
>   
>           vec_element_storei(s, a->rd, 0, t1);
> -        tcg_temp_free_i64(t1);
>           mark_vs_dirty(s);
>           gen_set_label(over);
>           return true;
> @@ -3703,7 +3649,6 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>   
>           tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
>                                MAXSZ(s), MAXSZ(s), dest);
> -        tcg_temp_free_i64(dest);
>           mark_vs_dirty(s);
>       } else {
>           static gen_helper_opivx * const fns[4] = {
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 5024e6ecab..03773e2aa8 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -257,9 +257,6 @@ static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
>   
>               /* This formulation retains the nanboxing of rs2 in normal 'Zfh'. */
>               tcg_gen_deposit_i64(dest, rs2, rs1, 0, 15);
> -
> -            tcg_temp_free_i64(rs1);
> -            tcg_temp_free_i64(rs2);
>           } else {
>               tcg_gen_deposit_i64(dest, src2, src1, 0, 15);
>               tcg_gen_ext16s_i64(dest, dest);
> @@ -308,15 +305,11 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
>           tcg_gen_andc_i64(rs2, rs2, mask);
>           tcg_gen_and_i64(dest, mask, rs1);
>           tcg_gen_or_i64(dest, dest, rs2);
> -
> -        tcg_temp_free_i64(mask);
> -        tcg_temp_free_i64(rs2);
>       }
>       /* signed-extended intead of nanboxing for result if enable zfinx */
>       if (ctx->cfg_ptr->ext_zfinx) {
>           tcg_gen_ext16s_i64(dest, dest);
>       }
> -    tcg_temp_free_i64(rs1);
>       mark_fs_dirty(ctx);
>       return true;
>   }
> @@ -356,14 +349,11 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
>            */
>           tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(15, 1));
>           tcg_gen_xor_i64(dest, rs1, dest);
> -
> -        tcg_temp_free_i64(rs2);
>       }
>       /* signed-extended intead of nanboxing for result if enable zfinx */
>       if (ctx->cfg_ptr->ext_zfinx) {
>           tcg_gen_ext16s_i64(dest, dest);
>       }
> -    tcg_temp_free_i64(rs1);
>       mark_fs_dirty(ctx);
>       return true;
>   }
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index be87c34f56..9f76223718 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -100,10 +100,7 @@ static TCGv get_th_address_indexed(DisasContext *ctx, int rs1, int rs2,
>           tcg_gen_shli_tl(offs, src2, imm2);
>       }
>   
> -    TCGv addr = get_address_indexed(ctx, rs1, offs);
> -
> -    tcg_temp_free(offs);
> -    return addr;
> +    return get_address_indexed(ctx, rs1, offs);
>   }
>   
>   /* XTheadBa */
> @@ -120,7 +117,6 @@ static void gen_th_addsl##SHAMT(TCGv ret, TCGv arg1, TCGv arg2) \
>       TCGv t = tcg_temp_new();                                    \
>       tcg_gen_shli_tl(t, arg2, SHAMT);                            \
>       tcg_gen_add_tl(ret, t, arg1);                               \
> -    tcg_temp_free(t);                                           \
>   }
>   
>   GEN_TH_ADDSL(1)
> @@ -204,7 +200,6 @@ static bool gen_th_ff0(DisasContext *ctx, arg_th_ff0 *a, DisasExtend ext)
>           gen_clz(dest, t);
>       }
>   
> -    tcg_temp_free(t);
>       gen_set_gpr(ctx, a->rd, dest);
>   
>       return true;
> @@ -469,7 +464,6 @@ static bool trans_th_fmv_hw_x(DisasContext *ctx, arg_th_fmv_hw_x *a)
>   
>       tcg_gen_extu_tl_i64(t1, src1);
>       tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
> -    tcg_temp_free_i64(t1);
>       mark_fs_dirty(ctx);
>       return true;
>   }
> @@ -489,7 +483,6 @@ static bool trans_th_fmv_x_hw(DisasContext *ctx, arg_th_fmv_x_hw *a)
>       tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
>       tcg_gen_trunc_i64_tl(dst, t1);
>       gen_set_gpr(ctx, a->rd, dst);
> -    tcg_temp_free_i64(t1);
>       mark_fs_dirty(ctx);
>       return true;
>   }
> @@ -511,15 +504,12 @@ static bool gen_th_mac(DisasContext *ctx, arg_r *a,
>           extend_operand_func(tmp, src1);
>           extend_operand_func(tmp2, src2);
>           tcg_gen_mul_tl(tmp, tmp, tmp2);
> -        tcg_temp_free(tmp2);
>       } else {
>           tcg_gen_mul_tl(tmp, src1, src2);
>       }
>   
>       accumulate_func(dest, src0, tmp);
>       gen_set_gpr(ctx, a->rd, dest);
> -    tcg_temp_free(tmp);
> -
>       return true;
>   }
>   
> @@ -594,8 +584,6 @@ static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
>       tcg_gen_addi_tl(rs1, rs1, imm);
>       gen_set_gpr(ctx, a->rd, rd);
>       gen_set_gpr(ctx, a->rs1, rs1);
> -
> -    tcg_temp_free(addr);
>       return true;
>   }
>   
> @@ -615,8 +603,6 @@ static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>       tcg_gen_addi_tl(rs1, rs1, imm);
>       gen_set_gpr(ctx, a->rs1, rs1);
> -
> -    tcg_temp_free(addr);
>       return true;
>   }
>   
> @@ -950,11 +936,6 @@ static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
>       tcg_gen_qemu_ld_tl(t2, addr2, ctx->mem_idx, memop);
>       gen_set_gpr(ctx, a->rd1, t1);
>       gen_set_gpr(ctx, a->rd2, t2);
> -
> -    tcg_temp_free(t1);
> -    tcg_temp_free(t2);
> -    tcg_temp_free(addr1);
> -    tcg_temp_free(addr2);
>       return true;
>   }
>   
> @@ -995,9 +976,6 @@ static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
>   
>       tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
>       tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
> -
> -    tcg_temp_free(addr1);
> -    tcg_temp_free(addr2);
>       return true;
>   }
>   
