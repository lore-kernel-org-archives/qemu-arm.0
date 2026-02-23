Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA81EC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:09:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZM0-0003gX-3a; Mon, 23 Feb 2026 12:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKx-0002cc-22
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKv-0000MS-5b
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48378136adcso27656295e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866187; x=1772470987; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t26rLo2yhfYJ9dll13VWciZB76X/o5OPoR5rYYX5ZFc=;
 b=OrGNT7xS5dwQuge3rAgF+MvXHdHakRHG/gZl89foBNDMFLsGRAEZQeBy85TwTOzFjL
 HvWiM4RUppt5SdJ5gCJFx2R8bVtOo8TVRoH3BuxVuYSpe3o7pL2XF9cNTm4l6//2sjyV
 KFwRhtt5M4Jsa5A4iSH2BVe5teX5GODz5ce8JBqIl0Q0F7Q1D01DT/z7p+/nFfJBzoCo
 xXgLzLWGviSop9G7UQe42SH3NPrW8IA47sOfTwbxDCc6qpUwuX37mT6a0NW0OyhrDTsy
 Y365+n7TsXYYlr16SpmZ81raEP6YH76QKXc06MvKnhodpbndTy+gjx+pcDsu0Qfgycuv
 SL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866187; x=1772470987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t26rLo2yhfYJ9dll13VWciZB76X/o5OPoR5rYYX5ZFc=;
 b=F76zErzr130PhA9hJ81408ip5qH8hZv3CyzvqfFLhnsJsgZWjuivthoCrNQ+5FFpQs
 E6dg/R4EUpEQR+HqYj2AZH/lr4+LlhnrfSA0O3YxJPIwKSBcYMRPEXVCbuavvIIMhCSp
 tQnvMPK8vGu4BTU9rT1IBJ+wHaLtHqM+AWec92jzH1+AiWQWc17t3DpSDyXa12Gv71md
 N6MWZT+bpL215LxoLWgNWQ8ZI1WCcMCdh1dSW2G3EojiQFirqieobLsMicqbPta2l8fp
 3BSpq1NBgyGYc4P7K01AVpJ+3Ga3i1tDfkpUN5Asf1fdSl7d3lSS/nAJmdwHlrINaOUT
 H52A==
X-Gm-Message-State: AOJu0YyZJ4gtm2rwxpCEhe9xC4yp6VJp32HOxM/lPe5AF9l06B2ZfLCK
 EpreLTQI1Ny+uR4FMyBOGbgt9E+6vVnBqsU0UG0kojPcODYdt44EY3ZDInLulUw7TWToWhehzMP
 qJh1H
X-Gm-Gg: AZuq6aJVnjs//T9r6Kjssf2MYFKkgXCL9JkcDxlFQ01/an5ebVPQ7oLIJ8LQ5+H6uzB
 5XXCzo4dyOjT6HInx1jldK3D5yADn9daUjI/OoSWBTiJxggcUrllF6UkX13iJCCetclSXkhRQDx
 2GcqW7STZgjqPgKCJDR5ULe7GF8EbC9YLyLKZh233As4lHX9HFlobvNt+SwioP5eRMJnKDneZuq
 ysa0vPaiDvkM7jBuP9T73LLyenxUMxYaLzp2p8VjzMPxOyNsw2MJDiMHekKV3xuZVu8MGtS2keX
 lD0tJehdzM0aQKxGeuDKV0kndv2jbtHxVKtQW3mf79dJcBSqspNBELUaA3q7FsKZC8Elb9Lxkd6
 hCeXsHiP3KC339rmeQmyQhy5s/si0iGG0J5EmoAWqT742UCqAj4ncXjWXkaZtKnSYUisXDxLErK
 4ptNb9thrRyAY18VQcbTGWX1exM4h3lKMe/Bx0rfDnqLwXHDdvQ0SAC9yxus8WX3oqUAZXXt0ah
 71cvdKIieplJeyBbC+CntiDLrW9LNo=
X-Received: by 2002:a05:600c:5020:b0:47a:814c:ee95 with SMTP id
 5b1f17b1804b1-483a95fc1d3mr164153605e9.12.1771866186705; 
 Mon, 23 Feb 2026 09:03:06 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 46/65] hw/intc/arm_gicv5: Implement Activate command
