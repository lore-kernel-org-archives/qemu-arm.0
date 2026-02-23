Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A24CEC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKe-0002LO-JA; Mon, 23 Feb 2026 12:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKc-0002I8-8y
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:50 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKZ-0000E9-Md
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4362507f0feso2836241f8f.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866166; x=1772470966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A4hIy6Kcu/S1hR9Ar9eqjjFF1c+deS8g8DeFKzdYWAM=;
 b=HUeFNmkGKpfMKKJ6SEsY5yyuiRBZDsyYz684Los8NW+Tsj/+a9i4gW2NbVW3GiNs6x
 VIa6rmBI0/N4DEc5u+ozKcofhzqAgQ51yniH4J/aooCNEAehypt0u3RbHbYx+OApdKrK
 NNfH6xcqQRWHcZcznRVwO3PcNe2ue8fvao9HULgRVNB+FMQc+axl7m1qYtm73YURWV2V
 In4ZxGmp8dkuVJ08tkcQCzLLmyQi+d1ld3AWAjOeWadnlKEN0DcMrVN0kUe3SLX3TjHT
 8pc+uufbot/f8p0t4TozW5Wa8VMD6BeiyIUbgFWfpmGTKvmhh9AyU9J7rlOyZVnHNoQ0
 wUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866166; x=1772470966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=A4hIy6Kcu/S1hR9Ar9eqjjFF1c+deS8g8DeFKzdYWAM=;
 b=dXj1jupjIpTGLjgYKYulEArg5VZqYOXMU+rJy+CYxRcnVU3rhU0DA71ZScOlkTihJS
 71R6av45rGleT9dG3gMOdAzRIlA4AdDlvQrMS3cEkKaUJCifLFfRz4sTbmOE/I4iZr7f
 XRnFh6dOwdIOJALg66hbXNjeiZMY2KTK8x6/ps/qkmKxzN0sDCI8+23lvcmmPosVr1XJ
 rWMovBEBjKNMF17NE2EWyf7RjecUoxCpeG9Z6MG9Q1MMHb4REd6lyK6tK1IXyl2COaeW
 4wvPhk2wHjOHp0gZ/0MuckijyYOtS6vXO3FzDQGNK7T2gqGEzTqq1YVEujPfMsu+MKRb
 Cjwg==
X-Gm-Message-State: AOJu0YwpHAIW0ZP11SCQMPQbh+meEI43bbFB7pxXqDprABpVmkav6D1b
 xvYQg1J40Dq9rwINVRWU6CwoVbWEiA3r76ONNJMbUUEW39xLoPEl43GmOL72pTST0l1DwLD6RQ7
 Kpxh3
X-Gm-Gg: AZuq6aI9YeKjHkXWLmj90jTVYkjllMug+iVE15sJ0HEOzuPJuuL+iWdAeVlE50bzHva
 4459+FC+sB+RyLhA5fn2IwMoIDh0Pza8+kqMUjgwaK5TtmPbFVPDQ8JQHlechoENRi+5DiUaR2a
 0ogSVIgzN/JZd+ODzQPtgoWYOGt1e1IdLoGIywHKZSy1tgwpVebWTZLGH8M//WiLuhLYOrto4uQ
 us+BPas9AWsRi/WCS0Ikzb9GQyNEVeU5VWdP7gkUV0jU+lYlMCbiz6zJiLaFt0wEUf2ShKqMdey
 Mno6o9X8xm05fLG88vxaba9w+mfNSJtIFCYQeYNwPZmM5GjBviLFkRWMqBhscDqd/kVXF4y7EE2
 ykY/DQkruhP+Ky/5NA2WKsVev2XEZ9sNepytko6ixwtOsVrZH35mpWz3Epz+4SIFZenF6Efp0Gx
 2Gi6M9ykuWfp/ZTLv8OKMJLjADhs81FHb+OmvPxu5bnkI2vOn0ibtPhJUG1ubX4gedxY9S68Vh7
 7DM7d/JYz+pPwzfpKJOGdPTQj97Ec0Q49/KCw1wJQ==
X-Received: by 2002:a05:600c:3b0a:b0:47e:e2ec:9947 with SMTP id
 5b1f17b1804b1-483a963df7amr151995955e9.33.1771866165623; 
 Mon, 23 Feb 2026 09:02:45 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/65] hw/intc/arm_gicv5: Update SPI state for CLEAR/SET events
Date: Mon, 23 Feb 2026 17:01:34 +0000
Message-ID: <20260223170212.441276-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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

