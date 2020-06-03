Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp33154lfc;
        Tue, 2 Jun 2020 18:17:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY2Ts/5p6s7ON3v4h2g8klNKrSgKpBSC0njdeMKDlmpT2IVpX0thbEEGk6xRT+dwU6I4OD
X-Received: by 2002:a25:df15:: with SMTP id w21mr22540956ybg.210.1591147071539;
        Tue, 02 Jun 2020 18:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147071; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCmICsTumnaDi/UzGwZj/9xCNvEtuF50wq+ZEabFOTB71bq21osdTA1wt+dYa9HxMJ
         +Im7E9P4vF5tTTX0IzMUDgbkuJe9yFe5Dm5G1y4hDytw/lVFdqfgJtj7CJjwb0gO6o6G
         ujOB7s72pK+xW6yED5iYn98V2NJNjXMftOfrUyEeEeagiQxVy95k+kXGe/tLoLB52CGf
         LlCAa8Cmsf2vilvOWhd9N3r+uq9CU2rFjOW9dCR9JJBBNaugxhIWnLeGAXH8jsJ8qSL/
         rFkcYezcIVqqVRVrX6zk7rtVfWuCFFcEhvvsOenzfoFZYWKnQKs37lrGWrD8C3/Fw51m
         rXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MehLLPs7OH2d6Ox8Z4/DEtryQBHArcvcM5ew1vNvLQQ=;
        b=glGKwZXy54jtoHstDNrvPGis4zVJUoWk0zXcGMBHOwEXWj3A7vm6Wzpss3bm29Uvc/
         9+SP2iw5TCgoNB8tN9NEegeOOgbrnSiYknxOAL1pEzfATWhm5dEF4FxdpMMA0ZuD33GZ
         ABFsKkKl82SB5LnWXW6Xe8pp8DZjSHE42rDCMm/cU1Ez9NAPKkWtwsjlFB1gAPuvz2Xr
         Fzn81T8HxmhYMxptVP+5+zqIzpm7hFRau9TKIdzTXOss2GpUoelu/VGukjURq7KMcqDG
         TWEAegWJehoHHCyCj7iwyHi0JNbe7eZ1hqquTHhUk5UqnQx0fG6viXTNf/ZxqALUo5IT
         xEEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ak3KhUJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si294445ybr.420.2020.06.02.18.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ak3KhUJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI2Q-0002sQ-TA
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyH-0003jW-RA
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:33 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyG-0003YC-SA
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:33 -0400
Received: by mail-pl1-x644.google.com with SMTP id y11so186996plt.12
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MehLLPs7OH2d6Ox8Z4/DEtryQBHArcvcM5ew1vNvLQQ=;
 b=Ak3KhUJginINoFqCHKHBtNmOVSbXtdWbSHFc0M1UYoiTOC5/tqwWY1FkxRiDFgM0g/
 nNQR8uL2qIYdvwFc0jFA1UrIOGLJcuWfbcSAnIJ2gwJiktPHS6juDqM02DWoRAHKDE1u
 AtOpxZcdN7IT4KCUWafayECCLuF1mQH9dizLahlIEh8Ddqp1r3uchxVp4OLn84RkcRD+
 kXpCf1J6pETkqiyT3V+Bk+whJp2GcEZcFYI2X9vW8Gge52oj1+LNpzmGZHRX4ILk6PUw
 CcG49UQuj1s4keYlrlCETsEeunqnai8iGGZwYPTKxaY7hBcHgazlbxqAVsmluMBW+RWU
 6n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MehLLPs7OH2d6Ox8Z4/DEtryQBHArcvcM5ew1vNvLQQ=;
 b=Kj7ZsQdGA3LRduen2OuyPI0TUwh64gwUL0ENNULcfmtqN/Dpzb3Wuj6/VNpjBdw1Zn
 lBzSOo+9uby/9ctISgppMemi6ndoRIvuy34vfIPfZZFO+EabrUCwcWr4/2+zomVN4xto
 vLQJcPou721YpQPfUJ5Ly9bujzyzHoaF+q9JWQbqtmemvnQ1MortE5idlhlrEnCzX4Dh
 lewxs5+u3xSyqyQ60RG0co1JUNHJTMHc+sTZMgLeNZwETxHVVVgntxRo1WP1YUGQI2Bk
 HNCQvuQWG2Uc/Nn4Ign9QVqW3dM55UteE+A0XG5OQs9XqcltxdoAc5ZvN93585MRe/4z
 RKjw==
