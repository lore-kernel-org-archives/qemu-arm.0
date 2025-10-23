Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAA4CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtsj-0005ao-8O; Thu, 23 Oct 2025 07:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtsg-0005Wc-AJ
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtse-0002ao-9I
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:53:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47114a40161so7109155e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220398; x=1761825198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mwK2RlutoiLQus/3WuL3gr35HC8KpbSN1PagABh+6k=;
 b=aFmJUZnrxAcJx1GFlaLBpMh7fOeZmWLWNOuNSKKQmt6H8sp08qkeiDk7q65eQbRdGm
 3MX6ybSrJ8IJZvNGVBN5E+sm4jCVtJ2zip6GpniFfpsAHfGBSKjRMB3eFnRrr/pf1epY
 CuM17mrR0XGwyZjQrRMirnKkIlp1XzN86wCMAOQZdtpS0j2ZYpqqiRMeAv9vcND9ajNS
 vTE+Pe8G9guo9/H3E3GRkucDOd6UMky7nkA4zycS5kr7LFWbcOv02zvnR9JUK+CBkkoE
 d5sAnIp/iCfd4BiV6V+wBqdNgdmNGcCWGihYiAGqbKCac+sNELDXfD3NQplHWlQaHKeL
 EbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220398; x=1761825198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mwK2RlutoiLQus/3WuL3gr35HC8KpbSN1PagABh+6k=;
 b=l8kOZBKp6XRKIPYts1A0RcgQj8kkm4zi5vmJOwVS8EhRIskDRGyld/GPQKMEJi9xYG
 Hbvto50CQoyWgeXHiyw/gtmzRozo0ekyD5UED3p8i/OjPIVtw6zUrbxTy2K3BPcilr1/
 jczxEqzwo/gGQP0APDga9wy13NZ8Djvujh6ahT77YlQi39d6B1lQ1g2/nYW3NrZzzshn
 aQgjADpW6kxJVXgL9MxgynWipksmcMttTiDuqbru5b0CtfE0AQFSJpcLYjGF4BtHgwAf
 ZgcJYzHBI6Bnd5PXWRBOlK25F+2JeThWc1ItqQv2TfMH1LVHAG/ktD2EsaAhAfYX2FQe
 4+Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlQtN5G9gUVoRGUxdm9GMLUW7Z/rDTPrz5pEClckNyuylo0jPyTSiHqDLx0hxIg4D6y+AjRh2oog==@nongnu.org
X-Gm-Message-State: AOJu0Yw17osvFCng0xfSHBjL2gvGxVxtHvP4yO/zTCEt3sva60gJHkp/
 MZT1yR31Ley7mHAEBPd4A+BYdn1OYozCLvhK5pdk4mOZxjboYybrdTQumC9xIj5U4N0=
X-Gm-Gg: ASbGncsFzPFBU0YkclDAObU45frT9y90RwYxE5ipWnKK2oxbrrX0H+HlhVvHeFxajLA
 AkJwlAZMs3DlavTOWFgNLfcG4Q7zfWW2ktcy3zMQXgPEtXF5W8nEL9y0UevwYNWLKmZxfpXLmjM
 4pqYAFethE+875DiKlhtKMsKSu1V6s2Q35uKJCcpQj/5Bb9b1UqYXi4lP3wIAqlF7LQ0qu97W+T
 vMoqKLgzj0dXqKeQVauEmBO/fwZnfjswC9vOrQ+pvdWTwkIPrUvtyIDk4gApUH0PS3YiwjCWhJ8
 cq3bT+Pwt00O7YYBZHpW1BIh2a3veO3+cViVvK36SZWr/gFg71lEjq/R9TsctavKpZlHDh4gBy9
 4yGqISRJCXIqn8KWwwpRDrpuK9OgCblHFCPON7oiYvSiCFEltpmcE2kip6XkLaYe5IRCncJcnVk
 eY1w9pX8wx5lAeGXIu8mzZRfvhUYzlsfHJp7ySfNKgQsDQZTun0Q==
X-Google-Smtp-Source: AGHT+IGgTMOb7rRfRfNIvaiZD6PMMPXFIlJTXRaDnyMGNRwIfiJFMZdPBdvgOqIqdf+1SU/C+yjxRw==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id
 5b1f17b1804b1-4711786c79emr206187585e9.6.1761220398051; 
 Thu, 23 Oct 2025 04:53:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f8eesm33677065e9.6.2025.10.23.04.53.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:53:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 31/58] target/arm: Share ARM_PSCI_CALL trace event between
 TCG and HVF
Date: Thu, 23 Oct 2025 13:52:42 +0200
Message-ID: <20251023115311.6944-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
---
 target/arm/hvf/hvf.c    | 3 ++-
 target/arm/tcg/psci.c   | 3 +++
 target/arm/trace-events | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index e913662dee5..b5fdd86837e 100644
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


