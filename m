Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7184265ejc;
        Wed, 1 Mar 2023 08:58:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/KBHxnfNw5aLwEah4r86Zo8UuCBoyUQjn9PvMqnIcQ4I3p32AgqRPXA6FEDyEWbBrFFydT
X-Received: by 2002:a05:6214:262f:b0:56c:25dd:f739 with SMTP id gv15-20020a056214262f00b0056c25ddf739mr13892125qvb.24.1677689918484;
        Wed, 01 Mar 2023 08:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677689918; cv=none;
        d=google.com; s=arc-20160816;
        b=Si2BdFLjqweqxc5FaptwACQYTdIzPPMIrTCTzhR2x26kUZAeDo+iuDJVQzTNMkPYDm
         mPAhy0HNi1cht/gOywl7ZhWHyi+pe8W9+BxwZUVBiVe2NpkoP72a6Cl5t+J08BLUl1e5
         OmW9QWE9qwIVZAfh+LyBHUmvgEOoqQc3muaeZZAcqv8ao+3k90Seq7U30QaE2781w5AR
         jG9pbb6vskHpYaLD8sPlbDwPVX9hgeFdHCNggntXjNqXZ7sO6DzfFY4WYRt7Fn3d9u6L
         XVZBCD6pZvM9jeLIU5Z4Yw1LFUQjJqUkSFO+bxwbtA/TnWDA2FMdXOJBqJe1DyNt8I2G
         DF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Jwzt73+AOuDjJkzgExGQp3qaEDfJmRtwphnTwwWn78A=;
        b=iRAsAGV5oI7f04H9ZEk8fO/LMH3g6JXSV8XvHIzAC6VvKbk3liVHpt04PvvV26oxcB
         maC1Q/z/5GhtHoip0c7qLz9EKXN4HxZ+FaWxdiVAtu/tHNWKPmueKHAQTsW1u/6LXOJD
         e+Nm7YFoyM8atFSfG9KpYGqkxiFm3QQ/sFYh/eQkFH4GCLk2NUrE72x2ypklgVHaWbMu
         NqDtMDkMCuHtEw2+0q3MlnpLQpaOyBcuf2uxsOfGi1tjzHIagWGGoUGyya+EomExtTra
         S9M3OBn2ZL928XAyoSN2g064PTOXqWKteHhonSWGkEFCjOvZfOCsxLqhY9fRKvPaAQ2b
         TvqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a0cf250000000b0056eb1aa8734si11075080qvl.405.2023.03.01.08.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 08:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXPl1-0000fl-Vk; Wed, 01 Mar 2023 11:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPl0-0000eW-I6; Wed, 01 Mar 2023 11:56:46 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPky-0007cv-LV; Wed, 01 Mar 2023 11:56:46 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPK57Vbz4x7x;
 Thu,  2 Mar 2023 03:56:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPG5GS4z4x1R;
 Thu,  2 Mar 2023 03:56:34 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen <k.jensen@samsung.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 02/11] hw/i2c: only schedule pending master when bus is idle
Date: Wed,  1 Mar 2023 17:56:10 +0100
Message-Id: <20230301165619.2171090-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N8HjF47elngT

From: Klaus Jensen <k.jensen@samsung.com>

It is not given that the current master will release the bus after a
transfer ends. Only schedule a pending master if the bus is idle.

Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20221116084312.35808-2-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/i2c.h |  2 ++
 hw/i2c/aspeed_i2c.c  |  2 ++
 hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 9b9581d230..2a3abacd1b 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -141,6 +141,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
  */
 int i2c_start_send_async(I2CBus *bus, uint8_t address);
 
+void i2c_schedule_pending_master(I2CBus *bus);
+
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
 void i2c_ack(I2CBus *bus);
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c166fd20fa..1f071a3811 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         }
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_IDLE);
+
+        i2c_schedule_pending_master(bus->bus);
     }
 
     if (aspeed_i2c_bus_pkt_mode_en(bus)) {
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d4ba8146bf..bed594fe59 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -185,22 +185,39 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 
 void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
 {
-    if (i2c_bus_busy(bus)) {
-        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
-        node->bh = bh;
+    I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+    node->bh = bh;
+
+    QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+}
+
+void i2c_schedule_pending_master(I2CBus *bus)
+{
+    I2CPendingMaster *node;
 
-        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+    if (i2c_bus_busy(bus)) {
+        /* someone is already controlling the bus; wait for it to release it */
+        return;
+    }
 
+    if (QSIMPLEQ_EMPTY(&bus->pending_masters)) {
         return;
     }
 
-    bus->bh = bh;
+    node = QSIMPLEQ_FIRST(&bus->pending_masters);
+    bus->bh = node->bh;
+
+    QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+    g_free(node);
+
     qemu_bh_schedule(bus->bh);
 }
 
 void i2c_bus_release(I2CBus *bus)
 {
     bus->bh = NULL;
+
+    i2c_schedule_pending_master(bus);
 }
 
 int i2c_start_recv(I2CBus *bus, uint8_t address)
@@ -234,16 +251,6 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
-
-    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
-        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
-        bus->bh = node->bh;
-
-        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
-        g_free(node);
-
-        qemu_bh_schedule(bus->bh);
-    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
-- 
2.39.2

