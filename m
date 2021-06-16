Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp487661lff;
        Wed, 16 Jun 2021 09:14:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtSvGv8LQMrpU2K8HPoA3VXvunsJvCcWwAwL6C5Pc+de5QblqE7hmoNdNvQqZVZUBuVKli
X-Received: by 2002:aa7:d413:: with SMTP id z19mr519720edq.37.1623860094724;
        Wed, 16 Jun 2021 09:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860094; cv=none;
        d=google.com; s=arc-20160816;
        b=0wExR8pb3eAzAvpPopyBel8DrtpZwuIokWH4Pj+dS9pEuJ168YcTc1wSSRvgeYA+uM
         IsvUI0S5RFrVWavaZ2VY9/niJ7VcF9GzrH5U3+0P/VAC/KBlC6EwP+DDqZwgoRlBg0ht
         Jk47aYDrQPDmn86D7/sduCZ0+ayc2X/B0AZuZkKhbXI67NDDZA3QoG8auKjwt1FRydjn
         2END1l1VcvohvPMUArCWGVCQXCU63J+3PgisE0lmyJN8i7uDI8IlTDAqYhZnKhKvTDAI
         FZpWtVgcKzfiiM0UWOMjl9GWzkm2/0HdByK7j5Q7j0pcZWZH8CLVomLJ8k+XauCio9Is
         2WCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OOAVeK2SUtssiX9xFTv7fMh9dyXYyrlGAXubT3GclZM=;
        b=lQrv1hxkwwp1FHSQtPuj19TL6l1bz5jXzJ5P9mKUksqDHXxgrpIQ4q+9vlZ6kLNVMb
         rK7MMJpfGnMp3OYEwgcTI8aP/klS9qwxcmn37rG7yK6BdYFm0L5xEfdRj6nzbDozTZee
         rHTw53xTNfyVwPtYYVXWklXQ5V5yxntUOSdDqZVfsXkPFMaUqWO6UEINq3AWEE+kclrM
         r/ndgR/nPA/UlD2xgzWOIf29PrG2RSWabLmsUhNpuW5N4zEZ+X/Dnl9AdhOkn/fXm8ab
         sm37UvZdbq7TEsFybuD6s/fTnxBefEmw4bX13Y169udG35uYZEdZ2FxfgxuhbvqSUs58
         kx3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SWmjggn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn13si2615369edb.501.2021.06.16.09.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SWmjggn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYBp-000212-Ep
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBU-0001MR-7H; Wed, 16 Jun 2021 12:14:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBR-0005j8-OP; Wed, 16 Jun 2021 12:14:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso4503782wmg.2; 
 Wed, 16 Jun 2021 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOAVeK2SUtssiX9xFTv7fMh9dyXYyrlGAXubT3GclZM=;
 b=SWmjggn2NyLwpquDy1iEpnAmE2g5E6r0fOmHQCxK36nA1RPN3OqXidgHI9Ao+gmJo8
 vYvdAdzRk2jWx6IdySEUKGu0vBUA7zlSBRha9qpd9NG2TcwZN0+pB1I+VcznvCddc11r
 LpmiYogpa13/+Y9espSPAJN0869eJSKSEX2eg3+SFYyinAcnwXqx223xMXEh95SXLV8d
 VnmvalnaDAbK1f1ygPDVUpYpIz4d1Oo71uFxhwRassA3Y3o+znu+FVZiSP21jc4LrLQ1
 DGVo5ArztM6kAhmzq0n5fy5MdClvpKyXwzGpwkZrvMvIB9nolHaLda9CfYAwk/wLKfw5
 5CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OOAVeK2SUtssiX9xFTv7fMh9dyXYyrlGAXubT3GclZM=;
 b=kgRRSUVxwnbrEqD8ILMMCzjaOZjmC6BkYGAkV+JUbgah4J6SeWeMj7vRY8KrEjyj7v
 yu6R6Ldd1puX+Cg7eM+yJUeZ6Cfl7G6AsU8ROiKQMoBi+6/dVgf9vEMe8XtOsl99btRB
 MpW4ZX5wxkFeEuP3K7tQrPsVi0gPN7LMH8nITX1Lsw0ukdUWfOp3dT5chSob3MWzualf
 g0OrIa/fYu86NB6utHm50xOekDAo+FsIALpVOnXIAbR/ZabMkChP5QhU/58KZMZ8NKSM
 q9sqEV2YO5v6ndtau17+OBj/lCiZKPLnYlJTtS4Qu2j/c51E8t7hLE58BTZekiiDMfLK
 d+Kg==
X-Gm-Message-State: AOAM531L6e5FQ1A+3pL/67Fbhao7OsUg9/Y5mesupK05b901TuskpDso
 MEVGIFzXT3AZnBXmCftFig8ShsdZX364NA==
X-Received: by 2002:a1c:59c9:: with SMTP id n192mr710160wmb.81.1623860065556; 
 Wed, 16 Jun 2021 09:14:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z5sm2567231wrp.92.2021.06.16.09.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] hw/input/lm832x: Move lm832x_key_event() declaration
 to "lm832x.h"
Date: Wed, 16 Jun 2021 18:14:06 +0200
Message-Id: <20210616161418.2514095-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4l+BrOl2Bixq

lm832x_key_event() is specific go LM832x devices, not to the
I2C bus API. Move it out of "i2c.h" to a new header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i2c/i2c.h      |  3 ---
 include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
 hw/arm/nseries.c          |  1 +
 hw/input/lm832x.c         |  1 +
 MAINTAINERS               |  1 +
 5 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/input/lm832x.h

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index ff4129ea704..850815e707c 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -142,9 +142,6 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
  */
 bool i2c_slave_realize_and_unref(I2CSlave *dev, I2CBus *bus, Error **errp);
 
-/* lm832x.c */
-void lm832x_key_event(DeviceState *dev, int key, int state);
-
 extern const VMStateDescription vmstate_i2c_slave;
 
 #define VMSTATE_I2C_SLAVE(_field, _state) {                          \
diff --git a/include/hw/input/lm832x.h b/include/hw/input/lm832x.h
new file mode 100644
index 00000000000..8e21fb76452
--- /dev/null
+++ b/include/hw/input/lm832x.h
@@ -0,0 +1,26 @@
+/*
+ * National Semiconductor LM8322/8323 GPIO keyboard & PWM chips.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski <andrew@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_INPUT_LM832X
+#define HW_INPUT_L
+
+void lm832x_key_event(DeviceState *dev, int key, int state);
+
+#endif
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 0aefa5d0f3e..7b82b8682e8 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -34,6 +34,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/blizzard.h"
+#include "hw/input/lm832x.h"
 #include "hw/input/tsc2xxx.h"
 #include "hw/misc/cbus.h"
 #include "hw/misc/tmp105.h"
diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index 4cb1e9de01f..d2b92b457e3 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/input/lm832x.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 636bf2f5365..c56bc112ccf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -792,6 +792,7 @@ F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/lm832x.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
 F: tests/acceptance/machine_arm_n8x0.py
-- 
2.31.1

