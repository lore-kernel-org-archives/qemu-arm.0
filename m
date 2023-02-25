Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2638696ejc;
        Sat, 25 Feb 2023 01:22:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/SqVdPCrZxAKAjonW1TUsTq8y8k7hBdZMj+TlZ/By0A/SHQGwI1M+Fc6x7WzjINjMVFykK
X-Received: by 2002:ac8:57c1:0:b0:3bd:11a5:c129 with SMTP id w1-20020ac857c1000000b003bd11a5c129mr24345877qta.34.1677316960922;
        Sat, 25 Feb 2023 01:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316960; cv=none;
        d=google.com; s=arc-20160816;
        b=HeQIRKLyVjmRZTpO9UC+NT3UqwbDrmukZBrXP5CASviDz4F1utul2VbrHxS/JdcD1C
         pFllU0AS34+Olo375RmASe2uggtvtLf0C0YWsyULsUvFs3VYjHpajLAAN3M177pmFmA/
         eXHXe/UYmmDBapk+7pjaAvwvVrmkQpepva+mqJNsZpShhYKLukOzbTrMe+w1kg0FVTK7
         a5FP2Hw2Gs56TgJrrEPvqqnbCcYSYt5voKWAWXUK1s0HJ9Dbyqie6CSGGyh2mD/SuJ7r
         ERr3lx4NusBl9DMwsxR4rLjQf0QLlwi270C1ekRLsUsqcxyG+2ARlInkCYDvcg2adRBv
         2kEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K1ileFl21ILOYbNN9ovAoll/bN96IaNdlVWGUtxEAQo=;
        b=uwuNIa+j3krd9ggsn/icUglcp94n4tEsrkiegBo2/oHnhKRgWIw96uo9P9ug3ufNRc
         pGsorzPIougCmIDKohCu33vMfKhzVYgf41aLqMhp5lbWLOZikEKjYhcw7SIShyza/2vj
         7mgYcqYJlVAoANCGGIbOawZ8khyWRO2GELAIA+0yheTYRhD+FSVk7j+xmRQfHH6GDIoE
         b2fkJoRGcKOtEp1FB9O4XoYvecauHzSlTNsqwgF8fE6u4KRZKMCAUPquFtuaRVTYAPBx
         tFk/oaf2xeRAfw50I7rKo+0MptICUzi2bijtTv/G3XFtYlK/+TgzrOZcXJGp2TKRiNBO
         ILqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m3vGfbUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020ac85a4f000000b003b6914d574dsi1721578qta.157.2023.02.25.01.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m3vGfbUz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqjV-000720-Bc; Sat, 25 Feb 2023 04:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiV-0004aL-3G
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:19:45 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqiR-0002zQ-Cd
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:19:42 -0500
Received: by mail-pl1-x642.google.com with SMTP id h14so1859885plf.10
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1ileFl21ILOYbNN9ovAoll/bN96IaNdlVWGUtxEAQo=;
 b=m3vGfbUz/QW6tgHtNQPKqYFdTjBUODr/+K0BCSlkAE9jYwgxQqDnfuX90Sb2kxJjEM
 dQe9jsBIVcFGEz3v7zVwPc/ueYPVe4aVgBjvQPWhQmOlIHdPhZQxIhuu4sV++7khnh4f
 sxsiRHFOyhFEN4+Xrm+XCITuzdVYznewhTxsIfER1pxl7sqfHqXjtFKQv9UtuhNOE3oX
 1lUAtIlxVqt0Do8CEow2uL3WCuhGqEKFwb+TmNyu7cI8ExIVqxLpI6Sucn60o55b7nDB
 9zFtpxdGuJbwjYoeIiaF2V6fGAm/93A7ve+9qVyzBDCV9esmnCcLMvBn6627V9t8o4kM
 flaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1ileFl21ILOYbNN9ovAoll/bN96IaNdlVWGUtxEAQo=;
 b=sVQT6bZTFpnnIDxy3uJr5ubZJ/iiaZWqTrBeEKABg7VOUKfsKNORu5Hj4e62NsKuI0
 YakAse97UWqpUeRHBkQD0LCgOz59M9q71TiRDTMmwOylXcBBwj59eopia3GI2ZuUKP62
 TM/gemsIv8j4ZN2p0bT+aIqgud8EYEyyTRvciLDZZH9YW6gYaPRY86KQ7W/qmISniQGl
 HcScEAxlsgoFDc8MFEzYItMMFXdUu4qpDcMfMsMPtpE+sfNkx3+mCckbbcK5Seu68LF7
 nPz0FnwEuXwcnImVtmu52K15hx48LRu5xOpUaLtKFyVdPM7GJEySaH5C6kMOVKk5jwPJ
 wJuQ==
