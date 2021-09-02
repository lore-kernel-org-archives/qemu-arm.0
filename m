Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp553932lfb;
        Thu, 2 Sep 2021 12:00:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr7Wh1XvOmwGQ5gZOsrtP1ODOPW7RrqeB2DflrqJ+7wejCp9UJePnfj2fWMBnkeLqsbHFi
X-Received: by 2002:a05:6e02:1522:: with SMTP id i2mr3511898ilu.208.1630609207092;
        Thu, 02 Sep 2021 12:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630609207; cv=none;
        d=google.com; s=arc-20160816;
        b=OGnml8cx8QtZxxMcFlrNopfRsh4o/VEMRAj7Nym47TCCkRZab6dlMNBHvkxv5s49d8
         8LkKTkIMmX+R+tWPj+AYDJYBnZ8EDwNdhOJucbT2bsB4opQJa52SVFuCjsRlUcRAL1AX
         jTDZ25+uHWd5qAfAzCaLcQLcpHst2lYKJCnauAjpwA2F7k4KlzNLZjhfRxtEh/bCTj/G
         I/HH2CIMIHshQE4E9VsQvzO0w92mk4CeU32TeNsKfMYslv74jbqZS7Er3Un9dvcCyD6P
         /+JfSxydWAKXYYDSrTuPkpouVxY02DU1k15iXvxhGqHizWjsYpSVdZGh2593H18f7tEc
         1Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=IifeVj0x5s3FD5lYsHnRcERM60TJI4LyuUoaF7MmBt8=;
        b=XyPFwWJwh9nOlPXs0ww4WVjmtCtngT5PiZZrnNcPInVeMjeI6JDfcDysnv/1MQjYYZ
         5t36NHyVvi6htneH4K4Y8vcmT5OKGYKtFgXvbZet9mmk/CjEC4xhs+JYoo55uINKbyJM
         /9IrDxriNSGETumjMFoy1j1PjxwPZ5Vb6WQjiDRIWAtsLaFHJGEffILh/VUWSSooWWoI
         kIjrvVeTuO5ixHGlWiK+FbAjkeHPwy0RHM/lh5VbZVgcnzqQQux8tmV8K2qaDLL/SnFx
         mHM/lYHfbD7LebxB3IIFbwAo9zJUL3omVpQCftvOPntF+ZB/OO1Ne0Fx5LBXfVo+gCXn
         li8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cPFuQpQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si2764589ill.70.2021.09.02.12.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 12:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cPFuQpQY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLrwT-0001gZ-WF
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 15:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LhUxYQYKCC0LaJdNaPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--crauer.bounces.google.com>)
 id 1mLrH9-0003o1-5d
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 14:17:23 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:54123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LhUxYQYKCC0LaJdNaPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--crauer.bounces.google.com>)
 id 1mLrH7-0006oY-Ag
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 14:17:22 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 n202-20020a25d6d3000000b005991fd2f912so3577111ybg.20
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=IifeVj0x5s3FD5lYsHnRcERM60TJI4LyuUoaF7MmBt8=;
 b=cPFuQpQYC529a0tZBaKy2lFQwUk9WXQ/2/GJaQt7JLEDw0a8xMCOXlEpjC/dmXEbIW
 HIRKDNeaNPVEGpkW50LaJxxCF1Sg4mpFL7dg3u8x+j1nN6/9scWyYm/yGEzNdOHbiVRB
 59ERNg0zHJ31bUMzEJ8JoIoRewHkQ2zefnAVpGf6t2WV6Psjj9L9rx7jBGIQz+dZjEnm
 bIED244bLXFSqDzfHbmNVEW0r+CLYvVSDKkez/OfDaBBwrZA1vsBE9wt0zxBbNYcBlAJ
 +R5VuyOuaDJVQmpjYghVOJ6cwjn8XkRSnqt7Bs5Y9q6WFcASQASbZnd9PjgQJBCX34pZ
 9KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=IifeVj0x5s3FD5lYsHnRcERM60TJI4LyuUoaF7MmBt8=;
 b=gPwQMbBsUMwYKDzHgDf4G8LYPEXn54q+wUWNIiYlImQXqeC/qmHg0icWqW7nR2rI24
 OFIrZCWXQPS4gJI+uiLt+bTRkJQEOZDtuc5C9SFVxjjSQCcZR5hGSF3ly54kWAKmsSwe
 kW6pmI4r7eyDiF6gQxujJER7hJ5j5Dw3WgG9/NOtyoNy37kZK2ufJ209YclJkDMLgI/x
 Ki4pYwuvfpKVD2oYgGZeR8Z0cRuqugHaHKIYYoN4TnSc83dtYCFrM5ssy8U4RRs5ENSh
 F2oi4DV1ggb+XyezxAUPwj/Sg0rk84OeyJJRLgdND3ePxR5UZp4xK9od29Ec03S4c7GC
 oCkg==
X-Gm-Message-State: AOAM531wMuLSW04/s4HZtGZNbKCiVqk18zr4jfN1OgEh8yqEuVifyWA5
 t+JsY4SBdpxcnjKXXZHWGs1KBor1AGg=
X-Received: from corumba.svl.corp.google.com
 ([2620:15c:2a3:200:b6aa:448:925a:1d1a])
 (user=crauer job=sendgmr) by 2002:a25:af87:: with SMTP id
 g7mr6209593ybh.256.1630606638735; 
 Thu, 02 Sep 2021 11:17:18 -0700 (PDT)
Date: Thu,  2 Sep 2021 11:16:42 -0700
Message-Id: <20210902181642.315792-1-crauer@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH] hw/arm: Add support for kudo-bmc board.
From: Chris Rauer <crauer@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3LhUxYQYKCC0LaJdNaPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--crauer.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 14:59:54 -0400
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
X-TUID: AmF8kySKAhfC

kudo-bmc is a board supported by OpenBMC.
https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo

Tested: Booted kudo firmware.
Signed-off-by: Chris Rauer <crauer@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 69f57c2886..adf497e679 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -20,6 +20,7 @@ Hyperscale applications. The following machines are based on this chip :
 
 - ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
+- ``kudo-bmc``          Fii USA Kudo server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e5a3243995..c80f442adb 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -31,6 +31,7 @@
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
+#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void kudo_bmc_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
 }
 
+static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Kudo BMC (Cortex A9)";
+    mc->init = kudo_bmc_init;
+    mc->default_ram_size = 1 * GiB;
+};
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gbs_bmc_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("kudo-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = kudo_bmc_machine_class_init,
     },
 };
 
-- 
2.33.0.153.gba50c8fa24-goog

