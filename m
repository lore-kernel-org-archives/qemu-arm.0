Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D64A10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Cc-0007sD-AT; Fri, 27 Mar 2026 07:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CL-0007DC-PI
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CJ-0008Qs-Sy
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so1610317f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610270; x=1775215070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JOiLlKzr2TVNV+HAOZ57k8l0kQLTn+WAmtWxV5Vt4w=;
 b=Jp4xcvqAOdxLeEgAVvzTEP9uw0X7h36D6IY14yIoa2taEx3db9qek2pcQBjuw4QWov
 UMLN8GAbisHSz2l/EFbui48ckMw+I7HyGzdSLndxUnS8pSK4NbZlfW8gyo5gnFWWkY5a
 gkr2IJj03d8XWTWPnbk0EIqZd6Y02GGjRU1A2VM+XSyL0YExPo/cSW+/mAEEqd9LaPM+
 Ghz5zG2+kpV/EcxfllbqJJ7EQRcCtMFkSaypGUMT+7C9WbfKEF6WyeQq+9KO+geb2Prv
 lo/bG+zC1VWYQEhD0GDUYMBAXGs/3/wshr1akDdOqak3ZyRMhpHO3Uk9Y7glrqCYs1Ur
 Oe6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610270; x=1775215070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2JOiLlKzr2TVNV+HAOZ57k8l0kQLTn+WAmtWxV5Vt4w=;
 b=PH5PZ5/MSsfGYJBSTzz3+tLiMnPHJQrkzMeU8QN1frr6g+8N+YFi+aGFTMe7KcIpLh
 PXs9x8nr/nZvwVID+UnC78YwwkvXVbvHLxBt3KaN7bd7hm+1T4kTWhLEN6/HbOV5ic+K
 926nxYQYpiFLHh+kmBu4ck701mZ8e8YkHfw98LNsDoWqG98Rvol/aC+v8m8c8SFsDsrP
 k4gifXUJQ+6EO4B5Lrdi4KQ1Jwofe1QdMuS6wGSbsHyPiU/VE6QHnnIGnNtUXVwC8Z8b
 T5IINTwtYlk4NOw1yuYtSavSo60LSOpCicd6FXbCgyyEixB5wO4+UyB6JmV05jyQFa/2
 njAA==
X-Gm-Message-State: AOJu0YxnO4ZOZvMnUS1T80Ng5QQ6HOko2y/uT+Srg34YbqmWYyk7S2NL
 1GrbpEcbrogIGAVXKyOk3gUgm7lDph0qINDZ+JrQdlf2h8tdVK8oks0cWk+86lm3JkMDQkJJOL0
 YP0/EWO8=
X-Gm-Gg: ATEYQzwKZqyQaG+tIgf773L882BMT/r8nUxfJkCJVsTsdeup9tuT2y7UFyEMG0V8H0o
 Rxnt9xWnT5S97MYRhdk588d5BSAlNNnkFduLEA85fNAizpyqzeIy0ULNBvVPW9s4sfqQBx9LLxz
 spsOEBsLxLZkWGospWTpBHP30Ef1lk1hnA8EUEIqTnsFxR/baUMuw42b17xrXDDEvBWYgq4MKLj
 ise0uN90ztzZCdm780+NVmMeQ0z5NMdpzhHD2Q2MNaepQXl/lLq6ZlmgZgqh5Gjx69Q1Ptw2ckU
 zJWbMTYOrYYJ9P8Ndw1CoMaYTvyajNLQe60tvC3s+Pz/4WvEbFNM4zNrxK+Hc8E8UxAEVyXvXrs
 pwTi1udrpNhTA+4QKSRDJ9+5oBJ+vkawDchFaDjVeB83yJLJ9q8TeiOFwtAFYtmkTd+d68ko9cX
 aVvq2vacn5HzAxldxQD7DEYJcWdq6JB6ghKkrAO1rYRVr3py9hPGltHGCbwfaMkhlxheYVG9Q9X
 lZjGdGNBYj50WFvBDgBfWzG9eQZe4w=
