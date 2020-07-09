Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp909430lfm;
        Wed, 8 Jul 2020 17:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2rNjGAk1uaUwzPZzuPHnVJXdazjdawE1IcBOb/6yc99s9l1TQxe2HrWS3LltvRcCcAtOu
X-Received: by 2002:a25:abd0:: with SMTP id v74mr13983924ybi.222.1594255351044;
        Wed, 08 Jul 2020 17:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594255351; cv=none;
        d=google.com; s=arc-20160816;
        b=FLg/yLryhwzHOPWapgblmrVeoD35VLuWBXem3BzJnvQryAXOwzAm1QmGLVx6Xb2yGS
         c/7sftW/umAzaPuglDokbsCEn+z15yHn1SqnckQfYzRWeB/XVKO+nxg4zDB+w0Jx5Sqm
         j5RM9ugslwlVcJzd4uW4ezauQrCpc/HkJM22VTL5EbPXH/FxXwZs/QR6lRXR1D67xqca
         hbcQaRGjTk6CP9UIMQFPAgo8rhrOgAM7hlVxl5vSqEpyj1G9zMBrGXKye2zyqMeGinhG
         PxkUE7z/rCMT7pXjU3iqQ7k4lC7XWctWzw0vZlNWkfWh81j4QGx+rX9bNf6f9PnYIDAv
         UlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=66PpJSiQbPbYGb1w141zWioPCpD9KVyXHJd+V0/BDS8=;
        b=qzeinhZDBT7afgsQHkLnE4oWi6AZPVRAk3/fD+h4hL46gyAPATHQkj6DVamGqnRaSa
         snrANKC1x1aIZhBsYwJlJW19tjb1BX0rKwStpfCL8ZQvXWI3x6mutHCbTXvlyj4G9Pom
         PFXbTpraw2Q/B2L2YRMvzuE+oNpFGzNaidtWIe5iSIkXpmP9dPzWhB79/g4ueeLkFr8g
         N001etScAWxoGDehQ3+gMAwhqxBLanvL45glMzzR5tAzWQHRH0LStq3ZX6TXPHOb86t2
         hK7ZfG9+iNZOBob1rRg0YAp1jmZmQS5rveqW5jB8AFjPch/g44sxOhXlH5Lb4+e2NVEs
         s90w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dC4x0L5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h188si1059374ybh.300.2020.07.08.17.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dC4x0L5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtKdy-0006Ax-Eg
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nWYGXwsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYT-0006qg-AW
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:49 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:51125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nWYGXwsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYQ-00013j-KJ
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:48 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id e14so746612ybk.17
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 17:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=66PpJSiQbPbYGb1w141zWioPCpD9KVyXHJd+V0/BDS8=;
 b=dC4x0L5klf8D6cz5MiMhEuSUB/vbqCDRLLInigXUckzFEnx0OV0TZDtPSglPFtKVlw
 8rboMOmC9GnQcb727mV7UZ8944KMV0JVE3IR2Xbhvc5hNnudGqLEZEpQbiPvxY8+S7da
 W0mIK51vKGBublsdPtkAnsxVlrDgyeWohSJKiMw4Q+s0A53D2TNVFa2tPpWtgPr0+4/R
 5B5K8HIxpAFG8PHApTKxEDqXk49ag8if/aU0NoTC/S3JoKkuz8KcBd6anoAFo1XRogHC
 q0ja3zIdR/1pmpFv9R+pC/vXGL47NHNXokr2oNxSlrX73Nk9p//FiBdlTBfQYWG+m3mI
 Wo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=66PpJSiQbPbYGb1w141zWioPCpD9KVyXHJd+V0/BDS8=;
 b=hl9PK2so0X5CiXV0iuCa+R5qO6ZB7U0RMFnHd1r4n/hMRe2kSoO7FBg2aAsI7p7iF/
 cUc/90Ox1lNPNd+JYodbXrPEJlbBLbDfl+/dUARdZIh7lxKP+V/xxgml/ude61DJbI4K
 y4HJRqPnN0QJdj1P6ViJ9FL72d21JoxLAQH5UdNATQ+bwniLdkP9aOgvTjSf2mRsCxN2
 cQRc2/Kt7UkEfx5bd6Hw/YRUVEoa0gstsZ8QOrpgLwQlGFOfCLgBrbhbmoS8XmjuJk4p
 qMRjz8cvlOzMoNJz0GSDQ5fHSwijSN1j00X79mV/7pN6FXim4qHfffIfJV/NwQ0Q7JxQ
 oTqw==
X-Gm-Message-State: AOAM531KTMB4rQ1NxREjF/8iJszEZvFwf0HEVgMABMFnDfYB7/aN9fkq
 ZnQZ6O83QU+3NRq7M7hLvlmZXGaHBRBVmAdDxQ==
X-Received: by 2002:a25:a301:: with SMTP id d1mr5259997ybi.449.1594255005229; 
 Wed, 08 Jul 2020 17:36:45 -0700 (PDT)
Date: Wed,  8 Jul 2020 17:36:07 -0700
In-Reply-To: <20200709003608.3834629-1-hskinnemoen@google.com>
Message-Id: <20200709003608.3834629-11-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb and
 quanta-gsj
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3nWYGXwsKCIInyqottksuktmuumrk.iuswks0-gxstutmt0.uxm@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: rwtvJa3YRNmj

This allows these NPCM7xx-based boards to boot from a flash image, e.g.
one built with OpenBMC. For example like this:

IMAGE=${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
qemu-system-arm -machine quanta-gsj -nographic \
	-bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
	-drive file=${IMAGE},if=mtd,bus=0,unit=0,format=raw,snapshot=on

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 80cf1535f1..cfb31ce6f5 100644
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
@@ -66,6 +67,22 @@ static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
     arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
 }
 
+static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
+                                  const char *flash_type, DriveInfo *dinfo)
+{
+    DeviceState *flash;
+    qemu_irq flash_cs;
+
+    flash = qdev_new(flash_type);
+    if (dinfo) {
+        qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+    qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
+
+    flash_cs = qdev_get_gpio_in_named(flash, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(fiu), cs_no, flash_cs);
+}
+
 static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
 {
     memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram);
@@ -96,6 +113,7 @@ static void npcm750_evb_init(MachineState *machine)
     qdev_realize(DEVICE(soc), NULL, &error_abort);
 
     npcm7xx_load_bootrom(soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -108,6 +126,8 @@ static void quanta_gsj_init(MachineState *machine)
     qdev_realize(DEVICE(soc), NULL, &error_abort);
 
     npcm7xx_load_bootrom(soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
+                          drive_get(IF_MTD, 0, 0));
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.383.g050319c2ae-goog

