Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27881EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:09:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKX-00020n-6S; Mon, 23 Feb 2026 12:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKV-0001wP-Vn
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:44 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKS-0000AN-4W
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so36480325e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866159; x=1772470959; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jYvTvJG/7tvhpdlK87g5RK3IBoj9LMlQcWK3SacPSog=;
 b=s8feSO4dY64TAIcE/+s6igbqIlnkRV7QiAP4qg4zdv0zqgAZyPMw3XTZV7pzeLOidv
 2Yg/oVnVE5HovGwSi7M3DSFl/IIcJiQqBxcVJHVXI70b67Yj9X4geSxHGkcZyEf7fs5G
 rEKb8S5abD5pdYfkGZfqjvYUtG1FDevP5/VZ+tfcCyyOBpRVnZYkdsPh720yqbhH5z/z
 v36WoVD2mWBEXYM6bhNNMBxdcBzpJMNYPwB3vFk6cFB8eQyrnoc1x6vDyM6AiFtb9UTm
 ONKWQQIZshDUjemeXkw7ZJqvFpYHohvgd+pVVrFAMWLL+FrEnE3QkvMZ9hFHrTL2orSw
 uo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866159; x=1772470959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jYvTvJG/7tvhpdlK87g5RK3IBoj9LMlQcWK3SacPSog=;
 b=Rf16RN3Le3k3gINeORLU5CvXcWkmo6QSlnj2s7fIYnNJ6e0+Fxd5dejzf/MwG9GYie
 Lh5Gtf7ctHcFuZzWG+OcfGMAI2VIi0bCbsp/6iHagtGI08BIdlJltI3Ldj9BFpw+SAk2
 lxPgHm6LENbsXTYmYTyv6+KPnyWK1QaHzDQNgCrH9WymLjB0XTmEIzfMpPx9zFSszdI2
 MKFostZ0Faqxx7Hkwf0wrQMMKpAqQ8Nmoh+3AVyeWwl3DDhGYuH6TmCQl3zH9Nwebh25
 /f3hgjBJJXOad/NWUDoczwu0AZJp04n4H1Q2NtJuuOaV5HqC0sFrZyDR8ckZ7ItATspi
 bjKQ==
X-Gm-Message-State: AOJu0YyR9ptKw0zL0BYWIDP0Bu865rC5SCv8tHopbcIZY5dNvV9+2REM
 pctEB2EHHqS/HMvfQTmNFJLppdyf2N62zD+kuCtmo+Smc+Um+sYUpHfE+rha2byFwwLDsDc+WV5
 Th4q4
X-Gm-Gg: AZuq6aKIB0fuDhfyFjk38BS4Lqspu5M1jmSeTKPYWJ+K43pC+7exQNgNICwnmekR8yF
 bYgcv2mx55pyRRTbHp+NzUVBHezZg3dKlPndXyL1os7egAjMyxMToEn0xiYVNoSemfaQWFS5aos
 7WPoWlyZgJhLMpOkG2drE6gz/oYzuixuU6q1iKH6wuUkTBE4scmY0TdoGqt5mgpXyjWkHtZhHt2
 63pBsQ209xU5kcb0DN5pF7Abw8Ml8ATji6nXOntnrapTcZh4m/gxjVo2TniJIV7gbV67kox7/8q
 OyPBSD2o4tbktmCxXDsuQpj0AxJXNxy8OJv5pZq6W0bFuwqbxhKMb/0nitR5HwktUfspOnsSkvc
 doWFzg00VbmeyG0gUXaw2WdXK97P+rvDXaCF7wgXXfUTWQnsHvKJplULnTg3+NAcexgh7Hravfh
 YsEIY570dpWmJVZqd44x4vqA5JAVAEhMVTVFFtuupYaxoecmxgtet9qR55B4Vk1ckeTHjVVKCSe
 3NNmx1imcc7646Lie099iCSQmqSEYQ=
X-Received: by 2002:a05:600c:1d1c:b0:480:4a90:1afd with SMTP id
 5b1f17b1804b1-483a94a99e4mr143926575e9.0.1771866158504; 
 Mon, 23 Feb 2026 09:02:38 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/65] hw/intc/arm_gicv5: Implement remaining set-config
 functions
