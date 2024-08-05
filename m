Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986469njb;
        Mon, 5 Aug 2024 13:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDOxeHscAL1Ls5nowinpcPo27hCjcOl5DGjFUQftNlQrIWmx8yWbEpIpaDhherJiP37RyNx9UkPgmKj83nNsjVPduJI4xf
X-Received: by 2002:a05:6902:110e:b0:e0b:2e04:2c10 with SMTP id 3f1490d57ef6-e0bde33f2b0mr14226195276.18.1722889066356;
        Mon, 05 Aug 2024 13:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889066; cv=none;
        d=google.com; s=arc-20160816;
        b=MXga39+232Khfjmcu42oMew+NogMkjak1Gy6g04bs+65Zmz8eBypDU5+WRlSoS+9wT
         XAQvQVAhtURoKP9+ancvxbFr07dInsUYjZihi+fnEC7Zl9Ipv2f05MV7mDopVcSoME1p
         LbraSWv5AQGnOcU0NerX6t1sp53L0u2pCtTjHKpVx86hQ3VVu2bTz7ve20bzIpHBXJD+
         iOMaq6kdu5XjN/vkKbgMLaIp/dfefUZhBywMn+kzZm+Zyuol2c+eiQbdzbEW98Tz1KwK
         6tS4HykGexfk2IRZleAOiJOUaaY4fqi4lJvVuaFRmeH0NRxc3eTRqiZByj0R0p8NoZbg
         m/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=ZCjJ5sPbPGT4/PTAX3XbZdjutmIYVAwZmRenYV+abhM=;
        fh=JdJnsnQqpjJmM2bhYdPj1woToT84kytlQYs1c6MfhWQ=;
        b=YoIYeX2l/HkhC4lfyPSgQbiBwa41Opt2LqDd597DubC/BbVJL4aQHNWx+zBlzjHh9i
         GQlxU4MFhLIx60GRTGY9IpDkyyGd47Ld7emE7pEiLJLLGx6Xld0AbQZTK/3CoV21w2Yx
         HSJmHmSVdXwEqxoyeXm87WlhZKDRNWQIDbfaOe2E4fLG+O7if0XXjDcWxk6VCSbukw+0
         X+Lyb7ZQLFHAh4yvlYorwLvM5VHW9HNdDTkXu3CYhc7SssiCpI4UUz/+dBHGyx/73rXo
         RJxv3I+2Kzi/qA4NEWyGr0ULg6OPnf13rRFJudDwzwSVIxPfG0j/tU9crP6T9l4MQ+Ll
         h1Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=a2Ry7Sms;
       spf=pass (google.com: domain of 3atoxzgukc9afwh4b2aa270.ya8w70j.x09900749wda.ad2@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3aTOxZgUKC9AFwH4B2AA270.yA8w70J.x09900749wDA.AD2@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3aTOxZgUKC9AFwH4B2AA270.yA8w70J.x09900749wDA.AD2@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0be556549csor5036426276.13.2024.08.05.13.17.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3atoxzgukc9afwh4b2aa270.ya8w70j.x09900749wda.ad2@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=a2Ry7Sms;
       spf=pass (google.com: domain of 3atoxzgukc9afwh4b2aa270.ya8w70j.x09900749wda.ad2@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3aTOxZgUKC9AFwH4B2AA270.yA8w70J.x09900749wDA.AD2@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889066; x=1723493866; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCjJ5sPbPGT4/PTAX3XbZdjutmIYVAwZmRenYV+abhM=;
        b=a2Ry7SmsFNF3kY7uBg4aMB1uuJmd2cVBvAZQ3hzEWduHdjCKKHl2H0d0p64nSZxI6g
         Wmn14DI1Pkmb5+lnk1x9C9jX+BBJeuzi/YdnNXJpwVy7l+XRjAjKQ9wfy2DVpF7U9ux2
         LD5hCTPV3dwxA7opqiR0EfPwvEZ4M4rUBokyv0G9MOU4dejXCiwUYotX6+Cr1OTLBZxL
         JtOQ5/NA6ugSlgevO4OhXC5R5zOIqsr0DIO5PQGffffeqonaXDEiMgp27qllp/8sSaeJ
         XS32VFeTambSsMwEafuzjpack9AEhWem+NDSsIsukdTtcQR3lDPbo2m2Faci8wKG1ROo
         sN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889066; x=1723493866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCjJ5sPbPGT4/PTAX3XbZdjutmIYVAwZmRenYV+abhM=;
        b=En3pBWCligc0FdKrCZczyMK4oaNMx1czGGuS7Mek0P2ZMzOoyjtkIaaYPmYKIqy+B9
         81akoyZBB+zX8QrUcUdiyf7H8bER3LKW91YLApM3VB92k9E5d7uQu1AaQwN/lh4yTBAK
         gHIO6BnpJk/qLRtwDiS0GTssUPARhlJuxMrIFADn3t3yzu0lFqmQwrOsbZaYISmVMn8F
         t4vx6z9Ccs942BJD7nkG0ym44Sk5q9Ct2W8hF5J9uqhkYAP3URB3WO+aQpr2KVLvNOJ2
         Ui17t7j7fuQD2eDgRHSJYdEBbbllyimhgnhF5HAdPr1UdyMsLkDw/jBXZ+l7gW9NcazD
         VPxg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5cAuKQT9TMaLbmDDUDIdwXetMDT3UlUSPXfz4sOAcvaI/dVBC30A7OznXS2TCOaQWKR28aubwnEG6BPeXCVBySM64keW
X-Gm-Message-State: AOJu0YzOPmG8TPOJCZwAZqwvdk1mNTvKm0jXtO13ZxmcnBHrolh1rN/z
	nPNjr1Hb6eUMa68GsRwN0tlmUfjreq0aKKxoyLI18Upsc7EMwUC4UypCvXE9ZHXZyb2CREFi2A=
	=
X-Google-Smtp-Source: AGHT+IG1Pt6E3mwx56V6QB58tAS/P9w8eY0tLuEvmxKONHteSzlgUW4zheNvXzY2wiJgw8FsY0r8S0yjHw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:154e:b0:e02:c06f:1db8 with SMTP id
 3f1490d57ef6-e0bde2612ebmr23616276.4.1722889065783; Mon, 05 Aug 2024 13:17:45
 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:09 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-15-tavip@google.com>
Subject: [RFC PATCH 14/23] test/unit: add unit tests for flexcomm i2c
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6qOIMg8+yoir

Add master mode tests for flexcomm i2c.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build         |  10 ++
 tests/unit/test-flexcomm-i2c.c | 209 +++++++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 tests/unit/test-flexcomm-i2c.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4c22cb3ccc..3491e2003b 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -160,6 +160,16 @@ if have_system
       meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
       meson.project_source_root() / 'hw/i2c/core.c',
     ],
+    'test-flexcomm-i2c': [
+      hwcore, chardev, qom, migration,
+      meson.project_source_root() / 'hw/core/gpio.c',
+      meson.project_source_root() / 'tests/unit/sysbus-mock.c',
+      meson.project_source_root() / 'hw/misc/flexcomm.c',
+      meson.project_source_root() / 'hw/char/flexcomm_usart.c',
+      meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
+      meson.project_source_root() / 'hw/i2c/core.c',
+      'i2c_tester.c',
+    ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
diff --git a/tests/unit/test-flexcomm-i2c.c b/tests/unit/test-flexcomm-i2c.c
new file mode 100644
index 0000000000..9d02c94101
--- /dev/null
+++ b/tests/unit/test-flexcomm-i2c.c
@@ -0,0 +1,209 @@
+/*
+ * Copyright (c) 2024 Google LLC.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/config-file.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "qemu/sockets.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "qemu/option.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+
+#include "hw/i2c/flexcomm_i2c.h"
+#include "i2c_tester.h"
+#include "sysbus-mock.h"
+#include "reg-utils.h"
+
+#define PERIPH_ADDR (0x20)
+#define INVALID_ADDR (0x10)
+
+#define REG_ADDR 0x11
+#define REG_VALUE 0xAA
+
+#define FLEXCOMM_BASE 0x40106000UL
+#define FLEXCOMM_I2C_BASE FLEXCOMM_BASE
+
+typedef struct {
+    DeviceState *dev;
+    I2CSlave *periph;
+    bool irq;
+} TestFixture;
+
+/* Callback for the interrupt line. */
+static void spi_irq_set(void *opaque, int line, int level)
+{
+    TestFixture *f = (TestFixture *)opaque;
+
+    f->irq = level;
+}
+
+/*
+ * Test fixture initialization.
+ */
+static void set_up(TestFixture *f, gconstpointer data)
+{
+    FlexcommState *s;
+
+    f->dev = qdev_new(TYPE_FLEXCOMM);
+    g_assert(f->dev);
+
+    s = FLEXCOMM(f->dev);
+    s->irq = qemu_allocate_irq(spi_irq_set, f, 0);
+
+    if (data != NULL) {
+        qdev_prop_set_int32(DEVICE(f->dev), "functions", (uintptr_t)data);
+    }
+
+    qdev_realize_and_unref(f->dev, NULL, &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(f->dev), 0, FLEXCOMM_BASE);
+
+    device_cold_reset(f->dev);
+
+    f->periph = i2c_slave_create_simple(s->i2c, TYPE_I2C_TESTER, PERIPH_ADDR);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    qdev_unrealize(f->dev);
+    qdev_unrealize(DEVICE(f->periph));
+}
+
+static void master_test(TestFixture *f, gconstpointer user_data)
+{
+    uint32_t tmp;
+
+    /* Select and lock I2C */
+    tmp = FLEXCOMM_PSELID_LOCK_Msk | FLEXCOMM_PERSEL_I2C;
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, tmp);
+
+    /* Enable master mode */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, CFG, MSTEN, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, CFG, MSTEN) == 1);
+
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTPENDING) == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_IDLE);
+
+    /* Enable interrupts */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, INTENSET, MSTPENDINGEN, 1);
+    g_assert(f->irq == true);
+
+    /* start for invalid address  */
+    REG32_WRITE(f->dev, FLEXCOMM_I2C, MSTDAT, INVALID_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKADR);
+    g_assert(f->irq == true);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* write past the last register */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA,
+                    (I2C_TESTER_NUM_REGS + 10));
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKDAT);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* write value to register */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, REG_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, REG_VALUE);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_IDLE);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* read value back from register */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, PERIPH_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, REG_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_TXRDY);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, (PERIPH_ADDR + 1));
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+    g_assert(f->irq == true);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_RXRDY);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTCONTINUE, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA) == REG_VALUE);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /*
+     * Check that the master ended the transaction (i.e. i2c_end_transfer was
+     * called). If the master does not properly end the transaction this would
+     * be seen as a restart and it would not be NACKed.
+     */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, MSTDAT, DATA, INVALID_ADDR);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTART, 1);
+
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_I2C, STAT, MSTSTATE) ==
+             MSTSTATE_NAKADR);
+    g_assert(f->irq == true);
+    REG32_WRITE_FIELD_NOUPDATE(f->dev, FLEXCOMM_I2C, MSTCTL, MSTSTOP, 1);
+
+    /* Disable interrupts */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_I2C, INTENCLR, MSTPENDINGCLR, 1);
+    g_assert(f->irq == false);
+}
+
+/* mock-up */
+const PropertyInfo qdev_prop_chr;
+
+int main(int argc, char **argv)
+{
+    qemu_init_main_loop(&error_abort);
+
+    g_test_init(&argc, &argv, NULL);
+
+    /* Initialize object types. */
+    sysbus_mock_init();
+    module_call_init(MODULE_INIT_QOM);
+    qemu_add_opts(&qemu_chardev_opts);
+
+    g_test_add("/flexcomm-i2c/master", TestFixture,
+               (gconstpointer)(1 << FLEXCOMM_FUNC_I2C),
+               set_up, master_test, tear_down);
+
+    return g_test_run();
+}
-- 
2.46.0.rc2.264.g509ed76dc8-goog
