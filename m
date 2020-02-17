Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4992427lfp;
        Mon, 17 Feb 2020 03:52:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqw09KwUefdJP8k4OCK5JU9aDf8sFWNpwtgllqttMTNeXzVXjSGnS7FwyjPcbWHj8HOWr4Vf
X-Received: by 2002:a0c:b920:: with SMTP id u32mr11676621qvf.173.1581940320132;
        Mon, 17 Feb 2020 03:52:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940320; cv=none;
        d=google.com; s=arc-20160816;
        b=WpU5lGI7X0HDL49/cfySJ6TMBNgP1U6aEvOTD4FTvj7h9QlLjeKNZNIcuemAUUGy8Q
         P8CeJPhYqMaWnC/JuY4I49+4XKf5RZkGEJbk3yshWSy5aav9hBzhx4bnUH1OU0CkABdz
         N7hJYxzRvnPafpaS+XU7kN7u+Egw8mRTRLaN5S8KxYjMlAU+59TM5OwtDid1lGhvRfER
         8fBfuyw5T3dPv/B3q3uFXRNYDdMpM+hJZjoksi065zulv3iYneSBgT7Czu5M2aLLmOuB
         5WhcTJNcbBOVsSR3YaPkhsTkNoZEavS+/EWuzUHA1Gg/XCU3He/99VSE1iKcOa0rO8vP
         bviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
        b=DifE15sVXT+9Gnd7iAhQJyD1ihNipw8G+W61cwpAOmipzitLAQdkxZCAX4pd2aq+qI
         vf5L+EDuI2oXoUKC443J291tlCIx/ZwWXWkwP6496CIAO6nP2+IhBjqoh85EbPhQwb5/
         wQp3MppMWKiIRXjajr87l7vllPuF6NY4BgOyVzy3gONX3dt3NthRgB0x88R+szK7Tov5
         rdYr5UlvOH6zVEysSOn7tUG+unIoa1td29nN3XHe1Kbno24Qgwn4Glq9Og9tlj0bJIXS
         8MKLQ9nlI4RBh6PrC67Zi9H1sptr6JbVb5eehjjpCcOERHm4E1gkwd9vUnB7q1REtryb
         1anw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QQLSRNBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si166239qvo.91.2020.02.17.03.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:52:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QQLSRNBa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3ewR-0006w7-Ik
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqP-0006aS-QM
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqO-0002RT-Qj
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:45 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35865)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqO-0002Qy-Jt; Mon, 17 Feb 2020 06:45:44 -0500
Received: by mail-wr1-x442.google.com with SMTP id z3so19378521wru.3;
 Mon, 17 Feb 2020 03:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
 b=QQLSRNBaRAbOPnzZTq2kaydk6Q7gCayLTtsryRjJKNprdH6mGkp5syAr+WkKiCdj4a
 hcjUXLMjwCR7J+TKLoFZtZFYMomQFVX20za4c7Ty87vR/nMnsfCyA68JBmQTWacZtS3v
 hwZOGH1V8QqauiyDXodPyED+wyc+14N6XRIbrVDPNVuf8Hyp8H5sbTb2YWEEoapT/Vm0
 Ow1HN/GN0fWdtagKdMWTYfXl7Rg9/E6BBjWCqexffmtS261uuKUAZwXfmLPjeyrD7f0O
 MYOVy7q6lBy5lfLNrd6AJNkf4shWuJVSsgpDKtsN+Cmn4RLS3UvGQ7+KtQ10mDFWiNfS
 tREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OGYngzYgREXVWzhCGP1KWkhVF6aFvpDG4pbFEluMwuQ=;
 b=p6AaJOrqv0FfsqIQ8Eeo+V84qibI+hsHADc8eQtDHw6CicNmV86x3z7OCfdN4ASaUD
 zJJ8DcpXsgmvyzGxley9q5u1sHDRCVdvMqf+n0tHhSJnzUuCrBbU0Ti6LiReeVknLJI+
 qawDYpJS1CqA5et/Q5MxArN3tOiyYZoFJftZIXKynKTW3EUUbII1ZA2bJWkiV/Lz8C46
 cTMwBfhVu3HNZ4qQn9226ImJZDWle5GvK7qFtBFT6/EcjHMHPQcBqh3kcDvpNmZPvGom
 HK60eQx/Iab01C31FDQ4LvDDcdy3fjfAONXkRsBjkc+e5mtRjycwy4O5PyYfynNshLUQ
 0xew==
X-Gm-Message-State: APjAAAWfXfdunK0uCTbVyANX+DlUQjBBWvcHbp7G5L9ojNh/KoN3GTvj
 E0I3CMQ9f1bQdv5K8OdurXrPYKoz6E0=
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr20501096wrv.291.1581939943462; 
 Mon, 17 Feb 2020 03:45:43 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] hw/arm/bcm2836: Restrict BCM283XClass declaration to
 C source
Date: Mon, 17 Feb 2020 12:45:26 +0100
Message-Id: <20200217114533.17779-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q56CiaMa7r2X

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

