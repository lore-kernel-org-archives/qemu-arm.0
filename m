Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA07EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKc-0002Im-Ef; Mon, 23 Feb 2026 12:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKX-00022i-Gk
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKU-0000BM-W1
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:45 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso57997205e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866161; x=1772470961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JwcHn/CjQkHfmGibiCn3O/oR20qiscSiOE7DixcXUno=;
 b=koUW8Bm6HpEIgmKd7iGUuxLP8gWo04L+z+ItyRcgppHs+p4uQEfNRqjbPVZV+NfXIL
 ssgXW+ux76Ag4M0wIJf87esyDcjN5xUboQKYxZzuYj2qd24NC1xXecaidCj5BKgzmP1A
 SdOcZ8kY8nHpZcpTj1Y4HRfVRD/+fRujGSEo2DSeQAB1ToQa8EA00Bb8pFyDOrTXZ8za
 BEGjlG8R4qS6OHHpMKzI7x3crZhXGyKD8o/aLdAtmtexnmJA6jPzEHgEf2R68gM8dNNe
 KBZpVoTfMC7ckBGCUE0rTPWYdCv9OnppJQPy2nEsnG3tWZhm3qLH8qHaYGssIriN357H
 7sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866161; x=1772470961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JwcHn/CjQkHfmGibiCn3O/oR20qiscSiOE7DixcXUno=;
 b=VWbrQbLFRJyeXProv7gHRknCFNFB8yXCdYC+fCLe9cCKeTawGqrxu02NFfLGSduuwy
 GlQSQnK6q28vC5H3VdSB7l6QwzM/5qx0AbzgJ/Qq2ToG7WjoFSpRqZGk0XRN97sZsxOu
 218w3h/iKoFYdFPdDWkf47J61wtry4VFJoq+T8Hjm6HD8ZfEaTE6gILqQz/ugThIhYo6
 tU9/9YE5w17S8e7icHLGhZkV1QKJTFzs8X5k2OSMhkZmEOgmwukafvifbFE1jdFboM+N
 6N1MsOJEXbuDQMStHERAKJjLfZPhA1yPoH9/CEATkZ0/HgX1Hzpm9nm4YMxfm5048MDB
 HGaw==
X-Gm-Message-State: AOJu0YyUbmNU9EIWQMlZlq4kA/EywaT1rnq0wNsJuGYDu4VM17OI4Ul4
 lbdp4J2cgKodXSUh+CbjEsuOtxmctePMmXUqh3p0+KcZsZPCo+k0BXwTMYpIIStxEGn697qlMGF
 nyPtZ
X-Gm-Gg: AZuq6aJ4FmI7Xi6jQisIonyx3xV9RRfGxHt6Td6pmDioD5byUkr7C9+PrtbR4NF3k+S
 oNWxCDcjvpf/s+mWe+T6kE4WUEC06G2UoK2seBbuqRoSyz7D1y+GDtN9bu2ZvTMSWEO42Pc5ZWB
 fVgyE/vuVVbfU8ALUpZTm6c8O6+lCXkS32aquozRMZIiKmZHkhYFtYBq37Y+5B/yNbJKXa16bPQ
 zp83YGZC6dIT+kAZak3P1dBHS0XGkSSTNu+PuNRo89u1/iReYE58Vu2195v4dazA543I0Z179fB
 z4gugbqzy/SULyiDOq4byXlnLyDKpwSzYLnIPotAb+dgDUkoYr3OfeudztPW1dL8k31zIsTBEaI
 FgiW8lRRvrZONqX5uAxdhRdD8LANv7XH+Bk9DbITXQXZgCmRp6wEXjKv3YNoUv6fNgUe47twC5N
 u5U/PFobZO7jzE0dN7m8lfNbD0Ezy5hzKm7uRTGnHN2CYpSeU/oX2eXLevES1lMySwkrCp3qqfc
 Sz+B0Q8h2L9NUI5wrgAGNgP72k1ag8=
X-Received: by 2002:a05:600c:3147:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-483a962e3e2mr138417725e9.22.1771866161175; 
 Mon, 23 Feb 2026 09:02:41 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/65] hw/intc/arm_gicv5: Make gicv5_set_* update SPI state
