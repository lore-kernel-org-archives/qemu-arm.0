Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1386795njm;
        Thu, 6 Mar 2025 02:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaJbq70wXqPJ7b4AlnSPF3AKAlXybqm0MQ2Bj6yWqUoSwgYtwqlixVtJnZ7G+QI6twaLbnn0oNEvCvHA==@linaro.org
X-Google-Smtp-Source: AGHT+IH0ULNJcVwukToVyl3ee/lCX7VmvBpcbt3tL4Vc7nd2Cfb1txLg1geG3XgkEkfP8CsP0F+v
X-Received: by 2002:a05:622a:1ba0:b0:471:f272:985b with SMTP id d75a77b69052e-4750b4c6168mr84496951cf.42.1741257624755;
        Thu, 06 Mar 2025 02:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257624; cv=none;
        d=google.com; s=arc-20240605;
        b=V2lX9KGrldtw4uvqqbha2sooV0HnY4xCjZAfvAgdvY968n75Z/EH8f3fd7cKD/eFmr
         WeIKIOv9+Rs5+GDchtlNSfMC6NHHbx0Z6FnV5gEA4YM5LwqU0f6rMYURxzexYkZtDb14
         7FtO06sCDBAH9VKRLyTmDXMArKjwSMs5eezKxrz/t2CbfRWV37JWcwHurWKF0Bizk/vq
         /hJVbvdn11wvvlZWCbNKxY1v/RvYDxZvc8R67CGx6LsxIYIgG/LoPKVb9BhJ/LwAXSiL
         s6Luv9uSLU+8CWC9SeA38oR3g9jigcJHLEGsgKmsoD2Xq/G21XBA91XELWn7b4gqFt8D
         qRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=juS0YDGBGwrjsf+KAcS8oBj4ALbL9BR4zSrsPZrdMB0=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=egmE0Jx17CyNviLiGVJH1DS4wfHF5lsQkSAj/Ht9BOhnLa1AoGQLffSTsMi3HUGY4x
         9oGsxKyi8TMRmJMB4dfXSIhoM4hZXP82MB98jJHUJoT1WqORxLJxiUVPZkni81eORaxE
         EMbv/jNcRHqtHwZ1EL39jacYlLglGyXu9U6EPa+i6RQBNqsIa8odnFMORyl8yRILvqbx
         YfqvWxCg1RYFYHfok0v2OTKMagqkEi/JNgqxTntOrc/2YR9Jz+dSZYPtrIbAsEaT5eGu
         hOh38AoLz803qX6Kc3QUvMGxUHL+eyyMbmqGVqTPkLi4QLPDKPpGVR75DD8ytbdQj3Hp
         XM+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db3f5afsi8929251cf.539.2025.03.06.02.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:40:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8du-0005gU-1f; Thu, 06 Mar 2025 05:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dn-0005Zs-HP; Thu, 06 Mar 2025 05:39:47 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dh-0000TZ-Ty; Thu, 06 Mar 2025 05:39:45 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 12/29] hw/intc/aspeed: Add support for multiple output pins
 in INTC
Date: Thu, 6 Mar 2025 18:38:20 +0800
Message-ID: <20250306103846.429221-13-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OMSs9d10ViE7

Added support for multiple output pins in the INTC controller to
accommodate the AST2700 A1.

Introduced "num_outpins" to represent the number of output pins. Updated the
IRQ handling logic to initialize and connect output pins separately from input
pins. Modified the "aspeed_soc_ast2700_realize" function to connect source
orgates to INTC and INTC to GIC128 - GIC136. Updated the "aspeed_intc_realize"
function to initialize output pins.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h | 5 +++--
 hw/arm/aspeed_ast27x0.c       | 6 +++++-
 hw/intc/aspeed_intc.c         | 4 ++++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index bb634d2b4a..41b1f82d73 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -16,8 +16,8 @@
 #define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
-#define ASPEED_INTC_NR_INTS 9
 #define ASPEED_INTC_MAX_INPINS 9
+#define ASPEED_INTC_MAX_OUTPINS 9
 
 struct AspeedINTCState {
     /*< private >*/
@@ -29,7 +29,7 @@ struct AspeedINTCState {
 
     uint32_t *regs;
     OrIRQState orgates[ASPEED_INTC_MAX_INPINS];
-    qemu_irq output_pins[ASPEED_INTC_NR_INTS];
+    qemu_irq output_pins[ASPEED_INTC_MAX_OUTPINS];
 
     uint32_t enable[ASPEED_INTC_MAX_INPINS];
     uint32_t mask[ASPEED_INTC_MAX_INPINS];
@@ -41,6 +41,7 @@ struct AspeedINTCClass {
 
     uint32_t num_lines;
     uint32_t num_inpins;
+    uint32_t num_outpins;
     uint64_t mem_size;
     uint64_t reg_size;
     uint64_t reg_offset;
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 01a8e1d6b4..2d24361daa 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -530,10 +530,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc), 0,
                     sc->memmap[ASPEED_DEV_INTC]);
 
-    /* GICINT orgates -> INTC -> GIC */
+    /* source orgates -> INTC */
     for (i = 0; i < ic->num_inpins; i++) {
         qdev_connect_gpio_out(DEVICE(&a->intc.orgates[i]), 0,
                                 qdev_get_gpio_in(DEVICE(&a->intc), i));
+    }
+
+    /* INTC -> GIC128 - GIC136 */
+    for (i = 0; i < ic->num_outpins; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc), i,
                            qdev_get_gpio_in(DEVICE(&a->gic),
                                 aspeed_soc_ast2700_gic_intcmap[i].irq));
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index f062db5b72..4ce2904e0b 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -347,6 +347,9 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->orgates[i]), NULL, errp)) {
             return;
         }
+    }
+
+    for (i = 0; i < aic->num_outpins; i++) {
         sysbus_init_irq(sbd, &s->output_pins[i]);
     }
 }
@@ -391,6 +394,7 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2700 INTC Controller";
     aic->num_lines = 32;
     aic->num_inpins = 9;
+    aic->num_outpins = 9;
     aic->mem_size = 0x4000;
     aic->reg_size = 0x808 >> 2;
     aic->reg_offset = 0x1000;
-- 
2.43.0

