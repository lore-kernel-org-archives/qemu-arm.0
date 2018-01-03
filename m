Received: by 10.223.134.117 with SMTP id 50csp12116770wrw;
        Wed, 3 Jan 2018 08:31:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBov31wfe73Xz88dz1OszPx3OSTHowzVePTmRFhTsiRfrqgws5ZKYAaWwuoVY4GdMtCJPd1Wi
X-Received: by 10.37.129.142 with SMTP id p14mr1850136ybk.34.1514997097921;
        Wed, 03 Jan 2018 08:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514997097; cv=none;
        d=google.com; s=arc-20160816;
        b=vEhsn51URiP7eO5xrqwxkyLgVq2h2X4W3qlRAL1TW88i3RD56+JzLjMjo5fUh3XSs9
         VSkNoj65zrEbhRjOiJiKjFU3yN14b9TfW13bjCnOo34uzkkJYadn0Hue4PpQxVk0IFqs
         QYw9VDnf9mLExjP8eZyUN4UokAaZYHA5uYyPlz8KhZECz4qseiI5pS9Bi7G/IqZizUIh
         G5mcYS2drAZ/54ZKknJRmPR2CfdlfaySrM/jdcinkinbMFOEldbXBOV5rPpZk+S1wN4a
         cNzoNjbIBIXdIA9DBgBMUpkOKyzCxaGOvhrOB3I0ldFpxeH18d3lhCaJDSB69jDhQiEI
         TYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=p38CldTqD4u466YHuSEP9i0mwNRyNT7h63oUnq4yahA=;
        b=n9hCnu0yiE5hfPtZi2T8UtViYjbxnzgrnsHdMbnZl02YdD2VFs1xM687SnBQgtKWF2
         TpRk9gCLwId9+SkQCMpvibbAnL8bLfNXn6O98gmuBWj2WanPgE1kbvM8tb631tl3WFL1
         BXCkYOrbECo8IK+6SPZphj04g+o706Wj+yHwyx2hJw8ExrkEgpLTVvrEw1qesQc41+R1
         NNr65jqH/4JYZELmg1F6B9TMwlgF1/GDJWqoQ8cyqGWFTXl6sN3NkYF1u07IcHq+yEln
         9W4hk4i0vomDfuSmZ+cg8oHJZQt/Y9MkxxDXwnmOdXDLqcZyyCA4u537ezK1QYqT4HWd
         WU1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ebs69UdP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si280741ybb.518.2018.01.03.08.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ebs69UdP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWlx3-0001WN-Bi
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:31:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq3-0004As-Br
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq2-00053H-Ca
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:23 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq2-000532-8S; Wed, 03 Jan 2018 11:24:22 -0500
Received: by mail-qk0-x243.google.com with SMTP id j137so2156417qke.10;
	Wed, 03 Jan 2018 08:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p38CldTqD4u466YHuSEP9i0mwNRyNT7h63oUnq4yahA=;
	b=Ebs69UdPcyRwu1lEOJlpqE7vgn18lUeS9nOUNr/18jW5V/+twMSPF8f7iJCpWvq5ap
	4teoxnxBZ91etDS9qyz1ogI8wDa1EQ8WReujaHtkq6RMGPUdsFB34GMz4zYSIJc0lywE
	yXz8Ij7VOln0E1nHu+TlgoEZl4Uqwch8ZjsmeZ56bCmHWgb7BKGPDxImxcovlkxSq+XZ
	tZ9IAwAKaOsqP+6MjQ51rcaD/5fjF5CIE5T/KE6sSy/OtvOkGXP7+ZFt+8xpBRLNcb/K
	Gwi+a0i6wHOGCx1YPfIvMU423UqI4PCm1jMTIDmpT7ZMGzawv9KJPRzkzsRJPT4Ru0sp
	Ee6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=p38CldTqD4u466YHuSEP9i0mwNRyNT7h63oUnq4yahA=;
	b=iCmpKsvGtQw8m68lPTudw8Otevx+wda8cSpZFWzhw+aUgANBmbPugejKYI4AkNMvOe
	7Oy+z5HarkvrITKs1iM9bc7zg5tGbd0fVLk6PzVNudXBq2XncoF4i/U3LPctV4TJEUvx
	Ug7Yf2A7GJdjTfA1Tgrjflh0xdkE9HmsZ7f7TuNqag0Goi3wwYrWVVSb0wO/BNmbV+fz
	A/SiKXGC83/Ba28odADu0b4+cSe8hZ8sb2/sdo3MWB9w+VJljGWaKPLPo6Otwbh4mM+y
	5aii8c09PsSgfgyEXe1+fLdQ7OaUh8K1NydweHLV92Wx08hcSkoSbhm8plgLPLC/FdC8
	PVdA==
