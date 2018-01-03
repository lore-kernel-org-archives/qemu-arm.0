Received: by 10.223.134.117 with SMTP id 50csp12110314wrw;
        Wed, 3 Jan 2018 08:25:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBouUxv4B8nVJMIU9gjoz1KKxNC4RWNc0yzLCpL0Qi4iq9RGgdQAKfkZsTa9I0x2kmaIQy0NR
X-Received: by 10.13.218.134 with SMTP id c128mr1726503ywe.174.1514996707605;
        Wed, 03 Jan 2018 08:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996707; cv=none;
        d=google.com; s=arc-20160816;
        b=d9DRoCY7ODxPnhnCvwGd9s2SDEguGl2xKs0zGkhKuqDX18SMRYyRF42xCjeSoGqQ09
         Z2sdRYgxCa9vJCtD3x4jLlbivpOwK+b4sfduKJ6R8yNxsUNaxUScwVoPspb8nvXZkyag
         cupMxy/ZS6ohNvZNX48i82uh6PGvVZVFjLx6ZCmXJikgWr12puloWMKZyedCw9cxumAg
         Go3TfU4oZmzMb6rv6sdSMkC7kn4WBV7sQxOKDxuotpyZEwayU0cXYkyBBwCHwf4xhadh
         rnggCbf10oGhqXpIsIF9SZoAqMy0KFNg9/KN5Gr+zbP/nDIuN7DtA6Yew1fTm9nwgcyC
         HF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=C9xu7pU0JP7H27FBhIoTSr/YD1UZU8NVLPiMG4CFmyk=;
        b=My9rshLWp19hWQtiQKav+JMtlC+qwQvEZ3rNZ2uKKzfDmgaWesHUQ774R4UOJbPU1r
         mdlr9xfrps7SHX3IMC3AOv2pODhuAbsrfwH39x3OvrI5LYesOrUX7mnzeQ6R88of2ZMf
         W1Cnvhkt1no3g1eZyYa4BpiH5JYnC9ccSKxVMxYM4xcWXn+J8ism1MFuK4UDJA2sZlVw
         p+nGd8lQOCSPF14G75kA+duJNi2pzZIKaiBvep+swng+cLayBai+LjGglXTs6ESkGVhu
         TYFtjqmm+XuPRwG7DlXenkwiBk4q6dAGCYRR/qtxiytmuHbTPuhtg4hI3bq41+9LEk0A
         VSXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IgHcdzsa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n190si278395ywf.537.2018.01.03.08.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IgHcdzsa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWlqk-0004Hk-VZ
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:25:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq6-0004Ee-Q4
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq5-00055m-BO
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:26 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:42557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlq5-00055Z-70; Wed, 03 Jan 2018 11:24:25 -0500
Received: by mail-qk0-x244.google.com with SMTP id d202so2156952qkc.9;
	Wed, 03 Jan 2018 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C9xu7pU0JP7H27FBhIoTSr/YD1UZU8NVLPiMG4CFmyk=;
	b=IgHcdzsa70JhPPEuWiCJY2wylpGrZLkapYsGc/AhkjQ6YdCSkLCRE70jhQMSYrkWWs
	B1ylniKI2akMNwkV5Esr8MbBeSDurDsN/jYKFdSxHODW7OxdZ9en0EOHRYuBdg1+zS9L
	IRzmGvgAUsDYE0IW5y2Vgw7y7a8xen1hYzsYAzxxr5WTZDfGVuS0GZsw2COEqsV2lQrV
	8QM7xeRMuqB9g6LDu/yQPtgtUFzEiNLClwXtz7mSZZbHEVS3WHqKFZariHi83A87if1E
	T6Ducn4KfWnnRGdNt+5f3wO4x5qfsQpiWKCYcTESKgQgx3wYKyeyfiyHVCkNDeR07DVA
	3GYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=C9xu7pU0JP7H27FBhIoTSr/YD1UZU8NVLPiMG4CFmyk=;
	b=pLpzaTZzJN+mXJVozx5LZ3tTRqN9gcj7wtwbOGimXQNMbAlxGJtQFiT787Ze+/Dfue
	SvO6gK0IxnteoTLb3t41AbQHaJ1I3V/QyKRPcpBm5/iBQZmMTfS+ghd+HJxuoC/R3rOW
	9tESDHDBHkPT7ARrIsHhAahPmE7xjp3LOoxtNlUynNeOYWu44e+8JR5eUdfkGRAkvWuQ
	bXeYIRQpM/npaeOrTCVdQF1oAAPvLzZU4k9l7l1dYiyRXscpRJC6srCRNV3i1Br41kRx
	Z2HNi2mMD714pVB5NyrwyYcqe4l0DQ+fGG8V7xrfB6FvRwdLJLRezPagYC8lbzE7JfwY
	8fLw==
