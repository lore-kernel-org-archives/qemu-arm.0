Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF4CC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY3t-0008I2-Kx; Tue, 13 Oct 2026 04:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3d-0007Zs-VD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3b-0007v4-2I
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48c4649b3aaso1620526f8f.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880819; x=1792485619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TU9O2PphfR7CT0QZAlJlY1ptLb1SjIOU0zHbyiVZJU0=;
 b=vpATv28NVfUTRvU28iRznrh9Xt7wr3znJNShYpb/Zw/yUCfsV4V4UwHlnKS9bB8pSq
 Qsjs3hCpGx05l2T99wZN3PhZpOKQrT968+fXQAv3xDefG6pVC9+LpbXxzpRhvZR5riTc
 XWJDw7XSzWsSdVBH3Pf4X7wSI3BF42skf5EKCdHFWHTCu8Ogx4Ef79OfnCPhN/KnUk+A
 kgtKJF8L3zbXWfrqswws+jUv5HL/gfX+/4iuu6FWpOt+h+S6LQEz4wCruLbdROh+g0/t
 TL6xGx0RHEddAq4UkPvTfbMyw+mLiw2F5S4FPTxKqfJRiKWrrXSZs3X8f3j+xT62Xsjy
 zlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880819; x=1792485619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=TU9O2PphfR7CT0QZAlJlY1ptLb1SjIOU0zHbyiVZJU0=;
 b=AayYDqp2uXiPmEFe5/u/cOrKdIo+mjcd8o8tA6cr/Z8dlN4Ohqg6/HtCc0gAv+EiG9
 DDKvoN5uef1m1tJI0X14tut/VZAp0yUUFbrjwepyzhzQsjFajxKOwxIeqAeqzK97OZaT
 zXL3nLSCHWhYSwKzy/yXwQwN9lW2iFq79Qh/eJ+kN/Z/e5cPJFFrJ4ERc+06P8o2gXmu
 VTbIKs66Y5a+FfcolbZlvvJ5XAMmw0DxC/GVzd2z8jDa+Lo3Sxhvoc5s8z3GHOKSyOng
 g2Dr2t/kfcL0oaavUaPK4Phk43WGVbTHkdI5WX1YNXAKx561KQDEnln/a+B5FqXonmZc
 9PIw==
X-Gm-Message-State: AFq9FYIpOoVmNwP1veT+6Q+z9RGU2ysQQ5GOugyDb+RaVKfsogA42FEO
 9L8Axdv9vOs0atL3SibEeZC3T9VdaKvGaNLeL9Hf49Z6NmA5vF2VYA5vc7v1FhJAJ46Yl9xP+/M
 EoN9ADCM=
X-Gm-Gg: AYBFou1rOGYvkMg6U5moinLHESqSjjbiSdX8V/ENt/xMgmke+BOpqH6LLULiu3LG8uj
 hLOks+i6wNc2NPpyvuAFXKOI230gT3BIPV/NQFaWxVALmondof8ZR/wDciN9KXsVcliCekjCcwl
 n+v0Q34FD00YrBbOX5AsKXp+pRmtqLYhAGMnc/hXSuluG0bTpp/C3OsQPjt7PBZPOWBRaor6+7l
 FiKa/tsIgRxGoIqmvYOgnTYMOrqFljvAj/CFMnYuzyCOZONkSwSgQGShuxgIShSWDyjswQmO28e
 i5afkFac4AESphJAe6veGCj8SFIptA3YV9swA9i8G1HLvdiJxQK9TSQpGolkhBowCaRRNcod8G+
 b8/UawQ9Hq9UdKXFJ92VhzK6LPE/bG4NhHOhXmTq0ePjLe+UVpO62fRwoay5uPLKA/jHYvwx1mr
 XAFN3E1ogOPHQG/julXwdfYzKgeDNY1AZrzB357f0HBMTClVMeG/+cs+k0/kZsJgSrzm+QiBMAW
 mZV16M40jDGmADeBLYnc4ctCclNgRrwkErre0fP3sBSxY5gynudHctP6F9+Q21zyCk52fkmlEUA
 TEU=
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id
 5b1f17b1804b1-4a19a9cf1e6mr109315605e9.30.1791880819403; 
 Tue, 13 Oct 2026 01:40:19 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/86] target/arm: GICv5 cpuif: Add virtual support to
 IRS/cpuif HPPI APIs
