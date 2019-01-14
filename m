Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2531393wrt;
        Sun, 13 Jan 2019 17:13:24 -0800 (PST)
X-Google-Smtp-Source: ALg8bN68yKxzsFismt4klkAnD0M6DPANlg9m9jpTaJl5H1xclK82I9IstGungJJKqExxulYLjMvm
X-Received: by 2002:a05:6000:120a:: with SMTP id e10mr22307799wrx.85.1547428404628;
        Sun, 13 Jan 2019 17:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428404; cv=none;
        d=google.com; s=arc-20160816;
        b=Vx4m/fLjSEIvTXSO8OGh7p7LoPnANalD9grHlkmzvgdVa0MuAx6zjjvdvswXyYc211
         hGnBtmzY82B/+9hYkotHAzPc7SYNTm0OGmiaQMkcgIxFZRL98n6W/BAPeHGHGiKu9sTj
         Lzp4fFRGIwKaMl8IyOIZZ5P8FCl5pVHUkYJt5sHEsLIy04+z/wuUNY0uUfzim4f1kNmT
         LIu3rKh5FbgdReHmAQyanbG99/oPhE9tHb2/Jrmpa8bkqd0FLQDTz3alCN0llzMsQps2
         glLgZd/BtvmS7+ZiXYLADwGiK0xzDavqSgbALdTg/gtlUnRR3nCy7zZy3+5Wt2OfDvM+
         8LQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zQWwHZdE0XEmu0eOmYlElX3aU8HsD5IKAzX45HBjqL0=;
        b=OSJ5wCYuJPArcNByxRBK1/6jueLd8T6ZK/0c1QB/YSnA/YcNkbIPjVbZRkWwcHqXdy
         8UhSuh45+JOm2umxJ7TmNXJrhzjGExkrPARFJx4HMCh7Tqyon1oIvNxewKW6WUj4HLlM
         yfdoXbifUa28jjPCIFqzUFWEdrXXD06/7IiygS0tTJYjtKVDPFSH0Bo9q9Zqd+UnudE4
         An0QprHSUn5miOjfklnU6ehivz02mwyCpYOoGGXPfLRPPVQp4iuZSwsaDoADKSRmaFqI
         lMbgqISfPsSu8dxFIHF+L2HEqy2/mAC9T+KEj+rTOHIv7LL+EfFlqeNaULqjQ31SFQZS
         KWtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVakkAEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si49368325wrm.351.2019.01.13.17.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:13:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVakkAEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqod-0006gv-EK
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnE-0005d7-Bx
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnD-0000uB-A1
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:56 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnD-0000tQ-4R
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:55 -0500
Received: by mail-pf1-x442.google.com with SMTP id c73so9526056pfe.13
	for <qemu-arm@nongnu.org>; Sun, 13 Jan 2019 17:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zQWwHZdE0XEmu0eOmYlElX3aU8HsD5IKAzX45HBjqL0=;
	b=eVakkAEgn6TL8pgzLNe9EuYrR+dNvG07dJPTfb+6p9kFTO7iXTIr5WQXjq5hRcgHrQ
	Sl6svAP3zApq9qLsEtIwD702jOatMApY4hA3kPClXuO0VQXcSSN4WYtBMSAzRxK88ul8
	4s3C0Pm22yOvBXQrp0dpqDsnmUuOErMblOEXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zQWwHZdE0XEmu0eOmYlElX3aU8HsD5IKAzX45HBjqL0=;
	b=dLa1scIBChyH+hdsOb7LmteIC5imjvdnmG/nFMptCq9ODVVHWdzIVkPEAbvec7TYAI
	Nkiu9fI4QQcEXOm4Q8Im9a3gf1tD7C3wUZTKurBnoqi4Rs9h3jabcUa5uxBGHSOgWLOk
	kkPt/Pg0dEFZLMd6dvbOHza8cna8drhY8maAADDnWwsGginoqJcSiSBBppEJdBRNX+ui
	SA5uxj0Gcjv3rVlSjnei2JM4m1a8Jgd9SMDBVeHLjz/j31dXFSp+HkgoUw48djFhNJvC
	g3YWw4yQsnPD7D6gw4Gz41AK/+fwwbt4m4jXkfJMgb6WytalaCt+2iQNuzHSjUpi4Spm
	hYvg==
X-Gm-Message-State: AJcUukdZ//0rjmEmC3ypj6NKKOu6O3H8dOLMf+G+RkyfYVaKRrGuyiHo
	alQEltjguRchyp1si/VidVnrMQ==
X-Received: by 2002:a63:88c7:: with SMTP id
	l190mr20683453pgd.110.1547428314189; 
	Sun, 13 Jan 2019 17:11:54 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:12 +1100
Message-Id: <20190114011122.5995-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH 07/17] target/arm: Implement ADDG,
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
X-TUID: B9EDHDdbikkp

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/internals.h     |  3 ++
 target/arm/mte_helper.c    | 34 ++++++++++++++++++
 target/arm/translate-a64.c | 71 ++++++++++++++++++++++++++------------
 4 files changed, 87 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7a6051fdab..47577207b2 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -105,3 +105,5 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2922324f63..a5a249b001 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1002,4 +1002,7 @@ static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
     return sctlr != 0;
 }
 
+/* We associate one allocation tag per 16 bytes, the minimum.  */
+#define LOG2_TAG_GRANULE 4
+
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 1878393fc4..e2b1a5dd40 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -163,3 +163,37 @@ uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
     }
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
+        uint16_t exclude = env->cp15.gcr_el1;
+        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
+    }
+
+    offset <<= LOG2_TAG_GRANULE;
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
+        uint16_t exclude = env->cp15.gcr_el1;
+        rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
+    }
+
+    offset <<= LOG2_TAG_GRANULE;
+    return address_with_allocation_tag(ptr - offset, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b0349bffc4..879d6b8d46 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3652,7 +3652,9 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
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
@@ -3663,10 +3665,10 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
     bool setflags = extract32(insn, 29, 1);
     bool sub_op = extract32(insn, 30, 1);
     bool is_64bit = extract32(insn, 31, 1);
+    bool is_tag = false;
 
     TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
     TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
-    TCGv_i64 tcg_result;
 
     switch (shift) {
     case 0x0:
@@ -3674,35 +3676,58 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
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
+        TCGv_i32 offset = tcg_const_i32(imm >> 6);
 
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

