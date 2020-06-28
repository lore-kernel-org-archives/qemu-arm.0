Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2194317lfm;
        Sun, 28 Jun 2020 07:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQiV1NvoP0x6SR+3cwCbtZKiMtIWoNgbjEkZU7hXASfOl42PX2t4LS6Latr1590hnfnNqu
X-Received: by 2002:a25:d786:: with SMTP id o128mr19550130ybg.244.1593354560127;
        Sun, 28 Jun 2020 07:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354560; cv=none;
        d=google.com; s=arc-20160816;
        b=A0JXLicgCeV+wMrlxzUNLYOM26xbkFa42QsNwJ6q4Bq/jnWbYUWXOrXAtFG9cYWr8Y
         w7HlDo0j4pHYBotm8+zG0+xNGkaVXlExrUJstcUHA5Zk52nBbE3UxbJF0WiQAvOLD93Y
         JB1x7zFDysZK/U2Em7CxepsFAtggatBSK8sS5EkyWb/U/7ibYBeB50MK7el5Lvq9r4OI
         3QG2LA2cf9W/x0Xa/y9zlqkWiy/7jKBJ9ynzNN2rFPUoby6IGE6PJIrWTtaU2TXQvgbO
         brqX/L7GM0Gnb0DToaXvSJAuq7VDtdBLxcgTl8GgH/8At2ER72XNmRX7TEcxY6wHWmbF
         ei3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WciP4YXlhY7aEQRA6uEhlFST0m8DbBOd0N16ZxZywy0=;
        b=UbCTag1Hhp51uyIrDv0eRZi2C/UW8B8eE4+n1gu2KiMz0gT/wKejN4NXQuCeCc+8NZ
         Nd0Z9S8HkaS/i7QtVRHHU7XwoeVrbJxyYaOn+F5bC109VeU7nXHWSLGA4Fz0vbVUj+dk
         PFruJP+RiR4pZX/d2CdKIAZXYee5pvzg7n4Rybsc1j/oNhdyj1/N+4pzSrNsiX+f4kKD
         r8DUa5ieUJPnyItKrRup3t2NtBqiyozyOEWzV3NBqiHA9KrA+wIOXhSmrFGMBdNrtJtS
         bbD0ssUjXTbTsrkA/ieneXAQsU7Vc7A5OJ5iyP+747rxmIFZmRzvxycnBytEsmhZSGbL
         2i7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qsX2bKMn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si9398183ybk.162.2020.06.28.07.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qsX2bKMn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYJ5-0005cX-Ar
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEi-0006Ml-JI
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:48 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEg-0004ky-QO
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:48 -0400
Received: by mail-wr1-x442.google.com with SMTP id q5so14033590wru.6
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WciP4YXlhY7aEQRA6uEhlFST0m8DbBOd0N16ZxZywy0=;
 b=qsX2bKMnpLve06lR58bgTLDJytLYlquUENBB/WyIQFk0/vq2SJcL23Nh/wzlQ+7TTe
 bc0E5KeQN9kobP5RB66aNbxfyqOj2rq8mp38GmKdkvB5ZjZK+pVP+cY/2CjkPH23h3qQ
 NV6as9G3uaQEDGOZ1JHxufjJHqFk0Ae+dgcoVrKI60VHouK3hiYr8x7wJ2UJZQPw4zud
 gQV2Pt02JTSlmKYWXwQMdij2cyPyn9vDR3vlr1fHY4VcHLyoVFJ3bFkcN8MTajSHFQt5
 sFY25bwudg9G0PRiqvLDZiTU5vOxw4VgWkw+i1YPzFNSs4oRom9L20sh8+bRG9nIfh5E
 zAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WciP4YXlhY7aEQRA6uEhlFST0m8DbBOd0N16ZxZywy0=;
 b=R1UQoLDeuJHsN2FPnnmRUg2NOA1Fn1MjZb+JlKseNwuPtMCRVfZt/qE1XOcX5Ul9/Q
 r8hmYVeASbCXLYh/rcW+JLuWVotttmdoKTIdWAHwNP1zh/7Im2OWuig1pDzP9g/OK0GD
 4Gzw4v6vu/aLUH0OE17e5G0DuLZpRZPx12WX5/F1z9WCVGwpVZcz4kIFw7TjCFGHiN75
 9BOhRuV3sytl7WcXwRxUpvYPC/jyIt2Og3KiFBP8CED/4zcwv6tLRaFDcsCZAAMPz84x
 lcghTxFJIxtm9sB66zMUkMH1bon8+RlKxk/O7Lk620Ex5UO9u93WWwWrBbz63gVGRt9X
 7Jxw==
X-Gm-Message-State: AOAM533UkqXCrOwdCY52tgxOCbggiXqhs/9K24IIOQgvr9oVTVeRnmOT
 IDScCXteydTzkFb1DcgwC0bAS8BozDK65A==
X-Received: by 2002:adf:e948:: with SMTP id m8mr13408174wrn.398.1593354285227; 
 Sun, 28 Jun 2020 07:24:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/17] hw/misc/max111x: Create header file for documentation,
 TYPE_ macros
