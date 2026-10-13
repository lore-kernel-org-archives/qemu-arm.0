Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51845CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:45:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3h-0007lJ-CF; Tue, 13 Oct 2026 04:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3U-0007Cc-8i
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3P-0007qP-DM
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1552999f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880809; x=1792485609; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=FFC15qOUGo6FRd9B9ir9SIKtB3uGsFYdGz30HW4TUIA=;
 b=iBvi8H5MTLisa1CT1iKBA4CFphXdTKf3g9D3EUwY4GjzyFzKQE/F/JaDDgR0Ptp1H0
 x9F5GiaYrtrgcaQ54mEdtCzZAzUK/FlQ+qLw9HHoChEAs8BKRXc3XwiGItugkglZcjD9
 CJ5Abv7EjHCqMmg3SuUlhRpG4ooet0j6eQ56GJecq+XuytgbaJu56HtaFLA18jqG+lJ4
 0GQJMREo6mxLdbtypbbZUkqEVDGodyyuIjaud/7dGnSeafcGp1CI+pF3Fqer7cm66a/F
 KtMCFdfniVlw6RvS5//NZIBeWO8dyOLPzD/BOHT7Q/q0YIoHOIpoq1h10YNTjcpnTmAG
 sgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880809; x=1792485609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=FFC15qOUGo6FRd9B9ir9SIKtB3uGsFYdGz30HW4TUIA=;
 b=BAuN+NU9/nchvdzYNXAY44HroTg561Q1fXVjDc7TSNKLlincONhPeSXAVuQZHMqSqe
 MmCgdX56LY+QYj8HBdNEu6AwcId4rWJUa92BXRa34ulxLLFXK/pP17TQVWaifsY3wlUK
 rZh8qAtnqYRzrDimTiABoS44lrULRcpoIzbEedU2vkUvpiwI7XJvZfL5V+1A84fILHEC
 vcr/g/kb28D5ht8eO4S1LnYyWyA25Osymy6zK3Ciu7JuJQFxd41HVi7JkZRmHJW7ej5z
 IXctnkCxFQnmc+o7T2eqpHXrkn1/eOBt1ocu5y53vTXZLxS/garv6l+58AQgvkjNVce9
 cUHw==
X-Gm-Message-State: AFq9FYLll4o15e6j86rbBBDT3DIK5D6oOi8D9JQjWo8JcMzY2ludUF8u
 P/fjBfai4neUEeEkgQjdlR+WGZ8E1FasGDuhfJfGllcGPnxlLh9sBjbpaCpmalRxZgR2m/11Wpe
 qwI8rs3g=
X-Gm-Gg: AYBFou1CQ2Kyn0phGoJbtgW99wIXyMoDFbbKem3NuOnl8fHvKEgHtIF+e14vRSxtnhy
 QMP9bWP7cgoFplb4+DV/1oKQpg6mXHZ0ruTWBl3+XGbcz2iF0Ey/1Im7pVRrybVf1GH/beHacri
 CeEgQrPUSpuaDirc44qooEvQG2NB9o5+1l+1OHscsxw5zKEs5uN4LAoM61SzRkdb/kYkJt4EdHF
 P4S8rYIW8fETBXXEf9vdmeXg/xGarvCjRvUc/hzlT1+AusLFf19VMjgVvbIe+J3wSrw9eZwowpO
 2gzknKVuiaZHNEGu1mqkelFWlRkNHSD7JrCkl4xeNQ7LRxvNKC210HDhplAEw49nlopzPLP5EdU
 CPK6LZFycsF7aNYLyvzUZjn7OlYesWuu2K4yICipiE8BBnu/Uq7Hq8ANw1olZzHg8x+vs/gKiDX
 nH4i/+SLqsBletu1wpZlXChd3/eSnqkAtcySSZpbO1wJ2VGzfUSQWd0wIBwgEkCrHl/1Cb9kjgM
 T7ERPNZTl3iGpIyIs0I/sK6FSZoD54vEaI/Z70ocokoFp8e/WmZgI3COUqPYlIStnxoPOGOgVq0
 kcQ=
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id
 5b1f17b1804b1-4a18e4a7839mr250549645e9.25.1791880807540; 
 Tue, 13 Oct 2026 01:40:07 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/86] target/arm: GICv5 cpuif: Implement ICV_CR0_EL1
