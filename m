Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A929ECC6B08
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:47:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY64-0003I2-OK; Tue, 13 Oct 2026 04:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3t-0008Hd-Dw
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3r-0007zr-Ie
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so23054725e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880838; x=1792485638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=VUDSzD4TunPAZw2/yTniSFjF4XVXwom+SGsmSd03A3E=;
 b=cjWB82rnhYfjA3kx8mGwPZFRywO7wNLCQTnPsfnjS76fH5WmN4xLq/LHP0anx1e5/H
 1h+svO9uwKW8WPY9sg11rFEYFn94/ysURI1iAmmkKOFdHxhanRjbllzXo9XI8VLEJ0XJ
 FsYIUicSm8Co2Hqr2yFrhy8qlsSJSAzcmEf2Uxmarv+zYMO+aX1r+hDEQ0Wu97ooPnNe
 q4L7JsoAeuehTcv6ayi45UzouLHKCmDDHP6JrjGKZlFi15lM4eLTU44n1bauyTFtnRUE
 StsCVfDjv0pSHFv6OJvuv0z9yCquvaYwZnX1VKwHTruVFw8dAmT83cwZunmB3Ie2NVRU
 ZTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880838; x=1792485638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=VUDSzD4TunPAZw2/yTniSFjF4XVXwom+SGsmSd03A3E=;
 b=RnoI71pNll45s0h70GlStYp0d+TXJ1MiuZON+9hZOejxdOQmSRoQtkSvJpbHP4phIF
 9hBD+34ZLLJHShQM9qFMemwElW0VvZ3URltLhoWtlejiDiIh7HRSSKN/zl4liF3zpown
 T3lKxgKkowPcj0ANTpMuQF4sI/SnFxZlg30NfYTAEF2IANCgHpcctclzz3EN/wbLFH1y
 LBCD7e0DEa7GnGAdVJhFPfJ8OR/OGFl2PNjLR8Y8Cwttzg+D5CTWB/ATx2CLo7ePqjwU
 OFLjYdoAcpHT0OG/R00Wab/7KhweQC0dz4xwdWI/88QBfwyWSjX94Rcl8JSdnw03gj/V
 psgA==
X-Gm-Message-State: AFq9FYLkK5Ecipu5iZNll2pFXKzcB5pU8qM/BwyjhSe9s8991JzrvjbU
 JLsmjkaiUZUzPbRJ06FBsIZ9jHiCCiE5pXiP6v2ALgK6osRgrnVXfhf8paY5nptfjoahH+AAIUs
 h8q1vzXA=
X-Gm-Gg: AYBFou3E6oBXOHi03SDpqi05cHxs09DMPZk2ohzIXjXxoIhlUVpKMJoRjPrZwHxm1TB
 kLRpMqrRXgaD6sGXbuuaZQbnoOr1R/s//oTCHYG+uXGAygQxz8owXl7mvuKbJAjcBNVwLWmNMh4
 zyLIg2k3uPDfEx1YB0Tu4aloK1wQvmMD3JIgaQYktMto52727KzVWxjdr7Hz0cZifSEni6MlS2T
 cT7onxNvBiNDbSuEXWMFIt15u2rc7V3K4/oT20iKdIc6jmng9wOC5lZ9DyTkHTCHVWFxjJEdnNz
 I8YUnq7DXhoqxc0xDW1bz9hJJC3uB5jt18WYyFCvBDkLoqLGpFehD5D6GcIT0xwpRxIGgn/xXr+
 C8ZzDcgYm5ETF1d9QSu3GQiwFDnhGeF0+kPE8o9omSZo4xznYpdb/kCGrKsFCh7LQdaArrS3QId
 CYcjCsrtxN6lqJvs9wQEuaWRYL5R/Nx9HWdo6Ga83ez9A8DJAvyAWcMy9eESQ9T143aPkR52H7/
 E7qdvT3+4Bm5Bc8pVQFnnGLQW/3QZvdZjh9IWUz9nY5kpiaKL/YaSl6hyroHxnlja7WrfMbjP1n
 h0g=
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id
 5b1f17b1804b1-4a18e493048mr213062555e9.8.1791880837968; 
 Tue, 13 Oct 2026 01:40:37 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 45/86] target/arm: GICv5 cpuif: Handle PPI injection in vPPI
 pending writes
