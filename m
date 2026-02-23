Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AED5EC1114
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZM1-0003uN-JK; Mon, 23 Feb 2026 12:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL5-0002lB-4i
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKz-0000OW-3I
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:15 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4833115090dso43823225e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866191; x=1772470991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GhPKdeTRx8a+qCF0Q4nn5hRHL81i7jRy0/h8QpUlh60=;
 b=IhsYiE8VPtAC03VFotnJ3LDEb7oR4pL50VBnSw4P9gXD8DO9I9v4FHXKo1cwqONOPG
 ZdOqe9zFoDgliiHgHOgDUUhbEVALKeVDpUo9TPoKBA4K5rC6VD8F+Gxd9jULKuEpw1OD
 LcFnSOg00R2CO/jJRQ2ouEhHpRymr7R6m58mxNiTCFUkXE2kA8DnapJ+VvQPwasfL0uM
 Udb6Tj/p6LpanR9Q9dAumQb8ZDlve4yBtA91GzLsQOfzwM0xQ1ziCVSfZGPqcv3wOUZR
 UPcUsU6OovZNd+xoltZ2X6YMdv5OUdfS7LM6KmWMtZ88ZnV+Zxw4vHlJFqfnFyYgfeHu
 QmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866191; x=1772470991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GhPKdeTRx8a+qCF0Q4nn5hRHL81i7jRy0/h8QpUlh60=;
 b=Fhfd7xFIUSkLvFKcKy60THkfxoBZLb0nM4DG29HV+8yesaXb8z82TRxMVMg+n9NBf4
 S+1ry3R67+/U2U6+WEDcnnZGKHISm3MSgpH7i5s3EwkK/MdSf5g1tFQd71Qik9X+mn75
 neKkBX25eT4qeb1UkDu4S3EuG1gvmYrvENohq90tXlEsx5O3zfdhDqYbelrbNrD22VXW
 5GOYe+UboMzKBXwUTa2nhLIiVY8z4LqqStJBoD6SixOXiQRh5Ro5RiD7V44d214DFJ2b
 3HrvOqr4V+nNkI3vE9k5uMuJg+KCp69ZHREKckI9t5Zcf80lnN3QKsLX8w2oPwIKeETX
 oMJQ==
X-Gm-Message-State: AOJu0YzoQ5ghCwwcYkn9GRzDjjIaYl/KNxjmezAhHlbnGgYY0ZoWDIuL
 LQioF0BLG2Pt82o8v1hDa3m6YGdYizzIbbZTESsU+YOvi9d7rzIgwwW5fgXUvoNLQsfwBbzDjvB
 skWs9
X-Gm-Gg: AZuq6aJMNzWCgSYLrn9/R0OFImQKWpfghF4Tz5T4Bp8kXxFkjfuoSPmYSVDELMwtRaQ
 rzUvDe+39iKCVa6cM9/EQOVY+Vsp9slhOu7I+SZaOEldSx2b/yIW3B3wBDxskHVvOmiROSge1be
 lfFv8jyvwJeA17AM/7PG3NfQvurHJAKQBlJglM9GGDHYKojvuuOiAfOSIxCjUqgPm4mv1d3/5Qe
 ZSD5Uu0XbbJ75OdCGF68I0BnnQkb56Ojq0xxUZ1IL5+sZRYtZKzACMucJSQYBRZTt/bUR7izfpE
 sSvYrW8OXQig9wLJZvrw7D8AbMIG3jOMo5DfOYvVt0PVFv6Be//EQBNCtcDQ5o2c1Ew3fcH2/u3
 aSDa3GxF5O+IRCN07bsYb6++ZAkK+Spvq73TWZ0bfmN+wDngE3yX5k4Ctf4ZwqpTtbfzduQ64v3
 ldezXdHqKBKlNyOFHlu7HL7qex99631hOLrE02h7KZAD8aRCT6oAB5LJMLS0TB9s6bKyjm4sWlb
 AZ0PpTnP2GKPtrcxqc+aeUHuNeIvpyyr9vZdPFgtw==
X-Received: by 2002:a05:600c:1386:b0:483:887:59b0 with SMTP id
 5b1f17b1804b1-483a960c879mr192253665e9.35.1771866190910; 
 Mon, 23 Feb 2026 09:03:10 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 50/65] target/arm: GICv5 cpuif: Implement GIC CDDI
Date: Mon, 23 Feb 2026 17:01:57 +0000
Message-ID: <20260223170212.441276-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the GIC CDDI system instruction, which deactivates the
specified interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/gicv5-cpuif.c | 49 ++++++++++++++++++++++++++++++++++++
 target/arm/tcg/trace-events  |  1 +
 2 files changed, 50 insertions(+)

diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index c830938bdc..02129d5936 100644
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
 
@@ -572,6 +575,47 @@ static void gic_cdeoi_write(CPUARMState *env, const ARMCPRegInfo *ri,
     *apr &= *apr - 1;
 }
 
+static void gic_cddi_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * Clear the Active state of the specified interrupt
+     * in the current interrupt domain.
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
@@ -629,6 +673,11 @@ static const ARMCPRegInfo gicv5_cpuif_reginfo[] = {
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


