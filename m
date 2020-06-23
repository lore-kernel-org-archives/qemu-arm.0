Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4344664lfm;
        Tue, 23 Jun 2020 12:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOaXYS3c9IS8xP+hG2b1bTwhIw5Hk3A/oM+tlQvHoyd+HOaG41oBSh2yY4rc6QgYMPKdBN
X-Received: by 2002:a25:ca8d:: with SMTP id a135mr34022858ybg.382.1592941412190;
        Tue, 23 Jun 2020 12:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941412; cv=none;
        d=google.com; s=arc-20160816;
        b=XZrSH2tkA4CYFA3NflP2bT1YDgQ5C6IRNzeuyIk2iU/N3egilg38QNMjUY+ffq/uYt
         MThX1KPorT4dSQ8H3flIrCqTw/j2o/oJfmBTe1U6ujoeFQteywCVAW0oxtF2UwG3l6bg
         Qgw6lft/5T3VJMe8YDi4KswQSdZ/8AaRqRsgN22i8RNBXDez/q9fUR3Ky1bRyCz6pdZs
         dH1vfBRRZRHiTTNVJhIyQXV5u+L/arcuqAnf3dgv11X9VXg0aFNWyuPAjch0AKKv/hsE
         Ocgo+0uBrGlN7Kp4sq2H+V5ZZEKkr0ERY5lVTMrCC0ih4tR/YEdY1ASpMyGM5OH7iEjt
         XEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/f1Kq86xOn0I6KfO6hqhA/hMinh4ZLMOHCrw3GZ9sHA=;
        b=dWeoppLWd8GD/4mdHob2OEJcE2hunfoedrF5J1UbS0OhXgmR4QBS/6sYcUsYHeGFmw
         BOEN2Nw7dwBczDO2CG8X4/fp5ulTCuKp4Krdj6QtgZi4E6AAcv3uS+s3YqXuDp/xMT7G
         pf4e9iLxXn7M+q5rfIsoNg+OD3z4qwpxMuOp1DCKP1JoxgNZr5qEK4OZwJkQOyTXf+Z5
         AYzmq6IEn0tXUmP59UhTkiCOrBihMXSO54sWlEKG3rzeMHgQDGuQL4y8JHSTPPwzqCR5
         96gJhTxqvEzxoF/0uVl9OkfS9epNFIsMrQCGoZvtYvhm60BuiWRwslOSTuc6d0/KppEh
         ElhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZjbbO7MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si19806376ybk.399.2020.06.23.12.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZjbbO7MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnopP-00070l-Gi
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojM-0003Uu-Dk
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:16 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojK-0005Zm-6H
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id j12so8337474pfn.10
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/f1Kq86xOn0I6KfO6hqhA/hMinh4ZLMOHCrw3GZ9sHA=;
 b=ZjbbO7MMJ66uzVE8HkvWz5IPBXwb2AMXTkbXknBmLGGTxSoHcgmqwvHxgV/FplrdY3
 cB2O8akMIpzCy2Q7vthrud1CbKq0Zd7e1GM2P4G0Ks9rhpZPlsq0dao6Gfm9CziTl7UH
 LeJOmPANtRS/2TiKK4tHEDZiXGDrix35XfaMswngV0pi4Oyqhhj9y0OOll1qUVcJ7Y7W
 yzhWclj0QiRcKjLwOflNyFSRugewt3l+w+mRHjuWbOHY+8qYV4FK3RZmheY0X6rP+Ae+
 FUJUqryxcUIDGC6szRTz8dp6LZ1s+YbrcxI8lyBQAUYUUCYxtliaoNZRIf3YwiBIf7mU
 o1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/f1Kq86xOn0I6KfO6hqhA/hMinh4ZLMOHCrw3GZ9sHA=;
 b=gpG9yupWQ0zlPzMWXAaT6zR/78UldrwhGrwuc3jdqRPw9+iMaN0FVYgAxdsKw15DGE
 cV0mQPvs1T1pyodxWdehJT2F1b5IRVsyUiPsNT2p0coA+D2TIWD1iEjYXDr1Dst4cpbm
 lOTthvSlx6Is5WV3Xes7cQiiZ5ju32hDQlIoYzeZtFyZTmaJoBIISmQF7UD71ezmBM8O
 WiHhIC2DuB8qmUA3skNQc8rMUBjyK6dSW6HnxxS5j+l6MguKujRJreR5Ibn+m+Daq255
 pEKoRy8styxUEEvH86X2eq61n7N2SovEqP/7Se55VXizWEeMDoFJyaj33Tc6GcbLlTSI
 Z9FQ==
X-Gm-Message-State: AOAM5336HTTgpVBUiZIFb0x/YSIVbvjLH75BWGrsupz7vPXdYSllGSnO
 BfrDSdg7Wb/4bObS4vVxsg+fHg==
X-Received: by 2002:a63:195a:: with SMTP id 26mr16746019pgz.402.1592941032894; 
 Tue, 23 Jun 2020 12:37:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/45] target/arm: Implement the IRG instruction
Date: Tue, 23 Jun 2020 12:36:22 -0700
Message-Id: <20200623193658.623279-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
X-TUID: rurNBKbk+hu3

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
index 717cb96a40..14d51c0dd1 100644
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

