Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0188EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKE-0001Kc-Lv; Mon, 23 Feb 2026 12:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKD-0001IZ-Dz
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKB-0008WP-Ix
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48069a48629so47247375e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866142; x=1772470942; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pgbI5Qqmzf+DxfEbRHQMqpET1e5tAlZwB7KWYK/P7d0=;
 b=k5HXl6gExcFnJ1fxyB00K45ax3M6VPMupSnznJe3Phfg1a3vgyXE0Gz627KoJInyNW
 yoXsv4hX1qVtyLhKyi3CXNGWhk0bnscbL7T22OY5bRnoKKxgYQSJ9OdELhNl7gKWciU5
 emxeftfebOEXqAIBNcAgbGH+svNGv/BW8I8AuNevVc9Uetwe4GtV7pU1ml1Gcyx5TITm
 Yu4XfJYLW0QutTwGxpOiBFb80D16zpGr75ns7ciij4N3ufH4E2fvBAkNd+UnWy2bbbPa
 5R1TqugnIYrZ4sVw6Xv+djSgTuYA0pxjWMT0Oh3QZxJDLi9XT/QW9SPXzTnHaGA2nn11
 nDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866142; x=1772470942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pgbI5Qqmzf+DxfEbRHQMqpET1e5tAlZwB7KWYK/P7d0=;
 b=OGjc+hhRaQRBY/fZY9sI1ZZd0KsmLNdraokaPEvkcLtya/c7Kv2+Bzee5P2nmqhvUR
 8HjsgXtrdEqOzdw9f/m5773KEkM9o85UC3lzMY1UjrC++uFQQDi0jpEjkAVQwpZxtOgS
 yvH19OF64bUhxhOWZHtEjp6v/gQjYE+1FlrnSdCg8l2LERBFWBuWP3v0fV35P0xu5fls
 W7NyWhE0UeLCVnq5qYxqDbReA+ppVfW0n1NX+AuD3JZa+lFXNlxrhptJGDAlhe1UtnLp
 3+v4WslfrvSXLCOBMYiSePtnAIz37RL8vSCMYaCKtcy1nNC2RHIUKOjAYv9YNBan9j6e
 Z4+A==
X-Gm-Message-State: AOJu0YwxhXYCmtEcJJXchg0rf9bmTVzTmMwipv1G11xC6TV4R4eU2HbG
 02v8oivc3JHOAg/Pb4kM03delhVCYL6F6+xZG31zwefAIYrS082qvQK62g7jMzH6kok2P75cOwl
 giYII
X-Gm-Gg: AZuq6aIqxqU3KacTG4W9X6CfCbu6fslgG/bgoxL7n5wGfUVZTPp2yjBzRrLMjg+Au3O
 WaR27q5qzZjEFCqoYp+6mghH8gKS6QjnDj743vvLNJCT6fN/vCv20p6kD9T7k7Wule4kupp6Vxq
 XkbueJp5jgwrXSDMyxg+o8whrrO71bUTSTy3+ocFy6pZJWLXc2a5RZFieCvcdrXihbGMGQcFcKC
 RNSVhJRKIpn7gnfmP9VouClASQuzSgyU7XZf05mbr9csSjiCtchA7slmGF2z9J0/zcePAj/aav+
 LJcF7r/NbOfoLyMe7Gjkkc2bvK9pTYcouQBcJHlRtkuMqyWU8n6KeE4PRf0QGtWvO90r42DBw2S
 ulVPqfTj8LwO618QLcjReIJaWOT6zjd9gBRvONUXCcNn/8GXXa+vCdLWkvkwopVEyte6I9KzujB
 atsu7EWFaCaHO+LJnCE1smwk3zcbWff69VmVfGo1R5VqV8UUz7MnyfWQYN62CXCTpjS0PwTUmO1
 leobeBnZybGNod5DCSZxFC69Kr5XXE=
X-Received: by 2002:a05:600c:3e05:b0:483:6fc6:1e20 with SMTP id
 5b1f17b1804b1-483a95b5410mr161846545e9.9.1771866141963; 
 Mon, 23 Feb 2026 09:02:21 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/65] hw/intc/arm_gicv5: Create inbound GPIO lines for SPIs
Date: Mon, 23 Feb 2026 17:01:14 +0000
Message-ID: <20260223170212.441276-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The GICv5 IRS may have inbound GPIO lines corresponding to SPIs
(shared peripheral interrupts).  Unlike the GICv3, it does not deal
with PPIs (private peripheral interrupts, i.e.  per-CPU interrupts):
in a GICv5 system those are handled entirely within the CPU
interface.  The inbound GPIO array is therefore a simple sequence of
one GPIO per SPI that this IRS handles.

