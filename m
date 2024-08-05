Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986442njb;
        Mon, 5 Aug 2024 13:17:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxlGRtzhFFlhK3RyYY45lRRH/nV0t35pymgykkC03qxYrYtjNeMXNy1Q3nEX+ZYCt2+26l/NEpP/Q66ovsvqJCP/t/jYrq
X-Received: by 2002:a05:6358:5f1d:b0:1aa:b887:2386 with SMTP id e5c5f4694b2df-1af3ba5e2e3mr1649705655d.10.1722889060613;
        Mon, 05 Aug 2024 13:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889060; cv=none;
        d=google.com; s=arc-20160816;
        b=jy9jhTr5fXDjlHaCPyzxkgmxWU4HiJn3EWBLilx9z5AtCbRVYIeXflmoIivetOHr8A
         X2ZzcP92MwOvzb9y6mkPwp5fy8wzxhQDIQ1mH96yVivmvWXqGRgbKlQ/wzavCrk0vMsR
         fOxqQAkTmTUsYdTfaOVKJgsObmfzA4LqYu4Pqt0+M2TlXjZaWhBhR4WZERV7pCQlAFFw
         um8UFVLxmhr2rZoPDqDJsfzQ6ZDWqqIfXmemc4YvNj1mWoGCgU/snNm/I/+MKQnKevVx
         H8fnQS4Xpm5+lesOkiZnHJwoFtIDq3ixzzvyJ3LOHuaFKrysfo77M4iBdKOaKlxep52t
         uwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=4nDAaRYoPQUybXMrCeQ4yM0etvHUlZuu5xJy/FcdLbg=;
        fh=tF/dx7lFebat0B7sZE3VxaqqKa7sXqNNp0lx28x1mxI=;
        b=ZItLB7w85tqp69GN9c6YdFb1iSATF69HLkRSwiTFLVlQ4lu7//R0uBLZKHSsxK0qJo
         9til+jMqsswBJL2bAFA46VISL9MIuQaNu4pfGQxgGjhmNa0WzuYWV67U/ypMOI3lJWhA
         nGSa0t1J2g94o7A4XLzKtilSMGqE5uiaMYvDElG7sfXUPscdH5fFAykJLJpQrlpqmawJ
         P2xXL96Y3sPKO4wCbzCzpnkJ8vjF9VVGvsvohKCDAxSN5P7PvzJJBvcTFIkohHExTB7S
         ZYIro3EOvWPYg+UZGaeoTWRvYwJzY1TkXnFzc5K1AILscuFVACY9+yoUryUfdVyicbpY
         SglA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3NWMhCsY;
       spf=pass (google.com: domain of 3zdoxzgukc8sarcz6x55x2v.t53r2ve.sv44vv2z4r85.58x@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZDOxZgUKC8sArCz6x55x2v.t53r2vE.sv44vv2z4r85.58x@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3ZDOxZgUKC8sArCz6x55x2v.t53r2vE.sv44vv2z4r85.58x@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-68a0f6fb908sor37559807b3.1.2024.08.05.13.17.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3zdoxzgukc8sarcz6x55x2v.t53r2ve.sv44vv2z4r85.58x@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=3NWMhCsY;
       spf=pass (google.com: domain of 3zdoxzgukc8sarcz6x55x2v.t53r2ve.sv44vv2z4r85.58x@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZDOxZgUKC8sArCz6x55x2v.t53r2vE.sv44vv2z4r85.58x@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889060; x=1723493860; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4nDAaRYoPQUybXMrCeQ4yM0etvHUlZuu5xJy/FcdLbg=;
        b=3NWMhCsYGMv3uAapl/bfUE2JoDwd8pozOhbxejawg+Zo+fe/rbcaPw/weRjk0MX2j/
         HXiUuVljpDAX4XAoy6FJf2o94GAW7pUACniYL9fqdok1uypbxw7P4uA2Kn0qO8Pb6Fio
         Qoe9suD1dssBVMoRT/I5ofU4eUSiRl5MgccGWMZBfZKTn7gf/h1S8PpB69Ji5jn9c9Qk
         Sh62PoxAGBbpivjm+miXFjbJp10NVHB3cRO9LiTA7lqewCiSGXQHTaM+CwXjQCYstqeU
         DIbIeF+BRvL2dtg870fEyxRXq9KLV+VcrZycP/PXKiMjqHxFZYSqIQzZrv7FuY7QX5Mj
         UEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889060; x=1723493860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nDAaRYoPQUybXMrCeQ4yM0etvHUlZuu5xJy/FcdLbg=;
        b=Xp+/yg4qFHOuhm6613nhPPedZCUSZXo+cVhjy6cNEnrVQtkUgwNwd2TZd/yRT2KEGN
         VLajC5GQDJ6iEm05n/CkhGivTLgwd7ewGM+QPfwE4+RgrxfAefKiDrvCVQi10JkL107l
         p0y98yqbD0pQkkVMrLL/nbse4/ZysdS7Md1eqnClZCtsvJNe8lEvJy4mf8GHpICHWZQE
         YjGo8b7kJ8k8jVF9+YBQQhpzQncAVotQKfD8CzOIkqeoJlt+XZdqVmKTpXMgzfHg6Y7z
         GUPHm3CqgmvWDqeznJ/zIPEAdWqA47J9zoY7ewXDxzzfgLOWlUpWYaw3Q9eLme1A3+Jv
         IkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUot6W4rUHmeHppAq7iEghqfHXdWHGlPEd71jYsuBNIPKOBk1AnTtjcAswuvz2IbKPFgYZRHe1dDvzO4Gv3P81l0hG8PrnU
X-Gm-Message-State: AOJu0YzCjZospLTmDZnOIymHM2TCogywQtvNUVJdpvfIAFVMK6fL3fv2
	a7WPoC0EmQCz70HWQfTUgJPCkf6a04SbPPUi4Uo3MJOEdIm/12OhIUhyRuJQn7CNdLyEt3WbYg=
	=
X-Google-Smtp-Source: AGHT+IEbUnH+6fvsnahVEKUA+AUBoPinsmnz1TNDh7dXnwnN24dOVdyWczd/BAVBFAEQ1m9fDZI+fItK6w==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a0d:c843:0:b0:665:7b0d:ed27 with SMTP id
 00721157ae682-688b7457a53mr986987b3.2.1722889060159; Mon, 05 Aug 2024
 13:17:40 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:06 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-12-tavip@google.com>
Subject: [RFC PATCH 11/23] test/unit: add flexcomm usart unit test
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: F867X5+sBVFj

Add polling and irq unit tests for the flexcomm usart device model.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/unit/meson.build           |   7 +
 tests/unit/test-flexcomm-usart.c | 321 +++++++++++++++++++++++++++++++
 2 files changed, 328 insertions(+)
 create mode 100644 tests/unit/test-flexcomm-usart.c

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 70e816c034..dcfd2e661c 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -149,6 +149,13 @@ if have_system
       meson.project_source_root() / 'hw/misc/flexcomm.c',
       meson.project_source_root() / 'hw/char/flexcomm_usart.c',
      ],
+    'test-flexcomm-usart': [
+      hwcore, chardev, qom, migration,
+      meson.project_source_root() / 'hw/core/gpio.c',
+      meson.project_source_root() / 'tests/unit/sysbus-mock.c',
+      meson.project_source_root() / 'hw/misc/flexcomm.c',
+      meson.project_source_root() / 'hw/char/flexcomm_usart.c',
+    ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
     tests += {'test-util-filemonitor': []}
diff --git a/tests/unit/test-flexcomm-usart.c b/tests/unit/test-flexcomm-usart.c
new file mode 100644
index 0000000000..645f3b4c26
--- /dev/null
+++ b/tests/unit/test-flexcomm-usart.c
@@ -0,0 +1,321 @@
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
+
+#include "hw/misc/flexcomm.h"
+#include "sysbus-mock.h"
+#include "reg-utils.h"
+
+typedef struct {
+    DeviceState *dev;
+    int sock;
+    Chardev *chr;
+    bool irq;
+} TestFixture;
+
+#define FLEXCOMM_BASE 0x40106000UL
+#define FLEXCOMM_USART_BASE FLEXCOMM_BASE
+
+/* Callback for the interrupt line. */
+static void usart_irq_set(void *opaque, int line, int level)
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
+    struct sockaddr_in sockaddr = {
+        .sin_family = AF_INET,
+    };
+    socklen_t sockaddr_len = sizeof(sockaddr);
+    char chr_opts[] = "udp:127.0.0.1:xxxxx";
+    FlexcommState *s;
+    char buf[] = "xxx";
+    int port;
+
+    /* create "server" socket and bind to a random port */
+    f->sock = socket(AF_INET, SOCK_DGRAM, 0);
+    g_assert(f->sock >= 0);
+    g_assert(bind(f->sock, &sockaddr, sizeof(sockaddr)) == 0);
+    g_assert(getsockname(f->sock, &sockaddr, &sockaddr_len) == 0);
+
+    /* create the an UDP char device and connect it to the sever */
+    port = ntohs(sockaddr.sin_port);
+    g_assert(port != 0);
+    snprintf(chr_opts, sizeof(chr_opts), "udp:127.0.0.1:%d", port);
+    f->chr = qemu_chr_new("udp", chr_opts, NULL);
+    g_assert_nonnull(f->chr);
+
+    /* test connectivity and connect server to UDP char device  */
+    qemu_chr_write_all(f->chr, (const uint8_t *)"210", sizeof("210"));
+    recvfrom(f->sock, buf, sizeof(buf), 0, &sockaddr, &sockaddr_len);
+    g_assert(strcmp(buf, "210") == 0);
+    g_assert(sockaddr_len == sizeof(sockaddr));
+    g_assert(connect(f->sock, &sockaddr, sockaddr_len) == 0);
+
+    f->dev = qdev_new(TYPE_FLEXCOMM);
+    g_assert(f->dev);
+
+    s = FLEXCOMM(f->dev);
+    s->irq = qemu_allocate_irq(usart_irq_set, f, 0);
+    g_assert(qemu_chr_fe_init(&s->chr, f->chr, &error_abort));
+
+    if (data != NULL) {
+        qdev_prop_set_int32(DEVICE(f->dev), "functions", (uintptr_t)data);
+    }
+
+    qdev_realize_and_unref(f->dev, NULL, &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(f->dev), 0, FLEXCOMM_BASE);
+
+    qemu_chr_be_update_read_handlers(f->chr, NULL);
+
+    device_cold_reset(f->dev);
+}
+
+static void tear_down(TestFixture *f, gconstpointer user_data)
+{
+    qdev_unrealize(f->dev);
+    object_unparent(OBJECT(f->chr));
+    close(f->sock);
+    g_free(f->dev);
+}
+
+static void polling_test(TestFixture *f, gconstpointer user_data)
+{
+    int i;
+    uint32_t tmp;
+    unsigned char byte;
+    int fifo_size;
+
+    /* select and lock USART */
+    tmp = FLEXCOMM_PSELID_LOCK_Msk | FLEXCOMM_PERSEL_USART;
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, tmp);
+
+    fifo_size = REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSIZE, FIFOSIZE);
+
+    /* enable USART */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, CFG, ENABLE, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, CFG, ENABLE) == 1);
+
+    /* enable TX and RX FIFO */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLETX, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLETX) == 1);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLERX, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLERX) == 1);
+
+    /* test writes and fifo counters wrap */
+    for (i = 0; i < fifo_size / 2; i++) {
+        /* check fifostat */
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXFULL) ==
+                 0);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY)
+                 == 0);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXNOTFULL)
+                 == 1);
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXEMPTY) ==
+                 1);
+
+        REG32_WRITE(f->dev, FLEXCOMM_USART, FIFOWR, 'a' + i);
+        recv(f->sock, &byte, 1, 0);
+        g_assert_cmpuint(byte, ==, 'a' + i);
+    }
+
+    /* test reads and fifo level */
+
+    for (i = 0; i < fifo_size / 2; i++) {
+        byte = 'A' + i;
+        g_assert(send(f->sock, &byte, 1, 0) == 1);
+    }
+
+    /* wait for the RXLVL to update */
+    WAIT_REG32_FIELD(1000, f->dev, FLEXCOMM_USART, FIFOSTAT, RXLVL,
+                     fifo_size / 2);
+
+    /* check fifo stat */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXFULL) == 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXNOTFULL)
+             == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXEMPTY)
+             == 1);
+
+    /* send until FIFO is full */
+    for (i = fifo_size / 2; i < fifo_size; i++) {
+        byte = 'A' + i;
+        g_assert(send(f->sock, &byte, 1, 0) == 1);
+    }
+
+    /* wait for the RXLVL to update */
+    WAIT_REG32_FIELD(1000, f->dev, FLEXCOMM_USART, FIFOSTAT, RXLVL, fifo_size);
+
+    /* check fifo stat */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXFULL) == 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY) ==
+             1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXNOTFULL) ==
+             1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXEMPTY) ==
+             1);
+
+    /* check read no pop */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFORDNOPOP, RXDATA) ==
+             'A');
+
+    /* now read from the fifo  */
+    for (i = 0; i < fifo_size; i++) {
+        g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFORD, RXDATA) ==
+                 'A' + i);
+    }
+
+    /* check fifostat */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXFULL) == 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY) ==
+             0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXNOTFULL) ==
+             1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, TXEMPTY) == 1);
+}
+
+static void irq_test(TestFixture *f, gconstpointer user_data)
+{
+    char buf[256] = { 0, };
+    uint32_t tmp;
+
+    /* select and lock FLEXCOMM_USART */
+    tmp = FLEXCOMM_PSELID_LOCK_Msk | FLEXCOMM_PERSEL_USART;
+    REG32_WRITE(f->dev, FLEXCOMM, PSELID, tmp);
+
+    /*
+     * set RX IRQ/DMA trigger level to 4 bytes - value 3 in FIFOTRIG
+     *
+     * 0000 - Trigger when the RX FIFO has received 1 entry (is no longer empty)
+     * 0001 - Trigger when the RX FIFO has received 2 entries
+     * 1111 - Trigger when the RX FIFO has received 16 entries (has become full)
+     */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, RXLVL, 3);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, RXLVL) == 3);
+
+    /* enable RX trigger for IRQ/DMA  */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, RXLVLENA, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, RXLVLENA) == 1);
+
+    /* enable RXLVL interrupt */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOINTENSET, RXLVL, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTENSET, RXLVL)
+             == 1);
+
+    /* enable FLEXCOMM_USART */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, CFG, ENABLE, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, CFG, ENABLE) == 1);
+
+    /* enable TX and RX FIFO */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLETX, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLETX) == 1);
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLERX, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOCFG, ENABLERX) == 1);
+
+    /* check interrupt status */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, RXLVL) == 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, TXLVL) == 0);
+    g_assert(f->irq == false);
+
+    /* enable TX trigger for IRQ/DMA  */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, TXLVLENA, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, TXLVLENA) == 1);
+
+    /* enable irq for TX */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOINTENSET, TXLVL, 1);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTENSET, TXLVL) ==
+             1);
+
+    /* check TX irq */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, TXLVL) == 1);
+    g_assert(f->irq == true);
+
+    /* disable irq for TX */
+    REG32_WRITE_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, TXLVLENA, 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOTRIG, TXLVLENA) == 0);
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, TXLVL) == 0);
+    g_assert(f->irq == false);
+
+    /* send 3 bytes */
+    g_assert(send(f->sock, buf, 3, 0) == 3);
+
+    /* check that we have 3 bytes in the fifo */
+    WAIT_REG32_FIELD(1000, f->dev, FLEXCOMM_USART, FIFOSTAT, RXLVL, 3);
+
+    /* and no interrupt has been triggered yet */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, RXLVL) == 0);
+    g_assert(f->irq == false);
+
+    /* push it over the edge */
+    g_assert(send(f->sock, buf, 1, 0) == 1);
+
+    /* check that we have 4 bytes in the fifo */
+    WAIT_REG32_FIELD(1000, f->dev, FLEXCOMM_USART, FIFOSTAT, RXLVL, 4);
+
+    /* and the interrupt has been triggered */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, RXLVL) == 1);
+    g_assert(f->irq == true);
+
+    /* read one byte from the fifo */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFORD, RXDATA) == 0);
+
+    /* we should have 3 bytes in the FIFO */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOSTAT, RXLVL) == 3);
+
+    /* and no interrupts active */
+    g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM_USART, FIFOINTSTAT, RXLVL) == 0);
+    g_assert(f->irq == false);
+}
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
+    g_test_add("/flexcomm-usart/polling", TestFixture,
+               (gconstpointer)(1 << FLEXCOMM_FUNC_USART),
+               set_up, polling_test, tear_down);
+
+    g_test_add("/flexcomm-usart/irq", TestFixture,
+               (gconstpointer)(1 << FLEXCOMM_FUNC_USART),
+               set_up, irq_test, tear_down);
+
+    return g_test_run();
+}
-- 
2.46.0.rc2.264.g509ed76dc8-goog
