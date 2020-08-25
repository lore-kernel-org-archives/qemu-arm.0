Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2990690lfy;
        Mon, 24 Aug 2020 17:26:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCIQzXKhLO8Q+9tv/WR34Gby+/7ifXFID5Ss7u+HJhSlzi65dQuKvYdl0HjfVE2s2I1ZtH
X-Received: by 2002:a25:8b09:: with SMTP id i9mr11001629ybl.149.1598315211531;
        Mon, 24 Aug 2020 17:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598315211; cv=none;
        d=google.com; s=arc-20160816;
        b=NBLyPB/0c4bVAv/kSz+rf7jQYJ7nV+F3luywGGOoZ3wr9FHXHF5bSdYuyzBgrQ7Y98
         ZfqY26p8OAYdOi8DOiYCkEbKtGYU4pp//7oqrpx+Mf/4LzRyICwJGDaSwTMiU8fMN2eO
         HdKditeUpKguWkcLbQ/hIJgS+WkT/OnSLDDWGbk2uFuz4zf7FPNe2BJ7Mr9IyfGeWyCs
         WeVvhOI01Ik2WgoxlTYYeESfgBnv+lv2P1Nvg1abkVaeV0H+sHr67pF6rNWfl42Z9tas
         RYWGBpYC+JTurTZOB7yrmbJOJxW8VWQslyZAFAcjsIc5dABKCqGA2FnzOsFzAD32jPTe
         Nyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=rUEKve2Wm610Ab3YZTjgeg13+EN7IVaTgjJRV1dAi30=;
        b=dmzWz8L8+QWKSADsWxha/hFTbq/cCaGEQTa7rcav61LgpJZRuCvtfFbQNlV8x5peFJ
         46E28UY9t5jqlUuHDrS7321NtO9grTOi58K1M6Oh9zn4YYD+maBlpx1VDNW6rEha64PK
         41UF3ormxEqRbfref7F2VonzRdel6I65KSFgSM1gRI6SwkfwtWJrFH0iMPZLV4zi2gJU
         00/WYglGfHigtFuMQ5VGjNrp0+ENRjjrLWqRBkFUyEAF5Yt35B6UKY4bZlLpLaSbVykq
         /GFwhcjGmzWjnmHZyW2f4+jOYF48rghJnx/ghzONLxiiYeOz6Df82WSwPcVrQkxO4Bda
         l/vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=eaBeM5FA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186si13819057ybd.129.2020.08.24.17.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 17:26:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=eaBeM5FA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAMna-0003fG-Uh
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 20:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3plhEXwsKCGkOZRPUULTVLUNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeq-0004T5-6B
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:48 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:50684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3plhEXwsKCGkOZRPUULTVLUNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeo-00069J-8g
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:47 -0400
Received: by mail-pj1-x1049.google.com with SMTP id t13so454990pjd.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 17:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=rUEKve2Wm610Ab3YZTjgeg13+EN7IVaTgjJRV1dAi30=;
 b=eaBeM5FAdIxeoIk+u2nsWVVLQ9Y6q9BI8H73hYy0GFDFwDIc+aFQjVMILysLfcQGcI
 yqEo4FFgkbgOQjmKmwi/jaC9EHtHHWpFC4kbTDjEvown3U1S8+3cVPx0auUJBwSb8Qow
 sTq0kcVgrkUsvDafqMhVsyL6SQEP+vg5Ox9SqNzgsduDj+k1kFa1NwGEVhbqj1dtpaZW
 wyY2qKjcDvWQCne0Zk30RuhTpDVFcbC3d/et14szMRGqWpMUtDTenJx/h4GN6Cl+XdKJ
 73L1a9ZrW5rAXPx8qukV+6MlzKBCeJLD97sPmnB0u+h95SPj+GCFBIrpTdCxQ1rPPVGr
 /+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=rUEKve2Wm610Ab3YZTjgeg13+EN7IVaTgjJRV1dAi30=;
 b=MMndcIElcsrWCd7sFHoaTYzEq1xRXjPGilEykJ50GuEGzsWaBnsqMpwwWUAyoTqqwE
 O0B6Qry8EFllwnGUvLmjRAQvTFiYm/Yje3AvehM9WHsUuZD09rbIwfozyCZDFCmfvG3G
 9gXpz9/61scA4GvCFsL9WVveqHrpWeaa23EbIjQXIsVpukhLE3RELcQcjnQOSx3gFBil
 2PFjExaB5i4sjhsRPA5CYP7W0ygKgEXKf9lP2B26YpMtBe9amh8UhuXqPmxUXI9c7VW/
 lF9SG53NY7A2P7YXNZGDeRjLndSzlD3IuZ7+SRObaQ9ywsHcJz40EBA9OEabodicqykg
 cXcw==
X-Gm-Message-State: AOAM532DldKn7rtLKZcMsLZojcuW1jgPxmLmnR3o/WSbVUcgBKQ9+lWb
 SuPZNX7zgvh4pdFx7UEKB0lufbMfn+54xxLWUQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:902:6a88:: with SMTP id
 n8mr5816600plk.261.1598314662166;
 Mon, 24 Aug 2020 17:17:42 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:17:08 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-12-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 11/14] hw/arm: Wire up BMC boot flash for npcm750-evb and
 quanta-gsj
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3plhEXwsKCGkOZRPUULTVLUNVVNSL.JVTXLTb-HYTUVUNUb.VYN@flex--hskinnemoen.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
X-TUID: clx2p1+I1y+K

This allows these NPCM7xx-based boards to boot from a flash image, e.g.
one built with OpenBMC. For example like this:

IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
qemu-system-arm -machine quanta-gsj -nographic \
	-drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,snapshot=3Do=
n

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index b67e45e913..70e5c34216 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,6 +19,7 @@
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
2.28.0.297.g1956fa8f8d-goog

