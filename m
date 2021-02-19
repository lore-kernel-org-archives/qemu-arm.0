Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9093599lfc;
        Fri, 19 Feb 2021 07:09:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx936ZUY05Qdc0spdD0OH4bNemh1WngFVUxeH0LKh7NLEWtuJxHzWYau/B8hDEdTr/kua/d
X-Received: by 2002:a25:730b:: with SMTP id o11mr14441897ybc.415.1613747345758;
        Fri, 19 Feb 2021 07:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747345; cv=none;
        d=google.com; s=arc-20160816;
        b=G3i6SwDf/fIK6Fgn3CG3HK5s7BGyn6XM1n91SNqF9spEaNatOjFt2TnIYMtOVWVc3T
         9EV23+zOyh3WnGw2z0bRGpyN7ldq8Ghin51DgbEcexNPztck7NBFQT9bOx0U+WcIGm+0
         UXp8Aax4NsB5x8QEipGNn/0jjlsb0IDaGpNhkXiGQS/JFnuNheP9uF70jxGiJN/MqOIg
         B+6r+jnLHj0iy1gaWOu1y6RFk3ub6Mvz3DuIfTwOxSQfE494/T8NlV3ksDpo6/vMe7jD
         dC+zXGQVaTz8cT8vw/4rt1qsOp5htVf0E1LxpPKcnKIDUniOUEvxFJadYrFbh5uG+iIi
         5J+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cUkpFgY7tiqXLrCF1eGUleIZNQUHBO/cDgm27ZFyGB4=;
        b=A28vRzj23IyjEPKUExW250K/YJMBqp5AbgGHRCGWP+ca6g3e9V2LwoDwXMnMevAq/a
         XFXoM1KmlktBL9KXLBL5vYPFhSiwupxL8hbmGXoc5hpQLV2RyPZ+faS15JdFYWQfwM7s
         gM4Eo5zAQwlUHoTNYJ8xUEod36XYPvla6+NCbnsweW0G/PqqkHXIo2ypQUgzvksCu/xu
         NjPWupiKeQl7QmxDDs8iQCD5R+La3u95/1o/smDAzNnlP08pUeAEs2WpEvkATdBPtr3m
         D/4D1oOoV3yerzYqMYuW+I1r71P6pbY3hUOdIvvoaFgNEmOcnvRCJU56ZCNtx93eoOdP
         3i5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEUATXAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si9612572ybp.285.2021.02.19.07.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:09:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vEUATXAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Oz-0004yC-24
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73i-0002WX-1C
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73J-0003aJ-VG
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:05 -0500
Received: by mail-wm1-x330.google.com with SMTP id x16so7275546wmk.3
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cUkpFgY7tiqXLrCF1eGUleIZNQUHBO/cDgm27ZFyGB4=;
 b=vEUATXAB9XP69ZbOGOISK88L6OX8Vz+hBAyyyL2ImLN3+JDaMb1B4DoC62G+9jnJsf
 +wFuLZGM7jqivaNM63tzBK1TrAIxOdZIR7Ezqm0zujGX2RhXLiVr2Km5UptnK86wgGfH
 SfTHC61zOWAgl/nfg5STV2LZ/e5/+6it5nlTlS1T4NbFlHfQaXGnBAI/iC1/ksY8U153
 cOYtuWBFkYojLZkqFG8lk/xmXtPBigpy7vbuB1hrPU4z5rdTZNVK+MPFe2rw1C04ehZ9
 L4cMNXX+3OyGdi6QtwztpcJpDIDxwc4FMXR+FfDSzZik/kQXKhtir96Ry0VxvDdVOiIs
 V5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUkpFgY7tiqXLrCF1eGUleIZNQUHBO/cDgm27ZFyGB4=;
 b=oVQtEGw7f3aGdeiTL0zF8rpu/Y9SZlAvSdBgkzZYi1zYzRKpiCbgHEVlTaoWOUsNTu
 kPJTYdeGQLX80NrwrrGRBKZFE4ES7iqYHVjxP5kalT5TAYRBF08b6Ovbsrmd0qTJe0wq
 /auJoIg3XB0JjTWLRJfQjTL2JgO1hGyBHKzqfCRbuiyPq47NxuDBuuMSxzYdSnKUbj/T
 etj89kwQIc6FGKMoLTmNyK4mdOUsY7UoSivz1Vcoj819v+jaLFqONr2fz4cdhzXtc4LQ
 FkNE6jNUo+dLvbWP/qbxG8YpvhxdXY5rndZIQ/VMOXRLjOWQbiPUefKVRpA324+ZwliD
 yNzQ==
