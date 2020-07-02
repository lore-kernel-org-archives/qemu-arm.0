Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1380475lfm;
        Thu, 2 Jul 2020 04:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7rkfpB4A5q1zcAH6eeoDHZCpm5a6xHEiIy5wT4NR5Bnw2QQ3lTyrbIYpHGWO9URFRiVK6
X-Received: by 2002:a05:6902:4ae:: with SMTP id r14mr1689749ybs.55.1593688838690;
        Thu, 02 Jul 2020 04:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593688838; cv=none;
        d=google.com; s=arc-20160816;
        b=ZW2orv9e4pvOzYdkyi6W55DxdH14cwvsDtgOxrv8S5DbbFQThGXWYsnvdiNJxn7SDh
         dd3xNHdYJWAROn7Aqf7uTEUKlSIKNVgbmKSv/Pmu5sjr3zg/0e4JTG4u2QkPV4NiytWu
         FS7iULCr3ya99kV3m6pWTxSLgMgqoAFmiVhKIVQf81kXMz15XoVWWtvt6tRrKin4AuQY
         m0IrMYwRfpyEQ2gHeZcA3RSwJ+OeeaAqW9PelZa1J049w9o7vk4IF9Mu8fF5H6/agWcF
         jPNAoBknp/lSkUJqNOsxyE/tpHudKOZfh04DhwZmf+3dp77XtsBAdoe74bE1Cx1l2D89
         WwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FKPSUjRRwthP4rZxyZNbMUp9PqJDx4lkfSn3R+EIYpM=;
        b=HiVZ2LYxB/WTSmkz4+6SsBU27lbvqj0of0Eb3EPWDCp9DgvLyuBQySxEG07wlkCFe1
         dhNGD9qPoLd9giRL4fGsfqXazoaxN/L8X5IOvXxsczAltYlXP4yiP/NPVSqe7H0HUTKQ
         3r7AA3l54Yc6juVddi0vP9UfrQlxSUheQcIBDZ5WSI+AoXxiECNMHu/5AFwM0k09ZyTK
         UXmnj/FQlftBZktx4x/F3upsb91GgxNnVJKV8kf4LCIO04wuBgksDySlao/CW7Toriz/
         iAsyq9tSpoVH2WaYmLgLY5ecC0BOcfiNYVczFir49wFcRlzNnRSxhxfTpuCqJxDOgB01
         gFRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y10VyYb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h185si8337764ybg.448.2020.07.02.04.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 04:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y10VyYb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqxGf-0008BY-Tt
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 07:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6I-0006wW-Gy
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58627
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx68-000118-3h
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKPSUjRRwthP4rZxyZNbMUp9PqJDx4lkfSn3R+EIYpM=;
 b=Y10VyYb8ddQ36dBHX9+OTrVNI5JpuxtA4WGLuIYPHRpcoqg6e2uf6vD79LDORWIw9gTGSA
 UO/ea8tT+yrAtKDlsGGwzmEWJH62F6MI7GnzLR6mN1vNTc+FeheQVxsX64ZVqWdqvoT+Yn
 gy2WjsIldYpKIfz2U92E3XKxP5QAjFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Rr61AxxhMmOQmmb_Y9Gf-w-1; Thu, 02 Jul 2020 07:09:41 -0400
X-MC-Unique: Rr61AxxhMmOQmmb_Y9Gf-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B373DBFC3;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3372379229;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C3751138487; Thu,  2 Jul 2020 13:09:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] arm/{bcm2835, fsl-imx25,
 fsl-imx6}: Fix realize error API violations
Date: Thu,  2 Jul 2020 13:09:30 +0200
Message-Id: <20200702110931.2953148-28-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: efW290CKxx0P

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
Message-Id: <20200630090351.1247703-26-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

