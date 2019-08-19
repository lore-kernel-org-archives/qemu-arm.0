Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3180577wrs;
        Mon, 19 Aug 2019 14:52:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB2au125xBHH+rVKcdFDKdd11/L+PBI8hP1evd1252L5u7PBoGpbt2imzG4qwTE3xHeoe/
X-Received: by 2002:aa7:da4a:: with SMTP id w10mr27401676eds.74.1566251551482;
        Mon, 19 Aug 2019 14:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251551; cv=none;
        d=google.com; s=arc-20160816;
        b=FrHWqTs2R/57n6oca7wfy1I+pRDfWFj0ry1KLPPXkjDsvb9ndn6c7DCKzSociOX82G
         zVTj4pm4dfjLyaCMqEg2mzbtsJdIxmc4+sdfDOzH+v/U+WBszzcETLejc9noBvR54q02
         P9v1/WPJi6H9+SFXcejNn3sawUNu8wWaXS8PPmsFnldn3VIcuxSN0dy6pHfMqEgR7lb0
         viOWMfJz9369y7QBoF41lEC3z08UTa7CUI1fuJky001JC89Ij76MpPy2hBVgUama4GUv
         hv0w/w72OP/AjjfF48TidTiahjk3JVHF5r3ysHeFRyqMhERrvz8iaiJgzQA8ETTsiete
         +uBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yfBEnFsdiAgak7aUP03KjpvGrVpxR8pw6hwr0KfqOzQ=;
        b=VplWdb2G9nbiTyAFaybl1cZTRJpOEYNTokGafDHK350gYaknrFu1XIKdG15OBZuDwa
         dAQBierF/jIvtZFfrjf0BKp8TXm792Z+mnhDDYUbCxO7lHGvGOzyr8mo5CodN8pSA7Gx
         DoGpM/d77i9BnYiRZNuCYsbv+S3oGSG+MYbWMF9hIAl1ByxjkWLTDq2Bvba5xatNBaVq
         Wp7asAniu1OnNSEXZ7ocLcYx3mnxmGRRVg+dmv0R1V6ZNlfxduZuyyWdX4yr/50fz1Q+
         VCWJxWrBDLqj4wMepZG+PKXj5SeYCoK6iEa+4qUl/G+wLuBTGz3vbIERPfmmKRhKu/zR
         ry5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RkcDuxzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si7871695ejs.376.2019.08.19.14.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RkcDuxzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpZm-0002Iy-26
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM0-0001Xc-Ed
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLy-00067H-LA
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLy-00066n-BH
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:14 -0400
Received: by mail-pl1-x643.google.com with SMTP id z3so1585950pln.6
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yfBEnFsdiAgak7aUP03KjpvGrVpxR8pw6hwr0KfqOzQ=;
 b=RkcDuxzr43MIeIvVP7H7Qce4Gg0mc3x+a7toDAcIS9Qz6BgeV7OFa992NmADu/6GsW
 1ARUrk7OqpS+y4TIdNcDZLnJ0F0h2O/ug0giqMdTvUL2lYPOAEny3J0TavRZMcUpxJP5
 dyeahBaSxQBFerHk9tqqBmRzdahnDdBE9fIMqOtcmb2sU2F1VxSWoNXOcJ6feYSpFsd+
 goAPEF3sjdAYy/36CQeXS4WnrQ9rAY0d3Fhnb5V4bpS9ARBbC/el881yAxUKBZYrA3gT
 6h4CFB7k2ZW54lal7I5BCBvPj5SBK0+QwXDFHXjnV5z+r/9mzdwNmFUcoHfoaPf6tai8
 ywFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yfBEnFsdiAgak7aUP03KjpvGrVpxR8pw6hwr0KfqOzQ=;
 b=r9dbxmZPcIFeibdnaoSc0Ck5v5kvewCmRxIt468gizM1k5C2bCq5oqBWjJwIHTvmUh
 gOcG8PHYH7Y65BAjndFCmOCej3kqcMhbgxBOi2MZd/+FEX9Y/feNgTCNditzdJd0LrxR
 SpEzCIS9FCUW5pSPR500fiyxz8Aq3ujCOE58WXeiFGxSqlE4EZ73i6ueEkX1ZQwy1nXC
 +iJaGy+twXg0ZRTZllq+DTfdO1GX5rrGWi5FaN1Vg5DtiBBqw+xZwthKWdf+t9erf1wl
 GbMVADdiffRjtGUGd2Uuf1QKbL4VjTZA9qLlfvTQ1mk53agrJDp5bkV4gYu7S+H1uKXj
 YJWA==
