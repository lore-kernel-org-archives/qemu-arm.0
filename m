Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3424587lfm;
        Sat, 4 Jul 2020 08:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp1gae0qZtp8Yth9qgElv8XXFkIQoAibcW9FK71tGyoj2CoEhvzdBNkkpEYDusu8UOozgC
X-Received: by 2002:a25:c5cf:: with SMTP id v198mr65778003ybe.6.1593877354248;
        Sat, 04 Jul 2020 08:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877354; cv=none;
        d=google.com; s=arc-20160816;
        b=nY8hltvZ5tSEUVp59D30agHmdXlJhIckcsaGeC4/HvTEVx8wBwf4qpuIA2e1e2MZKL
         Lf6cmCLcwv8br3nrSEDB8o/1b3dFmV1gEvF+Z50j7H96n90uResU6tH2NbmcyiSEbUHr
         44Pl2VKx70iEkQUdaff3OaNRq7Dyfvk+G2vam3ukq4MHpCoNSQH7iIA5+AXk+dF1YSIG
         nGg1ivQRuWcTtA2Ee9qaQNicrrf1/qNXBGO87OBnmHI/1lTrJhcSodgJoUWWYFbaRaLg
         d585ZQ9GvIthmiDo09pDzCwyVHwucrykJY/Q4QvwUMnvkAxe0+8yYRstrpo13UVh3P9b
         KK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZSSg9nfJ42WhMhBqmBHSws/rdrCKvh4AMKvzensIz1k=;
        b=C6mfIoCXHlushhIq0U/5NklcW7Y2YOZUsSUx7TGSLnZ76vE54XA7uZDjFepiefalH0
         Gd44Dl8lZ8xabpGkVCWC0RHT1rwk49QPh0PQ+RdjERfV9GLy+8SE04E78XQlfLKWzClM
         qSCsx/iA9F4yIzB7hFRaiTGYOGoSL2td5m1W4v7ISLCfD0Fk8KcGEslcd6zHM6/irmgZ
         2EjIrvnX+PVrZ/5qXywsLxU+hfFUbOLFEG3sp0Cd6NXFcxzYFYBpfuXRlK/i3BPVd0gz
         kI8GsI6QFdmhJZaG5CaJzJ7ZSAiw6BmEW2cMEBawCilxXq6NP8yIStF2eQL1sejVmPRS
         O0/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HFqFYO6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si6976578yby.21.2020.07.04.08.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HFqFYO6x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkJF-0005Hf-IF
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGN-00017Y-PL
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGL-0007Uy-VE
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSSg9nfJ42WhMhBqmBHSws/rdrCKvh4AMKvzensIz1k=;
 b=HFqFYO6xHbq5q0IZKCdMdJs+c9UTan2BwuEXXVYqK8FlL/4wlhoOlRQimDpVnPck2iCS19
 IdRSv0mz26f5sRYz3vFKYkM+NGEYxgULW7uzamMKy7gqMEqbhnhdYkiag4wwOCZDwlbSfc
 kYtd/Uf/MQCqp+ViHem7PNzlhk+qK0M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-nFHQfRFBOOWjVQBw3J5YzA-1; Sat, 04 Jul 2020 11:39:29 -0400
X-MC-Unique: nFHQfRFBOOWjVQBw3J5YzA-1
Received: by mail-wr1-f72.google.com with SMTP id c6so16823161wru.7
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZSSg9nfJ42WhMhBqmBHSws/rdrCKvh4AMKvzensIz1k=;
 b=dxNmt7JCKLC5/EyUZnFHqKc3iDiXk1BiUhVT1BItLIBS3rIiRLL5G/p1O8+wcNBAGQ
 CBZcTfk0PD0jDT9ChnLsyL/T+YG1XGrhzVaXQ5hndK1S/+EfQaqdyWoaU/fYUIqtZ7Rg
 jZfHUCufzDFeSxbd5N3WJ1FMsQq36z0bFpViHddTmYFLT3d5i2mLj32upA7J66L0AeSZ
 sO6feDT7CBy/888KxUbKj1KVSBvjTOHo1mDp4k6Rw1e5hVPL8+dQ6ELrvw1RVx9QVXiq
 54/zKsjcHSS60Yjapf//Btqj85OOnDylL066Ket78h0E6Xma5hMRkJBodpGNqBu/cJLz
 ktog==
X-Gm-Message-State: AOAM530TSJHR1CCGVfzYHbykzEg/1qKxCZTXDAnJ/Vd35UBh/oa1qusc
 kYAOXa1Zcyeq4kd9IaX8hKmPN0B7tIrudJgtW9nWzvvZQdIjLdbOynieE6q8WcF2qz69zbBSPce
 513Qf0Dlp+niD
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr43870374wrm.40.1593877168063; 
 Sat, 04 Jul 2020 08:39:28 -0700 (PDT)
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr43870340wrm.40.1593877167780; 
 Sat, 04 Jul 2020 08:39:27 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 33sm18326425wri.16.2020.07.04.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/23] hw/arm/omap: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:38:48 +0200
