Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2638442ejc;
        Sat, 25 Feb 2023 01:22:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+9QT5kwAtrX1nNa2WS3GDGG6eRBdZfu4KKCQ5AhHs4W7KmzFJGIjdBPUaWVFaq5ri2kHhN
X-Received: by 2002:a05:6214:19cd:b0:56e:bff1:83a7 with SMTP id j13-20020a05621419cd00b0056ebff183a7mr34007586qvc.18.1677316934708;
        Sat, 25 Feb 2023 01:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316934; cv=none;
        d=google.com; s=arc-20160816;
        b=pb3y1anXa7Budc61laD2UK0kWVWyvmbqrr1BQ92MTih29r+bf5SbdFn0ALNF+zsLVg
         har1Te9DQ0DlJT0uZS/XN4S9sCh8ZVZgMcMGk3KGjGN83fEBh/Z2Dl8Oktl2E4sOqyMW
         RmeVx7Xn/AJtc2QcRktlauGqmEyjnh/nnBrFlAICknDyIpnV9XeopXHp1EXvyDFEYmyV
         mi39tF6wdhSC5UQUnY+i6U7Wct44mOiVmvrxYKLcq0TyNjkLMhpuNWCzprycs4AQ1eka
         Rxg9uhKH1DdYHzOvpr0OK4B87xmKj9FC9wd6QTE/QJQY9bUjybzmxnq5y+pcOcTvs8c3
         532g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nyuKfeQl6l9gmRMi0rRL4/7rSJJOae//MOXT3NmGYis=;
        b=ClLkmuN1g+1tK2zpRlbr8FsG8tNmHMAsjusdUoUhYgwlKO4PEK92FPIS49G95z5sCD
         7mbWa1vi5OYdoquaq//a6rUpb27I/r3ZND9/JQTR5CEv5mwFCKI+3VgrPpAQsazRUqhp
         XHHxgFxSq+9tVPNRWauuucWsvx+FaxXHUEUczZ6V5m43jOsha/5z+T2HmG7nIr73YUu0
         4kHEbuiBvllzHcNJ4YD1oEYLAui2j4aTy4QLlXmZqmeLh4t5RNPi/RbCS4pLplZ1Ds1n
         6rL7xnvT7CVfpXUv/Rsvzc0ZN6tFs7/iBYnFDIZzadsdPwfaw+m6WkwmSoYdBHPDsXFI
         Cjow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tt10aUpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020a05620a28d000b007339c51142fsi1592097qkp.551.2023.02.25.01.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tt10aUpu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqkB-000192-LS; Sat, 25 Feb 2023 04:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjY-0007FI-96
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:48 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjR-0003Zf-Vt
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:20:47 -0500
Received: by mail-pf1-x443.google.com with SMTP id z11so856767pfh.4
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyuKfeQl6l9gmRMi0rRL4/7rSJJOae//MOXT3NmGYis=;
 b=tt10aUpubdMpEBJJBxVDY43mlnQ6AfrKoYJ3qZnl1S/IJtluh3uE7Va7V2b3Zl/hb0
 rboS4Km1j7EMUfF1ozNzuNjYrmP2JnkHyRpLAmOqbw7VmrkzwfSVyJnadZwVmJ422uuq
 6eaTLrXRF1ODmY0YHHfTPUTOo4EKvzoGhZ8FqYrq/gzK9/+zV3S1nojP9bFZptnkTRx0
 sjvEqSLdwBDOvCgzjDllfJuJoA8Jy2AaMX+nw60Oz+dB8G2RpweVfcYBM/O2YhknVnKz
 8wSYlVnnY3g07KxDTUply6LPQktyKK2Wu4+kjUj/WoF1Wq/aBn8VYYH1jFqLJ7n8sUJA
 eN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyuKfeQl6l9gmRMi0rRL4/7rSJJOae//MOXT3NmGYis=;
 b=3n9hqviS9/YPnNcXUtampWC8bsqzrL4Rmff27Jvd8T6mO1RCPwSgqDtRe2gZqECNbD
 L3v1fQyxG+OO1xkGlMVGqvG8SP2S3Qw8+5S3/7XTAhxjnITVUugmI02mrEcWDDDQVfc/
 wrcrzw7BoE+4aJg9LQHCbbrS9NWEZcvm/0OKyvOpSUU6BJrqdD/OdBfCOwIKhYBS7r6v
 H941k2yMH2MTCaBHSzSKBG1mNM+/ukUUGenNTva3ncUR94x+RaJrEXIYf7UsEKmFachT
 EzMXte1RdZMaU1HxlvaFQoKYyY+9uPm9rUHz/2HfS2yYc1UZ04Z8O8ird0RItWp+wFX2
 g3Sg==
