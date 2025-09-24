Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC361CAC5A5
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 16:34:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1SQp-0001Gf-Re; Wed, 24 Sep 2025 12:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQg-0001Bl-4b
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQU-0007gm-9m
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so3648085e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758731582; x=1759336382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jISvhkEG0ICYaL8bPwKoykPcpk+ajEu3fO0N/ok09zg=;
 b=XtLjbJRG+z8GC+YlMQSTRE6emCFtfAyzNJ2bu1JdVnkFtvivv3o5p3b8XHr+RzaFNC
 1eqiqvC9fb8/aHzWYNN4YIS164wRQvdVx+00QBivXEESSDuAp39pc1RqsyjAzXGuNO2a
 rOwtpB0UeCshRG0OY8kKcTlWn4Gt1JoQZnxRlDzpBLamgKlt26QvrbyUvjCAIB7vr6jC
 s5zR56/dhqk5jVp/eeG4kys1uUfAd319aBs7cL35HCDA31ql0KK8DktsMTSXjpQ5gw0s
 nxeUYmVGWgf2OkFRu9ZHw9i1O5dGmeGZRk/dpBow7Tz/5aDy6B0snSq79OT3iytkmDgr
 fTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758731582; x=1759336382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jISvhkEG0ICYaL8bPwKoykPcpk+ajEu3fO0N/ok09zg=;
 b=Mj/pptodQSwKzaihITTK6fYGNkS/l/UjzKOs/yaD2PNn4WLUi/8IBFaRvmCxFTixnm
 ac8Pd/WGaeiP+4iExM5A1KN0FlkqeF00TK2Da/ff9P7zpvYg0o0yJp8v5Zs9QdtzSUhi
 dQLbJUvJdD6Y3lpSJoH/olLARp+gUXclmeEh0kzvfpbAVVwQzqNqSiwS3chH1Y6fOsPM
 R4KyNIEkbpwfQ4zfliLZYxJbl+cVZ0NzLDtYCXlnls+U9lUiKemwly6WkZDFE4SuSfLk
 Y/kqJ+JMPK5bZPWpXeWW5SQUaCsNN9GxbK9eFS7bqRHngiaEl4oXCs7Bmp1vJ4nV/IRW
 8+WQ==
X-Gm-Message-State: AOJu0YzSqf2pLGhuMDmDMLuvdNnW8HiGHD/QPHkUS4Hg+r0pNJPFOiNc
 JSg7JGvv0ndiNKBP5dpXnTFVhApq9feYdOFOw0JHS8sWobEOucwvlt9wu9k8KL0PALdG4a7dNnL
 51Ey9+sR2vg==
X-Gm-Gg: ASbGncvuOzfQE3Ntd3bVvZ4PxR36O2fhy7VvjfmHn8kDACxkwWxLGAwHQXpdohVzKDh
 +nHIlh/mmRO4+cwhLnlotC60Q6qOsCvMZQHX4Owp0n5zi1HYewEjeQ8SkL4IlLElnzlvqFR2qex
 RTAHvaXEDlilAvG919Uh76tWYwgWbyJ7H/It1Gc4H6phdGREwv/onXeeZ7+89/XAczrCtW4Efjc
 onkK83cVZwHujN8SzqxrhDiGwXr7owKH/mpxEDkeU+yzKuEu84VQZR61ZWoLJHDvd3ba/VPx1pF
 rY9foKCQjc4+w60FeYkROdvP0pyWMkxP7vCWfhnhRSi1oX3zud4nbmh0z8cqUVhpraIFsyHac+4
 wCTPSQwVUeYu2FbWBjBYDWQJg5xIphZAffwaUix4mqIqA65iTxIZUdh/vu9HXL8M7vPmsTTsseG
 B7PKfrcqw=
