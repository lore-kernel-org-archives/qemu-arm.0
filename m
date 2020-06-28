Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2196182lfm;
        Sun, 28 Jun 2020 07:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaVt5YgW8Tud5GCXxWDHPXMu/DPwRjmalIhnJCGSiHf7KOP/dichmop9/wgSXrjTWPThkd
X-Received: by 2002:a25:e087:: with SMTP id x129mr19025260ybg.73.1593354723035;
        Sun, 28 Jun 2020 07:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354723; cv=none;
        d=google.com; s=arc-20160816;
        b=mO4zmFYGvZ9cZgr4jhAsPc0mpQigkMlQ4QoctktiIIXgGaPgyURrQ00N1KKMNFO0AN
         kGuVJsnxCvKc2Uum+Oa8QnPvATpoj8tiuWchRBLUd3bGCIafRbNPui/Kt9cDdhQYsWsZ
         5xsb9ImeDZKNUpDYzwLCz7fgRTiT1wPuVM3LQ2n9qhC4vQVbu2K8L5Bn15BGWJldVpzm
         R8RLefuMGjgABI+m25XB2/sEUPzTYDnfdRbtfmgw6fm7iXA7IUKhh1RjhtvmVGjjlcEl
         dK8UVqHrX8Y5vTYDQyIeyUdhDZ9FxEPi0lzuv4569O9JRbGz53+jX6fzADQG/7lDJNpo
         WyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PpVXQd412XMkJh1QeNoqsNlD9XCB50I4FpVy/sO+nw8=;
        b=r4s39GIraQbQJcyJtltCBSAj7Tozv925TtEtzxvZZYXCx0FQhOgD9MDSnSrks0Z7rh
         6py07NDVV04bWSqVUiG6hk1HYArv1a5kd44EoOeWm6nNypMRp70Fla/AAqdIODNsN+Ik
         +zpPDBfZ9Fn3jVnR6x3CgSmCYsLzuXHKFg1777DiPBy91J8W5oVjpuV/SqfFx02orITv
         JimYjltai0mjXC0N0EEw8VoJaBMMizwtalZVPY1/6dxygLEWjGpK827u/CtWjCSWFE1Y
         gS4VriEIvFlSOLR9GAi0n0KGj7gaUixniNQGJEm3Q3tcQlXQ255UTGuNxCsD/SpkGpjd
         r9dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PVimSI+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63si5748070yba.164.2020.06.28.07.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PVimSI+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYLi-0001Z3-D5
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEq-0006jp-S3
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:56 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEn-0004nW-Vt
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:56 -0400
Received: by mail-wm1-x343.google.com with SMTP id a6so12019170wmm.0
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpVXQd412XMkJh1QeNoqsNlD9XCB50I4FpVy/sO+nw8=;
 b=PVimSI+V6NHxsMVKvZ16PbRoMTrDaQkdmJb+90akfB+IzTZPgivHKxUy42q4PyWbWh
 /pju7SYN/napeBkdvA/vA+f76jd0+bWHlw26pyf7BQcN2EtGoMgvL5LXrqlDbP1v6GU8
 9y5JMBU4xQtYw/P1iYYXVMSJmKIhP/fqUWxqROwfv8dN0WO1uWq9CLFDz1o4HZMXUDGG
 CBhpD1/uSREmXLHcFxd9x8Ddb9VZznbB+tLbXrWXG/XJCTSqVJDU1s+x78nnaG+SWYR8
 Y7gD0iFQZ02TuefNp+9imqcPt8BJyPHludlTlhlDJUI2bNH2y6jIHpvsSUdBeimpS4OH
 x7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpVXQd412XMkJh1QeNoqsNlD9XCB50I4FpVy/sO+nw8=;
 b=HPQvNro6JiHA6+GlhxSMyQLso1wO4SZ1nZczBWVKJwA5JJN1lReh1Ih+vJlJqxBRpe
 VC+XkeP3Ez82/R71aLVpwgrYATFnmGQel4YCtRAfCX9fjbVE08ac+UTCjZRyWEqwmRHV
 YyGz41P3c8WGKP39Kz9upqCpv3w7Vq4nlnGuXm656pSQC7tfVSTb9Yq7A2IQtyS0OdmB
 YT+DzU/D5/XcGy63sMInH3uSsjd6T88YYAYXpYqN0a0k76M5lmHYG9kBCs4yzs2tEzyK
 nW5sZ30aqL4VCSy6y58u9oXIuWC8/wf6tlvEmdFtSZz2Je7ev9PAsBFUCCJvvlVmdOkH
 lesw==
