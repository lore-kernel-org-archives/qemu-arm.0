Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3768322lfm;
        Tue, 30 Jun 2020 02:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJSMKo8TZpC0Grake6iYBWZHXg6/NiJyJRjYv+OUaJW6DcIlBfinkfHuhhPyCc1IGnKI16
X-Received: by 2002:a5b:d0a:: with SMTP id y10mr32297103ybp.32.1593508243255;
        Tue, 30 Jun 2020 02:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593508243; cv=none;
        d=google.com; s=arc-20160816;
        b=YZnQPM6OtOLYPRQfeatDjXApHVt1JhnFpamqPQEPuB9jPGoaL2Z4Ond/A7C2ZtIFiX
         rHlYtiu4CdJwykggHJmjjWUxEcBtUV5NJy596fFbPr9P/RmqnXTCsWYZsV6Bzl5TUJTW
         m3uWdVfkJDHDHS59gfyprT3o+n8Hlwj+6N5U2at+fLuOVauRpFmoZWFcMDtZL/7+J9FQ
         TnwcgUXKEaEJKcFN1dFnCSVKuZsTOTaS+++FqQqYyr++6jD+m2MkC5uHXZvOYPUjUQDF
         t5rc8c89OEeX3RkQyqHDBJfIcLFchzdUhOj9ot5oqfij7G6eUS2QgfysK3MeY12mKI+r
         QT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v8RoWBaFDHIWifW7sr94ccs74UGdVOjvHbolf2g5ag4=;
        b=elUAMmF1h2vdijYXis6uml/p7kRFyEejzhxmF1dghNgyGEhtRr19ZrZmD6dXuOHzWG
         o9vNqqgS3YP1pxH5p6b8oG3vKhA9CkkVLqGx8U3tscpuJZ4UHQWbDX/fMheC95tjvfJW
         59iPT1fcoN2LqYPWPooe6HvCgW5Kk6H35MKwq3U0NT1ctuCI5KAwznIwAUqfYbjHLbSq
         8Y/TrVmICfbjBczdxFedpsbi9n3ppiPsaeFKhWg+Bb/MmBB6p1HKIm/Ahi7+s4DXPL6i
         Vrw6OP+zEjWD6w4EySw6QLIVpLODEW5J8+zKExHjv21it/JzhHHGbAcVekD1KMxsH+QP
         u6vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=imLumfuA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f83si2286855ybg.22.2020.06.30.02.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=imLumfuA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCHq-0006gY-Ip
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBZ-0002sE-RH
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31234
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBO-0002wq-Hw
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 05:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8RoWBaFDHIWifW7sr94ccs74UGdVOjvHbolf2g5ag4=;
 b=imLumfuA5MkxwWRpBt7V/Bod8hzpPO5V+k4YtvOKYRO7WW5S/AQFWT7qGkJWkOQ7ImrR6K
 ls926ev5tXZjb5znDCZ3DeFE7IEn6Yuy/wZTVne5IolfA64j3UST4QseG2oQebLG2oADd5
 ldqdX6145rRqiKzWhGqvgvzP1MlIsSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-6IJJzEoOPTiN9xUDhoHp_Q-1; Tue, 30 Jun 2020 05:04:00 -0400
X-MC-Unique: 6IJJzEoOPTiN9xUDhoHp_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D57B5BFCC;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4468A7C1E0;
 Tue, 30 Jun 2020 09:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EB691138485; Tue, 30 Jun 2020 11:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/26] arm/{bcm2835, fsl-imx25,
 fsl-imx6}: Fix realize error API violations
Date: Tue, 30 Jun 2020 11:03:50 +0200
Message-Id: <20200630090351.1247703-26-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHRR2Q9NJsPO

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

bcm2835_peripherals_realize(), fsl_imx25_realize() and
fsl_imx6_realize() are wrong that way: they pass &err to
object_property_set_uint() and object_property_set_bool() without
checking it, and then to sysbus_realize().  Harmless, because the
former can't actually fail here.

Fix by passing &error_abort instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 12 ++++--------
 hw/arm/fsl-imx25.c           | 12 +++++-------
 hw/arm/fsl-imx6.c            | 12 +++++-------
 3 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 1e975d7eec..7ffdf62067 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -283,16 +283,12 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
      * For the exact details please refer to the Arasan documentation:
      *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf
      */
-    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version",
+                             &error_abort);
     object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                             &err);
+                             &error_abort);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
-                             &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index f32f9bce0f..7ab5c98fbe 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -260,15 +260,13 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
         };
 
         object_property_set_uint(OBJECT(&s->esdhc[i]), 2, "sd-spec-version",
-                                 &err);
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX25_ESDHC_CAPABILITIES,
-                                 "capareg", &err);
+                                 "capareg",
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), SDHCI_VENDOR_IMX,
-                                 "vendor", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+                                 "vendor",
+                                 &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index d4bc4fae93..4ae3c3efc2 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -336,15 +336,13 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
         object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
-                                 &err);
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
-                                 "capareg", &err);
+                                 "capareg",
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), SDHCI_VENDOR_IMX,
-                                 "vendor", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+                                 "vendor",
+                                 &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.26.2