Date: Tue, 13 Oct 2026 09:38:39 +0100
Message-ID: <20261013083933.1024405-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The APIs between the IRS and the cpuif for the IRS to tell the CPU
that it has a new HPPI candidate and for the CPU to ask the IRS what
its current HPPI candidate is do not currently allow for
virtualization.  Extend them to allow the IRS to tell the CPU about
the candidate virtual HPPI and for the CPU to ask about the candidate
virtual HPPI, using an extra 'virtual' parameter.

This commit implements the CPU side of this interface, where a new
virtual HPPI candidate makes us reevaluate our VIRQ/VFIQ status.  As
the IRS does not yet implement virtualization, it will always respond
"no interrupt" when asked about the current virtual HPPI candidate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 14 +++++++++++---
 include/hw/intc/arm_gicv5_stream.h |  6 ++++--
 target/arm/tcg/gicv5-cpuif.c       | 11 ++++++++---
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index a362349e5ed..f714add1406 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -495,7 +495,7 @@ static void irs_recalc_hppi(GICv5 *s, GICv5Domain domain, uint32_t iaffid)
      *    the cpuif asks for the current HPPI when it needs it
      *  - the cpuif does not cache the HPPI on its end
      */
-    gicv5_forward_interrupt(cpu, domain);
+    gicv5_forward_interrupt(cpu, domain, false);
 }
 
 static void irs_recalc_hppi_all_cpus(GICv5 *s, GICv5Domain domain)
@@ -526,16 +526,24 @@ static void irs_recall_hppis(GICv5 *s, GICv5Domain domain)
 
     for (int i = 0; i < cs->num_cpus; i++) {
         s->hppi[domain][i] = GICV5_PENDING_IRQ_NONE;
-        gicv5_forward_interrupt(cs->cpus[i], domain);
+        gicv5_forward_interrupt(cs->cpus[i], domain, false);
     }
 }
 
 GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
-                               uint32_t cpuidx)
+                               bool virtual, uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
 
     assert(cpuidx < cs->num_cpus);
+
+    if (virtual) {
+        /*
+         * Until we implement virtualization there is never
+         * an available virtual HPPI candidate.
+         */
+         return GICV5_PENDING_IRQ_NONE;
+    }
     return s->hppi[domain][cpuidx];
 }
 
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 641f3d0f499..21be859a233 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -180,6 +180,7 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
  * gicv5_forward_interrupt
  * @cpu: CPU interface to forward interrupt to
  * @domain: domain this interrupt is for
+ * @virtual: true if this is a virtual interrupt for the resident VPE
  *
  * Tell the CPU interface that the highest priority pending interrupt
  * that the IRS has available for it has changed.  This is the
@@ -198,12 +199,13 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
  * HPPI info via a function call, so we do not need to pass it across
  * here.
  */
-void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain);
+void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain, bool virtual);
 
 /**
  * gicv5_get_hppi
  * @cs: GIC IRS to query
  * @domain: interrupt domain to act on
+ * @virtual: true to ask for the virtual HPPI for the resident VPE
  * @cpuidx: IRS CPU index of this CPU interface
  *
  * Ask the IRS for the highest priority pending interrupt that it has
@@ -211,7 +213,7 @@ void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain);
  * protocol is the outstanding interrupt sent with a Forward packet.
  */
 GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
-                               uint32_t cpuidx);
+                               bool virtual, uint32_t cpuidx);
 
 /**
  * gicv5_deactivate
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 0d38ed7b15b..5d0d599ddd5 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -170,7 +170,7 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
         return GICV5_PENDING_IRQ_NONE;
     }
 
-    irs_hppi = gicv5_get_hppi(gic, domain, env->gicv5.cpuidx);
+    irs_hppi = gicv5_get_hppi(gic, domain, false, env->gicv5.cpuidx);
 
     /*
      * If the best PPI and the best interrupt from the IRS have the
@@ -337,13 +337,18 @@ static void gic_recalc_virt_ppi_hppi(CPUARMState *env)
                                      env->gicv5_cpuif.virt_ppi_hppi.prio);
 }
 
-void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain)
+void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain, bool virtual)
 {
     /*
      * IRS HPPI has changed: recalculate the IRQ/FIQ levels by
      * combining the IRS HPPI with the PPI HPPI.
+     * If this is a virtual interrupt, do similarly for VIRQ/VFIQ.
      */
-    gicv5_update_irq_fiq(&cpu->env);
+    if (virtual) {
+        /* Here we will eventually update the VIRQ/VFIQ state */
+    } else {
+        gicv5_update_irq_fiq(&cpu->env);
+    }
 }
 
 void gicv5_update_ppi_state(CPUARMState *env, int ppi, bool level)
-- 
2.43.0


