Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp738090lff;
        Wed, 16 Jun 2021 14:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhWKlk2x77/0itlT5mdT87qjX3ikKCQApgnQCWl4yY55Lxo3jdawsefhuEYWcswuFen8iS
X-Received: by 2002:a0c:f7ca:: with SMTP id f10mr2279228qvo.49.1623880287293;
        Wed, 16 Jun 2021 14:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623880287; cv=none;
        d=google.com; s=arc-20160816;
        b=PaC3JE4QBXVMFkgVBw2l+Eom3MguS+oSkBa1CIVHCJn9/En1FhcO4aDffwH/d5aS6w
         i2MoZC2zafGx8rh86nEu/MSVqHGBknVlAUnH8v4OH57cRNTCYNq6u1XGPt6mb/M0YxdU
         4wl79D+S314c+pArE8mC72Tg0JPU9Lc4+FdV42gxGWeKeKzwxLLi7OGScwvpWY01S5ad
         LKffxLGcAhX6Rb8nTnssCuDHA9UdO7Oui/aEpn5kMGoqRyV6dN7fCWSLrpTuk6EyQjSL
         pzIqnM+IHT6flrRhVuaqC3v8PBkT2LfHLyVcGW9y2aDjzYdYRWnSGYJfGzKmEtwr+IZf
         ou0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KhbMgEo2E42ngPoncw0s0RgptDO8KbfdQczk79/g87U=;
        b=bPCED4ezvXNLJfqX320vbq7aW0HB6JaGOTrz6vFJlnSE4qxseI4dDDEfL2xyaFasJb
         tzPSEeod77kmWeHdwAyAaDnZGCoaTWAJXrtaSyz2Hu0lBsbvq3fdZQx5gs9HHFI+vAbB
         BaribkRVgUc+wEne1nSUhbeGpeKSoYNE94BdIfjyT7fwTCmsDSSO7EFxr0vqYXYks0d0
         sCmrMmevSAlqT4fk+PyVkAFlOsiVjev4U2MKBzmJ8fhg4B0Nsv0LdiElsW/eE6jSduwd
         iY9QfAULw2T+rmeJPOQW/Tn9fAtgaxkKTvokfMX4MzRRpzrT6x1f9fU1Zl+gUnGvDvt9
         nyLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C4EWhVtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si3126535qtm.374.2021.06.16.14.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=C4EWhVtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltdRW-0001Pi-F5
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 17:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKg-0002zg-Qf; Wed, 16 Jun 2021 17:44:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKe-0006xI-GY; Wed, 16 Jun 2021 17:44:22 -0400
Received: by mail-wm1-x335.google.com with SMTP id c84so2047814wme.5;
 Wed, 16 Jun 2021 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KhbMgEo2E42ngPoncw0s0RgptDO8KbfdQczk79/g87U=;
 b=C4EWhVtYX/YfbYWY3L7KeCeib/55K8VlIy20ZOMslUblvUdwdsO/xulzYugN3I1gFe
 nDRwYIYOD/QboCNfEtV8K9fKOuNgE9+ydYZcdFpnYFc+CdvIRzVTWfg7Bp4HiJLZZeHU
 IrVM3EjXhsLbmlzkxAH895ed8wr0CshASuHWe7I+gI7ey3qHOpZ8b8A5LxiciN9dl+So
 Qi6yPPk0Pe7rDjGwZLx11eQzbJueWDDefDOqABuHbgJN5NCcrIKFDYOi+MM2lbivAyF/
 nFGtyUXPJnzuiHU+NV/aB8iP5nUFoGDtwEe4S7JEhR6mvh8Uc+/wjThEED7FPvfTIgSw
 TNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KhbMgEo2E42ngPoncw0s0RgptDO8KbfdQczk79/g87U=;
 b=hkTVhvt/TtW6B6Y3jbttITCrQmPlUo0HGHOjfbGHsvcXTjwCGsbvlUce4QzeniZ6jv
 E95BfdPLP49rSjSinhh6/dKwciPWBn3ywu73tmhw9vsoQ0A0uV21jLDu9ZXeKwiEQzl8
 k59fSVQwS50Z6tJTvJsMLdvTkrvpxp96HxleLR7xa/YuTu2/yP3Ukp3pC7PGKOQqkaKu
 nobTSZtvp7lyMtOMi+zVkmdPgmH6NS0oHdv1xZxFGlWVmEbcm242E1OQzFRP90tYWpTy
 TIEOKayG4CB6+luuHmU2qWkeLEO/gzB/6fdTm8tCAEwZQUAtdeYI43oL+tf5vJgUOCMB
 N8zg==
