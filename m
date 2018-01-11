Received: by 10.28.173.206 with SMTP id w197csp1018951wme;
        Thu, 11 Jan 2018 13:09:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBouDVP5YHJNC30dlePsXDvQW5fC4vrfCUHMFeADFQ7lsc6O8hazhc7Zojc/aLElym4Xyec7J
X-Received: by 10.129.212.72 with SMTP id g8mr7678912ywl.90.1515704953238;
        Thu, 11 Jan 2018 13:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704953; cv=none;
        d=google.com; s=arc-20160816;
        b=yJXrrSWkGA8m0npiJEmfX8p4yAiDp4D262jZpVkhLzU2ydOQU7gOc0tXsNnqC4QIx7
         RpAJbmjP99OYjqGV0EqzvmePBdFFMWlbaV52gwfvVC8Gc8eYjZp4Ncv3zC5tqqMdyd+v
         BPvAbMQDF4/zxKuNIqmQDBrXIupZXNUPgh3pl9l99OczOXHd0Z+K8BOR9DAkmN0QE/NX
         sGgINsH9caxgUgwxa1U9ZsRkuaLNg2xthiV05pYAaHhq3aDzXS0fo6dxbm3k4ZCkID0L
         oQq0MM2QUAHWISDzpMzYJmLr8wOHubAvi9xWHkT4YzaigDJVnwvsQQOeSLK/Kq99B3WU
         PYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ydqMLYPL8mZf4X4L58+PNGmXrTS2z41Avy1lgtju11k=;
        b=RBk1uDIFfVO8jH2mq4wOAsfVwSBHG01ffPnX7aUNjmtBTjabzEgmfFg1wHi6U9qCFI
         n0ZqNp15AmO6yTa6Q+yIIVTeIed/0RkD4AwLqVqelVrwceoiWsDrtarMgQ3CcU0B2YRV
         eFZ61c5yn8XdmnUNaESZkF5qExARSetze19RXeN61EJz4S2YyBQ0soJipr7cKBAIycHx
         YnED5lW8YJeBV1V5fURw16dhO+E41SvcogHwpq+4zXQjEcGNg3N1Pa1O4zD6cj4Diewv
         qXwoDr+HDYHjWgGesRnLikE2zvU6xhLD8nBpYpLhkjKrBpri8yOegGLbNz4FNzE62X5B
         vhvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F0ni6o6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w11si2284260ywd.7.2018.01.11.13.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F0ni6o6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk64-000811-Jx
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:09:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvg-0007Br-Dz
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvf-0003Wy-FT
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:28 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46868)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvZ-0003PA-6h; Thu, 11 Jan 2018 15:58:21 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so3554680qtr.13;
	Thu, 11 Jan 2018 12:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ydqMLYPL8mZf4X4L58+PNGmXrTS2z41Avy1lgtju11k=;
	b=F0ni6o6zDd3Ov4cjBVnoHV5rIdZ4mkejdqJDyoLgtPfuJgIAqg8NTPop0VwKkH1Vuj
	R2z4UdUuzjhyEdwoh0KtyD3wq4zvT0J8QtDXTRtUZE3DVIVSb0RfZDHoJi0hFc73uJna
	a+7rHlAJdLKlZF0arFcBU/Evac1fhaGhTBMXuPJUt5YVlZZheM1TP+t4s+mfmZdgTnKV
	rkqRp6qlbuM2L1UsYYXM+Yzeadek/fe6Z/w0pzo1HWXjXb5RY2kI39DAQACnAx67Bs3n
	xw2tIJQsiP/fwamj9tIUz0EZt44FamvRisaOUeqT6Y0VpAt1VTED2Fm4rcJ+D7F7TSt8
	9Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ydqMLYPL8mZf4X4L58+PNGmXrTS2z41Avy1lgtju11k=;
	b=kEIcydRmA9qXszcdyKEmj0GZSSlIvuw2oZLn4fNoUz3amlzIHEDC0Do6KGnrJegdn+
	AeBixwVaiNkn95QrlkQ7JTX2VbT7e2g0s8EdWeJ7XUMRRImwJF7QXMXdUPM6bFw9tEtf
	UZEKuClx9+pIpbA9+k2ojILDQRxBXosQeXin4CBaOWmRj0IStOGHwDAvd0DHAfhDxRw4
	kMcSNP3UF9H25+lvWqYoOKH3eh9AwDnHdQtyj7LR9fPqBTyqq6e2CQXOZeXGK4qgEqVD
	aPmUP8hRnSG8jXQb55OdL/d5OzNvqytkGUhHskS34JCdHv6dd/E6TBUm3P5gefp9VBG8
	+YyQ==
X-Gm-Message-State: AKwxytcF3ybcJzDPOQ7D2bj0gnQlwo+LgBN4XKgMdN8eFKWqjwyEdmBI
	X5/QI88LokmaEFzj+HKVzog=
X-Received: by 10.237.49.195 with SMTP id 61mr34438774qth.27.1515704300621;
	Thu, 11 Jan 2018 12:58:20 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:58:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:24 -0300
Message-Id: <20180111205626.23291-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v6 19/21] sdbus: add trace events
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQZf/uOlfZ24

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/core.c       | 14 ++++++++++++--
 hw/sd/trace-events |  5 +++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/sd/core.c b/hw/sd/core.c
index 295dc44ab7..498284f109 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -23,6 +23,12 @@
 #include "hw/qdev-core.h"
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "trace.h"
+
+static inline const char *sdbus_name(SDBus *sdbus)
+{
+    return sdbus->qbus.name;
+}
 
 static SDState *get_card(SDBus *sdbus)
 {
@@ -39,6 +45,7 @@ int sdbus_do_command(SDBus *sdbus, SDRequest *req, uint8_t *response)
 {
     SDState *card = get_card(sdbus);
 
+    trace_sdbus_command(sdbus_name(sdbus), req->cmd, req->arg, req->crc);
     if (card) {
         SDCardClass *sc = SD_CARD_GET_CLASS(card);
 
@@ -52,6 +59,7 @@ void sdbus_write_data(SDBus *sdbus, uint8_t value)
 {
     SDState *card = get_card(sdbus);
 
+    trace_sdbus_write(sdbus_name(sdbus), value);
     if (card) {
         SDCardClass *sc = SD_CARD_GET_CLASS(card);
 
@@ -62,14 +70,16 @@ void sdbus_write_data(SDBus *sdbus, uint8_t value)
 uint8_t sdbus_read_data(SDBus *sdbus)
 {
     SDState *card = get_card(sdbus);
+    uint8_t value = 0;
 
     if (card) {
         SDCardClass *sc = SD_CARD_GET_CLASS(card);
 
-        return sc->read_data(card);
+        value = sc->read_data(card);
     }
+    trace_sdbus_read(sdbus_name(sdbus), value);
 
-    return 0;
+    return value;
 }
 
 bool sdbus_data_ready(SDBus *sdbus)
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 0a121156a3..c0f51f11d4 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,5 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/sd/core.c
+sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg, uint8_t crc) "@%s CMD%02d arg 0x%08x crc 0x%02x"
+sdbus_read(const char *bus_name, uint8_t value) "@%s value 0x%02x"
+sdbus_write(const char *bus_name, uint8_t value) "@%s value 0x%02x"
+
 # hw/sd/sdhci.c
 sdhci_set_inserted(const char *level) "card state changed: %s"
 sdhci_send_command(uint8_t cmd, uint32_t arg) "CMD%02u ARG[0x%08x]"
-- 
2.15.1

