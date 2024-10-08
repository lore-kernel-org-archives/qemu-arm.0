Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2289384njb;
        Mon, 7 Oct 2024 18:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXg8ncuO5H0ASgwvIYfiz1PCklBR21/AEevTHQhfT54GsFCymD+Di08y2p1Fim9Bf928pHK+LvhA3pmOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHbgI+WsoRQbd2mO/MghfmIfFUll2f8PGQ6MJIcxgb+Q2pKhiQi+pGQYbDdepelM6tBChjt
X-Received: by 2002:a05:620a:19a2:b0:7ac:a93b:9fa6 with SMTP id af79cd13be357-7ae6f45b611mr2433938385a.30.1728350542862;
        Mon, 07 Oct 2024 18:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350542; cv=none;
        d=google.com; s=arc-20240605;
        b=WZ1ZhVZvYaj0Zaa/XLxl0XEON0BAHHea3n6wdJDaAsMwK2E0ZEyOVkrwq+CQ31Qb/k
         NFD1ydD+8TrBJeI/WMv4IRgCNEIjK3Ao4E4s49rcOVGsXoYT740d/4srENfi9kx0wvog
         qgazA2BivpcXYium5sOUmsKkEjYsd8jcrzjJ1RLUmuQvGS0u3TQcM7pix4xIbuACdsVr
         /6H3B1rjMHWjsAox94iuUX5aho+f8X1XNliCl6/lu1u9GuqAmJmRDwK7WEP2AT/M/J3A
         XIWH9eejo9c08sJwJwwt1N/1obKlzosagS8Jo2h4zcsCpN4j5vZP9i0DTu07Jom7/NjR
         Y0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=KH/2xv+ry9E6fErLW4rxS6RZmIvXaaOZIkrg/WhK4hs=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=SO4ChDNAkuRTtg2Y/cww3eu7HzXErj4HSBWGEx9HsBQ3bg/f7UADOvmVDPCsNe8vGt
         2y29lIJdRg5L9v2ihLCGuGpimQwM7HRmCXhYVqPxwvsUMASfX3O1DnLamnhgAB8yJove
         H5moHgRqvhBzgF0nV2lrcjoEh4/3bhTr4rtv4Tjg9p0IW65PrUgvc3tteYhbtW4LEqY6
         17rPnidWUWz8YZwOMvDjSxh5lXeVWkWSWXpM89QLu9Ke++P57CkDwMElx8IehEauq66D
         u2ymP/ZJqZ3lLEfFm5cZDUeHC6ZANC4GpdK2a9hHDq1gfxspTnA3pl6W1MSk9zbwV7Dy
         96IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=E2IPreJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75e234csi72729191cf.341.2024.10.07.18.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=E2IPreJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxytq-0003f2-Uq; Mon, 07 Oct 2024 21:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nogEZwUKCAEubwjqhpphmf.dpnrfnv-bsnopohov.psh@flex--tavip.bounces.google.com>)
 id 1sxysx-0008CL-Iu
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:36 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nogEZwUKCAEubwjqhpphmf.dpnrfnv-bsnopohov.psh@flex--tavip.bounces.google.com>)
 id 1sxyst-0000Co-78
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:34 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e2baf2ff64so75972957b3.0
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350367; x=1728955167; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KH/2xv+ry9E6fErLW4rxS6RZmIvXaaOZIkrg/WhK4hs=;
 b=E2IPreJg/qpe9C4HZIVYUl2AoLpgWNToFGeYZsH+sMaXZz3c31uhCKtffKNXPBwNZR
 3CXoacMfTSpq8TOnLP9S86M/HI3SJ/NwPeP/B52CunBCG1ecXHXugSQPg5hOVPbUz//0
 j6Rwm+THEUt/hOKd9dDX+i8goQw5ndtBptBe/bNXwGsCFz+BYN4Pr5vZFsIw8unH8xmR
 I9/XArOEGjwu7wjaELZlQcxd1oivqpJhmHGuxWZaSJp/ESqHur71Q0xhWeeUFtcXOE8M
 adWbHJl0xIbX8ogLBSsTllQb14XvWg5Bjxfq4f8UaqV9rHbRvyUPcVxCN2B/wdfGWIE4
 9N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350367; x=1728955167;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KH/2xv+ry9E6fErLW4rxS6RZmIvXaaOZIkrg/WhK4hs=;
 b=er6Ps33R36zg5zll+1oXnAbdY/NceBJ63pFdWZMVySqqQhh19QjPyQkIAUxIHdNRGE
 mvw6BtmJ75KYldlkd53AUWHiqiyOTY908cfvemIIM7KfWRMYtsdJykZKXtaOhFg0v0B4
 iguRrn4SouYPrGpNGFnuetfgA+2ZqQ90gdt3EDka9gaLWHfhdwvqu8/2PDtSCM+Datcu
 tsW8PAiheIT0gGraMO473xm7mDF4yG1bdlbitms+4dz0oe2o4zi9Mo+asugLnFjyo+0u
 4euRqU4NiqUnBtZvD8MJImpfHYQw56Ce/HlEC2BnwOdNa2ukcjVhQ4MLl67Ai6+i+nUt
 af2g==
