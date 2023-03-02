Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp11272ejc;
        Thu, 2 Mar 2023 09:43:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+8VnZtyoqL0Rudt9f6gdRCIeq6eJfPHxavTTLlAb/JDiN314YN9euagtOnn28JSfE2g9fe
X-Received: by 2002:ac8:5fca:0:b0:3bf:b950:f684 with SMTP id k10-20020ac85fca000000b003bfb950f684mr18108326qta.53.1677778982248;
        Thu, 02 Mar 2023 09:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677778982; cv=none;
        d=google.com; s=arc-20160816;
        b=ITb2FdLzfBJd28fmDjqrCPmz4PCCiQBhKkzfRW1BLcMACKzpgOp4GIGKQdjotGHH/3
         jCpem9L1q9aA7KW/V1V11CACm8zibHUf1KPymnxkkUnyKkITW+LtIT9wz9TNVqyKg2P8
         899oIxyIz9qr/dd3bVH+unYiGvVnS3T1ukMCd/fRscpJzB33UPOuLsCFzT6mImARjYC5
         qFewYDaYZK6TBXlyTZe3/7xZW5GZqN7Z92Km11gl8he2VKcz+V5tvt0KbKnNmRJgwAGF
         VlckAzu+X02y/EY3892Cqh5cnW8rgyWguMYT/Es5Gr1SqNB+8ew1t9erhPjdWQ7Y6ONQ
         CZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Jwzt73+AOuDjJkzgExGQp3qaEDfJmRtwphnTwwWn78A=;
        b=ElFooe6qwgUd8s7U1t0m41biLB/cATrS7Qy7koipfOqCV56Rlr05QK27eDsLQEiYUq
         QWxowuhv9QQzblmyUksXdIaijHIYe8+eqfY+OH1rFIYKZxsLp7uRVXfj0nG37dRYEjRy
         bvB8CGO04obe0MqFTruYduXbgYZzPNUuHx8VGP0xrTll7vXRn7+5XP6QV48CqB1Qrw+x
         upqYZzT5XVTAY6GVH86GH05euIazTjUIgkoQtLhfJCrAFyl7CDqYBjcuvRzA8t4Kf87p
         4m/ZekBiTNhlkDAc62iP9e0G+NvFvoSxnwZIUiH5sBOJqlQj85FgbPg5mOk8j4F/m0as
         nuoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp12-20020a05622a1b8c00b003bfb9c4b45csi103947qtb.173.2023.03.02.09.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmx4-00051h-85; Thu, 02 Mar 2023 12:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwo-0004qn-P8; Thu, 02 Mar 2023 12:42:32 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwm-0002ki-NM; Thu, 02 Mar 2023 12:42:30 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMb2LTWz4x84;
 Fri,  3 Mar 2023 04:42:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMX5Lgjz4x5X;
 Fri,  3 Mar 2023 04:42:16 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/11] hw/i2c: only schedule pending master when bus is idle
Date: Thu,  2 Mar 2023 18:41:57 +0100
Message-Id: <20230302174206.2434673-3-clg@kaod.org>
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
X-TUID: Xg+aRfVD0Unj

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

