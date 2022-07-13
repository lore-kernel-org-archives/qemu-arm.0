Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp75394lfp;
        Wed, 13 Jul 2022 01:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRNbghfp+1/ugA2PnuaiiRig7gop6NGoDBSiugtHRiLt/0XZHwkw5u00zF9g0t9ReghInH
X-Received: by 2002:a05:622a:1345:b0:31e:b991:ac1e with SMTP id w5-20020a05622a134500b0031eb991ac1emr1835963qtk.279.1657700077709;
        Wed, 13 Jul 2022 01:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657700077; cv=none;
        d=google.com; s=arc-20160816;
        b=v3MEpPYAkl/xHz7PoVo71qQoEVdZdPBW99M/tQstJNVXWFbaiAa3WFPXeuE2Yo9ypo
         KItRX3DDkOfq6jG4jD3MiUX9XBChDlApvxY9TzkFNp7Qaw9uYFM1nZkt3ZT8XPAwMrjE
         YJ9ObZlm2HcdN+/O4fSEg8fRTsfeLMYPFp12NZ9odTanA7adru+xsL6CYFi9VMAePdD6
         LCKX0a6t6JnfRtYsVzRHdpa9COBrboMaDOGK76Z5a/+ApXLJ8OejbWX/LAH4Tu8vLgMn
         woLSw06R5ZsmoEpm3w2c53gKLolF/Qm3NxeHqQKphwg+haTiRFBTMSdgBbzHCA+3Imus
         yCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Zhg/dzIqV2hI0NHRu8xPF4cHmhk9zG7upi2H94hdGa8=;
        b=qorUZzS7rc4a0ivwfqFcwQev0B5VLl+rRWGItyb/5+6s2SEMBytk39vOxy3MNO+B3r
         P29ZqV7zJv8uotVowN/w52pXzn2P1BszWRqhY3TnOdIEH8AJvS9tUT3rq5fKeW8Ju0kT
         GdMbw8lVUK/7u3nJWcDHpJPGfQTbliGLE78RmNEG37LzK1WZAjy/DAb6NXMCuXnCf6Gk
         X/k9uSHNCbZZ2ZBWVTOsUFinEbeZ4MCZ6HuIwD6l16ZGXingsJHohKNitbTyfYRfSCUw
         +6tPBLRtlrIJDvseY4O3u7gxFmftaM0WIJIlyl1yNChSb5/eyyBTC3BnkNOsGVbVPk5/
         E4CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a0562140dca00b004732a128d51si7693608qvt.202.2022.07.13.01.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 01:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXW1-0001WD-6g
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 04:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBc-00081l-7L; Wed, 13 Jul 2022 03:53:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56591
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBZ-0002Yr-Uk; Wed, 13 Jul 2022 03:53:31 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHF0CcNz4ySg;
 Wed, 13 Jul 2022 17:53:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHB6pCPz4ySW;
 Wed, 13 Jul 2022 17:53:26 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/19] aspeed: Add AST2600 (BMC) to fby35
Date: Wed, 13 Jul 2022 09:52:45 +0200
Message-Id: <20220713075255.2248923-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKyy3XgbXPdz

From: Peter Delevoryas <peter@pjd.dev>

You can test booting the BMC with both '-device loader' and '-drive
file'. This is necessary because of how the fb-openbmc boot sequence
works (jump to 0x20000000 after U-Boot SPL).

    wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
    qemu-system-arm -machine fby35 -nographic \
        -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-7-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 03b458584c26..5c5224d37471 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -6,17 +6,55 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
 #include "hw/boards.h"
+#include "hw/arm/aspeed_soc.h"
 
 #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
 OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
 
 struct Fby35State {
     MachineState parent_obj;
+
+    MemoryRegion bmc_memory;
+    MemoryRegion bmc_dram;
+    MemoryRegion bmc_boot_rom;
+
+    AspeedSoCState bmc;
 };
 
+#define FBY35_BMC_RAM_SIZE (2 * GiB)
+
+static void fby35_bmc_init(Fby35State *s)
+{
+    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
+    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
+                           FBY35_BMC_RAM_SIZE, &error_abort);
+
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+    object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
+                            &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
+                             &error_abort);
+    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram),
+                             &error_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0,
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003,
+                            &error_abort);
+    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
+    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
+}
+
 static void fby35_init(MachineState *machine)
 {
+    Fby35State *s = FBY35(machine);
+
+    fby35_bmc_init(s);
 }
 
 static void fby35_class_init(ObjectClass *oc, void *data)
@@ -25,6 +63,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Meta Platforms fby35";
     mc->init = fby35_init;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
 }
 
 static const TypeInfo fby35_types[] = {
-- 
2.35.3