X-Google-Smtp-Source: AGHT+IFPF6d4AnD+/sZd5i38CacA0nVu4/2RlaazzcXsr8xatW9blfVXpCP9asweDlwq/E2oS+JL9g==
X-Received: by 2002:a05:6000:2f87:b0:404:c253:4dc with SMTP id
 ffacd0b85a97d-40e4c0e95d3mr604262f8f.53.1758731581884; 
 Wed, 24 Sep 2025 09:33:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4086b7dd760sm4772741f8f.52.2025.09.24.09.33.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 09:33:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] target/arm: Convert power control DPRINTF() uses to trace
 events
Date: Wed, 24 Sep 2025 18:32:52 +0200
Message-ID: <20250924163255.51145-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924163255.51145-1-philmd@linaro.org>
References: <20250924163255.51145-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-powerctl.c | 26 ++++++++------------------
 target/arm/trace-events   |  6 ++++++
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 20c70c7d6bb..a788376d1d3 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -17,24 +17,12 @@
 #include "qemu/main-loop.h"
 #include "system/tcg.h"
 #include "target/arm/multiprocessing.h"
-
-#ifndef DEBUG_ARM_POWERCTL
-#define DEBUG_ARM_POWERCTL 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_ARM_POWERCTL) { \
-            fprintf(stderr, "[ARM]%s: " fmt , __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 CPUState *arm_get_cpu_by_id(uint64_t id)
 {
     CPUState *cpu;
 
-    DPRINTF("cpu %" PRId64 "\n", id);
-
     CPU_FOREACH(cpu) {
         ARMCPU *armcpu = ARM_CPU(cpu);
 
@@ -102,9 +90,9 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
 
     assert(bql_locked());
 
-    DPRINTF("cpu %" PRId64 " (EL %d, %s) @ 0x%" PRIx64 " with R0 = 0x%" PRIx64
-            "\n", cpuid, target_el, target_aa64 ? "aarch64" : "aarch32", entry,
-            context_id);
+    trace_arm_powerctl_set_cpu_on(cpuid, target_el,
+                                  target_aa64 ? "aarch64" : "aarch32",
+                                  entry, context_id);
 
     /* requested EL level need to be in the 1 to 3 range */
     assert((target_el > 0) && (target_el < 4));
@@ -208,6 +196,8 @@ int arm_set_cpu_on_and_reset(uint64_t cpuid)
 
     assert(bql_locked());
 
+    trace_arm_powerctl_set_cpu_on_and_reset(cpuid);
+
     /* Retrieve the cpu we are powering up */
     target_cpu_state = arm_get_cpu_by_id(cpuid);
     if (!target_cpu_state) {
@@ -261,7 +251,7 @@ int arm_set_cpu_off(uint64_t cpuid)
 
     assert(bql_locked());
 
-    DPRINTF("cpu %" PRId64 "\n", cpuid);
+    trace_arm_powerctl_set_cpu_off(cpuid);
 
     /* change to the cpu we are powering up */
     target_cpu_state = arm_get_cpu_by_id(cpuid);
@@ -297,7 +287,7 @@ int arm_reset_cpu(uint64_t cpuid)
 
     assert(bql_locked());
 
-    DPRINTF("cpu %" PRId64 "\n", cpuid);
+    trace_arm_powerctl_set_cpu_off(cpuid);
 
     /* change to the cpu we are resetting */
     target_cpu_state = arm_get_cpu_by_id(cpuid);
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 4438dce7bec..252c05a9ebe 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -13,3 +13,9 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
+
+# arm-powerctl.c
+arm_powerctl_set_cpu_on(uint64_t mp_aff, unsigned target_el, const char *mode, uint64_t entry, uint64_t context_id) "cpu %" PRIu64 " (EL %u, %s) @ 0x%" PRIx64 " with R0 = 0x%" PRIx64
+arm_powerctl_set_cpu_on_and_reset(uint64_t mp_aff) "cpu %" PRIu64
+arm_powerctl_set_cpu_off(uint64_t mp_aff) "cpu %" PRIu64
+arm_powerctl_reset_cpu(uint64_t mp_aff) "cpu %" PRIu64
-- 
2.51.0


