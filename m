Received: by 10.28.71.27 with SMTP id u27csp47506wma;
        Mon, 19 Feb 2018 07:23:41 -0800 (PST)
X-Google-Smtp-Source: AH8x227Kf+N275EEEicBikrAV481RBBdycd/tv2ib+Sw4OpQBck5BX6JEY9K6z7LPGQChohiAXB3
X-Received: by 10.37.30.7 with SMTP id e7mr10533684ybe.345.1519053821368;
        Mon, 19 Feb 2018 07:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053821; cv=none;
        d=google.com; s=arc-20160816;
        b=yri1Cjt2LFijNLG0aMDeVROznzlaeWJtv5UzZ24Fb9OHe0/T7mNEI0BgE3W/cnmXaC
         nK+IIngVq0Ll62rHcDPM++s8iLfvZmaALqfAex5q6Z7fuY22YMa0IZtBUGAvR52r8TAc
         YQ4otjEXGBdtrrmko/pSXri5WXqmqy/6jLUzNVwH+25N/f/9HdPufl7tZr+rfSA0zn7E
         nVEvEFpEBuFD1pvR8CUDGqTM4wS+DHtAt1oLJZ4WUemLLxGvLYKzJxlp3ny1XfG34lI7
         xzXhUiYj1JGe8vZvLnLBhI6L5Q7JOyaCuRc+OsFLmeBHnj+zlQjPFRvOt8lFO7Nh83lj
         J7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cusqc1X4gG/UtlHSinYxpQcggXpVDY6SFgpui8GkcC8=;
        b=kugnkHdRA6ezdkLYaXIKAFEU8sbg44SdHAQk4/Ww1dAhtDG7PmCf3Hzw7jG2seDbA4
         T07B+cyo98owIftlDKqx2fyCNcV70WbgO2ZvfnETfN+rrhBSgrGuBnRhmL+544tCOdGH
         gzUTiIJaPFWVZpHIms1zibKkxqQ7wgY2RN+ia1P6Epr24UkiluHfW9eD0y5C25S3tG+G
         bOq+MdAAtJuaLGyOzX3OmL0+eTDEKB6MFH7ZYVjV2FDJY9FFhWV3houzTxCsqQpNb8hs
         +KswPuDu6LsOd4icwCvGgM9yG/dNNIiLT/0RHD9MdIdRUJ7I+wb9MQAXd2hjlYqGmS07
         d59A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rsPvG29w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18si122727ywg.452.2018.02.19.07.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rsPvG29w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennI4-00051i-Qy
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:23:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEu-0003CD-F7
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEo-0008Uk-E6
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:24 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:38332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ennEj-0008Rb-Id; Mon, 19 Feb 2018 10:20:13 -0500
Received: by mail-ot0-x242.google.com with SMTP id 95so7227387ote.5;
	Mon, 19 Feb 2018 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cusqc1X4gG/UtlHSinYxpQcggXpVDY6SFgpui8GkcC8=;
	b=rsPvG29wyiI5Jb1I6nKuLkxnECndRtTkywVXRxlfdxeSq5oyDHyDl50vLmVYlDGTfL
	DTQwA51zRkRFOAS7N3X1EX5YGbWOY6+QX6PFWQaQaMMJF16XBRAhvalNd0vZ0zQjAAuy
	KWuUb2t8pri6SV51qsoc1llwI0iczOqneG76PJ2vD/Vsti8962TFdCS2PRSwdZOSf9y8
	fg41MIBiJK2aZ5ZOFO9HVq0JukFZljIIjToh84vHdKwnUrEDeJ01pSNruI7UWX237Fz4
	m8Vcdq0W/idl5fG8MraI2kqBdWWJ4y4R/37R28FV+iut9bHpoMomvZcmir9gv6KgXzYN
	I0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=cusqc1X4gG/UtlHSinYxpQcggXpVDY6SFgpui8GkcC8=;
	b=s5CfKgDJq/GM1pe0hHkbGAVushGzF/aTC/aI0tdIPnxzVCamL+4o6BhlXohe5KGWFE
	Ovd3ROYqeTsk6FSmF4DXwDaekWFWpVnPgHtKuyE3W9AUX/0OaFjs4sqixfSz9PR/8+Yd
	HGUdvVaWcAcCAZXJBRsHnCqrlYkaIwP1DW+mYjxVP1GRJcdzfNTHYcM8Yy15tMHEcCXO
	1rh7mq5BH+qKOgYYuXXSA3L2VNJRAPU1GMuw9p1LnE+gMvQcWsRqs3iVAQ8pJa3Z7TQA
	5rQj5BkQgBXHPclJ+/CF7oZYMTPhlOhGnn2RpSxp7nSx6dFfBGYDmyNjboasfup+Pghb
	Theg==
X-Gm-Message-State: APf1xPCmm7FHpOQlR1Fqn6M/2qTebsMhv8C66zmSEOcKTRO28C/IWIMF
	KaeKqF4fDZ7cjeEUnTCq3w==
X-Received: by 10.157.13.165 with SMTP id 34mr11963171ots.313.1519053612751;
	Mon, 19 Feb 2018 07:20:12 -0800 (PST)
Received: from serve.minyard.net ([47.184.168.85])
	by smtp.gmail.com with ESMTPSA id
	s11sm13217447ots.77.2018.02.19.07.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 07:20:11 -0800 (PST)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPA id F307A6EA;
	Mon, 19 Feb 2018 09:20:09 -0600 (CST)
Received: by t430.minyard.net (Postfix, from userid 1000)
	id 13CD8300966; Mon, 19 Feb 2018 09:20:08 -0600 (CST)
From: minyard@acm.org
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 19 Feb 2018 09:20:06 -0600
Message-Id: <1519053606-9817-3-git-send-email-minyard@acm.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519053606-9817-1-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to i2c.h
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2sNMm366eS6

From: Corey Minyard <cminyard@mvista.com>

Some devices need access to it.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/core.c        | 17 -----------------
 include/hw/i2c/i2c.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 9a54b61..cfccefc 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -10,30 +10,13 @@
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 
-typedef struct I2CNode I2CNode;
-
-struct I2CNode {
-    I2CSlave *elt;
-    QLIST_ENTRY(I2CNode) next;
-};
-
 #define I2C_BROADCAST 0x00
 
-struct I2CBus {
-    BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
-    uint8_t saved_address;
-    bool broadcast;
-};
-
 static Property i2c_props[] = {
     DEFINE_PROP_UINT8("address", struct I2CSlave, address, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-#define TYPE_I2C_BUS "i2c-bus"
-#define I2C_BUS(obj) OBJECT_CHECK(I2CBus, (obj), TYPE_I2C_BUS)
-
 static const TypeInfo i2c_bus_info = {
     .name = TYPE_I2C_BUS,
     .parent = TYPE_BUS,
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 8fd449f..d727379 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -56,6 +56,23 @@ struct I2CSlave {
     uint8_t address;
 };
 
+#define TYPE_I2C_BUS "i2c-bus"
+#define I2C_BUS(obj) OBJECT_CHECK(I2CBus, (obj), TYPE_I2C_BUS)
+
+typedef struct I2CNode I2CNode;
+
+struct I2CNode {
+    I2CSlave *elt;
+    QLIST_ENTRY(I2CNode) next;
+};
+
+struct I2CBus {
+    BusState qbus;
+    QLIST_HEAD(, I2CNode) current_devs;
+    uint8_t saved_address;
+    bool broadcast;
+};
+
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
 void i2c_set_slave_address(I2CSlave *dev, uint8_t address);
 int i2c_bus_busy(I2CBus *bus);
-- 
2.7.4

