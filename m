Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp495922ejc;
        Fri, 1 Sep 2023 02:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF41tgweRZpQM3Y/bAbQL6RDegtWqc1bBwLLJMxZReAUkqgdpzFWn5wvzBihQu5MaEgOs/p
X-Received: by 2002:a05:622a:180a:b0:410:bc4:d7be with SMTP id t10-20020a05622a180a00b004100bc4d7bemr2159449qtc.31.1693561413921;
        Fri, 01 Sep 2023 02:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561413; cv=none;
        d=google.com; s=arc-20160816;
        b=aGFQ2zRIfGXDvwi7V7MaT6y+uTqCToU8lNoEkP3SEDvFnCaRkvp0D1Rd4CFomDkZuA
         MPHXNtRApRj39BdR1a68gp4l8SGkYxaD/InV5jxMOugyjj62OlQ140mGna9BDlCOSjHX
         Fi3chyhnkNgb/FyW5GfhmO1Yh+Lc26ESjfMPIv2N6UC7jQ95po5Izgf7dDH/7lrf/MPb
         qcjxtGjueGavdqG/XLx4ci8mQp57eayGzVz2xVZtKycVgR6ExSlSWeUHUDaJNoNI1Ikf
         hCH1MA38lcwI1q2Lnqy32Uz6gcIrAVRy82SmbKBoBvbUX0Qg2GX08mnH2LcD9/fABCFY
         uE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TXX/Wi5GmH8c1XBGaOqNbgVBu9j3Qhul2QWxL5xZ24A=;
        fh=WTZTejWY5HqJnQbEcvHaz/nUxpALFDoUbrrrY007naU=;
        b=0clp3KIsmVBaeLfglRS0NKvvIAA+fuEsnzSzKau8vKVGi5d3ZY9rRd4/a0dq9oOwF+
         evYiQRlVoKk5Vl3X39PcV8+/b+qpwDBxRzKdF8xy+p2DyQoK1n5IlSGVu4R0df3RmsJw
         1q5exyUE0ylPx/eTiOjyDdJqxnjfEQZ4RfxFQtCxAd9aOt3+zGJOoYn2q7ul7UcWlfcY
         22yY/8FlPk7he3BhVc1drmgMjehSttiG3n9nkowmdPncgecIszcgSsv9mvKdQL12o1Zy
         FDPAACNL10lsmnzWgko7OZzJenjvddDC3Um6rY4HngK/pPDdKhmVCp8HKpJPWfvpKTzr
         Sxhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a05620a260300b00766fce24242si2185915qko.135.2023.09.01.02.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0g9-00024A-AZ; Fri, 01 Sep 2023 05:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g1-0001uF-Ke; Fri, 01 Sep 2023 05:42:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fz-00034M-9b; Fri, 01 Sep 2023 05:42:53 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3r6lRNz4x3H;
 Fri,  1 Sep 2023 19:42:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3q1HVwz4x2D;
 Fri,  1 Sep 2023 19:42:46 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 12/26] aspeed: Get the BlockBackend of FMC0 from the flash
 device
Date: Fri,  1 Sep 2023 11:42:00 +0200
Message-ID: <20230901094214.296918-13-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: HZl+QhWRsSMZ

and get rid of an unnecessary drive_get(IF_MTD) call.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 271512ce5ced..f8ba67531a00 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -15,6 +15,7 @@
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/arm/aspeed_eeprom.h"
+#include "hw/block/flash.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
@@ -436,11 +437,12 @@ static void aspeed_machine_init(MachineState *machine)
     }
 
     if (!bmc->mmio_exec) {
-        DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);
+        DeviceState *dev = ssi_get_cs(bmc->soc.fmc.spi, 0);
+        BlockBackend *fmc0 = dev ? m25p80_get_blk(dev) : NULL;
 
-        if (mtd0) {
+        if (fmc0) {
             uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
-            aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(mtd0), rom_size);
+            aspeed_install_boot_rom(bmc, fmc0, rom_size);
         }
     }
 
-- 
2.41.0

