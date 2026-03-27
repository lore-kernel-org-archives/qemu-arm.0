Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F18310ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:20:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C2-0006m7-50; Fri, 27 Mar 2026 07:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bx-0006gA-MU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bv-0007yB-Dw
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-486fe2024a9so15112185e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610246; x=1775215046; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpR31boHFrDIOvEfT0ZIVwsIEVw9EEegLZSAQPBvMFc=;
 b=BqguwpEnLEBI9Fn1Va7HgOM9555THo9ldjumgnEPOry8w60VnvZRYcM8tMaVyw1fMf
 rO3aqS/j8+Fb3Q8V7c604txgesrULCBe9EPFmaCqP+6euFpN/FZyelIXhV00KlM7/fy2
 S0kjDATPdpYaPGlbCihw3NqLwKcPUrc1blqS0mXuAQxa/62ODBlzRNY9vqGm7b1Ly63Y
 aov20Dpw9nJef/UnP5XqShA2K9T6d7XHC6O+OtRp+uLQ7mKvJ5rjowEw0Fdl7r9SI6XC
 SM2YzFPHDWGK6aOYorFKmR0efTpBLfUc9pOEs0ZwOGgaISFFHL3PAJVkmm8yUI/VIW+1
 JIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610246; x=1775215046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JpR31boHFrDIOvEfT0ZIVwsIEVw9EEegLZSAQPBvMFc=;
 b=E75pRf+oNDmxJdaEtSh3DY227bbxizwINAzj+H440sASdSI+iR2fRSBjBw6qJ589/P
 gHkYs0W+3zWTn5Zp7VeEaLO4/ItRbUb2PxrOOTjDdMEO+F1XoNN4jOItoXmP1T2HFZGR
 bV68hdBqmEABvVGtMAuUvcTAcLUOCNEbl4cx9zl/Qy1Iu9LuDgcUvW8QqyOLAmhDUbz7
 QVpxd+ZJ1OFC9oQOE182KKfUh1zgqyhjTBLEHb/aC2vFhOaFS5iWIV3Ol2jEN0tbIeiC
 p97HCaL+PwXpDrZaAWL5Nk5e9c8Rd50TR1DHQjH9aA8OmpwGdGz0Jni4d6TQ6SGWQaUq
 S5cQ==
X-Gm-Message-State: AOJu0YwDCXsAiIwkD0LswJYwqkHgYIj+w0O6k/wKAonUH2orGH9z5A3h
 9GfWcqr6Ee1dVvKrTDTsLnRQozwUPLuIQAPvUq8+kke4HTzO+GTkqDKU7ZIpuzuA8dE2bzR5uju
 2/U0yHxc=
X-Gm-Gg: ATEYQzxuZ8gwgdqv7kc09Cb6RCywpJ36n+7ttGnprBwzb/KhYgRxcmFZlXrrH2aOjxi
 0ddiT4nhQzPhIrBeO8nId9XJhW6qAQ/f3FjHh9tdj2iMCuJA3zawm7WbzeAW6kB7HfmSpoC5KRN
 JxYRWsmFOYKjrXWjvt3LPOhj4UEMD+0/qK7qrvVbHo5QZT+XjvmuhqWC1qCQcEccwbo97bevSCr
 WPQ65QB6MsbClT6yT5VIccJl2jL6MmWCMtqrrMlE6M6wqrEvFDO/RRYZaxgUnnAkJQuVRfnhH4R
 GUDHATkb5FF2KJ+xVS+oExggeGtsvjSUHV8DXwn35e/LAGTBycK7ZdwtQFyrDkrWZ3iuFOcH32f
 uYIyND+kvJmRyhiR2RS9sKi4b8TFRxncfEZSBw2kNBQR8lp+GAcEnJxG1UfBi4/ZwatPC7aRibe
 fMjgjjbNTEitVyd4xODiw8GXIOekr2+oCj99yyQv/rAQZh8nH6A7ohDVvIO4909/ZjTKn/WObQ7
 s8w9qBa44zqi4uKsJ4neFgdjfnZbss=
X-Received: by 2002:a05:600c:46c5:b0:485:39d1:b4dd with SMTP id
 5b1f17b1804b1-48727ef0bcemr34056815e9.10.1774610245870; 
 Fri, 27 Mar 2026 04:17:25 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 25/65] hw/intc/arm_gicv5: Implement gicv5_request_config()
Date: Fri, 27 Mar 2026 11:16:20 +0000
Message-ID: <20260327111700.795099-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
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

Implement the gicv5_request_config() function, which corresponds to
the RequestConfig command and its RequestConfigAck reply.

We provide read_l2_iste() as a separate function to keep the "access
the in-guest-memory data structure" layer separate from the "operate
on the L2_ISTE values" layer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 102 +++++++++++++++++++++++++++++
 hw/intc/trace-events               |   1 +
 include/hw/intc/arm_gicv5_stream.h |  24 +++++++
 3 files changed, 127 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 9ca1826253..04d4391ae5 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -297,6 +297,19 @@ FIELD(L2_ISTE, HWU, 9, 2)
 FIELD(L2_ISTE, PRIORITY, 11, 5)
 FIELD(L2_ISTE, IAFFID, 16, 16)
 