X-Gm-Message-State: AKGB3mLD/hhP2m8v5ahL/IYONiPJpODlUuR2+wDYfAgauQSFHbB2besE
	jnSxezJG0xhnSuLDuJxpp3U=
X-Received: by 10.55.50.198 with SMTP id y189mr2106857qky.255.1514996664701;
	Wed, 03 Jan 2018 08:24:24 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>, Stefan Weil <sw@weilnetz.de>
Date: Wed,  3 Jan 2018 13:24:00 -0300
Message-Id: <20180103162400.10396-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH 6/6] hw/sd: move sdcard legacy API to
 "hw/sd/sdcard_legacy.h"
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
X-TUID: n7kSyiFFn+E7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
roughly 2 users left.

 include/hw/sd/sd.h            | 17 ---------------
 include/hw/sd/sdcard_legacy.h | 51 +++++++++++++++++++++++++++++++++++++++++++
 hw/sd/omap_mmc.c              |  2 +-
 hw/sd/pl181.c                 |  1 +
 hw/sd/sd.c                    |  1 +
 5 files changed, 54 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/sd/sdcard_legacy.h

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 96caefe373..a342e7bc3e 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -114,23 +114,6 @@ typedef struct {
     void (*set_readonly)(DeviceState *dev, bool readonly);
 } SDBusClass;
 
-/* Legacy functions to be used only by non-qdevified callers */
-SDState *sd_init(BlockBackend *bs, bool is_spi);
-int sd_do_command(SDState *sd, SDRequest *req,
-                  uint8_t *response);
-void sd_write_data(SDState *sd, uint8_t value);
-uint8_t sd_read_data(SDState *sd);
-void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
-bool sd_data_ready(SDState *sd);
-/* sd_enable should not be used -- it is only used on the nseries boards,
- * where it is part of a broken implementation of the MMC card slot switch
- * (there should be two card slots which are multiplexed to a single MMC
- * controller, but instead we model it with one card and controller and
- * disable the card when the second slot is selected, so it looks like the
- * second slot is always empty).
- */
-void sd_enable(SDState *sd, bool enable);
-
 /* Functions to be used by qdevified callers (working via
  * an SDBus rather than directly with SDState)
  */
diff --git a/include/hw/sd/sdcard_legacy.h b/include/hw/sd/sdcard_legacy.h
new file mode 100644
index 0000000000..882e13a8f1
--- /dev/null
+++ b/include/hw/sd/sdcard_legacy.h
@@ -0,0 +1,51 @@
+/*
+ * SD Memory Card emulation (deprecated legacy API)
+ *
+ * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in
+ *    the documentation and/or other materials provided with the
+ *    distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+ * PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+ * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+#ifndef HW_SDCARD_LEGACY_H
+#define HW_SDCARD_LEGACY_H
+
+#include "hw/sd/sd.h"
+
+/* Legacy functions to be used only by non-qdevified callers */
+SDState *sd_init(BlockBackend *blk, bool is_spi);
+int sd_do_command(SDState *card, SDRequest *request, uint8_t *response);
+void sd_write_data(SDState *card, uint8_t value);
+uint8_t sd_read_data(SDState *card);
+void sd_set_cb(SDState *card, qemu_irq readonly, qemu_irq insert);
+bool sd_data_ready(SDState *card);
+
+/* sd_enable should not be used -- it is only used on the nseries boards,
+ * where it is part of a broken implementation of the MMC card slot switch
+ * (there should be two card slots which are multiplexed to a single MMC
+ * controller, but instead we model it with one card and controller and
+ * disable the card when the second slot is selected, so it looks like the
+ * second slot is always empty).
+ */
+void sd_enable(SDState *card, bool enable);
+
+#endif /* HW_SDCARD_LEGACY_H */
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index e934cd3656..9cfdc7a6ad 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
-#include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index ce696c5d7d..7591d016cd 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -12,6 +12,7 @@
 #include "sysemu/blockdev.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 35347a5bbc..7755bedfa0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -34,6 +34,7 @@
 #include "hw/hw.h"
 #include "sysemu/block-backend.h"
 #include "hw/sd/sd.h"
+#include "hw/sd/sdcard_legacy.h"
 #include "qapi/error.h"
 #include "qemu/bitmap.h"
 #include "hw/qdev-properties.h"
-- 
2.15.1

