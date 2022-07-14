Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp728525lfp;
        Thu, 14 Jul 2022 08:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s77h0DSi8mIG5FUSnsT6OqPqLXdK+Vu5gc+xM7TRsrpKy/1jPvgW2y9mD1jR7yHZSFcjeq
X-Received: by 2002:a05:622a:394:b0:31b:ed25:393f with SMTP id j20-20020a05622a039400b0031bed25393fmr8826094qtx.88.1657813759226;
        Thu, 14 Jul 2022 08:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657813759; cv=none;
        d=google.com; s=arc-20160816;
        b=GBt3pdKN2sMwspcW/lkp7foj2HiCSgro/2iCwyfamvZBBTWhceaxvAtmk7V8YDJCHU
         vnh2sCW+PjDTTE+khf/ANMU3kDTEv95dyZzUP5+3Cp87pmT/In3QuG0paiEkRkOShavG
         LdF/nraMzNNlqaM9VaBwg0gq1euWc9aVkxdNtXEDDuCrrnA185FLu0mDQhe6fs5Kwm9R
         MlGANV5726aBZXG64zJej3702sS8QNf/SdYPbIxX/pKKXgnJTwhW9lnW1MIibhIepvmE
         xvXiZSNQcS7PCXknNR3MT481td+1MBDz7t3TG8idRztbSeKa/Yxleze9o1rfhXeo80nV
         HDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=sdToyV64I8Q2SSCPTO0B6m96X3Y5CY7EWP0SenSuOWM=;
        b=Fd4HTqwaM2l/snbLMxJ/b3ESq5cX1HcwLIfLN64ldoGBngWuIL0mPqicTjszUAnHPb
         ST8TQjvnJGbAg4d/Z6aI1z/zMKsgNNTdhoT1UQc9yErjNwiMC2XwhGBBMfr8d5MXJQhb
         Sw/e54ghbtuJrKvcZdnH0Ax8hU17DMpGBbeTiiGgFjYSYO4sVOStUcFkJQR8e6d96NSI
         DKeUdONOQcasMOQua/ouPXv89Wz8+uq1sbXHna/XuxtoONSWbJtdTHO9vOCsgmMjafg0
         TUXlHBb+47kpJNF2IW4WQMI3ttNanYHn6B+z21ZYuRKpq7KiJf4Ro8J8h31Tkgsn/Cim
         qAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs8-20020a056214226800b00472f75492e7si1139404qvb.420.2022.07.14.08.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC15a-00035Q-OR
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC121-0005Mk-2U; Thu, 14 Jul 2022 11:45:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:32919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11x-0000es-BZ; Thu, 14 Jul 2022 11:45:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjP39bRz4xht;
 Fri, 15 Jul 2022 01:45:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjM4vg5z4xdJ;
 Fri, 15 Jul 2022 01:45:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/19] aspeed: Add AST1030 (BIC) to fby35
Date: Thu, 14 Jul 2022 17:44:48 +0200
Message-Id: <20220714154456.2565189-12-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l17odqDPjnqE

From: Peter Delevoryas <peter@pjd.dev>

With the BIC, the easiest way to run everything is to create two pty's
for each SoC and reserve stdin/stdout for the monitor:

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
    qemu-system-arm -machine fby35 \
        -drive file=fby35.mtd,format=raw,if=mtd \
        -device loader,file=fby35.mtd,addr=0,cpu-num=0 \
        -serial pty -serial pty -serial mon:stdio -display none -S

    screen /dev/ttys0
    screen /dev/ttys1
    (qemu) c

This commit only adds the the first server board's Bridge IC, but in the
future we'll try to include the other three server board Bridge IC's
too.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-9-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index e7405f6570b3..79605f306462 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -11,7 +11,9 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "hw/boards.h"
+#include "hw/qdev-clock.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/boot.h"
 
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
 OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
@@ -22,8 +24,11 @@ struct Fby35State {
     MemoryRegion bmc_memory;
     MemoryRegion bmc_dram;
     MemoryRegion bmc_boot_rom;
+    MemoryRegion bic_memory;
+    Clock *bic_sysclk;
 
     AspeedSoCState bmc;
+    AspeedSoCState bic;
 
     bool mmio_exec;
 };
@@ -110,11 +115,31 @@ static void fby35_bmc_init(Fby35State *s)
     }
 }
 
+static void fby35_bic_init(Fby35State *s)
+{
+    s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
+    clock_set_hz(s->bic_sysclk, 200000000ULL);
+
+    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
+
+    object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
+    qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
+    object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
+                             &error_abort);
+    aspeed_soc_uart_set_chr(&s->bic, ASPEED_DEV_UART5, serial_hd(1));
+    qdev_realize(DEVICE(&s->bic), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&s->bic.fmc, "sst25vf032b", 2, 2);
+    aspeed_board_init_flashes(&s->bic.spi[0], "sst25vf032b", 2, 4);
+    aspeed_board_init_flashes(&s->bic.spi[1], "sst25vf032b", 2, 6);
+}
+
 static void fby35_init(MachineState *machine)
 {
     Fby35State *s = FBY35(machine);
 
     fby35_bmc_init(s);
+    fby35_bic_init(s);
 }
 
 
@@ -141,7 +166,7 @@ static void fby35_class_init(ObjectClass *oc, void *data)
     mc->init = fby35_init;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
+    mc->min_cpus = mc->max_cpus = mc->default_cpus = 3;
 
     object_class_property_add_bool(oc, "execute-in-place",
                                    fby35_get_mmio_exec,
-- 
2.35.3

