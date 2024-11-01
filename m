Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp549720njc;
        Fri, 1 Nov 2024 09:12:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNn/YYfqAtgKBIAYsIdrApkzGF0UTAC8dqSu6kYRTitF8LdP6e2PvQUrWQeKPfosGhApeIut/HDbFgVw==@linaro.org
X-Google-Smtp-Source: AGHT+IHtabjjM4pYaXz7D1zyE5GC6ehveo9Le8Vb0bg0IU3ZoS8I57EprBCIiWJ9P5JoLhSq2RSs
X-Received: by 2002:a05:620a:400b:b0:7a9:bafd:635b with SMTP id af79cd13be357-7b2f255633amr871578085a.60.1730477534851;
        Fri, 01 Nov 2024 09:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730477534; cv=none;
        d=google.com; s=arc-20240605;
        b=iJyRbVnV6nP30w3F+fSaYTdeZHsy6Se8YM1dwjO55EyKSBkCv5wmVCVLolbyOIRnnA
         Tt87f4SXGVUsHhhw2YZ4UeHQnzP3bH1eYeJ5k+wnbn4sEvzGvPPrx/wWI+iXoDCFEwJm
         HVOyBQYUjiaGI8kxvwdrnBf9E7d5Wwe8jI0GNw3voXM0bAxETQyOnCqWYRwBnxr7Zn/j
         6El0Etr33wo+yYnzlS1eIRKm7yXPOcw/4KQjzV6iYM2V9hrK5ykz2WCGY/tlz7QHguS8
         1Re+QftWdpEjm8ZhVNFrfG9hPPY4kYSvyk9lT45ieQbfpSmEA5xAcZu14zBoh6AV3+EM
         IEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6fhSn5hEytgSspXIQ7EOuLQkNlvmpGv4ycpV45iM8Ao=;
        fh=OIPXRay+9ievwXSALG5WYw17pADDfC6/ixvBP8KmSec=;
        b=DNEcJt3rx5jpg4uH8zXtr96ggE9rUAk8GgRQe+CjJAZFEUKzOUfGARlBc+5wZujeJ2
         8xJgfNEsm54pHlsWZ6sVkWdX1GF2ag8f5fa6sNYLZeXt53gUNS+dWr7VirRp8awJjkp/
         VisaPrpxsIAaQMdpJYpdq0YRH8wHnJz4/3WV3XL4eYmbGyuKOwTEWtdEM+3GwdjOLlUf
         qitlFOEU42I1ATwq2p4jNesRZw3KLrwly3jrU/+bFNeZTbUS6mE0d8L8LA5EC2qlA+vs
         jpHyaLkWEP6SncSwJa+Y83w6zRKOb5GxNS++EOquTpNV8zlx6hSwbZr1tsZsFz0r+8y9
         JmUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lumKceIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f22c5si456107585a.29.2024.11.01.09.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2024 09:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lumKceIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t6uFO-0004IW-EP; Fri, 01 Nov 2024 12:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6uFG-0004GU-Q5
 for qemu-devel@nongnu.org; Fri, 01 Nov 2024 12:11:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t6uFF-0008Ga-1Z
 for qemu-devel@nongnu.org; Fri, 01 Nov 2024 12:11:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so1217692f8f.2
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2024 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730477487; x=1731082287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fhSn5hEytgSspXIQ7EOuLQkNlvmpGv4ycpV45iM8Ao=;
 b=lumKceIHT6DbeCQehzEJizt2F3fG/mdecACmkJuJcUpf0USWdDBgJBKP4+DSDl8ett
 3x0MEnLrLSdD6ozEnKIM7Dby6JxuR0GNAhlJNyk2LZi02Nto4or3CpP58iYMlfiONH/Q
 T4WOO60v6cntM+9WtCAyi6tKyxvxhlSlsKadiSAWG88i13WZSnw7DTnP+HQoDgXS8/Ok
 +TyB5T2dYMlFXfwsxH5bqSiuyZPwMTArlsrFP+B5xI+WJmuA48RmbODYu7PYQZkb/O8e
 82gvCwVJ23c+fyZ0D9ou7NTpiWQoSnPPFRRsZ0zox4B5LdO/eaCVB2pT0BujSYZBq1Zf
 SG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730477487; x=1731082287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fhSn5hEytgSspXIQ7EOuLQkNlvmpGv4ycpV45iM8Ao=;
 b=En5SDgTFAPhOPD0rF3fjh6p7VNL9H9rRP23qDM5/ufnmyei/oeeH5iMKoiatfXoYXq
 XFK56N4nH0Fj4pknP91zU1mGkYshHok6TO4TqL5RGpJgx/k+Ke2Nzw/jb0+FmGZRFE8R
 ufsA8InFSartennBYhtwyra8MYmHscA9EsZ2SU3zAD3Wmcx42tPdnZXfrhMr6rPkZHfE
 XfsRT4hpJiIKG68WeESZ6dF2j8THN7M05QI8HOQlUigGaMqbWcdyrAwahFdcSJa3VS7L
 HTFBQH00EBEZbxyxgcQtMnG6SysRblagYM5iwPU/4Gur25SO3Y2pmqkJ+9mv5nLFs020
 peKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNAHU0L1eFxkatAPSS3tP0Zn8LLzN4NW6WnCh8jGylvJjIHepXYVEWPkY6ILe1rk4UWFojB68yZxpF@nongnu.org