Create the GPIO input array in gicv5_common_init_irqs_and_mmio().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 11 ++++++++++-
 hw/intc/arm_gicv5_common.c         |  5 +++++
 hw/intc/trace-events               |  1 +
 include/hw/intc/arm_gicv5_common.h |  4 ++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 73a6e629df..7ef48bb450 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -181,6 +181,15 @@ static const MemoryRegionOps config_frame_ops[NUM_GICV5_DOMAINS] = {
     },
 };
 
+static void gicv5_set_spi(void *opaque, int irq, int level)
+{
+    /* These irqs are all SPIs; the INTID is irq + s->spi_base */
+    GICv5Common *cs = ARM_GICV5_COMMON(opaque);
+    uint32_t spi_id = irq + cs->spi_base;
+
+    trace_gicv5_spi(spi_id, level);
+}
+
 static void gicv5_reset_hold(Object *obj, ResetType type)
 {
     GICv5 *s = ARM_GICV5(obj);
@@ -217,7 +226,7 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
      * NS domain.
      */
     cs->implemented_domains = (1 << GICV5_ID_NS);
-    gicv5_common_init_irqs_and_mmio(cs, config_frame_ops);
+    gicv5_common_init_irqs_and_mmio(cs, gicv5_set_spi, config_frame_ops);
 }
 
 static void gicv5_init(Object *obj)
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index c8b6704fe4..0f966dfd1b 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -38,10 +38,15 @@ static const MemoryRegionOps bad_frame_ops = {
 };
 
 void gicv5_common_init_irqs_and_mmio(GICv5Common *cs,
+                                     qemu_irq_handler handler,
                                      const MemoryRegionOps config_ops[NUM_GICV5_DOMAINS])
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(cs);
 
+    if (cs->spi_irs_range) {
+        qdev_init_gpio_in(DEVICE(cs), handler, cs->spi_irs_range);
+    }
+
     for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
         g_autofree char *memname = g_strdup_printf("gicv5-irs-%d", i);
         const MemoryRegionOps *ops = gicv5_domain_implemented(cs, i) ?
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 54777f6da3..0797a23c1a 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -232,6 +232,7 @@ gicv5_read(const char *domain, uint64_t offset, uint64_t data, unsigned size) "G
 gicv5_badread(const char *domain, uint64_t offset, unsigned size) "GICv5 IRS %s config frame read: offset 0x%" PRIx64 " size %u: error"
 gicv5_write(const char *domain, uint64_t offset, uint64_t data, unsigned size) "GICv5 IRS %s config frame write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 gicv5_badwrite(const char *domain, uint64_t offset, uint64_t data, unsigned size) "GICv5 IRS %s config frame write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u: error"
+gicv5_spi(uint32_t id, int level) "GICv5 SPI ID %u asserted at level %d"
 
 # arm_gicv5_common.c
 gicv5_common_realize(uint32_t irsid, uint32_t num_cpus, uint32_t spi_base, uint32_t spi_irs_range, uint32_t spi_range) "GICv5 IRS realized: IRS ID %u, %u CPUs, SPI base %u, SPI IRS range %u, SPI range %u"
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index b22f020a53..be898abcd5 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -29,6 +29,9 @@
  *   IRS (this is IRS_IDR7.SPI_BASE); default is 0
  * + QOM property "spi-irs-range": number of SPI INTID.ID managed on this
  *   IRS (this is IRS_IDR6.SPI_IRS_RANGE); defaults to value of spi-range
+ * + unnamed GPIO inputs: the SPIs handled by this IRS
+ *   (so GPIO input 0 is the SPI with INTID SPI_BASE, input 1 is
+ *   SPI_BASE+1, and so on up to SPI_BASE + SPI_IRS_RANGE - 1)
  *
  * sysbus MMIO regions (in order matching IRS_IDR0.INT_DOM encoding):
  * - IRS config frame for the Secure Interrupt Domain
@@ -91,6 +94,7 @@ struct GICv5CommonClass {
  * of MemoryRegionOps structs.
  */
 void gicv5_common_init_irqs_and_mmio(GICv5Common *cs,
+                                     qemu_irq_handler handler,
                                      const MemoryRegionOps ops[NUM_GICV5_DOMAINS]);
 
 /**
-- 
2.43.0


