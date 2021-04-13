Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5020804lfr;
        Tue, 13 Apr 2021 09:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3CupIclvuHBIhk5nQL/m0kuPLBGl4r37R+yBxjvYXze4GPJmbs4l4k4TRtejltLV4nljX
X-Received: by 2002:a92:d305:: with SMTP id x5mr27048020ila.205.1618330846880;
        Tue, 13 Apr 2021 09:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330846; cv=none;
        d=google.com; s=arc-20160816;
        b=rJnYA9WBZSuYgir3PeZSMNn6ftx3T91nDeumm3Tp+M3m5cm9ZDBurp5uPkhdtjKQBe
         CzlYQMAbi0JqcEpVx5oO189AOydnL0m8BE/HjxImZrzo+6tLGOMGb25isppLY2RpXK9k
         dm1gdKtXUHBXQiIQdjlmxQlnz4T/ejbdTvd1xrL586NUEOoWqeZzXypkbE1OHcUUZIbG
         meCkk9bNC5m2+ORbezLC4gJCMc4k6Cf+aIXHE2ZFprHWiaJpnR2SwPZpAlYEc/rVe0rC
         FGR4DIbOpR6mZ1OGtQXhG/DAf+xiqAH9KaF8cXVBzL8IZJ8UWyKgpyVG0XxanX9cb5wk
         rt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Qj1DFF1XrwKc7kXsX7Yc2aXau8+NzsriI6XtiRW5Ow=;
        b=YDS2/VB1i9+8jhwxUANTMnmxsAWPX7nghW3LDCgHhXyaGbv18PtPShkzNWG977B69z
         aeDJdF+Y8X/7R5/DjFjvjgGuVvzxhTJdnhcQ06n3dID+PqEjJNdotGOmZbu6k14+Hh04
         NkGQslRXKLivVjFNTGnXZ4xBCWQRU6+DldePJWTlANVS4xHbVJKvNVA6WljX9WQHAuIe
         4fIWgTXEEQ5S6RFIsNQOhQg64dKFo+dlCFT2K3rwAWKrHqdXu0eEH7yZZXZbKey8yOcJ
         T97le2agu6e4/gxFbvsR7mFvKZhBeo4TjFVKQZMNkOwHpcBUWaF+LGKzVXLVXY+JO+Ar
         lF1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiqeV27S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si12100941ioo.77.2021.04.13.09.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tiqeV27S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLmQ-0005Gp-6R
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaN-0006At-3D
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaK-0006rK-DE
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so4272903wrx.3
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Qj1DFF1XrwKc7kXsX7Yc2aXau8+NzsriI6XtiRW5Ow=;
 b=tiqeV27S8qWB1I1jT/V7frghG8ny1iHC1/JuAMMtGFayp6ivXlxW8W4mCGYiKxot4R
 qde9clf/nYWNY4/DKWncOhdyQUNJ5gcgy4rU8KKvUjsrXSSw9M/bkoE7WXerKXXPShOJ
 RNIhO0CjsnzWQCijVoqcuGm7BP3Xq77JG+/x6weUWpiG+iE/i/ERVf++ZNECzPSKNaPf
 sHAzWjXV9UanngCy1YGinWreSKZdqBhfq/1jMIoynGQlJn2HZaP1g8dn2LgQevJt/yFI
 jh2fWIaMNN3ExzksH6JT1g2PrhNxS9uNeShW0QvV1/+UOAwHXMPZCmmWOIwaJOZXQW5B
 p82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Qj1DFF1XrwKc7kXsX7Yc2aXau8+NzsriI6XtiRW5Ow=;
 b=rnKB/ZDtORQ1dhoZhQwe7Wa16pua6vrvpkuaEZMFHRMLpFqujEc9UexJnIsPEE0cOu
 2QcG/YHRzXfHt7O/AcRKqvLsZEy4o6tS91zTbzQ1u0bqTpVItDWIn0CbLSXD8CI58ujP
 zcDTsSnfB0135B43+VjFwcIm1tla1dODgTvWf8fXXeZgX1e0m/ofLPyY4ECXgOo3quTJ
 wZgRJy9Yb21wWOPGgCJHMzpK8/tn3igk/KglLRx/oqEaajfJtkk0BNaYYqlieOKmpM5O
 jLaynEu2lL0kf7f0iCIgcOk0MWB2OwHtnGf7+V4OWf2p2BIlAQY/knWqZb60xzSXB6/Y
 jTDg==
X-Gm-Message-State: AOAM530vebeZ2W/fsUtwZmeqkRTe77zlmoph2tjw09wwhvoFAcpW+z/N
 GVc0P+g9/mMBxLXeLl7ycpaAJTrIIQQz0QkQ
X-Received: by 2002:adf:c10a:: with SMTP id r10mr39216180wre.40.1618330094859; 
 Tue, 13 Apr 2021 09:08:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/13] target/arm: Make functions used by m-nocp global