X-Gm-Message-State: AOAM5323aWBrbKJfVO0kmje2KieVhM48dusnHFbpXulhiCJujmDAncQr
 S4fpLYues/tO8pT5oqGKEto8yyVOB9mPBA==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr1136561wma.126.1623879858010; 
 Wed, 16 Jun 2021 14:44:18 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 62sm3468418wrm.1.2021.06.16.14.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:44:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/15] hw/i2c: Introduce i2c_start_recv() and
 i2c_start_send()
Date: Wed, 16 Jun 2021 23:42:54 +0200
Message-Id: <20210616214254.2647796-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: spyJE3oyldDA

To ease reviewing code using the I2C bus API, introduce the
i2c_start_recv() and i2c_start_send() helpers which don't
take the confusing 'is_recv' boolean argument.

Use these new helpers in the SMBus / AUX bus models.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h  | 24 ++++++++++++++++++++++++
 hw/i2c/core.c         | 10 ++++++++++
 hw/i2c/pm_smbus.c     |  4 ++--
 hw/i2c/smbus_master.c | 22 +++++++++++-----------
 hw/misc/auxbus.c      | 12 ++++++------
 5 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 21f2dba1bf7..5ca3b708c0b 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -88,9 +88,33 @@ int i2c_bus_busy(I2CBus *bus);
  * @address: address of the slave
  * @is_recv: indicates the transfer direction
  *
+ * When @is_recv is a known boolean constant, use the
+ * i2c_start_recv() or i2c_start_send() helper instead.
+ *
  * Returns: 0 on success, -1 on error
  */
 int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
+
+/**
+ * i2c_start_recv: start a 'receive' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_recv(I2CBus *bus, uint8_t address);
+
+/**
+ * i2c_start_send: start a 'send' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int i2c_start_send(I2CBus *bus, uint8_t address);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 69df4c0df6b..7156f55ded7 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -180,6 +180,16 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+int i2c_start_recv(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_RECV);
+}
+
+int i2c_start_send(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_SEND);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 06e1e5321b9..d7eae548cbc 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -128,14 +128,14 @@ static void smb_transaction(PMSMBus *s)
          * So at least Linux may or may not set the read bit here.
          * So just ignore the read bit for this command.
          */
-        if (i2c_start_transfer(bus, addr, 0)) {
+        if (i2c_start_send(bus, addr)) {
             goto error;
         }
         ret = i2c_send(bus, s->smb_data1);
         if (ret) {
             goto error;
         }
-        if (i2c_start_transfer(bus, addr, 1)) {
+        if (i2c_start_recv(bus, addr)) {
             goto error;
         }
         s->in_i2c_block_read = true;
diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
index dc43b8637d1..6a53c34e70b 100644
--- a/hw/i2c/smbus_master.c
+++ b/hw/i2c/smbus_master.c
@@ -29,7 +29,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
 {
     uint8_t data;
 
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         return -1;
     }
     data = i2c_recv(bus);
@@ -40,7 +40,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
 
 int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, data);
@@ -51,11 +51,11 @@ int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
 int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
 {
     uint8_t data;
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         i2c_end_transfer(bus);
         return -1;
     }
@@ -67,7 +67,7 @@ int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
 
 int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
@@ -79,11 +79,11 @@ int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
 int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
 {
     uint16_t data;
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         i2c_end_transfer(bus);
         return -1;
     }
@@ -96,7 +96,7 @@ int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
 
 int smbus_write_word(I2CBus *bus, uint8_t addr, uint8_t command, uint16_t data)
 {
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
@@ -113,12 +113,12 @@ int smbus_read_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
     int i;
 
     if (send_cmd) {
-        if (i2c_start_transfer(bus, addr, 0)) {
+        if (i2c_start_send(bus, addr)) {
             return -1;
         }
         i2c_send(bus, command);
     }
-    if (i2c_start_transfer(bus, addr, 1)) {
+    if (i2c_start_recv(bus, addr)) {
         if (send_cmd) {
             i2c_end_transfer(bus);
         }
@@ -149,7 +149,7 @@ int smbus_write_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
         len = 32;
     }
 
-    if (i2c_start_transfer(bus, addr, 0)) {
+    if (i2c_start_send(bus, addr)) {
         return -1;
     }
     i2c_send(bus, command);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 44aa9730bc9..434ff8d910d 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -135,7 +135,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, true)) {
+        if (i2c_start_recv(i2c_bus, address)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -151,7 +151,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, false)) {
+        if (i2c_start_send(i2c_bus, address)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, false)) {
+            if (i2c_start_send(i2c_bus, address)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -188,7 +188,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, false)) {
+            if (i2c_start_send(i2c_bus, address)) {
                 break;
             }
         }
@@ -210,7 +210,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, true)) {
+            if (i2c_start_recv(i2c_bus, address)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -219,7 +219,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, true)) {
+            if (i2c_start_recv(i2c_bus, address)) {
                 break;
             }
         }
-- 
2.31.1

