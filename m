Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1835029lfc;
        Thu, 11 Jun 2020 15:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL1uhUgO0Xw3TYuLZ9ls6AGY1tgRpFBPq7drurKCa/bmA5XhzggX5aDzaLLzCpJEXS28Ea
X-Received: by 2002:a25:cd83:: with SMTP id d125mr16880042ybf.38.1591915161426;
        Thu, 11 Jun 2020 15:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591915161; cv=none;
        d=google.com; s=arc-20160816;
        b=OpXuEbTUcZ4bpqIbHjDws/giijwLpaddz0uqaY1n8Xk6+mmMCsORsYVf0x0jzA0dFg
         zwQEjIMRmayS5gxx1L/c3sBpNoFJr+sbvf31PlUtMc/nwrLR1l/3k55airXIK6Vx/6us
         Lf3/aVhiWNY98/CQTiiVkxDHJrj9UWyNGQXCuLPzd8HK3raunVitTXCVdYTsPnEJ1Zzi
         0s1QGlyumOGexrehfj+mwV5rCgoSeaFwQlUIgtp+t95TORpY0PVQDytAO+b63kR7Xj20
         Pe5xIRFEV9+wWKrjHmDOaHQ4YC4roDW2Jg2Bkrl14CED8HjrQ9Onq3M6xO/uLVZZeus5
         NePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=E/t7NCqU4xlcbST0JMpIAE4l1XlKmG5L/C+Lk5feEf8=;
        b=m1vHqKYAjA7E6gMp8y48LuIWDsg/iWI+FDdnUT3VhzoAUe0RybD4YhKZ/YFxU+nyk8
         mXIgcSn5uVqpZMSX4WCfJykKHplAjtjYYfKRHsdLmN5+AvtEjsWRH9Rlp92qcgtyyDSc
         ovB/L7xKe2PlRybNyAgEgzE3DJr3eES6/jkh14fyhqCj5WqLaQ2xnPcxMciyPYPzkYdJ
         Gm4VVnFCwsEp0ruMimWP4kReXkk4Tlph4p1zQXk2TnM9llYwkp4qHX5zUfAf1fvzXjDK
         ifzOXCIXoD6o9ZB1bBUPjunOkT3ZpKtrV2LwpMtkFuJ2x7RDbIa0tUtrB7NYuX+IfqnU
         qGFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=OQGSX1oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si3376100ybr.281.2020.06.11.15.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 15:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=OQGSX1oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjVqy-0001VJ-Qz
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 18:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3l7DiXgsKCIAlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1jjViq-0004Fi-EZ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:56 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:37818)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3l7DiXgsKCIAlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1jjVio-0004I0-Pa
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 18:30:56 -0400
Received: by mail-yb1-xb49.google.com with SMTP id y3so8331339ybf.4
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=E/t7NCqU4xlcbST0JMpIAE4l1XlKmG5L/C+Lk5feEf8=;
 b=OQGSX1oBgM+amV109UBZs/Bd60eKPvh7a/6Dhp9nZ9sR7DJn25hfs2d4l4GtcqaAsF
 xVZju6mRreiX+Vo2eqZcBn630JAYc058IL+uqDMsPsgCTe4MTI42VGslhba+Vw2Sn3al
 S/0ITzCKdb26GW2tW0LJObDcDQ1yEVtLoZYPfW3mFCSnxs72lq+kpr4cOx9pAs/Lz0Jq
 Ud9D3JWrSQ2AfM6DLf5oQTQmREV0X/vnIZlY7tfdkTh6NTmqqfvJwJP8qHryWmDzdTl+
 r2lgV/4HUSf3wkbQC9Z4gE1CSr8Cs6yXlyFkPfEuLKxuuZ7jF9srxwvY3FiLigYV8RW2
 JJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=E/t7NCqU4xlcbST0JMpIAE4l1XlKmG5L/C+Lk5feEf8=;
 b=X7DzAulHFEIFGxza/2rnmmaMmKQEwkx4LazPJdZVPvPte6kUAXsoZ1T7nXqBnvpubq
 QZBL/fHmebwecAy/PLmIFKZdiSfmbsWIGcplEay9+WELHPLg+h9BZgYk3TbALZW7vn4E
 0a/yq8zvsDGK3Zc+BLlDQ8ReDNgyNEaW4ejZSmduLP0TkzaNY9MaIilq42C+fcgE4688
 lkOrImwZsaUAqERJCL9f8bYrC+Yxas6zATJttd28P5+g3LE3uu7VeuvLbEsDlRsJAV/Y
 yojwHdg4YGbmfjGDZAlCKsWR/STF7IUrf7U/jSbzPyepLjuNuOzvqIdss9hagX8y/JU+
 EYgA==
X-Gm-Message-State: AOAM531LKmh8ZpKqKvL6UiyvscO7dCOJqxsAJD1q2fUv+b6ttmdSiRUn
 +DhpqM4CIxCqFP8hK/3ouketChAMunH5W3c3zw==
X-Received: by 2002:a5b:4cd:: with SMTP id u13mr6632708ybp.323.1591914647790; 
 Thu, 11 Jun 2020 15:30:47 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:30:15 -0700
In-Reply-To: <20200611223016.259837-1-hskinnemoen@google.com>
Message-Id: <20200611223016.259837-12-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2 11/12] hw/arm: Wire up BMC boot flash for npcm750-evb and
 quanta-gsj
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3l7DiXgsKCIAlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: ywI2scA4i6Rl

This allows these NPCM7xx-based boards to boot from a flash image, e.g.
one built with OpenBMC. For example like this:

IMAGE=${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
qemu-system-arm -machine quanta-gsj -nographic \
	-bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
	-drive file=${IMAGE},if=mtd,bus=0,unit=0,format=raw,snapshot=on

Change-Id: I158a4d9952c0e90f2b1b7280443a7305b6ae57cf
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 86e18af2d7..1ec772fa59 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,6 +18,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
 
@@ -40,6 +41,20 @@ static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
     arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
 }
 
+static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
+                                  const char *flash_type, DriveInfo *dinfo) {
+    DeviceState *flash;
+    qemu_irq flash_cs;
+
+    flash = ssi_create_slave_no_init(fiu->spi, flash_type);
+    qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo),
+                        &error_abort);
+    qdev_init_nofail(flash);
+
+    flash_cs = qdev_get_gpio_in_named(flash, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(fiu), cs_no, flash_cs);
+}
+
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
@@ -57,18 +72,30 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine)
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
+    DriveInfo *dinfo;
 
     soc = npcm7xx_create_soc(machine);
 
+    dinfo = drive_get(IF_MTD, 0, 0);
+    if (dinfo) {
+        npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", dinfo);
+    }
+
     npcm7xx_load_kernel(machine, soc);
 }
 
 static void quanta_gsj_init(MachineState *machine)
 {
     NPCM7xxState *soc;
+    DriveInfo *dinfo;
 
     soc = npcm7xx_create_soc(machine);
 
+    dinfo = drive_get(IF_MTD, 0, 0);
+    if (dinfo) {
+        npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e", dinfo);
+    }
+
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.290.gba653c62da-goog

