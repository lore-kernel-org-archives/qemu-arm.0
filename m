Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp19986nji;
        Mon, 26 Aug 2024 23:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmmygeQmgBjSveS79abUW2G7fwMy6GbASkBq5yordNAb/PZT0H3Y7wFSp01jaMginisDKQ1PF9vWxzCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFJlIwnJtAkEp32GtGiB/zyr331ICNh6WXCw2/Q/OCMpKDJoQXqaTXUgI6kv8zj9Dqqadm2
X-Received: by 2002:a05:6102:548a:b0:492:a6fb:23cd with SMTP id ada2fe7eead31-498f451fb2cmr16831978137.6.1724741396581;
        Mon, 26 Aug 2024 23:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724741396; cv=none;
        d=google.com; s=arc-20160816;
        b=MK0ms0HvU23511Sp/CWE9AO77RnVT3yZzAiCRHESphMNyuussYtcSUVodPYdE3l25O
         xOVqVblO7vO2ukCWASNhC4quafINMQ3iC95UFJicsW+0emnhzxsKFERCNsmW8EC4TYIG
         CVa/g2hgmpeQVTG1uOAnPFo0NHdZ2r3Vm7gEcOjFRcu++RwWPznddPMT9mgIVmlKKhGz
         BbAPBM6sWvdkVulHhy41oKCXG/fOpQ1cgE1TX0jSVUhaBhYMgL+gttEnsW4ZbGEqswLK
         sPS6amSx6wBtJM1tWlhmLzWQju58/NYjvWSE0pDddNGwAvIqOT5QhCjCna7eNBg9B7EQ
         FuHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=bhR+L35SiqjkW6TlKGX3ijIk2Na9K+5U5H9NOs890v8=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=hd9BHvH+g4laWeH0TDbXtlWXr/s+7pCSOYSNCNqKMWriz4i1jv1pQHxpKXVhWY10xN
         kTI2sqFlS1KRWLswsePknBlQV25IX8gmwHlLesj/xAcqK13NxI9n7UXNfDfbV8/X1viz
         pwKF4ZS4vBPlgMOZEM24AK7m9kLdXbSeSk3mspjxiyVABjSLeRwczQ2akcx6IXm59m8X
         Jb1iCaIaKfM4e/qDeXlIcFooYsIQgDEVAQb5xoM4+OYktjrC5rJVqbw1Is/55EBUFHq6
         ptI3f0EmTPzzUod/7Wy/IJlhy+nl1J1s4HgV8lUBnXhM8TV0RlF23SjWQ/GMkI78XAkG
         AOCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Yn+xAIDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3d5d92si1230688285a.245.2024.08.26.23.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 23:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Yn+xAIDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sipyQ-0004tx-0N; Tue, 27 Aug 2024 02:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LXbNZgUKCIw9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com>)
 id 1sipyK-0004FY-7w
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:32 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LXbNZgUKCIw9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com>)
 id 1sipyG-0006Ax-H1
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 02:46:31 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-7cd7c34c8bbso4579822a12.3
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2024 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1724741165; x=1725345965; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bhR+L35SiqjkW6TlKGX3ijIk2Na9K+5U5H9NOs890v8=;
 b=Yn+xAIDwOrl3tvheW3eGtHUJu1ohEunRchqqROdFugle3FumG/58K9oaLjacawnUka
 mdS6apX5VjEDRAdSkhaXGbYsn2qMn1+CbB0wTsYZU/lqWYH46BXnCmUg+XGPp0mduPb2
 hkkrT+PSsrKQds1zz50BYYgTqYJcQHFqnwdNMRrblH6K3z+FkV/s0OCZD4RCiEIYpobZ
 Gr5+qJvkf7DjGBpCfeSYxhr5dhWfUXIjyI2AJC046ZHFt7IMF6r5wCJ9O/C19Cnvfr9n
 bel9ze/edUiMpEgfDfJZLPT3I2tFNz/5ZhasldLtZfcl6rHIbjOznRN1uPAkuKKRBL2k
 33Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724741165; x=1725345965;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhR+L35SiqjkW6TlKGX3ijIk2Na9K+5U5H9NOs890v8=;
 b=lapFjn1dmzbO9fjXmKh0qjwH0xoeD3zqqvYFEwTTlC4mVDhgbLNL1d42Rgh0YbpNML
 PA6O/07Ny6yv9vMUG64Okmj1Sz8yXD9hlWsIvbcYIOKQfUDJ/derAWXK0csPbAMFxVf+
 DscYTSj2VX4kiGGLuiQtwuc37p5+TyZrGez96HefXWabSO0dKbOBl9aKvfI3cJpayNyY
 Q/Iqi4p01ecPTbrpBYBJQFQbQGCs7IgIPEF5fDSHyLdJLVRZY5iJdz0VVnb8OlEWMccF
 X+wo9xLhKffqOKJSzZZEn/+S0Qh+kFZrPpLxfVVKzi8ehjm2WbrsIB37TWVi9IhD/lCe
 rVbQ==
X-Gm-Message-State: AOJu0YwpjCXKFFdE22ckg6v6jP5fs/FC2JTepCen46MtIkGAqlcmrTJy
 whS0y1xZkCF7W9S+qRfoQyXcxq8Sywew5eI2uSB8YqOcTg/uwZuEo8CGrGMqzag44BbG5yA70w=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:d50d:b0:203:616a:8673
 with SMTP id
 d9443c01a7336-2039e4d5cdfmr12236925ad.5.1724741165045; Mon, 26 Aug 2024
 23:46:05 -0700 (PDT)
