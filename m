Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986457njb;
        Mon, 5 Aug 2024 13:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWynYa643AV8+Fh9KN2lx1H7SkQNBRGsSXpKYHGAEeMcpKrug7hXW9j2beEf3dbcrQFvlc3l2EHsUqE3+XYKfb5jiZskQu6
X-Received: by 2002:a17:90a:714b:b0:2c9:74f2:3b24 with SMTP id 98e67ed59e1d1-2cff94142f7mr11664471a91.12.1722889064756;
        Mon, 05 Aug 2024 13:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889064; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub8leZJ8h+eqh1s1uuEr5AdS1+AgmZpJuNxMB5A7mjVVucKyQjRHnmA7oJUrOvmBQI
         buWwXVUxVCArWaMr2sirNmy6pFtvx/qU1Gch/dBDTQNXiafCwLT248Tu1DRqDT9RTnl+
         /LQA9lNWQ5yqcgVek0PwfPnAXHs06P6uNgalD7pQ3H7VtMhUL88mfN5THyUSMqWTvg3W
         FU6WroYZLb1Nm8RGyDct7Kuht/aSvmnsTUuaik5Sr4DKPyLTcpxSrOhz80aUz2Y67UF5
         y2AZHwh+UaG5gl4U+IXzVcUuCgoUFpBkm8Pi86HxHsxkkSkWtlaOKBEWyEmBZCBnbCCb
         jbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=yKViGbBXbgsf40jDlea1Rbu9Pc/wgyZ+coz/6jiEdWo=;
        fh=F4xeRH+12gx8ac6KkBR+eB4/3QHLxPLRrylPGpZNVyQ=;
        b=thUjxYbmEdXrMe0AjlBF+t1Uc9fF45fnwYpLQVSKGcvoLUKf2rBuEGGEN2THJ7sLWX
         jhxuiAFv7yZcVyX5jx+oRfk0gQKAPhrj0NJI+1zxpzVi9VeG/xgb98sP1kmS3OfYVuZA
         UZQhWZakMDbq9Ng2L1D6ex0CX3XoM46NUBAZJf1GdoWpHKZOVItZ568Ok/aOk8W/pO2M
         ioRMrpiL8XLcxTUuj+d28jjdEd2iBupesg0kAtkUnLhvOLkTjJQUrobP7K55vSjBtMpF
         /gtp8IXNUMT76Vdi17qBdrU6LYrqSlbWJHtR3v2/M2sNglsJ/iy46XIAKlWyf0mz3TAz
         FQCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SL4BAMlh;
       spf=pass (google.com: domain of 3adoxzgukc88evg3a19916z.x97v6zi.wz88zz638vc9.9c1@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3aDOxZgUKC88EvG3A19916z.x97v6zI.wz88zz638vC9.9C1@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3aDOxZgUKC88EvG3A19916z.x97v6zI.wz88zz638vC9.9C1@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2cffb644eafsor6052035a91.0.2024.08.05.13.17.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3adoxzgukc88evg3a19916z.x97v6zi.wz88zz638vc9.9c1@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=SL4BAMlh;
       spf=pass (google.com: domain of 3adoxzgukc88evg3a19916z.x97v6zi.wz88zz638vc9.9c1@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3aDOxZgUKC88EvG3A19916z.x97v6zI.wz88zz638vC9.9C1@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889064; x=1723493864; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKViGbBXbgsf40jDlea1Rbu9Pc/wgyZ+coz/6jiEdWo=;
        b=SL4BAMlhVHE4fnUpn/XEwve4eC+RIvMrj+6e8ef/iCH8x+/3cSnARJlVAgebrKfw6+
         2l/MGXghtlGCnnkN3cZZ3XE5FxuHgS5RA+LkhNNeCQmGsbf+Q0zS432w5Ngi+/fu2BLM
         GIpsC3blrUQ44lZwnHduzzcWBJ3Q8LMBibnWUCvEbU9gKCvrcXSVfwEZ+M/QxJJRVWq3
         OQBcrxrpMleymfO0BnrI8FcoDJzDTshJ8HKEcdxPnUmXgnVQiojZXMRQ4nm1iHGzY8X8
         4YhRwGksLZ7aiu8zBqazfwW71suvRxZXXdqnwXbb8fsq1/BdX8rv7GxlAFk0TWe6K724
         85QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889064; x=1723493864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKViGbBXbgsf40jDlea1Rbu9Pc/wgyZ+coz/6jiEdWo=;
        b=am4WYe5DhgIrrmHWXT3TKo/U8PyAD04tJ3yz+mMIHt250PyuIDImN3CKTCN6UAcl7u
         c+XOsJQQZMoxygUQq6Kb/jYCckvdSuRYxfkHYOlrof5mFH5oaLQBrqW6lS1SsCl7PtM0
         bd22nEHZQ421hN4EHkgT+lwG64dzAX/oXRUEvPtxy2TrJ+EqE5IdafAacVHjF8YXA3vu
         E7ReJW49pDCBoyPCGf2yYZAGMx5IccptRZOjbV7i5xwRiNtrlNHX9VWvRur4Aj2BEsfV
         r/dXuR1nfNDg+AUXy/Qyaywzq4M+xNx3AZTBcSNcH4jdarez7hEAB63Hx4VIMk8vj2/n
         /Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCURDWfXnbRTEBrYGrxAs2uUVOySGXvsar67ob4Vqkk8Vr6FKrTFrbqfCoVQFiQkbRKsEEDm14I2nX4cpQXoYAusTNqhxbho
X-Gm-Message-State: AOJu0YwZtI2RD1WIpCR4k2P5CR6V3n3Xvq1mZwZkdvyNp+pVovWWxbGB
	lDUbh315rfdZhE+zCxLZCiBVioUi4jCheowmC3N8FLpHGScQqhtca3woiueudKeKtgzreEkL0A=
	=
X-Google-Smtp-Source: AGHT+IEru86bm/+1q+FLmL7wwlYksXRv1IHzcU3JoLAoRcdP6I9MQ8+1J/BYTCPAlqTiOGFbzd7E25IUmA==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90a:c982:b0:2c9:63d6:a183 with SMTP id
 98e67ed59e1d1-2cff955376dmr29109a91.7.1722889064153; Mon, 05 Aug 2024
 13:17:44 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:08 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-14-tavip@google.com>
Subject: [RFC PATCH 13/23] test/unit: add i2c-tester
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: UPYzeI+ypFnk

Add a simple i2c peripheral to be used for testing I2C device
models. The peripheral has a fixed number of registers that can be
read and written.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/i2c_tester.c | 111 ++++++++++++++++++++++++++++++++++++++++
 tests/unit/i2c_tester.h |  34 ++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 tests/unit/i2c_tester.c
 create mode 100644 tests/unit/i2c_tester.h

diff --git a/tests/unit/i2c_tester.c b/tests/unit/i2c_tester.c
new file mode 100644
index 0000000000..ea36a17f1f
--- /dev/null
+++ b/tests/unit/i2c_tester.c
@@ -0,0 +1,111 @@
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
+#include "i2c_tester.h"
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
+static void i2c_tester_init(Object *obj)
+{
+}
+
+static void i2c_tester_realize(DeviceState *ds, Error **errp)
+{
+}
+
+static void i2c_tester_unrealize(DeviceState *dev)
+{
+}
+
+static void i2c_tester_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    I2CSlaveClass *isc = I2C_SLAVE_CLASS(oc);
+
+    dc->reset = i2c_tester_reset;
+    dc->realize   = i2c_tester_realize;
+    dc->unrealize = i2c_tester_unrealize;
+
+    isc->event = i2c_tester_event;
+    isc->recv = i2c_tester_rx;
+    isc->send = i2c_tester_tx;
+}
+
+static const TypeInfo i2c_tester_info = {
+    .name = TYPE_I2C_TESTER,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(I2cTesterState),
+    .instance_init = i2c_tester_init,
+    .class_init = i2c_tester_class_init
+};
+
+static void i2c_tester_register_type(void)
+{
+    type_register_static(&i2c_tester_info);
+}
+
+type_init(i2c_tester_register_type);
diff --git a/tests/unit/i2c_tester.h b/tests/unit/i2c_tester.h
new file mode 100644
index 0000000000..9eebe1b6e3
--- /dev/null
+++ b/tests/unit/i2c_tester.h
@@ -0,0 +1,34 @@
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
+#ifndef TESTS_UNIT_I2C_TESTER_H
+#define TESTS_UNIT_I2C_TESTER_H
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "hw/irq.h"
+
+#define I2C_TESTER_NUM_REGS    0x31
+
+#define TYPE_I2C_TESTER "i2c_tester"
+#define I2C_TESTER(obj) OBJECT_CHECK(I2cTesterState, (obj), TYPE_I2C_TESTER)
+
+typedef struct {
+    /* <private> */
+    I2CSlave i2c;
+
+    /* <public> */
+    bool set_reg_idx;
+
+    uint8_t reg_idx;
+    uint8_t regs[I2C_TESTER_NUM_REGS];
+} I2cTesterState;
+
+#endif /* TESTS_UNIT_I2C_TESTER_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