Date: Mon, 23 Feb 2026 17:01:53 +0000
Message-ID: <20260223170212.441276-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Implement the equivalent of the GICv5 stream protocol's Activate
command, which lets the cpuif tell the IRS to move its current
highest priority pending interrupt into the Active state, and to
clear the Pending state for an Edge handling mode interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 52 ++++++++++++++++++++++++++++++
 hw/intc/trace-events               |  1 +
 include/hw/intc/arm_gicv5_stream.h | 23 +++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 6cb81123e5..6636a66976 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1061,6 +1061,58 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     return icsr;
 }
 
+void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                    GICv5IntType type, bool virtual)
+{
+    const GICv5ISTConfig *cfg;
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+    uint32_t iaffid;
+
+    trace_gicv5_activate(domain_name[domain], inttype_name(type), virtual, id);
+
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_activate: tried to "
+                      "activate a virtual interrupt\n");
+        return;
+    }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_activate: tried to "
+                          "activate unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->active = true;
+        if (spi->hm == GICV5_EDGE) {
+            spi->pending = false;
+        }
+        irs_recalc_hppi(s, domain, spi->iaffid);
+        return;
+    }
+    if (type != GICV5_LPI) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_activate: tried to "
+                      "activate bad interrupt type %d\n", type);
+        return;
+    }
+    cfg = &s->phys_lpi_config[domain];
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ACTIVE, true);
+    if (FIELD_EX32(*l2_iste_p, L2_ISTE, HM) == GICV5_EDGE) {
+        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, false);
+    }
+    iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
+    put_l2_iste(cs, cfg, &h);
+
+    irs_recalc_hppi(s, domain, iaffid);
+}
+
 static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 6475ba5959..636c598970 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -241,6 +241,7 @@ gicv5_set_pending(const char *domain, const char *type, bool virtual, uint32_t i
 gicv5_set_handling(const char *domain, const char *type, bool virtual, uint32_t id, int handling) "GICv5 IRS SetHandling %s %s virtual:%d ID %u handling %d"
 gicv5_set_target(const char *domain, const char *type, bool virtual, uint32_t id, uint32_t iaffid, int irm) "GICv5 IRS SetTarget %s %s virtual:%d ID %u IAFFID %u routingmode %d"
 gicv5_request_config(const char *domain, const char *type, bool virtual, uint32_t id, uint64_t icsr) "GICv5 IRS RequestConfig %s %s virtual:%d ID %u ICSR 0x%" PRIx64
+gicv5_activate(const char *domain, const char *type, bool virtual, uint32_t id) "GICv5 IRS Activate %s %s virtual:%d ID %u"
 gicv5_spi_state(uint32_t spi_id, bool level, bool pending, bool active) "GICv5 IRS SPI ID %u now level %d pending %d active %d"
 gicv5_irs_recalc_hppi_fail(const char *domain, uint32_t iaffid, const char *reason) "GICv5 IRS %s IAFFID %u: no HPPI: %s"
 gicv5_irs_recalc_hppi(const char *domain, uint32_t iaffid, uint32_t id, uint8_t prio) "GICv5 IRS %s IAFFID %u: new HPPI ID 0x%x prio %u"
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 6850f03b74..7adb53c86d 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -151,6 +151,29 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
 uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
                               GICv5IntType type, bool virtual);
 
+/**
+ * gicv5_activate
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @domain: interrupt domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Activate the IRS's highest priority pending interrupt; matches
+ * the stream interface's Activate command.
+ *
+ * In the stream interface, the command has only the domain
+ * and virtual fields, because both the IRS and the CPUIF keep
+ * track of the IRS's current HPPI. In QEMU, we also have arguments
+ * here for @id and @type which are telling the IRS something that
+ * in hardware it already knows. This is because we have them to
+ * hand in the cpuif code, and it means we don't need to pass in
+ * an iaffid argument to tell the IRS which CPU we are so it can
+ * find the right element in its hppi[][] array.
+ */
+void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                    GICv5IntType type, bool virtual);
+
 /**
  * gicv5_forward_interrupt
  * @cpu: CPU interface to forward interrupt to
-- 
2.43.0


