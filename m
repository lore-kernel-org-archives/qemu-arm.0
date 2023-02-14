Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1468256ejb;
        Tue, 14 Feb 2023 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9VTkyFnwRNoyRqhe6mG8LHOpl9NdOWE6FeGP34gEPtCwW4386slA8Fm0hebVGjYcpD5TSh
X-Received: by 2002:ac8:5dd3:0:b0:3b9:b750:2547 with SMTP id e19-20020ac85dd3000000b003b9b7502547mr5987349qtx.37.1676395300101;
        Tue, 14 Feb 2023 09:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395300; cv=none;
        d=google.com; s=arc-20160816;
        b=hl4W+o7mH/xbceAn1AhjhozTq2twtk6dTgEyOY+XMs6N67HgC+EESflhOWvWpPVLRx
         LtWHtDD/saQ0QubWmWG4OqSMyOOPzkWDUW7FNT7NqqBC6g+5r4GqbTy1u57A+KVNul23
         eLJ1ky+iSYtwKiMWtiBcUeqTnQ1HjkV4dh2wQJrQurs/Ewiysznxs4A0zzRl4dGMc/Ai
         dkPtcfmq13nCVxFDF9WwsObweLHrvDsd6m0q2iVd4WP7Lh5apD4c+FHOZQosQEvFBqpm
         +xruE3loOOEdhT8SiI2ECH+Siwei68ezEcp4db1NJM8ExVOG5VBm0MAN/yzAPGDKTF05
         R9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kqDcILC5H8LYWTp/9o3RjnpT7shPA5MHVHZMiYlQPnI=;
        b=MxiBwpBuqynAP3HFNzmDBCvTmxdlQg/GQ0wEl7WpledccJdT2jWhhIgra7kRrZUphS
         NhrBODMGWogmb8jYDn4cfeWrHgI8ItBF/APw5J79k+CcUERQOAYRPcNh9KYQZw4xJnub
         wdVjlabdbnup49I9/Gku1AMACtISrQeTsfysfzamho2FyQhnF8tSFemybYp14WCgrBGW
         V6iFC7TXS2cPwPCqap0QtD8hgRnBcFjHWwH0cAZ3OgY5cGpOIseGmiHhUPkp6588FFfg
         Ye24vpVT83DQJcjh86reAyqnzCDKk2jJ2+zTL0WOs+ZR0Oyd2DaMaN4sLJTA+CMjzBRB
         4Avw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a05620a424d00b0071a6778dd61si12859837qko.538.2023.02.14.09.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxE-0001h1-Sw; Tue, 14 Feb 2023 12:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxC-0001et-DS; Tue, 14 Feb 2023 12:18:54 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxA-0004qb-9q; Tue, 14 Feb 2023 12:18:54 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSbs1x72z4x5Z;
 Wed, 15 Feb 2023 04:18:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSbn1jM0z4x82;
 Wed, 15 Feb 2023 04:18:44 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/8] hw/i2c: only schedule pending master when bus is idle
Date: Tue, 14 Feb 2023 18:18:24 +0100
Message-Id: <20230214171830.681594-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214171830.681594-1-clg@kaod.org>
References: <20230214171830.681594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: z60/8ihFWdNQ

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
2.39.1

