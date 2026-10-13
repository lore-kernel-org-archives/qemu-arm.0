Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B14CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3o-00085j-Jt; Tue, 13 Oct 2026 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3e-0007c4-LL
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3b-0007ug-2J
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so26434525e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880818; x=1792485618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=lh+2T2GNGXypbGBZ7mOAEqbcBqzSK4Ir0IjdWPDly0g=;
 b=bIqJF2MRLaT/C6yyIqlnFSgkfiyBeHP2oj04JosMeYMn6gIohD5Sdz8SyK4y7ICtcx
 p1KvsAioL505nOVndastoA8RaP5zd1hxxuuO+5RvoDWbYaPJlwa4F565C9Ol98tXNvoG
 Ijvj2bhImqhKKi7S0DCDX0753mOWRZtYlE8igwMEXDVCefVqYG9FL5nT00MulkKN/DQ5
 BomdZvpO5oo8kHmNvmKlPpBW1qeDfJmunbxAd+LxqfKPeLcD6urE7Nlh+X+4CZPyTX1P
 KHVswpBWrs/XZF65lvceneSK+qryXqGub3dHrzjldM1X9VNiAqBQgYPpiSAOm2eZziwF
 LY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880818; x=1792485618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=lh+2T2GNGXypbGBZ7mOAEqbcBqzSK4Ir0IjdWPDly0g=;
 b=2hxc+g61sHll3WOou8koH656VkXr4z8eg1i5w1wTa+5WB0vLFzMZ9aDE7m7bTEKPQ9
 k99sUbbMItDtKJLzXQinlT3H24zFR+8wVg1WyJq6criqZrj/K004omMfgS1qkQPqM4mW
 WUgKCcRpDIEbsnbN/eax0aqlmD+dyJcCY6SVF0ouzIAHI/scfqTyuZr1/QaGo2cmgSiK
 nnFwXkmzaZ490ch4HYlCoGGMZsXkC8tunk+5CJ0vsoA1FGYGqE5w0/gLx67mn/cvqpUw
 LwU+rYADhOCjlNB9kvUP5cuQXsfIbextb4qJv8/Yo1CdZIBxGwD1RWVY0X9A5zPublT6
 aNng==
X-Gm-Message-State: AFq9FYKmW85kXX7/xg3kfnnmcRMVf1SUSUHrHGUtBdytOoalbZA3iPZI
 UKX2Y83/FdyDE+RshWyPRZHM+oAVMAR2jF1ezTNNoFbWx/taNkXHE+h1VPES0WlgsL8+iH0yKuR
 i9EH3lfI=
X-Gm-Gg: AYBFou1E9/fY3U2UpcMhhgSz/mnZK4z8dG0zMR2MrimLJU6TOcAlbV5r7kDa9DVIYNs
 6ucUn+CTkwalRunS7Fy/Ud140NgZFHCqApDcNaE8KUa5P71d9XD3p9HzrpVftUtBppBSWnc0cyp
 ALplx4Jm4gmCUnW4AJm2WEh+rZijo5EvMY/98v7/QYqfN2ukXwyAwYH2x1ztCU94Bvitnj1/TbV
 QQ0o9bHcUIqwa9OJ/QxqTLSPVPqoOFAzbnys+4NVJWGjHbjbb/MTl2R6HO9kq0IrzsGhF73Nqly
 rebFDyE8R72vfA1W4zFzT/URoVHn5dDT0WHe6Lnm+rXanx410SM31P8NBnzZ2s/OPwu94Ge0SyO
 o+6nxd6wlcxtFRNYSIkkJLOaP/MesdFQNqvRpgeGNaGt14pIwxLPXYj3pguIBBofIKIdXB+staZ
 zE17otZ7zBEz4ZJOSsgz0mBXehJCmT88yLuB84wQjsD8+QSRFVAaNXBbC5+rpOPntdN1NSG52K9
 ICn7GM1kAdpcZsxqjfPftRY/4oQdXTA4TOX5p4isKv1tulYRw31iFzSNz5t9xUja+zJU6QjTQ+Y
 LL4=
X-Received: by 2002:a05:600c:138a:b0:4a1:7bd4:d07d with SMTP id
 5b1f17b1804b1-4a18e4c85fdmr249944985e9.34.1791880818246; 
 Tue, 13 Oct 2026 01:40:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/86] target/arm: GICv5 cpuif: Calculate current virtual PPI
 HPPI
