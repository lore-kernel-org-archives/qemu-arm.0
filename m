Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDD0CD3427
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 15:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJvZp-0000wP-N7; Mon, 04 May 2026 11:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZo-0000vb-EH
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:20 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wJvZm-0006Co-Kw
 for qemu-arm@nongnu.org; Mon, 04 May 2026 11:51:20 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-506a6cf8242so30878981cf.1
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777909878; x=1778514678; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Nog3SCbgfqA4TMOd8dIMgHS3/I/Hs3g4DJB/Fnd2jo=;
 b=RIGxRlmpBG7Fwglxv0CEXniHLfVWxvmYRQujWwDAQ5aYE1CcDbUsPtZf5k7ET3Krka
 ZFa7UaoslKawKbrpq6ZMhiAVplIIhtUd+vVtLy1IPQwYGDLp6BJcUQjLuXKRD7NhFzCd
 aQGwJWjJoI6HMjVBeXapspccilP6vX2eprEw5iAxwAJHQUG0JJv+CJixN7DklU/8QbbZ
 KFaUK8SIZG4+MnIDrXXSpZZzEfTk/fCzAvtbNuTEJK4vZk7xrWfZUHqFo636N3U1tlh4
 qaPEK3klWliA6LIFkC+Ns03uuTq9JSuFoaxe4fxqNtZXOBWHGagyr4N1PhqPDsv9z4Jd
 WImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777909878; x=1778514678;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/Nog3SCbgfqA4TMOd8dIMgHS3/I/Hs3g4DJB/Fnd2jo=;
 b=KRWdcGERJ835M2ECsZjONeoJFaSnx35TfV2tKj+eURZlKn/LOSIwYkI5I0OqhQdZRK
 YITFDZxp1sx7Mv0XzGtzwq+woFghbMmozyrjdwEgK8yOPjz9GlioXQd0oKRjpz9AUjR7
 J8l68dHEEQMVD2O3rUp3Cf9Hvwfb6ea8Mvaopv+EGSkkmf0FF5ELSm/kCuU9TblxAOd+
 +UEFx/VKNGnH0h1o7aOTKNpzQbYk5udSQfTcp0EmQ9WCdvkR90JybVhXROi2krWDPD4L
 ldOQwnpDqI/IKxliKbaBBK4ynv2Gcu7g/DDtSrwN/nybEFMlwu+gZ76FmtaCb4xR2tTy
 7oHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UQCEiXnRQz59pJmgcrxM5eDN3ypoHNi0X+mVQWpIkc+92+zrqSBrzxjSo53WBHcN1wsFxF0K9mQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy03tY0G0DR3DE7ubh+7s0fmlIEg8x0r9ZjilqwLWCnPN+Vhx2k
 wnOhz5dqIQIXQv79qSKu4iq6cFZmaaAcJcCtRAOh3Sv8iMcA6FpK6DNB
X-Gm-Gg: AeBDietIPCzUAM8ZWUToy52A9n+ijouvHt+NxenSd9LAwF2QXftViUuF79T6nnAfFaE
 hvi2fpGWOu5plG3zarwc37vp7bpNI/qqSb/tGH+JVAseJKtS6VcH5Yl8X/3/F1j8aSFd1cR8f/k
 WQmvRgRJ2Nc0PgDcECWruBA0N7cyxoTp8FlVwgoB/rEr51DCp0y1veee7D3WcEC5Yo1BBNkuTxQ
 90+9H65N2FnvuEi1oOxyWPNXW6/TZyED2cO8wG6HGh6a0GA9jlUuHCI1Q37RABXWZXcAa/sxdaV
 O56ZH00L6S5SKG2NU3/I2Ip3tenRUP6f7/rOurB/1kLfk8Z9cD8L/6wayQTNIlchJWsJ7BxH4La
 8ln/+Js8nDvepPATUEOOTgeo5vwDOoVwQJr2+Io1V9Sr43033VvTaytg3GwNkbwEe/9xhzHhQYM
 nzlCYm4WIg7CZDU9pgXWOYZP2sTHuaBBBcFZwzftrdzvxaUUdi6no=
X-Received: by 2002:ac8:5796:0:b0:50e:5819:d7e7 with SMTP id
 d75a77b69052e-5104bdefc96mr148913851cf.3.1777909877630; 
 Mon, 04 May 2026 08:51:17 -0700 (PDT)
