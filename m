Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986502njb;
        Mon, 5 Aug 2024 13:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUl8schnQ75I+/LsxiJxdjZ6Q1HjnIrc74MU0Qzw5jFfhr9PEz4xgZJ0YgZFhMHTQdgNny9C6m87i5BYevFuWqFZYD0TJxG
X-Received: by 2002:a17:903:11d0:b0:1fb:2bed:6418 with SMTP id d9443c01a7336-1ff574911dfmr122780455ad.57.1722889071699;
        Mon, 05 Aug 2024 13:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889071; cv=none;
        d=google.com; s=arc-20160816;
        b=Uuu9JeqUBjlCtiaNgXEypmBFvhSwAZozbjvyJlCoLBDh/ihCQVZMLA/L6wn+/HCNC+
         ZmEo3gOHiBqCQ+s9Hpfs9WMrXoTpwWHgwAujbMtfNmbKc8JRjiiBt05JEjluCQK1SVik
         dxGflk2cHHoPexajl2dxSABaCK8indHrnydk5XEarw72NHBKvBvPVv1Rq++BfsUdgi2v
         zEu8xsm2ChzYXlIu9844+LG+zMesL2dGM8egMM7pdOME2sRqEytjODGHaW1rqfVZqARG
         iG4rFtssqK7gjWWwhoX+xDj86yVb28zHwEBvQ8zgY+eBTt514h6aoATvgAx1K0IPLVyr
         jscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=wzBmDOceMrnHqMQIWuQIRSZOR9yk0Yvpmsomz+UG+gg=;
        fh=IRW2eAjjRlkWuTVLwF+E8vWrYz3vBZmIR9e31qd49ys=;
        b=OCAbCVGmHTUz61CRWqJxhaSoly/NAf9pTQLXCSHy5GOANXKdseJGM75Wboz8bO2Hin
         74KWOCH7Ln+Boiu3Xt6Pm289e9Zxtd7+6PFFiZWOoJkhAMAooxAfbH4YOViKad4nmqOZ
         LkNHhga67AvLbDtqrBb+81HRLCBGUwqdqCHrQPmKvRqxjepxV0bHa9m+hCuTu+43R0SO
         1DlhoNDwJ4On3C8l7T8gMPlk9qm9PmUBmVBB2Oh+83CCmHBKPKL8ULcrbEwHn8vpdlZt
         gvFblhxAfzyxpyTHqmtSDxsqwZsAd2NYxjf5reO6EM0S8NAw/NRC44cHdYEE0k161cla
         nf5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=L7JK7Pg0;
       spf=pass (google.com: domain of 3bzoxzgukc9yl2nah8gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bzOxZgUKC9YL2NAH8GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3bzOxZgUKC9YL2NAH8GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-1ff58f827e6sor62328085ad.11.2024.08.05.13.17.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3bzoxzgukc9yl2nah8gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=L7JK7Pg0;
       spf=pass (google.com: domain of 3bzoxzgukc9yl2nah8gg8d6.4ge2d6p.36ff66daf2jg.gj8@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3bzOxZgUKC9YL2NAH8GG8D6.4GE2D6P.36FF66DAF2JG.GJ8@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889071; x=1723493871; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzBmDOceMrnHqMQIWuQIRSZOR9yk0Yvpmsomz+UG+gg=;
        b=L7JK7Pg0D/kCoS6CDQNYOrvN5L+1aC10VlnFa8lEyQ+K0wzeRarwsPPLc9+TKcP9Wq
         sDOVXmVGwaWIZtHNiISXEGhaKRo4Gq44Ep3//jRzhNHkaHTa+MuIR1t5TYWLdCwhLbUP
         C24XKBO9gvbtZ+n1DfLlzMTCrM8IdcflMYqTplmfjKOyKvqDCxuuDDoTEpB0UqJq4iPf
         BrClyHQo/egCdW7rHKdZCkWGp7ascpk9dINhRGVHbK/HgzzmDFcTTlVmAFbX9EAQymKv
         dQzAHEp9vBoa79b63ACS6AOwrfWtjIUT4gxhgcbzuPVuiY6yNttkKYbDwjPhbVYNSZ5S
         /gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889071; x=1723493871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzBmDOceMrnHqMQIWuQIRSZOR9yk0Yvpmsomz+UG+gg=;
        b=pmwXJRVt4/5U34KDTidrJ++SGVH7B28h/FM9X2Hnnypp8amSBN6MgkjEjSIBroI7UQ
         alFAUZeY9btrCCBh6odhiFUSD2kHeCVCvqFkOkUEyLORcrxq6Xc3dyxT18R4wNsJZfpT
         SuY0uSqER2vBJqKhJAU9KjgGkRhdPFmlIGBLv29jBRzCtwDyU1YgA0dzwGJCWqLW3nqW
         yQbW49B94CH7GPMGeWxDs/Pbw8SCT9H9UnbwL+utkgOQAv3MF07WLy29cOtFokP6khgp
         HvFVe1+QLZq4IfSELn/2iIJHuRmn90ly7D3U26FVSvhYNUc9TrqR+aOl8RRfdCA/Jpkj
         bLTg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmtpaZIRPMk0q6uUz6Ufe/9bFvp2kq2EGCt2hAqUqoZpu+3h4DyuF/1XWvj+3lokhVyusZUsaha73lFxK6PHH0EB5cMYM
X-Gm-Message-State: AOJu0YwMrJCr0osGeIrTO+GQNZtI4SgRET8cEgLp+x1Hip51/0tQenKW
	OppUGR/Mt2hCkfr+/n2JNGMK/1WxUyH62XH6KdVm/qauiOYdHaoKgQKU0GYEqz0FuqPNdFHvuA=
	=
X-Google-Smtp-Source: AGHT+IHVi7BSDYYhjOka8/Q/qJLSQwS1b7zusawaDngOT+BQcrbPW5yMM/adD7GWmfTork0iu8CQc2L59Q==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:ec85:b0:1fb:1ae6:6ab9 with SMTP id
 d9443c01a7336-1ff570db092mr4983795ad.0.1722889071130; Mon, 05 Aug 2024
 13:17:51 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:12 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-18-tavip@google.com>
Subject: [RFC PATCH 17/23] test/unit: add unit tests for flexcomm spi
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: HAQiEqA24OlZ

From: Sebastian Ene <sebastianene@google.com>

From: Sebastian Ene <sebastianene@google.com>

Add master and loopback tests for flexcomm spi.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build         |  11 ++
 tests/unit/test-flexcomm-spi.c | 204 +++++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 tests/unit/test-flexcomm-spi.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 1ddd174576..7a28e7b521 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -176,6 +176,17 @@ if have_system
       meson.project_source_root() / 'hw/ssi/flexcomm_spi.c',
       meson.project_source_root() / 'hw/ssi/ssi.c',
     ],
+    'test-flexcomm-spi': [
+      qom, hwcore, migration, chardev,
+      meson.project_source_root() / 'hw/core/gpio.c',
+      meson.project_source_root() / 'tests/unit/sysbus-mock.c',
+      meson.project_source_root() / 'hw/misc/flexcomm.c',
+      meson.project_source_root() / 'hw/char/flexcomm_usart.c',
+      meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
+      meson.project_source_root() / 'hw/i2c/core.c',
+      meson.project_source_root() / 'hw/ssi/flexcomm_spi.c',
+      meson.project_source_root() / 'hw/ssi/ssi.c',
+      'spi_tester.c',
     ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
diff --git a/tests/unit/test-flexcomm-spi.c b/tests/unit/test-flexcomm-spi.c
new file mode 100644
index 0000000000..4aaf511d70
--- /dev/null
+++ b/tests/unit/test-flexcomm-spi.c
@@ -0,0 +1,204 @@
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
+#include "hw/misc/flexcomm.h"
+#include "spi_tester.h"
+#include "sysbus-mock.h"
+#include "reg-utils.h"
+
+/* The number of words sent on the SPI in loopback mode. */
+#define SEQ_LOOPBACK_MODE   (8)
+
+/* This value is used to set the cycle counter for the spi tester */
+#define SPI_TESTER_CONFIG (0x10)
+
+#define FLEXCOMM_BASE 0x40106000UL
+#define FLEXCOMM_SPI_BASE FLEXCOMM_BASE
+
+typedef struct {
+    DeviceState *dev;
+    DeviceState *periph;
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
+    f->periph = ssi_create_peripheral(s->spi, TYPE_SPI_TESTER);
+    s->cs[0] = qdev_get_gpio_in_named(f->periph, SSI_GPIO_CS, 0);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    qdev_unrealize(f->dev);
+    qdev_unrealize(DEVICE(f->periph));
+    g_free(f->dev);
+}
+
+static void configure_spi(TestFixture *f, bool master, bool is_loopback_mode)
+{
+    uint32_t tmp;
+
+    /* Select and lock SPI */
+    tmp = FLEXCOMM_PSELID_LOCK_Msk | FLEXCOMM_PERSEL_SPI;
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, tmp);
+
+    /* Disable the FIFO */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, ENABLE, 0);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, FIFOCFG, ENABLETX, 0);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, FIFOCFG, ENABLERX, 0);
+
+    if (is_loopback_mode) {
+        /* Set up SPI interface - loop mode, master mode */
+        REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, LOOP, 1);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, CFG, LOOP) == 1);
+    }
+
+    if (master) {
+        REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, MASTER, 1);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, CFG, MASTER) == 1);
+    } else {
+        REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, MASTER, 0);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, CFG, MASTER) == 0);
+    }
+
+    /* Enable the FIFO */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, FIFOCFG, ENABLETX, 1);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, FIFOCFG, ENABLERX, 1);
+
+    /* Enable the SPI */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, ENABLE, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, CFG, ENABLE) == 1);
+}
+
+/* The SPI controller running in master mode can run in loopback mode for */
+/* internal testing. Transmit and receive lines are connected together. */
+static void loopback_test(TestFixture *f, gconstpointer user_data)
+{
+    int i;
+
+    configure_spi(f, true, true);
+
+    /* Write a sequence */
+    for (i = 0; i < SEQ_LOOPBACK_MODE; i++) {
+        REG32_WRITE(f->dev, FLEXCOMM_SPI, FIFOWR, i);
+    }
+
+    /* Read the sequence back */
+    for (i = 0; i < SEQ_LOOPBACK_MODE; i++) {
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFORD, RXDATA) == i);
+    }
+}
+
+static void spi_master_test(TestFixture *f, gconstpointer user_data)
+{
+    uint32_t tmp;
+
+    configure_spi(f, true, false);
+
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_SPI, CFG, LSBF, 1);
+
+    /* single 16bit word transfer */
+
+    tmp = 0x1122;
+    tmp |= FLEXCOMM_SPI_FIFOWR_EOT_Msk;
+    tmp |= FLEXCOMM_SPI_FIFOWR_TXSSEL0_N_Msk;
+    tmp |= (0xF << FLEXCOMM_SPI_FIFOWR_LEN_Pos);
+    REG32_WRITE(f->dev, FLEXCOMM_SPI, FIFOWR, tmp);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert_cmpuint(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFORD, RXDATA),
+                     ==, 0x1122);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 0);
+
+    /* multi word 8 bits transfer */
+
+    tmp = 0x11;
+    tmp |= FLEXCOMM_SPI_FIFOWR_TXSSEL0_N_Msk;
+    tmp |= (0x7 << FLEXCOMM_SPI_FIFOWR_LEN_Pos);
+    REG32_WRITE(f->dev, FLEXCOMM_SPI, FIFOWR, tmp);
+    tmp = 0x22;
+    tmp |= FLEXCOMM_SPI_FIFOWR_EOT_Msk;
+    tmp |= FLEXCOMM_SPI_FIFOWR_TXSSEL0_N_Msk;
+    tmp |= (0x7 << FLEXCOMM_SPI_FIFOWR_LEN_Pos);
+    REG32_WRITE(f->dev, FLEXCOMM_SPI, FIFOWR, tmp);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFORD, RXDATA) == 0x11);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFORD, RXDATA) == 0x22);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_SPI, FIFOSTAT, RXNOTEMPTY) == 0);
+}
+
+
+/* mock-up */
+const PropertyInfo qdev_prop_chr;
+
+int main(int argc, char **argv)
+{
+    qemu_init_main_loop(&error_abort);
+    socket_init();
+
+    g_test_init(&argc, &argv, NULL);
+
+    /* Initialize object types. */
+    sysbus_mock_init();
+    module_call_init(MODULE_INIT_QOM);
+    qemu_add_opts(&qemu_chardev_opts);
+
+    g_test_add("/flexcomm-spi/loopback", TestFixture,
+               (gconstpointer)(1 << FLEXCOMM_FUNC_SPI),
+               set_up, loopback_test, tear_down);
+
+    g_test_add("/flexcomm-spi/master", TestFixture,
+               (gconstpointer)(1 << FLEXCOMM_FUNC_SPI),
+               set_up, spi_master_test, tear_down);
+
+    return g_test_run();
+}
-- 
2.46.0.rc2.264.g509ed76dc8-goog
