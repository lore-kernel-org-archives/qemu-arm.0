Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1059967qvr;
        Wed, 16 Jun 2021 09:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2gslt+1DcN7vwlaRHZm0cVWZeC6bNY4Sgv1UeG+ymgvNj8Y5q25y8Z13CErm4ySMnSMMy
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr351157ejc.9.1623860617557;
        Wed, 16 Jun 2021 09:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860617; cv=none;
        d=google.com; s=arc-20160816;
        b=CvSFrfr+ca9uZ7dcJyweUMGOlzH69Go9+/nUaEFzY9y27plE/TjZkdmVxz7ldoRM7c
         +hxFgxSzav3dLI3EqcOGfn5bDRg5P6vm2gAzg6GUiJr6lmLgOWRinYGnvGivomD5+yLq
         E+KWI9Pi2BhyOSkj2731KKuLZtL5Z3tKcoE1Jqu4tkb2N7Sy8ow/fYqhMktkybPz2KNO
         nhiajNV346WMGZDb7shsY8GeL4zTM293emoqMEK30WcpbHz6bVVj/J039ffEAjCOMckV
         YG+w4CuxLymARBTw2xEH7aS0vPFZpEqHyVu7o+4/vL2WSJCb4CvNYjarZCmxDfGyOQ04
         Fvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1d4OoqsJ8FMcOnJf0dKzbcD5w9xCZwknQ2w/kjLbVKs=;
        b=XOzpxPybSYvXM0TGb3xvrmFT8pXRku7YYPfLCALd33+XZ6qZSAPnTq/XrhjU/xmRGJ
         S1jkunOonUCleflCHOcWynW4GRGTO1XU8WrzkF1fuPgmVHmFilK4jK+YsP4X4YY4zRGA
         q7/6u6x/AEuYTEarJLi877LBSHkjKabWKAtc1qLvI3CKwN9wEbpUehWkHmy5pChu2Wd9
         KnZ+slsRZobiq8GdioIXEgl7EkohT06utxx7lUNMH6UpNkKKqh1IoCki2h+L0oNRDzED
         oCWywodvQCwThekK0iEQGkR0yww4T6rgwNrog622DwPN3vk+Vw+eRtULoUlUwgi0vQlx
         l8ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="i+H/5yu7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si2474700edc.264.2021.06.16.09.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="i+H/5yu7";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYKG-0000fO-G9
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYC4-0003To-Sb; Wed, 16 Jun 2021 12:15:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYC2-00067b-Mu; Wed, 16 Jun 2021 12:15:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y7so3302844wrh.7;
 Wed, 16 Jun 2021 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1d4OoqsJ8FMcOnJf0dKzbcD5w9xCZwknQ2w/kjLbVKs=;
 b=i+H/5yu7f69GuWpwop0RrbGr412l43TvPtu09sgrDzSzWSwnq3vbxtu0rUchVqpMms
 eF9cugj9zQtt/1O+PDDHkhWu9p4G48HWHsR/3VDXwl4R6xQefI4/cWAIuqf4+jDfxXQR
 O+V1ozowgKTbIcGdoAtkTRnOSIMXlWYVKEs/EATn+rxNGX0rSnGteVtV+Jg1+bE9OFYq
 BuAgmCMlVN6qPZpYJcMYA+d9lBDUOPrrwvj8BUS8friPMWVfbKydPhwYGwTMtcZ5HtoA
 D7TDnLvPQ4u8zujqvL/oGKLTSKNfCvqhfCqu62p2PNqc+HIg6sA9GnKxV7ntJ+/G7vOx
 F4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1d4OoqsJ8FMcOnJf0dKzbcD5w9xCZwknQ2w/kjLbVKs=;
 b=QJgOh3yjKTr4+SmOd3nbFhtoPEEqjdsdCgaLvh0jXoOTY23ZQLZVfaxDxSmKEICq/o
 /S9zXguq+ORAaUL3c2uWy7HqLgrkLe8Cffq2C/iPTM2hYlX4/g9qbulPoAmzetysm7b+
 /FyZOeUd9GWxwaLR7ze4APJNCUMM6E4aTyR1vIf/4Qg9hdt8RGuVO9yMzRWYiJYG1MLs
 y4R2zwWcXYxoChDgfdifWy/hYRyakl3A9V7pc2sTXU3560IqLBehJhEL6QN5EavR5PIY
 QmOlC6Yxe22jus0IVOeYkvPu7pIS8ixNJDy1fStscg4wXRajm/NVYWgfMLdixzM4hS3c
 jC2w==
X-Gm-Message-State: AOAM530ejcHHkWIvXhp/YyUJIUrpTns7if/7Ir8W4aIdUKyL5SPhMTvd
 37v311L2n7izre+cl0oodmijnUhoH2lztQ==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr203265wrx.171.1623860103704; 
 Wed, 16 Jun 2021 09:15:03 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n13sm3047802wrg.75.2021.06.16.09.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:15:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] hw/misc/auxbus: Replace 'is_write' boolean by its
 value
Date: Wed, 16 Jun 2021 18:14:14 +0200
Message-Id: <20210616161418.2514095-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1BD/5fBfyF+a

Remove the 'is_write' boolean by directly using its value in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 9cc9cf3be32..d96219aef88 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -106,7 +106,6 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
     AUXReply ret = AUX_NACK;
     I2CBus *i2c_bus = aux_get_i2c_bus(bus);
     size_t i;
-    bool is_write = false;
 
     DPRINTF("request at address 0x%" PRIX32 ", command %u, len %u\n", address,
             cmd, len);
@@ -117,11 +116,10 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      */
     case WRITE_AUX:
     case READ_AUX:
-        is_write = cmd == READ_AUX ? false : true;
         for (i = 0; i < len; i++) {
             if (!address_space_rw(&bus->aux_addr_space, address++,
                                   MEMTXATTRS_UNSPECIFIED, data++, 1,
-                                  is_write)) {
+                                  cmd == WRITE_AUX)) {
                 ret = AUX_I2C_ACK;
             } else {
                 ret = AUX_NACK;
@@ -133,19 +131,18 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      * Classic I2C transactions..
      */
     case READ_I2C:
-        is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, true)) {
             ret = AUX_I2C_NACK;
             break;
         }
 
         ret = AUX_I2C_ACK;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
@@ -154,19 +151,18 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         i2c_end_transfer(i2c_bus);
         break;
     case WRITE_I2C:
-        is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, false)) {
             ret = AUX_I2C_NACK;
             break;
         }
 
         ret = AUX_I2C_ACK;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
@@ -183,13 +179,12 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      *  - We changed the address.
      */
     case WRITE_I2C_MOT:
-        is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
         if (!i2c_bus_busy(i2c_bus)) {
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, false)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -198,7 +193,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, false)) {
                 break;
             }
         }
@@ -206,7 +201,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
                 i2c_end_transfer(i2c_bus);
                 break;
             }
@@ -217,13 +212,12 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
         break;
     case READ_I2C_MOT:
-        is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
         if (!i2c_bus_busy(i2c_bus)) {
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, true)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -232,7 +226,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, true)) {
                 break;
             }
         }
@@ -240,7 +234,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
                 i2c_end_transfer(i2c_bus);
                 break;
             }
-- 
2.31.1

