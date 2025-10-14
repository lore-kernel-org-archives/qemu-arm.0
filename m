Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11802CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:11:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJL-0002Am-10; Tue, 14 Oct 2025 16:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJJ-00029T-R1
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIv-0005L7-Ud
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2698e4795ebso56483455ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472446; x=1761077246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMmgovzsInT0Iqp/dEgmNQN2NAoXX8SnCQShyk1ZzAw=;
 b=zbsEB96vC9U/+6iV7YL25PzXQQPsOx8cqY3eSKZhYoH7tx0zxWz924J54j6pjWXYBL
 ejTCj2+g0uHfIMymGtcYV/2sj/Puyd/tzUmF6ERAinQjRR8vAQZS8aR7PlKQ0o+SvkQK
 634kjy1ExmZNP5i1JeoDpi6qUh03tGV//CBT3SwHjmUR7Iz0svz+yXKU18m1ldmX/XgQ
 KqpUA0a7qjYTBcluuUl6raNkzy6eZ/t3nHsA8Smn9J1bBTvmirq4ykD8flKDZQRGDizr
 XGkGXi/9Uqc9H5w2kCP2KC78tqg5P8jld9wNoFZzfQkK+X4qAnOWvMGvjlLowDgklw/0
 6ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472446; x=1761077246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XMmgovzsInT0Iqp/dEgmNQN2NAoXX8SnCQShyk1ZzAw=;
 b=CGURerSnWba1wuhn8nkBZqZnxwAaCt0hAsF4xMuKj9t709fRXh5DCB0hkka6yfEeQF
 5mnnH3q6JQ/SU1IZ/jyymY/P+Ks4WUELqv2XJ92aDEoYR0R2xBDzzdAeJUxNqA4go9g0
 X3/48ysIXLTSGL0ZmrUrJ82kSD0h6r4+iledVmsJJMjmOWhuM4a6mD5EyULBCK4obgIH
 LF25i5HSzu9AR91V+7wBRmflMt4CSWRq1vfssvac0LqUw5cqh9+bPPuxxcvW8lHmrcqT
 aSfM/v3Ibu6QvQ5/DtCpedy4qQVspv3bkdZCYmtTHRiR7mDbaYEvLJPheN7qMN/1jxiK
 FVdw==
X-Gm-Message-State: AOJu0YzY88HVNMzuRe4mPFbSN23KvmYyqU2YOvWYTHWIlnY/dBp9/cMb
 V3oQq5U7sxF0LA/YHCqwsivEAS6C9wEFi1Orf5YO9RdlrNhy8fUzFEieraNAivAsvNQ=
X-Gm-Gg: ASbGncst4mBFBIv1tWBKRd9Wp2U1pCrM3/JPeiV0I7DJ6uR7cRGJO3fgHrSdb0An8Cm
 KjI8gDbbbSFRWF4HJp3CddaMF/cDf/PTH/5feFBvTgVxa0CBT0gZSvgl45Fy5F+hFXublziWOXg
 KcU7K+lGUg9eubjlF5OeD+MHAzQrlanWyZ1hmLYo+wbD7WlXvT00Eyelz6Z9W7ifs+ODpV1y/fi
 iB4cRRFMcBTMxQraCMM3EImkenh+IrEgukglLHAW40emkuO/6rJeHAywlbP9h5EtA4owoOaHO0T
 6cLOCXnnFkpwDEM7zjcBSPkDkNqROV8D0K6DK+SiVgD0V2vcg2DZi2r6cYzSREsEMZWbkdBe0Zm
 JoI9RxhKIjd7QmZyZxMUMBGnfL+cLQbuVyouaxgcTqI3LVxtecLGzAyuvqHG4qg==
X-Google-Smtp-Source: AGHT+IE/lpWC3L326mcumtHN6vyXURbRXdUkndN5addPSnmRzF+u5bmOXW2cpf/pOsCYZmsfHy/KHw==
X-Received: by 2002:a17:903:2c06:b0:24b:4a9a:703a with SMTP id
 d9443c01a7336-29027373d80mr360058645ad.17.1760472446215; 
 Tue, 14 Oct 2025 13:07:26 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 10/37] target/arm: Handle MO_128 in arm_gdb_get_sysreg
Date: Tue, 14 Oct 2025 13:06:51 -0700
Message-ID: <20251014200718.422022-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Handle gdb reads of 128-bit system registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8583057b58..f25bd50b71 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -247,15 +247,20 @@ static int arm_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
     key = cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
+        if (ri->vhe_redir_to_el2 &&
+            (arm_hcr_el2_eff(env) & HCR_E2H) &&
+            arm_current_el(env) == 2) {
+            ri = get_arm_cp_reginfo(cpu->cp_regs, ri->vhe_redir_to_el2);
+        } else if (ri->vhe_redir_to_el01) {
+            ri = get_arm_cp_reginfo(cpu->cp_regs, ri->vhe_redir_to_el01);
+        }
         switch (cpreg_field_type(ri)) {
-        case MO_64:
-            if (ri->vhe_redir_to_el2 &&
-                (arm_hcr_el2_eff(env) & HCR_E2H) &&
-                arm_current_el(env) == 2) {
-                ri = get_arm_cp_reginfo(cpu->cp_regs, ri->vhe_redir_to_el2);
-            } else if (ri->vhe_redir_to_el01) {
-                ri = get_arm_cp_reginfo(cpu->cp_regs, ri->vhe_redir_to_el01);
+        case MO_128:
+            {
+                Int128 v = read_raw_cp_reg128(env, ri);
+                return gdb_get_reg128(buf, int128_gethi(v), int128_getlo(v));
             }
+        case MO_64:
             return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
         case MO_32:
             return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
@@ -279,6 +284,7 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
     RegisterSysregFeatureParam *param = p;
     ARMCPU *cpu = ARM_CPU(param->cs);
     CPUARMState *env = &cpu->env;
+    int bitsize, n;
 
     if (ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB)) {
         return;
@@ -297,10 +303,26 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
         }
     }
 
-    gdb_feature_builder_append_reg(&param->builder, ri->name,
-                                   8 << cpreg_field_type(ri),
-                                   param->n, "int", "cp_regs");
-    cpu->dyn_sysreg_feature.data.cpregs.keys[param->n++] = ri_key;
+    n = param->n++;
+    bitsize = 8 << cpreg_field_type(ri);
+    /*
+     * GDB generates an error for type="int" and bitsize=128.
+     * We need to use type="uint128" instead.
+     */
+    switch (bitsize) {
+    case 128:
+        gdb_feature_builder_append_reg(&param->builder, ri->name,
+                                       bitsize, n, "uint128", "cp_regs");
+        break;
+    case 64:
+    case 32:
+        gdb_feature_builder_append_reg(&param->builder, ri->name,
+                                       bitsize, n, "int", "cp_regs");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    cpu->dyn_sysreg_feature.data.cpregs.keys[n] = ri_key;
 }
 
 static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
-- 
2.43.0


