Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4464878lfc;
        Tue, 1 Sep 2020 03:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzFtPOGBI3BjmYkfbghbWHY3kArGvQADkjnZe/g3zSPvIbxryIFVjY3sUlWNnNps1a0PZH
X-Received: by 2002:a25:a081:: with SMTP id y1mr1816212ybh.370.1598957068401;
        Tue, 01 Sep 2020 03:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598957068; cv=none;
        d=google.com; s=arc-20160816;
        b=LXCUMry7MXZHR1zd7a23jXfcNYEWx/iNDReNhMI7g56cs63AqTJv+6SzEPy7yMiXF/
         JfpQ1NrrirllQ9Puy1jN3vWKWWVigg9FIZR8l/QbEI6/8ciHIbHWlyn5Dwi37nHS+cTE
         MMivtSipsyiMmRmqlEpsueGDnCOxvI1rYGUHTkD4uAdj2tcp6GAfz1AguAXsduTrby7V
         9rI6p5f1VkpSWbpVqBF8dBo/KEP2tQoWl+KCi3osodAzsPbgYaQB876ImHOgAJC5YKn3
         2t+S56CnhhgZN9a1vQC8fEmpLidS5IUX2nztk91kKNfgdhqRmhm0BQLTZzeBNI9/ENZo
         FPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/6T9K6cB8UVV4OMBVpNqFssF0Hs6NHMYQ4tqHB6tDmc=;
        b=ZyODk1XBP4d1JQlrKX2mSY3KCdEr0Z/JGTDT8ag51UAkNJDSnB82d1hfPdpVcAugwJ
         I6cZHoMwIE7K+AJQhIVOkzDKOjGG1CfSvUmrqqXNTOI7J3JjR6rZOxfeuTVGjaOD45r2
         4j2dNkn8zs0mYaWisCvQfpxRDbIcJ4qf9ZnDY7zvln177v5QOOQkk8MOcILgGDdcSsuR
         6AtbQBuDCMbsFlAhPvJwCNe60qNS2Ij42BlmeRAXHbFNzZ/9t8dNRoH9PKQ4/zc8mTz1
         kIfhXt5Jbo1/x5ib9FwLlraYYqEB7PM0f8LFUpyQLH2iqzpoJ1Syri0Cuj1li99UIqYz
         ayyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rSkZ7X8k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si799210ybl.5.2020.09.01.03.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rSkZ7X8k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3m7-0002DG-PV
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ik-0004ra-P6; Tue, 01 Sep 2020 06:40:58 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3ij-0001t5-9t; Tue, 01 Sep 2020 06:40:58 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so965817wrm.2;
 Tue, 01 Sep 2020 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6T9K6cB8UVV4OMBVpNqFssF0Hs6NHMYQ4tqHB6tDmc=;
 b=rSkZ7X8kUrd1wGRYX5B7WFEO/QF4TYJ+3JQmfHKvkF6SXIFOP0HKs/VwAZhLJkq+nq
 EaqwAdc4qz9b8RLL9cP/PLn6uV4CDyumJ37k1+JTisKFb8jANR3kMGFkRQD+c71TVwUc
 mreOAALZDYEgOX440Hvhp7XgAR82yq+VAmpjh3WHQ3EhUcVZFZJzslPIb34dN1UbAbDS
 iG+HFx60g3ryQrHHAYkv2d9rqfDkGO4lm0XWctqK7bhu6gL8tZymJIUSbwueyKzB8Wc/
 kvEJcJYi7PYw1Oi3umjGdc9VFxnyhIBWmwe1LCnJHuajdGQ7Hh19SkzLkSbFETc45WM9
 8Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/6T9K6cB8UVV4OMBVpNqFssF0Hs6NHMYQ4tqHB6tDmc=;
 b=HcHzcnHSapCYCL/N2W2gXLi++i2hkNRfnLPbvie6ybSgqFfGGP5+eymhNW76gajzGe
 Y1Y6NRN/Vcl6Ww4Encn3PvA4wZfwyh6tvsVdn+CVG9inzYVxBKmYbRVAKjBJAK8aOVFF
 ft6wsFKSaQ7rzJ1R85vhPVGnnsyOFPiM6Shc10dbj4G2S8/vkLhYBStVhGgVUJ5tCSVP
 Ldoh0xR4I0JZAFtYbQkT+Q/W2EZ1GtN/1oaK2n6efwZa67XsjVXCrPj/uX4qUkGEZknh
 zkk4PMthsKZGXElDa5Y9rM7S7No+bJFjWiY9mSvN4URo7aFeI0Hk61Gp5nSoB9Rs5hLG
 /G7g==
X-Gm-Message-State: AOAM530bB6VbQ6wpCt0CTH0BLnlEgQQSdOhHRh7BkguWYY/oezN9m26h
 50X0qt8ajl1MrdGCkdYFe7lC13wtGdQ=
X-Received: by 2002:adf:eece:: with SMTP id a14mr1157824wrp.330.1598956854735; 
 Tue, 01 Sep 2020 03:40:54 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id o9sm1541461wrw.58.2020.09.01.03.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:40:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/isa/isa-bus: Replace hw_error() by assert()
Date: Tue,  1 Sep 2020 12:40:43 +0200
Message-Id: <20200901104043.91383-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901104043.91383-1-f4bug@amsat.org>
References: <20200901104043.91383-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nENPhu8pI7b5

As we can never have more than ISA_NUM_IRQS (16) ISA IRQs,
replace the not very interesting hw_error() call by an
assert() which is more useful to debug condition that can
not happen.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/isa-bus.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 58fde178f92..10bb7ffa43a 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -21,7 +21,6 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "hw/hw.h"
 #include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
@@ -85,18 +84,14 @@ void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
-    if (isairq >= ISA_NUM_IRQS) {
-        hw_error("isa irq %d invalid", isairq);
-    }
+    assert(isairq < ISA_NUM_IRQS);
     return isabus->irqs[isairq];
 }
 
 void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 {
     assert(dev->nirqs < ARRAY_SIZE(dev->isairq));
-    if (isairq >= ISA_NUM_IRQS) {
-        hw_error("isa irq %d invalid", isairq);
-    }
+    assert(isairq < ISA_NUM_IRQS);
     dev->isairq[dev->nirqs] = isairq;
     *p = isa_get_irq(dev, isairq);
     dev->nirqs++;
-- 
2.26.2

