Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1884853ejq;
        Mon, 8 May 2023 01:01:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZqJj5/oURHOmm9SbJ3mKop5FllmDh+cVuAU+QoAESLsrgfCiO03oAb3wbdQ3z4a2gKVXb
X-Received: by 2002:a05:6214:29cc:b0:5f1:5cf1:b4c0 with SMTP id gh12-20020a05621429cc00b005f15cf1b4c0mr10574022qvb.38.1683532879350;
        Mon, 08 May 2023 01:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532879; cv=none;
        d=google.com; s=arc-20160816;
        b=GdZUEhXu3kFYef/KSl/I4kBIuAyxpfgDfwAyH4WdkdDe2gRYTdlSkQA5XMAztRbaIK
         tg51rJ4hLksa54NEiWzoJlybQD6A6TBMfqUtSR9POp4lhGgH8AM4RDLs2tj8DJiGirjK
         OwWKi3Y1p0oVDyKjMat4edynOFtbCTQcWgcyFkI6g9v3k1OFanjIud18X14eElQLVqVd
         VRE+oO2iC1vWoG8OYkq2yaJaIrz10U/lkUjIABEBkFvRg6y4hN3dyjO/rLTaChCz8SRP
         Wo32ZpHA1wVzCjNTgjcAImQmfOW2GMaraxXqVDA/0NWUUdjj6nbCsuukaX6rnc9+aAW0
         6YCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iGsUKUnmcAqC89CcpBzx8YkHjvNI9dbSVN7c/JBM+6Q=;
        b=mYJtH6hP1Jh0Oq0G7NtKQfM+5cZSXhvLaYtkMQxxXebEQ8q+CbkW8L9D7nJqumEk4y
         ekcs1hR5QCedNI9TPBff28VGXxEY1l2+T4t7SGSaYO4g0djwPycQulR5hkhyhbj8PkmJ
         qmxSsl4uuMyoLRDPWVlDOl6PuzKhUpwlejP82Y7YxPzUnX98NUXCw5GPEFJ2YMoIwWpW
         EDLmYimsainhPs09GyFejRE+GU/lFOMRSFp4NiU85i+uoC41OmtP5xymma7tybO+ukjv
         viqUza4wmkEGZEWLfT0BYy8valZWSao+Qf770tHTq7S41XPbL59TpgkJPeYhUaATFQjM
         4oYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm11-20020a056214268b00b005ef8b3a05c2si1185749qvb.285.2023.05.08.01.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvvmm-0008H1-Ja; Mon, 08 May 2023 03:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmZ-00086x-F2; Mon, 08 May 2023 03:59:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmX-0001E5-NX; Mon, 08 May 2023 03:59:43 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDGM045wz4x49;
 Mon,  8 May 2023 17:59:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDGJ5ydrz4whj;
 Mon,  8 May 2023 17:59:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 10/12] aspeed: Get the BlockBackend of FMC0 from the flash
 device
Date: Mon,  8 May 2023 09:58:57 +0200
Message-Id: <20230508075859.3326566-11-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6S9PIHlDfoNh

and get rid of an unnecessary drive_get(IF_MTD) call.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a8832c0072..3d5488faf7 100644
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
@@ -427,11 +428,12 @@ static void aspeed_machine_init(MachineState *machine)
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
2.40.0

