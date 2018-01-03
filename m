Received: by 10.223.134.117 with SMTP id 50csp12113959wrw;
        Wed, 3 Jan 2018 08:28:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouhZ7fszJ7YT2TL6TnOoJttYNNW7fYxQwmlx+7SW0vMnZq3e7kF1+b4OwXaQ1Q9NtVMxyOd
X-Received: by 10.37.186.208 with SMTP id a16mr1843581ybk.217.1514996921722;
        Wed, 03 Jan 2018 08:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996921; cv=none;
        d=google.com; s=arc-20160816;
        b=Cl4YpC5heGjBSC+FeP/fuJqoby4bcgpc6ZA0vntTlgDq2AkFna5A8bd3H3B3sM0EXD
         SgZVUzcQV+ulrI7B7+vWhP9peu52RCHqjOGpYE/RInZc9xfZbno2ERGtF8CHPQJb7g6B
         /R6rMFrrtCfey1eO1xe2pDF2Zcgb2zcteHQ0ui3Hz3d/ZOHzf0WjX9C+Y2w61Myspm6I
         8wAF/cGP02k5yHynBD3v2SjHMVL3yecveonpwAOzodsYJGze82SFndN5cW+f9yzNQ8ME
         emFX4rlBQtTdq+Xuf+BUc+UgbON/0uhEqGzdq9I/zjTxjeKvLyWwnGq052uxVB7GjxXk
         Y0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RTc1e3AR/OMsnSccX4Hi9/3/0aB/T5uBUr1Z5g+RhdM=;
        b=ITpmy0FD/0lWB+Vk5p/2V73Yoe69ka70SpATE6ojCH/iUe/a4jUM9cWcpIMHisTUcE
         vRVf7ZfUbLguspQ44yQFUVPs0tMgFmuidbJZEVULv8eNvdZaOWa/buHqLF7UvuNArXHa
         sLzAcmGp/qs6/tpSKrm3sXcvWC4CEyXSItchuR6RPkIOpJEcQbYmPoQ30JXALYpWi2Sx
         ecgwa9We1k/9xZGJ9674Bli7RfKo1k9MxXj2cd1vhV6H3YBqbONWkxo5z0uqzV1Wj2nJ
         O3PyL6o6gDFfD0Tmemr8Z9DLOK9JGEJ/xvlklbCsTm1vrz2eHcb+svhBRA/JA9RHAnGS
         fabA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UACM9sHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si284250ybh.671.2018.01.03.08.28.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:28:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UACM9sHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWluD-0007G4-65
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:28:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpy-00045v-5C
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpx-00050Q-4z
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:18 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpx-000506-0d; Wed, 03 Jan 2018 11:24:17 -0500
Received: by mail-qk0-x241.google.com with SMTP id g123so2161140qka.3;
	Wed, 03 Jan 2018 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RTc1e3AR/OMsnSccX4Hi9/3/0aB/T5uBUr1Z5g+RhdM=;
	b=UACM9sHqdtD8CI8vjWBcxDkiR4gUsoQF1igbXJy3vV1waCo6E9GP/lffIWurxRJVJL
	UNFo8f0NDdCbQHvKpdQuiWVC8lg/NGAt5XNvspgGi6DMYPoAeWR1bNFAGCR5Ek2GynLP
	MSJkOF8uq62Nof1gcrYdoX9/Seq+glsFxqa9iYUlOwN1ZfHKdt0/3Xzbfofz7/Bxj8Ef
	CtSe5pH6ykd3EZtlpCfy2qUdlGcHsCgBsYnd7l948KEqihZwRelnBR2Y1l8VZcHtafLe
	lp84SevcaT/WOvPkPkSZVj/M0hqdhv7yp90aE1DdM9bLCtYE6+Jj4IVATjojfbAq5OMF
	zd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RTc1e3AR/OMsnSccX4Hi9/3/0aB/T5uBUr1Z5g+RhdM=;
	b=tdRSBY7UN97JrpUwM0C/66TrbmHVF8+xrry+nd3/s7aJn55NGVIjzi4c2tLE7WNd4i
	Z582p1F6HVOLZKLGFq2fomKdcCAaw3VznsznRlXd7frc/tf/Idwwmb29FXATtLmRy9Vq
	+R5yZBqzE2od0BZfg9VQ2e/tXrJ7CJ1y2u856SgVs+BMOcux07KQ+o5O3VDIelpsgYyi
	csewukQf3gadoN5Zi1EqSbtkncE8lbUJrJcChH7medSMMpHjj/GRCyk/fGASIHiF0znF
	epeRGZtpNzPwZe1EkmBUmbPz8OlldwnN9nCQe4UHOR5fN+xrRJ6XXErvk+ypbjmjH8o0
	4cJw==
