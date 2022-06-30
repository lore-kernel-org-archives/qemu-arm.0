Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp269190lft;
        Thu, 30 Jun 2022 04:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3RiSVIhC4gBqdvSK7rEbXUOGkISfNJGD8eCPVWT92m2MNep4s3CfY/jpMEQSSdJVMatH0
X-Received: by 2002:a05:622a:5985:b0:31b:899:3093 with SMTP id gb5-20020a05622a598500b0031b08993093mr7054508qtb.616.1656589810826;
        Thu, 30 Jun 2022 04:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656589810; cv=none;
        d=google.com; s=arc-20160816;
        b=n5XCXNUakAxpis7ZwCKvIj8/7ENPpPfZbn1nNmkPlaDQzp1x0Wqo2Ri12ZIcrzNEvC
         BkxUHlOKg8zesxu5SGT6Uqqr7oFB9Gd9DogdP9008nTa6cEL7PXriq/T5c2r1gO8IJE5
         S4tZ8FFRKcYLXmAz5qwIK6eD7XdGuGb6Tne7c9jNfuWF4yb6bpMsQivzh3+iV1VW9bn+
         Aq+w+iURgViY+S8RH9JzxNqQdhf0IISLooYDr74/pM3fSr6ZaFbfEHxxVzvNPsmXNLyS
         O5L6ltcdF5qiLIAQZb8Cv2P1WsZwZW+1CfB8N30VPkAypwMjyxchTQMgyLctbZHb07vN
         3shA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Nq1JhOirlOewFtVDnsuHxbYokQOtEvJ0bj9JrLAd068=;
        b=Cfb3qt/+A8Y/iFGmh/DuvXzroEjpAzMOszt2vr7tNv4sE1sM+mp/vvSaeoJXP99dtu
         I5SxAtINHa2V4THr42HZot7gAduriANuRb9p3QgUTh8eFP5acw/QRm0rvyzX1p+QRrIB
         l+/QRQFo43LU+B2qOEhe/1tSIk59eHtbzSbdbjVnxlcJWvPWDPswsBiJMqiIm8ydnrfJ
         ZZ/Vc/xxfKw6yoMEO+mZsqMwhYRaeoGW08zarnIfYy7CZRxQGSlY7CxtlJPC/Gv4G+lp
         Wfky//kHhSQBpXZTQc/775RLSckCeWfdCtFzWhMUvtpZPBoP7Qh7LY0Gjfz8utgtC877
         Ct4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm6-20020ad45ec6000000b00464646e6435si11691686qvb.166.2022.06.30.04.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sgU-0005CL-9z
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIt-00015B-Ji; Thu, 30 Jun 2022 07:25:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIr-0002X4-CI; Thu, 30 Jun 2022 07:25:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbk6ZC9z4xXD;
 Thu, 30 Jun 2022 21:25:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbh6JdPz4xD5;
 Thu, 30 Jun 2022 21:25:20 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 24/27] hw/i2c: add asynchronous send
Date: Thu, 30 Jun 2022 13:24:08 +0200
Message-Id: <20220630112411.1474431-25-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: sM++pXEe923x

From: Klaus Jensen <k.jensen@samsung.com>

Add an asynchronous version of i2c_send() that requires the slave to
explicitly acknowledge on the bus with i2c_ack().