X-Gm-Message-State: AKGB3mIQhI1rFj0qGpQUR4KKdVe+zncDdWZrFf7QFKp5iEzOnXsTwWDo
	8TsEdNvEeU55VI3hKS3Mtxw=
X-Received: by 10.55.168.215 with SMTP id r206mr2504700qke.268.1514996661821; 
	Wed, 03 Jan 2018 08:24:21 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Wed,  3 Jan 2018 13:23:59 -0300
Message-Id: <20180103162400.10396-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH 5/6] hw/sd/ssi-sd: expose a SDBus and connect
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
X-TUID: MfKcEDjBAq3t

using the sdbus_*() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 24001dc3e6..c8b27add84 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -47,7 +47,7 @@ typedef struct {
     int32_t arglen;
     int32_t response_pos;
     int32_t stopping;
-    SDState *sd;
+    SDBus sdbus;
 } ssi_sd_state;
 
 /* State word bits.  */
@@ -97,7 +97,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
             request.arg = (s->cmdarg[0] << 24) | (s->cmdarg[1] << 16)
                            | (s->cmdarg[2] << 8) | s->cmdarg[3];
             DPRINTF("CMD%d arg 0x%08x\n", s->cmd, request.arg);
-            s->arglen = sd_do_command(s->sd, &request, longresp);
+            s->arglen = sdbus_do_command(&s->sdbus, &request, longresp);
             if (s->arglen <= 0) {
                 s->arglen = 1;
                 s->response[0] = 4;
@@ -174,7 +174,7 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
             DPRINTF("Response 0x%02x\n", s->response[s->response_pos]);
             return s->response[s->response_pos++];
         }
-        if (sd_data_ready(s->sd)) {
+        if (sdbus_data_ready(&s->sdbus)) {
             DPRINTF("Data read\n");
             s->mode = SSI_SD_DATA_START;
         } else {
@@ -187,8 +187,8 @@ static uint32_t ssi_sd_transfer(SSISlave *dev, uint32_t val)
         s->mode = SSI_SD_DATA_READ;
         return 0xfe;
     case SSI_SD_DATA_READ:
-        val = sd_read_data(s->sd);
-        if (!sd_data_ready(s->sd)) {
+        val = sdbus_read_data(&s->sdbus);
+        if (!sdbus_data_ready(&s->sdbus)) {
             DPRINTF("Data read end\n");
             s->mode = SSI_SD_CMD;
         }
@@ -239,14 +239,25 @@ static const VMStateDescription vmstate_ssi_sd = {
 static void ssi_sd_realize(SSISlave *d, Error **errp)
 {
     ssi_sd_state *s = FROM_SSI_SLAVE(ssi_sd_state, d);
+    DeviceState *carddev;
     DriveInfo *dinfo;
+    Error *err = NULL;
 
     s->mode = SSI_SD_CMD;
+    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
+                        DEVICE(d), "sd-bus");
+
+    /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
-    s->sd = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, true);
-    if (s->sd == NULL) {
-        error_setg(errp, "Device initialization failed.");
+    carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    if (dinfo) {
+        qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
+    }
+    object_property_set_bool(OBJECT(carddev), true, "spi", &err);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &err);
+    if (err) {
+        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
         return;
     }
 }
-- 
2.15.1

