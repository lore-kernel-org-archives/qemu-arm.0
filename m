Received: by 10.223.159.74 with SMTP id f10csp5532156wrg;
        Wed, 13 Dec 2017 12:47:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBovR1olKq8PqfbD2wCab59P7dp8I0ZLunknqBdHcGTwrRQdnYrghFYnrubln/Aaw0b2oDRzr
X-Received: by 10.37.7.194 with SMTP id 185mr2737481ybh.90.1513198076180;
        Wed, 13 Dec 2017 12:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513198076; cv=none;
        d=google.com; s=arc-20160816;
        b=k4q6RrOKdYe2QzCf/p0mG39hawkwQrEg7UvbLF2LJFJzxmNoWwRueC5O0BZDyHM/4v
         YTw+ZgJ6/LGBdPWJfilIJIUVYyad6okuIyYtZntshGMypWzFfQcpxIhoue9JlsYd0BeF
         W3cnGiAbzIhcX7flPHOa1XQEId6OftaJzgLZP9h2RHbqf9m9/WlKPkXpVI0rcDXK5WGJ
         rwqhHV/rZpm7tggH+FT9WEiBKk+Sd/yA1GFb17teaUTANuanrXozvpmM+d/cw744rmd8
         eIpI1eY6s1DCdddk1CebIKpwTxiCviQfkTaMJ7ADNv9QrYI4s9gjygdyviodjc3TFg9o
         MrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DlmG7hzRagDkTdI6MyP5XoC2NlvDV7RMExcPXGV1dZs=;
        b=rSpvBPyCMOepgyKaikE63+6/2Xmu5AoricYsA7I3syYXoz697+iy4CB5FN494aePfY
         6R7rucLPIxHZGXNDGqeQqjopfJFUpe2lO+t5ztZc5NcvJE8CvjNTccs70PG8TM3N8LIZ
         JDFqRMu/uJz/0cQ+xYfDFgQWG+TCUyi4bX6939DdUSAbqsVSr5kDGH6vxKfpAaIAbEms
         GSyvdCarjzsWIVobykgBsEPmlwc+PLo6t1B9aaWN9mOWYRywsWJqZoyCeu5U0tCBnOVv
         AWPXtg2dDMcMXP/hu20PZdgGceGbkvXpVCOW3cFNRYi2H9RmGARrbAA8a52FNnt3cYuI
         6L/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JEs6jtaE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q133si492170ywc.13.2017.12.13.12.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 12:47:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JEs6jtaE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePDwZ-0005Vo-IX
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 15:47:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDth-00041V-7W
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 15:45:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtg-0006JR-CN
	for qemu-devel@nongnu.org; Wed, 13 Dec 2017 15:44:57 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDtg-0006Io-7X; Wed, 13 Dec 2017 15:44:56 -0500
Received: by mail-qk0-x243.google.com with SMTP id b184so3685800qkc.13;
	Wed, 13 Dec 2017 12:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DlmG7hzRagDkTdI6MyP5XoC2NlvDV7RMExcPXGV1dZs=;
	b=JEs6jtaEPbOD2z/PQicPhupCN8Q05Zw4PPfWCC31wtKMLDbQlVXHp+Kg0DwDFKkHvj
	QgYhQYgfQ0UbwqcmXK+SbllbIT1iYurRElX0yh4TsbBV9iW+folRevDKTMfA2MPHDyJZ
	v+Gze7F9LIGKOdrEib930sfTmguDe8G6eLejFdqY/YJI8yc/T8yEjCTcmd0y2rMBT54t
	yipeYICJ4d/XXr6m2ufxo1LVYjeeDl0IuT3RsQkGM0gAwOheuWrQoTKjAlYYGhWcSEIG
	0spq39HlDHgZXJePiZocq/8cfkRsdNj3kEE2RM8s/eA1u1VYjhLtUkwbRRTCnbZUOw6i
	dU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DlmG7hzRagDkTdI6MyP5XoC2NlvDV7RMExcPXGV1dZs=;
	b=bqR3UJGzRhqZfhefZQl2WqumrGKn7YRHfz9ZGb1kmbjLbr7nCrr9WM4krMVMGRjx61
	Se/dTibBYTBPJ0by8ivxzDAWMV1g9Lhx9m0a2wXciY+HGysBiTO6AvCKC5ZI6cEAF8Qb
	w++g8YWbgoiEZOmzVUcKqia/tHL/QZCry2oDY4vlI8FZOw7qrLTXVyGqxbENBf8U84gv
	JBcOPNQ6TNjvNbSH4YfOHr2sLpLGjMNVtCXZHo+PE0tVyQR1U4sioNK9Ox2lbqcrtXlT
	vwlPtLetlyRuchfb9fx2QRoUQuPdi7e69IasMdoWh9nUupEcDFszVT+xf/mJpMoyRXCF
	eORg==
X-Gm-Message-State: AKGB3mJKyNyBtlxFiwgx2SyIeWVhJlw71oMaW8/3xs4WAveZMnH6wsxu
	O5JIAH6dAuzktllHMSu1WKM=
X-Received: by 10.55.104.198 with SMTP id d189mr12344526qkc.190.1513197895673; 
	Wed, 13 Dec 2017 12:44:55 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	n64sm1507938qkd.97.2017.12.13.12.44.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 12:44:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>
Date: Wed, 13 Dec 2017 17:44:27 -0300
Message-Id: <20171213204436.5379-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213204436.5379-1-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH 02/11] bcm2835_peripherals: move GPIO 'sdbus'
 property link from init() -> realize()
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jlLUR2pJK+Se

We can then use dynamic sdbus creation (from realized HCI devices).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..7f30f19c4c 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -112,11 +112,6 @@ static void bcm2835_peripherals_init(Object *obj)
     object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
     object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
     qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
-
-    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
-                                   OBJECT(&s->sdhci.sdbus), &error_abort);
-    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
-                                   OBJECT(&s->sdhost.sdbus), &error_abort);
 }
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -314,6 +309,10 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     }
 
     /* GPIO */
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
+                                   OBJECT(&s->sdhci.sdbus), &error_abort);
+    object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
+                                   OBJECT(&s->sdhost.sdbus), &error_abort);
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.15.1

