Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2ECCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:02:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcnA-0003KJ-Iz; Tue, 28 Oct 2025 02:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcn5-0003Cy-O4
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:02:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcn3-0005fC-Ia
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:02:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso2674346f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631358; x=1762236158; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxYM4u3dYFgXtTituwGbMoaQJ7IaJZc35NgLj0t32r4=;
 b=PDDGQy4/UZztCcX7moDM78ef6Uuvxh+PJ/eXiDNkH169IEdu+C5ZWqNpS39YFN0XhS
 DmnO8OI4KH6gc4ELIl18nCJs5WiSAOimUpEHVPMQZ1fe/6VUoVdqUSmCCGZlsvFZoZcB
 pTQ8BSitTnP+3JVITz10sjYc2cE5lAUHMiGUGT0JCHNXS+Viz+nri/JA8a1v1QAXKo1r
 PR6w/YF+8TjaE0n5RjUt6maEcqOE5Ar0Q9YT+Azc+Leubhaw/7eONCCzPfvnwWU3lYp2
 +HIknwf4YDZUMIUou0F6z6oThe/ANpmvwYwz1gDGdvLxbj64N4qIDBOth7yaMPkY9+/4
 p3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631358; x=1762236158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxYM4u3dYFgXtTituwGbMoaQJ7IaJZc35NgLj0t32r4=;
 b=GppjcNNtZ2OR35M5KNgHeShuR78du9zYk1Bv9S0xhHAp3+41yqC/x/jFlIljdI9TqV
 npccds8mMfDvWWvc/oQFNsWuybg0Kg/+IYG9Q3Ltw5HFO79Xl2IkyTyiXAxsqIAX0Rz3
 tRbX7+Ue+WMmBBKmiUNRfl6ft9h1jNXZqI5RUzZ7RfHkjWR7Yy8/R/AuxpLHE/NhEkfn
 iwHI954igoxNLYaK6xV14CyeYous9HdZ2zpSWiE9t5pb5I9WWwq2XFA3VgMwVMgnyL00
 r3+9hK6fpUdGCtCw+PYX8wnmwVM/HCvrCj1wxLL8gQoZ23eZJN7HN+zMnZyBRmxeEcR8
 vcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatuUcSP3bBzBBJRL3LEX4tUjNgHqHmHDs+ICg/BZ3LO3cWrA3yOzh6U+1wR0HE9DPDU1dZmszMw==@nongnu.org
X-Gm-Message-State: AOJu0YzRbYI3Sx1lht2N9X7thPQBZmiA3dIyelgXEmgDbOvKAKbQb2+n
 m7JHK0gDKMO7tT1mY/pDLhXJJebUiP26KFSzLcDExFM/2SwF7XHC7DsL+WyhFfmaVFU=
X-Gm-Gg: ASbGncstuA4Q6tgHEVi2g0h13JJSMbDBob7mSqbyh2TMFtHQVaNTHTvNKFiyYmV/Bxv
 9bk9imSRBn3AxYdzTsPlu7OaCeD6pmy/C2NMHiIJ5cl2rN1U7ptmXfRDc7Jl+hUBVXmept/2mIM
 KM0VwyhlWziLMZ7SRCXNZmtGt0G0oAtHp50aoemwZ3Apn9c8ZnorPjkMjzeuYE0Ss6Dq38NmCpn
 PfTLCF8xITws0PWdN+6alWZXF3CVWiMDW7sgNo9ZufThH1EUbiuetl5oCmhreaf7oL1bApmhkcQ
 HLEkvmLLwsHMBSax0NqKGgc/HwCS24249M3Q3YOI4TgbgYeqygtTU7HDX47ob7uyhp+vZijm+YV
 zjNJIVzN4RENvpGNBI3c8l31XQ70b01IK4UT+n8Zrf4GZamD/+iimHbKuUD2wWF1ZIvujc1cTf2
 HcZgHtRQ92mrkDt06jtxme7Wf6HgODBaiftjlsnNtl4fZL3JQ20IYTeNs=
X-Google-Smtp-Source: AGHT+IHbRvYiKx9tn6WuwU4E2OJ5IIlqD6krLj9AFlgNx6ARYvSvP/g/equMOrbkdaV9m9wO6UZ8pA==
X-Received: by 2002:a05:6000:718:b0:429:a7f1:bdf4 with SMTP id
 ffacd0b85a97d-429a7f1bf3emr1801823f8f.26.1761631358406; 
 Mon, 27 Oct 2025 23:02:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb55asm18305284f8f.17.2025.10.27.23.02.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:02:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 28/59] target/arm: Share ARM_PSCI_CALL trace event between
 TCG and HVF
Date: Tue, 28 Oct 2025 06:42:04 +0100
Message-ID: <20251028054238.14949-29-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

It is useful to compare PSCI calls of the same guest running
under TCG or HVF.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c    | 3 ++-
 target/arm/tcg/psci.c   | 3 +++
 target/arm/trace-events | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a3bb71e63b9..f31b6e54ee7 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -34,6 +34,7 @@
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/trace.h"
 #include "trace.h"
 #include "migration/vmstate.h"
 
@@ -1025,7 +1026,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     int target_el = 1;
     int32_t ret = 0;
 
-    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
+    trace_arm_psci_call(param[0], param[1], param[2], param[3],
                         arm_cpu_mp_affinity(arm_cpu));
 
     switch (param[0]) {
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index cabed43e8a8..2d409301578 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -25,6 +25,7 @@
 #include "internals.h"
 #include "arm-powerctl.h"
 #include "target/arm/multiprocessing.h"
+#include "target/arm/trace.h"
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
@@ -79,6 +80,8 @@ void arm_handle_psci_call(ARMCPU *cpu)
          */
         param[i] = is_a64(env) ? env->xregs[i] : env->regs[i];
     }
+    trace_arm_psci_call(param[0], param[1], param[2], param[3],
+                        arm_cpu_mp_affinity(cpu));
 
     if ((param[0] & QEMU_PSCI_0_2_64BIT) && !is_a64(env)) {
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 72a2c7d0969..676d29fe516 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -23,3 +23,6 @@ arm_powerctl_set_cpu_on(uint64_t mp_aff, unsigned target_el, const char *mode, u
 arm_powerctl_set_cpu_on_and_reset(uint64_t mp_aff) "cpu %" PRIu64
 arm_powerctl_set_cpu_off(uint64_t mp_aff) "cpu %" PRIu64
 arm_powerctl_reset_cpu(uint64_t mp_aff) "cpu %" PRIu64
+
+# tcg/psci.c and hvf/hvf.c
+arm_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpuid=0x%x"
-- 
2.51.0


