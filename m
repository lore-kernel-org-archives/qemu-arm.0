Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C03CD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:16:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcS-0002Pi-8r; Sat, 16 May 2026 13:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcQ-0002PN-RU
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcP-00084j-AN
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so10218165e9.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951764; x=1779556564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AsSTIk+0JSWuno3/dEFZUZlrRwN5mUJXqdEg56UWohE=;
 b=OLKNG/Tog/r1CyFig2kVI1i+s0KPWjYGl4YXADXC1HR/fNH6u1MBRbF2ws18ZgHe0/
 SU0mNBOKv+HjgW0VSuDfarBJ0E5LXxp5xYhaFheOR8ES8qrpGw80N3O+mcqYf2GW8Gan
 2pnDusbKfHZU/Qt/nX+z/OueqQ4KRv7Okf/7t5l9rq/VJRH5GQIdrjJ+tCeR+4G8DHoe
 cpJPL0HNtBpoiKq375SWqlXwGJ5maaza2AR2LwIIILVY5Q7RX9HLNoHQ5aDdBeSapKU7
 jZHRhqEAYlHITEnPPTsmzhEF8R6POyCxJY7CvBLnDe1u1nn0C7fkdwHDrGUFDbk+BODK
 2NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951764; x=1779556564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AsSTIk+0JSWuno3/dEFZUZlrRwN5mUJXqdEg56UWohE=;
 b=TgKkL8xYSZuTW4ZyXUKivP2hJDkar6fFhj85hmk/syZjo/v4c/8sjmlfOXtwPSD6Hz
 riBdHDm2eHXkB8UxbA7rFUawSXPEQRAzl7Qy+By5KI+EBlPYgAZ+llqMNFKWRq0jch/F
 V9oHNjrJ/5Rraux4hRs2L5FmTL1AWe89fDmeCle3SsUOFpNnJTv4AvqLttJ5HeWTiN3M
 5GUk0QOD9vVgjHrFIoKsZF6WHfscQptGWER5TuVsW0prGyHpfcOTJmaRO/3JW9xGaUD+
 jaWCyZoYcTMgqKdOrpjNgrWQKuy3kCHLSwkAk90NQowPxmbyaayAV9yu96Vjq9TRPel8
 on+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KlhzlZjnNOKic0MWAb4oYIu/IIUWOPN44RjMF3/Pf5Gznr+qwPYGGUOVVH+F/Y6MeGUL52eZVkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxRhb6jgknyImrw0/WXKujrjUAq0z///enL7SOxxg1A030HzUsr
 GPCzIoYOP6I7e3B0HJMvEeJpIyOg8pXit1eKIxyBybfX4fL5mjTB6TVTyado+oWmayw=
X-Gm-Gg: Acq92OGOpc8HvA6n3Xndimak+UulBO3lcJVloiluT/X5VwZi74iC9FZPAx/KoF1QkMy
 9YaWQtSK3YuJuqLEPRp38YYKRRMyEZpdU1yZaeVlpCGYBzBwpw2FxOmuxERat8i/lnjpwk36pSE
 z5l3o2PBFnq0HyW5KrFP01Lts4Uu4FXR0iccIwgmZuASMd+JfigJt1W3GDKHmW8nJRbpRL/YJhW
 STqnPvQOLTuUAXcvRvA7IhhPqIMiNHv7TFdGKigNFX2iXSrtRe0ib/oprdTBBYsREzS/ZoeVWD8
 ognfvdo1Xom1QcoTlZG2uGv3SdGRzQHSgtzVD2c/eZuDYfbv93nob7JI2gOWh5zxGAWp/cuCekL
 LG2CC30iFbeP5R9Ejh0Ktc4R87+MBTMVXr81HVW31hqPnuSRe6cPlb1DrwX6Z4xjK8Ow9RnBwj/
 shnggpF2obkD5QXc3mqOZg5O7T3CmXfe7mrX10Il/r1mwFvdEUou2BCzqXBGlA4ViqHdPldUH/
X-Received: by 2002:a05:600c:46d0:b0:489:1abb:5559 with SMTP id
 5b1f17b1804b1-48fe4dad784mr107868645e9.5.1778951763841; 
 Sat, 16 May 2026 10:16:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fead15bf3sm42602285e9.6.2026.05.16.10.16.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 05/21] hw/arm/aspeed: Do not realize 64-bit CPU types under
 QTest
Date: Sat, 16 May 2026 19:15:07 +0200
Message-ID: <20260516171524.19184-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
CPU (Cortex-A35), only available in the 64-bit binary.

If we build this file as common object, these SoCs become
available in both 32 and 64-bit binaries; however when running
the introspection test on the 32-bit binary, the init() method
tries to init the Cortex-A35 type -- although not realizing it
-- which is not available. Simply skip CPU initialization when
running QTests on a 32-bit binary, asserting the realization
step is not reached.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast27x0.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 87dcb82e1b0..8311902f0c7 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "net/net.h"
+#include "system/qtest.h"
 #include "system/system.h"
 #include "hw/intc/arm_gicv3.h"
 #include "qobject/qlist.h"
@@ -419,6 +420,15 @@ static void aspeed_soc_ast2700_init(Object *obj)
     }
 
     for (i = 0; i < sc->num_cpus; i++) {
+        if (qtest_enabled() && !target_aarch64()) {
+            /*
+             * Introspection qtest just want to create this object
+             * without realizing it. ARM_CPU_TYPE_NAME("cortex-a35")
+             * is not available on 32-bit binary: skip it since we
+             * won't even realize it.
+             */
+            continue;
+        }
         object_initialize_child(obj, "cpu[*]", &a->cpu[i],
                                 aspeed_soc_cpu_type(sc->valid_cpu_types));
     }
@@ -693,6 +703,10 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     qemu_irq irq;
     int uart;
 
+    if (qtest_enabled() && !target_aarch64()) {
+        g_assert_not_reached();
+    }
+
     /* Default boot region (SPI memory or ROMs) */
     memory_region_init(&s->spi_boot_container, OBJECT(s),
                        "aspeed.spi_boot_container", 0x400000000);
-- 
2.53.0


