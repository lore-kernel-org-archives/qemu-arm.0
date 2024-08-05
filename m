Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986419njb;
        Mon, 5 Aug 2024 13:17:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHzmq5N5Mtb4WGlWvnn+DF6a6Ko9LCUFO/w6qkrxriz6oJCF5rZnLj+OGiMMZ1/9hAJMsvKE3BuQ83TTK4feQ2+k3v1bar
X-Received: by 2002:a17:903:11ce:b0:1fb:80cb:f577 with SMTP id d9443c01a7336-1ff57250f4amr165111495ad.5.1722889057327;
        Mon, 05 Aug 2024 13:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889057; cv=none;
        d=google.com; s=arc-20160816;
        b=bx3xVyuA7flDXmcWdcH82t7oJjIT53w1k+m+yDiry2ArLF1u6JdDdbZirCKJfX6+9i
         Qqr7m0SIS64/vUW8oZyMnxnOmHyTIpaSCn/yrrQXP+seFCNna6urfJRQOMt+jK0ewJUw
         vGw3Z+Afmn+yapcBnIyGttZDK5cCsSzZ8ezKBNq55KaWxF1AUyW/FLQ5XUUtEAuVfezU
         UwMZvzBqVHDjNAoILRMD3uY9hVv/Vx06HR8ed6v8RVqTnVk63omwpK4TECk15PmgpHWp
         fDoPw8vBlNJlvrPO9mGITKgltEW+GeZBf0RyYKr5VAIrL+85ylyZgDca2kmDgCK+RXoz
         qGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=xU5YoCp1yOlClenc+sMgGqOCDAj0a2iC6b3QkZBvnbA=;
        fh=xs9wd1TqAWb9XRdbFA0beXFEkOUL2cigxM5VNTjZY74=;
        b=A9+y0Q9LlLodidGynnXZXsRNs30IBlKnk2SoyU+zFr9FLak8iw/OZFqaEw47nTCqhF
         7Qv5xamSSnzyhPD7tx9TGqa3aow76vFgANIDM4fDAtx6mYaxnLfc4k+rZfweRsScieUI
         K+iSOhxDOC7IwVOHkeO6eWYGmSEuNs0YsK59Nafl8/5Fqg2ypXeTHop8p92zYL7ZiUDK
         j09e+Ql11v+59lgvesXnYcgGAH7fh6HC8o3eMy3vZ0/ruLUPaxVVj3jKA7aZKAzuKdXo
         N4HVjkqQxFj3tGIOrTfsqvWYt9r9uZNEnAp2vUiu8o79si59dOJQyXRnthiKbUmKHyRC
         fr1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Nsy3d0xK;
       spf=pass (google.com: domain of 3ydoxzgukc8c6n8v2t11tyr.p1znyra.or00rryv0n41.14t@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3YDOxZgUKC8c6n8v2t11tyr.p1znyrA.or00rryv0n41.14t@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3YDOxZgUKC8c6n8v2t11tyr.p1znyrA.or00rryv0n41.14t@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-200773e749csor1482085ad.20.2024.08.05.13.17.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ydoxzgukc8c6n8v2t11tyr.p1znyra.or00rryv0n41.14t@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Nsy3d0xK;
       spf=pass (google.com: domain of 3ydoxzgukc8c6n8v2t11tyr.p1znyra.or00rryv0n41.14t@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3YDOxZgUKC8c6n8v2t11tyr.p1znyrA.or00rryv0n41.14t@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889057; x=1723493857; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xU5YoCp1yOlClenc+sMgGqOCDAj0a2iC6b3QkZBvnbA=;
        b=Nsy3d0xKdjkqQjNh9WZJ3hJfcaPUwmPVMJNzq+JP5sI2O7giaFBXr5ytLrNob+xy7+
         /odJ3FRov5okLi9FJ6fBr8I3U/B+kb4M95AtCvvjLakHqo9CdVvIbaoJWlg0zH8druW+
         o7uYw9rZdzALKVW3TD0t9uYq1zW7sRQFxlsViV04r5PTDNqGKX7hE5WawgaZCgG8rWWb
         AJjfdK0ZgVAD5Ks+pSNpxOhJCPrCSzf0YtWMAfEwsYHAhg6jeSdusYAaZ2fb9asPaciI
         hO+cRPStxTzPCzjke21UNCzneFX9OmZavZjS3fQ1MPCHQTqIIiTrbb4f3UQxGu+P4RVy
         D9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889057; x=1723493857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xU5YoCp1yOlClenc+sMgGqOCDAj0a2iC6b3QkZBvnbA=;
        b=bP/8ubICWGsti7jsg7n1oMIkCqlvSYL3PYMBHSQ/SVA414AqbIMfTh7beJdAhiwo9e
         W31UzwtAje7BAMzlBZ+llcKjaNGh9BPdeKy8bRBxI8TGzQo7Seob6RclIRoS3t/ASQhq
         0JEngUgyUAHh1lb84IvUMpo7pV9P4N13Ko4n5SLyXLbUH1l/tsmCknQC25V6PkxXbcDV
         1xXdtpcEBrJGfRgwkzj6jYZHwgFkA5iQ900Ve8jx9LujTNj519Mp1blRgc6dUoqCaCXR
         w2zCv9iRLfkclHwmihEeai6SUsABI8meyGqwJUIBQsiv8c1FUBZ9ZwV5VzZgNwDNKDFH
         XyCA==
X-Forwarded-Encrypted: i=1; AJvYcCXGRyUV/9nwql9lg0wZQSlkrWpjhQB7vyc6u6Wdu2Q7J6vgXTDl4nXYbPmiZSMk9e36qu9HUDB7aRee9DCRqlL8BKj6RzdO
X-Gm-Message-State: AOJu0YyHuiDZRjMfPoVaCsM+yiac2xcwwUFYLjjVZGWKGFU6nMkeypbe
	cCzNPXk7fPZIMxv/hXNMQxPc4nr5eXMvdWDObbbq+HURLM8lWzVo0x5nAgjuaJsf/ldPdHKrIw=
	=
X-Google-Smtp-Source: AGHT+IEtEwV3xypSgEnFhmUjU6qXW1j+oyQGdeQtD2Sw0m7UuLuMq4ZYQZwgA67eCesfEw+/BoRavLh1Bw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:d4c5:b0:1fd:73e6:83c0 with SMTP id
 d9443c01a7336-1ff572a43eemr5414585ad.1.1722889056755; Mon, 05 Aug 2024
 13:17:36 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:04 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-10-tavip@google.com>
Subject: [RFC PATCH 09/23] test/unit: add flexcomm unit test
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: JHtSKl6ZnYOw

Add flexcomm function selection unit tests.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build     |   8 +-
 tests/unit/test-flexcomm.c | 215 +++++++++++++++++++++++++++++++++++++
 2 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/test-flexcomm.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 397f2503f8..4ccb15404d 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -141,7 +141,13 @@ if have_system
     'test-bufferiszero': [],
     'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
     'test-vmstate': [migration, io],
-    'test-yank': ['socket-helpers.c', qom, io, chardev]
+    'test-yank': ['socket-helpers.c', qom, io, chardev],
+    'test-flexcomm': [
+      hwcore,
+      meson.project_source_root() / 'hw/core/gpio.c',
+      meson.project_source_root() / 'tests/unit/sysbus-mock.c',
+      meson.project_source_root() / 'hw/misc/flexcomm.c',
+     ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
diff --git a/tests/unit/test-flexcomm.c b/tests/unit/test-flexcomm.c
new file mode 100644
index 0000000000..f4efe2ac52
--- /dev/null
+++ b/tests/unit/test-flexcomm.c
@@ -0,0 +1,215 @@
+/*
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/flexcomm.h"
+#include "sysbus-mock.h"
+#include "reg-utils.h"
+
+#define MAX_MSG_STACK 2
+
+typedef struct {
+    DeviceState *dev;
+    char *msg[MAX_MSG_STACK];
+    int msg_count;
+} TestFixture;
+
+#define SELECT_MSG(f, selected) "f[%d]select(%d)", f, selected
+#define REG_READ_MSG(f, addr, size) "f[%d]reg_read(%x, %d)", f, \
+        (uint32_t)addr, size
+#define REG_WRITE_MSG(f, addr, data, size) "f[%d]reg_write(%x, %x, %d)", \
+        f, (uint32_t)addr, (uint32_t)data, size
+
+#define FLEXCOMM_BASE 0x40106000UL
+
+
+static void f_ops_select(void *opaque, FlexcommState *s, int f,
+                         bool selected)
+{
+    TestFixture *tf = (TestFixture *)opaque;
+
+    tf->msg[tf->msg_count++] = g_strdup_printf(SELECT_MSG(f, selected));
+}
+
+static MemTxResult f_ops_reg_read(void *opaque, FlexcommState *s, int f,
+                                  hwaddr addr, uint64_t *data, unsigned size)
+{
+    TestFixture *tf = (TestFixture *)opaque;
+
+    tf->msg[tf->msg_count++] = g_strdup_printf(REG_READ_MSG(f, addr, size));
+    return MEMTX_OK;
+}
+
+static MemTxResult f_ops_reg_write(void *opaque, FlexcommState *s, int f,
+                                   hwaddr addr, uint64_t data, unsigned size)
+{
+    TestFixture *tf = (TestFixture *)opaque;
+
+    tf->msg[tf->msg_count++] = g_strdup_printf(REG_WRITE_MSG(f, addr, data,
+                                                             size));
+    return MEMTX_OK;
+}
+
+static void assert_msg(TestFixture *f, const char *fmt, ...)
+    __attribute__((format(printf, 2, 3)));
+
+static void assert_msg(TestFixture *f, const char *fmt, ...)
+{
+    va_list ap;
+    char *msg;
+
+    va_start(ap, fmt);
+    msg = g_strdup_vprintf(fmt, ap);
+    va_end(ap);
+
+    g_assert_cmpstr(msg, ==, f->msg[--f->msg_count]);
+}
+
+static const FlexcommFunctionOps f_ops = {
+    .select = f_ops_select,
+    .reg_read = f_ops_reg_read,
+    .reg_write = f_ops_reg_write,
+};
+
+/*
+ * Test fixture initialization.
+ */
+static void set_up(TestFixture *f, gconstpointer data)
+{
+    int i;
+
+    f->dev = qdev_new(TYPE_FLEXCOMM);
+    g_assert(f->dev);
+
+    if (data != NULL) {
+        qdev_prop_set_int32(DEVICE(f->dev), "functions", (uintptr_t)data);
+    }
+
+    qdev_realize_and_unref(f->dev, NULL, NULL);
+    sysbus_mmio_map(SYS_BUS_DEVICE(f->dev), 0, FLEXCOMM_BASE);
+
+    for (i = 0; i < FLEXCOMM_FUNCTIONS; i++) {
+        /* replace functions ops */
+        flexcomm_unregister_ops(i);
+        assert(flexcomm_register_ops(i, f, &f_ops, NULL));
+        assert(!flexcomm_register_ops(i, f, &f_ops, NULL));
+    }
+
+    device_cold_reset(f->dev);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    qdev_unrealize(f->dev);
+    g_free(f->dev);
+}
+
+static void select_test(TestFixture *f, gconstpointer user_data)
+{
+    uint32_t tmp = 0;
+    struct {
+        int persel;
+        int func;
+    } persel_func_map[] = {
+        { FLEXCOMM_PERSEL_USART, FLEXCOMM_FUNC_USART },
+        { FLEXCOMM_PERSEL_SPI, FLEXCOMM_FUNC_SPI },
+        { FLEXCOMM_PERSEL_I2C, FLEXCOMM_FUNC_I2C },
+        { FLEXCOMM_PERSEL_I2S_TX, FLEXCOMM_FUNC_I2S },
+        { FLEXCOMM_PERSEL_I2S_RX, FLEXCOMM_FUNC_I2S },
+    };
+    int i;
+
+    /* test that no function is selected */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL) == 0);
+
+    /* no register access until a function is selected  */
+    g_assert(reg32_addr_read_raw(f->dev, FLEXCOMM_BASE, &tmp, 4)
+             == MEMTX_ERROR);
+    g_assert(reg32_addr_write_raw(f->dev, FLEXCOMM_BASE, tmp, 4)
+             == MEMTX_ERROR);
+
+    /* test that we can select all functions (including I2S RX) */
+    for (i = 0; i < ARRAY_SIZE(persel_func_map); i++) {
+        int persel = persel_func_map[i].persel;
+        int func = persel_func_map[i].func;
+
+        REG32_WRITE(f->dev, FLEXCOMM, PSELID, persel);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL) == persel);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PID, ID) == persel);
+
+        /* check that current function was selected */
+        assert_msg(f, SELECT_MSG(func, 1));
+
+        /* check that previous function was de-selected */
+        if (i > 0) {
+            int prev_func = persel_func_map[i - 1].func;
+
+            assert_msg(f, SELECT_MSG(prev_func, 0));
+        }
+
+        /* test that we can access function registers */
+        reg32_addr_write_raw(f->dev, FLEXCOMM_BASE + 0x100, 0xabcd, 4);
+        assert_msg(f, REG_WRITE_MSG(func, 0x100, 0xabcd, 4));
+
+        reg32_addr_read_raw(f->dev, FLEXCOMM_BASE + 0x100, &tmp, 4);
+        assert_msg(f, REG_READ_MSG(func, 0x100, 4));
+    }
+
+    /* try to select something invalid */
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, 7);
+    /* check for no function selected */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL) == 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PID, ID) == 0);
+    /* check that previous function was deselected */
+    assert_msg(f, SELECT_MSG(FLEXCOMM_FUNC_I2S, 0));
+
+    /* now select and lock USART */
+    tmp = FLEXCOMM_PSELID_LOCK_Msk | FLEXCOMM_PERSEL_USART;
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, tmp);
+    tmp = REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL);
+    g_assert(tmp == FLEXCOMM_PERSEL_USART);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, LOCK) == 1);
+    tmp = REG32_READ_FIELD(f->dev, FLEXCOMM, PID, ID);
+    g_assert(tmp == FLEXCOMM_PERSEL_USART);
+    assert_msg(f, SELECT_MSG(FLEXCOMM_FUNC_USART, 1));
+
+    /* try to change the selection to spi */
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, FLEXCOMM_PERSEL_SPI);
+    /* it should still be locked USART */
+    tmp = REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL);
+    g_assert(tmp == FLEXCOMM_PERSEL_USART);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, LOCK) == 1);
+    tmp = REG32_READ_FIELD(f->dev, FLEXCOMM, PID, ID);
+    g_assert(tmp == FLEXCOMM_PERSEL_USART);
+}
+
+/* mock-up */
+const PropertyInfo qdev_prop_chr;
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    /* Initialize object types. */
+    sysbus_mock_init();
+    module_call_init(MODULE_INIT_QOM);
+
+    g_test_add("/flexcomm/select_test", TestFixture,
+               (gconstpointer)FLEXCOMM_FULL, set_up, select_test,
+               tear_down);
+
+    return g_test_run();
+}
-- 
2.46.0.rc2.264.g509ed76dc8-goog