X-Gm-Message-State: AKGB3mK1VgC4VBcWZwYuRkVqH0cDLGwDdlWKDSI/9tAPmIZ5Zfw7iwFe
	n9Bc6YH7v2IhBHV4zIQsIKQ=
X-Received: by 10.55.189.130 with SMTP id n124mr2313166qkf.297.1514996656574; 
	Wed, 03 Jan 2018 08:24:16 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Date: Wed,  3 Jan 2018 13:23:57 -0300
Message-Id: <20180103162400.10396-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH 3/6] hw/sd/milkymist-memcard: expose a SDBus
 and connect the SDCard to it
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oV6RfQVUR1kP

using the sdbus_*() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/milkymist-memcard.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 5df3a0f815..9f4c7dad63 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -68,7 +68,7 @@ struct MilkymistMemcardState {
     SysBusDevice parent_obj;
 
     MemoryRegion regs_region;
-    SDState *card;
+    SDBus sdbus;
 
     int command_write_ptr;
     int response_read_ptr;
@@ -104,7 +104,7 @@ static void memcard_sd_command(MilkymistMemcardState *s)
     req.crc = s->command[5];
 
     s->response[0] = req.cmd;
-    s->response_len = sd_do_command(s->card, &req, s->response+1);
+    s->response_len = sdbus_do_command(&s->sdbus, &req, s->response + 1);
     s->response_read_ptr = 0;
 
     if (s->response_len == 16) {
@@ -149,10 +149,10 @@ static uint64_t memcard_read(void *opaque, hwaddr addr,
             r = 0xffffffff;
         } else {
             r = 0;
-            r |= sd_read_data(s->card) << 24;
-            r |= sd_read_data(s->card) << 16;
-            r |= sd_read_data(s->card) << 8;
-            r |= sd_read_data(s->card);
+            r |= sdbus_read_data(&s->sdbus) << 24;
+            r |= sdbus_read_data(&s->sdbus) << 16;
+            r |= sdbus_read_data(&s->sdbus) << 8;
+            r |= sdbus_read_data(&s->sdbus);
         }
         break;
     case R_CLK2XDIV:
@@ -206,10 +206,10 @@ static void memcard_write(void *opaque, hwaddr addr, uint64_t value,
         if (!s->enabled) {
             break;
         }
-        sd_write_data(s->card, (value >> 24) & 0xff);
-        sd_write_data(s->card, (value >> 16) & 0xff);
-        sd_write_data(s->card, (value >> 8) & 0xff);
-        sd_write_data(s->card, value & 0xff);
+        sdbus_write_data(&s->sdbus, (value >> 24) & 0xff);
+        sdbus_write_data(&s->sdbus, (value >> 16) & 0xff);
+        sdbus_write_data(&s->sdbus, (value >> 8) & 0xff);
+        sdbus_write_data(&s->sdbus, value & 0xff);
         break;
     case R_ENABLE:
         s->regs[addr] = value;
@@ -266,15 +266,23 @@ static int milkymist_memcard_init(SysBusDevice *dev)
 static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
 {
     MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
+    DeviceState *carddev;
     BlockBackend *blk;
     DriveInfo *dinfo;
+    Error *err = NULL;
 
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
+                        dev, "sd-bus");
+
+    /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
-    s->card = sd_init(blk, false);
-    if (s->card == NULL) {
-        error_setg(errp, "failed to init SD card");
+    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &err);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
+    if (err) {
+        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
         return;
     }
     s->enabled = blk && blk_is_inserted(blk);
-- 
2.15.1

