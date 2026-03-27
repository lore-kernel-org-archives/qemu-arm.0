Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9BD10ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Cd-0007vC-3F; Fri, 27 Mar 2026 07:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CL-0007DB-OP
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:55 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CI-0008QU-VY
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so1919509f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610269; x=1775215069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JG5oo7kntdhv/cYWN2Y9FsfLDawmXg1ppysqyGtbv/k=;
 b=lB+TXjh6BeOVtLdAh1nb2bZOtVtDQoCRTrVizaYCYa8Bas85DAt2E316ogN9u/Poa4
 ai/GWPPbyvwLrGXsFUfrHyxvhrDfbOWODQLITrqLqULyxWrjTBvHrCp9pMeFq7oaR5HJ
 F8Lu0DFNRhAh97LxDnUBrTRe3jlh0wnpM+Vzj9d/AuPz8D36bq0BAN/xeG6tomvZFtpP
 66apGzafIB9UmTrcW9nmDDpIFFSk6P912pCyz/9dWaKR/SMJM144Y5AMqpid5sWzPCYM
 K7zYbhXiv9ljiDzQrPlWS30GYVJFXg2z4MKDRMYhqvV8qA9EPtK78NeWIrDCQnrzvNfH
 oEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610269; x=1775215069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JG5oo7kntdhv/cYWN2Y9FsfLDawmXg1ppysqyGtbv/k=;
 b=ceYZSAydjpSW7BhQoPOOFMW6erpiVWpEBbxH7F5Ggyk/oTqROzb/X/ogl1mYmtdE6L
 z7WGgfQZQzsH21+287oPCh2ycs7+bPpKFBG9bX1zjxyItcC77QcZsVHAGZb6S5HnoSci
 M0SM+6z9f2HiaKZCXCHrYUGVDyYgSiIss3sc+9J778DzGFk3qb33uOz+4J3VhSoOmGPx
 xvtDKAFGaj2uPaabzDFvSaNoAWdL9gBHuX5f458forKp4jWqANHMkFmrmUXxAToQ4j9j
 Zvv84cNi5Y9tMWk0f8TPCqoiC1+dElzl374b65yGZHZO6s/DlwDorYx8+mbOklyL0m8w
 QWDQ==
X-Gm-Message-State: AOJu0YzwGSJJRvcyZF9OBOi5GUtqpR9bvBYgW2wctGYXRJ1pSjum0OyT
 MyV94l2SghWQ1oDUpxXwX8zJR82SuBgbphyoE8fW1a+jn9lPIfPRUItJwBIKOk6XlAIcogP+bxr
 2UcWgxWQ=
X-Gm-Gg: ATEYQzwoMDs+kn1YOTfW7D3wBFW5ljaIo6GkU0ed045D3XgihuiqSa2DyDB6VNF1A9a
 d1/dXfA55MH0v/WnAw5DYpOtsTW7AB8wkrqCanZHZX6y/1p9JVXAgc09/w8rbeZpimBTEtWLmbz
 l0AOxJk4/IuFTS4s9OBvS9wBxZd0SD3SR870O7iRjw+/joMuR8t4vMGT4KrA3oSQK39ozizs8eD
 qI10edshQf+6aIuJ7J3ok065u02wUJhNiQLFwqyNxSgIpqliv5HMr+Ot8D3cLlf7lJ5UtZlWPzd
 m758wWzjGlL7tm6fugSyLq8CM4bDFCaXWBIRF+T2Ph/oG/7Pb/jFcaNipuuW8GABjJKzY5iBuTP
 KJtH+mhfs71iIDfL/rrTejWG6I6+WN1OyusXUJqcmoETAfHPmvTKYeKBh45b/l9V7+eIkMablIE
 jJkxs2GBV6uotvLheIxQ4KOaGb/iJuwfwu6vLIzQ1S721iQ3r2FsxIJiZ1o7C4pUpQZ1jtta35q
 Nl6etglkbUd4M7iDICFQ9qEtGsGhFA=
