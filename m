Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087292lfc;
        Thu, 12 Mar 2020 12:42:34 -0700 (PDT)
X-Received: by 2002:a63:4e22:: with SMTP id c34mr9537534pgb.263.1584042153760;
        Thu, 12 Mar 2020 12:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042153; cv=none;
        d=google.com; s=arc-20160816;
        b=EUPE4BoLmuO0CxKWxMR6w6RTor0Xvc4hgpV7iYLkjIHtQAPD79PQ+GvsUDLaJbaKQT
         1BtMCAPHMtLBL5avvjgNMgaFneX+QnJ+2BdIiOD/i8+8rnWWQyyNp8H5DkVwfoBSnf0s
         nXiGn7mm0yuR+Yi3PVei0W6qWX7TGB0iOlc0hVRCsbmV7JvATd9DM4mf/kWyPKC7aQoy
         XVjbbSteGMxYYFLG5nYHRA0ZVko7blVf3/sHlXyyPGUpXRjCFz1wZLyrcpVWylFQFFD3
         zR2mZTXqBmKgkUOo6F/TxLlUSI9fBv7KzwTklApQuwDYy3AURK2i40s/h0XjD+jgXOzX
         u0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JoyDuvitqL3gplX8QkVPoVTvT8uYIpXUkFPIRitQ3hc=;
        b=XLS4P1sCXY/NVO7whXoDZsJMe2kQ71EwAIEU6jbxTzqNbNJijgZTJmh53v0k567dYZ
         UVqx5U+fCpoTaPWhvRK4I2nPGuXwo47A2jy5wXfAcUDfZAwIzAU/sYU88KKUsYQNbueO
         TxjtUa5q2IWsBH9btUpe4gL1SECsf76dKoootUKFQ+oM4B3Dq3OkwROGMw7EwS7NJveE
         d4apQJLgz3tmBO/h22j4IYKzUbGyh3Zavudrib3s3FSrXHJLhnrCZGGLXx7WlbXyRqUy
         0IsASaMabH6z0hTTQqYZ3jWoC5n28jJNUeR0NRilNF9q20GdCSIuzzsM3H6uc5lg15Sf
         zFyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kNdabXgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w1sor5479548pfb.100.2020.03.12.12.42.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kNdabXgE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JoyDuvitqL3gplX8QkVPoVTvT8uYIpXUkFPIRitQ3hc=;
        b=kNdabXgE3qiHP8TZpaYHR/fPNPnri+tPPxzECMwHJPQhQpDKA0YZkseLSTqtBeTwRR
         EjN7f8a38PJC3rJDyepe10jEy96b/EsHs3SljHMwAcK6OTPAyCpWfvI9C65aXTsRyLb9
         u0iX+IhNL8KDglG87KWG39vrJDjCG8jUalq5xVLZR/WOd0LOoUTjEAosZ4S9teGuJV27
         MG+3nT57RvAHI+Fj8fPpSN7mV0iXcYFSSa3spw1sW9Qjpl97erASfZL9Y6T99Pu7AYiU
         pFdcjCJIScWWpRsBl57NmQ0aQSY0txvZYPlUzw7WNzd8ToupKD2duBM92gsZOrwEA65l
         /poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoyDuvitqL3gplX8QkVPoVTvT8uYIpXUkFPIRitQ3hc=;
        b=b6lhrX5hdIVz6GcQLKfiXNBugtAPmo02+9Ej9b1G+dyp7bD3n2KDLB318Ce1LMEaPX
         rMlU+KRrGlM2boqONFAsv3t46gL5qjswHq4HHgBvdhfIccrV378xhQEfqVMZGrM0yEqY
         xqDVd94j6qQJK/d+XYoVIvIdREvqxQ3L+IZzNNB1mAOyk1iSLhVyydMC28kQ8qavC+5g
         xpTaGvOQqdtZkU+iAm6TpIo/dkCyq22RB6yatcLqysDtNmWKqd41LIdhHVBSIvewKOXh
         JgFfigKd4LYtJAFapk5tuvLlIno3uzOajtYJB1xmErKROP89eQ6ArbjPm3BgjSrP+hiD
         APVw==
