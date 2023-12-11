Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp363214ejo;
        Mon, 11 Dec 2023 09:31:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAjdlj/C5zuTiQ1ricLuIjik9Xd/qSVZi8RTlapoD1ToTVRqZKcKossrfJ2JTbk50NHyll
X-Received: by 2002:a05:6214:952:b0:67a:a721:f31a with SMTP id dn18-20020a056214095200b0067aa721f31amr5403191qvb.90.1702315911929;
        Mon, 11 Dec 2023 09:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702315911; cv=none;
        d=google.com; s=arc-20160816;
        b=nfS3C8RTFYcoJ7/xyA5LCEIIvJhLe9y5hKeO/0RwVgxdQfMNmLctlAcaGh1reE6YbY
         vMExvgLfMgPkpdBQdVU4vOoZqsuA2v0lOGEsLpik2c3OsFr+PiVNurERcI5chBIJLl0g
         vbA+CD0cS2DcDqT3rZLOwnH+dGjIxTZaJsOWOS0p/TRZoiAtonhZX/TewAQMtbdF3sVL
         XBD3BdU4G73Po8JvzrXaMuT5JiAqIqfTiTM1Sr54LQUL6J18nJzkVgQvzqzpzvf5ERDW
         KFW1xNaPGXE5C7wYlikoVIQDwiaj40gJk+nlLeZ8xyUPvRPLI7iZZDEyBs7Ijf8JHEzo
         8NKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=/PEWmue0IS+iAKLJPeKzFIN+98caKs6Z7gp1XYczXO4=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=ZuAs/MyfybENUuPsMUgI8LcvpIA6/UQRTvKLQ4WSNTNNMKamb/sK4a8oRREk7/mWQb
         gKkh9DHEAZ4CoKIMf9qHzUdnyOzSaQKaMAR+jY9ey4SyK3cOTd6ESbXoYINQcqubXNr0
         FdgewQlR85UPh7H6lcATKRaUMDq/5SWWsLzomb31Dbk7vl3ciGth8pzC4gBcQujNUoZ/
         SsUA4wMwNKmrH3GJjyQsCQ1GepAys0GPKj/nJrElKb1MShVAxafAqtz+0ezk3Y4XwsnA
         y6Cjmf3lqS8fSmbT/+Ui9NQHj5GDAUYl7QbgXS+xY7H0PVsbr1x55ssutnF7vdy/FgK2
         l52Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Tx8FaVYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a0cea2c000000b0067a2589e2e9si8835547qvp.427.2023.12.11.09.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Tx8FaVYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCk6w-0000gJ-Qj; Mon, 11 Dec 2023 12:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IEd3ZQwKCL0qdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com>)
 id 1rCk6r-0000cw-9a
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:25 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IEd3ZQwKCL0qdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com>)
 id 1rCk6k-0004kh-2N
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:24 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5e19414f714so3683787b3.0
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702315808; x=1702920608; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/PEWmue0IS+iAKLJPeKzFIN+98caKs6Z7gp1XYczXO4=;
 b=Tx8FaVYfU/3b0qOXgTbKTxF1c72IwWRFCLCUZspjuktszeZD7te+Vdnt5TmjMJIU4w
 eBbfqRicHxdjRnDkpZgX8blnakfVRvIn7hftrRRmdbC949QfnCumjZZjgTcn6azj6hKt
 0L2W4+sDxRPiSNL8PcFDcj+o+yv7Hz/AtNExwu7xAxdqK4OgCDpzQaXz0E+L8YA4D153
 DszJtRzhUNjFen+4+lIG1l/rbHwYQiTCK/jVrx8kIRd520J5JYeA1DzGtdnR1xfMhDIL
 tbzQqsV9yuzHWvlNqx03IDeq+TVAKZvJ7j/+54PZQkQNF2F7aE4GANpe+h+JF8NjwmQZ
 Hw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315808; x=1702920608;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/PEWmue0IS+iAKLJPeKzFIN+98caKs6Z7gp1XYczXO4=;
 b=U7KO3HN2knJjtIu1HgArmNnsFP22LOJ+/MV7u55kGVPmn1hLm7C2pDdcDBSXlTfA8h
 jTWx94xreodvXCeD8mc/4muaXfbkRIZQWdqpwrbkeQYiaEakgsiZcTTNTYegphOeyc4r
 ffISpy89GYndbA9DawbNSsnhDrU3eDNPAIDrKzF2peO2KwDM9Vga4tIHkT0ZPakLPlKW
 MaBm4qfPOkbgJFW07AJN39tSIEo93NvlvtR590806IDxcU5HTKnCxtTEe+j6ttGkHUKe
 ThipZv/rhs5z4P9oEu+iCKM0K1o2bh3DYk0pzEjjrlqTWn8VnLpmOmRlacS0OBU+FGE0
 4VVw==
