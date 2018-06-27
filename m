Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5900183wrq;
        Wed, 27 Jun 2018 00:37:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcYRxmMPcxHF7SXyHM/oVV0LH6WJSVhRcrpVqUgKWpFB1aADS2TZVdm9Y7zghAeN4DFSaBX
X-Received: by 2002:aed:3624:: with SMTP id e33-v6mr4355965qtb.22.1530085043880;
        Wed, 27 Jun 2018 00:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530085043; cv=none;
        d=google.com; s=arc-20160816;
        b=sMJ4MtJuy2PRf6WBGfBpd8soL6xXfBefu7vuw33hji1iZ50RNwhxRVmP9j5j9tH6Jq
         Tv904Qr/bYszQYKfAA1ZM514M/yv52T+G2Cl+ORYvHmI9IjRB5HzutI0QPxAE0SxDdO9
         hpp7IhbfMTj//PaXgo/eSYLiZBrNTBZNpczgCKvOk7nDOO/62nEkLxuoGN3QJI3HFwO/
         q8mW9qZYJKj0koB91pyuwrxTCL3kZcbf4Ttn/fFkwjYzgmcCvNzMcA2wEWNYZwYEjiAg
         N+2QF6JumLahCjttc1i/nWPsEly0NmcLp5qxAfPao4kote4n3V6bXFsGLfoPihYiKzMx
         /4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CJmUN/wKn1oYAnVQoug98xhwknlJuF1F2nua5zoa8Y8=;
        b=nDCc1TL/70ir/pSxwfeAfcALyqBYr5/sSrfqIZfSXgGierY2d8MXcRE5da7ZQlRJ1u
         ge1yS84+BdK6AnBzxm1+Ut3oJR7V1Mc65bdbrYJfBwK2tYcXmMlfBSLPySpQsR6ck58f
         vOYtwPk/lxdhbqyFxrYRY3wn9AdY6zv9dJJvsLfFbkxKXmwt1sneK+cZb3nc7OxKGqXk
         ajzhu+pCHQSNoCa41S1V4mfoQPVh0SkfSI9ZXRhCvSxmITnR0OlIrd+pSr5SA6JNa5rr
         dhiSh7zo+owtH+Q099CK/S3h+8AA7+PQoRu6mDlAgrJYt9w7P2bBra92JzZCdKkP4ktj
         uQ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16-v6si3244373qtw.391.2018.06.27.00.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 00:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY511-0001Hg-8r
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 03:37:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1fY4y3-0007iq-Ei
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 03:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1fY4y2-0005rX-Jk
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 03:34:19 -0400
Received: from steffen-goertz.de ([88.198.119.201]:51464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1fY4xy-0005n2-IZ; Wed, 27 Jun 2018 03:34:14 -0400
Received: from localhost.localdomain (tmo-096-88.customers.d1-online.com
	[80.187.96.88])
	by steffen-goertz.de (Postfix) with ESMTPSA id 611DC49364;
	Wed, 27 Jun 2018 09:32:46 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Wed, 27 Jun 2018 09:33:47 +0200
Message-Id: <20180627073351.856-5-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627073351.856-1-contrib@steffen-goertz.de>
References: <20180627073351.856-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-devel] [RFC 4/8] arm: NRF51 Calculate peripheral id from base
 address
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6MzU03PnvX0

The base address determines a peripherals id, which identifies its
interrupt line, see NRF51 reference manual section 10 peripheral
interface. This little gem calculates the peripheral id based
on its base address.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index bfcacdf447..e93699a4b0 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -23,8 +23,6 @@
=20
 #include "hw/arm/nrf51_soc.h"
=20
-#define IOMEM_BASE      0x40000000
-#define IOMEM_SIZE      0x20000000
=20
 #define FLASH_BASE      0x00000000
=20
@@ -33,12 +31,19 @@
=20
 #define SRAM_BASE       0x20000000
=20
+#define IOMEM_BASE      0x40000000
+#define IOMEM_SIZE      0x20000000
+
 #define UART_BASE       0x40002000
 #define UART_SIZE       0x1000
 #define UART_INT        2
=20
+#define RNG_BASE        0x4000D000
+
 #define PAGE_SIZE       1024
=20
+#define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
+
=20
 struct {
   hwaddr ram_size;
@@ -177,7 +182,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
         return;
     }
=20
-
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
     if (err) {
         error_propagate(errp, err);
@@ -204,7 +208,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart), 0);
     memory_region_add_subregion_overlap(&s->container, UART_BASE, mr, 0)=
;
     qdev_connect_gpio_out_named(DEVICE(&s->uart), "irq", 0,
-            qdev_get_gpio_in(DEVICE(&s->armv7m), UART_INT));
+            qdev_get_gpio_in(DEVICE(&s->armv7m), BASE_TO_IRQ(UART_BASE))=
);
=20
     /* STUB Peripherals */
     memory_region_init_io(&s->clock, NULL, &clock_ops, NULL, "nrf51_soc.=
clock", 0x1000);
--=20
2.17.1

