Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD0EF9EDC8
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:04:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXE4-0001HD-Up; Wed, 22 Apr 2026 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDy-00019w-SL
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDx-00019d-8J
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so3947775f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862956; x=1777467756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/Vl2py7bAr3MMXnnVGwEiFMxjfl+Vi5CKcG3JxQvlI=;
 b=Dc2RpUDRuykvLisdKiHDSrgcXAmYOuI77OCIN6OjX8CZnH9TZR2aKLb8qsZ6srzQdO
 a5SfCe2tRGndmaG+J75FN1fza/SNGxkhmUWn6hUHfIQ/qSJ0NYRw88tCKcv8PT2LN+rM
 7V5hYYlTST/tT8F4JZ0aC0tyWD5nqVQyBjC8cuGmWj+h8Al2feD1RoFkSJQeON5QDfIr
 uHr1USzut3RiN6eSNjIsvAtUH485ETu8Nu/ZJVNzR1CAv21MiOK3v8eCZSnRe6xubmfC
 /vwRkU2k0tShwVy0CkiH/G2jvgwQ2xpLzZ0LZicMvyYfEIvqvBoB/3eXiVe57JTYVwQL
 pI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862956; x=1777467756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p/Vl2py7bAr3MMXnnVGwEiFMxjfl+Vi5CKcG3JxQvlI=;
 b=Fm6jTqqh6sY/eaSDhYqK6v3Wooe0+fyU854Bp/MZJYF4HuR12XcE4B53VdB38zERLU
 iri15Aw7yEY6wmD2ShL2J27LC7ZIN2RLLxRTswdccC7S5Zie9oc96LqTc0i527Wg5e7e
 H1/h75ovNJTbaGzn2rjxv/lRaiEQTXo+kN+MUPHOupIF7zDVEjyZZfbsrAg4oE678F0e
 lBcOscrLUOeMDB9vLyHBSIuoaEytWWafszBVmlboFmg8ahmxIbnb0oD2Z9JmstKNdM7Z
 pHEfeIOQ74zpWnk1zIn4v8XEFbcui3t04zPpzS64hs6nt4pWCH/QzLcPAz2W9cBrKAl2
 ZP+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0FlyFtSn2B5ddFnRmZufRI/KxFRdmNnkErhvHTOWva6oX4cCBISqN3Rypug/S99JJMa0z8+88hQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw9to212hg3cjmwlPDO/E4lG2K/fqZ4vuqmtQE+A9ERQAC0MxTA
 0+7JRLkxp2BwzALYYQSYmBLVSd+UdL8OzwpkrNwhgcwFbSAgcGn+4NtVav4zT9xR7uw=
X-Gm-Gg: AeBDiesKgRMp40dehEslpREkETGaVuD8iY7WXN+O19g1DmvlX7uxES0JrBv82SK1jr3
 QkvZ0PWHwLNWmGqSVwQEaWYEh/eF6Af7DBIEA5yVOqk0glT657XpOX9DeisEY1VWUqG7XLSlCK1
 gxHYECSRCOYsqSbLWAaRrXJYiec8GjF4k8vqMo/WtbMuOg0SAFulsfSrJfIICjSwRyob1NhvyP8
 UAT2LLTbDNov5zv2lHYMEjN3DGhC3KcFoQG5bo+QACl4eSbnzrwJS4cpPMZQdBKEkoZmwpAN+17
 qBwtyz1PpkDnQR33MFZcuzTv+ujzPSGF9zj70YmdOuxyy5W5GWxi3BMExFJi4cMj4lsPRK7YFtR
 qbekwR+KOfg1UNtdU8VX3C6Cnl1gsvDYehASHNUJWvs6sWVXh9bK2I/fWtEUjEhgExikqoRkrts
 pwStq4XI/hT/7DWHhLrRgU5DR0DKgkikROgvukIrMhGE/Q
X-Received: by 2002:a05:6000:1a8d:b0:43b:40ef:5d1a with SMTP id
 ffacd0b85a97d-43fe3db3c24mr34177692f8f.5.1776862955514; 
 Wed, 22 Apr 2026 06:02:35 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a174sm50153175f8f.18.2026.04.22.06.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4906061668;
 Wed, 22 Apr 2026 13:52:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 28/32] target/arm: hoist event broadcast code into a helper
Date: Wed, 22 Apr 2026 13:52:45 +0100
Message-ID: <20260422125250.1303100-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

We will shortly call it from more places.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h     | 19 +++++++++++++++++++
 target/arm/tcg/op_helper.c |  9 +--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dc593f1fec8..089f679ac0a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -682,6 +682,25 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
 /* Actually handle a PSCI call */
 void arm_handle_psci_call(ARMCPU *cpu);
 
+/**
+ * arm_broadcast_event: set the event_register for all PEs
+ *
+ * This kicks all PEs which will up which are waiting on the event
+ * register.
+ */
+static inline void arm_broadcast_event(void)
+{
+    CPUState *cs;
+
+    CPU_FOREACH(cs) {
+        ARMCPU *target_cpu = ARM_CPU(cs);
+        target_cpu->env.event_register = true;
+        if (!qemu_cpu_is_self(cs)) {
+            qemu_cpu_kick(cs);
+        }
+    }
+}
+
 /**
  * arm_clear_exclusive: clear the exclusive monitor
  * @env: CPU env
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 655e3f96e78..6a2be85fcaa 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -474,14 +474,7 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 
 void HELPER(sev)(CPUARMState *env)
 {
-    CPUState *cs = env_cpu(env);
-    CPU_FOREACH(cs) {
-        ARMCPU *target_cpu = ARM_CPU(cs);
-        target_cpu->env.event_register = true;
-        if (!qemu_cpu_is_self(cs)) {
-            qemu_cpu_kick(cs);
-        }
-    }
+    arm_broadcast_event();
 }
 
 void HELPER(wfe)(CPUARMState *env)
-- 
2.47.3