+/*
+ * Format used for gicv5_request_config() return value, which matches
+ * the ICC_ICSR_EL1 bit layout.
+ */
+FIELD(ICSR, F, 0, 1)
+FIELD(ICSR, ENABLED, 1, 1)
+FIELD(ICSR, PENDING, 2, 1)
+FIELD(ICSR, IRM, 3, 1)
+FIELD(ICSR, ACTIVE, 4, 1)
+FIELD(ICSR, HM, 5, 1)
+FIELD(ICSR, PRIORITY, 11, 5)
+FIELD(ICSR, IAFFID, 32, 16)
+
 static MemTxAttrs irs_txattrs(GICv5Common *cs, GICv5Domain domain)
 {
     /*
@@ -713,6 +726,95 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
     }
 }
 
+static uint64_t l2_iste_to_icsr(GICv5Common *cs, const GICv5ISTConfig *cfg,
+                                uint32_t id)
+{
+    uint64_t icsr = 0;
+    const uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return R_ICSR_F_MASK;
+    }
+
+    /*
+     * The field locations in the L2 ISTE do not line up with the
+     * corresponding fields in the ICC_ICSR_EL1 register, so we need
+     * to extract and deposit them individually.
+     */
+    icsr = FIELD_DP64(icsr, ICSR, F, 0);
+    icsr = FIELD_DP64(icsr, ICSR, ENABLED, FIELD_EX32(*l2_iste_p, L2_ISTE, ENABLE));
+    icsr = FIELD_DP64(icsr, ICSR, PENDING, FIELD_EX32(*l2_iste_p, L2_ISTE, PENDING));
+    icsr = FIELD_DP64(icsr, ICSR, IRM, FIELD_EX32(*l2_iste_p, L2_ISTE, IRM));
+    icsr = FIELD_DP64(icsr, ICSR, ACTIVE, FIELD_EX32(*l2_iste_p, L2_ISTE, ACTIVE));
+    icsr = FIELD_DP64(icsr, ICSR, HM, FIELD_EX32(*l2_iste_p, L2_ISTE, HM));
+    icsr = FIELD_DP64(icsr, ICSR, PRIORITY, FIELD_EX32(*l2_iste_p, L2_ISTE, PRIORITY));
+    icsr = FIELD_DP64(icsr, ICSR, IAFFID, FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID));
+
+    return icsr;
+}
+
+static uint64_t spi_state_to_icsr(GICv5SPIState *spi)
+{
+    uint64_t icsr = 0;
+
+    icsr = FIELD_DP64(icsr, ICSR, F, 0);
+    icsr = FIELD_DP64(icsr, ICSR, ENABLED, spi->enabled);
+    icsr = FIELD_DP64(icsr, ICSR, PENDING, spi->pending);
+    icsr = FIELD_DP64(icsr, ICSR, IRM, spi->irm);
+    icsr = FIELD_DP64(icsr, ICSR, ACTIVE, spi->active);
+    icsr = FIELD_DP64(icsr, ICSR, HM, spi->hm);
+    icsr = FIELD_DP64(icsr, ICSR, PRIORITY, spi->priority);
+    icsr = FIELD_DP64(icsr, ICSR, IAFFID, spi->iaffid);
+
+    return icsr;
+}
+
+uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                              GICv5IntType type, bool virtual)
+{
+    GICv5 *s = ARM_GICV5(cs);
+    uint64_t icsr;
+
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_request_config: tried to "
+                      "read config of a virtual interrupt\n");
+        return R_ICSR_F_MASK;
+    }
+
+    switch (type) {
+    case GICV5_LPI:
+    {
+        const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
+
+        icsr = l2_iste_to_icsr(cs, cfg, id);
+        trace_gicv5_request_config(domain_name[domain], inttype_name(type),
+                                   virtual, id, icsr);
+        return icsr;
+    }
+    case GICV5_SPI:
+    {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_request_config: tried to "
+                          "read config of unreachable SPI %d\n", id);
+            return R_ICSR_F_MASK;
+        }
+
+        icsr = spi_state_to_icsr(spi);
+        trace_gicv5_request_config(domain_name[domain], inttype_name(type),
+                                   virtual, id, icsr);
+        return icsr;
+    }
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_request_config: tried to "
+                      "read config of bad interrupt type %d\n", type);
+        return R_ICSR_F_MASK;
+    }
+}
+
 static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 37ca6e8e12..409935e15a 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -240,6 +240,7 @@ gicv5_set_enabled(const char *domain, const char *type, bool virtual, uint32_t i
 gicv5_set_pending(const char *domain, const char *type, bool virtual, uint32_t id, bool pending) "GICv5 IRS SetPending %s %s virtual:%d ID %u pending %d"
 gicv5_set_handling(const char *domain, const char *type, bool virtual, uint32_t id, int handling) "GICv5 IRS SetHandling %s %s virtual:%d ID %u handling %d"
 gicv5_set_target(const char *domain, const char *type, bool virtual, uint32_t id, uint32_t iaffid, int irm) "GICv5 IRS SetTarget %s %s virtual:%d ID %u IAFFID %u routingmode %d"
+gicv5_request_config(const char *domain, const char *type, bool virtual, uint32_t id, uint64_t icsr) "GICv5 IRS RequestConfig %s %s virtual:%d ID %u ICSR 0x%" PRIx64
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index af2e1851c2..670423fdad 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -126,4 +126,28 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
 void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
                       GICv5RoutingMode irm, GICv5Domain domain,
                       GICv5IntType type, bool virtual);
+
+/**
+ * gicv5_request_config
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @domain: interrupt domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Query the current configuration of an interrupt; matches stream
+ * interface RequestConfig command from CPUIF to IRS and the
+ * RequestConfigAck reply to it.
+ *
+ * In the real stream protocol, the RequestConfigAck packet has the
+ * same information as the register but in a different order; we use
+ * the register order, not the packet order, so we don't need to
+ * unpack and repack in the cpuif.
+ *
+ * Returns: the config of the interrupt, in the format used by
+ * ICC_ICSR_EL1.
+ */
+uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                              GICv5IntType type, bool virtual);
+
 #endif
-- 
2.43.0


