Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5755472lfy;
        Mon, 10 Aug 2020 17:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG/ssH48GV+PPX04pKrUaBSXhuyEkBbbRdiodJ7hLiBe3EqFwRt1disXK8PUC4R1mh0KX4
X-Received: by 2002:a25:d102:: with SMTP id i2mr46212215ybg.398.1597106965232;
        Mon, 10 Aug 2020 17:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597106965; cv=none;
        d=google.com; s=arc-20160816;
        b=OLRLc3c135ZhcauOMDrhPBZYSscRh2m5n8b6RH16t6nQ70oSDhlt/c1HYpXJe0J09K
         BeJG048Zqfitjap0lp4B69N/4QUePmvO68KxRFNryjgMHTNMSLTON+xsLrt1iGPC5LcL
         pboAW7HLA9UcxOrKcm8r9HhIVhmgkzwxJoSJXaqG77Ekd3HCDPgpN6FT/x5nRduSRiVT
         VNjAix+nUn0gbTyNWyJavdj0xzlkyMElD57ItZm8TDak6MEtnwcy0QoMc14gttvtQDGr
         lFej1y/hFZqObWI9RR8kip6PEq+GRx/cXz2xvRR+5/aAxw2aQq4HkMFudasJWhg91hJl
         tHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=cJ+kY4MqdpbUXLCMTfKhuudli9xfKAZEj3Kh1+n1es4=;
        b=P3AKL3aEr5lOkbVv4efnXjxSZnyZvcWeb4waVHtnV1MpgMxAE5++KpMFJ1rULmKtEr
         oFHQtOUcVtEMN6IEELwR4cvnr37WpPzEZcq/9xFWYrcb9w8Vbh2u89FsfA1p1PH9SMGh
         +gMMVPRQlouZfvdS3LNqeKWVpmxBUdeQNQbuSXDGQY3gt4vGg+QNO47VgVrCCNIQU4Sy
         xsHcAX1UDW1kCZCYQZxJFwN2yVsbhFKDP7uctngkYjJpRFDerntY4OoLLGMs4aDiAE6y
         Mc9TfvjeGl59U16x2vaFQADTSb2VbFJgZ3IGJTRaE6ljoaUK8WwNcB/f5uFON/+xWR7h
         ANbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=G9oArRZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si8586343ybd.363.2020.08.10.17.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 17:49:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=G9oArRZz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5ITk-0004Pa-I9
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 20:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YeoxXwsKCPwlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQv-0007DW-5Q
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:29 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:53887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YeoxXwsKCPwlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQt-0004i4-AU
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:28 -0400
Received: by mail-pl1-x649.google.com with SMTP id a20so7916576pls.20
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 17:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=cJ+kY4MqdpbUXLCMTfKhuudli9xfKAZEj3Kh1+n1es4=;
 b=G9oArRZzmpHYXqYueTZtvTbuGTFHLcgwuoDWm1Q7/cktdvNAdUL/PLTh7yFINS0yPj
 RxbNYYLCDeehzoXngMhTT6voZM7tsCwNxN0vm08aeNk1PrIU1Sn/4gN/Mba37lnjVCRY
 lqoTOW9sHFftRWmRjrC9RZwfRBJzmoz18OdOJItjJkukNCKZNK5BgBPPQqW/y1FZ3270
 CcRGZnKcdV4CoS6od2JOOngfEj5LKpRXqmp1gzR3yTMfVTKtHHNpxZY6PagaIiIUOxl0
 Kq8kY0RYRuiMA9iF8dU5rxvPgXQjPnWHDwUh1XJHUkdVrAydmHdEichv7G+VSLvIv0gc
 CmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=cJ+kY4MqdpbUXLCMTfKhuudli9xfKAZEj3Kh1+n1es4=;
 b=R9nHjP6qVRpkDGan/d/cdIn32tLkxy06CQWjuOpByIeyjEkhfpS590pF7ox+JEoaLU
 AfDyrWLxHrKsa/cVql1TzlUXaPLmNN+Ew2o/V7qYueY6HVtHTwQSa75CLB303FNoG5nn
 7JCAxT3DUJYSH/J6tucoBzfqsc1MVEwZWUL2+ieSaGk1mA6rErnCVGd6ob1QKtFFha+G
 bLC7n0I7JWPGwmjBhcrmZ0InIudvB2AHons/bOvUCDkEUf7qpaxVdyrH1QZKPq0NFfTB
 JA/Lx9oOWgtPj/hquGzkWAhDq3O6/J4lWhgiFX3Q3vdGhN3BN+IQKTFZKxE4qxiNjuFa
 X97w==
X-Gm-Message-State: AOAM530GO7gghgEa7gSkHvA9zRUvpg4JHVcTZ7rQUUi4Tf5QzKPx332k
 pH6ruCg/kPxm4NkxdZNNjX/opV/kOA9tREQGPQ==
X-Received: by 2002:a17:90a:f014:: with SMTP id
 bt20mr284070pjb.0.1597106785160; 
 Mon, 10 Aug 2020 17:46:25 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:46:01 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-8-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 07/13] hw/arm: Load -bios image as a boot ROM for npcm7xx
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3YeoxXwsKCPwlwomrriqsirksskpi.gsquiqy-evqrsrkry.svk@flex--hskinnemoen.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
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
X-TUID: e6HE0wv/52XM

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

If -bios is not specified, the vbootrom included with qemu is loaded by
default.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0b9dce2b35..26ea97072b 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -18,12 +18,38 @@
=20
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
+#include "qemu-common.h"
 #include "qemu/units.h"
+#include "sysemu/sysemu.h"
=20
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
=20
+static const char npcm7xx_default_bootrom[] =3D "npcm7xx_bootrom.bin";
+
+static void npcm7xx_load_bootrom(NPCM7xxState *soc)
+{
+    g_autofree char *filename =3D NULL;
+    int ret;
+
+    if (!bios_name) {
+        bios_name =3D npcm7xx_default_bootrom;
+    }
+
+    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_report("Could not find ROM image '%s'", bios_name);
+        exit(1);
+    }
+    ret =3D load_image_mr(filename, &soc->irom);
+    if (ret < 0) {
+        error_report("Failed to load ROM image '%s'", filename);
+        exit(1);
+    }
+}
+
 static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
 {
     memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram=
);
@@ -60,6 +86,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
=20
@@ -71,6 +98,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
=20
--=20
2.28.0.236.gb10cc79966-goog