When an SPI irq line changes level, this causes what the spec
describes as SET_LEVEL, SET_EDGE or CLEAR events.  These also happen
when the trigger mode is reconfigured, or when software requests a
manual resample via the IRS_SPI_RESAMPLER register.

SET_LEVEL and SET_EDGE events make the interrupt pending, and update
its handler mode to match its trigger mode.  CLEAR events make the
interrupt no longer pending.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c  | 59 ++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events |  1 +
 2 files changed, 60 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 9f4d44f975..d1baa015d1 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -908,6 +908,28 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     }
 }
 
+static void spi_sample(GICv5SPIState *spi)
+{
+    /*
+     * Sample the state of the SPI input line; this generates
+     * SET_EDGE, SET_LEVEL or CLEAR events which update the SPI's
+     * pending state and handling mode per R_HHKMN.
+     * The logic is the same for "the input line changed" (R_QBXXV)
+     * and "software asked us to resample" (R_DMTFM).
+     */
+    if (spi->level) {
+        /*
+         * SET_LEVEL or SET_EDGE: interrupt becomes pending, and the
+         * handling mode is updated to match the trigger mode.
+         */
+        spi->pending = true;
+        spi->hm = spi->tm == GICV5_TRIGGER_EDGE ? GICV5_EDGE : GICV5_LEVEL;
+    } else if (spi->tm == GICV5_TRIGGER_LEVEL) {
+        /* falling edges only trigger a CLEAR event for level-triggered */
+        spi->pending = false;
+    }
+}
+
 static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
                          uint64_t *data, MemTxAttrs attrs)
 {
@@ -1055,7 +1077,24 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
     {
         GICv5SPIState *spi = spi_for_selr(cs, domain);
         if (spi) {
+            GICv5TriggerMode old_tm = spi->tm;
             spi->tm = FIELD_EX32(data, IRS_SPI_CFGR, TM);
+            if (spi->tm != old_tm) {
+                /*
+                 * R_KBPXL: updates to SPI trigger mode can generate CLEAR or
+                 * SET_LEVEL events. This is not the same logic as spi_sample().
+                 */
+                if (spi->tm == GICV5_TRIGGER_LEVEL) {
+                    if (spi->level) {
+                        spi->pending = true;
+                        spi->hm = GICV5_LEVEL;
+                    } else {
+                        spi->pending = false;
+                    }
+                } else if (spi->level) {
+                    spi->pending = false;
+                }
+            }
         }
         return true;
     }
@@ -1068,6 +1107,17 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
             }
         }
         return true;
+    case A_IRS_SPI_RESAMPLER:
+    {
+        uint32_t id = FIELD_EX32(data, IRS_SPI_RESAMPLER, SPI_ID);
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (spi) {
+            spi_sample(spi);
+        }
+        trace_gicv5_spi_state(id, spi->level, spi->pending, spi->active);
+        return true;
+    }
     }
     return false;
 }
@@ -1236,8 +1286,17 @@ static void gicv5_set_spi(void *opaque, int irq, int level)
     /* These irqs are all SPIs; the INTID is irq + s->spi_base */
     GICv5Common *cs = ARM_GICV5_COMMON(opaque);
     uint32_t spi_id = irq + cs->spi_base;
+    GICv5SPIState *spi = gicv5_raw_spi_state(cs, spi_id);
+
+    if (!spi || spi->level == level) {
+        return;
+    }
 
     trace_gicv5_spi(spi_id, level);
+
+    spi->level = level;
+    spi_sample(spi);
+    trace_gicv5_spi_state(spi_id, spi->level, spi->pending, spi->active);
 }
 
 static void gicv5_reset_hold(Object *obj, ResetType type)
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 409935e15a..4c55af2780 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -241,6 +241,7 @@ gicv5_set_pending(const char *domain, const char *type, bool virtual, uint32_t i
 gicv5_set_handling(const char *domain, const char *type, bool virtual, uint32_t id, int handling) "GICv5 IRS SetHandling %s %s virtual:%d ID %u handling %d"
 gicv5_set_target(const char *domain, const char *type, bool virtual, uint32_t id, uint32_t iaffid, int irm) "GICv5 IRS SetTarget %s %s virtual:%d ID %u IAFFID %u routingmode %d"
 gicv5_request_config(const char *domain, const char *type, bool virtual, uint32_t id, uint64_t icsr) "GICv5 IRS RequestConfig %s %s virtual:%d ID %u ICSR 0x%" PRIx64
+gicv5_spi_state(uint32_t spi_id, bool level, bool pending, bool active) "GICv5 IRS SPI ID %u now level %d pending %d active %d"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
-- 
2.43.0


