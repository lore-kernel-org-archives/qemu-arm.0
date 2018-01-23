Received: by 10.28.71.27 with SMTP id u27csp3582649wma;
        Mon, 22 Jan 2018 20:01:28 -0800 (PST)
X-Google-Smtp-Source: AH8x227/0dQLoyartzVXZzu4GUBeVtClAIuxOMjoib7YJrWBHxtmWePOq6p2ZHQDGYmG0dhHdgSd
X-Received: by 10.37.2.79 with SMTP id 76mr1070943ybc.182.1516680088665;
        Mon, 22 Jan 2018 20:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516680088; cv=none;
        d=google.com; s=arc-20160816;
        b=bcyP62Q4uWJSeOuvGIh3dFY9kaVmWJ1VrnmbEJusnbdedYbuC98RntYUTUOoh5OsbW
         uiipoD/uIxFdEwDX0V0trWC14T8cok1KdAZst0QAYh5ffubim8qHo0ty5l+QeYgF4Ozc
         YHCoxwwX85m5oMl4shB5yW3D7jrqIa5okG8XRLi458eM1BtVo3C8ED8FtiKEODMgzLcW
         PuAs1flOvyjjeck0AXSvaJnlseABAnrkw6ah4TUAtuQh8kpvPEvwaf3SR8LQTGYI5MFn
         iz5nHWchOgjSqGD9Gem+M0VBcBO6p3d1rL8joFQTMD5GUPDJq05+5CAJrThzKmNcgHf1
         8bQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=0mHP+GrCZYzpSwoDOFPLtU6jbdNgjQf4kSAC2JNN9TU=;
        b=yweSQIan3jIWSn3lcs6NfBkibF6lBOWZQ/pgw6L/OLRjdVzZ2P13L3cBh+aM0Hm7oA
         kQo6/K4iQFNORv/15QZfrpPO4Y8GKRTMwPQvR3HgB9ECnBZufPsKhHZ3Dkf3iddqlMZG
         dWwCiiv2LSAlLrCOKJ78HhSbmU/wtZPra5t6+Z4/JRmp6kkJBhW8lpouhJnVhh/A4uwi
         VaQpxtHuXuVh7o46L/eCH0CtB0VA66r6TV8zGNNZxXOkfjzcZ+kAw6DAvZwT+YCUlGuP
         K22JDAWtVy1w0M4DenSQrePadMwxp2DxMJx/LSqTLM+/SlQ67f4azVH1m5QuDSCQdq9s
         lm6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GCTNcjnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si2203400ybc.232.2018.01.22.20.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 20:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GCTNcjnw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edpm4-0008Bg-4H
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 23:01:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpjf-0006Dv-E5
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpje-0002U1-E0
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:58:59 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edpjb-0002R8-Mm; Mon, 22 Jan 2018 22:58:55 -0500
Received: by mail-qt0-x241.google.com with SMTP id x27so26561381qtm.12;
	Mon, 22 Jan 2018 19:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0mHP+GrCZYzpSwoDOFPLtU6jbdNgjQf4kSAC2JNN9TU=;
	b=GCTNcjnwd91JBe4lIuz4JuE43mwY5WpDWEFMsuJ13vLx65mX8U0KAtW/xkU3+JA0h0
	9n+qZKQgpkmbSe4lJ2Laa8ociB98gGO+pzRwcV9QlEVPpF2SVGevosW8iomVkZcxHr5C
	QkYBhRNuDzbFQBdY88c++7E4W357NM9lr4657wHaTP1PiZyZ6V4Npa0tj90iM6GmiI5r
	JtVTw40sHE0jsi2/V/tmZgqsrHRRk4JGK6wbxQv/FaOV5Ov3uwrqPIKF2gMjDd3syp/H
	/haVYrc2anEPKlbOU7bVl4611fFJLKo8SKh8LJGSwcSqw0eTUSE7xzB1KyjawcPkRhnB
	gzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0mHP+GrCZYzpSwoDOFPLtU6jbdNgjQf4kSAC2JNN9TU=;
	b=QyVSmeI1eERM7+pd05maycXRj0J3yHayMcL5HgGxSEc2KaCa8ItCtwm6rf1vVTjN7c
	4VDyc8tTMwH0WIoJ+DraFVOuYsXt+4Y+Pq9Ho0qG+XfbGfObEcjn6PLpDoic81hTzNqN
	9jq5tmsCCf2aBhqp3DTzHxJt6cfOicwOkJVuQCcWxyti4fmGmn70g3tzD5hHSgguJaQ0
	hLTH1XGmesXhImiCLwphMYTdUJhLjax5Qswqm/ZA5Y0t4AGIO5NiwVKJhR1+xYwQ7wA7
	UCerG8zxuifll3cnlIwcNifpxuhoZ3nhXhSxasIyZsDbvHbwggKeyToxz0dOOByviBqG
	/MDA==