Date: Sun, 28 Jun 2020 15:24:23 +0100
Message-Id: <20200628142429.17111-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8KNi6nSEr4/

Create a header file for the hw/misc/max111x device, in the
usual modern style for QOM devices:
 * definition of the TYPE_ constants and macros
 * definition of the device's state struct so that it can
   be embedded in other structs if desired
 * documentation of the interface

This allows us to use TYPE_MAX_1111 in the spitz.c code rather
than the string "max1111".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
To be honest the main driver here is that I wanted a header
file to put the documentation comment in :-)
---
 include/hw/misc/max111x.h | 57 +++++++++++++++++++++++++++++++++++++++
 hw/arm/spitz.c            |  3 ++-
 hw/misc/max111x.c         | 25 +----------------
 MAINTAINERS               |  1 +
 4 files changed, 61 insertions(+), 25 deletions(-)
 create mode 100644 include/hw/misc/max111x.h

diff --git a/include/hw/misc/max111x.h b/include/hw/misc/max111x.h
new file mode 100644
index 00000000000..337ba63d588
--- /dev/null
+++ b/include/hw/misc/max111x.h
@@ -0,0 +1,57 @@
+/*
+ * Maxim MAX1110/1111 ADC chip emulation.
+ *
+ * Copyright (c) 2006 Openedhand Ltd.
+ * Written by Andrzej Zaborowski <balrog@zabor.org>
+ *
+ * This code is licensed under the GNU GPLv2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef HW_MISC_MAX111X_H
+#define HW_MISC_MAX111X_H
+
+#include "hw/ssi/ssi.h"
+#include "hw/irq.h"
+
+/*
+ * This is a model of the Maxim MAX1110/1111 ADC chip, which for QEMU
+ * is an SSI slave device. It has either 4 (max1110) or 8 (max1111)
+ * 8-bit ADC channels.
+ *
+ * QEMU interface:
+ *  + GPIO inputs 0..3 (for max1110) or 0..7 (for max1111): set the value
+ *    of each ADC input, as an unsigned 8-bit value
+ *  + GPIO output 0: interrupt line
+ *  + Properties "input0" to "input3" (max1110) or "input0" to "input7"
+ *    (max1111): initial reset values for ADC inputs.
+ *
+ * Known bugs:
+ *  + the interrupt line is not correctly implemented, and will never
+ *    be lowered once it has been asserted.
+ */
+typedef struct {
+    SSISlave parent_obj;
+
+    qemu_irq interrupt;
+    /* Values of inputs at system reset (settable by QOM property) */
+    uint8_t reset_input[8];
+
+    uint8_t tb1, rb2, rb3;
+    int cycle;
+
+    uint8_t input[8];
+    int inputs, com;
+} MAX111xState;
+
+#define TYPE_MAX_111X "max111x"
+
+#define MAX_111X(obj) \
+    OBJECT_CHECK(MAX111xState, (obj), TYPE_MAX_111X)
+
+#define TYPE_MAX_1110 "max1110"
+#define TYPE_MAX_1111 "max1111"
+
+#endif
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index fa592aad6d6..1400a56729d 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -29,6 +29,7 @@
 #include "audio/audio.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
+#include "hw/misc/max111x.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
@@ -732,7 +733,7 @@ static void spitz_ssp_attach(SpitzMachineState *sms)
                           qdev_get_gpio_in(sms->mpu->gpio, SPITZ_GPIO_TP_INT));
 
     bus = qdev_get_child_bus(sms->mux, "ssi2");
-    sms->max1111 = qdev_new("max1111");
+    sms->max1111 = qdev_new(TYPE_MAX_1111);
     max1111 = sms->max1111;
     qdev_prop_set_uint8(sms->max1111, "input1" /* BATT_VOLT */,
                         SPITZ_BATTERY_VOLT);
diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index 3a5cb838445..d41cfd92a8d 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -11,34 +11,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/ssi/ssi.h"
+#include "hw/misc/max111x.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
 
-typedef struct {
-    SSISlave parent_obj;
-
-    qemu_irq interrupt;
-    /* Values of inputs at system reset (settable by QOM property) */
-    uint8_t reset_input[8];
-
-    uint8_t tb1, rb2, rb3;
-    int cycle;
-
-    uint8_t input[8];
-    int inputs, com;
-} MAX111xState;
-
-#define TYPE_MAX_111X "max111x"
-
-#define MAX_111X(obj) \
-    OBJECT_CHECK(MAX111xState, (obj), TYPE_MAX_111X)
-
-#define TYPE_MAX_1110 "max1110"
-#define TYPE_MAX_1111 "max1111"
-
 /* Control-byte bitfields */
 #define CB_PD0		(1 << 0)
 #define CB_PD1		(1 << 1)
diff --git a/MAINTAINERS b/MAINTAINERS
index 1b40446c739..550844d1514 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -787,6 +787,7 @@ F: hw/gpio/max7310.c
 F: hw/gpio/zaurus.c
 F: hw/misc/mst_fpga.c
 F: hw/misc/max111x.c
+F: include/hw/misc/max111x.h
 F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 F: include/hw/display/tc6393xb.h
-- 
2.20.1

