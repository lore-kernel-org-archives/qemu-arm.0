Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E87CAC5AE
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Sep 2025 16:34:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1SQr-0001Iq-Sn; Wed, 24 Sep 2025 12:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQk-0001ED-Rd
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1SQb-0007h5-2O
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 12:33:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3e8ef75b146so76365f8f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758731588; x=1759336388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlQ6Ng52Z/82yxja1G/ZYi+ehAL7gT96tJ3UY5oVteE=;
 b=GihOn2dNTn27xNDU6xzYE/i1SqFWMe3ZippO6HnxL+eqrMr3oxdtDPuhe9YY+V/urL
 rIEiRcjPQjgd/9PkYsJjfDi5bj5JQUDUuMOLd3yhmB5paEmXbtxqHyYju81KdUuyfhMW
 kOPmkebziuSmyR0Wlx4I/y6/FQSOg/0G8ri0e/7oWzlIN4ivbiaDzfjIJG/TMq8XOlsU
 rrg6tZdFGJ4lfa/B3MxSeeIotQXlQySQvYIjf5xvLxccYoNAL5ixJEMdU+vC2HoWeLKT
 Sfaqq2kcw/FQlIZOhrue7Bb/po+9/fWXee5W0RKWRV0E5hop3RkOQjPkYcVM0THLAWJu
 FU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758731588; x=1759336388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlQ6Ng52Z/82yxja1G/ZYi+ehAL7gT96tJ3UY5oVteE=;
 b=CrH4WImW7ZlrzvzZxqSw2axmendAK8BI4SU3cxz64Y1kG+cw+qDgwwejXeQA8i6qVx
 X62BEzMtdFpV5LwpS+K4jJSyPFd+Ge7K8JGfUluyFJwSUrhOsVzK3P3ZiLdl/SKMM/Jj
 VzwIWasrAcfQK4D6L7cfPOnfpjjW3qlMuPeP0kPbvh135sDySxj7tw5h4xxfJ9sbWon1
 kgBT3+O/URWmv7cV3CZz1eQK0ygaCekHENUQ6wTHTmiITdjngONtJR/8owpPIgAnPmiS
 KHtlWjAg36In7lm2ZhqAc3Fm6iSLMTrnxiXI+lX1U1mStzXNqBQX0nTy/Z7t0YtnrB4V
 pu0A==
X-Gm-Message-State: AOJu0YzfUdZN2NMvXOCmv+9UPw/6SpeMtIvm+vnuXRbDKbmTpUklxQvP
 KIouL4DMn+86bpe23eDJK3mZFCsBkPEH0FGMj9Gk5rEEjOWHo16lvspaYg34ZsEnws7b9+qtCxc
 Lxwc1k+hCFA==
X-Gm-Gg: ASbGncuNX59wcV0enSGydxxKIa+NfZw5qV5C/oeKJ0mjxUZTw30hbyimkRdAws3fc6L
 /tI0mMCuZ0KypjGx7PN4d1w1Hf2bz30bsvCWoJt2Oy5xKthFehq8t+TOaweWds+Tag8PINOwRVV
 ew4403fkhI1fshQ7uq0nLYh4OC4V8QoB4qmPvdRlJsT0zC7Vw/JHm6MxNp/qJI6b66tAmqVx9sk
 02QITf86Ez1RyvChgkKI9QtFVlPy6ZCZe73x/jtEh5xSN+B2mTDm/4TgUdWul+VKk+x8ThHcctE
 VaNBuHiDguTBH6wXjMLOXjDRv+EMTQxkPVZEYQtGT8bwQ3OhPhyVWYvVt6/ThjWUutR9ThfgiFu
 6JvH5HWRS2Ul6agTFis41Oq44BmIy6XXXTmgHmyctjZcY5x1rJjiOQI0KvsUHob/zHPnvaTiU
X-Google-Smtp-Source: AGHT+IEIhSZZcMVYW2s6EVql2lm9DT/kk3VTt4k94UBjSzd+90AhLvXGyMy95AJzQ3fA7sz446TemA==
X-Received: by 2002:a05:6000:2385:b0:405:3028:1be4 with SMTP id
 ffacd0b85a97d-40e46237b8fmr498269f8f.8.1758731587585; 
 Wed, 24 Sep 2025 09:33:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab838b6sm38127005e9.24.2025.09.24.09.33.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 09:33:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] target/arm: Trace emulated firmware reset call
Date: Wed, 24 Sep 2025 18:32:53 +0200
Message-ID: <20250924163255.51145-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924163255.51145-1-philmd@linaro.org>
References: <20250924163255.51145-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
 target/arm/cpu.c        | 4 ++++
 target/arm/trace-events | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c65af7e7614..f422e608bf3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -52,6 +52,8 @@
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
+#include "trace.h"
+
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -580,6 +582,8 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
     bool have_el3 = arm_feature(env, ARM_FEATURE_EL3);
     bool have_el2 = arm_feature(env, ARM_FEATURE_EL2);
 
+    trace_arm_emulate_firmware_reset(arm_cpu_mp_affinity(cpu), target_el);
+
     /*
      * Check we have the EL we're aiming for. If that is the
      * highest implemented EL, then cpu_reset has already done
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 252c05a9ebe..badff2b2e46 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -14,6 +14,9 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
 
+# cpu.c
+arm_emulate_firmware_reset(uint64_t mp_aff, unsigned target_el) "cpu %" PRIu64 " @EL%u"
+
 # arm-powerctl.c
 arm_powerctl_set_cpu_on(uint64_t mp_aff, unsigned target_el, const char *mode, uint64_t entry, uint64_t context_id) "cpu %" PRIu64 " (EL %u, %s) @ 0x%" PRIx64 " with R0 = 0x%" PRIx64
 arm_powerctl_set_cpu_on_and_reset(uint64_t mp_aff) "cpu %" PRIu64
-- 
2.51.0


