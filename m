Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp12852ejc;
        Thu, 2 Mar 2023 09:44:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+6l31sroBqDEG9Fj0Lt1+2pJ478ktbHOf2p8+6r4NSgXurywKplqmX+u9Oa5HZ3J+/RcT/
X-Received: by 2002:a05:6214:415:b0:56e:9d24:bd08 with SMTP id z21-20020a056214041500b0056e9d24bd08mr5733994qvx.2.1677779076586;
        Thu, 02 Mar 2023 09:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677779076; cv=none;
        d=google.com; s=arc-20160816;
        b=VgWr4P5ZFQJuhVN9zkpdR3sY7KGfE7Gonh7jeUkHuCnMl+ytJqOProQmvvqDfZ4Fa2
         nUim/QXHZmJ9FiO0Q3l5SrFanoxZcfqPPmhKBfS2RvWHOQDaW1gul87WFlXgLxYrKjGK
         7SGxBmyrsZwjXJJ34MoRhHmgrMoIQxySqQ5K1vn+G6ypOEFmTuyEHNXB9m3/w0ab0OTF
         bK3mXY+uGv84sXPnxTgt8FZEaHBJQhOm2NwAodBA2dDFwTl3sBFWBYD2YgnpKwQe0Zh4
         HWipbp8TbLiMuDc1QdE9o5X74Ol2rkQqKayvLsYBS6DvatKUH3zjARLkn/7zEC9b1ut2
         y51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iFG2k3eIrJDUwDcrBo4kk+4P0kNpEyJuG7CSEGhDq0M=;
        b=MCBEet1RR/J/t9Zh+K4SdGhMFv70zOv4ctLjJunuVVjI3QWrAzAdPEz/tvT2KiRLig
         KEQwugNYeq3QT/9UT7XASspwjVyzovf4BvsCrrG0+1/rRjUYPlDJdEz5CzzcS1nwQbtU
         JLGlertrRGvLIXBbB4YnQpllGey7OjW9PRaJrhB4SL6zbLVh/QBYbfdhTSXDdtwxPLd3
         oqAOSSqzQRgrMqmPt30kyqbP1BkX/jl4OL6bJUvUp5pV0KK7QB+VLvvnbWJRyBQcVNJj
         x0xMhgguo2/tzKg2UBvGYCzK0bidJx/xIJ3YNyNgbeFsHTctOQ5PU62Rie3f2zvPq/uG
         x6og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206-20020a3705d7000000b00722b1bde9c3si28979qkf.692.2023.03.02.09.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmxK-0005OW-T1; Thu, 02 Mar 2023 12:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwy-0004tm-IT; Thu, 02 Mar 2023 12:42:40 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwt-0002mo-2S; Thu, 02 Mar 2023 12:42:36 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMr32WYz4x84;
 Fri,  3 Mar 2023 04:42:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMn3g9Gz4x5X;
 Fri,  3 Mar 2023 04:42:29 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sittisak Sinprem <ssinprem@celestica.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/11] hw/at24c : modify at24c to support 1 byte address mode
Date: Thu,  2 Mar 2023 18:42:02 +0100
Message-Id: <20230302174206.2434673-8-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j0qSyS43P5dq

From: Sittisak Sinprem <ssinprem@celestica.com>

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
[ clg: checkpatch issues ]
Message-Id: <167660539263.10409.9736070122710923479-1@git.sr.ht>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/nvram/eeprom_at24c.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 3328c32814..613c4929e3 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -41,6 +41,13 @@ struct EEPROMState {
     uint16_t cur;
     /* total size in bytes */
     uint32_t rsize;
+    /*
+     * address byte number
+     *  for  24c01, 24c02 size <= 256 byte, use only 1 byte
+     *  otherwise size > 256, use 2 byte
+     */
+    uint8_t asize;
+
     bool writable;
     /* cells changed since last START? */
     bool changed;
@@ -91,7 +98,11 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
-    if (ee->haveaddr == 1) {
+    /*
+     * If got the byte address but not completely with address size
+     * will return the invalid value
+     */
+    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
         return 0xff;
     }
 
@@ -108,11 +119,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee = AT24C_EE(s);
 
-    if (ee->haveaddr < 2) {
+    if (ee->haveaddr < ee->asize) {
         ee->cur <<= 8;
         ee->cur |= data;
         ee->haveaddr++;
-        if (ee->haveaddr == 2) {
+        if (ee->haveaddr == ee->asize) {
             ee->cur %= ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
@@ -199,6 +210,18 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
         }
         DPRINTK("Reset read backing file\n");
     }
+
+    /*
+     * If address size didn't define with property set
+     *   value is 0 as default, setting it by Rom size detecting.
+     */
+    if (ee->asize == 0) {
+        if (ee->rsize <= 256) {
+            ee->asize = 1;
+        } else {
+            ee->asize = 2;
+        }
+    }
 }
 
 static
@@ -213,6 +236,7 @@ void at24c_eeprom_reset(DeviceState *state)
 
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
-- 
2.39.2