X-Received: by 2002:a5d:5d10:0:b0:439:ae2a:755e with SMTP id
 ffacd0b85a97d-43b9e9a9785mr3446297f8f.23.1774610270251; 
 Fri, 27 Mar 2026 04:17:50 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 51/65] target/arm: GICv5 cpuif: Implement GIC CDDI
Date: Fri, 27 Mar 2026 11:16:46 +0000
Message-ID: <20260327111700.795099-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the GIC CDDI system instruction, which deactivates the
specified interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 target/arm/tcg/gicv5-cpuif.c | 49 ++++++++++++++++++++++++++++++++++++
 target/arm/tcg/trace-events  |  1 +
 2 files changed, 50 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index 0974637c92..94590bd765 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -17,6 +17,9 @@ FIELD(GIC_CDPRI, ID, 0, 24)
 FIELD(GIC_CDPRI, TYPE, 29, 3)
 FIELD(GIC_CDPRI, PRIORITY, 35, 5)
 
+FIELD(GIC_CDDI, ID, 0, 24)
+FIELD(GIC_CDDI, TYPE, 29, 3)
+
 FIELD(GIC_CDDIS, ID, 0, 24)
 FIELD(GIC_CDDIS, TYPE, 29, 3)
 
@@ -570,6 +573,47 @@ static void gic_cdeoi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     *apr &= *apr - 1;
 }
 
+static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * Clear the Active state of the specified interrupt in the
+     * current interrupt domain.
+     */
+    GICv5Common *gic = gicv5_get_gic(env);
+    GICv5Domain domain = gicv5_current_phys_domain(env);
+    GICv5IntType type = FIELD_EX64(value, GIC_CDDI, TYPE);
+    uint32_t id = FIELD_EX64(value, GIC_CDDI, ID);
+    bool virtual = false;
+
+    trace_gicv5_cddi(domain, value);
+
+    switch (type) {
+    case GICV5_PPI:
+    {
+        uint32_t ppireg, ppibit;
+
+        if (id >= GICV5_NUM_PPIS) {
+            break;
+        }
+
+        ppireg = id / 64;
+        ppibit = 1 << (id % 64);
+
+        env->gicv5_cpuif.ppi_active[ppireg] &= ~ppibit;
+        gic_recalc_ppi_hppi(env);
+        break;
+    }
+    case GICV5_LPI:
+    case GICV5_SPI:
+        /* Tell the IRS to deactivate this interrupt */
+        gicv5_deactivate(gic, id, domain, type, virtual);
+        break;
+    default:
+        break;
+    }
+}
+
 static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
     /*
      * Barrier: wait until the effects of a cpuif system register
@@ -627,6 +671,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
         .writefn = gic_cdeoi_write,
     },
+    {   .name = "GIC_CDDI", .state = ARM_CP_STATE_AA64,
+        .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 0,
+        .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
+        .writefn = gic_cddi_write,
+    },
     {   .name = "GIC_CDHM", .state = ARM_CP_STATE_AA64,
         .opc0 = 1, .opc1 = 0, .crn = 12, .crm = 2, .opc2 = 1,
         .access = PL1_W, .type = ARM_CP_IO | ARM_CP_NO_RAW,
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
index fcb3106a96..c60ce6834e 100644
--- a/target/arm/tcg/trace-events
+++ b/target/arm/tcg/trace-events
@@ -6,3 +6,4 @@ gicv5_recalc_ppi_hppi(int domain, uint32_t id, uint8_t prio) "domain %d new PPI
 gicv5_gicr_cdia_fail(int domain, const char *reason) "domain %d CDIA attempt failed: %s"
 gicv5_gicr_cdia(int domain, uint32_t id) "domain %d CDIA acknowledge of interrupt 0x%x"
 gicv5_cdeoi(int domain) "domain %d CDEOI performing priority drop"
+gicv5_cddi(int domain, uint32_t id) "domain %d CDDI deactivating interrupt ID 0x%x"
-- 
2.43.0