Date: Tue, 13 Oct 2026 09:38:52 +0100
Message-ID: <20261013083933.1024405-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

In this commit we update the logic for writes to the virtual PPI
pending state by the guest using the PPI_CPEND or PPI_SPEND registers
to honour the DVI registers, so that the pending state of the
underlying physical PPI is updated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 69 ++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index cdde759bf41..5a2927faf75 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -816,16 +816,61 @@ static uint64_t gic_ppi_pend_read(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 }
 
+static uint64_t gic_ppi_vpend_to_ppend(CPUARMState *env,
+                                       uint64_t value, int reg)
+{
+    /*
+     * Given a mask of bits which are virtual PPI pending bits being
+     * changed, output the mask of bits which are to be changed in the
+     * physical PPI pending state, by adjusting them for the the timer
+     * PPI redirection.  We require that the input value has already
+     * had the bits masked out for vPPIs that are not direct-injected.
+     */
+    if (reg == 0 && (arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV) {
+        if (arm_is_secure_below_el3(env)) {
+            /* vPPI 20 is pPPI 30; vPPI 19 is pPPI 27 */
+            if (value & (1 << 20)) {
+                value |= 1 << 30;
+            }
+            if (value & (1 << 19)) {
+                value |= 1 << 27;
+            }
+        } else {
+            /* vPPI 26 is pPPI 30; vPPI 28 is pPPI 27 */
+            if (value & (1 << 26)) {
+                value |= 1 << 30;
+            }
+            if (value & (1 << 28)) {
+                value |= 1 << 27;
+            }
+        }
+        value &= ~((1 << 26) | (1 << 28));
+    }
+    return value;
+}
+
 static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
+    int reg = ri->opc2 & 1;
     /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
-    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[reg];
     value &= ~hm;
 
     if (gicv5_icv_access(env)) {
-        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
-        env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] &= ~value;
+        uint64_t dvi_mask = gic_virt_dvi_mask(env, reg);
+
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[reg];
+
+        /* Update state for non-injected virtual PPIs */
+        env->gicv5_cpuif.ich_ppi_pend[reg] &= ~(value & ~dvi_mask);
+        /* Update state for injected PPIs */
+        value &= dvi_mask;
+        value = gic_ppi_vpend_to_ppend(env, value, reg);
+        if (value) {
+            env->gicv5_cpuif.ppi_pend[reg] &= ~value;
+            gic_recalc_ppi_hppi(env);
+        }
         gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
@@ -837,13 +882,25 @@ static void gic_ppi_cpend_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void gic_ppi_spend_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                 uint64_t value)
 {
+    int reg = ri->opc2 & 1;
     /* If ICC_PPI_HMR_EL1[n].HM is 1, PEND bits are RO */
-    uint64_t hm = env->gicv5_cpuif.ppi_hm[ri->opc2 & 1];
+    uint64_t hm = env->gicv5_cpuif.ppi_hm[reg];
     value &= ~hm;
 
     if (gicv5_icv_access(env)) {
-        value &= ~env->gicv5_cpuif.ich_ppi_hvi[ri->opc2 & 1];
-        env->gicv5_cpuif.ich_ppi_pend[ri->opc2 & 1] |= value;
+        uint64_t dvi_mask = gic_virt_dvi_mask(env, reg);
+
+        value &= ~env->gicv5_cpuif.ich_ppi_hvi[reg];
+
+        /* Update state for non-injected virtual PPIs */
+        env->gicv5_cpuif.ich_ppi_pend[reg] |= (value & ~dvi_mask);
+        /* Update state for injected PPIs */
+        value &= dvi_mask;
+        value = gic_ppi_vpend_to_ppend(env, value, reg);
+        if (value) {
+            env->gicv5_cpuif.ppi_pend[reg] |= value;
+            gic_recalc_ppi_hppi(env);
+        }
         gic_recalc_virt_ppi_hppi(env);
     } else {
         uint64_t old = raw_read(env, ri);
-- 
2.43.0