Date: Mon, 23 Feb 2026 17:01:27 +0000
Message-ID: <20260223170212.441276-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Implement the GICv5 functions corresponding to the stream protocol
SetEnabled, SetPending, SetHandling, and SetTarget commands.  These
work exactly like SetPriority: the IRS looks up the L2TE and updates
the corresponding field in it with the new value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 133 +++++++++++++++++++++++++++++
 hw/intc/trace-events               |   4 +
 include/hw/intc/arm_gicv5_stream.h |  68 +++++++++++++++
 include/hw/intc/arm_gicv5_types.h  |  15 ++++
 4 files changed, 220 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index af27fb7e63..3c6ef17573 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -492,6 +492,139 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
     put_l2_iste(cs, cfg, &h);
 }
 
+void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
+                        bool enabled, GICv5Domain domain,
+                        GICv5IntType type, bool virtual)
+{
+    const GICv5ISTConfig *cfg;
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+
+    trace_gicv5_set_enabled(domain_name[domain], inttype_name(type), virtual,
+                            id, enabled);
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_enabled: tried to set "
+                      "enable state of a virtual interrupt\n");
+        return;
+    }
+    if (type != GICV5_LPI) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_enabled: tried to set "
+                      "enable state of bad interrupt type %d\n", type);
+        return;
+    }
+    cfg = &s->phys_lpi_config[domain];
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ENABLE, enabled);
+    put_l2_iste(cs, cfg, &h);
+}
+
+void gicv5_set_pending(GICv5Common *cs, uint32_t id,
+                       bool pending, GICv5Domain domain,
+                       GICv5IntType type, bool virtual)
+{
+    const GICv5ISTConfig *cfg;
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+
+    trace_gicv5_set_pending(domain_name[domain], inttype_name(type), virtual,
+                            id, pending);
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_pending: tried to set "
+                      "pending state of a virtual interrupt\n");
+        return;
+    }
+    if (type != GICV5_LPI) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_pending: tried to set "
+                      "pending state of bad interrupt type %d\n", type);
+        return;
+    }
+    cfg = &s->phys_lpi_config[domain];
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, pending);
+    put_l2_iste(cs, cfg, &h);
+}
+
+void gicv5_set_handling(GICv5Common *cs, uint32_t id,
+                        GICv5HandlingMode handling, GICv5Domain domain,
+                        GICv5IntType type, bool virtual)
+{
+    const GICv5ISTConfig *cfg;
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+
+    trace_gicv5_set_handling(domain_name[domain], inttype_name(type), virtual,
+                            id, handling);
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_handling: tried to set "
+                      "handling mode of a virtual interrupt\n");
+        return;
+    }
+    if (type != GICV5_LPI) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_handling: tried to set "
+                      "handling mode of bad interrupt type %d\n", type);
+        return;
+    }
+    cfg = &s->phys_lpi_config[domain];
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, HM, handling);
+    put_l2_iste(cs, cfg, &h);
+}
+
+void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
+                      GICv5RoutingMode irm, GICv5Domain domain,
+                      GICv5IntType type, bool virtual)
+{
+    const GICv5ISTConfig *cfg;
+    GICv5 *s = ARM_GICV5(cs);
+    uint32_t *l2_iste_p;
+    L2_ISTE_Handle h;
+
+    trace_gicv5_set_target(domain_name[domain], inttype_name(type), virtual,
+                           id, iaffid, irm);
+    if (virtual) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
+                      "target of a virtual interrupt\n");
+        return;
+    }
+    if (irm != GICV5_TARGETED) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
+                      "1-of-N routing\n");
+        /*
+         * In the cpuif insn "GIC CDAFF", IRM is RES0 for a GIC which does not
+         * support 1-of-N routing. So warn, and fall through to treat
+         * IRM=1 the same as IRM=0.
+         */
+    }
+    if (type != GICV5_LPI) {
+        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_set_target: tried to set "
+                      "target of bad interrupt type %d\n", type);
+        return;
+    }
+    cfg = &s->phys_lpi_config[domain];
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return;
+    }
+    /*
+     * For QEMU we do not implement 1-of-N routing, and so L2_ISTE.IRM is RES0.
+     * We never read it, and we can skip explicitly writing it to zero here.
+     */
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, IAFFID, iaffid);
+    put_l2_iste(cs, cfg, &h);
+}
+
 static void irs_map_l2_istr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 42f5e73d54..37ca6e8e12 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -236,6 +236,10 @@ gicv5_spi(uint32_t id, int level) "GICv5 SPI ID %u asserted at level %d"
 gicv5_ist_valid(const char *domain, uint64_t base, uint8_t id_bits, uint8_t l2_idx_bits, uint8_t istsz, bool structure) "GICv5 IRS %s IST now valid: base 0x%" PRIx64 " id_bits %u l2_idx_bits %u IST entry size %u 2-level %d"
 gicv5_ist_invalid(const char *domain) "GICv5 IRS %s IST no longer valid"
 gicv5_set_priority(const char *domain, const char *type, bool virtual, uint32_t id, uint8_t priority) "GICv5 IRS SetPriority %s %s virtual:%d ID %u prio %u"