Date: Tue, 13 Apr 2021 17:07:49 +0100
Message-Id: <20210413160759.5917-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tTZWZ/IvjaH7

We want to split out the .c.inc files which are currently included
into translate.c so they are separate compilation units.  To do this
we need to make some functions which are currently file-local to
translate.c have global scope; create a translate-a32.h paralleling
the existing translate-a64.h as a place for these declarations to
live, so that code moved into the new compilation units can call
them.

The functions made global here are those required by the
m-nocp.decode functions, except that I have converted the whole
family of {read,write}_neon_element* and also both the load_cpu and
store_cpu functions for consistency, even though m-nocp only wants a
few functions from each.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h     | 57 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 39 +++++------------------
 target/arm/translate-vfp.c.inc |  2 +-
 3 files changed, 65 insertions(+), 33 deletions(-)
 create mode 100644 target/arm/translate-a32.h

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
new file mode 100644
index 00000000000..c5d937b27e8
--- /dev/null
+++ b/target/arm/translate-a32.h
@@ -0,0 +1,57 @@
+/*
+ *  AArch32 translation, common definitions.
+ *
+ * Copyright (c) 2021 Linaro, Ltd.
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
+#ifndef TARGET_ARM_TRANSLATE_A64_H
+#define TARGET_ARM_TRANSLATE_A64_H
+
+void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
+void arm_gen_condlabel(DisasContext *s);
+bool vfp_access_check(DisasContext *s);
+void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop);
+void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop);
+void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop);
+void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
+
+static inline TCGv_i32 load_cpu_offset(int offset)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_ld_i32(tmp, cpu_env, offset);
+    return tmp;
+}
+
+#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
+
+static inline void store_cpu_offset(TCGv_i32 var, int offset)
+{
+    tcg_gen_st_i32(var, cpu_env, offset);
+    tcg_temp_free_i32(var);
+}
+
+#define store_cpu_field(var, name) \
+    store_cpu_offset(var, offsetof(CPUARMState, name))
+
+/* Create a new temporary and set it to the value of a CPU register.  */
+static inline TCGv_i32 load_reg(DisasContext *s, int reg)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    load_reg_var(s, tmp, reg);
+    return tmp;
+}
+
+#endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24f50dea669..fb86427b11c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -50,6 +50,7 @@
 #define ENABLE_ARCH_8     arm_dc_feature(s, ARM_FEATURE_V8)
 
 #include "translate.h"
+#include "translate-a32.h"
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(s) 1
@@ -101,7 +102,7 @@ void arm_translate_init(void)
 }
 
 /* Generate a label used for skipping this instruction */
-static void arm_gen_condlabel(DisasContext *s)
+void arm_gen_condlabel(DisasContext *s)
 {
     if (!s->condjmp) {
         s->condlabel = gen_new_label();
@@ -187,24 +188,6 @@ static inline int get_a32_user_mem_index(DisasContext *s)
     }
 }
 
-static inline TCGv_i32 load_cpu_offset(int offset)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    tcg_gen_ld_i32(tmp, cpu_env, offset);
-    return tmp;
-}
-
-#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
-
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
-{
-    tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
-}
-
-#define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
-
 /* The architectural value of PC.  */
 static uint32_t read_pc(DisasContext *s)
 {
@@ -212,7 +195,7 @@ static uint32_t read_pc(DisasContext *s)
 }
 
 /* Set a variable to the value of a CPU register.  */
-static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
+void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
 {
     if (reg == 15) {
         tcg_gen_movi_i32(var, read_pc(s));
@@ -221,14 +204,6 @@ static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
     }
 }
 
-/* Create a new temporary and set it to the value of a CPU register.  */
-static inline TCGv_i32 load_reg(DisasContext *s, int reg)
-{
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    load_reg_var(s, tmp, reg);
-    return tmp;
-}
-
 /*
  * Create a new temp, REG + OFS, except PC is ALIGN(PC, 4).
  * This is used for load/store for which use of PC implies (literal),
@@ -1181,7 +1156,7 @@ static inline void vfp_store_reg32(TCGv_i32 var, int reg)
     tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
 }
 
-static void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
+void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1207,7 +1182,7 @@ static void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
     }
 }
 
-static void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
+void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1226,7 +1201,7 @@ static void read_neon_element64(TCGv_i64 dest, int reg, int ele, MemOp memop)
     }
 }
 
-static void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
+void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
@@ -1245,7 +1220,7 @@ static void write_neon_element32(TCGv_i32 src, int reg, int ele, MemOp memop)
     }
 }
 
-static void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
+void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
 
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c1..f88ab8d7873 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -191,7 +191,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
  * The most usual kind of VFP access check, for everything except
  * FMXR/FMRX to the always-available special registers.
  */
-static bool vfp_access_check(DisasContext *s)
+bool vfp_access_check(DisasContext *s)
 {
     return full_vfp_access_check(s, false);
 }
-- 
2.20.1

