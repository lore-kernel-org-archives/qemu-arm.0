Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2205714ejc;
        Mon, 9 Jan 2023 04:20:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdMp4v5MdRUdsV1IsTgipayU7QOT7rvIfq3+8Tsh4Oi8vHXbXGZ8qNTZ1viNhhAJf4conj
X-Received: by 2002:ac8:44d4:0:b0:3a8:11ab:cacc with SMTP id b20-20020ac844d4000000b003a811abcaccmr85003472qto.17.1673266809603;
        Mon, 09 Jan 2023 04:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266809; cv=none;
        d=google.com; s=arc-20160816;
        b=SzkUQik65BptbaswS/Ol31o7LKe9ksWLQwshnf/pUkYNo86/lJ0+C6xuU8klyKvi6O
         syFC+JAmJWXzzrw8l3KIY9sregvr8QDtayfVjP/zOg8RgFAN0ZS56DgvH4cI5Zk7FaGT
         uYqV3/szF8rEDHmGN8ysqXcNyxgyDwq537+d55TZxIZYdrTTvKViDAaHi+XjGtmXDZiS
         lvWKfvb/NxiuR1b3ToPLzfceJvRx5Fvy3DFy6e2K6aa3rG6zGxVQeMsZxEqEmO+qkxij
         7zc6FRQOCOdZR/6ZpTqvRo3lxKXgIOWZq2af89vW/+FFV0ahp2ZB7793IU2DfpX27zFd
         wGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qf8hVEmg0ERboJd2XrjaxSQd2LANKOJppGaLQo7Delg=;
        b=nas3n/KQ/diZhk95dVZhJliD/LYhEHmjJCdtHUEPAsOJWrb7g55REGWZkwrbLF6YFb
         W0OhEdAKEXs51BM2reaxkgF0WxLGfgZ9foF8vgjM/mgRFQ5FCnM16qJSMWa+dVXkWBSN
         5qmPqmkiGME0a8Rzr8II7jYlz9m0Q+i3ZaQBNvWdLjEcwz0YYBjui1YJ0dCmmaZMwFZq
         0e++J5Mr6Dk+XC/jQbBLWl3QX0LZhy5KWiq1w42RJUyu5EiR48GVaQY9Ch0VqUpbwiVc
         wiN1CIAaHFB7eEV27OYftffpGJ82ApnAlZoYtFNBPf8f3wtNJWX9XlbdNUOwLS4S9MQB
         DSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rZw61Ejv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd14-20020a05622a5c0e00b003a99334f595si4651994qtb.655.2023.01.09.04.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rZw61Ejv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqjS-0003OP-UO; Mon, 09 Jan 2023 06:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjP-0003NQ-G0
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjN-0008CT-Ir
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3969049wma.1
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qf8hVEmg0ERboJd2XrjaxSQd2LANKOJppGaLQo7Delg=;
 b=rZw61EjvJ2aYT97ub4xB6LRt0F0xKKVA7oyA6cAW8S1IFPjUS/Yz9764XoSoSowELq
 cXr2LYvoz+Kgv58GWRXtRps6MXW6H8ayOfFDu0ED3zg5MiaecsrM2OZVSciSLl1+GM8e
 0uVLHf3YgeKs0LpnwhhWIF4nDIw4OG1l0x73Trm3O+YbD8pEI9yeVwzzkPQSjpjKFYwh
 ppSH/nWekBU2upQdEvQvaK9By5MYBvap9n1PgSVpAZ49mnO3oVvL88w05ABINR74P2wV
 m4NQ4/Z5ejtPaXsRZBneY5M6nJFFvqLAaUAHlDLlW9gJhKKtbb3foBsMC4vfj1unf9us
 D66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qf8hVEmg0ERboJd2XrjaxSQd2LANKOJppGaLQo7Delg=;
 b=mVdsRCoI2XkU6q1/suQMfJi3YPo7iIi4q8JvmJlCqvmGAGQKPpR/CQd+cTd1cT198h
 PBXAGRPrt5cCHrmeM+3QX6qetUC+Q9w+M1nu4YFTssxYLSghvRyTr0mlYIoqSxQY1c47
 KR/Olwdm9ydozJdMGfArFPtwAxQa2Kn06K2Xw6ac/CDeOUuTuuNdytv+es4O9RJ/YLfT
 UrpELLRqgQJfypVKHu4WypnL3uxYRYRpdN+OvYeVJXzmWmExVgtqEhriw8x2uhErhXA5
 ccE441ei2oIa9zgHssW9+ZqRyEEUR6pxupCwBBuxPTJCl4mXbsGbK7Y0ZkCyBye4qSVr
 NITA==
