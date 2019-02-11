Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp116518wrp;
        Mon, 11 Feb 2019 16:10:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia4cOu2ZkgvLhChOo0qzydH3BlpTMyr+vtJ3zKn8lTp7aTjSbkT4iuTVi6CJao3jcgs1add
X-Received: by 2002:a81:f00c:: with SMTP id p12mr683842ywm.55.1549930219899;
        Mon, 11 Feb 2019 16:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930219; cv=none;
        d=google.com; s=arc-20160816;
        b=KqDnusiY1fjG4VB5npsRnR28Qf5m/69gSrbANjfWr2l0h+ksOYMWYZRbKAo9zerd7w
         tn13L0RqdC0O8Jmizmm7bxbuImBCEv2TPVdTh7gGJwxadYtZ0Ni06hTyxd1sao8pOLm1
         M0zR6XzAQgToB1UXZdNdstN9gl0Au9gVcSnPsM3LJYmQ2+jPVpgy3hYIZoFyHCHjHnq3
         cumborkmnH22FVlFr6PbnCCX50Ir/j2dd6cAlFl2GE+dA5+zQyYvUG62cxYX1RT0dAvC
         +1lIHPIXEcflryWc7O07TwSVoBzf8OQQ2C618aBRgBzr43Zvy/5sLkIzlgrH6m/ub779
         mYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GFj0m2pqBwYhUNoAsjQMSgz6zB0/Trk1Z4b3L8tgOKM=;
        b=VfSZQcKOmW6o/3SeRvmo0te1NwpXoThLNan5MZ5Wsu5nh054nyitpj9ke0Oj2SXURf
         dh/+ZRwBc7HgZdmbMs1r72tRp3AmMGnkO4efOkK91Pg8jCpOHiVLnnIaeT15ou4KDr3O
         ZXwcSpOrDIe+8ohtw3m2M+vwWIRhDW6SAzWQGppWgGo7/ePcgpIbGMCEZsJBc3lCcEnU
         kIUASTCXq5IIyaoFoiRavntYdpAj1/v2InWFOpUdrTLb6WEY4K5Dsvmv6M3RJxHqRLzv
         YL4Lmozzt0JdINAhQc1hh0b+6COGSTLLFPdQurtdSZjyvubaOSN1bKGwvLneQIS+aND6
         t4kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LZourBT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i196si3290039ywc.3.2019.02.11.16.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:10:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LZourBT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLeV-0001b3-9Y
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOc-0005lW-6h
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOT-0004om-Tg
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:50 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOK-0004Ri-C6
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:36 -0500
Received: by mail-pf1-x441.google.com with SMTP id j18so346296pfe.1
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GFj0m2pqBwYhUNoAsjQMSgz6zB0/Trk1Z4b3L8tgOKM=;
	b=LZourBT/lW/TOntHWoLTxskhFtFMwzLnxrT7C3tVNxI2XDf/XQ7W2746S9xe8tj6QZ
	zEgSLsVgqUs1efrqc2NRmUhaQILHTJhj63tVMqQvAZCVs3druPI2FYnxGxpQorSUICSi
	0MHObMqHoL//mFX4lzqiVvjLwcYK1jqs0i4Pk1ThI+RaYpGXURdX+uen/bKYaMWBl34f
	OJPfVveMX3sERHwqVDZ0TqWs5hqcQS8N5D2XI3xu6ujn18fE+OiM/JXopEm12q8DGs7X
	TodJjd3vsb9JuEMBGOE9nhAGqiBmMQqaPL9upsDs/mpOACm69jCaXR8Ee4CU805pi4+E
	atmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GFj0m2pqBwYhUNoAsjQMSgz6zB0/Trk1Z4b3L8tgOKM=;
	b=lupo7QHGId31cn8ZfGa6u7oHgWiBvnF5itZLFLGXlLZ9DAVyiIgzkAmm5eiDqwJTzR
	O78DNOllJinLL0MTz4UOCC/UTPKkors+X0nk7raao19kG60c1hCLcvvb8LNwDqPwFYbf
	RnkotYpVlr77SVz1Hg3dQzZXjUj83Xua+telVNAwxpFh4jScE5Gym7z0+mZ9ibfGs3ud
	s5vv5eytYIs0RRBed/yfgLnYtYGm71Re2y9CUzQOVUaJk/GJ4V/HozR7ugcZjqSQ5mHh
	R1drYc/vhLQ/j9t7oNoHkzW2hhDiSpT59XWqHC/4B0pLMqJQYzUuWAsrhWxqm4OhUPGv
	quuA==
X-Gm-Message-State: AHQUAuYilzhnMtjUk2iM7JWnEvQeSfSTwrM+fjg1OQlwwuxQ/+6oomwx
	vH/1Sp0fWdtdU1FDJhNLhbNagg==
X-Received: by 2002:a62:f5d7:: with SMTP id b84mr949245pfm.36.1549929195835;
	Mon, 11 Feb 2019 15:53:15 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:41 -0800
