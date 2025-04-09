Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7601948njd;
        Wed, 9 Apr 2025 03:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyimVFijSCNfLLp1ZCvZVojZbv0VTIPAXttV2nlB3rX6W45v9UCDgYK/3ICV8kAe0UIMlXV2S6FQSekg==@linaro.org
X-Google-Smtp-Source: AGHT+IG/quIxyBdq6HUX5hf170HyERYTeWR6huc9H+8Q+IKuTN7I2UVSl146EgUqjUmTEhbK6Vnm
X-Received: by 2002:a05:6102:3f12:b0:4bb:cf34:3757 with SMTP id ada2fe7eead31-4c9c445e155mr1635760137.17.1744192943751;
        Wed, 09 Apr 2025 03:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744192943; cv=none;
        d=google.com; s=arc-20240605;
        b=UAWzJj1Qr7n34P+UM5Irylwt70ZIIScQyRTnTIQtmxQVVgrxCanTH/2GHoDBGJ2mS/
         ESQ+407xd+4WY2IuWyyrdCsJm67NMJZ3Ir4f7jrhVl0YXfWMSj6M9qXyxy3fRAyUqOqm
         tFHgiY6zEZySvL6tdc+Bwi0BLJn6OhDmJxvq2Y5ZHjHpi72C0goFr+XCx2ySEryIMO0k
         Om/EnXgAZnYqqv52xe8IIoAVdMHF2s6FlgKYdz9uKtxWI2usAflX0/DyG4W+Y3zlC6/f
         preQEqzs1NUnQToFWe/NWf8i8KPzwR+ABySgNIOiZBiYVw3R9TU+aw3U0F50WbKN6Zx1
         ElpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hZOaTi1KFurhNfs7Pt//Tt9ZUXJJVTNTCs/9DsiKHF4=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=MwxqZcd13rgPahI7xb3/hMuhJaOBPw/nfw+TO4nDCt7WlkUilxEirC8NCaIsz84a8T
         UFEl9j89mX46QNQjjDE/7tA6Hz590l/UH2pLFiY5VTnxjzemFS1mKQSE5eEpdqh5kNd0
         Ozhg4as7UJHgt92BGuRlRoHcAuVhgvUw3di73aL9a+vp6sQ++7oUm+YPH8/BQDjs7eQE
         kDvaNaDLXC+M0sAonTg0nUY15INZ5y+XX6rz60GIroEbkvUo7W1+shVYv3cBkk+qDBtr
         QMaQ0f11QkpxiBTGvRU0b9m3KrRuiIPyzAQrmZaHaLqx1aTSk/aVZ94Zl9pVXW0lUk7m
         0Gew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c98fc5b9si105864137.550.2025.04.09.03.02.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Apr 2025 03:02:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u2SF5-0006u5-KJ; Wed, 09 Apr 2025 06:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SF1-0006qP-Mz; Wed, 09 Apr 2025 06:01:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u2SEz-0006jO-Sz; Wed, 09 Apr 2025 06:01:07 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 9 Apr
 2025 18:00:41 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 9 Apr 2025 18:00:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v1 6/9] hw/arm/aspeed: Add support for loading vbootrom image
 via "-bios"
Date: Wed, 9 Apr 2025 18:00:34 +0800
Message-ID: <20250409100039.2391847-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
References: <20250409100039.2391847-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: W4enr3BD7vf+

Introduce "aspeed_load_vbootrom()" to support loading a virtual boot ROM image
into the vbootrom memory region, using the "-bios" command-line option.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b70a120e62..2811868c1a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -27,6 +27,7 @@
 #include "system/reset.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
 #include "system/system.h"
@@ -305,6 +306,32 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                    rom_size, &error_abort);
 }
 
+/*
+ * This function locates the vbootrom image file specified via the command line
+ * using the -bios option. It loads the specified image into the vbootrom
+ * memory region and handles errors if the file cannot be found or loaded.
+ */
+static void aspeed_load_vbootrom(MachineState *machine, uint64_t rom_size)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
+    const char *bios_name = machine->firmware;
+    g_autofree char *filename = NULL;
+    AspeedSoCState *soc = bmc->soc;
+    int ret;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_report("Could not find vbootrom image '%s'", bios_name);
+        exit(1);
+    }
+
+    ret = load_image_mr(filename, &soc->vbootrom);
+    if (ret < 0) {
+        error_report("Failed to load vbootrom image '%s'", filename);
+        exit(1);
+    }
+}
+
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
@@ -483,6 +510,11 @@ static void aspeed_machine_init(MachineState *machine)
         }
     }
 
+    if (amc->vbootrom) {
+        rom_size = memory_region_size(&bmc->soc->vbootrom);
+        aspeed_load_vbootrom(machine, rom_size);
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-- 
2.43.0

