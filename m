Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1540284ejb;
        Sun, 11 Jun 2023 09:02:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6cwgM3l3UVjDYn4ANlzyp52YG6pzjYogOA49E7cKkY3qIM9syZCWKPXZBR97sZSg/ANosD
X-Received: by 2002:a67:eac9:0:b0:43b:5072:342 with SMTP id s9-20020a67eac9000000b0043b50720342mr3364621vso.29.1686499375071;
        Sun, 11 Jun 2023 09:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499375; cv=none;
        d=google.com; s=arc-20160816;
        b=AiCDwBl1yOJ/HTOxyDVD/YnYrHp7OJqQWjNDtBrnWl+uKGoC4E313d4Rpa9JA/tWCi
         MBGp0q8x8VRU0LJjhGmcMqhLZYccdAcDA8jFd4Q8JQ1R0LaUUY+itMVwkFPpFdFYi4ry
         XNQrrBIRbBh+2tZMZ00x5tLu6hfuYg2xDFZrt93phd/TXTXMuIWNW+6GL2py6GZsZkOf
         ucnECobqzQjI2m2ki4sJlSDXDFWWf/FItiWl5mRNw1pF9Grw362lfzI2lxnJ4GdrHO1U
         uj4sowHxgff8RkT7zOchCJToOL8RxHM8Rx83vWyn2ywSz852WLqDbRgSTFu0rZ6huPnB
         U1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N+pQRQmAdtEEtSrG+QeiKV8rPKg6vCTkrLwwP7CdWfo=;
        b=dQoe71epwBT/Xgt3VKeiybwik5Mrg4QjkvEOsmbbnDFk8ofjN2/bLWlg/CUUTpy8CP
         Q2QGhhZZUVvtQpdcjaKWmEB6woPkHvE+lKS/g6Xe5wZ3DG6OhsOp8IJhzDEZY1yKhaHr
         5F40W3FqWwAmAY6phvR+1lz+AwiU5+HYi7j+4lc7alqDwZV4JgWugu9wGWJmyZ6j0MNa
         tTgdr1Oxd3cwlXC9dCwCMc1UPgT9CC2Jooa5NqdGdtTOF4ZBgmsKLCDe2TwEj2WPA+6x
         pj2hkEg/5D/+ifWeLS0qQ/IsHoJ8KeL78f7gQqRQj6hPD4LGZ/ei39SttOkBfQYs+89y
         rEuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8vU85VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a67c50d000000b0043b1bcde559si462402vsk.180.2023.06.11.09.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8vU85VB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVm-0006kI-NY; Sun, 11 Jun 2023 12:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUq-0005xW-L3
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUk-0000Wg-1S
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30e412a852dso2205554f8f.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499244; x=1689091244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N+pQRQmAdtEEtSrG+QeiKV8rPKg6vCTkrLwwP7CdWfo=;
 b=e8vU85VBADO34kcK0WVnYNNBKAq0zBN52RtHpO84wkigHo++frFCA99lJXzt/eer8C
 GiFUkKiIcW/0T7oa6k2+tKYTj7jeD7UePgtF8+1+Rxbjk5dKqMCwDLysmQzC3ZePwp4n
 sBydQT5BlJIjwiqOY+ce/AN081clXtonEU49gahb0NkXyUcjttmA/WbiHf1hJReyJowl
 uCn2m6DfGQat3uSh2FoyXoiJhup9px/VJS4thF1u6e5vJS5V8NBZaZ7VAWIHBLxMCGDK
 clMWHl4UF4kInz42Iwno3HM4NszLsggmJ5OSXRSXEr1bEnyG6m7EI2bgu0kSV/NEqLr+
 ycwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499244; x=1689091244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+pQRQmAdtEEtSrG+QeiKV8rPKg6vCTkrLwwP7CdWfo=;
 b=Suhv4C+ilgLDMWp7Xu8dkFckW+zC8KVFgEbl1y34H6qNnZSFy33o1sHKE3UzqfUbD8
 Ux1BR+/6Y5ATclufZbzPLQVEo9sGWCe24PKf3PzhDwS3bxEYZjfvVEEcW+HIIT3b7fGt
 SJqqW4lO8BsjyEgRJiEHPiZoIVhcy8R3KyEKfTWweqFMR9rPA3C4A/d0LK6q3EIp4USf
 Z8N3c5X8H0eTU/001zsU4gO1upzlp7DJQ7SSLIaBS64ueG11D4nvrokNUu6FVsJC84I/
 9NTIN6fx04u9DuiwO2vGrANWQOBKIYmFIuhkK42h2VWA4FoHRoPs/fGUxLwpb+bkd7Zi
 25Kg==
X-Gm-Message-State: AC+VfDzWSEXLUnCnTL6quZVvz6MqUoigMqAznw+h8MLiygRkYwjoVjm6
 vM304vngepMA/sz0n3BnO4eCXrjG5m2xTrIu+8Y=
X-Received: by 2002:a5d:470b:0:b0:2f4:6574:5a93 with SMTP id
 y11-20020a5d470b000000b002f465745a93mr2528242wrq.4.1686499244679; 
 Sun, 11 Jun 2023 09:00:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/23] target/arm: Convert load (pointer auth) insns to
 decodetree
Date: Sun, 11 Jun 2023 17:00:28 +0100
Message-Id: <20230611160032.274823-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ghZGapsi7p1X

