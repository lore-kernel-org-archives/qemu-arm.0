Received: by 10.28.71.27 with SMTP id u27csp679669wma;
        Mon, 12 Feb 2018 20:21:59 -0800 (PST)
X-Google-Smtp-Source: AH8x226cMyfUX3nw/1gjanpvkLJMoA58X6vA/5Vr6xT2r9TbXPfN5gtTyx+9m+o/yfh7nxt57fL1
X-Received: by 10.129.74.139 with SMTP id x133mr9864576ywa.400.1518495719180;
        Mon, 12 Feb 2018 20:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495719; cv=none;
        d=google.com; s=arc-20160816;
        b=mycsO3VZ7HawehxmLPN+E8EACvwGvxb6yVOueaHigQDzbnbCmayxk7MVUAvjBzu/D8
         dHvk/pWy6thl2PuTV+hY1rWu+WJMBLk+Widz5uGYeBexNpOg7crHbYFmDMyiZevro7AH
         QwjLVBcthOLpVM5u1viF7l1KgcDQaMR6mvRpMACIyE0IGyZiCom6ljIp2gIv0LAaZV++
         TNCwfLLCqB8qa1JXWwdz6P91pBYHBoROVs/sIxzHk24zpVSCbWGj4PjyHZnO5kHkiSsp
         0V+5/p2ffNgAZg/UWQGjMBvLD3mlzRA1BriCScV4/TmlTR0tVB21xytFWGHzjU01mEnY
         /7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
        b=ihMDKWk7CMM8KcsSpiPKsTNKc88NpCJ7zB6+Kdi6ku3b7RdOVJH96hJITzwyUcH19b
         QknJrhb8iJ/oeNHz6vbqwfBNr/wlUq6U3w9AnJZYmNRhbn94lTbX517DqaM4VNwkhaOy
         PpOPrwrfI3xbwy9NGtkr87W7iH10x8tS1cs/FZRDtnN+UzLxIL9FDYlJfJEN9zBwMyhz
         H6XmUiz8MEEWVG5BFDC47QZrGzDk05qVaJqKu7O0AW3Lx9uHb4jAqJNIHGwTly6vi3NG
         DNO/IVKnXSCPQKnhbiQ/haomcWFvZL78tk0Hb5Y0KaWir6AqsyZtvg3CMxFa+xBPbYbY
         +Krg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e7Q0vjOZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si1769842ywa.221.2018.02.12.20.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e7Q0vjOZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS6Q-0003PF-Ij
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:21:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuZ-0001jo-NC
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuY-0008WT-S3
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:43 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuY-0008WI-My; Mon, 12 Feb 2018 23:09:42 -0500
Received: by mail-qt0-x243.google.com with SMTP id q18so2238433qtl.3;
	Mon, 12 Feb 2018 20:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=e7Q0vjOZMjFNqTibOZT7ah02n1F9Wns8Tr058+5eQ6R8t8lc/ewceoXcdwn8YNvemD
	Pz/AblUcEr5U9YBOXRi4wJvQm7HTBqlVZ1ni6Xk/hF66eNjfZlRA0hWVTRC+2xIxsKBb
	WP4XXvmsRwMl+pl4qwNy8VkM74dILrygyDQhLbp+v/aNiLbzTOW25bosdYggfzJ8w8nt
	6cXuRPkDNupyGeCxhOEvxlpUmN+mP9mIZvL8eiNkhjmtEP+n/l6WeUrxWW5gZ8nhJ9xP
	5JFBgXNIzGfcTx7N/lULxwUO7r4MqdVgPR6koUnhD1IKu6u37hrTFQEcubXqHbmn2HAS
	3pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5qaGRwDZfwX37p33tGyHNiBbUOeIBUssXi21Pjx552M=;
	b=cDze25uFfoTjkBmb0J4hUbqX3PQacAUCFtvu5v+8oUybkfIMdWUuM2R1TOzlQznida
	WUf42UbEGtgsef25eFtz9WvnBoSGCSxNXTbDZDKUysMt4bo6wYnV/qRks+I5VG+qpUeo
	oqJ9qdRBEaHzFuLFfwvvRZLoOzLyEUH3L+MctcTzn6Gb7Xx2wN9YywC+fILu7R2zhXxP
	eHMxeiAik87OaOGT1jiRypCea4+n3bnV2CqeWS06h2xAO9pLUgu9/tV+MwYIu1xtZxyr
	yCh85I4ScHiW6yboaRG1G9qycBqoMkR3QcZoIGfIKJjkaQ3PRAM1Ns+98PhQd8JENR6u
	OGDw==
X-Gm-Message-State: APf1xPBetevnjlpWq6pyrjBr8tLTQU2WGIcHKQPjkOhlEQzq9E8suxsX
	0aIc26NlL8UrwNXEXY7n+VFzcseO
X-Received: by 10.200.33.195 with SMTP id 3mr21745779qtz.1.1518494982334;
	Mon, 12 Feb 2018 20:09:42 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:08:05 -0300
Message-Id: <20180213040809.26021-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v13 26/30] hw/arm/xilinx_zynqmp: fix the
 capabilities/spec version to match the datasheet
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
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dtUV4xZYQTTN

checking Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index ca398c4159..e39ad73bec 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -53,6 +53,8 @@
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
+#define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -387,22 +389,27 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        char *bus_name;
-
-        object_property_set_bool(OBJECT(&s->sdhci[i]), true,
-                                 "realized", &err);
+        char *bus_name = g_strdup_printf("sd-bus%d", i);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
+        Object *sdhci = OBJECT(&s->sdhci[i]);
+
+        /* Compatible with:
+         * - SD Host Controller Specification Version 3.00
+         * - SDIO Specification Version 3.0
+         * - eMMC Specification Version 4.51
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                        sdhci_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                           gic_spi[sdhci_intr[i]]);
+        sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
+        sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
+
         /* Alias controller SD bus to the SoC itself */
-        bus_name = g_strdup_printf("sd-bus%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->sdhci[i]), "sd-bus",
+        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
                                   &error_abort);
         g_free(bus_name);
     }
-- 
2.16.1

