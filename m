Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A96CCD1BF
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuXV-00021D-03; Thu, 23 Oct 2025 08:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUF-0005T7-A1
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUC-0008Pz-W7
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso8470725e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222726; x=1761827526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gN1osrlqCHe3ITjIVkkUSvPg9WZ0qLTjP22f3wzHwCA=;
 b=Acm7o5oWfvhlJCxJYU4h4fh8gSgaVVEZTUCpH2Ep+bMD+1dHpBbjwp4VVWgFUcwU7N
 Im29G7DZUpSXY/k8u5veQZMGkKd8ysFqFSkgDIvFPImfbHBWefpxUrIaNha8+ezgdk20
 w2EBGIaTphPqeoIXE8CsmeiiOdL0mIoOcAZkEP6oZqkyI1ygSXeg1sk7qTyF6/WBYHTq
 Ykka8FHhKI4o9x76uVoFBm3p05TBgNuYXRZwqAHesSpNcnSvaLjMaQTkJ1MrjWyNLeXB
 qF4PIBMn3uLNwkIvFCoM/nZ0Dp+S0QsgPWYVZi64CLBArj39gCPpbKuXSb65rtMzCnoC
 TxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222726; x=1761827526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gN1osrlqCHe3ITjIVkkUSvPg9WZ0qLTjP22f3wzHwCA=;
 b=W700RUJOStLMS/6AciN4tkULj3MUCJlCp7NrS8T2OMOyyhnHTc58Wi+hoahlANqc+R
 9xmSAkKDQWpENHA8TzT8/qKlHBPjQZqy3xT5+Q6DuyBhFYEuSqde9rBnZx1CUpHnWB3f
 yv+Y6woIt2VSKTrpjYbMiCP3/QCyYQUHhNJMQS1Ep7aBNobKnh6/LncTZ5eI7+kkGCSk
 eXr3k/R4/e/LoMEbrs/dCB2iwCmYWFqsQswKRv5RkYZxDfmy5RsK0fOOfpHt3y7C0efA
 aweuMvbDOf3ALIIXlx3WPiSq/FlcqycQi1UJGGXe7QRabdO8CI9TPHWXgQj7zMgQV8de
 GanQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm5gaNJKbOIwXln6cLvOCNqWyVwFpyfoKQuVPIHBSe+pZhJFrrwhAyoGh0lP1jLg2O7vkId5Dj9Q==@nongnu.org
X-Gm-Message-State: AOJu0YxZk+Uq/JkP4hhFOEzuZ1j2eadSHCXTSvt+gmc7h56Qg4bpneah
 Ntg8i7SWlIp8gEKby5I9l7yPdeiPgxI6qT1I3V9a5PNfV4Ed9D0jle7ItiX1YzvCqeI=
X-Gm-Gg: ASbGncsR4MnIlXAZrk40GF31JXvSDrHgFLGNT73EjYwnniQfkku8o0o9lAnxlVmkb7X
 qzFjujBg0Xc2SDmsNh+WDhKh5KbG3I5BHOd/lMCqE8HTzRND81fhhAAGFHu8JbcCmEymnD0TtbL
 4eecbeA52gApjlA5NvTmGMByJEQtyEkSS9JbgNSI4J2dIVj9mkag/YUsr9RQDG/RTWNAVw6qGWh
 jqiHCN2hJLRiC7QUYv3xUDUCqxeot9D0TJ4ldmLapXDqtRX/KcNNAXSW0lw3/kgr6dYx6TWj4Pg
 DBaK2T8dbJmBXI/tOK0X6UnanHrcd3f9nvDJtBFmWMZf+883LhwdGWJKPUn4AmLyFMVOcxY8EgN
 uHEE/kID8oOAi46FAsVadIe7tlmLYApTny5MFnzEqUADKELp28sQYdS8J3XEEr5i264F99YGDZ7
 zadWAt9PqgxBfc/WtO9B9Ka3nbTg7z0T0IVUFE+otOgYyiTOf7IA==
X-Google-Smtp-Source: AGHT+IEA+9W2M45XHIFb9R2q9gxni/aW5W+cd9QjPDqEpoMk3fHP9S1A3K2X2uR6QJLqBxry4nprIw==
X-Received: by 2002:a05:600c:3e86:b0:46e:36f8:1eb7 with SMTP id
 5b1f17b1804b1-471178a3a94mr169464805e9.10.1761222726052; 
 Thu, 23 Oct 2025 05:32:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494ac30b4sm58772695e9.2.2025.10.23.05.32.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 54/58] target/arm: Create GTimers *after* features
 finalized / accel realized
Date: Thu, 23 Oct 2025 14:31:38 +0200
Message-ID: <20251023123142.8062-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5eaf950b969..bfd3b57e8a8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1633,26 +1633,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!cpu->gt_cntfrq_hz) {
-        /*
-         * 0 means "the board didn't set a value, use the default". (We also
-         * get here for the CONFIG_USER_ONLY case.)
-         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
-         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
-         * which gives a 16ns tick period.
-         *
-         * We will use the back-compat value:
-         *  - for QEMU CPU types added before we standardized on 1GHz
-         *  - for versioned machine types with a version of 9.0 or earlier
-         */
-        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
-            cpu->backcompat_cntfrq) {
-            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
-        } else {
-            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
-        }
-    }
-
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
@@ -1699,7 +1679,40 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             return;
         }
     }
+#endif
 
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    arm_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (!cpu->gt_cntfrq_hz) {
+        /*
+         * 0 means "the board didn't set a value, use the default". (We also
+         * get here for the CONFIG_USER_ONLY case.)
+         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
+         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
+         * which gives a 16ns tick period.
+         *
+         * We will use the back-compat value:
+         *  - for QEMU CPU types added before we standardized on 1GHz
+         *  - for versioned machine types with a version of 9.0 or earlier
+         */
+        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
+            cpu->backcompat_cntfrq) {
+            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
+        } else {
+            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+        }
+    }
+#ifndef CONFIG_USER_ONLY
     {
         uint64_t scale = gt_cntfrq_period_ns(cpu);
 
@@ -1720,18 +1733,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    arm_cpu_finalize_features(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifdef CONFIG_USER_ONLY
     /*
      * User mode relies on IC IVAU instructions to catch modification of
-- 
2.51.0