X-Gm-Message-State: AO0yUKWAZ/urGfIBpa2yMthKcOAAG+1HKjFME6s20sB1CI75lz3/aMrM
 00bovxG6HiAy2PNpbqLK+MGZYw==
X-Received: by 2002:aa7:9d11:0:b0:5e3:af7:3bdf with SMTP id
 k17-20020aa79d11000000b005e30af73bdfmr4843549pfp.30.1677316840291; 
 Sat, 25 Feb 2023 01:20:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 72/76] target/xtensa: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:14:23 -1000
Message-Id: <20230225091427.1817156-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 1TNqQfdaLdh2

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 107 --------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 910350dec6..3ea50d8bc3 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1102,16 +1102,6 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
         ops->translate(dc, pslot->arg, ops->par);
     }
 
-    for (i = 0; i < n_arg_copy; ++i) {
-        if (arg_copy[i].arg->num_bits <= 32) {
-            tcg_temp_free_i32(arg_copy[i].temp);
-        } else if (arg_copy[i].arg->num_bits <= 64) {
-            tcg_temp_free_i64(arg_copy[i].temp);
-        } else {
-            g_assert_not_reached();
-        }
-    }
-
     if (dc->base.is_jmp == DISAS_NEXT) {
         gen_postprocess(dc, 0);
         dc->op_flags = 0;
@@ -1238,10 +1228,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->icount) {
-        tcg_temp_free(dc->next_icount);
-    }
-
     switch (dc->base.is_jmp) {
     case DISAS_NORETURN:
         break;
@@ -1369,7 +1355,6 @@ static void translate_addx(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[1].in, par[0]);
     tcg_gen_add_i32(arg[0].out, tmp, arg[2].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_all(DisasContext *dc, const OpcodeArg arg[],
@@ -1388,8 +1373,6 @@ static void translate_all(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp, tmp, arg[1].imm + shift);
     tcg_gen_deposit_i32(arg[0].out, arg[0].out,
                         tmp, arg[0].imm, 1);
-    tcg_temp_free(mask);
-    tcg_temp_free(tmp);
 }
 
 static void translate_and(DisasContext *dc, const OpcodeArg arg[],
@@ -1404,7 +1387,6 @@ static void translate_ball(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_and_i32(tmp, arg[0].in, arg[1].in);
     gen_brcond(dc, par[0], tmp, arg[1].in, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_bany(DisasContext *dc, const OpcodeArg arg[],
@@ -1413,7 +1395,6 @@ static void translate_bany(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_and_i32(tmp, arg[0].in, arg[1].in);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_b(DisasContext *dc, const OpcodeArg arg[],
@@ -1439,8 +1420,6 @@ static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
 #endif
     tcg_gen_and_i32(tmp, arg[0].in, bit);
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
-    tcg_temp_free(bit);
 }
 
 static void translate_bbi(DisasContext *dc, const OpcodeArg arg[],
@@ -1453,7 +1432,6 @@ static void translate_bbi(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_andi_i32(tmp, arg[0].in, 0x00000001u << arg[1].imm);
 #endif
     gen_brcondi(dc, par[0], tmp, 0, arg[2].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_bi(DisasContext *dc, const OpcodeArg arg[],
@@ -1494,8 +1472,6 @@ static void translate_boolean(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp2, arg[2].in, arg[2].imm);
     op[par[0]](tmp1, tmp1, tmp2);
     tcg_gen_deposit_i32(arg[0].out, arg[0].out, tmp1, arg[0].imm, 1);
-    tcg_temp_free(tmp1);
-    tcg_temp_free(tmp2);
 }
 
 static void translate_bp(DisasContext *dc, const OpcodeArg arg[],
@@ -1505,7 +1481,6 @@ static void translate_bp(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_andi_i32(tmp, arg[0].in, 1 << arg[0].imm);
     gen_brcondi(dc, par[0], tmp, 0, arg[1].imm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_call0(DisasContext *dc, const OpcodeArg arg[],
@@ -1520,7 +1495,6 @@ static void translate_callw(DisasContext *dc, const OpcodeArg arg[],
 {
     TCGv_i32 tmp = tcg_const_i32(arg[0].imm);
     gen_callw_slot(dc, par[0], tmp, adjust_jump_slot(dc, arg[0].imm, 0));
-    tcg_temp_free(tmp);
 }
 
 static void translate_callx0(DisasContext *dc, const OpcodeArg arg[],
@@ -1530,7 +1504,6 @@ static void translate_callx0(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(tmp, arg[0].in);
     tcg_gen_movi_i32(cpu_R[0], dc->base.pc_next);
     gen_jump(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
@@ -1540,7 +1513,6 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_mov_i32(tmp, arg[0].in);
     gen_callw_slot(dc, par[0], tmp, -1);
-    tcg_temp_free(tmp);
 }
 
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
@@ -1551,8 +1523,6 @@ static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
     tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
-    tcg_temp_free(tmp1);
-    tcg_temp_free(tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
@@ -1574,7 +1544,6 @@ static void translate_const16(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 c = tcg_const_i32(arg[1].imm);
 
     tcg_gen_deposit_i32(arg[0].out, c, arg[0].in, 16, 16);
-    tcg_temp_free(c);
 }
 
 static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
@@ -1585,8 +1554,6 @@ static void translate_dcache(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
     tcg_gen_qemu_ld8u(res, addr, dc->cring);
-    tcg_temp_free(addr);
-    tcg_temp_free(res);
 }
 
 static void translate_depbits(DisasContext *dc, const OpcodeArg arg[],
@@ -1637,7 +1604,6 @@ static void translate_extui(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shri_i32(tmp, arg[1].in, arg[2].imm);
     tcg_gen_andi_i32(arg[0].out, tmp, maskimm);
-    tcg_temp_free(tmp);
 }
 
 static void translate_getex(DisasContext *dc, const OpcodeArg arg[],
@@ -1648,7 +1614,6 @@ static void translate_getex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_extract_i32(tmp, cpu_SR[ATOMCTL], 8, 1);
     tcg_gen_deposit_i32(cpu_SR[ATOMCTL], cpu_SR[ATOMCTL], arg[0].in, 8, 1);
     tcg_gen_mov_i32(arg[0].out, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_icache(DisasContext *dc, const OpcodeArg arg[],
@@ -1660,7 +1625,6 @@ static void translate_icache(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movi_i32(cpu_pc, dc->pc);
     tcg_gen_addi_i32(addr, arg[0].in, arg[1].imm);
     gen_helper_itlb_hit_test(cpu_env, addr);
-    tcg_temp_free(addr);
 #endif
 }
 
@@ -1695,7 +1659,6 @@ static void translate_l32e(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
     mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     tcg_gen_qemu_ld_tl(arg[0].out, addr, dc->ring, mop);
-    tcg_temp_free(addr);
 }
 
 #ifdef CONFIG_USER_ONLY
@@ -1726,7 +1689,6 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, mop);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
-    tcg_temp_free(addr);
 }
 
 static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
@@ -1749,7 +1711,6 @@ static void translate_ldst(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_mb(TCG_BAR_LDAQ | TCG_MO_ALL);
         }
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_lct(DisasContext *dc, const OpcodeArg arg[],
@@ -1770,7 +1731,6 @@ static void translate_l32r(DisasContext *dc, const OpcodeArg arg[],
         tmp = tcg_const_i32(arg[1].imm);
     }
     tcg_gen_qemu_ld32u(arg[0].out, tmp, dc->cring);
-    tcg_temp_free(tmp);
 }
 
 static void translate_loop(DisasContext *dc, const OpcodeArg arg[],
@@ -1856,19 +1816,12 @@ static void translate_mac16(DisasContext *dc, const OpcodeArg arg[],
                                  lo, hi);
             }
             tcg_gen_ext8s_i32(cpu_SR[ACCHI], cpu_SR[ACCHI]);
-
-            tcg_temp_free_i32(lo);
-            tcg_temp_free_i32(hi);
         }
-        tcg_temp_free(m1);
-        tcg_temp_free(m2);
     }
     if (ld_offset) {
         tcg_gen_mov_i32(arg[1].out, vaddr);
         tcg_gen_mov_i32(cpu_SR[MR + arg[0].imm], mem32);
     }
-    tcg_temp_free(vaddr);
-    tcg_temp_free(mem32);
 }
 
 static void translate_memw(DisasContext *dc, const OpcodeArg arg[],
@@ -1932,7 +1885,6 @@ static void translate_movp(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(par[0],
                         arg[0].out, tmp, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_movsp(DisasContext *dc, const OpcodeArg arg[],
@@ -1955,8 +1907,6 @@ static void translate_mul16(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_ext16u_i32(v2, arg[2].in);
     }
     tcg_gen_mul_i32(arg[0].out, v1, v2);
-    tcg_temp_free(v2);
-    tcg_temp_free(v1);
 }
 
 static void translate_mull(DisasContext *dc, const OpcodeArg arg[],
@@ -1975,7 +1925,6 @@ static void translate_mulh(DisasContext *dc, const OpcodeArg arg[],
     } else {
         tcg_gen_mulu2_i32(lo, arg[0].out, arg[1].in, arg[2].in);
     }
-    tcg_temp_free(lo);
 }
 
 static void translate_neg(DisasContext *dc, const OpcodeArg arg[],
@@ -2110,7 +2059,6 @@ static void translate_retw(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_deposit_i32(tmp, tmp, cpu_R[0], 0, 30);
     gen_helper_retw(cpu_env, cpu_R[0]);
     gen_jump(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_rfde(DisasContext *dc, const OpcodeArg arg[],
@@ -2149,7 +2097,6 @@ static void translate_rfw(DisasContext *dc, const OpcodeArg arg[],
                        cpu_SR[WINDOW_START], tmp);
     }
 
-    tcg_temp_free(tmp);
     gen_helper_restore_owb(cpu_env);
     gen_jump(dc, cpu_SR[EPC1]);
 }
@@ -2199,7 +2146,6 @@ static void translate_rsr_ptevaddr(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_shri_i32(tmp, cpu_SR[EXCVADDR], 10);
     tcg_gen_or_i32(tmp, tmp, cpu_SR[PTEVADDR]);
     tcg_gen_andi_i32(arg[0].out, tmp, 0xfffffffc);
-    tcg_temp_free(tmp);
 #endif
 }
 
@@ -2273,8 +2219,6 @@ static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
     gen_check_atomctl(dc, addr);
     tcg_gen_atomic_cmpxchg_i32(arg[0].out, addr, cpu_SR[SCOMPARE1],
                                tmp, dc->cring, mop);
-    tcg_temp_free(addr);
-    tcg_temp_free(tmp);
 }
 
 static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
@@ -2286,7 +2230,6 @@ static void translate_s32e(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_addi_i32(addr, arg[1].in, arg[2].imm);
     mop = gen_load_store_alignment(dc, MO_TEUL, addr);
     tcg_gen_qemu_st_tl(arg[0].in, addr, dc->ring, mop);
-    tcg_temp_free(addr);
 }
 
 static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
@@ -2312,9 +2255,6 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
     gen_set_label(label);
     tcg_gen_extract_i32(arg[0].out, cpu_SR[ATOMCTL], 8, 1);
     tcg_gen_deposit_i32(cpu_SR[ATOMCTL], cpu_SR[ATOMCTL], res, 8, 1);
-    tcg_temp_free(prev);
-    tcg_temp_free(addr);
-    tcg_temp_free(res);
 }
 
 static void translate_salt(DisasContext *dc, const OpcodeArg arg[],
@@ -2338,7 +2278,6 @@ static void translate_sext(DisasContext *dc, const OpcodeArg arg[],
         TCGv_i32 tmp = tcg_temp_new_i32();
         tcg_gen_shli_i32(tmp, arg[1].in, shift);
         tcg_gen_sari_i32(arg[0].out, tmp, shift);
-        tcg_temp_free(tmp);
     }
 }
 
@@ -2378,8 +2317,6 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                     tcg_gen_extu_i32_i64(tmp, reg); \
                     tcg_gen_##cmd##_i64(v, v, tmp); \
                     tcg_gen_extrl_i64_i32(arg[0].out, v); \
-                    tcg_temp_free_i64(v); \
-                    tcg_temp_free_i64(tmp); \
                 } while (0)
 
 #define gen_shift(cmd) gen_shift_reg(cmd, cpu_SR[SAR])
@@ -2396,7 +2333,6 @@ static void translate_sll(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_andi_i32(s, s, 0x3f);
         tcg_gen_extu_i32_i64(v, arg[1].in);
         gen_shift_reg(shl, s);
-        tcg_temp_free(s);
     }
 }
 
@@ -2463,7 +2399,6 @@ static void translate_ssa8b(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[0].in, 3);
     gen_left_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
@@ -2472,7 +2407,6 @@ static void translate_ssa8l(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[0].in, 3);
     gen_right_shift_sar(dc, tmp);
-    tcg_temp_free(tmp);
 }
 
 static void translate_ssai(DisasContext *dc, const OpcodeArg arg[],
@@ -2505,7 +2439,6 @@ static void translate_subx(DisasContext *dc, const OpcodeArg arg[],
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_shli_i32(tmp, arg[1].in, par[0]);
     tcg_gen_sub_i32(arg[0].out, tmp, arg[2].in);
-    tcg_temp_free(tmp);
 }
 
 static void translate_waiti(DisasContext *dc, const OpcodeArg arg[],
@@ -2757,7 +2690,6 @@ static void translate_xsr(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_mov_i32(tmp, arg[0].in);
         tcg_gen_mov_i32(arg[0].out, cpu_SR[par[0]]);
         tcg_gen_mov_i32(cpu_SR[par[0]], tmp);
-        tcg_temp_free(tmp);
     } else {
         tcg_gen_movi_i32(arg[0].out, 0);
     }
@@ -2772,7 +2704,6 @@ static void translate_xsr_mask(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_mov_i32(tmp, arg[0].in);
         tcg_gen_mov_i32(arg[0].out, cpu_SR[par[0]]);
         tcg_gen_andi_i32(cpu_SR[par[0]], tmp, par[2]);
-        tcg_temp_free(tmp);
     } else {
         tcg_gen_movi_i32(arg[0].out, 0);
     }
@@ -2792,7 +2723,6 @@ static void translate_xsr_ccount(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(tmp, cpu_SR[par[0]]);
     gen_helper_wsr_ccount(cpu_env, arg[0].in);
     tcg_gen_mov_i32(arg[0].out, tmp);
-    tcg_temp_free(tmp);
 
 #endif
 }
@@ -2810,7 +2740,6 @@ static void translate_xsr_ccount(DisasContext *dc, const OpcodeArg arg[],
     } \
     translate_wsr_##name(dc, arg, par); \
     tcg_gen_mov_i32(arg[0].out, tmp); \
-    tcg_temp_free(tmp); \
 }
 
 gen_translate_xsr(acchi)
@@ -6297,16 +6226,6 @@ static inline void put_f32_o1_i3(const OpcodeArg *arg, const OpcodeArg *arg32,
         (o0 >= 0 && arg[o0].num_bits == 64)) {
         if (o0 >= 0) {
             tcg_gen_extu_i32_i64(arg[o0].out, arg32[o0].out);
-            tcg_temp_free_i32(arg32[o0].out);
-        }
-        if (i0 >= 0) {
-            tcg_temp_free_i32(arg32[i0].in);
-        }
-        if (i1 >= 0) {
-            tcg_temp_free_i32(arg32[i1].in);
-        }
-        if (i2 >= 0) {
-            tcg_temp_free_i32(arg32[i2].in);
         }
     }
 }
@@ -6430,9 +6349,6 @@ static void translate_compare_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i32(TCG_COND_NE,
                         arg[0].out, res, zero,
                         set_br, clr_br);
-    tcg_temp_free(res);
-    tcg_temp_free(set_br);
-    tcg_temp_free(clr_br);
 }
 
 static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6463,9 +6379,6 @@ static void translate_compare_s(DisasContext *dc, const OpcodeArg arg[],
                         arg[0].out, res, zero,
                         set_br, clr_br);
     put_f32_i2(arg, arg32, 1, 2);
-    tcg_temp_free(res);
-    tcg_temp_free(set_br);
-    tcg_temp_free(clr_br);
 }
 
 static void translate_const_d(DisasContext *dc, const OpcodeArg arg[],
@@ -6584,7 +6497,6 @@ static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
@@ -6603,7 +6515,6 @@ static void translate_ldstx(DisasContext *dc, const OpcodeArg arg[],
     if (par[1]) {
         tcg_gen_mov_i32(arg[1].out, addr);
     }
-    tcg_temp_free(addr);
 }
 
 static void translate_fpu2k_madd_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6639,7 +6550,6 @@ static void translate_movcond_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0], arg[0].out,
                         arg2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i64(arg2);
 }
 
 static void translate_movcond_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6668,8 +6578,6 @@ static void translate_movp_d(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_movcond_i64(par[0],
                         arg[0].out, tmp2, zero,
                         arg[1].in, arg[0].in);
-    tcg_temp_free_i32(tmp1);
-    tcg_temp_free_i64(tmp2);
 }
 
 static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
@@ -6683,7 +6591,6 @@ static void translate_movp_s(DisasContext *dc, const OpcodeArg arg[],
         tcg_gen_movcond_i32(par[0],
                             arg[0].out, tmp, zero,
                             arg[1].in, arg[0].in);
-        tcg_temp_free(tmp);
     } else {
         translate_movp_d(dc, arg, par);
     }
@@ -7015,7 +6922,6 @@ static void translate_cvtd_s(DisasContext *dc, const OpcodeArg arg[],
 
     tcg_gen_extrl_i64_i32(v, arg[1].in);
     gen_helper_cvtd_s(arg[0].out, cpu_env, v);
-    tcg_temp_free_i32(v);
 }
 
 static void translate_cvts_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7025,7 +6931,6 @@ static void translate_cvts_d(DisasContext *dc, const OpcodeArg arg[],
 
     gen_helper_cvts_d(v, cpu_env, arg[1].in);
     tcg_gen_extu_i32_i64(arg[0].out, v);
-    tcg_temp_free_i32(v);
 }
 
 static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7053,9 +6958,6 @@ static void translate_ldsti_d(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_addi_i32(arg[1].out, arg[1].in, arg[2].imm);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
@@ -7088,9 +6990,6 @@ static void translate_ldsti_s(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_addi_i32(arg[1].out, arg[1].in, arg[2].imm);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
@@ -7118,9 +7017,6 @@ static void translate_ldstx_d(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_add_i32(arg[1].out, arg[1].in, arg[2].in);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
@@ -7153,9 +7049,6 @@ static void translate_ldstx_s(DisasContext *dc, const OpcodeArg arg[],
             tcg_gen_add_i32(arg[1].out, arg[1].in, arg[2].in);
         }
     }
-    if (par[1]) {
-        tcg_temp_free(addr);
-    }
 }
 
 static void translate_madd_d(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1

