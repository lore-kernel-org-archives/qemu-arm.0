Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6074344wrv;
        Tue, 6 Aug 2019 21:57:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHfth5EBFINOGJTddhgsnqRYVHqv9IH7kz1R4DygsIH5IbcwfXT6yEn7XI04XSZ7UtLJ1n
X-Received: by 2002:a37:6c8:: with SMTP id 191mr6830170qkg.102.1565153834413;
        Tue, 06 Aug 2019 21:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153834; cv=none;
        d=google.com; s=arc-20160816;
        b=UjuSQ/rm0hmWpneAoCyq6lCuQQKlhCSaeCxk0bgaBLHxxjtXv3XH8OaHQ+D8JOlqlm
         lG4ycy2ftJUhV7CuZStUXnbKASgjEeX659OqMsBniYmQVAerEGmAeIvHxiZprAGzWgH7
         gLC+bFGksoK7ujUHY3/YhcKzilnVqIg013i/LV24ESV0PvC3MdVrz4p44viasp1YyilO
         U3M1IDGVzdrg90BORynmAWaILSH+pwkocKjvPfmX1sBY6OI38IJfQANLh24G+Svu+LXZ
         Ib/FlPGaQtHSyKs9xngiJtqFPQO6YBBLN5G57XIPwwWii5oU18EkAQL6v1aE6hPdEi3a
         w5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1+ZCh0ppqRckFKlk6UR/b/e9Pyhyh5ijaXz+rNnMkc4=;
        b=WM+JBq7BXOMywO0Vyn5KuxDVn18xAXrmMU7QQERJA8vOg48GlD+kky23a5PSEYMC3O
         2G5Bd4HRCNbXl8N4beEQSJCnB3oDf5ZsOPywhYIq9Bd2zRVJzFemwrrnxSHHMZs5vNGu
         rHX9VrA1ztWBFDm9TejQiEzvsgGV8iwdXaGToDMo/E2Gt258L+vtZwdxhg4EsfNLt5+7
         eGxvKJEoHW/iMtZXT0P2UHVX0ecJO1IH8k7GRf0ZKnl4ACkqpW7RqqGtcRsEtI4pExs2
         iLcIYkuigUWzME2hou9YssVqnSdNSm+UWvpo5kd0T0aEShl4K41odNuMqGgedtUvtWG2
         Nuqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p+gGLAe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si50220284qtq.2.2019.08.06.21.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p+gGLAe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvE0f-0008Uc-WA
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxQ-0001CC-48
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxO-0004oV-E2
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:52 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36207)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxO-0004ni-4w
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:50 -0400
Received: by mail-pl1-x642.google.com with SMTP id k8so38798785plt.3
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1+ZCh0ppqRckFKlk6UR/b/e9Pyhyh5ijaXz+rNnMkc4=;
 b=p+gGLAe/m+zU0edleywRdT2G7HCx7Bu+nzK9e4ItOJ497cRaMWZC91wayPIMM5t2EW
 Xfsd8LrA9hiFEzRuP2UUHMWwG2NdsGiNrn/NZKl/njB8x9dQ2kiURzxjGtaUFvqw/5kj
 KNWc+Ji3ddsVuLOJO47gOkjQFWlLF7s2e9CR52Z/sFwAkpIJygD9T0JxniFPODtJ/NpC
 oe8SS/5r9NBm16AM7lqSda5kBojf+uQK8pjXlKzNJB1ZxG5EtC4iDmnJ4ieNagAj5luO
 1Nk4vpc6D1BagxgoA3q8vUtKN1blMyOD9nWvBmHURIllizd43qZ/zJbGQXFmPwVhnB2/
 1P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1+ZCh0ppqRckFKlk6UR/b/e9Pyhyh5ijaXz+rNnMkc4=;
 b=PXeBzF5AaAP2WWI3ZyQBiGcdNiCLGHwcLIiYgP3mrpH/ZSF1dENcPvLR8cT1oe8luI
 kkfIe3JIbpwiHHHZAiUX1DNnEUTcomMM8lTZHWR9u1t9NEu+HFEdNHZM9yws8lzh0OOd
 XpQT1eWvAniS0Ob3YLzr6jwphGVApTlPxQKX5VarDSdDinFOUDsXPlHyPbx2ttutEGZI
 2L6MCvR3QW5o3C8p0RjGo3X5emVYoCpHznRMCrmJWXSE8lnpwW58Z2V+zEyL78HV0JiC
 6kniLKq5H0worGpHOpNh3TqDQJb6SFgEb85yutBTPjqTO9QDi0yXn3nbWLEKk3diX6z+
 Z1uw==
