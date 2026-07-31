Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BBFC5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmIK-0000CN-FJ; Fri, 31 Jul 2026 08:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmIJ-0000C9-Ok
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:24:55 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmIH-0006wN-W4
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:24:55 -0400
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so465575f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500692; x=1786105492;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W8IM84HQwR+GmEFj4f2b5VofQX2ndjN7l5cc/QZMq3s=;
 b=L0Bz2EAO3jhLMS5Ajai2Ew5im47T7jNPE1vF8EiRpkPrjRuq+tnhz64B+tHkP8JFiD
 7/fzuzqHcSYOebsyBuPo/XAb17GSOxo2znwcpn7c77oxCTcxNRlS873ZJAi/nFtMOS3+
 esns63oK4j+gzW+2klXxBE5Ge8S6HmVE5OjNI/PEjCmWe2BTUcg8xbKMAqY78Klk+UXR
 cheVW8gDzHjqAdMeGVT0IwMvLHcSR38xr2hbsEay+RR0OM7KKhega+E8NU2oNaR77K2H
 17NS5D2pTgqIytNTcMBj/sMO+3BPw2rykMZ2pik5JmHJuS/kr6voL5B5yfVQykgO2+br
 63Mg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlF9zASvMhdkcH83s817JlVKCnm9cbOrIVL+9lnS44YvaJNGwolzQHZ2Sr2AT+qN87UE4sEia0Eg==@nongnu.org
X-Gm-Message-State: AOJu0YyHQUMtmzazqlEKRo62CTDqYyqgiDc4myr1JAZyf/2uFzsy6YHn
 sR701HEzOFRgnGodqgnntvoi2qoSolrJl5jzNMC4GDpVAvOTGaVa+dBV
X-Gm-Gg: AR+sD12i6348xkIo/o+9eWKs6mMC5BtHJeovM5F23CA8IQOSRHidaqKQSSX4JD8PFPh
 P1p9qsgRncNXfGz+ENp9f9sD3esNznNE/Fw3mm4aMObyd7KReYY+uiAemiLmCme1qaQyOEDBld9
 KjTiyVsEldEWThZcCeN5DuSGhRRJc9N/DV0QhTVuQEUEJ3jjuoQBhPzgNURdHrfwXp30dyJqsII
 UjQTJwYSFEBkxdJpd1EyxAqyonjcvA2ut0pT2uVnnVDEUjwF7lt1nHZ9rDMIA4KhrZnOWpf6szn
 OT4qoa97JZb1UBN6sxcG2SH1lh4mLi+gh8GlLqLpGrnDRKE6MO55O50k1a7ULVPJtpYXugqC2Ve
 XG21ps1lIu1Fqi9TYrunsEsyFi7UpmsKb8L5y/C3R83N4QFxQbLoyY2qW8ruXnvN7hX/axfpi+r
 kGH4vCzB+PKc/irpfskI1HMRVCMhv+kOIxD65kEsceN9Fa+kjX60JUWT3CzFGCfp/HqgkvLL5C9
 wLDKCF7dk6eEPNAW74OQtpYe322MhZRQ3uv
X-Received: by 2002:a05:6000:178a:b0:47f:d072:87d7 with SMTP id
 ffacd0b85a97d-47fd2abab7bmr3954083f8f.9.1785500692238; 
 Fri, 31 Jul 2026 05:24:52 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456a5a4sm4341229f8f.20.2026.07.31.05.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:24:51 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:00 +0200
Subject: [PATCH v2 01/25] hw/sensor: tmp105: make device state private to
 the implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-1-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494707; l=3828;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=2PsFiadmEidEKMJIZBsHzExJztIGcn8WD0wRouSeWs4=;
 b=qI6Pe1NAfhoE3o3F7JNmzS9/eZ20JQVfOwpYafN0/yieFYcg5BQruxFL9rY4vFS9U+E+9nOaR
 n+/8JHlBGpfDaJNxkE4Ok0LI2s+pe8kDPAXAugXd1aGa4Kv8qDGdMbE
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The TMP105State struct, its cast macro and typedef are used only within
tmp105.c. Move them out of the public header into the source file and
drop the now-unused includes; the header is reduced to the TYPE_TMP105
name, with its guard renamed to the path-derived form per current QEMU
convention.