Convert the instructions in the load/store register (pointer
authentication) group ot decodetree: LDRAA, LDRAB.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230602155223.2040685-17-peter.maydell@linaro.org
---
 target/arm/tcg/a64.decode      |  7 +++
 target/arm/tcg/translate-a64.c | 83 +++++++---------------------------
 2 files changed, 23 insertions(+), 67 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 799c5ecb77a..b80a17111e7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -457,3 +457,10 @@ LDUMIN          .. 111 0 00 . . 1 ..... 0111 00 ..... ..... @atomic
 SWP             .. 111 0 00 . . 1 ..... 1000 00 ..... ..... @atomic
 
 LDAPR           sz:2 111 0 00 1 0 1 11111 1100 00 rn:5 rt:5
+
+# Load/store register (pointer authentication)
+
+# LDRA immediate is 10 bits signed and scaled, but the bits aren't all contiguous
+%ldra_imm       22:s1 12:9 !function=times_2
+
+LDRA            11 111 0 00 m:1 . 1 ......... w:1 1 rn:5 rt:5 imm=%ldra_imm
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ba072e557e1..b4b029d0910 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3327,43 +3327,23 @@ static bool trans_LDAPR(DisasContext *s, arg_LDAPR *a)
     return true;
 }
 
-/*
- * PAC memory operations
- *
- *  31  30      27  26    24    22  21       12  11  10    5     0
- * +------+-------+---+-----+-----+---+--------+---+---+----+-----+
- * | size | 1 1 1 | V | 0 0 | M S | 1 |  imm9  | W | 1 | Rn |  Rt |
- * +------+-------+---+-----+-----+---+--------+---+---+----+-----+
- *
- * Rt: the result register
- * Rn: base address or SP
- * V: vector flag (always 0 as of v8.3)
- * M: clear for key DA, set for key DB
- * W: pre-indexing flag
- * S: sign for imm9.
- */
-static void disas_ldst_pac(DisasContext *s, uint32_t insn,
-                           int size, int rt, bool is_vector)
+static bool trans_LDRA(DisasContext *s, arg_LDRA *a)
 {
-    int rn = extract32(insn, 5, 5);
-    bool is_wback = extract32(insn, 11, 1);
-    bool use_key_a = !extract32(insn, 23, 1);
-    int offset;
     TCGv_i64 clean_addr, dirty_addr, tcg_rt;
     MemOp memop;
 
-    if (size != 3 || is_vector || !dc_isar_feature(aa64_pauth, s)) {
-        unallocated_encoding(s);
-        return;
+    /* Load with pointer authentication */
+    if (!dc_isar_feature(aa64_pauth, s)) {
+        return false;
     }
 
-    if (rn == 31) {
+    if (a->rn == 31) {
         gen_check_sp_alignment(s);
     }
-    dirty_addr = read_cpu_reg_sp(s, rn, 1);
+    dirty_addr = read_cpu_reg_sp(s, a->rn, 1);
 
     if (s->pauth_active) {
-        if (use_key_a) {
+        if (!a->m) {
             gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
                              tcg_constant_i64(0));
         } else {
@@ -3372,25 +3352,23 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
         }
     }
 
-    /* Form the 10-bit signed, scaled offset.  */
-    offset = (extract32(insn, 22, 1) << 9) | extract32(insn, 12, 9);
-    offset = sextract32(offset << size, 0, 10 + size);
-    tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
+    tcg_gen_addi_i64(dirty_addr, dirty_addr, a->imm);
 
-    memop = finalize_memop(s, size);
+    memop = finalize_memop(s, MO_64);
 
     /* Note that "clean" and "dirty" here refer to TBI not PAC.  */
     clean_addr = gen_mte_check1(s, dirty_addr, false,
-                                is_wback || rn != 31, memop);
+                                a->w || a->rn != 31, memop);
 
-    tcg_rt = cpu_reg(s, rt);
+    tcg_rt = cpu_reg(s, a->rt);
     do_gpr_ld(s, tcg_rt, clean_addr, memop,
-              /* extend */ false, /* iss_valid */ !is_wback,
-              /* iss_srt */ rt, /* iss_sf */ true, /* iss_ar */ false);
+              /* extend */ false, /* iss_valid */ !a->w,
+              /* iss_srt */ a->rt, /* iss_sf */ true, /* iss_ar */ false);
 
-    if (is_wback) {
-        tcg_gen_mov_i64(cpu_reg_sp(s, rn), dirty_addr);
+    if (a->w) {
+        tcg_gen_mov_i64(cpu_reg_sp(s, a->rn), dirty_addr);
     }
+    return true;
 }
 
 /*
@@ -3477,31 +3455,6 @@ static void disas_ldst_ldapr_stlr(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Load/store register (all forms) */
-static void disas_ldst_reg(DisasContext *s, uint32_t insn)
-{
-    int rt = extract32(insn, 0, 5);
-    bool is_vector = extract32(insn, 26, 1);
-    int size = extract32(insn, 30, 2);
-
-    switch (extract32(insn, 24, 2)) {
-    case 0:
-        if (extract32(insn, 21, 1) == 0) {
-            break;
-        }
-        switch (extract32(insn, 10, 2)) {
-        case 0:
-        case 2:
-            break;
-        default:
-            disas_ldst_pac(s, insn, size, rt, is_vector);
-            return;
-        }
-        break;
-    }
-    unallocated_encoding(s);
-}
-
 /* AdvSIMD load/store multiple structures
  *
  *  31  30  29           23 22  21         16 15    12 11  10 9    5 4    0
@@ -4019,10 +3972,6 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 static void disas_ldst(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 24, 6)) {
-    case 0x38: case 0x39:
-    case 0x3c: case 0x3d: /* Load/store register (all forms) */
-        disas_ldst_reg(s, insn);
-        break;
     case 0x0c: /* AdvSIMD load/store multiple structures */
         disas_ldst_multiple_struct(s, insn);
         break;
-- 
2.34.1

