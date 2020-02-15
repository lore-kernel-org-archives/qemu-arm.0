Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3355363lfp;
        Sat, 15 Feb 2020 11:19:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8sapDFJct8Xsd+sgdkqSM5BjPDQoFNu5z1s1MIhc/W0LhIyNtV8iivOfxfI1/iOj8WeRH
X-Received: by 2002:a05:620a:1383:: with SMTP id k3mr8174789qki.252.1581794353257;
        Sat, 15 Feb 2020 11:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794353; cv=none;
        d=google.com; s=arc-20160816;
        b=UU6gkjJvRoya9T0nx0gDc80madSc441HemGB2K4CWKsLIKrqa53O3ead7nEdmvm9ZK
         CiJIUcs4nlgeCoAYZ5VNVxfWv08zcA/le8Kn9Mo0/eZbSNlbsuZZ3vUF2v33df3JJmDL
         +TSjAPNg4wt52GpHo6+m9Jb9e4xqC5gywMb50pvYEDBeyUa+EnIFMpop5IZGB0pKfQJG
         nWuiNR34TeI9q+tmtyICGKMJycFvbuVf3Rx+PWtA9MXxXkqVknx8Nu2bE7TE4nzmhGlu
         SKcNECqf32/3shQJqzVY2cKFQ2Ln2nQpXarGlujkpMxiagD5IVH+6hqT48KowxHIZyIZ
         RbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uxynYOVPY9FVrupSLyC8th1oxyDcEka8bWnY9WEi7fw=;
        b=R7x2Sh1e+FsIiojNULTeVAQc5l4am94CMjyoYUXv6lr2BKdkeLa3wxVi4ehMvReLTy
         xogEhqcpRw+DJc8IwpNY1almzqmSOboWWysLj4HS+yVgUBuIDuGQThxQohAYIbjxTSLR
         HT06voPNEYGuxd6uAQnzLn/49T3NAmh5oYBE9iPBgmAIpbWaBX62vZQs21pZNQqx/L5W
         6oCsp9SmOrcsPXPhJxm8xwG7qW0MQW7q+SUX19HeDSnJx29Zp11U5BsfZahaRhPFzrUl
         nGaaicedDeLyz1SGXrjdvemcDEcDtCwn9urRTbpLJcmJB1vT0zVsqHc6kP5x+Dp3H9ly
         1ZNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P4ohMMxR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si4295106qvr.3.2020.02.15.11.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P4ohMMxR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32y8-0005rX-LR
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v1-000062-Gs
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:16:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v0-0004Jn-Gc
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:59 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32v0-0004JQ-AL; Sat, 15 Feb 2020 14:15:58 -0500
Received: by mail-wr1-x444.google.com with SMTP id t3so14908650wru.7;
 Sat, 15 Feb 2020 11:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxynYOVPY9FVrupSLyC8th1oxyDcEka8bWnY9WEi7fw=;
 b=P4ohMMxR9cNR+cL8ZEDGWT7b7v8HasOKB2ILUyTUAlhqfvqEVhxD2MXV+XcYA7dX5o
 jtFBvrI23E9VKqqn9JbEHmfNYfbTlOzCLdkdQdIxVtG2xqai66b127D++bq581dHw3kJ
 5/R2Jne/3VH0DzqDJHPsyptpmAX8h0W4YNg4qRuFWuO7NSxeRc6evTPvBSD8YnKlQPSG
 dEiEKd7UOTbTb0Ds6tT9gJCfCplIHK/0LAFu8Kvz18IudPSnt8dYNK7ttMP0nMLcZ3dE
 7dGM+SZ68JnUUV1HbW/7EpFCFYYkbRBUc9MAYecaC32f+z1FHDrfRVvTV6jkZlGKx76f
 cjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uxynYOVPY9FVrupSLyC8th1oxyDcEka8bWnY9WEi7fw=;
 b=B4+rV7vAD/sTr86Fd9KZRYqpisSdDxsbRhgvxVKLo18k3czD/2+YM7sgfP4G3Qdr1G
 +M7COkZaxRiNN2BHwirNzh6mHtZjpwjcz0YFRCjLcoWOBaHlxxOPvLfhbK0li15fBQ1m
 SFd9LfnFO+MkDrnvQUMuUYju+m2tavLWey1hoNRyv00ROAopCUAc35fsJ3CmbNfNQZy8
 BBIMt8+R7ExxaTl4l/e+n8lUu2uCWXZGCNL+2hF/YlG2ERy39sivVIm4ta3n1gPNNmV5
 RpJni3HWMnxSf4ws+xbtJbsSIfsfIZmx/WPKwlze75x5JujmZEVtxg+fu/lQDw7RJazE
 GTIg==
X-Gm-Message-State: APjAAAUHAVAqOrPXe46NGr5abqWcLHqMXw56kgQFV2vYZ8dcjuxqp3Hp
 siM4nHOr1NsZTTHUGDYCghkx3brGfEw=
X-Received: by 2002:a5d:6144:: with SMTP id y4mr10979700wrt.367.1581794157269; 
 Sat, 15 Feb 2020 11:15:57 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] hw/arm/bcm2836: Only provide "enabled-cpus" property to
 multicore SoCs
Date: Sat, 15 Feb 2020 20:15:39 +0100
Message-Id: <20200215191543.3235-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pEYJIkhQsEPy

It makes no sense to set enabled-cpus=0 on single core SoCs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 3b95ad11e9..caaa4b625e 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -32,6 +32,9 @@ typedef struct BCM283XClass {
 #define BCM283X_GET_CLASS(obj) \
     OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
 
+static Property bcm2836_enabled_cores_property =
+    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -43,6 +46,10 @@ static void bcm2836_init(Object *obj)
                                 sizeof(s->cpu[n].core), bc->cpu_type,
                                 &error_abort, NULL);
     }
+    if (bc->core_count) {
+        qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_property);
+        qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
+    }
 
     sysbus_init_child_obj(obj, "control", &s->control, sizeof(s->control),
                           TYPE_BCM2836_CONTROL);
@@ -154,12 +161,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property bcm2836_props[] = {
-    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
-                       BCM283X_NCPUS),
-    DEFINE_PROP_END_OF_LIST()
-};
-
 static void bcm283x_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -179,7 +180,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
     dc->realize = bcm2836_realize;
-    device_class_set_props(dc, bcm2836_props);
 };
 
 #ifdef TARGET_AARCH64
@@ -194,7 +194,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
     dc->realize = bcm2836_realize;
-    device_class_set_props(dc, bcm2836_props);
 };
 #endif
 
-- 
2.21.1