X-Gm-Message-State: AOAM5335g6FTrulc9CVkABU4Mc62UZH9WR4zkLsQUHB4fEFsJYd2XnxE
 of782t1HJwaHbBZzbN5Kcf9ssFB05mKvkQ==
X-Received: by 2002:a1c:2906:: with SMTP id p6mr11101557wmp.68.1593354292332; 
 Sun, 28 Jun 2020 07:24:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/17] Replace uses of FROM_SSI_SLAVE() macro with QOM casts
Date: Sun, 28 Jun 2020 15:24:29 +0100
Message-Id: <20200628142429.17111-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
X-TUID: pOf7BxnKzrsY

The FROM_SSI_SLAVE() macro predates QOM and is used as a typesafe way
to cast from an SSISlave* to the instance struct of a subtype of
TYPE_SSI_SLAVE.  Switch to using the QOM cast macros instead, which
have the same effect (by writing the QOM macros if the types were
previously missing them.)

(The FROM_SSI_SLAVE() macro allows the SSISlave member of the
subtype's struct to be anywhere as long as it is named "ssidev",
whereas a QOM cast macro insists that it is the first thing in the
subtype's struct.  This is true for all the types we convert here.)

This removes all the uses of FROM_SSI_SLAVE() so we can delete the
definition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ssi/ssi.h |  2 --
 hw/arm/z2.c          | 11 +++++++----
 hw/display/ads7846.c |  9 ++++++---
 hw/display/ssd0323.c | 10 +++++++---
 hw/sd/ssi-sd.c       |  4 ++--
 5 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 5fd411f2e4e..eac168aa1db 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -66,8 +66,6 @@ struct SSISlave {
     bool cs;
 };
 
-#define FROM_SSI_SLAVE(type, dev) DO_UPCAST(type, ssidev, dev)
-
 extern const VMStateDescription vmstate_ssi_slave;
 
 #define VMSTATE_SSI_SLAVE(_field, _state) {                          \
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index a0f40959904..e1f22f58681 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -111,9 +111,12 @@ typedef struct {
     int pos;
 } ZipitLCD;
 
+#define TYPE_ZIPIT_LCD "zipit-lcd"
+#define ZIPIT_LCD(obj) OBJECT_CHECK(ZipitLCD, (obj), TYPE_ZIPIT_LCD)
+
 static uint32_t zipit_lcd_transfer(SSISlave *dev, uint32_t value)
 {
-    ZipitLCD *z = FROM_SSI_SLAVE(ZipitLCD, dev);
+    ZipitLCD *z = ZIPIT_LCD(dev);
     uint16_t val;
     if (z->selected) {
         z->buf[z->pos] = value & 0xff;
@@ -153,7 +156,7 @@ static void z2_lcd_cs(void *opaque, int line, int level)
 
 static void zipit_lcd_realize(SSISlave *dev, Error **errp)
 {
-    ZipitLCD *z = FROM_SSI_SLAVE(ZipitLCD, dev);
+    ZipitLCD *z = ZIPIT_LCD(dev);
     z->selected = 0;
     z->enabled = 0;
     z->pos = 0;
@@ -185,7 +188,7 @@ static void zipit_lcd_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo zipit_lcd_info = {
-    .name          = "zipit-lcd",
+    .name          = TYPE_ZIPIT_LCD,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(ZipitLCD),
     .class_init    = zipit_lcd_class_init,
@@ -325,7 +328,7 @@ static void z2_init(MachineState *machine)
 
     type_register_static(&zipit_lcd_info);
     type_register_static(&aer915_info);
-    z2_lcd = ssi_create_slave(mpu->ssp[1], "zipit-lcd");
+    z2_lcd = ssi_create_slave(mpu->ssp[1], TYPE_ZIPIT_LCD);
     bus = pxa2xx_i2c_bus(mpu->i2c[0]);
     i2c_create_slave(bus, TYPE_AER915, 0x55);
     wm = i2c_create_slave(bus, TYPE_WM8750, 0x1b);
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 9228b40b1af..56bf82fe079 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -29,6 +29,9 @@ typedef struct {
     int output;
 } ADS7846State;
 
+#define TYPE_ADS7846 "ads7846"
+#define ADS7846(obj) OBJECT_CHECK(ADS7846State, (obj), TYPE_ADS7846)
+
 /* Control-byte bitfields */
 #define CB_PD0		(1 << 0)
 #define CB_PD1		(1 << 1)
@@ -61,7 +64,7 @@ static void ads7846_int_update(ADS7846State *s)
 
 static uint32_t ads7846_transfer(SSISlave *dev, uint32_t value)
 {
-    ADS7846State *s = FROM_SSI_SLAVE(ADS7846State, dev);
+    ADS7846State *s = ADS7846(dev);
 
     switch (s->cycle ++) {
     case 0:
@@ -139,7 +142,7 @@ static const VMStateDescription vmstate_ads7846 = {
 static void ads7846_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev = DEVICE(d);
-    ADS7846State *s = FROM_SSI_SLAVE(ADS7846State, d);
+    ADS7846State *s = ADS7846(d);
 
     qdev_init_gpio_out(dev, &s->interrupt, 1);
 
@@ -166,7 +169,7 @@ static void ads7846_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ads7846_info = {
-    .name          = "ads7846",
+    .name          = TYPE_ADS7846,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(ADS7846State),
     .class_init    = ads7846_class_init,
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index c3bdb18742c..32d27f008ae 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -66,9 +66,13 @@ typedef struct {
     uint8_t framebuffer[128 * 80 / 2];
 } ssd0323_state;
 
+#define TYPE_SSD0323 "ssd0323"
+#define SSD0323(obj) OBJECT_CHECK(ssd0323_state, (obj), TYPE_SSD0323)
+
+
 static uint32_t ssd0323_transfer(SSISlave *dev, uint32_t data)
 {
-    ssd0323_state *s = FROM_SSI_SLAVE(ssd0323_state, dev);
+    ssd0323_state *s = SSD0323(dev);
 
     switch (s->mode) {
     case SSD0323_DATA:
@@ -346,7 +350,7 @@ static const GraphicHwOps ssd0323_ops = {
 static void ssd0323_realize(SSISlave *d, Error **errp)
 {
     DeviceState *dev = DEVICE(d);
-    ssd0323_state *s = FROM_SSI_SLAVE(ssd0323_state, d);
+    ssd0323_state *s = SSD0323(d);
 
     s->col_end = 63;
     s->row_end = 79;
@@ -368,7 +372,7 @@ static void ssd0323_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo ssd0323_info = {
-    .name          = "ssd0323",
+    .name          = TYPE_SSD0323,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(ssd0323_state),
     .class_init    = ssd0323_class_init,
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 25cec2ddeaa..25cdf4c966d 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -74,7 +74,7 @@ typedef struct {
 
 static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
 {
-    ssi_sd_state *s = FROM_SSI_SLAVE(ssi_sd_state, dev);
+    ssi_sd_state *s = SSI_SD(dev);
 
     /* Special case: allow CMD12 (STOP TRANSMISSION) while reading data.  */
     if (s->mode == SSI_SD_DATA_READ && val == 0x4d) {
@@ -241,7 +241,7 @@ static const VMStateDescription vmstate_ssi_sd = {
 
 static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
-    ssi_sd_state *s = FROM_SSI_SLAVE(ssi_sd_state, d);
+    ssi_sd_state *s = SSI_SD(d);
     DeviceState *carddev;
     DriveInfo *dinfo;
     Error *err = NULL;
-- 
2.20.1