+gicv5_set_enabled(const char *domain, const char *type, bool virtual, uint32_t id, bool enabled) "GICv5 IRS SetEnabled %s %s virtual:%d ID %u enabled %d"
+gicv5_set_pending(const char *domain, const char *type, bool virtual, uint32_t id, bool pending) "GICv5 IRS SetPending %s %s virtual:%d ID %u pending %d"
+gicv5_set_handling(const char *domain, const char *type, bool virtual, uint32_t id, int handling) "GICv5 IRS SetHandling %s %s virtual:%d ID %u handling %d"
+gicv5_set_target(const char *domain, const char *type, bool virtual, uint32_t id, uint32_t iaffid, int irm) "GICv5 IRS SetTarget %s %s virtual:%d ID %u IAFFID %u routingmode %d"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index 3239a86f1a..db0e3e01c6 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -58,4 +58,72 @@ void gicv5_set_priority(GICv5Common *cs, uint32_t id,
                         uint8_t priority, GICv5Domain domain,
                         GICv5IntType type, bool virtual);
 
+/**
+ * gicv5_set_enabled
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @enabled: new enabled state
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Set enabled state of an interrupt; matches stream interface
+ * SetEnabled command from CPUIF to IRS. There is no report back
+ * of success/failure to the CPUIF in the protocol.
+ */
+void gicv5_set_enabled(GICv5Common *cs, uint32_t id,
+                       bool enabled, GICv5Domain domain,
+                       GICv5IntType type, bool virtual);
+
+/**
+ * gicv5_set_pending
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @pending: new pending state
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Set pending state of an interrupt; matches stream interface
+ * SetPending command from CPUIF to IRS. There is no report back
+ * of success/failure to the CPUIF in the protocol.
+ */
+void gicv5_set_pending(GICv5Common *cs, uint32_t id,
+                       bool pending, GICv5Domain domain,
+                       GICv5IntType type, bool virtual);
+
+/**
+ * gicv5_set_handling
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @handling: new handling mode
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Set handling mode of an interrupt (edge/level); matches stream interface
+ * SetHandling command from CPUIF to IRS. There is no report back
+ * of success/failure to the CPUIF in the protocol.
+ */
+void gicv5_set_handling(GICv5Common *cs, uint32_t id,
+                        GICv5HandlingMode handling, GICv5Domain domain,
+                        GICv5IntType type, bool virtual);
+
+/**
+ * gicv5_set_target
+ * @cs: GIC IRS to send command to
+ * @id: interrupt ID
+ * @iaffid: new target PE's interrupt affinity
+ * @irm: interrupt routing mode (targeted vs 1-of-N)
+ * @domain: interrupt Domain to act on
+ * @type: interrupt type (LPI or SPI)
+ * @virtual: true if this is a virtual interrupt
+ *
+ * Set handling mode of an interrupt (edge/level); matches stream interface
+ * SetHandling command from CPUIF to IRS. There is no report back
+ * of success/failure to the CPUIF in the protocol.
+ */
+void gicv5_set_target(GICv5Common *cs, uint32_t id, uint32_t iaffid,
+                      GICv5RoutingMode irm, GICv5Domain domain,
+                      GICv5IntType type, bool virtual);
 #endif
diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index b4452a7b7d..15d4d5c3f4 100644
--- a/include/hw/intc/arm_gicv5_types.h
+++ b/include/hw/intc/arm_gicv5_types.h
@@ -55,4 +55,19 @@ typedef enum GICv5IntType {
     GICV5_SPI = 3,
 } GICv5IntType;
 
+/* Interrupt handling mode (same encoding as L2_ISTE.HM) */
+typedef enum GICv5HandlingMode {
+    GICV5_EDGE = 0,
+    GICV5_LEVEL = 1,
+} GICv5HandlingMode;
+
+/*
+ * Interrupt routing mode (same encoding as L2_ISTE.IRM).
+ * Note that 1-of-N support is option and QEMU does not implement it.
+ */
+typedef enum GICv5RoutingMode {
+    GICV5_TARGETED = 0,
+    GICV5_1OFN = 1,
+} GICv5RoutingMode;
+
 #endif
-- 
2.43.0


