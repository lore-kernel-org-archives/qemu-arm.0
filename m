Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp50623lfm;
        Thu, 25 Jun 2020 20:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRZApPbwUjgK0ZUm2CaYD8p3vgOxJXIfl1aE2VhpkeRQO0oKzVFtf8bIuq8CJ4xfHPlraU
X-Received: by 2002:a25:d8cd:: with SMTP id p196mr1781816ybg.55.1593142654550;
        Thu, 25 Jun 2020 20:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142654; cv=none;
        d=google.com; s=arc-20160816;
        b=VrzGfFzCVz2KSzESvK3yWHf4GSxFuasoe0ULmG26FcKizSxpETTf8bGwuYrqfbh79/
         ZxlQ4KIrGD2kHFBbfVwLx7rgXWlS2OVahPqG+6m7VaXjlpO5TasavEjCkKC1gqgj/099
         7FdtJcJFHzy8e9rIRUi/9Vmg5kCdoR9y+5+zsEX2RL7C72uN+kbeXn/m0uMyblt5svn0
         fyqXZ0nvA/w2RjhYlEuiZVw5Vc3cP7ei1yAqRvyP+U9aASLPSRokLSgCNUAC3JdId3rP
         yIMKyBB1hyHaLe6Jy4aaGtbMtRCfWRWFVhqW0wpcvdviEDZWM91ZTyZd9+FbB9+hk99l
         vH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o5Hye47UQFwnUtNnwd/mT3CsXAer9xvAn/CX7Rw0vvQ=;
        b=ht/sYPuvKczc0m1muzbSM07kpclSYax/2NYyNRbGCnZUBOX9jwFPaSzltAnhO9+3Ol
         3r8KMlVm/emxlfO28o90dgKK+4Ae6lk0daZj82pUCVQ6O4MVzT/QUb+w+cXAYZx67/m3
         WLN/GyZ3rCzZqotW2oz1XeipyfD5tMNZWnqZtqeEs0jNdNMJy2AUVJS3g3RGGbO1didY
         eUzPs4nIxFGRC97kHoeszbsgfF8gLtEIozzkn2rxX0b0CTQUD79J9tPUMLRuMJStAXsR
         d9FTIX4YSxZfgtjcucSyCRgWaC3WUm240cvmfC1Xm9TH74WyugbTyi6lb9/OkBSH0/uR
         rEBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lr2S8Xr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l198si24731910ybl.6.2020.06.25.20.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lr2S8Xr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofBE-0001xN-UG
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5u-00084b-1G
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:02 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5r-0001mu-Qn
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:01 -0400
Received: by mail-pl1-x643.google.com with SMTP id 35so3769662ple.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5Hye47UQFwnUtNnwd/mT3CsXAer9xvAn/CX7Rw0vvQ=;
 b=Lr2S8Xr+UPUyXCIPZqHsNkev7Hq2cjQvM2hWT8pXmIvmXCgcuP3W3dxT0gqdtYgBLy
 bauA6VZZPNHnUrBjmMXKgT+ubVPt0LfIGuOnmx0S1TfwEBEuxkdOHMs6QJprU944ktPP
 XChdv1sQBHRl1I4HDeASWAsFp6uCUnbJdxXa52q0BOd/WvuqzJ1ELWUsvLMOTYhqOqsN
 jm8cqVmvsIef4OpVTUf+lq8oQEm0Wd/ZYCcUK9sNnWoGiwxg3022W3lWt5PbsEnaXoSX
 QojUBpIEFEjC5YVIauzj7WHNFLDSqRFgwxUQ1S9GFg5YA4/PosK4dqlBmcMx0Cu6MuqW
 njNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5Hye47UQFwnUtNnwd/mT3CsXAer9xvAn/CX7Rw0vvQ=;
 b=pveDH9rdaCYY3DY1/SgsolHcmm6X5uxO7I22UHjcV/YfbX62dBWwyoNG88hC0VGUBY
 2VpETKRlidAhLUFG2VTZqP5kkSRCqBe9ja/Xrg1eLnD5rbv3E0U8E5H6KXl3rYiF7xOc
 JD8YKpmuly/LitU2mzzD0vaN+bFLmqJSDvKpBFShZjzEGdrMLdjwA9zidw7uDZnZv4jf
 mS1zyA70cm2K+GSHWOvXHgKBHOnoPLsv3qmuFgzuCwehTSgbqPsdXmb1uuhcRUCFUGe6
 BvmeiuZGHp9uU+HGQNs518TFR5LRNQkN0b2GbcV796P2Hq6Wd4Sq3hXldWNW6MufJBhx
 fTgw==
X-Gm-Message-State: AOAM533pZj+TU9Q830i4phXSVDkPKe6JvVdEs0JuIX2XYCK6FrkyWAgb
 YkxGNPY6n+zsJixIIwnqd6g4vQ==
X-Received: by 2002:a17:902:a9c8:: with SMTP id b8mr874928plr.48.1593142318531; 
 Thu, 25 Jun 2020 20:31:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/46] target/arm: Implement the IRG instruction
Date: Thu, 25 Jun 2020 20:31:07 -0700
Message-Id: <20200626033144.790098-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPgflmBaBDyn

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 53e249687b..ae611a6ff5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1261,4 +1261,9 @@ void arm_log_exception(int idx);
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
index 55f49585be..30683061f9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -226,6 +226,12 @@ static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
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
@@ -5284,6 +5290,18 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
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
index 83febd232c..fa39fd7c83 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -86,3 +86,4 @@ obj-$(CONFIG_SOFTMMU) += psci.o
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += mte_helper.o
-- 
2.25.1

