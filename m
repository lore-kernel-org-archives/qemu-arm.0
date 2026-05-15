Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C824CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:16:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtHr-0001FS-Bd; Fri, 15 May 2026 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHk-00013q-OS
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:13:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHe-0004Pw-C1
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:13:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso5415789f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854374; x=1779459174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTJ12u23QhbWwNIBCNdFgEzxGR2+OzqbFo7UXsWqIjM=;
 b=QMFs0qRqop+MithR3eQKIIJafkehs/KpUZxBI10SUxvyuB4v2JOUPEIyhAgjgx3WIE
 hoyLb5DbiHaFM0pEOOEHjsuEAa3neHVnMtqqsEoBAmSlNOxKuQVR06wK5qFp9J77wntW
 VDHplsm7AIZV6ctRMLLYIbRCqpLEoZRMg9qONPCQMqtdD/GxkLYeHcqOITLX1F77UxbP
 KoDtG2sR2TP+orvfqt9k1R4ANJm2xwKMUeyXfgBX6nKBphBb4MsXkdXSIyTUymjhcqwn
 eiby7x0JsDDIwrQ5ZcHWfGGQRard808JXXbtJhtJ4ZJEOL0r+DQVL3WlI6JDHw1nZX3B
 mZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854374; x=1779459174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xTJ12u23QhbWwNIBCNdFgEzxGR2+OzqbFo7UXsWqIjM=;
 b=g1ThHs0fPj45NRA37NFGPjnM7UMvG9jMCv6kpH74xspAU3CkoQ3W/VjUwI6oF+Qz/Q
 sMD84s9+9a4SGcJliLvNik7gChvJ8IwFShNW5NXCvEOn/t5GzH0NQMgfMPRx4usE+zWE
 1zhGCx6ZHQ/RjxEjc1DUZZ3fpRITf8RgukYvKot2MWcEu/dV+ZwG1qAclVjV7kMIVoBy
 tZCwxQkfiv187Qv1imqDmF9UghdLEpiEVnFqjFKsfN6O44SCq90QO4isaE7STugqAnBH
 zo+gR3f5S7vaLWIhAtf2DiKLcZQl+2kKI0v4lRiatOfTPfdZgblWJ751izarvr35wgyL
 vZBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9q4rJ8jyzXZ2PxVqAghQGrlBc7ugnLCIBBTYQPtbpPEUV9hucjevcaPx3DzmnJKfrS9MVlppbDBA==@nongnu.org
X-Gm-Message-State: AOJu0Yxy6trVa0GhW9PWoxJ/QPK7FErPKk4aCAjewhcfv/qx3cgID2NU
 l5eSKRn197IaPQ7qY8SIXDF6Jaaz8WlhXIoIWa7P0Mq6cgiTUFHPQzRsbn5dNvTOItRtsbWS/pG
 pH6P+q10=
X-Gm-Gg: Acq92OF+OhVNjZ6qnaktTGpzQcdIzpy0Ft5XKkb3eHiMp7GT4qg/ErjqMsqa6P5hyUy
 GCW/iRFUNI3SpKDnVkR5AT/1WK96v1p+N4HFYQIGyKRXfB7MLl5zbktYZ2YAWNMSR5MHhFDI2Q9
 hZAGHJG/9WMrLLExrQN6goZ9R/xf/+MmAtQ9x/tPvKGmbk9skkRLEe9fUzloYVSZBpHvA9G05Qi
 UAQl0vbkIyq7FTY8NEvx18JVjEztNfw2HtGmr3HUxqDmEzSBFy9A/eOAWOrks9vhSe5gXY1fslo
 u+/UdECi8STMICuBdzZVNrODlVcUddA7+du9APv3W/p7SlQ3uoL2qMzPjnyAATfqzx3dvRpvXRK
 4zut3HWmA9S1BIAQziabkJjDXuHjTQK4oIji0RYzJnCP8Bh6ylf1X+XlwKvZIzh2WjZDoAS2vtL
 bu3rQM7lRlkKoRHm0GCP/rmfEVJzmKWMh/Do0fPQ7qovUSmsl8Qn2MqPSs9TLwQvRTCJZm7dIU
X-Received: by 2002:a05:6000:2f83:b0:45a:e3dd:5869 with SMTP id
 ffacd0b85a97d-45e5c595745mr5918727f8f.30.1778854374234; 
 Fri, 15 May 2026 07:12:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767cb9sm14697629f8f.2.2026.05.15.07.12.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 19/20] target/arm: Build cpu32-system.o as common object
Date: Fri, 15 May 2026 16:10:30 +0200
Message-ID: <20260515141032.3271-20-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

cpu32.c only contains CPU types used in 32-bit system emulation:
rename it as cpu32-system.c; always compile the file but only
register the QOM types for the 32-bit binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 19 ++++++-------------
 target/arm/tcg/meson.build                 |  5 +----
 2 files changed, 7 insertions(+), 17 deletions(-)
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (98%)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32-system.c
similarity index 98%
rename from target/arm/tcg/cpu32.c
rename to target/arm/tcg/cpu32-system.c
index 8220d785f5b..51ed1f8f269 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32-system.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG-only CPUs.
+ * QEMU ARM TCG-only CPUs (not needed for the AArch64 linux-user build)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -10,18 +10,13 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/target-info.h"
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
 #include "internals.h"
-#if !defined(CONFIG_USER_ONLY)
 #include "hw/core/boards.h"
-#endif
 #include "cpregs.h"
 
-
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -738,13 +733,11 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 
 static void arm_tcg_cpu_register_types(void)
 {
-    size_t i;
-
-    for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
-        arm_cpu_register(&arm_tcg_cpus[i]);
+    if (target_arm()) {
+        for (size_t i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
+            arm_cpu_register(&arm_tcg_cpus[i]);
+        }
     }
 }
 
 type_init(arm_tcg_cpu_register_types)
-
-#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index f821331fbee..a6aac6deef0 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -29,10 +29,6 @@ translate32_d = [
 
 arm_stubs_ss.add(files('stubs32.c'))
 
-arm_ss.add(files(
-  'cpu32.c',
-))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64 + files(
   'gengvec64.c',
   'translate-a64.c',
@@ -83,6 +79,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 
 arm_common_system_ss.add(files(
   'cpregs-at.c',
+  'cpu32-system.c',
   'gicv5-cpuif.c',
   'psci.c',
   'tlb_helper.c',
-- 
2.53.0