Message-Id: <20190211235258.542-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 11/28] target/arm: Implement ADDG,
 SUBG instructions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TvKhiq9DqkHT

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift offset in translate; use extract32.
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/internals.h     |  4 +++
 target/arm/mte_helper.c    | 32 +++++++++++++++++
 target/arm/translate-a64.c | 71 ++++++++++++++++++++++++++------------
 4 files changed, 86 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 0f6e78c77e..6ad23bf9ee 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -106,3 +106,5 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(mte_check1, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(mte_check2, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fbfa770c23..8d1a81df8c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1008,4 +1008,8 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
  */
 #define GMID_EL1_BS  6
 
+/* We associate one allocation tag per 16 bytes, the minimum.  */
+#define LOG2_TAG_GRANULE 4
+#define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
+
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index cd04e4954b..7aca5b074f 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -188,3 +188,35 @@ uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 
     return address_with_allocation_tag(rn, rtag);
 }
+
+uint64_t HELPER(addg)(CPUARMState *env, uint64_t ptr,
+                      uint32_t offset, uint32_t tag_offset)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag = 0;
+
+    if (allocation_tag_access_enabled(env, el, sctlr)) {
+        int start_tag = allocation_tag_from_addr(ptr);
+        uint16_t exclude = extract32(env->cp15.gcr_el1, 0, 16);
+        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
+    }
+
+    return address_with_allocation_tag(ptr + offset, rtag);
+}
+
+uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
+                      uint32_t offset, uint32_t tag_offset)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag = 0;
+
+    if (allocation_tag_access_enabled(env, el, sctlr)) {
+        int start_tag = allocation_tag_from_addr(ptr);
+        uint16_t exclude = extract32(env->cp15.gcr_el1, 0, 16);
+        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
+    }
+
+    return address_with_allocation_tag(ptr - offset, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 141a03a88f..8e322bd6a0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3679,7 +3679,9 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
  *    sf: 0 -> 32bit, 1 -> 64bit
  *    op: 0 -> add  , 1 -> sub
  *     S: 1 -> set flags
- * shift: 00 -> LSL imm by 0, 01 -> LSL imm by 12
+ * shift: 00 -> LSL imm by 0,
+ *        01 -> LSL imm by 12
+ *        10 -> ADDG, SUBG
  */
 static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
 {
@@ -3690,10 +3692,10 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
     bool setflags = extract32(insn, 29, 1);
     bool sub_op = extract32(insn, 30, 1);
     bool is_64bit = extract32(insn, 31, 1);
+    bool is_tag = false;
 
     TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
     TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
-    TCGv_i64 tcg_result;
 
     switch (shift) {
     case 0x0:
@@ -3701,35 +3703,58 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
     case 0x1:
         imm <<= 12;
         break;
+    case 0x2:
+        /* ADDG, SUBG */
+        if (!is_64bit || setflags || (imm & 0x30) ||
+            !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        is_tag = true;
+        break;
     default:
+    do_unallocated:
         unallocated_encoding(s);
         return;
     }
 
-    tcg_result = tcg_temp_new_i64();
-    if (!setflags) {
-        if (sub_op) {
-            tcg_gen_subi_i64(tcg_result, tcg_rn, imm);
-        } else {
-            tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
-        }
-    } else {
-        TCGv_i64 tcg_imm = tcg_const_i64(imm);
-        if (sub_op) {
-            gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
-        } else {
-            gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
-        }
-        tcg_temp_free_i64(tcg_imm);
-    }
+    if (is_tag) {
+        TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
+        TCGv_i32 offset = tcg_const_i32((imm >> 6) << LOG2_TAG_GRANULE);
 
-    if (is_64bit) {
-        tcg_gen_mov_i64(tcg_rd, tcg_result);
+        if (sub_op) {
+            gen_helper_subg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
+        } else {
+            gen_helper_addg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
+        }
+        tcg_temp_free_i32(tag_offset);
+        tcg_temp_free_i32(offset);
     } else {
-        tcg_gen_ext32u_i64(tcg_rd, tcg_result);
-    }
+        TCGv_i64 tcg_result;
 
-    tcg_temp_free_i64(tcg_result);
+        if (!setflags) {
+            tcg_result = tcg_rd;
+            if (sub_op) {
+                tcg_gen_subi_i64(tcg_result, tcg_rn, imm);
+            } else {
+                tcg_gen_addi_i64(tcg_result, tcg_rn, imm);
+            }
+        } else {
+            TCGv_i64 tcg_imm = tcg_const_i64(imm);
+            tcg_result = new_tmp_a64(s);
+            if (sub_op) {
+                gen_sub_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
+            } else {
+                gen_add_CC(is_64bit, tcg_result, tcg_rn, tcg_imm);
+            }
+            tcg_temp_free_i64(tcg_imm);
+        }
+
+        if (is_64bit) {
+            tcg_gen_mov_i64(tcg_rd, tcg_result);
+        } else {
+            tcg_gen_ext32u_i64(tcg_rd, tcg_result);
+        }
+    }
 }
 
 /* The input should be a value in the bottom e bits (with higher
-- 
2.17.2

