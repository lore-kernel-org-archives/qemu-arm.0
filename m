Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp891978ejt;
        Thu, 15 Jun 2023 10:37:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QKyJ2AsLJ1ZPEFlxZ6xd4xu+7LW75O9KtYoTI1PkAc6kU+cAg7315Eawpxcdz5kmgH3Ba
X-Received: by 2002:a05:620a:6018:b0:75f:891:f269 with SMTP id dw24-20020a05620a601800b0075f0891f269mr6313985qkb.30.1686850662131;
        Thu, 15 Jun 2023 10:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686850662; cv=none;
        d=google.com; s=arc-20160816;
        b=flcvIDRHJAi+JTaoicDPrj5IDsuLsIUaeoJJgEQcfXkfvH/RW3Qe1XVrUaISDAEUXa
         5b3POgZ+CPNYW2b38We0cJjys+Bpwu6+wq0ksBykaspZ2x32OFBxlU7rDoTzRu1EdjB2
         iJ725ZzRV9IrKVKLqI9OTyqt1uVlEAHIiFKG+sHW1IWABZYKdPlJiUrz0MnoOhWGYRHY
         lbrxPgXtRmfMmQUQXH0KUZCsc5dCejzAZje+T//rBFVgY8gXabnIlBco3klfSSZxXcBR
         mUQT/6fHnyGm9MJcgAzjNs7fVKvYFAC0W+v0bHq4mFZ/4Q4N+ln+9QMqA7UhommFDWM/
         E0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OooIg25taXsMlnEZP9PzTVcaYfpcYqwVJgLRS0vJIsk=;
        b=jA34YVbY1whxDZ4Yex0HzsGoJKKfRb+QZvgkRdd2tVmsA3U/CJzvZuTKmlqF4Bhrtj
         BmSzwggM8ab16wPZ16Bd8w2I3nk+UkaB2N/rWe8j1xKCIWzzVsWE4eEj/dz8wP/xTfpB
         VbQcWFtKccG1oYA13hXTKS3QtCkQH+RLVQbNgQYP5cZafAnYY6HxXyiTyAfIKkdjLevv
         tbUnU7yIJl+6f1BTVaIe79H5A4TJN0aVT4ZQkLFugvZVJyttK26+AP79DWhY0owA2ZAA
         iSa9E5Btr4paLJ9oo/jT4lXuJSbTRTnnv7qwfZdVkLiXZfEFYrQli8kQEzqIoCwxBSko
         AGWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05620a167500b0076077646485si5318030qko.311.2023.06.15.10.37.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 10:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9qt8-0000fq-7u; Thu, 15 Jun 2023 13:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qt4-0000cw-6F; Thu, 15 Jun 2023 13:35:58 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qt1-0007jb-Ge; Thu, 15 Jun 2023 13:35:57 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QhqFf4PTVz4x0L;
 Fri, 16 Jun 2023 03:35:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhqFb5Jysz4x08;
 Fri, 16 Jun 2023 03:35:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>
Subject: [PULL 4/6] aspeed: Use the boot_rom region of the fby35 machine
Date: Thu, 15 Jun 2023 19:35:23 +0200
Message-Id: <20230615173525.428831-5-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615173525.428831-1-clg@kaod.org>
References: <20230615173525.428831-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=xCJj=CD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WS/fUTLuDvuh

This change completes commits 5aa281d757 ("aspeed: Introduce a
spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
boot_rom overlap region in the SoC spi_boot container") which
introduced a spi_boot container at the SoC level to map the boot rom
region as an overlap.

It also fixes a Coverity report (CID 1508061) for a memory leak
warning when the QEMU process exits by using an bmc_boot_rom
MemoryRegion available at the machine level.

Cc: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index f4600c290b62..f2ff6c1abfd9 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -70,8 +70,6 @@ static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
 
 static void fby35_bmc_init(Fby35State *s)
 {
-    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
-
     object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
@@ -95,18 +93,21 @@ static void fby35_bmc_init(Fby35State *s)
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
 
     /* Install first FMC flash content as a boot rom. */
-    if (drive0) {
-        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
-        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
-        uint64_t size = memory_region_size(&fl->mmio);
-
-        if (!s->mmio_exec) {
-            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   size, &error_abort);
-            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-                                        boot_rom);
-            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
-                                     size, &error_abort);
+    if (!s->mmio_exec) {
+        DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);
+
+        if (mtd0) {
+            AspeedSoCState *bmc = &s->bmc;
+            uint64_t rom_size = memory_region_size(&bmc->spi_boot);
+
+            memory_region_init_rom(&s->bmc_boot_rom, NULL, "aspeed.boot_rom",
+                                   rom_size, &error_abort);
+            memory_region_add_subregion_overlap(&bmc->spi_boot_container, 0,
+                                                &s->bmc_boot_rom, 1);
+
+            fby35_bmc_write_boot_rom(mtd0, &s->bmc_boot_rom,
+                                     FBY35_BMC_FIRMWARE_ADDR,
+                                     rom_size, &error_abort);
         }
     }
 }
-- 
2.40.1

