Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp920415lfm;
        Fri, 26 Jun 2020 16:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaXBq3gIgTMlDgV55pi+4fwU4S0z95u2T8FDS92AR1e1AsfCy+I6gH+jmr8+7ZoedrGU1c
X-Received: by 2002:a5b:78b:: with SMTP id b11mr9222058ybq.42.1593215877740;
        Fri, 26 Jun 2020 16:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593215877; cv=none;
        d=google.com; s=arc-20160816;
        b=xDa6vBOU0BY8hbdJoyHUK1GjBf6P5/miOeufs8wvUmPC83bL6oq883Mz1DczMvjiGG
         K1rZaHP6rEb3AEOa7uZa96KGkf5KTbd2IWbyfdtlcsLWF9wCt0WfK8q5FDtppjOIfBz5
         Lh/ZggwL72/EjOs69cnsL4eMQl4bVJtbqKpOxN2Tvx3udZA1TxhLjigd0Qv3dam/uACh
         67edUOfYjI4NrBVOO1Zf2dHpKRO+qafy19Qr0F/FEtN50zA1pSfLmH0XMO/1SV2VteO6
         F0NTCZJfZsPaClnvyMKCNnJSdg1Hz6Omb/feDQOnrwwm/VoBJu2aS7XScQtZIBdJWwLy
         PqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=22toBuaFKcdBVJjCoNCm9G0xXsHPCmVoRDgitxAcN7s=;
        b=R00Fthrq6YdZg1JftKFcRz5tGDRACVAgXS3t1k8xuUUsfxZZwomnMo7VASv6Qt0ocu
         Rr365Q+P/7Tttu1k87yo40RYd9qWGUJWIIfnyrCMTw1dU/bGoEr+UdiBD70tFTdGLJso
         Qb1lYGPs3IEc3LYXITWOgp7SD3d/I7ywsdztiLbSveFDSIgtfFTwIHr8WeqYAzzJV6gx
         HCMbYKPxahFy9Ks/sgHuzHsjRqndZViRociH2giYxvy/DbX5yTJuEUZ/yHek1hgHps8f
         BuMPiBBGIxgyjEcBfeT/ETx7Mu9PLlxGkBFpURB0v2skj3q6k5YUSy7Hw6rS6v7EqdwX
         1KqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=LsxrmtNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si1009777ybp.160.2020.06.26.16.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 16:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=LsxrmtNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joyEH-0003Y9-2W
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 19:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CYv2XgsKCPYfqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1joyCL-0007pz-Di
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:55:57 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CYv2XgsKCPYfqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1joyCJ-00028b-CR
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:55:57 -0400
Received: by mail-pl1-x649.google.com with SMTP id j12so6820932pll.16
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 16:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=22toBuaFKcdBVJjCoNCm9G0xXsHPCmVoRDgitxAcN7s=;
 b=LsxrmtNrB6swa6LGBlAXBZos6QOd4+FzUD8FuVSkATXBAzZQ9T9aqhXsHwVC/BHOtE
 0X+2Sfu7970DDdjWR1rcp8rjGGa1c1ro8iI9n+sRrHHb3j6Q3CpWy1/ABy9nNgyYMUmH
 pPoCoM1cajA08LYqAEtBgxW+n3cuuIiLnIFk4MEepWDEyBryxhewZF+OdsJhCjJvfWna
 oENX1KU9ntjk+XWO3jL4vTTOnP9Mt9DKLPh6tsmbsC9h2zcki3RVH34w/8RfBfGDtLtS
 qJhnx+CO4miOG11dmmT442GnBNbvm+MglHfJ9JUUyB9bSz/HuEHo7OU4Nib7p2c8VeK6
 2G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=22toBuaFKcdBVJjCoNCm9G0xXsHPCmVoRDgitxAcN7s=;
 b=XL4BEHlJ3/+2VrLLStmVDSALZcLkbad3oPInzj5zlAO3B+B1wnRpypJg3ndYDqkwtN
 dySdX/JaZCFFiwBrD/XY2AoPlsvwj8ewdJ8lvh7AA2TySda2P9MkiVKoM3iYp2mSoTB+
 +erwUG/zlshiMpJlO3tG0/xJVcIdZgWXJwYx24VpJBO8KD+dCsxo5Jv5WwEzdOvzvdUj
 36s1ElRQJxFsoV0Ku8w0Py0CpssAG4pP7fWmiC4mq+JqTDGEDHl558VMnzyj2ybkx+6O
 XY11ZpUPLma38OAxBEEEN36p2GpaT4BSN10vfl3Cbv0n6vTRnEpGnveYsrzWjbguiIxd
 META==
X-Gm-Message-State: AOAM533UZERgiWfV2IBDkUGrPvgO/2aRMhjIEEho2ep8De9cdl+CAIOx
 4D8qdw9XW+USCWYqdnieVU3o49YvuNZ/SwvhIQ==
X-Received: by 2002:a17:902:fe90:: with SMTP id
 x16mr3409128plm.307.1593215753305; 
 Fri, 26 Jun 2020 16:55:53 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:14 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-8-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 07/12] hw/arm: Load -bios image as a boot ROM for npcm7xx
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3CYv2XgsKCPYfqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
X-TUID: gvFc+iCA9+kj

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

A minimal Apache-2.0-licensed boot ROM can be found at

https://github.com/google/vbootrom

It is by no means feature complete, but it is enough to launch the
Nuvoton bootblock[1] from offset 0 in the flash, which in turn will
launch u-boot and finally the Linux kernel.

[1] https://github.com/Nuvoton-Israel/bootblock

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index c82d9e018b..ca33262a59 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,8 +18,11 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
+#include "qemu-common.h"
 #include "qemu/units.h"
+#include "sysemu/sysemu.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -33,6 +36,25 @@ static struct arm_boot_info npcm7xx_binfo = {
     .board_id           = -1,
 };
 
+static void npcm7xx_load_bootrom(NPCM7xxState *soc)
+{
+    if (bios_name) {
+        g_autofree char *filename = NULL;
+        int ret;
+
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        if (!filename) {
+            error_report("Could not find ROM image '%s'", bios_name);
+            exit(1);
+        }
+        ret = load_image_mr(filename, &soc->irom);
+        if (ret < 0) {
+            error_report("Failed to load ROM image '%s'", filename);
+            exit(1);
+        }
+    }
+}
+
 static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
 {
     NPCM7xxClass *sc = NPCM7XX_GET_CLASS(soc);
@@ -65,7 +87,7 @@ static void npcm750_evb_init(MachineState *machine)
     NPCM7xxState *soc;
 
     soc = npcm7xx_create_soc(machine, NPCM750_EVB_POWER_ON_STRAPS);
-
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -74,7 +96,7 @@ static void quanta_gsj_init(MachineState *machine)
     NPCM7xxState *soc;
 
     soc = npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
-
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.212.ge8ba1cc988-goog