X-Gm-Message-State: APjAAAVOOA6Nz4vzsjixjbiXmyG8hFFrMtMlMYAV+fqpuYiCdf6TwUnB
 bxeSFWgf8obRM0jgb7cA5DlqQA==
X-Received: by 2002:a17:902:6bc7:: with SMTP id
 m7mr25195841plt.60.1566250693347; 
 Mon, 19 Aug 2019 14:38:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:00 -0700
Message-Id: <20190819213755.26175-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v2 13/68] target/arm: Convert MRS/MSR (banked,
 register)
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
X-TUID: kYM5+tZSJRYm

The m-profile and a-profile, decodings overlap.  Only return false
for the case of wrong profile; handle UNDEFINED for permission failure
directly.  This ensures that we don't accidentally pass an insn that
applies to the wrong profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 226 ++++++++++++++++++-----------------------
 target/arm/a32.decode  |  14 +++
 target/arm/t32.decode  |  40 ++++++--
 3 files changed, 142 insertions(+), 138 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ee485b1cbd..026abcaa9c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8291,6 +8291,93 @@ static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
     return true;
 }
 
+/*
+ * Miscellaneous instructions
+ */
+
+static bool trans_MRS_bank(DisasContext *s, arg_MRS_bank *a)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    gen_mrs_banked(s, a->r, a->sysm, a->rd);
+    return true;
+}
+
+static bool trans_MSR_bank(DisasContext *s, arg_MSR_bank *a)
+{
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    gen_msr_banked(s, a->r, a->sysm, a->rn);
+    return true;
+}
+
+static bool trans_MRS_reg(DisasContext *s, arg_MRS_reg *a)
+{
+    TCGv_i32 tmp;
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    if (a->r) {
+        if (IS_USER(s)) {
+            unallocated_encoding(s);
+            return true;
+        }
+        tmp = load_cpu_field(spsr);
+    } else {
+        tmp = tcg_temp_new_i32();
+        gen_helper_cpsr_read(tmp, cpu_env);
+    }
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_MSR_reg(DisasContext *s, arg_MSR_reg *a)
+{
+    TCGv_i32 tmp;
+    uint32_t mask = msr_mask(s, a->mask, a->r);
+
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    tmp = load_reg(s, a->rn);
+    if (gen_set_psr(s, mask, a->r, tmp)) {
+        unallocated_encoding(s);
+    }
+    return true;
+}
+
+static bool trans_MRS_v7m(DisasContext *s, arg_MRS_v7m *a)
+{
+    TCGv_i32 tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    tmp = tcg_const_i32(a->sysm);
+    gen_helper_v7m_mrs(tmp, cpu_env, tmp);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
+static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
+{
+    TCGv_i32 addr, reg;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    addr = tcg_const_i32((a->mask << 10) | a->sysm);
+    reg = load_reg(s, a->rn);
+    gen_helper_v7m_msr(cpu_env, addr, reg);
+    tcg_temp_free_i32(addr);
+    tcg_temp_free_i32(reg);
+    gen_lookup_tb(s);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8575,46 +8662,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         sh = (insn >> 4) & 0xf;
         rm = insn & 0xf;
         switch (sh) {
-        case 0x0: /* MSR, MRS */
-            if (insn & (1 << 9)) {
-                /* MSR (banked) and MRS (banked) */
-                int sysm = extract32(insn, 16, 4) |
-                    (extract32(insn, 8, 1) << 4);
-                int r = extract32(insn, 22, 1);
-
-                if (op1 & 1) {
-                    /* MSR (banked) */
-                    gen_msr_banked(s, r, sysm, rm);
-                } else {
-                    /* MRS (banked) */
-                    int rd = extract32(insn, 12, 4);
-
-                    gen_mrs_banked(s, r, sysm, rd);
-                }
-                break;
-            }
-
-            /* MSR, MRS (for PSRs) */
-            if (op1 & 1) {
-                /* PSR = reg */
-                tmp = load_reg(s, rm);
-                i = ((op1 & 2) != 0);
-                if (gen_set_psr(s, msr_mask(s, (insn >> 16) & 0xf, i), i, tmp))
-                    goto illegal_op;
-            } else {
-                /* reg = PSR */
-                rd = (insn >> 12) & 0xf;
-                if (op1 & 2) {
-                    if (IS_USER(s))
-                        goto illegal_op;
-                    tmp = load_cpu_field(spsr);
-                } else {
-                    tmp = tcg_temp_new_i32();
-                    gen_helper_cpsr_read(tmp, cpu_env);
-                }
-                store_reg(s, rd, tmp);
-            }
-            break;
+        case 0x0:
+            /* MSR/MRS (banked/register) */
+            /* All done in decodetree.  Illegal ops already signalled.  */
+            g_assert_not_reached();
         case 0x1:
             if (op1 == 1) {
                 /* branch/exchange thumb (bx).  */
@@ -10471,40 +10522,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 } else {
                     op = (insn >> 20) & 7;
                     switch (op) {
-                    case 0: /* msr cpsr.  */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            tmp = load_reg(s, rn);
-                            /* the constant is the mask and SYSm fields */
-                            addr = tcg_const_i32(insn & 0xfff);
-                            gen_helper_v7m_msr(cpu_env, addr, tmp);
-                            tcg_temp_free_i32(addr);
-                            tcg_temp_free_i32(tmp);
-                            gen_lookup_tb(s);
-                            break;
-                        }
-                        /* fall through */
-                    case 1: /* msr spsr.  */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-
-                        if (extract32(insn, 5, 1)) {
-                            /* MSR (banked) */
-                            int sysm = extract32(insn, 8, 4) |
-                                (extract32(insn, 4, 1) << 4);
-                            int r = op & 1;
-
-                            gen_msr_banked(s, r, sysm, rm);
-                            break;
-                        }
-
-                        /* MSR (for PSRs) */
-                        tmp = load_reg(s, rn);
-                        if (gen_set_psr(s,
-                              msr_mask(s, (insn >> 8) & 0xf, op == 1),
-                              op == 1, tmp))
-                            goto illegal_op;
-                        break;
+                    case 0: /* msr cpsr, in decodetree  */
+                    case 1: /* msr spsr, in decodetree  */
+                        goto illegal_op;
                     case 2: /* cps, nop-hint.  */
                         /* nop hints in decodetree */
                         /* Implemented as NOP in user mode.  */
@@ -10596,61 +10616,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         }
                         gen_exception_return(s, tmp);
                         break;
-                    case 6: /* MRS */
-                        if (extract32(insn, 5, 1) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            /* MRS (banked) */
-                            int sysm = extract32(insn, 16, 4) |
-                                (extract32(insn, 4, 1) << 4);
-
-                            gen_mrs_banked(s, 0, sysm, rd);
-                            break;
-                        }
-
-                        if (extract32(insn, 16, 4) != 0xf) {
-                            goto illegal_op;
-                        }
-                        if (!arm_dc_feature(s, ARM_FEATURE_M) &&
-                            extract32(insn, 0, 8) != 0) {
-                            goto illegal_op;
-                        }
-
-                        /* mrs cpsr */
-                        tmp = tcg_temp_new_i32();
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            addr = tcg_const_i32(insn & 0xff);
-                            gen_helper_v7m_mrs(tmp, cpu_env, addr);
-                            tcg_temp_free_i32(addr);
-                        } else {
-                            gen_helper_cpsr_read(tmp, cpu_env);
-                        }
-                        store_reg(s, rd, tmp);
-                        break;
-                    case 7: /* MRS */
-                        if (extract32(insn, 5, 1) &&
-                            !arm_dc_feature(s, ARM_FEATURE_M)) {
-                            /* MRS (banked) */
-                            int sysm = extract32(insn, 16, 4) |
-                                (extract32(insn, 4, 1) << 4);
-
-                            gen_mrs_banked(s, 1, sysm, rd);
-                            break;
-                        }
-
-                        /* mrs spsr.  */
-                        /* Not accessible in user mode.  */
-                        if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-
-                        if (extract32(insn, 16, 4) != 0xf ||
-                            extract32(insn, 0, 8) != 0) {
-                            goto illegal_op;
-                        }
-
-                        tmp = load_cpu_field(spsr);
-                        store_reg(s, rd, tmp);
-                        break;
+                    case 6: /* MRS, in decodetree */
+                    case 7: /* MSR, in decodetree */
+                        goto illegal_op;
                     }
                 }
             } else {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 3d5c5408f9..6ee12c1140 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -29,6 +29,10 @@
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
+&msr_reg         rn r mask
+&mrs_reg         rd r
+&msr_bank        rn r sysm
+&mrs_bank        rd r sysm
 
 # Data-processing (register)
 
@@ -177,3 +181,13 @@ SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
   MSR_imm        .... 0011 0010 .... 1111 .... .... ....      @msr_i r=0
 }
 MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
+
+# Miscellaneous instructions
+
+%sysm            8:1 16:4
+
+MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
+MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
+
+MRS_reg          ---- 0001 0 r:1 00 1111   rd:4 0000 0000 0000  &mrs_reg
+MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index ccb7cdd4ef..98b682e7ec 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -26,6 +26,10 @@
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
+&msr_reg         !extern rn r mask
+&mrs_reg         !extern rd r
+&msr_bank        !extern rn r sysm
+&mrs_bank        !extern rd r sysm
 
 # Data-processing (register)
 
@@ -170,16 +174,34 @@ QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
 
 # Branches and miscellaneous control
 
+%msr_sysm        4:1 8:4
+%mrs_sysm        4:1 16:4
+
 {
-  YIELD          1111 0011 1010 1111 1000 0000 0000 0001
-  WFE            1111 0011 1010 1111 1000 0000 0000 0010
-  WFI            1111 0011 1010 1111 1000 0000 0000 0011
+  {
+    YIELD        1111 0011 1010 1111 1000 0000 0000 0001
+    WFE          1111 0011 1010 1111 1000 0000 0000 0010
+    WFI          1111 0011 1010 1111 1000 0000 0000 0011
 
-  # TODO: Implement SEV, SEVL; may help SMP performance.
-  # SEV          1111 0011 1010 1111 1000 0000 0000 0100
-  # SEVL         1111 0011 1010 1111 1000 0000 0000 0101
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV        1111 0011 1010 1111 1000 0000 0000 0100
+    # SEVL       1111 0011 1010 1111 1000 0000 0000 0101
 
-  # The canonical nop ends in 0000 0000, but the whole rest
-  # of the space is "reserved hint, behaves as nop".
-  NOP            1111 0011 1010 1111 1000 0000 ---- ----
+    # The canonical nop ends in 0000 0000, but the whole rest
+    # of the space is "reserved hint, behaves as nop".
+    NOP          1111 0011 1010 1111 1000 0000 ---- ----
+  }
+  # Note that the v7m insn overlaps both the normal and banked insn.
+  {
+    MRS_bank     1111 0011 111 r:1 .... 1000 rd:4   001. 0000  \
+                 &mrs_bank sysm=%mrs_sysm
+    MRS_reg      1111 0011 111 r:1 1111 1000 rd:4   0000 0000  &mrs_reg
+    MRS_v7m      1111 0011 111 0   1111 1000 rd:4   sysm:8
+  }
+  {
+    MSR_bank     1111 0011 100 r:1 rn:4 1000 ....   001. 0000  \
+                 &msr_bank sysm=%msr_sysm
+    MSR_reg      1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
+    MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
+  }
 }
-- 
2.17.1

