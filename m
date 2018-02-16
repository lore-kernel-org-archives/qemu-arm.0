Received: by 10.28.71.27 with SMTP id u27csp92227wma;
        Thu, 15 Feb 2018 18:35:38 -0800 (PST)
X-Google-Smtp-Source: AH8x226m6a6sQWy+XqhOCBwFSJ7r9Ij02tgTAgjJ2lyTQ1Q06lM17p+byiyFQ6YEu0wMlhkIfy9X
X-Received: by 10.37.200.194 with SMTP id y185mr3686891ybf.243.1518748538602;
        Thu, 15 Feb 2018 18:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518748538; cv=none;
        d=google.com; s=arc-20160816;
        b=K0ctdUvqay9oOX2xn/xCL2kJO7ocOh6aIEyH8AIGEITDfqCyqx8//KS3ABBsChoVoH
         RvPtIhHNKHpQ9LAsriEeCr9ZnbNEX5Y3kPru0/qBQuTCVf1LLOZ1uM2HQBK0B/2cUEU8
         YnjYyQnuTTnTQExlVMtXh+M+xTn3is/ak1OUTztMzVu7UoDkjmBvcdLaTrZQBZkrTsgh
         saKQz8/3HVX/Y6pPfdiFeYlj+eQqQMJDTphCNtTxDkARKIvymRUnIasiyAWeTAO0jCnO
         mO/XAUa8UKgi5OFeBEVOpqDGXlEB4V528ZVrZuj5anhNOuz1taxiGA1g+P+aHGSYcJZ8
         yz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bQ/WLf/gj3SLLZYXbCfd+kVPfJ6iBrMRkq8+ucUmfU8=;
        b=k/oE2GEDYEcUZZMiSGsrew0RtavDY+YS8SC8iYc47bDwS7wHF5RAbGxuZFRIxKbFUU
         RmKE4Dye9BhG9bmBNzX6jX/Xy642Bo80WbUhlIQT2q3etw32XNEKGcVO/yGtZ6LJv/ef
         cfQgnIKXbyEdjZfi0Npx8pubg6eHnni0VmcfzbE920s32Qw+tnhqsdjRRA8ZrKV8EG69
         vYHDzamzgLK9Q5+Oms7MGLrjil/2NRGEWA4HO6JzmD9LmDsGfJiiPSfHhQZ/ArSL2PZH
         Dm9ZZC/MEHWLtpaAqqmgaQfXG8Uyim4i3/NMH9d21tyGzngA5o5wCxuLpxPOaipE/rfF
         xzjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s7Z05+7l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si2851612yba.668.2018.02.15.18.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 18:35:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s7Z05+7l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emVsA-0001WZ-1J
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 21:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emVmv-0005dp-RD
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 21:30:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emVms-0002b8-MQ
	for qemu-devel@nongnu.org; Thu, 15 Feb 2018 21:30:13 -0500
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:41771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emVms-0002ah-Hp; Thu, 15 Feb 2018 21:30:10 -0500
Received: by mail-vk0-x241.google.com with SMTP id t201so1060403vke.8;
	Thu, 15 Feb 2018 18:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bQ/WLf/gj3SLLZYXbCfd+kVPfJ6iBrMRkq8+ucUmfU8=;
	b=s7Z05+7lvk8Gqhk/VR/PQCnNMXhvIB/SAjtzM9zbEy1aFWUXgvR0z7i2Z5WkrkRKnl
	BsWm563T3FiWnBccgSC5b8o5+p3xRTUWh0l0CB8aR/XIDqqsBarkIwQtJji3J9Ekqn5p
	BE6EK4E60j98ImPT8T4UA2OHY4fmyIiZnlYIx+URcQgQDX7EjDBwkkUOcOVu+w4TN1SY
	N7run7+mdamp1hpZAaOY+wVq8Cys7VzX8H4MY6L91e1U9bMW7Ch95H2vAg8PfPfe504V
	+ijnHTe88Z9dM8lz7g4XMFQH2GZE0A6bh9Diezuojak3RzEdZazYGM1wHj8yoyvj+7aF
	1s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=bQ/WLf/gj3SLLZYXbCfd+kVPfJ6iBrMRkq8+ucUmfU8=;
	b=dQx6/dXYCb4PYZtF+KOt6gHqHp5KMWF5MOrhyh4vHqa7Y8GxDGmVInghaMnRfP+iyH
	BLYqSvWKYYc6TI+IPWtIgKN/KExJavrsL6FzHnwBzypsoD7splA6yaCNt5IwvSuMRyes
	88SkhzcFTtODIGaaPMAGY4HAT7UDFYrhtkSBW6B3ZhiJgFi5y9R7WQkkmanN+H/gbo/i
	JtFrXTyX9m9O6tO8JuU6v77V2KJ96+jynIna4FM9ugWR4H6wNXa9ZFhhNqhpMwv9xDhC
	JmT137xdUUibbXbom97EIfZ3TScc7noEZHWIiJvgA7NRZtsHuIpVpBFoXWjxqSAW4r9v
	fNtw==