X-Received: by 2002:a05:600c:8b31:b0:485:30f7:6e88 with SMTP id
 5b1f17b1804b1-48727efabdemr40350685e9.31.1774610269446; 
 Fri, 27 Mar 2026 04:17:49 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 50/65] hw/intc/arm_gicv5: Implement Deactivate command
Date: Fri, 27 Mar 2026 11:16:45 +0000
Message-ID: <20260327111700.795099-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Implement the equivalent of the GICv5 stream protocol's Deactivate
command, which lets the cpuif tell the IRS to deactivate the
specified interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c                | 52 ++++++++++++++++++++++++++++++
 hw/intc/trace-events               |  1 +
 include/hw/intc/arm_gicv5_stream.h | 14 ++++++++
 3 files changed, 67 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 942f3eba2e..493d664625 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1153,6 +1153,58 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     irs_recalc_hppi(s, domain, iaffid);
 }
 
+void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                      GICv5IntType type, bool virtual)
+{
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t iaffid;
+
+    trace_gicv5_deactivate(domain_name[domain], inttype_name(type), virtual, id);
+
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_deactivate: tried to "
+                      "deactivate a virtual interrupt\n");
+        return;
+    }
+
+    switch (type) {
+    case GICV5_LPI:
+    {
+        const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
+        L2_ISTE_Handle h;
+        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+
+        if (!l2_iste_p) {
+            return;
+        }
+        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ACTIVE, false);
+        iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
+        put_l2_iste(cs, cfg, &h);
+        break;
+    }
+    case GICV5_SPI:
+    {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_deactivate: tried to "
+                          "deactivate unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->active = false;
+        iaffid = spi->iaffid;
+        break;
+    }
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_deactivate: tried to "
+                      "deactivate bad interrupt type %d\n", type);
+        return;
+    }
+
+    irs_recalc_hppi(s, domain, iaffid);
+}
+
 static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 636c598970..c6696f0e0a 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -242,6 +242,7 @@ gicv5_set_handling(const char *domain, const char *type, bool virtual, uint32_t
 gicv5_set_target(const char *domain, const char *type, bool virtual, uint32_t id, uint32_t iaffid, int irm) "GICv5 IRS SetTarget %s %s virtual:%d ID %u IAFFID %u routingmode %d"
 gicv5_request_config(const char *domain, const char *type, bool virtual, uint32_t id, uint64_t icsr) "GICv5 IRS RequestConfig %s %s virtual:%d ID %u ICSR 0x%" PRIx64
 gicv5_activate(const char *domain, const char *type, bool virtual, uint32_t id) "GICv5 IRS Activate %s %s virtual:%d ID %u"
+gicv5_deactivate(const char *domain, const char *type, bool virtual, uint32_t id) "GICv5 IRS Deactivate %s %s virtual:%d ID %u"
 gicv5_spi_state(uint32_t spi_id, bool level, bool pending, bool active) "GICv5 IRS SPI ID %u now level %d pending %d active %d"
 gicv5_irs_recalc_hppi_fail(const char *domain, uint32_t iaffid, const char *reason) "GICv5 IRS %s IAFFID %u: no HPPI: %s"
 gicv5_irs_recalc_hppi(const char *domain, uint32_t iaffid, uint32_t id, uint8_t prio) "GICv5 IRS %s IAFFID %u: new HPPI ID 0x%x prio %u"
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 7ac24f0f09..3cc9f61155 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -211,4 +211,18 @@ void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain);
 GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
                                uint32_t iaffid);
 
+/**
+ * gicv5_deactivate
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Deactivate the specified interrupt. There is no report back of
+ * success/failure to the CPUIF in the protocol.
+ */
+void gicv5_deactivate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
+                      GICv5IntType type, bool virtual);
+
 #endif
-- 
2.43.0


