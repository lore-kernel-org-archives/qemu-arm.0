Received: by 10.28.173.206 with SMTP id w197csp3730741wme;
        Tue, 9 Jan 2018 06:02:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBoswjn2WalEB4SB4UkkMcOZZlw0vh/Ua3iE3ZF4ffPgcANPVKY7so+7rO99DO3MjtgY9wf7F
X-Received: by 10.129.141.75 with SMTP id w11mr13814077ywj.330.1515506537481;
        Tue, 09 Jan 2018 06:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515506537; cv=none;
        d=google.com; s=arc-20160816;
        b=Ne9myMxqsR1EPfeNSqV+dHWYA3txDLGv+D+HGpHNP43fpUrH51t99bdFiKcoJ46QJk
         limKQ1LX1oQ8h9lSSzh2NxGhlNFqMjpi1vbgj/MCwTT7c2vW9X6/4Dqxe9zQoWA9mXxD
         ihWXwYc4pd2ai3XlmCCp2i25E95G0zXwlehedNoyJgagtNCrZic4S+ufPtVFXhxxY/J1
         BPgb0m94As9kaR+6BUxzBuYYxqjs7+BDP7udeTRjqJk8lSahrlhWXo/O0mzuPsQteh5W
         g/4B1845yRfSvUU69vSx/m4qw0gESB/Zhfzwe7U51+FpYLgM7RFThSR5RZEHTiQFi2fa
         5zNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yzVSrDm5d995q4LMUQVlMIeJos7qXSJWNS9RNe95x94=;
        b=L1qIIfBOXdY6yRnzX4krnbZXtm9fhYyRV61E2w8tqMeZRcsSzSbCRtD36kqZ6NRt4L
         rUyRecN8qnrqq0C6cLiicoMnY88mt5gINeKlw/6oNauuIYkbv2FWfu2SSwP60R0Djawx
         WEpqxd4fDCAGORiw83ZGFrzykavwOF0E+RN/gaJ4z7uBQ6hX2JpcxDHzfeaaHN75BFqq
         Ak+Wg2KPvLb7fOIlfxy+o3XcdnAN09r5Gti+umgdqdi5TlLrsSjiqba7xsKXiRjPL7WG
         uiP3W6Zj2OJUyAXfXvZxEEQY6N2vqKJHCqokJYOgvsL5ozuGY5dNF5fWgCMIJc2UPg3o
         4WVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n4si3125135ybh.511.2018.01.09.06.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuTn-00075I-Sn
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:02:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTX-00074i-Dj
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTW-00016o-G9
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:01:59 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:45792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eYuTW-000159-9R; Tue, 09 Jan 2018 09:01:58 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eYuTU-0003ek-JW; Tue, 09 Jan 2018 14:01:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jan 2018 14:01:52 +0000
Message-Id: <1515506513-31961-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/4] hw/sd/ssi-sd: Reset SD card on controller
 reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RQc1G6cFNMn5

Since ssi-sd is still using the legacy SD card API, the SD
card created by sd_init() is not plugged into any bus. This
means that the controller has to reset it manually.

Failing to do this mostly didn't affect the guest since the
guest typically does a programmed SD card reset as part of
its SD controller driver initialization, but meant that
migration failed because it's only in sd_reset() that we
set up the wpgrps_size field.

In the case of sd-ssi, we have to implement an entire
reset function since there wasn't one previously, and
that requires a QOM cast macro that got omitted when this
device was QOMified.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/ssi-sd.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 24001dc..30d2a87 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -50,6 +50,9 @@ typedef struct {
     SDState *sd;
 } ssi_sd_state;
 
+#define TYPE_SSI_SD "ssi-sd"
+#define SSI_SD(obj) OBJECT_CHECK(ssi_sd_state, (obj), TYPE_SSI_SD)
+
 /* State word bits.  */
 #define SSI_SDR_LOCKED          0x0001
 #define SSI_SDR_WP_ERASE        0x0002
@@ -251,6 +254,24 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     }
 }
 
+static void ssi_sd_reset(DeviceState *dev)
+{
+    ssi_sd_state *s = SSI_SD(dev);
+
+    s->mode = SSI_SD_CMD;
+    s->cmd = 0;
+    memset(s->cmdarg, 0, sizeof(s->cmdarg));
+    memset(s->response, 0, sizeof(s->response));
+    s->arglen = 0;
+    s->response_pos = 0;
+    s->stopping = 0;
+
+    /* Since we're still using the legacy SD API the card is not plugged
+     * into any bus, and we must reset it manually.
+     */
+    device_reset(DEVICE(s->sd));
+}
+
 static void ssi_sd_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -260,10 +281,11 @@ static void ssi_sd_class_init(ObjectClass *klass, void *data)
     k->transfer = ssi_sd_transfer;
     k->cs_polarity = SSI_CS_LOW;
     dc->vmsd = &vmstate_ssi_sd;
+    dc->reset = ssi_sd_reset;
 }
 
 static const TypeInfo ssi_sd_info = {
-    .name          = "ssi-sd",
+    .name          = TYPE_SSI_SD,
     .parent        = TYPE_SSI_SLAVE,
     .instance_size = sizeof(ssi_sd_state),
     .class_init    = ssi_sd_class_init,
-- 
2.7.4