While here, normalize the source file include order to match the other
hw/sensor devices.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp105.c         | 45 ++++++++++++++++++++++++++++++++++++++++-----
 include/hw/sensor/tmp105.h | 40 ++--------------------------------------
 2 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index c5089d74f4b..6069c0905d9 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -19,16 +19,51 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/i2c/i2c.h"
-#include "hw/core/irq.h"
-#include "migration/vmstate.h"
-#include "hw/sensor/tmp105.h"
+#include "qemu/module.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/module.h"
+#include "qom/object.h"
+#include "hw/sensor/tmp105.h"
+#include "hw/sensor/tmp105_regs.h"
+#include "hw/core/irq.h"
 #include "hw/core/registerfields.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
 #include "trace.h"
 
+OBJECT_DECLARE_SIMPLE_TYPE(TMP105State, TMP105)
+
+/**
+ * TMP105State:
+ * @config: Bits 5 and 6 (value 32 and 64) determine the precision of the
+ * temperature. See Table 8 in the data sheet.
+ *
+ * @see_also: http://www.ti.com/lit/gpn/tmp105
+ */
+struct TMP105State {
+    /*< private >*/
+    I2CSlave i2c;
+    /*< public >*/
+
+    uint8_t len;
+    uint8_t buf[2];
+    qemu_irq pin;
+
+    uint8_t pointer;
+    uint8_t config;
+    int16_t temperature;
+    int16_t limit[2];
+    int faults;
+    uint8_t alarm;
+    /*
+     * The TMP105 initially looks for a temperature rising above T_high;
+     * once this is detected, the condition it looks for next is the
+     * temperature falling below T_low. This flag is false when initially
+     * looking for T_high, true when looking for T_low.
+     */
+    bool detect_falling;
+};
+
 FIELD(CONFIG, SHUTDOWN_MODE,        0, 1)
 FIELD(CONFIG, THERMOSTAT_MODE,      1, 1)
 FIELD(CONFIG, POLARITY,             2, 1)
diff --git a/include/hw/sensor/tmp105.h b/include/hw/sensor/tmp105.h
index 244e2989feb..daece592e9b 100644
--- a/include/hw/sensor/tmp105.h
+++ b/include/hw/sensor/tmp105.h
@@ -11,45 +11,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or
  * later. See the COPYING file in the top-level directory.
  */
-#ifndef QEMU_TMP105_H
-#define QEMU_TMP105_H
-
-#include "hw/i2c/i2c.h"
-#include "hw/sensor/tmp105_regs.h"
-#include "qom/object.h"
+#ifndef HW_SENSOR_TMP105_H
+#define HW_SENSOR_TMP105_H
 
 #define TYPE_TMP105 "tmp105"
-OBJECT_DECLARE_SIMPLE_TYPE(TMP105State, TMP105)
-
-/**
- * TMP105State:
- * @config: Bits 5 and 6 (value 32 and 64) determine the precision of the
- * temperature. See Table 8 in the data sheet.
- *
- * @see_also: http://www.ti.com/lit/gpn/tmp105
- */
-struct TMP105State {
-    /*< private >*/
-    I2CSlave i2c;
-    /*< public >*/
-
-    uint8_t len;
-    uint8_t buf[2];
-    qemu_irq pin;
-
-    uint8_t pointer;
-    uint8_t config;
-    int16_t temperature;
-    int16_t limit[2];
-    int faults;
-    uint8_t alarm;
-    /*
-     * The TMP105 initially looks for a temperature rising above T_high;
-     * once this is detected, the condition it looks for next is the
-     * temperature falling below T_low. This flag is false when initially
-     * looking for T_high, true when looking for T_low.
-     */
-    bool detect_falling;
-};
 
 #endif

-- 
2.50.1


