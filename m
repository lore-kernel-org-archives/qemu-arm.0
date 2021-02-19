Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9095718lfc;
        Fri, 19 Feb 2021 07:11:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdlD9rhR3Dmh0UMk/QpOVsB1md0YpXhy/TdJhaXC+fx69ycJ7mPunrNvemjxvrLb1FRpLE
X-Received: by 2002:a25:b746:: with SMTP id e6mr15195211ybm.82.1613747480392;
        Fri, 19 Feb 2021 07:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747480; cv=none;
        d=google.com; s=arc-20160816;
        b=LjVe0oKNjlMUOUQYnZUrkYZ+v3Ppazhb4rFRgJyOww/SA73ectZ/skESx/0etUoYkM
         oeO1HUHCq765FgqW97oXim0vPXAcFxL/LL7k3ul2Zagxsvq3kkBNksUVWwWPB1FuCCst
         /ZL7Bo9UNrMRMkzU7M3qnjD/Hf98djSmx6+PZq483+S2ZUZQBaYpULgi39a1fzw3Y8Dw
         yyQ369J3UZHA6xI1Jp+jaKzmrCSx52wd8d7upwyLvcvAnSxZ01J6LcuCgEHlYEV2i+ef
         z1f2AqCIZLdaJUrij9I3uObn6QZYoaw2KfzsOFa0OVgXDJw+igicx494L5ZSarcBDJJq
         yvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ou09H48NtnRHyRFT/ewuJC3FR8Ak/PHc4n9tF+Stryo=;
        b=P6CQ0HO+4Tt3W5vcxNg9IaXMNEq7ncFUQvIrfgimWGE/dgoQng2MdWc3KFWdeNeTC+
         VcP9NEy8ywntK6GXVHD7jlyJmrlQ1vX7JlowQTtGBKXQMfoCweQ3FpZIa0UjI6exgnbJ
         Xe7DuZDv6ajofkIubAJa2NBO134Vf2Zq1BetXkXDCOjGe/mTyynNFIWyc9l4/3SlAvK+
         D+f0kgRK0rbEEc6ECIIeHAsS7kzj34SiF8Vyj2gd5Zzl3cqNB60Ysb3OGWK1xCWpPymS
         UgRlYaOGogDxP0qwh0XV8eLER/HLZ8s50NeDxPQetgylk2CxvUZ4Ps5KLdDqfYSmsuKq
         d1VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ouS9eXgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si10271153ybc.378.2021.02.19.07.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:11:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ouS9eXgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7R9-0000Yp-MR
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73q-0002hk-MX
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73O-0003cb-2O
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n10so7900244wmq.0
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ou09H48NtnRHyRFT/ewuJC3FR8Ak/PHc4n9tF+Stryo=;
 b=ouS9eXghQsYzwGTIROUfoXCVce9rqNdrMiXXnMMIElX+nUFEoje+FI94YWNxG+IzZ0
 tUHE/5eRLbd/F25mKj9D9RtIp97bSpRbRv5WvoLwcOGOrwWZjxi+u30EStdLMap+AwNv
 vjfjWqwAJ4kGrCoDrZtelvlcvymVo9zDPRsQ9LfB8eoQvbcjC0mgeMDAfr4cRmLas0sB
 CXSdJBMHEtRXned/qOvYfLEPBWIkAdQ7F2RfLTJONASTTV9xJRRkvaOaUrGHkXPEkP1y
 nT09Ihs3Sqvtm4hCe6eBGYjAWCUYsr4zNCehKIfcVoq3sIlgYHF328aifZ32TAxBOyrW
 EEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ou09H48NtnRHyRFT/ewuJC3FR8Ak/PHc4n9tF+Stryo=;
 b=CE4VwVaMdXoun8iWTvcLwOz8Trhfm6wxuhR9gFT8SOmn0xbbCD255xGm7I/u7NuOnU
 ju4xsGzPsagPxlf3kFIyy5RwdgtTX1nwJdM9mh3v1iYvD9Yd/eGAaQ9gaf/J2euu/aEd
 j9MjmEkmOp+tAGGFsi5yOueUi7qqbg2bsXTyiWzKypc040XrkUqFHQSn4Er7SdHcrxDI
 9z53hpphxkXI9opOy2OUyIEhWcWMNHpDBsqyHjnN7fNf6GfaKTJLBAzmLGYppd0jMkKr
 kPy+c2N4qsZnIBCciuOLaFyOQOrDEDffvvWjjiatb1/8Xjd2Sq4lbLXTe3lAoEZT92/H
 Nc8w==
X-Gm-Message-State: AOAM533TbsOlCexkAXis+wvZZlZy20vyH0o+oNlcQUg10vLL5NrK38ak
 lqG0xk6/4tYNM77d3Nt171u8pf7hb75mkQ==
X-Received: by 2002:a1c:20c7:: with SMTP id g190mr8437861wmg.156.1613746004698; 
 Fri, 19 Feb 2021 06:46:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
Date: Fri, 19 Feb 2021 14:46:06 +0000
Message-Id: <20210219144617.4782-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: lqBZGMaSYN1Q

The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
the code for having these in an ARMSSEDeviceInfo array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  2 ++
 hw/arm/armsse.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 149f17dfc88..f4e2b680479 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -98,6 +98,7 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/timer/sse-counter.h"
+#include "hw/timer/sse-timer.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
@@ -166,6 +167,7 @@ struct ARMSSE {
     CMSDKAPBWatchdog cmsdk_watchdog[3];
 
     SSECounter sse_counter;
+    SSETimer sse_timer[4];
 
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 4387e98376c..ec9c30e0996 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -578,6 +578,11 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->dualtimer,
                                     TYPE_CMSDK_APB_DUALTIMER);
+        } else if (!strcmp(devinfo->type, TYPE_SSE_TIMER)) {
+            assert(devinfo->index < ARRAY_SIZE(s->sse_timer));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->sse_timer[devinfo->index],
+                                    TYPE_SSE_TIMER);
         } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
             assert(devinfo->index < ARRAY_SIZE(s->cmsdk_watchdog));
             object_initialize_child(obj, devinfo->name,
@@ -1058,6 +1063,16 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_SSE_TIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->sse_timer[devinfo->index]);
+
+            assert(info->has_sse_counter);
+            object_property_set_link(OBJECT(sbd), "counter",
+                                     OBJECT(&s->sse_counter), &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else if (!strcmp(devinfo->type, TYPE_CMSDK_APB_WATCHDOG)) {
             sbd = SYS_BUS_DEVICE(&s->cmsdk_watchdog[devinfo->index]);
 
-- 
2.20.1

