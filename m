Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E46CC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:54:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY4Q-0001Bd-UY; Tue, 13 Oct 2026 04:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3k-0007pt-5C
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3i-0007xF-BS
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso34528835e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880828; x=1792485628; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=RJzfMhjKu4TNbAp9oHPUvWIkRSlmWLw3udGjNBH4jJg=;
 b=S8LcU0/gBM0S6n+1I96LlQe9V5VzypPCosZIaLhK+ecFWP3GUEczP44w/g7dvpdSqK
 mDd3U8x8cy9SIhFA3o8bIPRvUMWg0l46moohU1PkHG9iz77fCx78GtTVh8LL3v6vS7hU
 0AO1f9yzxMbMCkEMN9a8aPG/kul/wlhzWgjGMdDMZLmNBx2iltqEtIw2eCboVX4dJd5u
 oVFOF+T6EpPMc1H+LvaJBgvXrKcF3E4sVlYN7jYy4q6iNTLGVMMXy8OWfLOpbyPyKXIT
 OgIiAKPcrk6K5bu1MKXLTDnvVVNuaXaEh9r8O+Mzs2CLZ1ohFLTA7Py76BDPzo/CDLlm
 Bj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880828; x=1792485628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=RJzfMhjKu4TNbAp9oHPUvWIkRSlmWLw3udGjNBH4jJg=;
 b=oFLDmgTtvGQpBbFN2aFfO8vr3dTn0xWYikYveIechSPK9uXvlFKrQyFj8mJuxqGTag
 261OSQMgTa+cmWzgJYCb6tGWRVhgxL0l2wLYM5eYoXCTsJYyNwBqdvgZx+llf3+PNMCn
 BCY4JYWF3HDIxdOFoFkRQBXN6OvT6fvRzbaPg2hyJlYOxSLg8eHy3ExBY1hYCT3rYkms
 qaGch31Ht4WaF5Zq+xeTpS5ou7v/PQMO0reB5eW18lxW3fMLonJxGTSCAox+BL0U5eV1
 LMSJZWs7URD8hmbACc0oExs4HrcMpkKjkMXvaRI76Bd9h8CWtQm3SUosIXBusNkBQFez
 K6aA==
X-Gm-Message-State: AFq9FYIHy1h2zOOSM9tuffSljCR+JFwlfVnc8zbuDcWOJ1qrPnLI6fzs
 uvhNqNXhJZQRdDmt0/lmjP82i4QNst6Xd7hNctcMYwNO1ZvEVz0nBc12pH6ZVgUGIUg1AcRp9pg
 U+7YHjG8=
X-Gm-Gg: AYBFou0Y90+W2U55Owar8HamTrh+z1LYmT0hrDs6VNqv1GVTGu4Dz4YKuiC+7W03/Kh
 tBHYA4LYczGgAVJP6NCXzsHAIGyPw/Y6POswZ77ayOahMR8EFTzrqLB7zyUDTAZMY8XoSmfBlrT
 VpTtRY5tFkpvATw0rvDYt1wkXXicztjEPUr3bPKi7A3BLvhug2sBKhM4z7XdbzdpQlCHgbvxVq1
 KhoWih1RXeYx2MocKtJbbG21JhgvA5fPyfiuNcsflCN/ktt2dCoOwQ6dkYZiFk2KuAhEstsyTc9
 w+qJFLoiZX8JCm+PJQQKLfUjVb11s0U8baLI/ZbA0a0pEzgPWtX1HQA2e+m8NVcswBrcXisXUbC
 OYnIXYf9fj2AKYJRKZ8mc04l2gDkjgV5hZ8tgkn6grCjWMxR8j7Do6bgDXln4i9UNMcpDY6GnDN
 giNT5pKFw3OgdPaEpaqK6VZS4kKEQzNLOqEzLOzOC9U0rGVVhR1ALenkfu5t93EG2gDeTSPa8Fy
 PmKAbN/ljz9RdYLqpJcl1IMorsJUN4Dw4OISrQi9PAhM45ixxeJzBCRFK78dTygjwfE5Ro3KnWX
 /lI=
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id
 5b1f17b1804b1-4a18e49ad83mr230799995e9.11.1791880828182; 
 Tue, 13 Oct 2026 01:40:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 38/86] target/arm: GICv5 cpuif: Handle virtual interrupts for
 GIC CDEOI
Date: Tue, 13 Oct 2026 09:38:45 +0100
Message-ID: <20261013083933.1024405-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

GIC CDEOI does a priority-drop for the current interrupt domain; when
this is the virtual interrupt domain we must update the virtual APR
register rather than a physical one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 21 ++++++++++++++++-----
 target/arm/tcg/trace-events  |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index f8d58b5a537..aeacc812fe0 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -1221,13 +1221,24 @@ static void gic_cdeoi_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     bool virtual;
     GICv5Domain domain = gicv5_domain_for_insn(env, ri, &virtual);
-    uint64_t *apr = &env->gicv5_cpuif.icc_apr[domain];
 
-    trace_gicv5_cdeoi(domain);
+    if (virtual) {
+        uint64_t *apr = &env->gicv5_cpuif.ich_apr_el2;
 
-    /* clear lowest bit, doing nothing if already zero */
-    *apr &= *apr - 1;
-    gicv5_update_irq_fiq(env);
+        trace_gicv5_vcdeoi();
+
+        /* clear lowest bit, doing nothing if already zero */
+        *apr &= *apr - 1;
+        gicv5_update_virq_vfiq(env);
+    } else {
+        uint64_t *apr = &env->gicv5_cpuif.icc_apr[domain];
+
+        trace_gicv5_cdeoi(domain);
+
+        /* clear lowest bit, doing nothing if already zero */
+        *apr &= *apr - 1;
+        gicv5_update_irq_fiq(env);
+    }
 }
 
 static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index 75f40c44f26..8e7e4c119db 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -7,6 +7,7 @@ gicv5_recalc_virt_ppi_hppi(uint32_t id, uint8_t prio) "virtual domain new PPI HP
 gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt failed: %s"
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
 gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
+gicv5_vcdeoi(void) "virtual interrupt domain CDEOI performing priority drop"
 gicv5_cddi(int domain, uint32_t id) "domain %d CDDI deactivating interrupt ID 0x%x"
 gicv5_update_irq_fiq(bool irq, bool fiq, bool nmi) "now IRQ %d FIQ %d NMI %d"
 gicv5_update_virq_vfiq(bool virq, bool vinmi) "now VIRQ %d VINMI %d"
-- 
2.43.0


