Received: by 10.223.134.117 with SMTP id 50csp12114541wrw;
        Wed, 3 Jan 2018 08:29:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBosmvIK03as5SfUKFwOrVno1ZOqZxh3tUfOtP6fRf2V2Dt7GcLrt511pBz7uQlsm6TtlGu2+
X-Received: by 10.37.119.84 with SMTP id s81mr1960862ybc.47.1514996961460;
        Wed, 03 Jan 2018 08:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996961; cv=none;
        d=google.com; s=arc-20160816;
        b=E1xkDLH/OzlnrNZ4qKo6Pz/yzVMnEO1WLt6GqrePJcw4S9/xnkkxJSp1AXdki4hPW3
         OCmbq9RpB2qynDozz7d3OzLuVy5nme2gDeYboefS1s54InbysVd+VXsDH5MAm7tJNbQI
         Gwj+/tq8JQx6RANibMnjIJhkJJCIyvg+AfuafqfpmWpnwWz3Yp/LhUyIUkmx6PCPWrqp
         8Gu+EwLHkHROdEdYLl+Ro+6KhcQK6hVKAJ3MwK4AVm6E9DQD5XjkDqYxSfCBKcDv7zBY
         yA1vS+GQTpA6unHUq3mmMCWkNFsMA2YenYLSNf7gjpMDLOUtWjJp/6lfuvuGXarz08+S
         S2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=NhfOyUelkpNc4QsRDgwmgWrhckHiJ/ZUYuYm5Hq80/o=;
        b=MetHkbm8VlrAf+7hfeapQhEg0b94AyoZr/MJGldkhnFi+pYRHLKkwdtR2rDghd+olD
         cDo0me/o99/POg1RwdC/150QsioDUzZBZIkZu4Hx1p36taW6RQVCA1KFGS8UVpQAF7He
         /VgM9REUO2rxGqvyYxUVyBTvfFBJfUr6lbqIo3m9NYO5pVBEs7iXi1b55EOMnl6B+pbv
         RG6924PvVqdYYaz+HG4Fv15eKHNsX+NYyBVsYIyWzNnSFptG5VTnrewRkMdBfa+TMASz
         lmqUeJIM0TxiYVhoYcD91CI9qMzKUSQEftLOQ85418Jpz1U+X+HiDKBIAaYOUvrVde7D
         J2vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/Q2OcvO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si288108ybn.509.2018.01.03.08.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/Q2OcvO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWluq-0008Cp-RV
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:29:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq1-00048l-D1
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpz-00051a-K7
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:21 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpz-00051O-FR; Wed, 03 Jan 2018 11:24:19 -0500
Received: by mail-qt0-x243.google.com with SMTP id 33so2736894qtv.1;
	Wed, 03 Jan 2018 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NhfOyUelkpNc4QsRDgwmgWrhckHiJ/ZUYuYm5Hq80/o=;
	b=H/Q2OcvO7rJKMhtAZCku86PKLQdlq7KAIQTDgUh6/fO1NdT6RLfgiJKuqmj26TEkE6
	hnzJwr7EUx545i+3bBOOETgdyeyupisCGSLZPElxozUskNcchhStKpYpth7/gzBGSMEn
	adizXIdNaxDjN/IcCOEmFQPE81MAUsNO90ZpXkNrJNx6E1M3kjrraVS7YM8uEM7nhYaD
	H7zlsXzF6+DkkaRwxOf5pqtV+jymRA8Dg4TROisg55BrifNyd+f6einIS4K74+4O11Q5
	JVfARGL+hBGHejVrnapABjq8U7v8LM0Hz+V47oSdrkI+Yflkeml5uyCK8X3j8DbI73R9
	YlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NhfOyUelkpNc4QsRDgwmgWrhckHiJ/ZUYuYm5Hq80/o=;
	b=GGikwBfu1/Y/OBFwkvtkzh5GL9STICe1CiX+AEunIsmEFuCC5EBiHfAFagvwWZg8pq
	7k+ToFwED9O6YlTrk7a8L63U5ehX7PSOenFULANwFWkVgJsHuHsPNczOSEvl7xGMEty+
	9EOP9/he1lHiaKGx1poHQwrDc0pfGi9bmOAzbZiSgcrPy+PGpIGYoqDacJ/UTJ4dv/TY
	xL5Pm5OemCHBYTcReu/s/rs91dLr43qVdcJ65k77hRv7zecQ1rbiKhurGS7Ns5G3iOdV
	n2t5oWsxR7lVDAL0Iw/jMVLw3g8P+i4KWd/BQix/ri2x+YbK70M9jPa7xYz/KyLJqwWJ
	BHxA==
X-Gm-Message-State: AKGB3mIXQzf5nxwo27sZ4P1bMftNhtGC1NatDG2AIxFiixPzK0L3bkTP
	ja6dq/f7RmQPozIydVONOkw=
X-Received: by 10.237.55.9 with SMTP id i9mr2410920qtb.164.1514996658972;
	Wed, 03 Jan 2018 08:24:18 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  3 Jan 2018 13:23:58 -0300
Message-Id: <20180103162400.10396-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 4/6] hw/sd/pl181: expose a SDBus and connect
 the SDCard to it
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
X-TUID: 0K7qBk+PmOVB

using the sdbus_*() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pl181.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 55c8098ecd..ce696c5d7d 100644
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
@@ -498,14 +499,26 @@ static void pl181_init(Object *obj)
 static void pl181_realize(DeviceState *dev, Error **errp)
 {
     PL181State *s = PL181(dev);
+    DeviceState *carddev;
     DriveInfo *dinfo;
+    Error *err = NULL;
 
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
+                        dev, "sd-bus");
+
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