X-Gm-Message-State: APjAAAXzpn9GJofLCpDUmjdb1x3HFhjdkbUpapQBMAuI1CaSA80YYUVt
 z7jvkEW4BZAZux1+hvIMyZnANQ==
X-Received: by 2002:a17:902:2ae8:: with SMTP id
 j95mr5932957plb.276.1565153628891; 
 Tue, 06 Aug 2019 21:53:48 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:28 -0700
Message-Id: <20190807045335.1361-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH 04/11] target/arm: Introduce add_reg_for_lit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ppR4X+WF6yp2

Provide a common routine for the places that require ALIGN(PC, 4)
as the base address as opposed to plain PC.  The two are always
the same for A32, but the difference is meaningful for thumb mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Note: This patch is easier to read with -b, as there are several
large-ish indentation changes as the if statements fold together.
---
 target/arm/translate-vfp.inc.c |  38 ++------
 target/arm/translate.c         | 166 +++++++++++++++------------------
 2 files changed, 82 insertions(+), 122 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 092eb5ec53..262d4177e5 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -941,14 +941,8 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
         offset = -offset;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
-    tcg_gen_addi_i32(addr, addr, offset);
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
@@ -983,14 +977,8 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
         offset = -offset;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
-    tcg_gen_addi_i32(addr, addr, offset);
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
         gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
@@ -1029,13 +1017,8 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
         return true;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, 0);
     if (a->p) {
         /* pre-decrement */
         tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
@@ -1112,13 +1095,8 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
         return true;
     }
 
-    if (s->thumb && a->rn == 15) {
-        /* This is actually UNPREDICTABLE */
-        addr = tcg_temp_new_i32();
-        tcg_gen_movi_i32(addr, s->pc & ~2);
-    } else {
-        addr = load_reg(s, a->rn);
-    }
+    /* For thumb, use of PC is UNPREDICTABLE.  */
+    addr = add_reg_for_lit(s, a->rn, 0);
     if (a->p) {
         /* pre-decrement */
         tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 61933865d5..71d94c053b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -220,6 +220,23 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+/*
+ * Create a new temp, REG + OFS, except PC is ALIGN(PC, 4).
+ * This is used for load/store for which use of PC implies (literal),
+ * or ADD that implies ADR.
+ */
+static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    if (reg == 15) {
+        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
+    } else {
+        tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
+    }
+    return tmp;
+}
+
 /* Set a CPU register.  The source must be a temporary and will be
    marked as dead.  */
 static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
@@ -9472,16 +9489,12 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                  */
                 bool wback = extract32(insn, 21, 1);
 
-                if (rn == 15) {
-                    if (insn & (1 << 21)) {
-                        /* UNPREDICTABLE */
-                        goto illegal_op;
-                    }
-                    addr = tcg_temp_new_i32();
-                    tcg_gen_movi_i32(addr, s->pc & ~3);
-                } else {
-                    addr = load_reg(s, rn);
+                if (rn == 15 && (insn & (1 << 21))) {
+                    /* UNPREDICTABLE */
+                    goto illegal_op;
                 }
+
+                addr = add_reg_for_lit(s, rn, 0);
                 offset = (insn & 0xff) * 4;
                 if ((insn & (1 << 23)) == 0) {
                     offset = -offset;
@@ -10682,27 +10695,15 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         store_reg(s, rd, tmp);
                     } else {
                         /* Add/sub 12-bit immediate.  */
-                        if (rn == 15) {
-                            offset = s->pc & ~(uint32_t)3;
-                            if (insn & (1 << 23))
-                                offset -= imm;
-                            else
-                                offset += imm;
-                            tmp = tcg_temp_new_i32();
-                            tcg_gen_movi_i32(tmp, offset);
-                            store_reg(s, rd, tmp);
+                        if (insn & (1 << 23)) {
+                            imm = -imm;
+                        }
+                        tmp = add_reg_for_lit(s, rn, imm);
+                        if (rn == 13 && rd == 13) {
+                            /* ADD SP, SP, imm or SUB SP, SP, imm */
+                            store_sp_checked(s, tmp);
                         } else {
-                            tmp = load_reg(s, rn);
-                            if (insn & (1 << 23))
-                                tcg_gen_subi_i32(tmp, tmp, imm);
-                            else
-                                tcg_gen_addi_i32(tmp, tmp, imm);
-                            if (rn == 13 && rd == 13) {
-                                /* ADD SP, SP, imm or SUB SP, SP, imm */
-                                store_sp_checked(s, tmp);
-                            } else {
-                                store_reg(s, rd, tmp);
-                            }
+                            store_reg(s, rd, tmp);
                         }
                     }
                 }
@@ -10816,61 +10817,53 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             }
         }
         memidx = get_mem_index(s);
