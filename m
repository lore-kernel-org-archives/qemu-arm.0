Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1204369lfm;
        Tue, 7 Jul 2020 11:53:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQiQmE8l6qcPwHEsd5SABeREqDxSsxuHvcuKjvp79on0jd1sZyRqcyfoQQq8/NyonPMBl6
X-Received: by 2002:a25:c6c7:: with SMTP id k190mr46071513ybf.11.1594148021795;
        Tue, 07 Jul 2020 11:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594148021; cv=none;
        d=google.com; s=arc-20160816;
        b=hc4uPsMmXsacyaT1wVx9YX4183L2fTCXtduz+xOWnrP2pSkIELzPXpPuvkS7KR9oVZ
         bMd7GXt6p71C9EMcc5VxxaFmwobYy86T4NCvJl+qKAepiQHK2NsbagPmg3qoxRnMEbBr
         Gu1a3yQbEPNlwKbU/IHFYBvoCTdSU83T3djeDd8Vn/t5JW/QqShX3dr8sC3ukBnfyC9s
         g0bP7SX/ZN5p2zV/94hAUup1yJb+KNhDPRpYHyIA/KcT9uSc2/NQsU9GXnLBx+RCvht7
         kTo1EesVz6slubtgdMQKKXNXQWz8nZY1tzkNgohDFaYibuKJ9kTAkj/wNTltLxVDCT7n
         dS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=D0SJdwFH202EMhnUik6WkVDFVC1hs3eXL7kJjIfJbhQ=;
        b=VNj+ZAZZmYMibr6k7SYfElmKRbucyEOF9xVN6yrEs7h9vU4Jmwjxje86n/zQA0SVQa
         FaUJtVVQgpoHBYd9ls1bC2tvtLiveZmq4pcOB73/DkzrAJWUnvu+8bo8VLspQqKmjW6p
         g2fMmq0jCVXzJXRJvxs0Z0dUa1g2o0JJyBZJUXbs1a3YUlOxp16BgfeWBNUTn/cb5zuM
         LLS/lAxtKsXjDciuW4mzVdRRaOkNIfOq95SM3eqw1Fmc3SYwef50S/duilmtspMWt4oI
         qFLuTX3SChOPbdE6fWPzYH5GckvwaW641h993M8E2b8zoQbPThYmJO6iAXIiFc0TfrE3
         wkaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Zd+w4zmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si22146119ybm.175.2020.07.07.11.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 11:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Zd+w4zmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jssiq-0002Xn-Sd
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 14:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XsMEXwsKCPUephfkkbjlbkdlldib.Zljnbjr-Xojklkdkr.lod@flex--hskinnemoen.bounces.google.com>)
 id 1jssdO-0000hS-IZ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:48:02 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:53433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XsMEXwsKCPUephfkkbjlbkdlldib.Zljnbjr-Xojklkdkr.lod@flex--hskinnemoen.bounces.google.com>)
 id 1jssdM-0007du-NY
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:48:02 -0400
Received: by mail-pf1-x449.google.com with SMTP id x62so3513334pfc.20
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2020 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=D0SJdwFH202EMhnUik6WkVDFVC1hs3eXL7kJjIfJbhQ=;
 b=Zd+w4zmmpNvJv6y3Tr3ivt8yfZ0JbY8B7Dqlq8KzGgB9f3n85UrsH7PcGaxVehmeGi
 W/ma65MZWKCi4iMSa0cOOf4VFS3vT/0WQfOjcDgXqiyDeNgdFxTLpF3LG2tl1CZhqTRp
 +f/TgKZ+2CR7diT4I5geVIfUg2jqJH1SOI2Tw0767fRzY9URpFYh1ImawGAT2efo5nSK
 jZH53xsSqnRSVZHvAnFu7mWaf447DCeHc99vnqW03MpE3Fc9lsTOQSjgxoAtgROcTJKx
 0j4mJuyCshtpwDQ8RfoE0nB999kUMnOZTnj/QNuX5Uok6S9YdrU3A+5mHIUGrpt5+K3C
 WPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=D0SJdwFH202EMhnUik6WkVDFVC1hs3eXL7kJjIfJbhQ=;
 b=MfLxDIpk5w1il0fk0WvUvwWv2lnbcSVxKQlA/lapQ6VTEM84O42VxwjrWCE9OQQViI
 z9L4RzyNkIfE2tbFr4oS7XbHp1ngZyAnFAP7CgCn/06lKlX/pS/Un0e5CJm/pGOTUFFJ
 ZEoNlQByMoaxF2z1wpobYJlKVBRSGd8gfrrMxEjL6BFiso+Cl29nroU0zTJ91CFZXub8
 kPBENEEe4erluN0/BBbuYeHJluV1QVIdNlPuJ4Vk+OtoxQXFaD0xEHHQIt+XJFTDqCOi
 CToLpQgu6oLiQT8ZIPdWMRj8pqYzsMmLfcIsKaGjEoberU5Y4FfHcowY/nZdLXvvFw39
 9x0g==
X-Gm-Message-State: AOAM5303igRBo+qZdvqw2SPkH0mefxlr8DSSR3BPfDWb6gWnKraOj0pj
 aRWshblrE1i7uTQVZBcHYBQSDh/y1M5GSiV1pQ==
X-Received: by 2002:a62:4e44:: with SMTP id c65mr14479177pfb.283.1594147678925; 
 Tue, 07 Jul 2020 11:47:58 -0700 (PDT)
Date: Tue,  7 Jul 2020 11:47:29 -0700
In-Reply-To: <20200707184730.3047754-1-hskinnemoen@google.com>
Message-Id: <20200707184730.3047754-12-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 11/12] hw/arm: Wire up BMC boot flash for npcm750-evb and
 quanta-gsj
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, philmd@redhat.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3XsMEXwsKCPUephfkkbjlbkdlldib.Zljnbjr-Xojklkdkr.lod@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x449.google.com
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
X-TUID: 3QRv0KVH/OSs

This allows these NPCM7xx-based boards to boot from a flash image, e.g.
one built with OpenBMC. For example like this:

IMAGE=${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
qemu-system-arm -machine quanta-gsj -nographic \
	-bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
	-drive file=${IMAGE},if=mtd,bus=0,unit=0,format=raw,snapshot=on

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index de2d2ca786..7de73594ed 100644
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
@@ -66,6 +67,21 @@ static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
     arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
 }
 
+static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
+                                  const char *flash_type, DriveInfo *dinfo) {
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
 static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
@@ -89,6 +105,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     soc = npcm7xx_create_soc(machine, NPCM750_EVB_POWER_ON_STRAPS);
     npcm7xx_load_bootrom(soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -98,6 +115,8 @@ static void quanta_gsj_init(MachineState *machine)
 
     soc = npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
     npcm7xx_load_bootrom(soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
+                          drive_get(IF_MTD, 0, 0));
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog

