Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1942722lfq;
        Thu, 10 Sep 2020 22:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxhBiz4XFoClH6sO+dtrop2bryNHm84fTdEmOpG2ZCwudHQY0JMtwqMFw0GTgKYqOPlOg6
X-Received: by 2002:ac8:38b4:: with SMTP id f49mr361409qtc.97.1599802046977;
        Thu, 10 Sep 2020 22:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599802046; cv=none;
        d=google.com; s=arc-20160816;
        b=Sa/DOvw3vNvAqCBmagBpAS0uZ7e8OPnFmPQfZ2JPvkc1I2C3ZzMXrx2CAGDRSQWI+4
         E8//7jEw+C0nW+R0mpkjgBfmbmHubRoH7GmE3j0w/JhZqzhlNpMKH4iHVnnEqJPjNGdy
         xR59JjYhi5iAjvI/iOQ17pvV22UtcROXv+iYquJOkM7/9/4CbJANrHYZY2YS0NJF9qBR
         0ToIT/M9FoqXUPhVzmqjeOC51ESWZPu0W/+QcfHtfZWTtMYQnRVGdVWTdsCxb98Bhw6d
         EKWHo4ENCwjaliLv0aQBVG4ggCO8zs37hfdvZuti1m0iskcQWztJVu1u6WD76ZfXv8YC
         1XmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=lvAKurUSN33i9vygYzOobBU58zXgdvVYtnal8a/1X6g=;
        b=gXMBimwZl5XhEv3HTC3gYz+Jru8tB/cVphMtd13/Atovh9BLTkqclVLuxPbbPTaios
         WPULZzf+Pc6t4nxQiGkqswZ24smS84RPV06goX5LnuWlFjd7y5/AVrF5ooBwl1zFT7Pi
         i68uwubfiwZwEpqoDv97//MF9D6fkr3zxn7e3pmU7CgEzBbA1Jfmbi4ZQJ4myIBtkXTh
         IekBygVkHv9M9XMbJIodQv9kQCuCFN7iha7p0etadCPBdI7W0giVUg5V9xk+Frb+Nk1V
         hrBPOEg8/8LGJTPvgukikoD6n5bJkJ/doIQDo7BTaW01T8DUOvF+VwSC28MH2Mby8m+m
         3FdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bYlqILVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si744766qtg.8.2020.09.10.22.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=bYlqILVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbao-0001JH-DH
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WglbXwsKCNkCNFDII9HJ9IBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV7-0006mg-MR
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:33 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:39405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WglbXwsKCNkCNFDII9HJ9IBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV5-0002PL-S3
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:33 -0400
Received: by mail-pg1-x549.google.com with SMTP id l14so5342836pgm.6
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=lvAKurUSN33i9vygYzOobBU58zXgdvVYtnal8a/1X6g=;
 b=bYlqILVqfNdUQUJS9iK2YSaPwoMmEC30GbtQy2iD8E0GwTVDOSyMENjh5ICqww8j6N
 CYF6/Ku78lZ5kQ6wPDsVBoPuAkaGWgsyr51keNRX3nVU0qpO0FE7DDq3SD1DX760qLFt
 KMc4X0MXOf4JC8V9dKYS8v6iJp18VAf4K3j+aprEqiYryoz6HZ3xbNTog5Sf0l92bxO/
 AhjeDxRu/jTqwuS6dMt0ff3SZwsjdTgIlz0eGcCCCItai3D9nt3BlAvc+JQzdWwy/MJ7
 2H6qzAw/szOYNNqUHrRnnZWh813q5CqOQbG7i69Lc6hKETQv+kyZwduwJRTgmvdIL3Js
 Y7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=lvAKurUSN33i9vygYzOobBU58zXgdvVYtnal8a/1X6g=;
 b=lCgGTPMQ4AS4GMUUeFh3l+ZOg4H7q1eo6/4xCXm5hdus8+JN2WHuSW4UKILQ0Q3guj
 58za/gtenFXPfnjCZm67yRkeRmLir1r5BN3z2n/A62qtk5R0NIaw0+F64D0FCxrkqHro
 QGhSIeyId3JGrvtvIWYA7/QbAmzBS0DMqc3iK4JRgw8ia0ybCnIWjihAdZ9tbq0+IBJX
 O/73FVmeaY0uQpDR82M+uG3F+eVjP9viPuO69QvQkQZsv2BTBnCQvG3vL4T+lcWszynH
 ENvWkG/7gsjhCZjvKXbXizlQ13BZtxVfBe0gLyAfqmtb0MU/dtphLpVq7t/SD1IBpU2D
 wrRg==
X-Gm-Message-State: AOAM532a96OliynfLvPzXoYt0/DIkaWKr61BYC6/SE38PyHqD26uwcWl
 WXJsLWpW6GGsM8e/qGmXAeDH91tIZMerHNu9Ow==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a62:6dc3:0:b029:13c:1611:658d with
 SMTP id i186-20020a626dc30000b029013c1611658dmr620781pfc.10.1599801690052;
 Thu, 10 Sep 2020 22:21:30 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:20:58 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-12-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 11/14] hw/arm: Wire up BMC boot flash for npcm750-evb and
 quanta-gsj
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3WglbXwsKCNkCNFDII9HJ9IBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: EDHaSeFlresw

This allows these NPCM7xx-based boards to boot from a flash image, e.g.
one built with OpenBMC. For example like this:

IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
qemu-system-arm -machine quanta-gsj -nographic \
	-drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,snapshot=3Do=
n

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index b4c772d6b5..79e2e2744c 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -20,6 +20,7 @@
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
 #include "hw/loader.h"
+#include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "qemu/units.h"
@@ -55,6 +56,22 @@ static void npcm7xx_load_bootrom(MachineState *machine, =
NPCM7xxState *soc)
     }
 }
=20
+static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
+                                  const char *flash_type, DriveInfo *dinfo=
)
+{
+    DeviceState *flash;
+    qemu_irq flash_cs;
+
+    flash =3D qdev_new(flash_type);
+    if (dinfo) {
+        qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+    qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
+
+    flash_cs =3D qdev_get_gpio_in_named(flash, SSI_GPIO_CS, 0);
+    qdev_connect_gpio_out_named(DEVICE(fiu), "cs", cs_no, flash_cs);
+}
+
 static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
 {
     memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram=
);
@@ -92,6 +109,7 @@ static void npcm750_evb_init(MachineState *machine)
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
     npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0,=
 0));
     npcm7xx_load_kernel(machine, soc);
 }
=20
@@ -104,6 +122,8 @@ static void quanta_gsj_init(MachineState *machine)
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
     npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
+                          drive_get(IF_MTD, 0, 0));
     npcm7xx_load_kernel(machine, soc);
 }
=20
--=20
2.28.0.526.ge36021eeef-goog

