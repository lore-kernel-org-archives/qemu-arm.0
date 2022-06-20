Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp602265lft;
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMeYouLyOSslu76vMWMuC6Ga1rPJDGBm66VEfJrPc83auoX0L4neZPNKFRp2bjce9Nvu96
X-Received: by 2002:a37:a456:0:b0:6a6:80e5:4395 with SMTP id n83-20020a37a456000000b006a680e54395mr16746340qke.589.1655748190494;
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748190; cv=none;
        d=google.com; s=arc-20160816;
        b=pI0oVuUUqDRu+Xadu5xrsEd3GQkKgo3KGTFaLc8bZO8Z+FtFVNfbH54g1/GYboeJbh
         tu54t6fI6k527vL4Xw/ObBZqDBLiZ05NPAEGFVDkuiUbLOy9yFiz8X2257lbZ5NLg//V
         5NBPpVCSjWWPOUXEIAE72l1r5HUQV8IVuw0yLbx4O9W2X7RHhLUeVJwfGFgBM01A+2gj
         qKY2eOcyU0AlhmrVpjCgIHimTpvczQfZXH0QJ4qLxT/01VvKy7y2GQs5qmT4VYM/dfeo
         zuPAHWjj80+4dTO9DopiV4FzsUqwpggdnfnhxpybUVJ8DNujyn1vlwuGu8I6eknuKs5y
         CQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=msgMMLT5cMN7hk5m6rIXGPdt1bB9hhzt+ViCqZQouiQ=;
        b=PXF8ASpKEV3k/S28fCOQeHGLcItP7AcugyN1+4Jb74CnlGM0qcCCqXUfbn3xNILSNd
         M+bxNdbuuoFne+gqofeXqGeHEmnAaQe9+M46VElwCfjYtrRpo28jwfrMFv+Eq3sGqqZM
         6SyxFc04OMlMvIpopoxUEL5t3kn/CQCS6F8FUsKWqmVwM7/NfyDFEqEbnQqlgoz/dTkS
         l3vzR49/yzVgIfDmL03TfcZ7Qb5cC8GXVpyaCY5+kPq9wwIIOG+rGIUAmp4fsEe69z8N
         VNrZ2/h+S4Muk20/IkSF1WIREp5VLRDQ4xGGko0HjUvp4DRl5tm81qVQmjjDHtGhxerT
         rXLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLvsmlB7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a054a00b00304ec6d0ae3si8231985qtx.254.2022.06.20.11.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLvsmlB7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ljx-0008H6-TH
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZy-0005mj-3H
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZu-0001OY-RK
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id o18so3325702plg.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msgMMLT5cMN7hk5m6rIXGPdt1bB9hhzt+ViCqZQouiQ=;
 b=NLvsmlB7Qra9M9wYN5EWjv3vjiymETYGy3hPLFzoaIw+jfp81llJlz3/U7ERnn6su3
 8CKHZ7yw3ECv4FIBkEREHJHbDEm1JIkUdkuRiu6csWdbIiC9bxabH1M6PkIJDSrJ2t6R
 CHMpBbzoeNqpvwgQ8ezLbfWXDktBt3Sph5RpGLoQkrshYrE+dEXkXp52zzZyP9vA8O8e
 tiC53A8vwb4TeYLCCpilTo0vbiOuGibcJO45JfYQc2en+lW91Hjf69wvj5N38dyyEjSs
 iZTWXSKoN4IYgKnYhpqeGao6CpBB/NfoTR6by33v0u9uC7SO1UtLR4nM+ZVAywxGibPK
 YzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msgMMLT5cMN7hk5m6rIXGPdt1bB9hhzt+ViCqZQouiQ=;
 b=FxbtxrOUXN5sO8Xqo3XowHp9kOpBy8VJVqJ521DXvNQy79EipCMAZNpI59x8Qgq58P
 5xgop7AksDEpXuHePcAHoKYlSW7iFoJdbs8oPdSGqTF6VMEsfxhFkKqpXystQAZKAqyC
 1hjrIfQTIIxq1UAazTmERV0yf+pr4VDjH6AoDKU9liQH6ghUOBNutqauIeq3FYp5ZlRm
 Lry7Df+A/xue+aH7MZPgiXzLexpQn+t+v23fcki4AwUzDhi+g4/r/coayu9RjvKWIu7Q
 NMEH6kKKNOViQa3nkVDUDPg0rJTPCVXRLYawwKSdJ0RnHC3aiIPtiUgeVMUuzqtEp3Fc
 G9NQ==
X-Gm-Message-State: AJIora8+rb2n0sT797w3EdQzIZb750QGibTewtWCsVBj38CUjc2FV8Jc
 8+gDatjYuQ18y6WIIc1Wt4kfQM6mwSJRKQ==
X-Received: by 2002:a17:902:e0c3:b0:16a:1c8a:5ae8 with SMTP id
 e3-20020a170902e0c300b0016a1c8a5ae8mr9001878pla.97.1655747565507; 
 Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/51] target/arm: Implement SMSTART, SMSTOP
Date: Mon, 20 Jun 2022 10:51:54 -0700
Message-Id: <20220620175235.60881-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: qAehPIaQvyfo

These two instructions are aliases of MSR (immediate).
Use the two helpers to properly implement svcr_write.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper-sme.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/helper.c        |  6 ++--
 target/arm/sme_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 24 +++++++++++++++
 target/arm/meson.build     |  1 +
 7 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c3c7ec697d..2e049291da 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1106,6 +1106,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 0000000000..3bd48c235f
--- /dev/null
+++ b/target/arm/helper-sme.h
@@ -0,0 +1,21 @@
+/*
+ *  AArch64 SME specific helper definitions
+ *
+ *  Copyright (c) 2022 Linaro, Ltd
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
+DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 07d45faf49..3a8ce42ab0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1022,6 +1022,7 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
+#include "helper-sme.h"
 #endif
 
 #include "helper-mve.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e06c054c3d..88d96f7991 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6366,9 +6366,9 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
-    /* TODO: Side effects. */
-    env->svcr = value;
+    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
+    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
new file mode 100644
index 0000000000..b215725594
--- /dev/null
+++ b/target/arm/sme_helper.c
@@ -0,0 +1,61 @@
+/*
+ * ARM SME Operations
+ *
+ * Copyright (c) 2022 Linaro, Ltd.
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
+#include "exec/helper-proto.h"
+
+/* ResetSVEState */
+void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5cf4a283ba..c050ebe005 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1762,6 +1762,30 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         }
         break;
 
+    case 0x1b: /* SVCR* */
+        if (!dc_isar_feature(aa64_sme, s) || crm < 2 || crm > 7) {
+            goto do_unallocated;
+        }
+        if (sme_access_check(s)) {
+            bool i = crm & 1;
+            bool changed = false;
+
+            if ((crm & 2) && i != s->pstate_sm) {
+                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if ((crm & 4) && i != s->pstate_za) {
+                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if (changed) {
+                gen_rebuild_hflags(s);
+            } else {
+                s->base.is_jmp = DISAS_NEXT;
+            }
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index ac571fc45d..43dc600547 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -47,6 +47,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
+  'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
 ))
-- 
2.34.1