X-Gm-Message-State: AOJu0YzlJqhwVx8qHRaAtfqcp3mmhRApyKoiJ+KuXYDD/JZMtQaR3ezk
 cCNeJuRotK+g6t3qd+Un0Xc0f0as15z2jSdqSUPUzMfPInLGOpmtACkPMNljVcXluKkrj2dX/or
 q
X-Received: by 2002:a05:6000:3c6:b0:37d:3650:fae5 with SMTP id
 ffacd0b85a97d-381c7ab60efmr4083705f8f.52.1730477487282; 
 Fri, 01 Nov 2024 09:11:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7f80sm5658313f8f.20.2024.11.01.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:11:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
Date: Fri,  1 Nov 2024 16:11:24 +0000
Message-Id: <20241101161125.1901394-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101161125.1901394-1-peter.maydell@linaro.org>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CcgCqmPfw4KE

Use the private peripheral interrupt definitions from bsa.h instead
of defining them locally.

Note that bsa.h defines these values as INTID values, which are all
16 greater than the PPI values that we were previously using.  So we
refactor the code to use INTID-based values to match that.

This is the same thing we did in commit d40ab068c07d9 for sbsa-ref.
It removes the "same constant, different values" confusion where this
board code and bsa.h both define an ARCH_GIC_MAINT_IRQ, and allows us
to use symbolic names for the timer interrupt IDs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed_ast27x0.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dca660eb6be..5638a7a5781 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -13,6 +13,7 @@
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/bsa.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
@@ -416,28 +417,28 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < sc->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&a->cpu[i]);
-        int NUM_IRQS = 256, ARCH_GIC_MAINT_IRQ = 9, VIRTUAL_PMU_IRQ = 7;
-        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        int NUM_IRQS = 256;
+        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
 
         const int timer_irq[] = {
-            [GTIMER_PHYS] = 14,
-            [GTIMER_VIRT] = 11,
-            [GTIMER_HYP]  = 10,
-            [GTIMER_SEC]  = 13,
+            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
         };
         int j;
 
         for (j = 0; j < ARRAY_SIZE(timer_irq); j++) {
             qdev_connect_gpio_out(cpudev, j,
-                    qdev_get_gpio_in(gicdev, ppibase + timer_irq[j]));
+                    qdev_get_gpio_in(gicdev, intidbase + timer_irq[j]));
         }
 
         qemu_irq irq = qdev_get_gpio_in(gicdev,
-                                        ppibase + ARCH_GIC_MAINT_IRQ);
+                                        intidbase + ARCH_GIC_MAINT_IRQ);
         qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
                                     0, irq);
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                qdev_get_gpio_in(gicdev, ppibase + VIRTUAL_PMU_IRQ));
+                qdev_get_gpio_in(gicdev, intidbase + VIRTUAL_PMU_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(gicbusdev, i + sc->num_cpus,
-- 
2.34.1

