Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5059781ejc;
        Thu, 31 Aug 2023 05:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrKPmpH/68g68s6pQTbcF91ncZuRlA6VhyaY9vBISPRSXud9qhSn5bvEc3o2JwKs6KcCuJ
X-Received: by 2002:a05:620a:2412:b0:765:a77c:7219 with SMTP id d18-20020a05620a241200b00765a77c7219mr3248736qkn.0.1693485653259;
        Thu, 31 Aug 2023 05:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485653; cv=none;
        d=google.com; s=arc-20160816;
        b=A9Vm+KqnX3aLGFzKqI6ylhfI4j9Ml5iIfabvT0Lb/2naL3mVA9lj8zUeSuZLuu+fQR
         2KyrNemUBEvMCD0NiQSXD4Ez6gAnJ627G0G10A3fKwcq/NC7vTosot4i280hblSqO5Yx
         c9ofbcemyZbbjXq9DI1+hkmGb37+l/FdC368JCyjNKJFNvJ9AmNtaWPU9N2RvXLmrwk5
         y/p3WI3BiCPEvEDYW9YsnUsGMzh3xbyLCjviaEI9XRN3tXdIMTfhf3cXij7vygpaixpU
         ve6SZ3f0JpKX5PQAuTbklLff/l9hxrjQPSjZzSax8RlJkgkVSCarCv7Zc3lUi6s1cQJS
         hKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TXX/Wi5GmH8c1XBGaOqNbgVBu9j3Qhul2QWxL5xZ24A=;
        fh=ZmtjI5NZxuQHscZb+jg+lKi3cobjdKea+DPcFuQLEQ8=;
        b=tjatlaOFYRYK+u0m9KCce79SgknDQKg7vvHrob8POqh5h+RjIM7Fk4kORtCgTVaTEN
         XRgYz65cZesh30+YR86E0Su2agJmxeaDqOKVUZVDt6AfEJD1m2EJx+kKXSiKRGjba+mL
         VvsaAymd5jsAqAmilVWdfSrwCT0kWB3sLxzfL1BUOGPukqf74G5pNhgwjKIyCQ3YAsjY
         2cqHkaA2Uf60+CNBekdqZPJoMWfvHs+D+2hE7aLZHzXEh9re18fvFlvPb5c/PWKoR9Oj
         5uvpyR5FR4/KCLZi1gHX5qEkpbonehnf/rEkoAF8bvJdaqd18NRFdCO+5M65pYMWQl+m
         xLdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id or18-20020a05620a619200b0076cb6c9e0a6si883573qkn.336.2023.08.31.05.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbgxo-0007zq-JW; Thu, 31 Aug 2023 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxl-0007xE-Q1; Thu, 31 Aug 2023 08:39:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxj-0008FT-Cm; Thu, 31 Aug 2023 08:39:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12Z3GLjz4x2Z;
 Thu, 31 Aug 2023 22:39:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12X1NFNz4x09;
 Thu, 31 Aug 2023 22:39:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 7/7] aspeed: Get the BlockBackend of FMC0 from the flash
 device
Date: Thu, 31 Aug 2023 14:39:22 +0200
Message-ID: <20230831123922.105200-8-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: acBA3NnRY7H+

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