Date: Mon, 23 Feb 2026 17:01:30 +0000
Message-ID: <20260223170212.441276-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The GIC CD* insns that update interrupt state also work for SPIs.
Instead of ignoring the GICV5_SPI type in gicv5_set_priority() and
friends, update the state in our SPI state array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 59 ++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_common.h | 40 ++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 3c6ef17573..4d99200122 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -478,6 +478,18 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
                       "priority of a virtual interrupt\n");
         return;
     }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_priority: tried to set "
+                          "priority of unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->priority = priority;
+        return;
+    }
     if (type != GICV5_LPI) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_priority: tried to set "
                       "priority of bad interrupt type %d\n", type);
@@ -508,6 +520,18 @@ void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
                       "enable state of a virtual interrupt\n");
         return;
     }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_enabled: tried to set "
+                          "enable state of unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->enabled = true;
+        return;
+    }
     if (type != GICV5_LPI) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_enabled: tried to set "
                       "enable state of bad interrupt type %d\n", type);
@@ -538,6 +562,18 @@ void gicv5_set_pending(GICv5Common *cs, uint32_t id,
                       "pending state of a virtual interrupt\n");
         return;
     }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_pending: tried to set "
+                          "pending state of unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->pending = true;
+        return;
+    }
     if (type != GICV5_LPI) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_pending: tried to set "
                       "pending state of bad interrupt type %d\n", type);
@@ -568,6 +604,17 @@ void gicv5_set_handling(GICv5Common *cs, uint32_t id,
                       "handling mode of a virtual interrupt\n");
         return;
     }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_handling: tried to set "
+                          "priority of unreachable SPI %d\n", id);
+        }
+
+        spi->hm = handling;
+        return;
+    }
     if (type != GICV5_LPI) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_handling: tried to set "
                       "handling mode of bad interrupt type %d\n", type);
@@ -607,6 +654,18 @@ void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
          * IRM=1 the same as IRM=0.
          */
     }
+    if (type == GICV5_SPI) {
+        GICv5SPIState *spi = gicv5_spi_state(cs, id, domain);
+
+        if (!spi) {
+            qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
+                          "target of unreachable SPI %d\n", id);
+            return;
+        }
+
+        spi->iaffid = iaffid;
+        return;
+    }
     if (type != GICV5_LPI) {
         qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
                       "target of bad interrupt type %d\n", type);
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index c29eab2951..1a1d360c68 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -191,4 +191,44 @@ static inline bool gicv5_domain_implemented(GICv5Common *cs, GICv5Domain domain)
  */
 const char *gicv5_class_name(void);
 
+/**
+ * gicv5_raw_spi_state
+ * @cs: GIC object
+ * @id: INTID of SPI to look up
+ *
+ * Return pointer to the GICv5SPIState for this SPI, or NULL if the
+ * interrupt ID is out of range. This does not do a check that the
+ * SPI is assigned to the right domain: generally you should call it
+ * via some other wrapper that performs an appropriate further check.
+ */
+static inline GICv5SPIState *gicv5_raw_spi_state(GICv5Common *cs, uint32_t id)
+{
+    if (id < cs->spi_base || id >= cs->spi_base + cs->spi_irs_range) {
+        return NULL;
+    }
+
+    return cs->spi + (id - cs->spi_base);
+}
+
+/**
+ * gicv5_spi_state:
+ * @cs: GIC object
+ * @id: INTID of SPI to look up
+ * @domain: domain to check
+ *
+ * Return pointer to the GICv5SPIState for this SPI, or NULL if the
+ * interrupt is unreachable (which can be because the INTID is out
+ * of range, or because the SPI is configured for a different domain).
+ */
+static inline GICv5SPIState *gicv5_spi_state(GICv5Common *cs, uint32_t id,
+                                             GICv5Domain domain)
+{
+    GICv5SPIState *spi = gicv5_raw_spi_state(cs, id);
+
+    if (!spi || spi->domain != domain) {
+        return NULL;
+    }
+    return spi;
+}
+
 #endif
-- 
2.43.0