Date: Tue, 13 Oct 2026 09:38:31 +0100
Message-ID: <20261013083933.1024405-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the redirection of the ICC_CR0_EL1 encoding to the
hypervisor guest's view ICV_CR0_EL1.  This has only one bit in it,
the enable (EN) bit, which is stored in ICH_VMCR_EL2.EN at the
same bit location (0).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 41 +++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index b183c8a6e79..247cefd9e68 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -67,6 +67,9 @@ FIELD(ICC_HPPIR_EL1, ID, 0, 24)
 FIELD(ICC_HPPIR_EL1, TYPE, 29, 3)
 FIELD(ICC_HPPIR_EL1, HPPIV, 32, 1)
 
+FIELD(ICH_VMCR_EL2, EN, 0, 1)
+FIELD(ICH_VMCR_EL2, VMPR, 27, 5)
+
 /*
  * We implement 24 bits of interrupt ID, the mandated 5 bits of priority,
  * and no legacy GICv3.3 vcpu interface (yet)
@@ -564,24 +567,38 @@ static void gic_icc_apr_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 /* ICC_CR0_EL1 is also banked */
 static uint64_t gic_icc_cr0_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    GICv5Domain domain = gicv5_logical_domain(env);
-    return env->gicv5_cpuif.icc_cr0[domain];
+    if (gicv5_icv_access(env)) {
+        /* ICV_CR0_EL1 has only an EN bit, stored in ICH_VMCR_EL2.EN */
+        return FIELD_EX64(env->gicv5_cpuif.ich_vmcr_el2, ICH_VMCR_EL2, EN);
+    } else {
+        GICv5Domain domain = gicv5_logical_domain(env);
+        return env->gicv5_cpuif.icc_cr0[domain];
+    }
 }
 
 static void gic_icc_cr0_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    /*
-     * For our implementation the link to the IRI is always connected,
-     * so LINK and LINK_IDLE are always 1. Without EL3, PID and IPPT
-     * are RAZ/WI, so the only writeable bit is the main enable bit EN.
-     */
-    GICv5Domain domain = gicv5_logical_domain(env);
-    value &= R_ICC_CR0_EN_MASK;
-    value |= R_ICC_CR0_LINK_MASK | R_ICC_CR0_LINK_IDLE_MASK;
+    if (gicv5_icv_access(env)) {
+        /* Only the EN bit is writeable, and it lives in ICH_VMCR_EL2 */
+        uint64_t vmcr = env->gicv5_cpuif.ich_vmcr_el2;
 
-    env->gicv5_cpuif.icc_cr0[domain] = value;
-    gicv5_update_irq_fiq(env);
+        vmcr = FIELD_DP64(vmcr, ICH_VMCR_EL2, EN,
+                          FIELD_EX64(value, ICC_CR0, EN));
+        env->gicv5_cpuif.ich_vmcr_el2 = vmcr;
+    } else {
+        /*
+         * For our implementation the link to the IRI is always connected,
+         * so LINK and LINK_IDLE are always 1. Without EL3, PID and IPPT
+         * are RAZ/WI, so the only writeable bit is the main enable bit EN.
+         */
+        GICv5Domain domain = gicv5_logical_domain(env);
+        value &= R_ICC_CR0_EN_MASK;
+        value |= R_ICC_CR0_LINK_MASK | R_ICC_CR0_LINK_IDLE_MASK;
+
+        env->gicv5_cpuif.icc_cr0[domain] = value;
+        gicv5_update_irq_fiq(env);
+    }
 }
 
 static void gic_icc_cr0_el1_reset(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.43.0