X-Gm-Message-State: AKwxytf3R1JQzE/4OtTIqNfbXatYK7uReve9JVlXxau84VTqfb7Z67Um
	oz+D4UXGIn8Odsuyi6sI1go=
X-Received: by 10.200.41.143 with SMTP id 15mr1673676qts.247.1516679935139;
	Mon, 22 Jan 2018 19:58:55 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	n24sm12447530qta.26.2018.01.22.19.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:58:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Date: Tue, 23 Jan 2018 00:58:35 -0300
Message-Id: <20180123035837.16578-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123035837.16578-1-f4bug@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v2 4/6] hw/sd/pl181: expose a SDBus and connect
 the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wAJR78cmrD/r

using the sdbus_*() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pl181.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 3ba1f7dd23..ce696c5d7d 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -33,6 +33,7 @@ typedef struct PL181State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
+    SDBus sdbus;
     SDState *card;
     uint32_t clock;
     uint32_t power;
@@ -179,7 +180,7 @@ static void pl181_send_command(PL181State *s)
     request.cmd = s->cmd & PL181_CMD_INDEX;
     request.arg = s->cmdarg;
     DPRINTF("Command %d %08x\n", request.cmd, request.arg);
-    rlen = sd_do_command(s->card, &request, response);
+    rlen = sdbus_do_command(&s->sdbus, &request, response);
     if (rlen < 0)
         goto error;
     if (s->cmd & PL181_CMD_RESPONSE) {
@@ -223,12 +224,12 @@ static void pl181_fifo_run(PL181State *s)
     int is_read;
 
     is_read = (s->datactrl & PL181_DATA_DIRECTION) != 0;
-    if (s->datacnt != 0 && (!is_read || sd_data_ready(s->card))
+    if (s->datacnt != 0 && (!is_read || sdbus_data_ready(&s->sdbus))
             && !s->linux_hack) {
         if (is_read) {
             n = 0;
             while (s->datacnt && s->fifo_len < PL181_FIFO_LEN) {
-                value |= (uint32_t)sd_read_data(s->card) << (n * 8);
+                value |= (uint32_t)sdbus_read_data(&s->sdbus) << (n * 8);
                 s->datacnt--;
                 n++;
                 if (n == 4) {
@@ -249,7 +250,7 @@ static void pl181_fifo_run(PL181State *s)
                 }
                 n--;
                 s->datacnt--;
-                sd_write_data(s->card, value & 0xff);
+                sdbus_write_data(&s->sdbus, value & 0xff);
                 value >>= 8;
             }
         }
@@ -480,10 +481,6 @@ static void pl181_reset(DeviceState *d)
 
     /* We can assume our GPIO outputs have been wired up now */
     sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
-    /* Since we're still using the legacy SD API the card is not plugged
-     * into any bus, and we must reset it manually.
-     */
-    device_reset(DEVICE(s->card));
 }
 
 static void pl181_init(Object *obj)
@@ -502,14 +499,26 @@ static void pl181_init(Object *obj)
 static void pl181_realize(DeviceState *dev, Error **errp)
 {
     PL181State *s = PL181(dev);
+    DeviceState *carddev;
     DriveInfo *dinfo;
+    Error *err = NULL;
+
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
+                        dev, "sd-bus");
 
+    /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
-    s->card = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false);
-    if (s->card == NULL) {
-        error_setg(errp, "sd_init failed");
+    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    if (dinfo) {
+        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
+    }
+    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
+    if (err) {
+        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
+        return;
     }
+    s->card = SD_CARD(carddev);
 }
 
 static void pl181_class_init(ObjectClass *klass, void *data)
-- 
2.15.1

