Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6808A10ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:21:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C3-0006oF-PQ; Fri, 27 Mar 2026 07:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65C0-0006jy-Uc
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65By-00080V-Lr
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b611274bso1042783f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610249; x=1775215049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xoyJziqdU/nken6or35eJw+c9H0GsrA0zPSsjs/9kKo=;
 b=wfEpRQj4+ZOWYQ/QpxkjZZo21umgPIEahwTvgyCVul4CY72Y1FKsDaIHW8FCQCBfYm
 THzE4jrJmrcrx4XS84j0ecrmmSXPeEypgW/5LGia0sADvV1J1TFoWeLSYT3cvDXrzPkF
 WSIJ6lWlskUr9jqLAZ5CQQND10SXbe8CJE5hjY3R4WHftGLK8274CiURaEWmVx73p6w3
 hOF3VVdxja0xF1K4cJon+39PNachpbWzwBSguvxfDxcI64P77LwHZDxaum6jGmOFahjX
 6RgI6jcyUNdQzhlpUtWk7hmxzUlh34ZiDd+meEiuxq3fG+eph15quS29e30+c0ugjuwR
 FEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610249; x=1775215049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xoyJziqdU/nken6or35eJw+c9H0GsrA0zPSsjs/9kKo=;
 b=idrdjik/qH60+KC37S1s/5L7n4WyBj/k178nOgNXt6nL7sA71Est8bclsz2gdlzdoz
 OA0W6noGJ+/ZiYWHPxs5JV+usEPnKuNUJ9lFnuPfjVOU7EVB0Fy5aQ1oUwjtjJb00AG+
 ZNTFLPlS4Rw6EFThm3QGPmIFWL2hhM6w0LHZa+snhTsPZlVXCkwBb5REIrl1IW4MbUHN
 VemdAyO4msjTLzq0fseSAklwx3MY600TxzG3QKcpIl1j9N1Hnx/yqjVHVsNpJtXV0LMZ
 11VQMwSmw6kaOwh8X9db6tDEx6IVtgx45tFGd0rECuk6Zvm8FJvpsVtsLmthvZt6jcFx
 sePg==
X-Gm-Message-State: AOJu0Yzieu75TGtOPAVmrWrS7HtijASkzNsHvnx/Av7QKWG3PJIqqfcF
 EPuFncG0ggKxKFJbgZR53yHZUzXLeP6ElA57coqSoybeLZDbG9/XNIu2CKoOIZ9WBeIRjRDO3iG
 gpJ2RMAQ=
X-Gm-Gg: ATEYQzw5/3eZl/aXQEBNGoGzkLgxQ9xT8FqWEVuYk3Nwp959Rxt91Ux9/tqjDL4zzL0
 TuUM56Blil/FSA0HopHx9kApl/TBsBwoRSPlDyfmeY6HTWwboAuR0w6LlnbJxRl+QaS+JeryCwP
 QYUAbkNefR/S2h9iJBpp8kkdbAVzoVkut/WtBsATYiQ9P2aOWEPQIN2TgnXik+5ta9l8PK4TJhi
 UQGrq/l84KrdnA/tYNY2qTZhIlsB10AaqmSqO0s31F8lXaEBjN0yuXm/1q/toL2jN4HseeKwrcD
 uFZZnCln5ikkCoOhrdWzefC7zfXn9NJIuBnTJ2asuY+bY+rbVcbs0iSV6EQk1CcnDs4z8SDHRKT
 GAFnSxPvfpTMzshXmydbZy3au9ApItJDTIYL225feto55XZkkC3R0pidmPPYl/ER4+pM8lf7Owj
 2yHRaxEB2RhyYZ57TNFmIbzJr4HJTCmUQqNoP/cVVZFthM4CejtxA3xGEPf3430bGywNwfHYY5+
 NV0BsHXXu7oPSW/+OjrF3LkvoVaMbSGB251QP/riw==
X-Received: by 2002:a05:6000:220c:b0:439:ca7b:f4b with SMTP id
 ffacd0b85a97d-43b9ea77996mr3253924f8f.50.1774610248816; 
 Fri, 27 Mar 2026 04:17:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 28/65] hw/intc/arm_gicv5: Update SPI state for CLEAR/SET
 events
Date: Fri, 27 Mar 2026 11:16:23 +0000
Message-ID: <20260327111700.795099-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

When an SPI irq line changes level, this causes what the spec
describes as SET_LEVEL, SET_EDGE or CLEAR events.  These also happen
when the trigger mode is reconfigured, or when software requests a
manual resample via the IRS_SPI_RESAMPLER register.

SET_LEVEL and SET_EDGE events make the interrupt pending, and update
its handler mode to match its trigger mode.  CLEAR events make the
interrupt no longer pending.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c  | 59 ++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events |  1 +
 2 files changed, 60 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 6ff3a79745..bc887233f5 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -946,6 +946,28 @@ static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     }
 }
 
+static void spi_sample(GICv5SPIState *spi)
+{
+    /*
+     * Sample the state of the SPI input line; this generates
+     * SET_EDGE, SET_LEVEL or CLEAR events which update the SPI's
+     * pending state and handling mode per R_HHKMN.  The logic is the
+     * same for "the input line changed" (R_QBXXV) and "software asked
+     * us to resample" (R_DMTFM).
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
@@ -1096,7 +1118,24 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
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
@@ -1109,6 +1148,17 @@ static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
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
@@ -1259,8 +1309,17 @@ static void gicv5_set_spi(void *opaque, int irq, int level)
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


