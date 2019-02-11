Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1948632wrq;
        Sun, 10 Feb 2019 17:19:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbIXsKlxXw+raE37f1d0Iwot6w8zDyngjhPAgdgYKqSpD8uw/gEsWoGIQ+Nw0K6UhYFRStd
X-Received: by 2002:a5d:4546:: with SMTP id p6mr24633313wrr.35.1549847987995;
        Sun, 10 Feb 2019 17:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847987; cv=none;
        d=google.com; s=arc-20160816;
        b=Pzdl3fY1mEobN7QrWugxzcyYTqSMYl+lJYw3eyMMxtRdnI1kgQNKeuQ8TZMV9uAJZK
         GNozVgkAE+Myf8QtJyS1t31gfTMeYxXOjY/0uSn+uFm2T1IA2F5tbVKYME8QvaIwXlDe
         LJ0Pb9NLA8IWxcf5hY9mruYlO4elo+81+SDmXMTYfNWucLBlznXvUIeSadF04pd1IA68
         rnIKi+nc1XDl8eit16y7RlwiZZFaRQqFUb7GXru8BIJ6wz0Cqk5tCEYP3a/sIG/rYrK8
         uCAiU3tZReC3CizWuQA2bTq5rtZhfIxfxlip+BPuVNuPgZNeYajJt0C9a6OW+zxB+Y/t
         huuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pzLCNeCqKG16DdlKX6doEukj/XDWLvUBLDoMwO5fXQ0=;
        b=Y/Vzt7bEHWuqy0N86xMlOtcIkQWHFKC7nHVMlL3n7r/EKMSr+GPJEkMZYEb/IevWPV
         6bkiHKYCC57imels3SZfbcCK6g86+Ti1f46Ur9UTze4FA85tZufFvp4/P476Yj4ycsqZ
         HZTv7WHj3Ssd9B6HefkL9ShfASsU6BXk2TNbqLp6zyfPW/mFAq8jUcx5C+RxX/Cd7nvX
         Hj5ESOjINYZddo402DFFIhafKAceD4TBb6G8hY3V8Gi9u9fULPSMTGQ5PZstfUbkZcsU
         NwrBh1xVxq9W/hzHY8i8L6B4O9R+gVI2jFQw4xEYldnFVwNb6Gje1CihMfX9DVvigjZU
         xGDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pFkFUD6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si6289623wrn.137.2019.02.10.17.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:19:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pFkFUD6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0GA-0005hc-TF
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:19:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05r-0005sb-MH
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05p-0008VW-Ry
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:07 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05o-00089j-3q
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:05 -0500
Received: by mail-pf1-x430.google.com with SMTP id b7so4456952pfi.8
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pzLCNeCqKG16DdlKX6doEukj/XDWLvUBLDoMwO5fXQ0=;
	b=pFkFUD6PrbUaGsI+cecPKBdbsvm3GqCyIUau853t8sF2CzcURgoQ55mE1IWUF35FOO
	Z8O42LGsuHjz1SgA5/qjIR1t3UD9pBOriP1HG6dhx23+Gg4//1H9k14wWQ3o5yVDH9KY
	duv1TFAGb0gBmqNPVcAL12Lh3+MDsBk5oM+RZItDozm19kujfdWKy12cwkh+wUeLqqjH
	CQSct8GX8Aql8Mv8RF8SupQQnUYIzdVF7eCNWBji+msAbUAPrxWVUNSYj5RPqGo0AzmL
	hBTxZepXNjpBnswx4SVQwG/BYgsONoH/V/yi1VFANnw/g3JZj9knGNSJV0TgiqCAcqfi
	VhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pzLCNeCqKG16DdlKX6doEukj/XDWLvUBLDoMwO5fXQ0=;
	b=k+g6YhCD1Lt+HV3Q5WATv30WATb2hcepUWruewiG7e1+8N9rFnrgFcoCiZ/7KNHuSO
	5LSLTq3gqxNiw7gjBvYET0tU+gahA5snC/FJ4c91vtNCudHYKy4BaU8MymWmZBGsMDKn
	zJZb8Uc/HlMRWoXUOvPNCuicBL+3DJ4RU6EjV5I0vmghoc3jt1tWOlOn+L2yWvermDZF
	xXSfuhP5cBcqO8DTsVhiSEvr6Hcz1enxSIpKAaRbZ0vyW5jLIGrCaD00mfawgYiDnDAz
	sCtrYRvo7TT0jJ1KpZ6O9NLnPM/alxhVn0ct+NJCbdCQHVJFjNp6HBuAx5q7DaHCAnfg
	KUXg==
X-Gm-Message-State: AHQUAuYDQvRYMQ0InquIr6L46Eo+SxJt5k1uzChaqj9CsxysQeoKXvpm
	NR401eNYRz2qg5jmoDfHEbd40A==
X-Received: by 2002:a63:ab0b:: with SMTP id p11mr32074688pgf.264.1549847326558;
	Sun, 10 Feb 2019 17:08:46 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:14 -0800
Message-Id: <20190211010829.29869-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: [Qemu-arm] [PATCH v2 11/26] target/arm: Implement ADDG,
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
X-TUID: /+OUFhQSdwdO

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift offset in translate; use extract32.
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/internals.h     |  3 ++
 target/arm/mte_helper.c    | 32 +++++++++++++++++
 target/arm/translate-a64.c | 71 ++++++++++++++++++++++++++------------
 4 files changed, 85 insertions(+), 23 deletions(-)

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
index 493c2f7bb2..3eb5d622fc 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -202,3 +202,35 @@ uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 
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
index 5e7d7f2d5e..3d71a9701f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3672,7 +3672,9 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
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
@@ -3683,10 +3685,10 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
     bool setflags = extract32(insn, 29, 1);
     bool sub_op = extract32(insn, 30, 1);
     bool is_64bit = extract32(insn, 31, 1);
+    bool is_tag = false;
 
     TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
     TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
-    TCGv_i64 tcg_result;
 
     switch (shift) {
     case 0x0:
@@ -3694,35 +3696,58 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
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

