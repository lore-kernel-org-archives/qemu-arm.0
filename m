Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9089901lfc;
        Fri, 19 Feb 2021 07:05:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ4YTg3V/5H1zyaI4aqygm8qOZCsSuAzKyX9UhFI6d/814t3NwvAV868vVuPJ4BXfWMVOR
X-Received: by 2002:a25:cbd5:: with SMTP id b204mr13605613ybg.411.1613747125808;
        Fri, 19 Feb 2021 07:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747125; cv=none;
        d=google.com; s=arc-20160816;
        b=WHXt6Gi/U6NgHZg1lhzhv1XRXlrMXJLF7EHur7L/pqlLg0FrFC/8Q812VibZgj8d2i
         yconOBV4TwsKkynoIYhHZA+xzHlfJltNB9i87h9cnkSrH51nWf8AjDIHjnWjqI63MXCJ
         jdIBS00gM5FnXScgNbgBorOSIpKwTwdPfEV7dZgyBcVX0RLATa6NN5rwZyPAgeV6tbya
         LyZXRMY/M1h+OeZvwOjxaygI0VibTxTSJCWoMra66YvKGIKttzwniiQHuayA1s7lgjpF
         bjX/1rUtVM4kvDNcmx2rIISqj3scrZ+evxhF+pb5aBa0sxul+dkqTRbCpWvxPXlI85Ee
         T8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QtFzdKHJmcOWhOa7pgzMvs7QBcJQKYPiMAhl2ByGZDs=;
        b=nkpd5kPpUI3K5N0fTyr/GUUl7CS8a8aP19BneLU+2H5Vrtlig2M/4gwUTZuJS+arA6
         tZwPzQ0MTiI90s/vuq+nBLWlrA4arA3dcQ8df+Mk6QkbNdukvsxDp5cKCBYxjbYiHk6m
         gPjIraBxVpP4jNun5wpk6uhbGnz9Evm8bIyRqJzb6mRHwJKgoSCLK5wOa3JbPyMIlMlL
         A1uYkCy+8uAID5Yz+QEdJrSLuCljdvOECmSSaqL2HEPaSf6AQbrRsQIsBP0oVhLxLqTJ
         dx3Jj2rolcrejJ++IKhmBWGa3DjYW7cySz1ArlKQNk/xKPnkFDIJhwuuDsX2g+7C4569
         j1xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5YSSQLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si9337478ybt.310.2021.02.19.07.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5YSSQLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7LR-00082i-2c
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73i-0002X4-PC
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73K-0003aY-Jm
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:06 -0500
Received: by mail-wm1-x331.google.com with SMTP id o15so7278796wmq.5
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QtFzdKHJmcOWhOa7pgzMvs7QBcJQKYPiMAhl2ByGZDs=;
 b=B5YSSQLtZfWU2QqFJgig9mnVWyr2rMYrQcEZbccx8ZKcreww0TSQKCeSNz9ByCG9VB
 TFVAESXSzmbAxzJWWXX57kZ64jcwl76XNpUSxxjLoYiisGCLIdpT94NOLBkedu0NUyvd
 ZMv31YKkQ/geSkWqBrSdLybw6/fe8JzgpzhX+jzOClpXmtReBcBlwxheVie4GE/KamrE
 EGcnvXnfvqofnq1hRFckvpe02k2UOVuZZ+3ET/jfhOF91yhFgR9L1LGAKkblsjVCbZVg
 f0gUVI0WV1IKED585uRK65F9Zem4xbMbLuEIHJjWe/rrHYtEZYeDYd76dbHUYFBAVYuK
 s0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtFzdKHJmcOWhOa7pgzMvs7QBcJQKYPiMAhl2ByGZDs=;
 b=SxknYCtg6kkV2ABPcJxazLPJrUbd8P0//CleAUCG5qjmV+/dYphRxqmXzOfej7DKGG
 yV8bL+HkKuuibzKfgNbQVz1XSXYqJbVzder3++r2vvbsKmPhleD+Dw8dgFrop/hOIz6F
 RNcFYM+iQrJak5cNjOG45M3Sou2cP4CLt3e4oD7slO+fA513Ilq2zr4rpwuSdLR5GX7m
 jSGgh3eyQi+jH3s/wcOpui0E/g4dzq0iNF1C+9oJoeSLnrP7IrdPfy7hpwfb5WMgleXB
 RbWcq4hRPzj/xLIoGSgruvsIqQWOHoJswwd3Qu/RXeG+h0TAuzgjNLrlNQ4f+WqccAlK
 pBzA==
X-Gm-Message-State: AOAM532huUWGIomL4BVqg3RXdTYbaeRZaQH55vyjf6qbh9WmQ9sL0P27
 iD1IrXfTkEesRsWOnIfadZnoNJ/wlt75nA==
X-Received: by 2002:a7b:c152:: with SMTP id z18mr6790863wmi.0.1613746001339;
 Fri, 19 Feb 2021 06:46:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/44] hw/arm/armsse: Move sysctl register block into
 data-driven framework
Date: Fri, 19 Feb 2021 14:46:01 +0000
Message-Id: <20210219144617.4782-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: iqD15SuKWV24

Move the sysctl register block into the data-driven device placement
framework.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 91f30b1fdc4..961b2d44137 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -165,6 +165,14 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NO_IRQ,
     },
+    {
+        .name = "armsse-sysctl",
+        .type = TYPE_IOTKIT_SYSCTL,
+        .index = 0,
+        .addr = 0x50021000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
@@ -419,6 +427,10 @@ static void armsse_init(Object *obj)
             assert(devinfo->index == 0);
             object_initialize_child(obj, devinfo->name, &s->sysinfo,
                                     TYPE_IOTKIT_SYSINFO);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSCTL)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->sysctl,
+                                    TYPE_IOTKIT_SYSCTL);
         } else {
             g_assert_not_reached();
         }
@@ -447,8 +459,6 @@ static void armsse_init(Object *obj)
         g_free(name);
     }
 
-    object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
-                            TYPE_IOTKIT_SYSCTL);
     if (info->has_mhus) {
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
@@ -915,6 +925,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSCTL)) {
+            /* System control registers */
+            sbd = SYS_BUS_DEVICE(&s->sysctl);
+
+            object_property_set_int(OBJECT(&s->sysctl), "sse-version",
+                                    info->sse_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "CPUWAIT_RST",
+                                    info->cpuwait_rst, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR0_RST",
+                                    s->init_svtor, &error_abort);
+            object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR1_RST",
+                                    s->init_svtor, &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1132,20 +1158,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    /* System control registers */
-    object_property_set_int(OBJECT(&s->sysctl), "sse-version",
-                            info->sse_version, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "CPUWAIT_RST",
-                            info->cpuwait_rst, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR0_RST",
-                            s->init_svtor, &error_abort);
-    object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR1_RST",
-                            s->init_svtor, &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysctl), errp)) {
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50021000);
-
     if (info->has_ppus) {
         /* CPUnCORE_PPU for each CPU */
         for (i = 0; i < info->num_cpus; i++) {
-- 
2.20.1