The current master must use the new i2c_start_send_async() to indicate
that it wants to do an asynchronous transfer. This allows the i2c core
to check if the target slave supports this or not. This approach relies
on adding a new enum i2c_event member, which is why a bunch of other
devices needs changes in their event handling switches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Message-Id: <20220601210831.67259-5-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220630045133.32251-6-me@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/i2c.h       | 16 ++++++++++++++++
 hw/arm/pxa2xx.c            |  2 ++
 hw/display/sii9022.c       |  2 ++
 hw/display/ssd0303.c       |  2 ++
 hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
 hw/i2c/smbus_slave.c       |  4 ++++
 hw/nvram/eeprom_at24c.c    |  2 ++
 hw/sensor/lsm303dlhc_mag.c |  2 ++
 hw/i2c/trace-events        |  2 ++
 9 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index be8bb8b78a60..9b9581d23097 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -12,6 +12,7 @@
 enum i2c_event {
     I2C_START_RECV,
     I2C_START_SEND,
+    I2C_START_SEND_ASYNC,
     I2C_FINISH,
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
@@ -28,6 +29,9 @@ struct I2CSlaveClass {
     /* Master to slave. Returns non-zero for a NAK, 0 for success. */
     int (*send)(I2CSlave *s, uint8_t data);
 
+    /* Master to slave (asynchronous). Receiving slave must call i2c_ack(). */
+    void (*send_async)(I2CSlave *s, uint8_t data);
+
     /*
      * Slave to master.  This cannot fail, the device should always
      * return something here.
@@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send(I2CBus *bus, uint8_t address);
 
+/**
+ * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C bus.
+ *
+ * @bus: #I2CBus to be used
+ * @address: address of the slave
+ *
+ * Return: 0 on success, -1 on error
+ */
+int i2c_start_send_async(I2CBus *bus, uint8_t address);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_ack(I2CBus *bus);
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
 void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
+int i2c_send_async(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
                   I2CNodeList *current_devs);
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index f4f687df68ef..93dda83d7aa9 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         s->status |= 1 << 1;				/* set ACKNAK */
         break;
+    default:
+        return -1;
     }
     pxa2xx_i2c_update(s);
 
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
index b591a5878901..664fd4046d82 100644
--- a/hw/display/sii9022.c
+++ b/hw/display/sii9022.c
@@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index aeae22da9c29..d67b0ad7b529 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
     case I2C_NACK:
         /* Nothing to do.  */
         break;
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 145dce60782a..d4ba8146bffb 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
            start condition.  */
 
         if (sc->event) {
-            trace_i2c_event("start", s->address);
+            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
+                            s->address);
             rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
@@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
     return i2c_do_start_transfer(bus, address, I2C_START_SEND);
 }
 
+int i2c_start_send_async(I2CBus *bus, uint8_t address)
+{
+    return i2c_do_start_transfer(bus, address, I2C_START_SEND_ASYNC);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
@@ -261,6 +267,23 @@ int i2c_send(I2CBus *bus, uint8_t data)
     return ret ? -1 : 0;
 }
 
+int i2c_send_async(I2CBus *bus, uint8_t data)
+{
+    I2CNode *node = QLIST_FIRST(&bus->current_devs);
+    I2CSlave *slave = node->elt;
+    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
+
+    if (!sc->send_async) {
+        return -1;
+    }
+
+    trace_i2c_send_async(slave->address, data);
+
+    sc->send_async(slave, data);
+
+    return 0;
+}
+
 uint8_t i2c_recv(I2CBus *bus)
 {
     uint8_t data = 0xff;
@@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
     }
 }
 
+void i2c_ack(I2CBus *bus)
+{
+    if (!bus->bh) {
+        return;
+    }
+
+    trace_i2c_ack();
+
+    qemu_bh_schedule(bus->bh);
+}
+
 static int i2c_slave_post_load(void *opaque, int version_id)
 {
     I2CSlave *dev = opaque;
diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index 5d10e27664db..feb3ec633350 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event event)
             dev->mode = SMBUS_CONFUSED;
             break;
         }
+        break;
+
+    default:
+        return -1;
     }
 
     return 0;
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 01a3093600fa..d695f6ae894a 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -75,6 +75,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
     return 0;
 }
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
index 4c98ddbf207c..bb8d48b2fdb0 100644
--- a/hw/sensor/lsm303dlhc_mag.c
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_NACK:
         break;
+    default:
+        return -1;
     }
 
     s->len = 0;
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 209275ed2dc8..af181d43ee64 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -4,7 +4,9 @@
 
 i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
 i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
+i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
 i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
+i2c_ack(void) ""
 
 # aspeed_i2c.c
 
-- 
2.35.3