Date: Mon, 26 Aug 2024 23:45:22 -0700
In-Reply-To: <20240827064529.1246786-1-tavip@google.com>
Mime-Version: 1.0
References: <20240827064529.1246786-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240827064529.1246786-19-tavip@google.com>
Subject: [RFC PATCH v3 18/24] hw/misc: add i2c-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3LXbNZgUKCIw9qBy5w44w1u.s426u2A-q72343w3A.47w@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FBNO6hP/s33S

Add a simple i2c peripheral to be used for testing I2C device
models. The peripheral has a fixed number of registers that can be
read and written.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/misc/i2c_tester.h | 30 ++++++++++++
 hw/misc/i2c_tester.c         | 94 ++++++++++++++++++++++++++++++++++++
 hw/misc/Kconfig              |  5 ++
 hw/misc/meson.build          |  2 +
 4 files changed, 131 insertions(+)
 create mode 100644 include/hw/misc/i2c_tester.h
 create mode 100644 hw/misc/i2c_tester.c

diff --git a/include/hw/misc/i2c_tester.h b/include/hw/misc/i2c_tester.h
new file mode 100644
index 0000000000..f6b6491008
--- /dev/null
+++ b/include/hw/misc/i2c_tester.h
@@ -0,0 +1,30 @@
+/*
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_I2C_TESTER_H
+#define HW_I2C_TESTER_H
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "hw/irq.h"
+
+#define I2C_TESTER_NUM_REGS    0x31
+
+#define TYPE_I2C_TESTER "i2c-tester"
+#define I2C_TESTER(obj) OBJECT_CHECK(I2cTesterState, (obj), TYPE_I2C_TESTER)
+
+typedef struct {
+    I2CSlave i2c;
+    bool set_reg_idx;
+    uint8_t reg_idx;
+    uint8_t regs[I2C_TESTER_NUM_REGS];
+} I2cTesterState;
+
+#endif /* HW_I2C_TESTER_H */
diff --git a/hw/misc/i2c_tester.c b/hw/misc/i2c_tester.c
new file mode 100644
index 0000000000..3d7986a954
--- /dev/null
+++ b/hw/misc/i2c_tester.c
@@ -0,0 +1,94 @@
+/*
+ * Simple I2C peripheral for testing I2C device models.
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "hw/misc/i2c_tester.h"
+
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static void i2c_tester_reset(DeviceState *ds)
+{
+    I2cTesterState *s = I2C_TESTER(ds);
+
+    s->set_reg_idx = false;
+    s->reg_idx     = 0;
+    memset(s->regs, 0, I2C_TESTER_NUM_REGS);
+}
+
+static int i2c_tester_event(I2CSlave *i2c, enum i2c_event event)
+{
+    I2cTesterState *s = I2C_TESTER(i2c);
+
+    if (event == I2C_START_SEND) {
+        s->set_reg_idx = true;
+    }
+
+    return 0;
+}
+
+static uint8_t i2c_tester_rx(I2CSlave *i2c)
+{
+    I2cTesterState *s = I2C_TESTER(i2c);
+
+    if (s->reg_idx >= I2C_TESTER_NUM_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __func__,
+                      s->reg_idx);
+        return I2C_NACK;
+    }
+
+    return s->regs[s->reg_idx];
+}
+
+static int i2c_tester_tx(I2CSlave *i2c, uint8_t data)
+{
+    I2cTesterState *s = I2C_TESTER(i2c);
+
+    if (s->set_reg_idx) {
+        /* Setting the register in which the operation will be done. */
+        s->reg_idx = data;
+        s->set_reg_idx = false;
+        return 0;
+    }
+
+    if (s->reg_idx >= I2C_TESTER_NUM_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reg 0x%02x\n", __func__,
+                      s->reg_idx);
+        return I2C_NACK;
+    }
+
+    /* Write reg data. */
+    s->regs[s->reg_idx] = data;
+
+    return 0;
+}
+
+static void i2c_tester_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
+
+    dc->reset = i2c_tester_reset;
+
+    isc->event = i2c_tester_event;
+    isc->recv = i2c_tester_rx;
+    isc->send = i2c_tester_tx;
+}
+
+static const TypeInfo i2c_tester_types[] = {
+    {
+        .name = TYPE_I2C_TESTER,
+        .parent = TYPE_I2C_SLAVE,
+        .instance_size = sizeof(I2cTesterState),
+        .class_init = i2c_tester_class_init
+    },
+};
+
+DEFINE_TYPES(i2c_tester_types);
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 4b688aead2..3e93c12c8e 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -213,6 +213,11 @@ config IOSB
 config XLNX_VERSAL_TRNG
     bool
 
+config I2C_TESTER
+    bool
+    default y if TEST_DEVICES
+    depends on I2C
+
 config FLEXCOMM
     bool
     select I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index df36b45d9f..a0f7a52a23 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -157,6 +157,8 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 # HPPA devices
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
+system_ss.add(when: 'CONFIG_I2C_TESTER', if_true: files('i2c_tester.c'))
+
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL', if_true: files('rt500_clkctl0.c', 'rt500_clkctl1.c'))
 system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstctl.c'))
-- 
2.46.0.295.g3b9ea8a38a-goog

