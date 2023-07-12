Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741775eje;
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH3pC0CIPq+aQZn+GBZUtpxDcb0FZJtE9RVY5/JODtFZMsTYwKvrNLdKIsoQHQePa3wzUs7
X-Received: by 2002:ac8:5a4f:0:b0:3f1:f599:c259 with SMTP id o15-20020ac85a4f000000b003f1f599c259mr26129337qta.24.1689180105436;
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180105; cv=none;
        d=google.com; s=arc-20160816;
        b=qYxYxFBYzRedvqvdjrMEat5sPo2XKDoxlmi3BuIDTA2dciGxpsiu6VDB5Bt3BOu/dm
         W4QPi647jAYxKA6feuk3etVx8hBMkbyuH3EuEfduXHgYP0OOUsUOwx9+5TgofpXTTsfe
         jLW71jt14fxOqoQbiOlfsfwfgheDjZ+yhgvVZO6/j5Ztm1rBumXNNWAkHsCLwaTFko7P
         vqruXuKAkrJXqDJdKgMLShQAjb61shBQPjIkOxiClGXGWkuqDXzJ9a2QJqAX/Ss1DAGP
         YVpZlfpa2dfBq7HLRRnb6IafVATvOjsXMNQIgYKIccbNK2roqXaOhRKlKDtE0CG2YZWH
         oyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xmtJyFO7V0N3GIIPv5b5yYoD9PVz1E+U0tStDXlXmOE=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=tb52y/CEHE4xj+rG35aU5/iAMX2ufwK6nI2MacaYyeGGe4f3+X5HQ5fGrPIud6kMMY
         uCwXubvtrWyFqdgFpFZSGzRc2njOV0HUSgNrMkYC/GG4mTf7sRdRvslFu81qq/gAsiby
         BTLoZ09a7f9O+FoF1gQY4Rnpyx212a2tNv6P52uZ+3415gBJhQj8TiqXL/MhNXii6yP6
         thYxMSyX2xbv4mlso0809Vgn7aAJtc86rvujewhF3R9m8IzDtVz0deRhkci1vLZt73NP
         aT+Vyrj3acevMeDoEYgXTqTCUc43Sb2mPDSROTLm+T4j3+EthOo/Tw6BzjOtmR251oV3
         1g2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=HfKXGN38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020ac85982000000b004033da4fab5si1966484qte.211.2023.07.12.09.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=HfKXGN38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJcst-0003jM-9a; Wed, 12 Jul 2023 12:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsr-0003iJ-Rj
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:10 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsq-0004ox-5m
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:09 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b9c5e07c1bso43534555ad.2
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180006; x=1691772006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmtJyFO7V0N3GIIPv5b5yYoD9PVz1E+U0tStDXlXmOE=;
 b=HfKXGN38vj576wOmv8V2vj7IaUTncZsrIjuW+RiIBcFb5PrgplsoTLK1ds/TgyFssA
 ZiR7mxi9OX+a0UjpLUGhVRi1QF/zEIi2KRfkBeUTbUJb5qen89N27J1hNM0CKLJTSevI
 ISJyGE+vlO28Sqps4keGkP13MfVl5p3zzJQ+uR6e/Ozb1CHTzOOkZdYnSbXi9N4NUsHM
 QrqCCnen+xhvDbd/6N32rCIrdaTBYn8KS7vZ9AznyFreNRTFxHI+2z9q/nFJ6lzTDTWi
 7UNfxaEcQYeewe2G9I1+Sk7yQH2Mw3urvxNtEH+K/+f3UskYwyax7SGFwltq47a7kuxq
 OGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180006; x=1691772006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmtJyFO7V0N3GIIPv5b5yYoD9PVz1E+U0tStDXlXmOE=;
 b=W2fMRkhKKv/y+roazwK7oQzY7zTEQmI3FzQOjJUq6fvIILMC0Yx93NamsSmw+8UPAb
 N/A79RN61nHNNFA8uer905sQeJLqMGVG3LKhqtPiQhovFiLaGOvdYpWi94cOU85L8ydc
 p4rhbVdOPuQ+EmN4G5EYoqaVp4Ln+We+UdtE+3qcWNTKL6CjXwCNvIloIRAb/V6y4ft+
 GNJn3EBU84Pr8K1ef5Hf7RajYW9GmmHUWrGHGoyspl7rpGXaeWCone9axE8CcqcwZNwA
 FP3DhQkqFWbAWaY/2VW7gMjwQNdxi65j4GkgBJ79qnR8FrOYsGnBT3+DLXIFzW1WYkJH
 7p+g==
X-Gm-Message-State: ABy/qLaHlKmQfad18jt+d3uzOorU8YuKRx8AZlYCj1Apw/A5RFxuUuKh
 ofwOmALJUVNKP5l5wa6HFCWYkQ==
X-Received: by 2002:a17:902:d2cd:b0:1b8:6a09:9cf9 with SMTP id
 n13-20020a170902d2cd00b001b86a099cf9mr24724202plc.26.1689180005965; 
 Wed, 12 Jul 2023 09:40:05 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 03/10] hw/riscv: virt: Make few IMSIC macros and functions
 public
Date: Wed, 12 Jul 2023 22:09:36 +0530
Message-Id: <20230712163943.98994-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1nR+qsjvK1LL

Some macros and static function related to IMSIC are defined
in virt.c. They are required in virt-acpi-build.c. So, make them
public.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 25 +------------------------
 include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 46d3341113..f6067db8ec 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -37,7 +37,6 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
-#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "hw/platform-bus.h"
@@ -53,28 +52,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qapi/qapi-visit-common.h"
 
-/*
- * The virt machine physical address space used by some of the devices
- * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
- * number of CPUs, and number of IMSIC guest files.
- *
- * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
- * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
- * of virt machine physical address space.
- */
-
-#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
-#if VIRT_IMSIC_GROUP_MAX_SIZE < \
-    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
-#error "Can't accomodate single IMSIC group in address space"
-#endif
-
-#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
-                                        VIRT_IMSIC_GROUP_MAX_SIZE)
-#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
-#error "Can't accomodate all IMSIC groups in address space"
-#endif
-
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =        {        0x0,         0x100 },
     [VIRT_MROM] =         {     0x1000,        0xf000 },
@@ -505,7 +482,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static uint32_t imsic_num_bits(uint32_t count)
+uint32_t imsic_num_bits(uint32_t count)
 {
     uint32_t ret = 0;
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 4ef1f660ab..00c22492a7 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -23,6 +23,7 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/sysbus.h"
 #include "hw/block/flash.h"
+#include "hw/intc/riscv_imsic.h"
 
 #define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
@@ -128,4 +129,28 @@ enum {
 
 bool virt_is_acpi_enabled(RISCVVirtState *s);
 void virt_acpi_setup(RISCVVirtState *vms);
+uint32_t imsic_num_bits(uint32_t count);
+
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 #endif
-- 
2.39.2

