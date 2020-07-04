Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3394983lfm;
        Sat, 4 Jul 2020 07:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLpCkHQI3u2jWAYkE98YKOktJIjJmdQYuwKIkrO4dFAJ4ReOvtWmnR0SQ6SCQcXd3oxqX5
X-Received: by 2002:a25:2b43:: with SMTP id r64mr21828354ybr.177.1593874678739;
        Sat, 04 Jul 2020 07:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874678; cv=none;
        d=google.com; s=arc-20160816;
        b=NJxdrTI2xsT1vqTE0Z1a6LKIchfvlFixgGxtN4pl0Itp7xUicaDCoGnytGy/07RP4S
         1xnxGT47on3rWg5IBSAshm4+CM8UvkODO5SdxoK3fUqQWwN4JYwc5dAbr8jG75CN00Jc
         YIa/QDu73T3YJO+lo3SgMV3kdNiEBKXjGHNPCwaif9FDm+xk11uYHY6+RNTha5jIDC6s
         mF9FloMKc4XIi8L/dl99lYNJnkQdwpRANxky7NJPJriwua6g6A6sDWmaPHi7lFInrHTH
         pfoSWfEHbRldiRdpj8XV5ErjXIg6IFJDiI8UQ2YT52mEi4AH4I/BBgefM2JQTdeMHjBG
         8FIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F2y1uml1RkFfNsOb+m2iyzdDwj1uXo3NnuLQTrqdA9s=;
        b=NX/kk0tAjEhvKSqSbCZA/4tegAnamm8F+Bcpfk6qVytaHtFkBBjfV4FTRIw4+ywioo
         xEdHt7iTyvdU/sfsjaNYW+Q6SSnZV733bXlQJ1L7MdZD8gVbJoosU6xROUfCqgnm6sWA
         McFnXv2abVDKe/eW5KbwDMNGgvs1vRYyZkZVtHrXwFUi1xPEbuBUV6aH3ldh/6j+SFC0
         O7MhGkCBeH/GPjiJWj0htgb1r69fnhN0oEQMCZM+nhWqlcanVVIeENIgE/KBphTiikeF
         MW5l37aDwAbFosaMmbdOuQQw9iqHm7ucU9DOyJd1reyra8RAKJDExO5fscMCEgrgVQtf
         xutg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XuFU4CBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s65si15512462ybc.138.2020.07.04.07.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XuFU4CBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjc6-0007FF-24
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUk-00026x-A7; Sat, 04 Jul 2020 10:50:23 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUi-0003nE-Cs; Sat, 04 Jul 2020 10:50:21 -0400
Received: by mail-wr1-x441.google.com with SMTP id s10so35719344wrw.12;
 Sat, 04 Jul 2020 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2y1uml1RkFfNsOb+m2iyzdDwj1uXo3NnuLQTrqdA9s=;
 b=XuFU4CBE8JCcfpdI/mR5sE2jyMeyBckQOwPMTtzwJf8CjscRTofonY09HxmwJm00NE
 hgXaGKtjBGKgBEytwuJ+1LT1UMvcBupnCU5041RZtHT4vwcBWQo/M/+GghnU6sLvVTLF
 Y0OX5yURCQg13pYSivq8FFPYj7wg8wOD1j0jENHOgxaRTzOtllVlw7cjPNFn2IWH1BIq
 Sm6KuoljtLR0LbF6gX5rfDBtKX6CprkJZYeXQzCIGgZcLZdQ6vORkbiRnRe5hvsbF/uS
 OWFgKWrvnxxqFL1fM5rMPeqOvIkLQG0cFB/v/CHa/YpQquR2m9B6/D1fPzqQ7wWU0wd9
 8j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F2y1uml1RkFfNsOb+m2iyzdDwj1uXo3NnuLQTrqdA9s=;
 b=pv44Hed7e11VRFYiGl8UVgkq++UfjT45DGAmMYNHhJiII+W9DhZ3P1w2K/CyIFDl6o
 NhSOhgJnUZJfP36rE5MkzbJklQ7XCO/BcQbGuZVLSzw6GBc2I2nEn4/Sd6KEUhzRKudn
 yqA/lCL1wn2947pSbKjcyhx5qRWZvVfoYzRDDyocMMajyunA2TlWTShSeOT5e+bngFik
 nz7uX6mhr5dSd5lMKFQ6BwaMcx+32uMUenUdFg+Mu5bwExQ1HmJ2qXjQYSmbM2ODMF74
 2jCSlaGlthOQC7Fw4CYbxBJldBhxHw4u4RH0s1NVvMbdclC9G6Ok4+kdPFMx2cmSsVeY
 etzA==
X-Gm-Message-State: AOAM530BXLfTbMt7KzcB17RL3jZZE2Rm225HDmKjWib0F3xXKej4AMj/
 nqEQQilgr+Ifx0of7B5JMHBco5xQF8o=
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr43778986wru.115.1593874218068; 
 Sat, 04 Jul 2020 07:50:18 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 15/26] hw/usb: Add new 'usb-quirks.h' local header
Date: Sat,  4 Jul 2020 16:49:32 +0200
Message-Id: <20200704144943.18292-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bww5XM9bWu2N

Only redirect.c consumes the quirks API. Reduce the big "hw/usb.h"
header by moving the quirks related declaration into their own
header. As nothing out of hw/usb/ requires it, keep it local.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/usb-quirks.h | 27 +++++++++++++++++++++++++++
 include/hw/usb.h    | 11 -----------
 hw/usb/quirks.c     |  1 +
 hw/usb/redirect.c   |  1 +
 4 files changed, 29 insertions(+), 11 deletions(-)
 create mode 100644 hw/usb/usb-quirks.h

diff --git a/hw/usb/usb-quirks.h b/hw/usb/usb-quirks.h
new file mode 100644
index 0000000000..542889efc4
--- /dev/null
+++ b/hw/usb/usb-quirks.h
@@ -0,0 +1,27 @@
+/*
+ * USB quirk handling
+ *
+ * Copyright (c) 2012 Red Hat, Inc.
+ *
+ * Red Hat Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef HW_USB_QUIRKS_H
+#define HW_USB_QUIRKS_H
+
+/* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
+#define USB_QUIRK_BUFFER_BULK_IN        0x01
+/* Bulk pkts in FTDI format, need special handling when combining packets */
+#define USB_QUIRK_IS_FTDI               0x02
+
+int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
+                   uint8_t interface_class, uint8_t interface_subclass,
+                   uint8_t interface_protocol);
+
+#endif
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 18f1349bdc..8c3bc920ff 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -549,15 +549,4 @@ int usb_device_alloc_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps,
                              int streams);
 void usb_device_free_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps);
 
-/* quirks.c */
-
-/* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
-#define USB_QUIRK_BUFFER_BULK_IN	0x01
-/* Bulk pkts in FTDI format, need special handling when combining packets */
-#define USB_QUIRK_IS_FTDI		0x02
-
-int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
-                   uint8_t interface_class, uint8_t interface_subclass,
-                   uint8_t interface_protocol);
-
 #endif
diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index 655b36f2d5..b0d0f87e35 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "quirks.inc.c"
 #include "hw/usb.h"
+#include "usb-quirks.h"
 
 static bool usb_id_match(const struct usb_device_id *ids,
                          uint16_t vendor_id, uint16_t product_id,
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 417a60a2e6..4c5925a039 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -45,6 +45,7 @@
 #include "hw/usb.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "usb-quirks.h"
 
 /* ERROR is defined below. Remove any previous definition. */
 #undef ERROR
-- 
2.21.3