Received: from [192.168.1.164] ([2600:1009:a021:c665:5296:905f:3e4a:eb90])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51040931552sm99599011cf.12.2026.05.04.08.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 08:51:17 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 04 May 2026 11:50:39 -0400
Subject: [PATCH v5 06/15] target/arm: add MTX to MTEDESC and DisasContext
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-feat-mte4-v5-6-232a648e63c6@gmail.com>
References: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
In-Reply-To: <20260504-feat-mte4-v5-0-232a648e63c6@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777909867; l=6070;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=pus4GwsaxCbMuSf6IijKDSfjMEIqDUvfVkkjkvUKGzg=;
 b=QlIVqFyFW8q1abqB3HOKPtlOYkl5QLhR3+gmHWNlhUj+6CaFF1DYWHOS46SkMwNFKmrSShP1t
 7nTmuFiNkhRDFFmaH1HiY8YCqncRscp+pOUy1Y/hw+X+wojbArk7txT
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add fields for MTX to DisasContext and MTEDESC. With MTE4, the fields
will be needed in future patches that alter tag check, tag load and tag
store behavior.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/cpu-features.h      | 5 +++++
 target/arm/cpu.h               | 1 +
 target/arm/tcg/hflags.c        | 4 ++++
 target/arm/tcg/translate-a64.c | 7 +++++++
 target/arm/tcg/translate.h     | 1 +
 5 files changed, 18 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4d130b4b2b..90d4ed37c2 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1159,6 +1159,11 @@ static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
 }
 
+static inline bool isar_feature_aa64_mte_mtx(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTEX) != 0;
+}
+
 static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, SME) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 706ade5784..6e2b70dae5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2529,6 +2529,7 @@ FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
 FIELD(TBFLAG_A64, MTE_STORE_ONLY, 45, 1)
 FIELD(TBFLAG_A64, MTE0_STORE_ONLY, 46, 1)
+FIELD(TBFLAG_A64, MTX, 47, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index e753124c4c..40a934a8af 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -460,6 +460,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         /* Cache TCMA as well as TBI. */
         DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
+        /* Cache MTX. */
+        if (cpu_isar_feature(aa64_mte_mtx, env_archcpu(env))) {
+            DP_TBFLAG_A64(flags, MTX, mtx);
+        }
     }
 
     if (cpu_isar_feature(aa64_gcs, env_archcpu(env))) {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ce6249649a..cd86178d56 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -312,6 +312,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(memop));
+        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = tcg_temp_new_i64();
@@ -345,6 +346,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, ALIGN, memop_alignment_bits(single_mop));
+        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = tcg_temp_new_i64();
@@ -3003,6 +3005,7 @@ static void handle_sys(DisasContext *s, bool isread,
             desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
             desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
             desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+            desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
 
             tcg_rt = tcg_temp_new_i64();
             gen_helper_mte_check_zva(tcg_rt, tcg_env,
@@ -4873,6 +4876,7 @@ static bool do_SET(DisasContext *s, arg_set *a, bool is_epilogue,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, true);
+        desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
         /* SIZEM1 and ALIGN we leave 0 (byte write) */
     }
     /* The helper function always needs the memidx even with MTE disabled */
@@ -4927,11 +4931,13 @@ static bool do_CPY(DisasContext *s, arg_cpy *a, bool is_epilogue, CpyFn fn)
     if (s->mte_active[runpriv]) {
         rdesc = FIELD_DP32(rdesc, MTEDESC, TBI, s->tbid);
         rdesc = FIELD_DP32(rdesc, MTEDESC, TCMA, s->tcma);
+        rdesc = FIELD_DP32(rdesc, MTEDESC, MTX, s->mtx);
     }
     if (s->mte_active[wunpriv]) {
         wdesc = FIELD_DP32(wdesc, MTEDESC, TBI, s->tbid);
         wdesc = FIELD_DP32(wdesc, MTEDESC, TCMA, s->tcma);
         wdesc = FIELD_DP32(wdesc, MTEDESC, WRITE, true);
+        wdesc = FIELD_DP32(wdesc, MTEDESC, MTX, s->mtx);
     }
     /* The helper function needs these parts of the descriptor regardless */
     rdesc = FIELD_DP32(rdesc, MTEDESC, MIDX, rmemidx);
@@ -10701,6 +10707,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->mte_active[1] = EX_TBFLAG_A64(tb_flags, MTE0_ACTIVE);
     dc->mte_store_only[0] = EX_TBFLAG_A64(tb_flags, MTE_STORE_ONLY);
     dc->mte_store_only[1] = EX_TBFLAG_A64(tb_flags, MTE0_STORE_ONLY);
+    dc->mtx = EX_TBFLAG_A64(tb_flags, MTX);
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index c74a4f6675..75d1b0fbd9 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -82,6 +82,7 @@ typedef struct DisasContext {
     uint8_t tbii;      /* TBI1|TBI0 for insns */
     uint8_t tbid;      /* TBI1|TBI0 for data */
     uint8_t tcma;      /* TCMA1|TCMA0 for MTE */
+    uint8_t mtx;       /* MTX1|MTX0 for MTE */
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */

-- 
2.54.0


