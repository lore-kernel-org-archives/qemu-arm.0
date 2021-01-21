Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp162353lfb;
        Thu, 21 Jan 2021 11:12:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOITg25nb5CBSiPBHuUGnbSEvPJK862GdueD0YnmOld+efXFr/R4Sbly06HSI9SK/JDvg/
X-Received: by 2002:a25:9bc8:: with SMTP id w8mr1160238ybo.354.1611256332347;
        Thu, 21 Jan 2021 11:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611256332; cv=none;
        d=google.com; s=arc-20160816;
        b=n3sGMJCHD+rvTAHAMO/BqKWlNTAmJphPAIitEzUaITDTudcI/MPlOxqUHpJYcwdNC5
         VLoVLaCPtUNlFaJZZf0q5V3SfFdcd/6psmaA3iicyldkD6MRhMQTp/ErfiXZECsiQZP2
         aNiRtzOBlCjItEX8ollE39ONR9JY+TFGWJdGovdrGz+SFmhmW2h82Wg8w81VDE3xAWO7
         MYj+pKdPSYk8Mo/ZX0mraTQEpg13mr3d0tTLeR44VhaPTVggmKd6iuVZv5igo58JimJi
         0JDHmfEv21FufXDPWPE+MRT0MXepagwvVCwZ7+k4ByEQ2+tJCjGHAXsQ18wCQifhEY/0
         7DWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=71fXmSxG4SGO/lxGONnTuENMy4+MVUOt7YwIy8LfeBo=;
        b=iRGuAJli49x5Z/rWu/JTL2sQTasrvO7J3UumpA7TWYsyJyO+dddDl84dSdWtwU7Ahg
         fxuUqaYrvFaNqSr6nNbpZVEhl5BRocKoJ+Y3zwU/HXUZq0n9IrSxEDwipe+BEPa4kKFl
         0Q23RnNbKmdOxvCyIPMs/QZQGRY9FHRx+LG4x+n8KNcRh+NwnckUrBgfVzfyhhRSQS0g
         FeTWI3ugySvn4jaPSyPXogCYoXCQ6ebJpueTx7P6U9Vhpk9KYz931gnoDHGvOGssPxjU
         sgTOZyf4upeNmPG6ph3My21VTKDYuGDdyDW5onhmycuY1XqV+fs3qRaaALOvoaSYop6u
         JXeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gye4933k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si5801079ybl.435.2021.01.21.11.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gye4933k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fNL-0008JO-NX
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI5-0002F0-LT
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:47 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0005pV-GV
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:06:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 190so2412857wmz.0
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fXmSxG4SGO/lxGONnTuENMy4+MVUOt7YwIy8LfeBo=;
 b=gye4933kAc2ne7YO71GYHXD59s2FPYqiDoWpqU3dzr5tETDWrm5S+CVr75TOFVOsJC
 rLHf1+fV/40Fbh35e3dI2rQH51mk9grziKBKVaZmPQgnwvXbw2HDPek9KadtEEVpcZwL
 vfyJGzQCABdjOiX+gc96aM/7bNuYR4a2SyNaibKB/YDeThJiMrKvbeZQKls9vN/H5EiZ
 4UyTxSHdiHL8sXnlQEO8zkEtiYQGkpBmg47muvvervCcaykQYfFpV737Bg06UXlHKeMC
 1xP08o24dZKDu466+vQXsZylv+i1ktZrDsfomuiAj2SkYunsV29yIjo9OMVCvc0SqUaW
 tZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fXmSxG4SGO/lxGONnTuENMy4+MVUOt7YwIy8LfeBo=;
 b=BUC/sDR2lyjAhCMpv6gdJaKL2hQIG7wL9iRUreEidNlRAVbzNluptM5UJov+nkVrB3
 SkMP9ISloojdCpDyko7XsPLwJPEiGZSIAN2PIA+3tCW/f6/I9IcQ5LtaUAww6BfuyCQb
 e0k+3WdoQ9AZ9BHfG6bsmaeqwTioXWR3fh4f+RqZTvKKN+Vlhf8uvfREbGTP11sf3NHW
 m6x7G5tooMBvPDLciW5pijaU04q00GKlXSuokxLu0QLndvashXfzaMhMMWZ4Ywvo5QrL
 gW6QBpFoCDCtnrSCnESJRHjBYG4MCR/TJCKaDlUsXymFeLKNHyanlnDfhhVVzYQWhwTm
 ICiw==
X-Gm-Message-State: AOAM5311eN9pIBhctm47bMkDSujrCB9Z6eO4xh0zrk4ecDpttGDDEION
 rFJssBHctTjpsWgx9sgYAB0/P+I/Fr+JgQ==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr690186wmd.145.1611255996983; 
 Thu, 21 Jan 2021 11:06:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/25] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
Date: Thu, 21 Jan 2021 19:06:09 +0000
Message-Id: <20210121190622.22000-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9wLn5ZXJh2Go

The old-style convenience function cmsdk_apb_timer_create() for
creating CMSDK_APB_TIMER objects is used in only two places in
mps2.c.  Most of the rest of the code in that file uses the new
"initialize in place" coding style.

We want to connect up a Clock object which should be done between the
object creation and realization; rather than adding a Clock* argument
to the convenience function, convert the timer creation code in
mps2.c to the same style as is used already for the watchdog,
dualtimer and other devices, and delete the now-unused convenience
function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/cmsdk-apb-timer.h | 21 ---------------------
 hw/arm/mps2.c                      | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index fc2aa97acac..54f7ec8c502 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -45,25 +45,4 @@ struct CMSDKAPBTimer {
     uint32_t intstatus;
 };
 
-/**
- * cmsdk_apb_timer_create - convenience function to create TYPE_CMSDK_APB_TIMER
- * @addr: location in system memory to map registers
- * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating baud rate)
- */
-static inline DeviceState *cmsdk_apb_timer_create(hwaddr addr,
-                                                 qemu_irq timerint,
-                                                 uint32_t pclk_frq)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_CMSDK_APB_TIMER);
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, timerint);
-    return dev;
-}
-
 #endif
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 9a8b23c64ce..f762d1b46af 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -83,6 +83,7 @@ struct MPS2MachineState {
     /* CMSDK APB subsystem */
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
+    CMSDKAPBTimer timer[2];
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -330,8 +331,21 @@ static void mps2_common_init(MachineState *machine)
     }
 
     /* CMSDK APB subsystem */
-    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
-    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
+    for (i = 0; i < ARRAY_SIZE(mms->timer); i++) {
+        g_autofree char *name = g_strdup_printf("timer%d", i);
+        hwaddr base = 0x40000000 + i * 0x1000;
+        int irqno = 8 + i;
+        SysBusDevice *sbd;
+
+        object_initialize_child(OBJECT(mms), name, &mms->timer[i],
+                                TYPE_CMSDK_APB_TIMER);
+        sbd = SYS_BUS_DEVICE(&mms->timer[i]);
+        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
+        sysbus_realize_and_unref(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, base);
+        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
+    }
+
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
-- 
2.20.1

