Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCD3CD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLiP-0007ue-Vg; Tue, 19 May 2026 10:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLiL-0007tW-Qu
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLiH-0007lQ-Oj
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so43643075e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779201983; x=1779806783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0StEuL9GLXulveXowFLLLdh8qkEvL46xRR1raUMNj0=;
 b=FIE7ofxfytuBLh511WK+hBC7VUucpgipYrMExkBVoMhhRT7U2jaosKwKHxQ83oH0i2
 t/ojh2IWQN93EdJiVUEAa3AA77yZ8dTT4f60ra2K0uYUXcsbqgHMq60ZKPjQKgZY2TQk
 b47SnHJASFVHQRc6M630IjZ796m3ZB2yYRGWlbA5khYdzoXhn3lnKYGMq0095ojWbBcW
 pINjcUyhOFbb5U6A74CTgqvCdU50U0cJZDxpv+Rv0DztK/4ewdIyDLPofOWCEqpYCFRH
 1WO0nENXhgqSBNMVIhbVGzA6p128i0I1tFXlLYFzKCRBeFEQUjUQhsT96pmhyCyBzfsn
 5G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779201983; x=1779806783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I0StEuL9GLXulveXowFLLLdh8qkEvL46xRR1raUMNj0=;
 b=dSm196Fp5gtKTxju2iEqnxgSt6kXTGrorQ3MWu1BC2ZEKYftY8sA7VM2ujNMEhxVcq
 cKQJsgBwkC4QAi7tK5qi2NHu6Dvn4S2x6JsCKiWirBD74AiiQrH9wgrpJb+BqNSJL2SI
 Ex5vaKz9soC68hwRsgM5fwSmzS6Pvm07nCn2bJHOBixgdxDKgCqdg5WvzHcPp3LIEtdo
 pEJCpPgDl5JoL9pa6LtI2cxMbIxEwUDR9rzMgkDdWPTH02E1VfJzVRrwZ8lTTVU+nzvr
 m2L2nWBPuwawxQ9Cvg0QnN7Gu1ET0N+0qGNcOnHZEhQx2qa5Jte/ay+RlZRRCPa7ylkE
 rgeg==
X-Gm-Message-State: AOJu0Yw528vkLzE9MJqX31cBsi+AXkXWJiPqxY4BEN9wYTrqK0/TDzr/
 Z3sa7N1fDN9XXYi03V77X+qoW3eaya3WkSECbImTsTuHDvdVuKaSOsNCSzWDIV+VHwsIjGG76q9
 DFg2PbUA=
X-Gm-Gg: Acq92OEfg++SZuVxLVjWKVM9zu9HC4Jlj/rmbXBO+u0uhb5sWywKM14Muvy5kfq80DT
 GegXlqf2Ip+O1hlxJTs7Awuf3UFtTzVXW/nwLuZOin+aFAGj+tQuV+E6aEuaxoI/zfvHY4Tqw21
 CeEFNnCvbko3eP2/D1Q9chH4YnMyaxEd5wVVqo129Lk4VZsAkoPwzDYMwmJ4+2vDo4ik7RCe9rl
 qn7XN8IJbns86zqG7zPvlEvI2F7Rs+Z3Hm5SAp7vbZy0Uw7AEyDBUAr+qV3YPRqWFTc8Jq3C014
 lYBOe+kEC5FXJyocruWl7VMbKngZ1Ik8LcENDh4w4LjZQVqqUv946Q8Fw+10ZXuIjC8OrKm7tv6
 PJUOMbyPdjz2PuNwWTEAj83lK3Wtlwkttf1Cde3e/RVzeGMAKmjbsC4S0K+3TBKyR6pvcwxrm0B
 dPpVxKw4fIprZPJ3GAEUhMyfLpDk394WsUxvHv3V4TjE8J/2yVqTVb4aRSbpUjB5TPmZHNnvF06
 3gv6e7c33A=
X-Received: by 2002:a05:600c:4e02:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-48fe6322416mr323420225e9.18.1779201983149; 
 Tue, 19 May 2026 07:46:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490191b5244sm24524335e9.3.2026.05.19.07.46.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:46:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 04/18] hw/arm/aspeed: Do not realize 64-bit CPU types under
 QTest
Date: Tue, 19 May 2026 16:45:39 +0200
Message-ID: <20260519144553.91483-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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