X-Gm-Message-State: AOAM533Pd6VEHvQKZdLQSn8cqEbSkAD0mn2o5tnuwW5UPhGyd5rLoiJr
 JkXy9+1FrTEqPR7+0yVNJdenPFj2r1ibDw==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr8571215wmc.131.1613746000691; 
 Fri, 19 Feb 2021 06:46:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 27/44] hw/arm/armsse: Move sysinfo register block into
 data-driven framework
Date: Fri, 19 Feb 2021 14:46:00 +0000
Message-Id: <20210219144617.4782-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: a5kLJQRNYr4k

Move the sysinfo register block into the data-driven framework.

While we are moving the code for configuring this device around,
regularize on using &error_abortw when setting the integer
properties: they are all simple DEFINE_PROP_UINT32 properties so the
setting can never fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 47 ++++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 3270362d599..91f30b1fdc4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -157,6 +157,14 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
         .ppc = NO_PPC,
         .irq = NMI_1,
     },
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x40020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
     {
         .name = NULL,
     }
@@ -407,6 +415,10 @@ static void armsse_init(Object *obj)
             object_initialize_child(obj, devinfo->name,
                                     &s->cmsdk_watchdog[devinfo->index],
                                     TYPE_CMSDK_APB_WATCHDOG);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            assert(devinfo->index == 0);
+            object_initialize_child(obj, devinfo->name, &s->sysinfo,
+                                    TYPE_IOTKIT_SYSINFO);
         } else {
             g_assert_not_reached();
         }
@@ -437,8 +449,6 @@ static void armsse_init(Object *obj)
 
     object_initialize_child(obj, "armsse-sysctl", &s->sysctl,
                             TYPE_IOTKIT_SYSCTL);
-    object_initialize_child(obj, "armsse-sysinfo", &s->sysinfo,
-                            TYPE_IOTKIT_SYSINFO);
     if (info->has_mhus) {
         object_initialize_child(obj, "mhu0", &s->mhu[0], TYPE_ARMSSE_MHU);
         object_initialize_child(obj, "mhu1", &s->mhu[1], TYPE_ARMSSE_MHU);
@@ -889,6 +899,22 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
             mr = sysbus_mmio_get_region(sbd, 0);
+        } else if (!strcmp(devinfo->type, TYPE_IOTKIT_SYSINFO)) {
+            sbd = SYS_BUS_DEVICE(&s->sysinfo);
+
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
+                                    info->sys_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
+                                    armsse_sys_config_value(s, info),
+                                    &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
+                                    info->sse_version, &error_abort);
+            object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
+                                    info->iidr, &error_abort);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
         } else {
             g_assert_not_reached();
         }
@@ -1106,23 +1132,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->container, devinfo->addr, mr);
     }
 
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
-                                 info->sys_version, errp)) {
-        return;
-    }
-    if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG",
-                                 armsse_sys_config_value(s, info), errp)) {
-        return;
-    }
-    object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
-                            info->sse_version, &error_abort);
-    object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
-                            info->iidr, &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
-        return;
-    }
-    /* System information registers */
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
     object_property_set_int(OBJECT(&s->sysctl), "sse-version",
                             info->sse_version, &error_abort);
-- 
2.20.1