-        if (rn == 15) {
-            addr = tcg_temp_new_i32();
-            /* PC relative.  */
-            /* s->pc has already been incremented by 4.  */
-            imm = s->pc & 0xfffffffc;
-            if (insn & (1 << 23))
-                imm += insn & 0xfff;
-            else
-                imm -= insn & 0xfff;
-            tcg_gen_movi_i32(addr, imm);
+        imm = insn & 0xfff;
+        if (insn & (1 << 23)) {
+            /* PC relative or Positive offset.  */
+            addr = add_reg_for_lit(s, rn, imm);
+        } else if (rn == 15) {
+            /* PC relative with negative offset.  */
+            addr = add_reg_for_lit(s, rn, -imm);
         } else {
             addr = load_reg(s, rn);
-            if (insn & (1 << 23)) {
-                /* Positive offset.  */
-                imm = insn & 0xfff;
-                tcg_gen_addi_i32(addr, addr, imm);
-            } else {
-                imm = insn & 0xff;
-                switch ((insn >> 8) & 0xf) {
-                case 0x0: /* Shifted Register.  */
-                    shift = (insn >> 4) & 0xf;
-                    if (shift > 3) {
-                        tcg_temp_free_i32(addr);
-                        goto illegal_op;
-                    }
-                    tmp = load_reg(s, rm);
-                    if (shift)
-                        tcg_gen_shli_i32(tmp, tmp, shift);
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    break;
-                case 0xc: /* Negative offset.  */
-                    tcg_gen_addi_i32(addr, addr, -imm);
-                    break;
-                case 0xe: /* User privilege.  */
-                    tcg_gen_addi_i32(addr, addr, imm);
-                    memidx = get_a32_user_mem_index(s);
-                    break;
-                case 0x9: /* Post-decrement.  */
-                    imm = -imm;
-                    /* Fall through.  */
-                case 0xb: /* Post-increment.  */
-                    postinc = 1;
-                    writeback = 1;
-                    break;
-                case 0xd: /* Pre-decrement.  */
-                    imm = -imm;
-                    /* Fall through.  */
-                case 0xf: /* Pre-increment.  */
-                    writeback = 1;
-                    break;
-                default:
+            imm = insn & 0xff;
+            switch ((insn >> 8) & 0xf) {
+            case 0x0: /* Shifted Register.  */
+                shift = (insn >> 4) & 0xf;
+                if (shift > 3) {
                     tcg_temp_free_i32(addr);
                     goto illegal_op;
                 }
+                tmp = load_reg(s, rm);
+                if (shift) {
+                    tcg_gen_shli_i32(tmp, tmp, shift);
+                }
+                tcg_gen_add_i32(addr, addr, tmp);
+                tcg_temp_free_i32(tmp);
+                break;
+            case 0xc: /* Negative offset.  */
+                tcg_gen_addi_i32(addr, addr, -imm);
+                break;
+            case 0xe: /* User privilege.  */
+                tcg_gen_addi_i32(addr, addr, imm);
+                memidx = get_a32_user_mem_index(s);
+                break;
+            case 0x9: /* Post-decrement.  */
+                imm = -imm;
+                /* Fall through.  */
+            case 0xb: /* Post-increment.  */
+                postinc = 1;
+                writeback = 1;
+                break;
+            case 0xd: /* Pre-decrement.  */
+                imm = -imm;
+                /* Fall through.  */
+            case 0xf: /* Pre-increment.  */
+                writeback = 1;
+                break;
+            default:
+                tcg_temp_free_i32(addr);
+                goto illegal_op;
             }
         }
 
@@ -11066,10 +11059,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
             /* load pc-relative.  Bit 1 of PC is ignored.  */
-            val = read_pc(s) + ((insn & 0xff) * 4);
-            val &= ~(uint32_t)2;
-            addr = tcg_temp_new_i32();
-            tcg_gen_movi_i32(addr, val);
+            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
             tmp = tcg_temp_new_i32();
             gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
                                rd | ISSIs16Bit);
@@ -11447,16 +11437,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
          *  - Add PC/SP (immediate)
          */
         rd = (insn >> 8) & 7;
-        if (insn & (1 << 11)) {
-            /* SP */
-            tmp = load_reg(s, 13);
-        } else {
-            /* PC. bit 1 is ignored.  */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, read_pc(s) & ~(uint32_t)2);
-        }
         val = (insn & 0xff) * 4;
-        tcg_gen_addi_i32(tmp, tmp, val);
+        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
         store_reg(s, rd, tmp);
         break;
 
-- 
2.17.1