X-Gm-Message-State: AOAM532GujAzvg3nWCGv2GWrxEV6vP5wlWlQe+nwWob6irVV9QPdOLVh
 L5VoPlu5dLjGexJTJmRZGlAs7A==
X-Received: by 2002:a17:902:8509:: with SMTP id
 bj9mr27287428plb.151.1591146811617; 
 Tue, 02 Jun 2020 18:13:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/42] target/arm: Implement the ADDG, SUBG instructions
Date: Tue,  2 Jun 2020 18:12:45 -0700
Message-Id: <20200603011317.473934-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWznuWW4HED3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Shift offset in translate; use extract32.
v6: Implement inline for !ATA.
---
 target/arm/helper-a64.h    |  1 +
 target/arm/internals.h     |  9 +++++++++
 target/arm/mte_helper.c    | 10 ++++++++++
 target/arm/translate-a64.c | 36 ++++++++++++++++++++++++++++++++++--
 4 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 587ccbe42f..6c116481e8 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -105,3 +105,4 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_4(addsubg, TCG_CALL_NO_RWG_SE, i64, env, i64, s32, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index ae611a6ff5..5c69d4e5a5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1261,6 +1261,15 @@ void arm_log_exception(int idx);
  */
 #define GMID_EL1_BS  6
 
+/* We associate one allocation tag per 16 bytes, the minimum.  */
+#define LOG2_TAG_GRANULE 4
+#define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
+
+static inline int allocation_tag_from_addr(uint64_t ptr)
+{
+    return extract64(ptr, 56, 4);
+}
+
 static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
 {
     return deposit64(ptr, 56, 4, rtag);
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 539a04de84..9ab9ed749d 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -70,3 +70,13 @@ uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
 
     return address_with_allocation_tag(rn, rtag);
 }
+
+uint64_t HELPER(addsubg)(CPUARMState *env, uint64_t ptr,
+                         int32_t offset, uint32_t tag_offset)
+{
+    int start_tag = allocation_tag_from_addr(ptr);
+    uint16_t exclude = extract32(env->cp15.gcr_el1, 0, 16);
+    int rtag = choose_nonexcluded_tag(start_tag, tag_offset, exclude);
+
+    return address_with_allocation_tag(ptr + offset, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2481561925..a18d71ad98 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3753,17 +3753,20 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
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
     int rd = extract32(insn, 0, 5);
     int rn = extract32(insn, 5, 5);
-    uint64_t imm = extract32(insn, 10, 12);
+    int imm = extract32(insn, 10, 12);
     int shift = extract32(insn, 22, 2);
     bool setflags = extract32(insn, 29, 1);
     bool sub_op = extract32(insn, 30, 1);
     bool is_64bit = extract32(insn, 31, 1);
+    bool is_tag = false;
 
     TCGv_i64 tcg_rn = cpu_reg_sp(s, rn);
     TCGv_i64 tcg_rd = setflags ? cpu_reg(s, rd) : cpu_reg_sp(s, rd);
@@ -3775,11 +3778,40 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
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
 
+    if (is_tag) {
+        imm = (imm >> 6) << LOG2_TAG_GRANULE;
+        if (sub_op) {
+            imm = -imm;
+        }
+
+        if (s->ata) {
+            TCGv_i32 tag_offset = tcg_const_i32(imm & 15);
+            TCGv_i32 offset = tcg_const_i32(imm);
+
+            gen_helper_addsubg(tcg_rd, cpu_env, tcg_rn, offset, tag_offset);
+            tcg_temp_free_i32(tag_offset);
+            tcg_temp_free_i32(offset);
+        } else {
+            tcg_gen_addi_i64(tcg_rd, tcg_rn, imm);
+            gen_address_with_allocation_tag0(tcg_rd, tcg_rd);
+        }
+        return;
+    }
+
     tcg_result = tcg_temp_new_i64();
     if (!setflags) {
         if (sub_op) {
-- 
2.25.1