Date: Tue, 13 Oct 2026 09:38:38 +0100
Message-ID: <20261013083933.1024405-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Implement gic_recalc_virt_ppi_hppi(), which calculates the current
HPPI PPI for the virtual interrupt domain, using similar logic to
gic_recalc_ppi_hppi().  We call this from everywhere where we update
the state of the virtual PPIs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h             |  2 ++
 target/arm/tcg/gicv5-cpuif.c | 51 ++++++++++++++++++++++++++++++++++++
 target/arm/tcg/trace-events  |  1 +
 3 files changed, 54 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 81fb68facb9..abaee5fc3a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -596,6 +596,8 @@ typedef struct CPUArchState {
 
         /* Cached highest-priority pending PPI for each domain */
         GICv5PendingIrq ppi_hppi[NUM_GICV5_DOMAINS];
+        /* And for the virtual interrupt domain */
+        GICv5PendingIrq virt_ppi_hppi;
 
         uint64_t ich_apr_el2;
         uint64_t ich_vctlr_el2;
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 96384c58726..0d38ed7b15b 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -298,6 +298,45 @@ static void gic_recalc_ppi_hppi(CPUARMState *env)
     gicv5_update_irq_fiq(env);
 }
 
+static void gic_recalc_virt_ppi_hppi(CPUARMState *env)
+{
+    /*
+     * Recalculate the HPPI PPI for the virtual interrupt domain: this is
+     * the best PPI which is enabled, pending and not active.
+     */
+    env->gicv5_cpuif.virt_ppi_hppi = GICV5_PENDING_IRQ_NONE;
+
+    for (int i = 0; i < ARRAY_SIZE(env->gicv5_cpuif.ich_ppi_active); i++) {
+        uint64_t en_pend_nact = env->gicv5_cpuif.ich_ppi_enable[i] &
+            env->gicv5_cpuif.ich_ppi_pend[i] &
+            ~env->gicv5_cpuif.ich_ppi_active[i];
+
+        while (en_pend_nact) {
+            uint8_t prio;
+            int ppi;
+            int bit = ctz64(en_pend_nact);
+
+            en_pend_nact &= ~(1ULL << bit);
+
+            ppi = i * 64 + bit;
+            prio = extract64(env->gicv5_cpuif.ich_ppi_priority[ppi / 8],
+                             (ppi & 7) * 8, 5);
+
+            if (prio < env->gicv5_cpuif.virt_ppi_hppi.prio) {
+                uint32_t intid = 0;
+
+                intid = FIELD_DP32(intid, INTID, ID, ppi);
+                intid = FIELD_DP32(intid, INTID, TYPE, GICV5_PPI);
+                env->gicv5_cpuif.virt_ppi_hppi.intid = intid;
+                env->gicv5_cpuif.virt_ppi_hppi.prio = prio;
+            }
+        }
+    }
+
+    trace_gicv5_recalc_virt_ppi_hppi(env->gicv5_cpuif.virt_ppi_hppi.intid,
+                                     env->gicv5_cpuif.virt_ppi_hppi.prio);
+}
+
 void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain)
 {
     /*
@@ -460,6 +499,7 @@ static void gic_ppi_cactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (gicv5_icv_access(env)) {
         value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
         env->gicv5_cpuif.ich_ppi_active[ri->opc2 & 1] &= ~value;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
         raw_write(env, ri, old & ~value);
@@ -473,6 +513,7 @@ static void gic_ppi_sactive_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (gicv5_icv_access(env)) {
         value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
         env->gicv5_cpuif.ich_ppi_active[ri->opc2 & 1] |= value;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
         raw_write(env, ri, old | value);
@@ -502,6 +543,7 @@ static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (gicv5_icv_access(env)) {
         value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
         env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] &= ~value;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
         raw_write(env, ri, old & ~value);
@@ -519,6 +561,7 @@ static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (gicv5_icv_access(env)) {
         value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
         env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] |= value;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
         raw_write(env, ri, old | value);
@@ -544,6 +587,7 @@ static void gic_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (gicv5_icv_access(env)) {
         value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
         env->gicv5_cpuif.ich_ppi_enable[ri->opc2 & 1] = value;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         raw_write(env, ri, value);
         gic_recalc_ppi_hppi(env);
@@ -610,6 +654,7 @@ static void gic_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
         uint64_t hvi_mask = gic_ppi_prio_hvi_mask(env, idx);
 
         env->gicv5_cpuif.ich_ppi_priority[idx] = value & ~hvi_mask;
+        gic_recalc_virt_ppi_hppi(env);
     } else {
         raw_write(env, ri, value);
         gic_recalc_ppi_hppi(env);
@@ -620,36 +665,42 @@ static void gic_ich_ppi_enable_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                      uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_ppi_pend_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_ppi_active_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                      uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_ppi_priority_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                        uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_ppi_dvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_ppi_hvi_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
     raw_write(env, ri, value);
+    gic_recalc_virt_ppi_hppi(env);
 }
 
 static void gic_ich_vctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index bf1803c8722..da25ec994cc 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -3,6 +3,7 @@
 
 # gicv5-cpuif.c
 gicv5_recalc_ppi_hppi(int domain, uint32_t id, uint8_t prio) "domain %d new PPI HPPI id 0x%x prio %u"
+gicv5_recalc_virt_ppi_hppi(uint32_t id, uint8_t prio) "virtual domain new PPI HPPI id 0x%x prio %u"
 gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt failed: %s"
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
 gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
-- 
2.43.0


