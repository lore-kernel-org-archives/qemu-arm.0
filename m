Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9098035lfc;
        Fri, 19 Feb 2021 07:13:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFbz4Ys8Khv2A2/KtEB5q/YrqkS6wAaKdgqUsZSWHxA6fvgOuQzoTzkiT7q3hBCr5xX4NN
X-Received: by 2002:a25:1984:: with SMTP id 126mr13461301ybz.341.1613747632344;
        Fri, 19 Feb 2021 07:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747632; cv=none;
        d=google.com; s=arc-20160816;
        b=QjHe2659wzQ57imFilPcPiib1P8dcmarAGLo2Idmgy3SGYcChdIQzlnpMKshdTS0xF
         iOKFOUSl8XmF7Ncjiwham2lVhziCzVwIFA/8JhOEDG8qlMv5WpLKungbM/XLRMcSrpi4
         z51FWfcHqJ9b2gdO+6oUaoo82WuvN0AVLpGI0ef19iiErvtzodG/cga0ZrSxuMI0qBQx
         GZxcBGq1GGlLzTG2XLGpjBgpADkM1yRvZlrlM73EzuIxXPinrqgm8e6vtXzw7rf0QsNN
         DIfLgfCIAPSVy8u//rJoTt4bFURIU3v+q17vAfWHGcJIBnFSSIxfo+5Q6zKdDZclaAeN
         /hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UWgUkQ5pNZaZMRQCNjAYP//R+U9Ab+cfi649cOww/uQ=;
        b=HB2IlImU9M/zEefm0v+5HAu30rZ46f9YLdZDytaXNdp0N2aeYAgC8dNUSyEIg/FMJI
         TXesGoUMYLOzes//xYMQCrwbIv0DOATnXElUQeWwe51lYEZxFGFBbDl13wfhJek5iKry
         Usa0skgXbBAIrg7OVvsdCN9/lcut3KP4KitEQcSpWFN13/mX+7tT/yCuPwfKT/kXQD3I
         C3JGPHUp/gW+LErAHtfI6+I1X9yVlnbz+WXkgaipwdgyAGVIYpdutl1wnyNM/Qu+ihdW
         i7KMMN3JGOkWlCiptQLJPzgHjEMlTXIfQTxfoww39TgMfQvXd7Dor4JcCk7WPD/Jtp+Z
         KMkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=up4D5Ybd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g205si8483720ybg.317.2021.02.19.07.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=up4D5Ybd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Tb-0003ig-L9
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73h-0002W2-D0
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73J-0003a5-IC
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id x4so7882020wmi.3
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UWgUkQ5pNZaZMRQCNjAYP//R+U9Ab+cfi649cOww/uQ=;
 b=up4D5Ybd3VUz639hzzbRDxYYcMYcqQsmROk3eB0pmJw6g1cA2zor4pzSGGKHGg5kie
 VreIsb1HbeJtRtnP6heucbgKRh6xDaGjRcMkU8w6+UHHZWx4cfwKC2mO3CZqLHyLXTqe
 9GM8dfGiKKgmPPTHDqBkzGTcLPtwxL/nY3LqZqRAi5OjbbgukwJF7hqjmEqdmCEFxYRF
 my1hG4LePkZmCvHOHL3Sv12b/eM3JXyPBJmxfK2X+KjItdsXf655VvYlyT3lan+rF085
 7yETKLKWxu8yZS8cOCZ/91QuRRZGM3PA4kIhgO1jczgRbSJTmHllEKxY6p8xXLsb29E6
 4zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWgUkQ5pNZaZMRQCNjAYP//R+U9Ab+cfi649cOww/uQ=;
 b=Su6szHU65kXam9p+CQgWPLYrzTOVSAE2iclNlscnX/pji7vFj8M9Te0+S6Zb48Ekus
 UAwHOfnar0K5/OPi7Gnt2+kZ/K8bpL1scvlcLAe38oVMDiWqrKiQbmkGrTi59CxnoGhR
 oa5AWOZLJ8xh2A//h+Apj4jFCOie5khf2WVcHS10m9VaT90x+QeKHwt9jL9yPnA0GhK/
 4tsekRAAZ00XyPBaGEwNWDIcoY7keOIKwA6puai8Z3GUilclhkzU7RUAyJooT9aZv79q
 EaEg7fy70rDf3ihGPUlB9QjaPNH8jo9S9vDBFwObrRbRPNIW1LefYngRdUArFI2M5Af3
 uVlw==
X-Gm-Message-State: AOAM533cm7DDk0aT3CzXXxAeUrT5s1os0e0bEqh4jHyp67PQPVTRcZnm
 v1k77Qh9awqKpXIEA+L76dUEAPctf11bCQ==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr8476371wmb.135.1613745999957; 
 Fri, 19 Feb 2021 06:46:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/44] hw/arm/armsse: Move s32ktimer into data-driven framework
Date: Fri, 19 Feb 2021 14:45:59 +0000
Message-Id: <20210219144617.4782-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8YMNC9JKKDyw

Move the CMSDK timer that uses the S32K slow clock into the data-driven
device placement framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 +--
 hw/arm/armsse.c         | 31 ++++++++++++-------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 3f8f3750577..7416c08a802 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -158,8 +158,7 @@ struct ARMSSE {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
-    CMSDKAPBTimer timer[2];
-    CMSDKAPBTimer s32ktimer;
+    CMSDKAPBTimer timer[3];
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 6540ffb919b..3270362d599 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -113,6 +113,16 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc_port = 1,
         .irq = 4,
     },
+    {
+        .name = "s32ktimer",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 2,
+        .addr = 0x4002f000,
+        .ppc = 1,
+        .ppc_port = 0,
+        .irq = 2,
+        .slowclk = true,
+    },
     {
         .name = "dualtimer",
         .type = TYPE_CMSDK_APB_DUALTIMER,
@@ -425,8 +435,6 @@ static void armsse_init(Object *obj)
         g_free(name);
     }
 
-    object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
-                            TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
     object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
@@ -858,7 +866,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
             sbd = SYS_BUS_DEVICE(&s->timer[devinfo->index]);
 
-            qdev_connect_clock_in(DEVICE(sbd), "pclk", s->mainclk);
+            qdev_connect_clock_in(DEVICE(sbd), "pclk",
+                                  devinfo->slowclk ? s->s32kclk : s->mainclk);
             if (!sysbus_realize(sbd, errp)) {
                 return;
             }
@@ -1059,25 +1068,9 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* 0x40020000 .. 0x4002ffff : ARMSSE system control peripheral region */
-    /* Devices behind APB PPC1:
-     *   0x4002f000: S32K timer
-     */
-    qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
-                       armsse_get_common_irq_in(s, 2));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[1]), "port[0]", OBJECT(mr),
-                             &error_abort);
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc[1]), errp)) {
         return;
     }
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->apb_ppc[1]), 0);
-    memory_region_add_subregion(&s->container, 0x4002f000, mr);
 
     dev_apb_ppc1 = DEVICE(&s->apb_ppc[1]);
     qdev_connect_gpio_out_named(dev_secctl, "apb_ppc1_nonsec", 0,
-- 
2.20.1

