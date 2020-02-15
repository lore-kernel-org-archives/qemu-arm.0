Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3354819lfp;
        Sat, 15 Feb 2020 11:18:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrofjLkBfGH5qVlBBIKbMjHbFFDqstY+1m/Nqi8+XUszniH8SrGOoigRV4+q++ee0Zpled
X-Received: by 2002:a37:e208:: with SMTP id g8mr8592221qki.229.1581794313039;
        Sat, 15 Feb 2020 11:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794313; cv=none;
        d=google.com; s=arc-20160816;
        b=m8ltbBtndh2WM9foOuEMCkaH3RACPF/cRc4FlnDWMl27GoitrfSjke5/+5ww+2WMBy
         LlMcLO5wmPtJy4B5GnXxeewH7Ujr6p4cFb6CfMJRgnfgemIly7BEz9tGSJcxAwc7IpVs
         oFdzzyFPYL8t7NqAIksAlS4JrW/0Qm93f9hLN6sgwqlhWJme658DKWtoRdkULSzbvaM2
         4p4cDoiKNIroMbrqSblpM0SzYbo2xdelebgtIej1KYIec4vGdXFVL1Ogg3IcVqKXjjl6
         9AEf4kL97SgOLf7a4Jdf53e4hudeCM8MQP0nM2B4rQiSsy64etxPHc85njJhiIQR4ogZ
         Nlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
        b=JMEngpWbZGuHyBYBS8UkQaq/GwV4jOG14r6m652XVKHNCDp8yy1yjCOt/f/5NVUilP
         YVOE4LIFYJhdKrvI7XuHB188UaweS9Kov7ZeBIoQTvHjoK8ilQYHrSn2sN5nNzgUcDDL
         o1w2FwyRh1XoZb46unKGdAy2xkvxR52je2pF4Cn+RQTSPEv8885iFekts2e6Q2pI1p2G
         7sUX350zH0xEGTCIVzFy423suY8Hxpj8seZcf6gvB/v0QZbzwkGzzWGwuijeDB8XZPz6
         zKqIaWgTtmR4ol4Rfm/U3GhaAcg5oBD2SZiINKoyHuRzqUO5O50qjbImrwnM4iC2ej/q
         rjKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BSwQdtms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si4338455qvy.146.2020.02.15.11.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:18:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BSwQdtms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32xU-0004YY-Dm
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32ux-0008Mv-Nc
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32uw-0004HE-Lz
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:55 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32uw-0004Gn-Eg; Sat, 15 Feb 2020 14:15:54 -0500
Received: by mail-wm1-x341.google.com with SMTP id a6so14372084wme.2;
 Sat, 15 Feb 2020 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
 b=BSwQdtmsMyoVXmvvjYpnuCj5l/+40G0pK0HDakhwOrTkgbAPecdCCtKo2NfHTs6I9F
 OPmrbI6auTNEuV4/xI8u/zmpZEFVfRrDE9xdGkV0W3uxXcprOR7QI4CeDonyKb4rEEpt
 YzL6ar89nfytbxiTnj+kGoCwa7hgP3wnfLgDHCHGSzgItmQaLOHSdjxzih6Wz8Xxyv/k
 hvLqY3dA8CD5d+VB/29reb6rOHNFQdVG0UWSKjz7ED0UbngWSeysOy7YUQLXPBOCkg48
 TI0ZnitQCtH42k3SUe58Mxezw+WHqxTxasYVW81oOVft0BooCkEZrDP0IjEVlaOISy0d
 3oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
 b=ZIWc0NSrq0YXZ7D7CRTnXOFIYlqnkWGOltulqLWnPlNeMsv404jIYePk9cLTtRbuWH
 mkC6AHpPcgzPPHk6pboOiE29Qu6lRLik5E3I4ae9drgsqGbdCFxaqgu+FdkiwlaZwTnC
 4n6kcm8oGUAUZVzehg4wX/Gmbk5oXYV09e9DC/1Y2h+xXW/yO+4DwLTsiJPJRfPIRUVe
 wIbjjDu8AkHOq851URqRhJpyyHZ9ZlHhF0E5ssZlhai0DWlb/JRB50vUkjXPS/EtIz3m
 vlvaCXvHDbCTtkuug0iV8vdkvrtQKGgock9BIJWXl11tdKzqz5GZHDj5NO3LAlKypYQc
 9/nQ==
X-Gm-Message-State: APjAAAVIvNx2uEiBeuvpZXuFPsSVnBbzdd2SmOeoKHhNl2ASywYF7JYX
 bn+/jcYWbQva9Te09OylTY70lkwoTdU=
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr11699582wmj.96.1581794153317; 
 Sat, 15 Feb 2020 11:15:53 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] hw/arm/bcm2836: Restrict BCM283XClass declaration to C
 source
Date: Sat, 15 Feb 2020 20:15:36 +0100
Message-Id: <20200215191543.3235-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-TUID: 4lrCVWLhIQTy

No code out of bcm2836.c uses (or requires) this declarations.
Move it locally to the C source file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/bcm2836.h | 12 ------------
 hw/arm/bcm2836.c         | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 92a6544816..acc75bf553 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -42,16 +42,4 @@ typedef struct BCM283XState {
     BCM2835PeripheralState peripherals;
 } BCM283XState;
 
-typedef struct BCM283XInfo BCM283XInfo;
-
-typedef struct BCM283XClass {
-    DeviceClass parent_class;
-    const BCM283XInfo *info;
-} BCM283XClass;
-
-#define BCM283X_CLASS(klass) \
-    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
-#define BCM283X_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
-
 #endif /* BCM2836_H */
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 38e2941bab..24109fef1d 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,6 +16,15 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
+typedef struct BCM283XInfo BCM283XInfo;
+
+typedef struct BCM283XClass {
+    /*< private >*/
+    DeviceClass parent_class;
+    /*< public >*/
+    const BCM283XInfo *info;
+} BCM283XClass;
+
 struct BCM283XInfo {
     const char *name;
     const char *cpu_type;
@@ -24,6 +33,11 @@ struct BCM283XInfo {
     int clusterid;
 };
 
+#define BCM283X_CLASS(klass) \
+    OBJECT_CLASS_CHECK(BCM283XClass, (klass), TYPE_BCM283X)
+#define BCM283X_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
+
 static const BCM283XInfo bcm283x_socs[] = {
     {
         .name = TYPE_BCM2836,
-- 
2.21.1