X-Gm-Message-State: APf1xPB+QK1c7LU7uLryVXmnYr3cRjjRdR5Y/l1aLk/8K3rSRYcoHTAt
	lx4Mp0ffJvw5Qecg1pEQIXw=
X-Received: by 10.31.199.198 with SMTP id x189mr3627801vkf.154.1518748209977; 
	Thu, 15 Feb 2018 18:30:09 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q5sm6295200uaj.17.2018.02.15.18.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 18:30:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Thu, 15 Feb 2018 23:29:30 -0300
Message-Id: <20180216022933.10945-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180216022933.10945-1-f4bug@amsat.org>
References: <20180216022933.10945-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::241
Subject: [Qemu-devel] [RFC PATCH v3 5/7] hw/sd/pl181: expose a SDBus and
 connect the SDCard to it
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gu5bECtwqOdj

using the sdbus_*() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

RFC because how pl181_sdbus_create_inplace() doing class_init(SDBus) in
realize(pl181) seems weird...

from http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg01268.html:

    I think you have to change that sd_set_cb() code now.
    If you look at sd_cardchange() it uses "is this SD card
    object on an SDBus" to determine whether to notify the
    controller via the old-API IRQ lines, or using the
    set_inserted() and set_readonly() callbacks on the SDBusClass.

This previous series intended to enforce a cleaner OOP design, adding a
TYPE_SD_BUS_MASTER_INTERFACE TypeInfo:

http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02322.html
http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02326.html
http://lists.nongnu.org/archive/html/qemu-devel/2017-12/msg02327.html
---

 hw/sd/pl181.c | 59 ++++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 3ba1f7dd23..97e85e4a64 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -33,7 +33,7 @@ typedef struct PL181State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    SDState *card;
+    SDBus sdbus;
     uint32_t clock;
     uint32_t power;
     uint32_t cmdarg;
@@ -179,7 +179,7 @@ static void pl181_send_command(PL181State *s)
     request.cmd = s->cmd & PL181_CMD_INDEX;
     request.arg = s->cmdarg;
     DPRINTF("Command %d %08x\n", request.cmd, request.arg);
-    rlen = sd_do_command(s->card, &request, response);
+    rlen = sdbus_do_command(&s->sdbus, &request, response);
     if (rlen < 0)
         goto error;
     if (s->cmd & PL181_CMD_RESPONSE) {
@@ -223,12 +223,12 @@ static void pl181_fifo_run(PL181State *s)
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
@@ -249,7 +249,7 @@ static void pl181_fifo_run(PL181State *s)
                 }
                 n--;
                 s->datacnt--;
-                sd_write_data(s->card, value & 0xff);
+                sdbus_write_data(&s->sdbus, value & 0xff);
                 value >>= 8;
             }
         }
@@ -477,13 +477,6 @@ static void pl181_reset(DeviceState *d)
     s->linux_hack = 0;
     s->mask[0] = 0;
     s->mask[1] = 0;
-
-    /* We can assume our GPIO outputs have been wired up now */
-    sd_set_cb(s->card, s->cardstatus[0], s->cardstatus[1]);
-    /* Since we're still using the legacy SD API the card is not plugged
-     * into any bus, and we must reset it manually.
-     */
-    device_reset(DEVICE(s->card));
 }
 
 static void pl181_init(Object *obj)
@@ -499,16 +492,52 @@ static void pl181_init(Object *obj)
     qdev_init_gpio_out(dev, s->cardstatus, 2);
 }
 
+static void pl181_set_readonly(DeviceState *dev, bool level)
+{
+    PL181State *s = (PL181State *)dev;
+
+    qemu_set_irq(s->cardstatus[0], level);
+}
+
+static void pl181_set_inserted(DeviceState *dev, bool level)
+{
+    PL181State *s = (PL181State *)dev;
+
+    qemu_set_irq(s->cardstatus[1], level);
+}
+
+static void pl181_sdbus_create_inplace(SDBus *sdbus, DeviceState *dev)
+{
+    SDBusClass *sbc;
+
+    qbus_create_inplace(sdbus, sizeof(SDBus), TYPE_SD_BUS, dev, "sd-bus");
+
+    /* pl181_sdbus_class_init */
+    sbc = SD_BUS_GET_CLASS(sdbus);
+    sbc->set_inserted = pl181_set_inserted;
+    sbc->set_readonly = pl181_set_readonly;
+}
+
 static void pl181_realize(DeviceState *dev, Error **errp)
 {
     PL181State *s = PL181(dev);
+    DeviceState *carddev;
     DriveInfo *dinfo;
+    Error *err = NULL;
+
+    pl181_sdbus_create_inplace(&s->sdbus, dev);
 
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
 }
 
-- 
2.16.1