X-Gm-Message-State: AO0yUKWojWRaPUTb8n9EthirPM27U+tVqVVFSWPxDyWMDk8RstPrirgh
 WrbacNqnObJ6+vBMC9+V3gcTqw==
X-Received: by 2002:a05:6a20:a10e:b0:c7:3209:f24d with SMTP id
 q14-20020a056a20a10e00b000c73209f24dmr19964309pzk.56.1677316778117; 
 Sat, 25 Feb 2023 01:19:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 48/76] target/nios2: Drop tcg_temp_free
Date: Fri, 24 Feb 2023 23:13:59 -1000
Message-Id: <20230225091427.1817156-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: TMHnx5OcMVLh

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 140bc31017..6610e22236 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -233,7 +233,6 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
 
     tcg_gen_andi_tl(test, dest, 3);
     tcg_gen_brcondi_tl(TCG_COND_NE, test, 0, l);
-    tcg_temp_free(test);
 
     tcg_gen_mov_tl(cpu_pc, dest);
     if (is_call) {
@@ -300,7 +299,6 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Store instructions */
@@ -312,7 +310,6 @@ static void gen_stx(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
     tcg_gen_qemu_st_tl(val, addr, dc->mem_idx, flags);
-    tcg_temp_free(addr);
 }
 
 /* Branch instructions */
@@ -500,7 +497,6 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
         TCGv tmp = tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_ESTATUS]));
         gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_EA));
-        tcg_temp_free(tmp);
     } else {
         gen_helper_eret(cpu_env, load_gpr(dc, R_SSTATUS), load_gpr(dc, R_EA));
     }
@@ -530,7 +526,6 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv tmp = tcg_temp_new();
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, ctrl[CR_BSTATUS]));
     gen_helper_eret(cpu_env, tmp, load_gpr(dc, R_BA));
-    tcg_temp_free(tmp);
 
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
@@ -597,8 +592,6 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
         tcg_gen_ld_tl(t1, cpu_env, offsetof(CPUNios2State, ctrl[CR_IPENDING]));
         tcg_gen_ld_tl(t2, cpu_env, offsetof(CPUNios2State, ctrl[CR_IENABLE]));
         tcg_gen_and_tl(dest, t1, t2);
-        tcg_temp_free(t1);
-        tcg_temp_free(t2);
         break;
     default:
         tcg_gen_ld_tl(dest, cpu_env,
@@ -662,11 +655,9 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
                 tcg_gen_ld_tl(o, cpu_env, ofs);
                 tcg_gen_andi_tl(o, o, ro);
                 tcg_gen_or_tl(n, n, o);
-                tcg_temp_free(o);
             }
 
             tcg_gen_st_tl(n, cpu_env, ofs);
-            tcg_temp_free(n);
         }
         break;
     }
@@ -753,7 +744,6 @@ static void do_rr_mul_high(DisasContext *dc, uint32_t insn, GenFn4 *fn)
 
     fn(discard, dest_gpr(dc, instr.c),
        load_gpr(dc, instr.a), load_gpr(dc, instr.b));
-    tcg_temp_free(discard);
 }
 
 #define gen_rr_mul_high(fname, insn)                                        \
@@ -771,7 +761,6 @@ static void do_rr_shift(DisasContext *dc, uint32_t insn, GenFn3 *fn)
 
     tcg_gen_andi_tl(sh, load_gpr(dc, instr.b), 31);
     fn(dest_gpr(dc, instr.c), load_gpr(dc, instr.a), sh);
-    tcg_temp_free(sh);
 }
 
 #define gen_rr_shift(fname, insn)                                           \
@@ -990,10 +979,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->sink) {
-        tcg_temp_free(dc->sink);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1