Message-Id: <20200704153908.12118-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H708OTtuJq4l

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/omap1.c            | 6 ++++++
 hw/char/omap_uart.c       | 5 +++++
 hw/misc/omap_gpmc.c       | 3 +++
 hw/misc/omap_l4.c         | 3 +++
 hw/misc/omap_sdrc.c       | 3 +++
 hw/sd/omap_mmc.c          | 5 +++++
 hw/ssi/omap_spi.c         | 3 +++
 hw/timer/omap_synctimer.c | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6ba0df6b6d..db4f2ee304 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -40,6 +40,7 @@
 #include "hw/sysbus.h"
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
+#include "hw/qdev-deprecated.h"
 
 static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
 {
@@ -1451,6 +1452,7 @@ static struct dpll_ctl_s  *omap_dpll_init(MemoryRegion *memory,
                            hwaddr base, omap_clk clk)
 {
     struct dpll_ctl_s *s = g_malloc0(sizeof(*s));
+    qdev_warn_deprecated_function_used();
     memory_region_init_io(&s->iomem, NULL, &omap_dpll_ops, s, "omap-dpll", 0x100);
 
     s->dpll = clk;
@@ -2427,6 +2429,8 @@ static struct omap_pwl_s *omap_pwl_init(MemoryRegion *system_memory,
 {
     struct omap_pwl_s *s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     omap_pwl_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &omap_pwl_ops, s,
@@ -2534,6 +2538,8 @@ static struct omap_pwt_s *omap_pwt_init(MemoryRegion *system_memory,
                                         omap_clk clk)
 {
     struct omap_pwt_s *s = g_malloc0(sizeof(*s));
+
+    qdev_warn_deprecated_function_used();
     s->clk = clk;
     omap_pwt_reset(s);
 
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index e8da933378..7e106772ce 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -22,6 +22,7 @@
 #include "hw/arm/omap.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* UARTs */
 struct omap_uart_s {
@@ -57,6 +58,8 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
 {
     struct omap_uart_s *s = g_new0(struct omap_uart_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->base = base;
     s->fclk = fclk;
     s->irq = irq;
@@ -168,6 +171,8 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
     struct omap_uart_s *s = omap_uart_init(base, irq,
                     fclk, iclk, txdma, rxdma, label, chr);
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &omap_uart_ops, s, "omap.uart", 0x100);
 
     s->ta = ta;
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 10de7a5523..9e29d7a8bd 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -25,6 +25,7 @@
 #include "hw/arm/omap.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* General-Purpose Memory Controller */
 struct omap_gpmc_s {
@@ -830,6 +831,8 @@ struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,
     int cs;
     struct omap_gpmc_s *s = g_new0(struct omap_gpmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &omap_gpmc_ops, s, "omap-gpmc", 0x1000);
     memory_region_add_subregion(get_system_memory(), base, &s->iomem);
 
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index 54aeaecd69..b412790c19 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 struct omap_l4_s {
     MemoryRegion *address_space;
@@ -33,6 +34,8 @@ struct omap_l4_s *omap_l4_init(MemoryRegion *address_space,
     struct omap_l4_s *bus = g_malloc0(
                     sizeof(*bus) + ta_num * sizeof(*bus->ta));
 
+    qdev_warn_deprecated_function_used();
+
     bus->address_space = address_space;
     bus->ta_num = ta_num;
     bus->base = base;
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index f2f72f6810..4f8440ea56 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 /* SDRAM Controller Subsystem */
 struct omap_sdrc_s {
@@ -159,6 +160,8 @@ struct omap_sdrc_s *omap_sdrc_init(MemoryRegion *sysmem,
 {
     struct omap_sdrc_s *s = g_new0(struct omap_sdrc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     omap_sdrc_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &omap_sdrc_ops, s, "omap.sdrc", 0x1000);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 4088a8a80b..88fd20e17a 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -24,6 +24,7 @@
 #include "hw/irq.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
+#include "hw/qdev-deprecated.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
@@ -599,6 +600,8 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
 {
     struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->dma = dma;
     s->clk = clk;
@@ -625,6 +628,8 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
 {
     struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->dma = dma;
     s->clk = fclk;
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 7c7e689707..276f963ae2 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -25,6 +25,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 /* Multichannel SPI */
 struct omap_mcspi_s {
@@ -353,6 +354,8 @@ struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int chnum,
     struct omap_mcspi_s *s = g_new0(struct omap_mcspi_s, 1);
     struct omap_mcspi_ch_s *ch = s->ch;
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->chnum = chnum;
     while (chnum --) {
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index 72b997939b..4be24e970e 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
+
 struct omap_synctimer_s {
     MemoryRegion iomem;
     uint32_t val;
@@ -101,6 +103,8 @@ struct omap_synctimer_s *omap_synctimer_init(struct omap_target_agent_s *ta,
 {
     struct omap_synctimer_s *s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     omap_synctimer_reset(s);
     memory_region_init_io(&s->iomem, NULL, &omap_synctimer_ops, s, "omap.synctimer",
                           omap_l4_region_size(ta, 0));
-- 
2.21.3

