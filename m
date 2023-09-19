Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3844689ejb;
        Tue, 19 Sep 2023 13:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELEER9cfZI19oI5qZUcmgFShRmeDHzx81WLkuMDTlgHLTBHbukTkOdPSFsGZUYuH8rcLYw
X-Received: by 2002:a05:6870:2186:b0:187:92fb:6ecb with SMTP id l6-20020a056870218600b0018792fb6ecbmr443214oae.20.1695153897891;
        Tue, 19 Sep 2023 13:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153897; cv=none;
        d=google.com; s=arc-20160816;
        b=nMBhJhq24eiX3XWnI4vamDCC2zRQSZXWrgMZzinV0y8zTHztxjleTcNIM88pQBYkXq
         O936KsPs9ZCff/fird2RwjpKqNQZzI3etX7/Nkvg9GFTxr/bdCIAKlVvpBQzeKUfaLyc
         yHAYz+52UB2BN/FbMnnNbvFBulx8SMJCK5/1BanCjQfR8O08LNmVcLBfNjJ+BaAzKD8A
         rZL+sySNdqinoSHtCWLgaXmnPGUxrA7KDWdz7quec+CPbo3bxH4dOQZ4e2sWEcRJmLXk
         PONGG2V0Gape+MWrHikwmfNeCCzrAY3eKkKLdCVrn1w9bLglAWvGThsjmnVV4y0dzOM/
         dq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=YdoczYpJQso2DigCvAYQc13+OQqGsruPs90RBpgchEw=;
        fh=31Pgf1blV3SQPmQ8WOxvGy7Z8ujSo7iGO5C67upv8D4=;
        b=u4ks6ehQgSSb2W+dzWdKyoEE0NJbGjcqwxAmFUNOajry7vzTRYoR/CoUN/tW68B5Tq
         /0pWwMAsdxM9LQLYzmNs37/A2RVa3Wd26fylaZ37Jp+blg2hHlyy/QnUlrhKfzWMo9yM
         meHRtc5ePYLfXE+7JjfRWwCIEO+pJTUUX/Lu8uE5f2zvX8mjqwXQ5STWFu2gWyaaAAej
         HLJUUTLDq/NspO1QuzMx2Jm7bcUM9ETZAyXrj8L6FUdoL73TUVEoYv+1aGSeFLA4PctF
         X565nFbdS9UnHZNpxI9VfDSqrtmLyBnYVxNf7PnSBsWqmAUBw4c0ZDmBr6sdoe4BuCpE
         5N6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="J/engR8l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27-20020a05620a041b00b00773adb00e94si3536992qkp.251.2023.09.19.13.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="J/engR8l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxD-0005af-KF; Tue, 19 Sep 2023 16:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GeEJZQwKCDIbOPWVSghSTObUccUZS.QcaeSai-OfabcbUbi.cfU@flex--nabihestefan.bounces.google.com>)
 id 1qieyy-000566-DR
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:57:56 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GeEJZQwKCDIbOPWVSghSTObUccUZS.QcaeSai-OfabcbUbi.cfU@flex--nabihestefan.bounces.google.com>)
 id 1qieys-00011D-QS
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:57:55 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d8186d705a9so6505910276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146265; x=1695751065; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YdoczYpJQso2DigCvAYQc13+OQqGsruPs90RBpgchEw=;
 b=J/engR8lWVhdqIrmIfoUTLG0uXmDInIO/PGuax6pLCYCHPjYQp0xsk2Ze3EPwJCeJe
 GGZULBfUAN2q6XXXrkINbRisEbFdHxb5oJQLgvf9NHQn2DptC3ay+iw63Ub04m3G33R6
 k3ulRfxX/rpFLu9KyRcZ2yVBNG6iB1APk65j6uK5L5GC0XK7K/QhkQ1sfQRRUVWQxFEE
 K1O/g66KuDYr/XYO85MSaqxGR4O6FKqLSRPnfyPmzzIw3/xckBbRxmmPBuSTj/KkPAWo
 Vjr6dCvViqlwlTPsmYI+ltRIX0oZd+Qjxm34NX4qZY5HJMpljQ8TZCVHXRN0pTZt8XXc
 Agiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146265; x=1695751065;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YdoczYpJQso2DigCvAYQc13+OQqGsruPs90RBpgchEw=;
 b=tbZPZqZ4fzfXRSqCHnChaaGURAbh+vFqcG2zpDIa0V69yNJh6w6g6pYgVGo3wZzu6a
 5wiLH1LtyD5kmzxe4W1huJmU6UmtrXxat9W5eKOGm1qcdGVY5b2EYX3x3DXjeUI8a2qU
 LtO1EueDICsK3KolAxd3o7BTiEHr39TNqxCtIr51kKUbG4+O0Uf9qcHdo+xtoyHFYD8t
 JpvDt1vf0ik2ENzkAJD/4aBjgpC52FLGFc93X7aSSF4Fc67+hLFsfsP8GjPDjiyZJKl9
 x7VrbRrnX52hKj2acO15KW4TQpa+zna9d3C0nk08PX3fnoscjWUxojR4hCagAfP8yr5M
 vfxg==
X-Gm-Message-State: AOJu0Yw2jJFlyPpbRe+VdMCeyYMiis/FTf6P2dcjZ6eTABcRCRn0jG4l
 Lhz7VpFkTiIJWHXNoXdQ0zftqIiCMFCOClAB8NE=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:690d:0:b0:d81:9507:8d72 with SMTP
 id e13-20020a25690d000000b00d8195078d72mr6525ybc.10.1695146265238; Tue, 19
 Sep 2023 10:57:45 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:14 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-4-nabihestefan@google.com>
Subject: [PATCH 03/14] hw/misc: Add qtest for NPCM7xx PCI Mailbox
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3GeEJZQwKCDIbOPWVSghSTObUccUZS.QcaeSai-OfabcbUbi.cfU@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:13 -0400
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
X-TUID: cgVKhESTDXud

From: Hao Wu <wuhaotsh@google.com>

This patches adds a qtest for NPCM7XX PCI Mailbox module.
It sends read and write requests to the module, and verifies that
the module contains the correct data after the requests.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 tests/qtest/meson.build             |   1 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 ++++++++++++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b071d400b3..5adf12b45f 100644
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
2.42.0.459.ge4e396fd5e-goog

