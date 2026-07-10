Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234CC44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIHP-0005zM-C8; Fri, 10 Jul 2026 16:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFX-0002G4-83
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFH-0000y2-EE
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8485fad302bso1373713b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716877; x=1784321677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=bNibhBOuXmppnR68sD7trHHPZhV4j5AQA7Kzb1A4Kdqa36+ioA052goYRxRpYKa4z0
 nTDqPU18wNEc555riEoiORe/2eXBPi+48ptIwdmTA78WzDTMy7QGlRCiiAwFiHCkZ1+V
 E9t1WbRZF5Q1uZfdTKrhGuwaKWCfGUMp+YUxFODC+gYXFX3Dxp4URnfVOLfT7YsQNJK9
 HPPk7sVaFOIW9SGHe9iHJWL4ov6vl4DTVfKzAsUjhA4nzoNKAOOt2OjJ8+Wm3FxdXz99
 nqG3rd6KV9pBDHUYDAAQf1NAWc/AlXp8ZELb+bX5sP2XJn0facaxZYIFlPq9wi92oCnf
 hcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716877; x=1784321677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GnP83ngqbzOCaEyHZuWHVT2DEUxtaEIT/kVQUZ1VwBM=;
 b=JH6gXMvXB2TjY3BKXfR9T5FCIb0OAc6HcxpxEheYW6SyOtyw/zvlXABxElg4tVkmQa
 Tx8rT115hy4zWi5Q55hUTGaJUtXfUBtfPPgiHj8FwxPjhWfRziOaly+RhYjLr9O+51Am
 43pA5US1q30ucplAmDHJ1ZSTh/7iLq95Jj5TBXAs8G7A9m30yQwidK/IrYUTGmB+SzQF
 M+bwg+labUbtYxH66z/XzGaP8i4G9u8zSUL1zKzTcx0f1XeYFkTYvG/g6VVozw3kT2aq
 /aESfYZNUZpvLnafQYBpeC2vVCkmABJBdIxNYMEe4mdlkoONQI++qZiBjEMXFKbQ9GAG
 K07w==
X-Gm-Message-State: AOJu0YxBEsVQsYZibfrLpsIDyJ5amQusRLiIJ8wvffP3/NzroBDLSQhN
 n9Q+inEB+PfyNo74hMA6UYEDjBkbVLuD4y8F8wV4b46vOQIfMzOPiUstEjb2FWJb8mc=
X-Gm-Gg: AfdE7ck/e2KR+P78kA0zve1buRcTgYV9+2/VC5c88Qx1f2/tS//xUgvKUdU+LmW43IL
 y8eHIBUmULMM6eb/DQHRLkxsHhe6PDAuY+GFRdH39/ZnHlcDhDEIJwM7XgOf4uCHxLa0BfiecKm
 /tC4OJAEv3QsNBbTZbKdEUzxf/NWBWh0qo4eX8zbcomRDUPzGTaaDQkcL5IIdRd5gpSjTu/9Jfg
 pHsvzFoWTas70oyTqMEO6gvdmTO3e1dxQTgLypsNlUJyXbuaA6CycmJGm7SDSloRztWeaXmeby+
 Sz+44rawcXuKfP85QEw4qADr/k+04acVyGXvzSTDBlq1mCI1GldM+oHrKaZPLAuVaYrdDk/GQpg
 VEwExOAYJo6X91OblQ+YzGtevpSXyp1XzKJOR6C4Bwp7lRPg5gwGoOyRmn7WA2rjLPRwYzmlMMs
 bsENS6F/DFh2bCDnjaDQ==
X-Received: by 2002:a05:6a00:b50:b0:848:80ec:5d2 with SMTP id
 d2e1a72fcca58-84889738aa8mr513964b3a.51.1783716877471; 
 Fri, 10 Jul 2026 13:54:37 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 32/51] target/ppc: Simplify ppc_cpu_debug_check_breakpoint
Date: Fri, 10 Jul 2026 13:53:42 -0700
Message-ID: <20260710205401.836304-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We don't need to check PPC_ISA207S, because that's already
done starting with register_book3s_207_dbg_sprs().
Replace target_ulong with uint64_t, as we're under TARGET_PPC64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 56ca66e7b5..99ffe4a820 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -330,23 +330,19 @@ bool ppc_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
+    uint64_t priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
 
-    if (env->insns_flags2 & PPC2_ISA207S) {
-        target_ulong priv;
-
-        priv = env->spr[SPR_CIABR] & PPC_BITMASK(62, 63);
-        switch (priv) {
-        case 0x1: /* problem */
-            return env->msr & ((target_ulong)1 << MSR_PR);
-        case 0x2: /* supervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                    !(env->msr & ((target_ulong)1 << MSR_HV)));
-        case 0x3: /* hypervisor */
-            return (!(env->msr & ((target_ulong)1 << MSR_PR)) &&
-                     (env->msr & ((target_ulong)1 << MSR_HV)));
-        default:
-            g_assert_not_reached();
-        }
+    switch (priv) {
+    case 0x1: /* problem */
+        return env->msr & (1ull << MSR_PR);
+    case 0x2: /* supervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                !(env->msr & (1ull << MSR_HV)));
+    case 0x3: /* hypervisor */
+        return (!(env->msr & (1ull << MSR_PR)) &&
+                 (env->msr & (1ull << MSR_HV)));
+    default:
+        g_assert_not_reached();
     }
 #endif
 
-- 
2.43.0


