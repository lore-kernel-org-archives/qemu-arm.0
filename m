Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75275606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2Vj3a+p
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNgP-0005iR-DQ; Mon, 09 Nov 2026 06:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfq-0005Pz-AX
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:31 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfo-0000Ix-Jx
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:29 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-36fc0a3fe93so1548919eec.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794224187; x=1794828987; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5+AgCcrIqg4nuy8x7X+EnudU0XBtlTWc0meswcQqgy0=;
 b=w2Vj3a+puqxFYa8TAmgqo2DA2G2icNpUXgvvL+M4LhvgmGscKqDhTzRIFjylTzbdi+
 IX9gbmYYJLtN9g+ErNZY9b+LPqweY3CE1L26iTxHyCAAjzYi/wipTP62lf3YXJ/ZzU5k
 2jjCvWonrHbVttEp+7fN8NI8NyMh8Ha/YYKBMqCXHxL3hZRQED1itcD3TMvxEWYzXewj
 1H9A3CWPKqsvDkZyaR0+1L02vzD3zxMX+tN0aCe7cIqcwc4yRgGTX1d0UHK1anOf3bS9
 vQlv5NTctUYFbyKB9ivAOMOn/Rtm6vu8hLXVg67I1hJSOnT0CEfSZqMGZE/H2XZ/raST
 R5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224187; x=1794828987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5+AgCcrIqg4nuy8x7X+EnudU0XBtlTWc0meswcQqgy0=;
 b=nzltfHo3m43DnmmpesSpXKxYpBvbv+L6A0xlKbcZfdjeJjR447/+r4yW5AcK3ZEF0Q
 gEUInF0oj+FWnYwLcANqXJK4je6MDpcaLoyAzGpO//iqr9wl9pVy6O+eoXZJHYENhYYY
 aQHTP1UKqCX3Jd/VEbF0pbBrW2rujvQ/56aAQVVNHqyuDMC+R5fNeq8OtpnBhu8W6LZM
 0aIfr0rZex3xHCZfGXfK5qoITyrdElBfzXrQ5/ZKMZ6PGv7W+xOP4zisd6qm8gp0MvW9
 beBw74YyWD69EsvCqNVa6kUsUuQ5Jarzp1NGRCajvL2lutYn4o76Cjx+v+OPLf56CSpA
 RtZA==
X-Forwarded-Encrypted: i=1;
 AL+hErErmqAJ+pzQAXDjE4bPY3svGHO83CbGP6O0h9nAyWL/dWuD5kGOiSuXJ2JH0fnho9eOPZqc5eCytQ==@nongnu.org
X-Gm-Message-State: APuU4Z+Y4ZwQ1rLAlo0ASUVeNnOAagabvHZZCG1gafCXtKm0qh7EFlxm
 UaTTbTAjfygQVZVU506yIfa3qZDyP5kDTTxo8Lur5JhL32BXumA0cV9d
X-Gm-Gg: AYBFou1HuCn8F7v7dF3c479AP09DtlZakZcWQBfbEZHl3bP48SiPooIhHOuuaZpo+ZY
 3yv3WVczuY/bo9DahSKmNxVFfqnyP8Gy2B3F2qzjxXPXpAtkx6gaxEKKkf3MlEVcVYLCBRMpzzW
 3KQH7JvsTpvHOEElR5eVUNCECO9aGlVldMYx/xLYwMgHKBfL5YMgMix0q706EcPYQD+M0H3ipy9
 BA9G5TmWH03CtcTnnlCWH/RfjmSDH2Ji+zHlsjvOHSgz5cLjHMOq5Gwbbg6PshLyTmtO0nm19+q
 u3rSymMbyWIkojMjKDc3agACpCXyMaYz4sVvRwN5RWrjvObOdwRjipu8SXNADqPyBkjM+X3vtMU
 nvHzkCu4PjWtpjj1II7bI8BX851Wj9JZlNYtdFw44qzaHuI2jlKMOQP30d+Mr5uizsTV9B3nEQa
 vrlsQ//oBBV+K7e7vBdQ1B+1NMKwGvt2X9pE6U3FkBCJ78afumULM6UdwpUeH1JU29obL2qpGfY
 ZPu5sVoNxr94ehhawKkydCufKmJU/bnlkil80uKv0U/sPrhA/VWvY3MI/dg8MECXSwwLyzHqOkJ
 zfcfAJH5QLX9gdHQBqOQj4PdEpGV1n1c