X-Gm-Message-State: AOJu0YzWKNBehg5vN3DtdpH9ljdu1oxR0b2F8/0G7s0pvgFA0nujmFj8
 kl/MFmxVDQC/FR/diiCovjbbnd3OM4/L8b17mmA=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:c09:b0:5d3:3aa4:6f3a with
 SMTP id cl9-20020a05690c0c0900b005d33aa46f3amr48160ywb.3.1702315808407; Mon,
 11 Dec 2023 09:30:08 -0800 (PST)
Date: Mon, 11 Dec 2023 17:29:44 +0000
In-Reply-To: <20231211172953.3164357-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211172953.3164357-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211172953.3164357-4-nabihestefan@google.com>
Subject: [PATCH v6 03/11] hw/misc: Add qtest for NPCM7xx PCI Mailbox
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3IEd3ZQwKCL0qdelkhvwhidqjrrjoh.frpthpx-dupqrqjqx.ruj@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: 3Q92CRSfudlc

From: Hao Wu <wuhaotsh@google.com>

This patches adds a qtest for NPCM7XX PCI Mailbox module.
It sends read and write requests to the module, and verifies that
the module contains the correct data after the requests.

Change-Id: Id7a4b3cbea564383b94d507552dfd16f6b5127d1
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 tests/qtest/meson.build             |   1 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 ++++++++++++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 47dabf91d0..2ac79925f9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -183,6 +183,7 @@ qtests_sparc64 = \
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
    'npcm7xx_gpio-test',
+   'npcm7xx_pci_mbox-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
    'npcm7xx_sdhci-test',