X-Gm-Message-State: ANhLgQ2GiUi6TMv/wxhiFJ2NHyHvWMgeVJUWz445Hm6mokc4ezbG3BLo
	Pb8jORUdrH36eI861Ty0/8sYxJ28
X-Google-Smtp-Source: ADFU+vtpOfY5UAeNzelvJHqgomyDyij3YJm/GVRYDYM+nZHmC6IegQI5PG3fMjLa19GWrm8h30aLgA==
X-Received: by 2002:a62:ea08:: with SMTP id t8mr9578256pfh.163.1584042153218;
        Thu, 12 Mar 2020 12:42:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 09/42] target/arm: Implement the IRG instruction
Date: Thu, 12 Mar 2020 12:41:46 -0700
Message-Id: <20200312194219.24406-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DTeLOlk+W3sF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update to 00eac5.
    Merge choose_random_nonexcluded_tag into helper_irg since
    that pseudo function no longer exists separately.
v6: Remove obsolete logical/physical tag distinction;
    implement inline for !ATA.
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/internals.h     |  5 +++
 target/arm/mte_helper.c    | 72 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 18 ++++++++++
 target/arm/Makefile.objs   |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 target/arm/mte_helper.c

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 3df7c185aa..587ccbe42f 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -103,3 +103,5 @@ DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 45f445cf3e..e4450302a6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1257,4 +1257,9 @@ void arm_log_exception(int idx);
  */
 #define GMID_EL1_BS  6
 
+static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
+{
+    return deposit64(ptr, 56, 4, rtag);
+}
+
 #endif
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
new file mode 100644
index 0000000000..539a04de84
--- /dev/null
+++ b/target/arm/mte_helper.c
@@ -0,0 +1,72 @@
+/*
+ * ARM v8.5-MemTag Operations
+ *
+ * Copyright (c) 2020 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+
+
+static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
+{
+    if (exclude == 0xffff) {
+        return 0;
+    }
+    if (offset == 0) {
+        while (exclude & (1 << tag)) {
+            tag = (tag + 1) & 15;
+        }
+    } else {
+        do {
+            do {
+                tag = (tag + 1) & 15;
+            } while (exclude & (1 << tag));
+        } while (--offset > 0);
+    }
+    return tag;
+}
+
+uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
+{
+    int rtag;
+
+    /*
+     * Our IMPDEF choice for GCR_EL1.RRND==1 is to behave as if
+     * GCR_EL1.RRND==0, always producing deterministic results.
+     */
+    uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
+    int start = extract32(env->cp15.rgsr_el1, 0, 4);
+    int seed = extract32(env->cp15.rgsr_el1, 8, 16);
+    int offset, i;
+
+    /* RandomTag */
+    for (i = offset = 0; i < 4; ++i) {
+        /* NextRandomTagBit */
+        int top = (extract32(seed, 5, 1) ^ extract32(seed, 3, 1) ^
+                   extract32(seed, 2, 1) ^ extract32(seed, 0, 1));
+        seed = (top << 15) | (seed >> 1);
+        offset |= top << i;
+    }
+    rtag = choose_nonexcluded_tag(start, offset, exclude);
+    env->cp15.rgsr_el1 = rtag | (seed << 8);
+
+    return address_with_allocation_tag(rn, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5eda6ff975..f1e2fe0060 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -243,6 +243,12 @@ static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
     return clean;
 }
 
+/* Insert a zero tag into src, with the result at dst. */
+static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
+{
+    tcg_gen_andi_i64(dst, src, ~MAKE_64BIT_MASK(56, 4));
+}
+
 typedef struct DisasCompare64 {
     TCGCond cond;
     TCGv_i64 value;
@@ -5329,6 +5335,18 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     case 3: /* SDIV */
         handle_div(s, true, sf, rm, rn, rd);
         break;
+    case 4: /* IRG */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        if (s->ata) {
+            gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
+                           cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        } else {
+            gen_address_with_allocation_tag0(cpu_reg_sp(s, rd),
+                                             cpu_reg_sp(s, rn));
+        }
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f..8fd7d086c8 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -67,3 +67,4 @@ obj-$(CONFIG_SOFTMMU) += psci.o
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += mte_helper.o
-- 
2.20.1