X-Gm-Message-State: AFqh2konAFOZ+jeg9t3opGQW4x0Pzvblw9qmmZhEQtamaLCuZFm13q8Y
 joK4FFhi0+L4rY2fooh7/TpFNw==
X-Received: by 2002:a05:600c:4148:b0:3d3:52bb:3985 with SMTP id
 h8-20020a05600c414800b003d352bb3985mr46187630wmm.31.1673265260851; 
 Mon, 09 Jan 2023 03:54:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm10937675wmj.36.2023.01.09.03.54.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/13] hw/arm: Remove unreachable code calling
 pflash_cfi01_register()
Date: Mon,  9 Jan 2023 12:53:16 +0100
Message-Id: <20230109115316.2235-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UBuPtEh7y9on

Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
QOMified") the pflash_cfi01_register() function does not fail.

This call was later converted with a script to use &error_fatal,
still unable to fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/gumstix.c     | 18 ++++++------------
 hw/arm/mainstone.c   | 13 +++++--------
 hw/arm/omap_sx1.c    | 22 ++++++++--------------
 hw/arm/versatilepb.c |  6 ++----
 hw/arm/z2.c          |  9 +++------
 5 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 579d363577..2ca4140c9f 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -69,12 +69,9 @@ static void connex_init(MachineState *machine)
     }
 
     /* Numonyx RC28F128J3F75 */
-    if (!pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "connext.rom", CONNEX_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 36 */
     smc91c111_init(&nd_table[0], 0x04000300,
@@ -96,12 +93,9 @@ static void verdex_init(MachineState *machine)
     }
 
     /* Micron RC28F256P30TFA */
-    if (!pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(0x00000000, "verdex.rom", VERDEX_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 2, 0, 0, 0, 0, 0);
 
     /* Interrupt line of NIC is connected to GPIO line 99 */
     smc91c111_init(&nd_table[0], 0x04000300,
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index eebaed6e3e..68329c4617 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -130,14 +130,11 @@ static void mainstone_common_init(MachineState *machine,
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
         dinfo = drive_get(IF_PFLASH, 0, i);
-        if (!pflash_cfi01_register(mainstone_flash_base[i],
-                                   i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH_SIZE,
-                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            error_report("Error registering flash memory");
-            exit(1);
-        }
+        pflash_cfi01_register(mainstone_flash_base[i],
+                              i ? "mainstone.flash1" : "mainstone.flash0",
+                              MAINSTONE_FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
     }
 
     mst_irq = sysbus_create_simple("mainstone-fpga", MST_FPGA_PHYS,
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index d1b0ec3264..1d156bc344 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -152,13 +152,10 @@ static void sx1_init(MachineState *machine, const int version)
 
     fl_idx = 0;
     if ((dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
-        if (!pflash_cfi01_register(OMAP_CS0_BASE,
-                                   "omap_sx1.flash0-1", flash_size,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS0_BASE,
+                              "omap_sx1.flash0-1", flash_size,
+                              blk_by_legacy_dinfo(dinfo),
+                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
         fl_idx++;
     }
 
@@ -174,13 +171,10 @@ static void sx1_init(MachineState *machine, const int version)
         memory_region_add_subregion(address_space,
                                 OMAP_CS1_BASE + FLASH1_SIZE, &cs[1]);
 
-        if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", FLASH1_SIZE,
-                                   blk_by_legacy_dinfo(dinfo),
-                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-            fprintf(stderr, "qemu: Error registering flash memory %d.\n",
-                           fl_idx);
-        }
+        pflash_cfi01_register(OMAP_CS1_BASE,
+                              "omap_sx1.flash1-1", FLASH1_SIZE,
+                              blk_by_legacy_dinfo(dinfo),
+                              SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
         fl_idx++;
     } else {
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74..43172d72ea 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -385,13 +385,11 @@ static void versatile_init(MachineState *machine, int board_id)
     /* 0x34000000 NOR Flash */
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
+    pflash_cfi01_register(VERSATILE_FLASH_ADDR, "versatile.flash",
                           VERSATILE_FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           VERSATILE_FLASH_SECT_SIZE,
-                          4, 0x0089, 0x0018, 0x0000, 0x0, 0)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
-    }
+                          4, 0x0089, 0x0018, 0x0000, 0x0, 0);
 
     versatile_binfo.ram_size = machine->ram_size;
     versatile_binfo.board_id = board_id;
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 839be3ca16..dc25304290 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -312,12 +312,9 @@ static void z2_init(MachineState *machine)
     mpu = pxa270_init(z2_binfo.ram_size, machine->cpu_type);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
-        error_report("Error registering flash memory");
-        exit(1);
-    }
+    pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                          FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0);
 
     /* setup keypad */
     pxa27x_register_keypad(mpu->kp, map, 0x100);
-- 
2.38.1