diff --git a/tests/qtest/npcm7xx_pci_mbox-test.c b/tests/qtest/npcm7xx_pci_mbox-test.c
new file mode 100644
index 0000000000..24eec18e3c
--- /dev/null
+++ b/tests/qtest/npcm7xx_pci_mbox-test.c
@@ -0,0 +1,238 @@
+/*
+ * QTests for Nuvoton NPCM7xx PCI Mailbox Modules.
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "libqtest-single.h"
+
+#define PCI_MBOX_BA         0xf0848000
+#define PCI_MBOX_IRQ        8
+
+/* register offset */
+#define PCI_MBOX_STAT       0x00
+#define PCI_MBOX_CTL        0x04
+#define PCI_MBOX_CMD        0x08
+
+#define CODE_OK             0x00
+#define CODE_INVALID_OP     0xa0
+#define CODE_INVALID_SIZE   0xa1
+#define CODE_ERROR          0xff
+
+#define OP_READ             0x01
+#define OP_WRITE            0x02
+#define OP_INVALID          0x41
+
+
+static int sock;
+static int fd;
+
+/*
+ * Create a local TCP socket with any port, then save off the port we got.
+ */
+static in_port_t open_socket(void)
+{
+    struct sockaddr_in myaddr;
+    socklen_t addrlen;
+
+    myaddr.sin_family = AF_INET;
+    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    myaddr.sin_port = 0;
+    sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+    g_assert(sock != -1);
+    g_assert(bind(sock, (struct sockaddr *) &myaddr, sizeof(myaddr)) != -1);
+    addrlen = sizeof(myaddr);
+    g_assert(getsockname(sock, (struct sockaddr *) &myaddr , &addrlen) != -1);
+    g_assert(listen(sock, 1) != -1);
+    return ntohs(myaddr.sin_port);
+}
+
+static void setup_fd(void)
+{
+    fd_set readfds;
+
+    FD_ZERO(&readfds);
+    FD_SET(sock, &readfds);
+    g_assert(select(sock + 1, &readfds, NULL, NULL, NULL) == 1);
+
+    fd = accept(sock, NULL, 0);
+    g_assert(fd >= 0);
+}
+
+static uint8_t read_response(uint8_t *buf, size_t len)
+{
+    uint8_t code;
+    ssize_t ret = read(fd, &code, 1);
+
+    if (ret == -1) {
+        return CODE_ERROR;
+    }
+    if (code != CODE_OK) {
+        return code;
+    }
+    g_test_message("response code: %x", code);
+    if (len > 0) {
+        ret = read(fd, buf, len);
+        if (ret < len) {
+            return CODE_ERROR;
+        }
+    }
+    return CODE_OK;
+}
+
+static void receive_data(uint64_t offset, uint8_t *buf, size_t len)
+{
+    uint8_t op = OP_READ;
+    uint8_t code;
+    ssize_t rv;
+
+    while (len > 0) {
+        uint8_t size;
+
+        if (len >= 8) {
+            size = 8;
+        } else if (len >= 4) {
+            size = 4;
+        } else if (len >= 2) {
+            size = 2;
+        } else {
+            size = 1;
+        }
+
+        g_test_message("receiving %u bytes", size);
+        /* Write op */
+        rv = write(fd, &op, 1);
+        g_assert_cmpint(rv, ==, 1);
+        /* Write offset */
+        rv = write(fd, (uint8_t *)&offset, sizeof(uint64_t));
+        g_assert_cmpint(rv, ==, sizeof(uint64_t));
+        /* Write size */
+        g_assert_cmpint(write(fd, &size, 1), ==, 1);
+
+        /* Read data and Expect response */
+        code = read_response(buf, size);
+        g_assert_cmphex(code, ==, CODE_OK);
+
+        buf += size;
+        offset += size;
+        len -= size;
+    }
+}
+
+static void send_data(uint64_t offset, const uint8_t *buf, size_t len)
+{
+    uint8_t op = OP_WRITE;
+    uint8_t code;
+    ssize_t rv;
+
+    while (len > 0) {
+        uint8_t size;
+
+        if (len >= 8) {
+            size = 8;
+        } else if (len >= 4) {
+            size = 4;
+        } else if (len >= 2) {
+            size = 2;
+        } else {
+            size = 1;
+        }
+
+        g_test_message("sending %u bytes", size);
+        /* Write op */
+        rv = write(fd, &op, 1);
+        g_assert_cmpint(rv, ==, 1);
+        /* Write offset */
+        rv = write(fd, (uint8_t *)&offset, sizeof(uint64_t));
+        g_assert_cmpint(rv, ==, sizeof(uint64_t));
+        /* Write size */
+        g_assert_cmpint(write(fd, &size, 1), ==, 1);
+        /* Write data */
+        g_assert_cmpint(write(fd, buf, size), ==, size);
+
+        /* Expect response */
+        code = read_response(NULL, 0);
+        g_assert_cmphex(code, ==, CODE_OK);
+
+        buf += size;
+        offset += size;
+        len -= size;
+    }
+}
+
+static void test_invalid_op(void)
+{
+    uint8_t op = OP_INVALID;
+    uint8_t code;
+    uint8_t buf[1];
+
+    g_assert_cmpint(write(fd, &op, 1), ==, 1);
+    code = read_response(buf, 1);
+    g_assert_cmphex(code, ==, CODE_INVALID_OP);
+}
+
+/* Send data via chardev and read them in guest. */
+static void test_guest_read(void)
+{
+    const char *data = "Hello World!";
+    uint64_t offset = 0xa0;
+    char buf[100];
+    size_t len = strlen(data);
+
+    send_data(offset, (uint8_t *)data, len);
+    memread(PCI_MBOX_BA + offset, buf, len);
+    g_assert_cmpint(strncmp(data, buf, len), ==, 0);
+}
+
+/* Write data in guest and read out via chardev. */
+static void test_guest_write(void)
+{
+    const char *data = "Hello World!";
+    uint64_t offset = 0xa0;
+    char buf[100];
+    size_t len = strlen(data);
+
+    memwrite(PCI_MBOX_BA + offset, data, len);
+    receive_data(offset, (uint8_t *)buf, len);
+    g_assert_cmpint(strncmp(data, buf, len), ==, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    int port;
+
+    g_test_init(&argc, &argv, NULL);
+    port = open_socket();
+    g_test_message("port=%d", port);
+    global_qtest = qtest_initf("-machine npcm750-evb "
+        "-chardev socket,id=npcm7xx-pcimbox-chr,host=localhost,"
+        "port=%d,reconnect=10 "
+        "-global driver=npcm7xx-pci-mbox,property=chardev,"
+        "value=npcm7xx-pcimbox-chr",
+        port);
+    setup_fd();
+    qtest_irq_intercept_in(global_qtest, "/machine/soc/a9mpcore/gic");
+
+    qtest_add_func("/npcm7xx_pci_mbox/invalid_op", test_invalid_op);
+    qtest_add_func("/npcm7xx_pci_mbox/read", test_guest_read);
+    qtest_add_func("/npcm7xx_pci_mbox/write", test_guest_write);
+    ret = g_test_run();
+    qtest_quit(global_qtest);
+
+    return ret;
+}
-- 
2.43.0.472.g3155946c3a-goog