X-Gm-Message-State: AOJu0Yz7hk2Iy7T81/FWmJLcrukaeRkcmY7uXNV61xdbhRaqxJ+5O0d+
 DyeZ1xx/akCOZnQnX+gHfW/qPlpcAdsZhh+3RbrYtURe2yCHMWCKb3bN+TKOeLQTA3aZ6ffsLA=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a81:ad0b:0:b0:6e2:121c:4509 with
 SMTP id
 00721157ae682-6e2c72bbd4bmr1572397b3.7.1728350366897; Mon, 07 Oct 2024
 18:19:26 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:44 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-19-tavip@google.com>
Subject: [PATCH v2 18/25] tests/qtest: add flexcomm usart tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3nogEZwUKCAEubwjqhpphmf.dpnrfnv-bsnopohov.psh@flex--tavip.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: E0r5XjhU5fd3

Add flexcomm usart polling and irq unit tests.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-usart-test.c | 316 ++++++++++++++++++++++++++++++
 tests/qtest/meson.build           |   3 +-
 2 files changed, 318 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/flexcomm-usart-test.c

diff --git a/tests/qtest/flexcomm-usart-test.c b/tests/qtest/flexcomm-usart-test.c
new file mode 100644
index 0000000000..0ffa49dd6f
--- /dev/null
+++ b/tests/qtest/flexcomm-usart-test.c
@@ -0,0 +1,316 @@
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
+#include <glib/gstdio.h>
+
+#include "io/channel-socket.h"
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
+#include "hw/arm/svd/flexcomm_usart.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+#define FLEXCOMM_USART_BASE RT500_FLEXCOMM0_BASE
+#define DEVICE_NAME "/machine/soc/flexcomm0"
+
+struct TestState {
+    QTestState *qtest;
+    QIOChannel *ioc;
+};
+
+static void polling_test(gconstpointer user_data)
+{
+    struct TestState *t = (struct TestState *)user_data;
+    uint32_t tmp;
+    char byte;
+    int fifo_size;
+    QDict *resp;
+
+    resp = qmp("{\"execute\": \"system_reset\"}");
+    qdict_unref(resp);
+
+    /* select and lock USART */
+    tmp = FIELD_DP32(FLEXCOMM_PERSEL_USART, FLEXCOMM_PSELID, LOCK, 1);
+    REG32_WRITE(FLEXCOMM, PSELID, tmp);
+
+    fifo_size = REG32_READ_FIELD(FLEXCOMM_USART, FIFOSIZE, FIFOSIZE);
+
+    /* enable USART */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, CFG, ENABLE, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, CFG, ENABLE), ==, 1);
+
+    /* enable TX and RX FIFO */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLETX, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLETX),
+                     ==, 1);
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLERX, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLERX),
+                     ==, 1);
+
+    /* test writes and fifo counters wrap */
+    for (int i = 0; i < fifo_size / 2; i++) {
+        /* check fifostat */
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXFULL),
+                         ==, 0);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY),
+                         ==, 0);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXNOTFULL),
+                         ==, 1);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXEMPTY),
+                         ==, 1);
+
+        REG32_WRITE(FLEXCOMM_USART, FIFOWR, 'a' + i);
+        qio_channel_read(t->ioc, &byte, 1, &error_abort);
+        g_assert_cmpuint(byte, ==, 'a' + i);
+    }
+
+    /* test reads and fifo level */
+
+    for (int i = 0; i < fifo_size / 2; i++) {
+        byte = 'A' + i;
+        g_assert_cmpuint(qio_channel_write(t->ioc, &byte, 1, &error_abort),
+                         ==, 1);
+    }
+
+    /* wait for the RXLVL to update */
+    WAIT_REG32_FIELD(1000, FLEXCOMM_USART, FIFOSTAT, RXLVL,
+                     fifo_size / 2);
+
+    /* check fifo stat */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXFULL),
+                     ==, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXNOTFULL),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXEMPTY),
+                     ==, 1);
+
+    /* send until FIFO is full */
+    for (int i = fifo_size / 2; i < fifo_size; i++) {
+        byte = 'A' + i;
+        g_assert_cmpuint(qio_channel_write(t->ioc, &byte, 1, &error_abort),
+                         ==, 1);
+    }
+
+    /* wait for the RXLVL to update */
+    WAIT_REG32_FIELD(1000, FLEXCOMM_USART, FIFOSTAT, RXLVL, fifo_size);
+
+    /* check fifo stat */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXFULL),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXNOTFULL),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXEMPTY),
+                     ==, 1);
+
+    /* check read no pop */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFORDNOPOP, RXDATA),
+                     ==, 'A');
+
+    /* now read from the fifo  */
+    for (int i = 0; i < fifo_size; i++) {
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFORD, RXDATA),
+                         ==, 'A' + i);
+    }
+
+    /* check fifostat */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXFULL), ==, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXNOTEMPTY),
+                     ==, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXNOTFULL),
+                     ==, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, TXEMPTY),
+                     ==, 1);
+}
+
+static void irq_test(gconstpointer user_data)
+{
+    struct TestState *t = (struct TestState *)user_data;
+    char buf[256] = { 0, };
+    uint32_t tmp;
+    QDict *resp;
+
+    resp = qmp("{\"execute\": \"system_reset\"}");
+    qdict_unref(resp);
+
+    qtest_irq_intercept_out_named(t->qtest, DEVICE_NAME,
+                                  SYSBUS_DEVICE_GPIO_IRQ);
+
+    /* select and lock FLEXCOMM_USART */
+    tmp = FIELD_DP32(FLEXCOMM_PERSEL_USART, FLEXCOMM_PSELID, LOCK, 1);
+    REG32_WRITE(FLEXCOMM, PSELID, tmp);
+
+    /*
+     * set RX IRQ/DMA trigger level to 4 bytes - value 3 in FIFOTRIG
+     *
+     * 0000 - Trigger when the RX FIFO has received 1 entry (is no longer empty)
+     * 0001 - Trigger when the RX FIFO has received 2 entries
+     * 1111 - Trigger when the RX FIFO has received 16 entries (has become full)
+     */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOTRIG, RXLVL, 3);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOTRIG, RXLVL),
+                     ==, 3);
+
+    /* enable RX trigger for IRQ/DMA  */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOTRIG, RXLVLENA, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOTRIG, RXLVLENA),
+                     ==, 1);
+
+    /* enable RXLVL interrupt */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOINTENSET, RXLVL, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTENSET, RXLVL),
+                     ==, 1);
+
+    /* enable FLEXCOMM_USART */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, CFG, ENABLE, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, CFG, ENABLE),
+                     ==, 1);
+
+    /* enable TX and RX FIFO */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLETX, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLETX),
+                     ==, 1);
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLERX, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOCFG, ENABLERX),
+                     ==, 1);
+
+    /* check interrupt status */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, RXLVL),
+                     ==, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, TXLVL),
+                     ==, 0);
+    g_assert_false(get_irq(0));
+
+    /* enable TX trigger for IRQ/DMA  */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOTRIG, TXLVLENA, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOTRIG, TXLVLENA),
+                     ==, 1);
+
+    /* enable irq for TX */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOINTENSET, TXLVL, 1);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTENSET, TXLVL),
+                     ==, 1);
+
+    /* check TX irq */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, TXLVL),
+                     ==, 1);
+    g_assert_true(get_irq(0));
+
+    /* disable irq for TX */
+    REG32_WRITE_FIELD(FLEXCOMM_USART, FIFOTRIG, TXLVLENA, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOTRIG, TXLVLENA),
+                     ==, 0);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, TXLVL),
+                     ==, 0);
+    g_assert_false(get_irq(0));
+
+    /* send 3 bytes */
+    g_assert_cmpuint(qio_channel_write(t->ioc, buf, 3, &error_abort),
+                     ==, 3);
+
+    /* check that we have 3 bytes in the fifo */
+    WAIT_REG32_FIELD(1000, FLEXCOMM_USART, FIFOSTAT, RXLVL, 3);
+
+    /* and no interrupt has been triggered yet */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, RXLVL),
+                     ==, 0);
+    g_assert_false(get_irq(0));
+
+    /* push it over the edge */
+    g_assert_cmpuint(qio_channel_write(t->ioc, buf, 1, &error_abort), ==, 1);
+
+    /* check that we have 4 bytes in the fifo */
+    WAIT_REG32_FIELD(1000, FLEXCOMM_USART, FIFOSTAT, RXLVL, 4);
+
+    /* and the interrupt has been triggered */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, RXLVL),
+                     ==, 1);
+    g_assert_true(get_irq(0));
+
+    /* read one byte from the fifo */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFORD, RXDATA),
+                     ==, 0);
+
+    /* we should have 3 bytes in the FIFO */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOSTAT, RXLVL),
+                     ==, 3);
+
+    /* and no interrupts active */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM_USART, FIFOINTSTAT, RXLVL),
+             ==, 0);
+    g_assert_false(get_irq(0));
+}
+
+static void close_ioc(void *ioc)
+{
+    qio_channel_close(ioc, NULL);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    struct TestState test;
+    char *tmp_path = g_dir_make_tmp("qemu-flexcomm-usart-test.XXXXXX", NULL);
+    SocketAddress addr = {
+        .type = SOCKET_ADDRESS_TYPE_UNIX,
+        .u.q_unix.path = g_build_filename(tmp_path, "sock", NULL),
+    };
+    char *args;
+    QIOChannelSocket *lioc;
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    lioc = qio_channel_socket_new();
+    qio_channel_socket_listen_sync(lioc, &addr, 1, &error_abort);
+
+    qtest_add_data_func("/flexcomm-usart/polling", &test, polling_test);
+    qtest_add_data_func("/flexcomm-usart/irq", &test, irq_test);
+
+    args = g_strdup_printf("-M rt595-evk "
+                           "-chardev socket,id=flexcomm0-usart,path=%s",
+                           addr.u.q_unix.path);
+    test.qtest = qtest_start(args);
+
+    qio_channel_wait(QIO_CHANNEL(lioc), G_IO_IN);
+    test.ioc = QIO_CHANNEL(qio_channel_socket_accept(lioc, &error_abort));
+    g_assert(test.ioc);
+    qtest_add_abrt_handler(close_ioc, test.ioc);
+
+    ret = g_test_run();
+
+    qtest_end();
+
+    qtest_remove_abrt_handler(test.ioc);
+    g_unlink(addr.u.q_unix.path);
+    g_free(addr.u.q_unix.path);
+    g_rmdir(tmp_path);
+    g_free(tmp_path);
+    g_free(args);
+    object_unref(OBJECT(test.ioc));
+    object_unref(OBJECT(lioc));
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f35bb52aa2..c7a5bb61e9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -233,7 +233,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_FLEXCOMM')? ['flexcomm-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM') ? ['flexcomm-test', 'flexcomm-usart-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
@@ -350,6 +350,7 @@ qtests = {
   'virtio-net-failover': files('migration-helpers.c'),
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
+  'flexcomm-usart-test': [io],
 }
 
 if vnc.found()
-- 
2.47.0.rc0.187.ge670bccf7e-goog