X-Received: by 2002:a05:693c:87c9:10b0:369:ef92:bd7b with SMTP id
 5a478bee46e88-37257c94c98mr7179291eec.41.1794224186841; 
 Mon, 09 Nov 2026 03:36:26 -0800 (PST)
Received: from ubuntu.lan ([2405:4802:913e:86f0:35c7:7294:a0c3:69b2])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-372660f444csm19762941eec.19.2026.11.09.03.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:36:26 -0800 (PST)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH v2 8/8] hw/arm/orangepi-zero2w: Wire up SD card and support
 firmware loading
Date: Mon,  9 Nov 2026 18:35:36 +0700
Message-ID: <20261109113545.18561-9-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109113545.18561-1-dovankhai97@gmail.com>
References: <20261109113545.18561-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x132f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Connect the SD card block backend to the H618 "sd-bus", allowing
booting from MicroSD card images via `-drive if=sd,format=raw,file=...`.

In addition, support loading raw firmware binaries (such as EDK2 UEFI or
U-Boot) at 0x40080000 via the `-bios` command-line option.

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/arm/orangepi-zero2w.c | 41 ++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/hw/arm/orangepi-zero2w.c b/hw/arm/orangepi-zero2w.c
index 1cc9ad7ba6..5b0e64cff4 100644
--- a/hw/arm/orangepi-zero2w.c
+++ b/hw/arm/orangepi-zero2w.c
@@ -13,8 +13,12 @@
 #include "qemu/error-report.h"
 #include "hw/core/boards.h"
 #include "hw/core/qdev-properties.h"
+#include "hw/core/qdev-properties-system.h"
 #include "hw/arm/allwinner-h618.h"
 #include "hw/arm/boot.h"
+#include "hw/core/loader.h"
+#include "hw/sd/sd.h"
+#include "system/blockdev.h"
 
 #define TYPE_ORANGEPI_ZERO2W_MACHINE MACHINE_TYPE_NAME("orangepi-zero2w")
 OBJECT_DECLARE_SIMPLE_TYPE(OrangePiZero2WMachineState, ORANGEPI_ZERO2W_MACHINE)
@@ -29,12 +33,10 @@ static void orangepi_zero2w_init(MachineState *machine)
 {
     OrangePiZero2WMachineState *opms = ORANGEPI_ZERO2W_MACHINE(machine);
     AwH618State *h618;
-
-    /* BIOS is not supported by this board */
-    if (machine->firmware) {
-        error_report("BIOS not supported for this machine");
-        exit(1);
-    }
+    DriveInfo *di;
+    BlockBackend *blk;
+    BusState *bus;
+    DeviceState *carddev;
 
     h618 = AW_H618(object_new(TYPE_AW_H618));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(h618));
@@ -51,6 +53,15 @@ static void orangepi_zero2w_init(MachineState *machine)
     /* Mark H618 object realized */
     qdev_realize(DEVICE(h618), NULL, &error_abort);
 
+    /* Retrieve SD bus and plug in SD card */
+    di = drive_get(IF_SD, 0, 0);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    bus = qdev_get_child_bus(DEVICE(h618), "sd-bus");
+
+    carddev = qdev_new(TYPE_SD_CARD);
+    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+    qdev_realize_and_unref(carddev, bus, &error_fatal);
+
     /* SDRAM */
     memory_region_add_subregion(get_system_memory(),
                                 h618->memmap[AW_H618_DEV_SDRAM],
@@ -59,6 +70,24 @@ static void orangepi_zero2w_init(MachineState *machine)
     opms->bootinfo.loader_start = h618->memmap[AW_H618_DEV_SDRAM];
     opms->bootinfo.ram_size = machine->ram_size;
     opms->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+
+    /* Load firmware if specified (-bios) */
+    if (machine->firmware) {
+        hwaddr firmware_addr = 0x40080000;
+        int r;
+
+        r = load_image_targphys(machine->firmware, firmware_addr,
+                                machine->ram_size -
+                                (firmware_addr - 0x40000000), NULL);
+        if (r < 0) {
+            error_report("Failed to load firmware from %s", machine->firmware);
+            exit(1);
+        }
+
+        opms->bootinfo.entry = firmware_addr;
+        opms->bootinfo.firmware_loaded = true;
+    }
+
     arm_load_kernel(&h618->cpus[0], machine, &opms->bootinfo);
 }
 
-- 
2.43.0


