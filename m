Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087326lfc;
        Thu, 12 Mar 2020 12:42:35 -0700 (PDT)
X-Received: by 2002:a65:420c:: with SMTP id c12mr9119591pgq.270.1584042155072;
        Thu, 12 Mar 2020 12:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042155; cv=none;
        d=google.com; s=arc-20160816;
        b=BRsIXPDmvHdCUKo1A3r/38tzsFwf6qSBvPV2eRTY0pOsSQ3VJtHNpSV/JqdKlOGpiD
         GlmiDV1SCE7Xi2JO050iWEZ9VKNOHvFk5g5VNh9QYRBsfcvkIAt1FvP9Wzi/40vJd7JY
         3end+r7twFrtcJmc+sbwXw2lTLdeQTmc7i96oW4rItEL5Izfj8ZITZ6uOKhXijjSTRN1
         SlJKO6/1E+BhVyjv6jziu1xhybKxTO3+AzCBuPJ5h2KnOO42FaFcEdd7XFklKSdNrEzU
         u4WA14x6r/JWMbRIiYo6o58H/CIeQBvLSE2BWu928SC7h5d1jJvc77xk6o4TIYjbqPXF
         rTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KVh1PjkTSIf81i4jFeoQokSOAEnUoVWj3KgKbBOigI0=;
        b=e6QARlO0Khk3vRVSCCotOHtR65lEYwk+LSFoqaBDFsE98y+Kn3N4F1o0aWX87C+NeG
         mtsGMLMXg1RaYabFLsfOzfdX/NBpCIFx0CS7IRfkXSuem4LS/pkO7LIO8YkeOHGcOpfj
         QE56x5ok5iOrtROHc++xkhd9lQolFUGURDTeyA1G3WVaQRBqruuFJtGxlYc6aRpBAcdf
         EGQZV6IyYz+sRPMVLYI6bSfIRmbZCIzoUI8i55CrBZOnuNuHsYqplOk6eQGsBacSgwtr
         xohI7Ppb/t3bU25U5qzrCoNT/2EJVKg3MlaH24I8m/gF2uZ4Vtu45hx+bxrdmgEWsBI5
         pVfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynJQy5vD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c12sor6867409pjo.33.2020.03.12.12.42.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynJQy5vD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KVh1PjkTSIf81i4jFeoQokSOAEnUoVWj3KgKbBOigI0=;
        b=ynJQy5vDLRaZntNHzQOfrRyhzJ5y6MEh/m47daaScFtiG+Cx8Qd+xhsrdwBt6LWY/4
         liUKM+3buVV8Pfa7dWDihHItMZhrmAlfKhl9j/rmTV0gYUWYkb431LQPmsAMB1L4PT4C
         MIAcrqTGhFwWRP6u9wAdw2MJVbFs71yc/lhpKsBKgaGVdqjkJRe9U6oZNsHVnt9bJyoO
         OMnjcHRsuYcl8SWpnQ4OHUaLIcxfSR3Qsh1C6SY+y0TMwuqN2LgKTKH5+b+3zITrvoLJ
         eiuDBwGZ+ktFoGA4cgLlOGaqf5r2KTRZCFiN2DuHp5Ado7XMojKa2d6qZhgqwXUoEQJi
         7rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KVh1PjkTSIf81i4jFeoQokSOAEnUoVWj3KgKbBOigI0=;
        b=iCa8k0s+ISNTi6SWq/lhB7bMvgF2zaHm5Sf8/FL4BeGJCeB6dPAuEPNZ70ZiAn4RSw
         RN2eLrymUQH7TKZN/avf0p+UqcKAn3p4Adss4svx7RsINOc6Qjom24XTOToCjwZaW0d5
         YcvPJdpEImkBwhRL7RZhkWgDd2YcNwr1GUoVRG1T48IYEtCAennozFNYSmQ7VJSj2cfW
         YHyFkIfgFApyww5p4gbVmeZvBqhaS4dA7gLZ6l0MuPdUkDD58mWJyC2SI+OqBtHynJEk
         RVkbegSoH9quBY13mxo2al/r/RjDWYgHpLUFjYZVyLoWIg4K2CMW4DheJVNSMsnszljG
         ViBg==
X-Gm-Message-State: ANhLgQ3XVFmOiqoRmaJNKnQBuZWlv+bQ3PGyGPM0MD+48PtjBTUFg71A
	iA98dT5bekQoNg+QPd4N/kQ/RNrd
X-Google-Smtp-Source: ADFU+vvqQW/uUnDRVKu4GBHb6aqY9uNq3D9AsmmHp/s4eH6CTIhYSt1hkYlaSAk8Vuz9oXzRhRqk1w==
X-Received: by 2002:a17:902:7298:: with SMTP id d24mr9598358pll.134.1584042154568;
        Thu, 12 Mar 2020 12:42:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 10/42] target/arm: Implement the ADDG, SUBG instructions
Date: Thu, 12 Mar 2020 12:41:47 -0700
Message-Id: <20200312194219.24406-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L4kkRG0ce5Ah

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
index e4450302a6..3190fc40fc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1257,6 +1257,15 @@ void arm_log_exception(int idx);
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
index f1e2fe0060..02f31d5948 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3807,17 +3807,20 @@ static void disas_pc_rel_adr(DisasContext *s, uint32_t insn)
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
@@ -3829,11 +3832,40 @@ static void disas_add_sub_imm(DisasContext *s, uint32_t insn)
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
2.20.1
