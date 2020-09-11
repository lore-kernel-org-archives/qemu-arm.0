Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1941207lfq;
        Thu, 10 Sep 2020 22:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt3DRv8NX9OxztBiJ6kOEx+bosYSUCcs4UqZFI1RvV9dCf2o9EgksKGa9dXLboPTOkSbvu
X-Received: by 2002:a25:d10c:: with SMTP id i12mr174586ybg.254.1599801846400;
        Thu, 10 Sep 2020 22:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599801846; cv=none;
        d=google.com; s=arc-20160816;
        b=X5T+S3+Oa6jHXEDMumh74An9UAkA7ln5hDdaFSqK29ji9/EGGDak6Rk9TG654ahYQx
         UzYK33UVKFOuSNMOlyfnTZYoEo8QxsQr5BpFxaCQWRKo6DZZtpPe9bbQEvqnTXAq8Ps9
         g1JCiLLHB3jOke+uUnwXSUM21+NQLVJG7Les5AtfL1ACYJBxe7bsPTXEZdT5144/H0xS
         MNJgUJFme2IH88L4h9O/wY5T/wvkWjoelxfKMStkwexflqwVpGWAtxTi2nrJiq9vVATy
         xsbZzYof/uZTtmxm3CDl2nu3m/lmPS2XeHCuOIHY5zkT6kUG9vdfXVwUwlxzUZQTKYEO
         QqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=3jDWACyK/zOqzUOXXLdjkBMSd4R2+fDPo6ekFqcl1u0=;
        b=OdHavUXzC+SibxNlx6PWJ+npX/Jl9ZMzlWW/Fs23YC37ew4Rew+li65ilVrFb7OrZF
         5TTBeUH/TGzYM1wtnFBQOmUpL/Aug63uVKEMGu4j7e6qSbJhVBNUnsZxUhkJbwWP6XkF
         5ZJsmdannz4/CPckbm6yT4YUYnctpnHlIcwsmyXR6qkYFpr/MuD/mna/z7PWZei3J4qn
         M+mIvqWIL9YU1Ui48HEzf+ANRpd6YXakr6kQd56MOTDF2urL2RcFT5B53UJm82aQNRd1
         weTumOAci5sBELi0hj/yxXbxx7eOY2Bkv3/ubM6xSNPe68W6RvnoIqwc94gjNj23lGFO
         QyTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=jE2aiTlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si1166728ybb.208.2020.09.10.22.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=jE2aiTlz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbXZ-0002Yv-OZ
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UwlbXwsKCNI5G86BB2AC2B4CC492.0CAE2AI-yFABCB4BI.CF4@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV1-0006UX-BY
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:27 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:36250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UwlbXwsKCNI5G86BB2AC2B4CC492.0CAE2AI-yFABCB4BI.CF4@flex--hskinnemoen.bounces.google.com>)
 id 1kGbUz-0002Nv-MQ
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:26 -0400
Received: by mail-pg1-x54a.google.com with SMTP id n24so2276260pgl.3
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=3jDWACyK/zOqzUOXXLdjkBMSd4R2+fDPo6ekFqcl1u0=;
 b=jE2aiTlzAeisrTlk061apG4pcwwBA0c4tYBlVG3rDnQxMfn3qSE9Gt0BUkoJGrVbzj
 tZuYXSfrt7sKQ4kaQZJqB4dag9mafjNbzh7dczZ6zje3UtTXUO8tGN5gGGnUNO+RBiXc
 aDjaewl6G05YXXrEKWRj40hbPTh/1sMt7EWICJfr2DE3woDhu85lq5f0UEUgdt7oxCdk
 PPx0Xu3UfrN5LqYTZmrqK6GGmDLKGb/mIsOQj8kJh31Cz4KhpKbjs+heAetceOTpf6Ys
 U8q9QoI2BjO52hYgW4xRnordVrnoVCrL/3F5SmgI31mSa8JIUiwprGibHiW2PsCGYkET
 Yp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=3jDWACyK/zOqzUOXXLdjkBMSd4R2+fDPo6ekFqcl1u0=;
 b=Dpu+Vwyd3gRJeFrGuaC1lG+S1kz9KNe/OHHsh2pckW0LW0Ztx/lCw4IxtqSr9ILBoC
 rXDAtMTMfamiuD246eum+MfcRRT0qHD9czo3XOcbvxhii+zOlkWARbTA3CttP/I8PzfI
 JMfCiwOGixvBY/qHiLL4LVUVsmq5buMdRVHOgEyawawQf6B+MUZd4MHZNzy4aylWvieS
 KgKDEsP2LztimI5im99pJzqRRvpdpBh5eNU095kDEHgUryskGjGXzQqSpVHUUFxABEst
 NEQW/g8JK7OCAEaTRWNuyYV3GfDArjpS4ijDHiau2WAECbkJ0znFNBEkYKiUE+gXmQZD
 cNVQ==
X-Gm-Message-State: AOAM532hA40AG9OrTaDNCcCsFODNUbR3U36OCilFMY7Ugfl2VBDRkSuN
 R0uSav5CTyYnnbcLdDK53wZgqA0WwAqbLWNEZQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a17:902:fe0b:b029:d1:9bd3:6e20 with
 SMTP id g11-20020a170902fe0bb02900d19bd36e20mr683762plj.31.1599801683638;
 Thu, 10 Sep 2020 22:21:23 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:20:54 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-8-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 07/14] hw/arm: Load -bios image as a boot ROM for npcm7xx
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3UwlbXwsKCNI5G86BB2AC2B4CC492.0CAE2AI-yFABCB4BI.CF4@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: yBGpaXdE4cs3

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

If -bios is not specified, the vbootrom included with qemu is loaded by
default.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 939391c3a3..b4c772d6b5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,12 +19,42 @@
 #include "exec/address-spaces.h"
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
+static void npcm7xx_load_bootrom(MachineState *machine, NPCM7xxState *soc)
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
+        if (!machine->kernel_filename) {
+            /* We can't boot without a bootrom or a kernel image. */
+            exit(1);
+        }
+        return;
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
@@ -61,6 +91,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
+    npcm7xx_load_bootrom(machine, soc);
     npcm7xx_load_kernel(machine, soc);
 }
=20
@@ -72,6 +103,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
=20
+    npcm7xx_load_bootrom(machine, soc);
     npcm7xx_load_kernel(machine, soc);
 }
=20
--=20
2.28.0.526.ge36021eeef-goog

