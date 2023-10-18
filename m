Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp19454ejb;
        Wed, 18 Oct 2023 11:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPn/1qWN1Wn94DpDMeaVwSxhhV+5MOS/h3FO5sqUacQZw3EFaRsR+T/yOP+AI/CK6tlPg0
X-Received: by 2002:a05:6214:43c1:b0:66d:63d5:3fc2 with SMTP id oi1-20020a05621443c100b0066d63d53fc2mr54606qvb.14.1697652808498;
        Wed, 18 Oct 2023 11:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652808; cv=none;
        d=google.com; s=arc-20160816;
        b=JENlU5SUxPy+CB/vBKlqNZXVwUm7QTkcp5hRgG3LZcgcUJ01Hgz96Hfls2er6W1PvO
         mtN5Fl/UbOlEdcDiUGPXYOxN23MKYA9muCM6IgyR+x34QtPODnoUOyerK3/vAVcL+oeD
         4+xnKpnuLJHLK4y07Hmzcen927C30RTeuBQfIfvnkVf3vtVb2/SoaabP4+oCM4ISOUcL
         oYgAf8CtSm3OR/vB6LMggkb9MbWu9amdgmteJKAETWD0z0YsHP3C9jUZUZdeDb738gWr
         bqhm8JnnKewKS/g/kWI7CrQr/rkqS8BIwJ7fPZmbvFOQkEW1pt9Uyr1paHv5z0Y2/OyI
         PAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=KH9WNXKK+Fia+84fupKfWqQBd+GDIkl8AvAXT+hXQzU=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=GY4UYvmroBpm0ksvQ3XGFMapMDFTHgAvgmSFgU/dfaOEYmr0g7xsphxAWlJw/O3r7L
         JhhbMsqWxUbUAzBe5jtidMPdKUVismMpKFHq/YJhOd60rVnkZCJ410tnV6qHYG2wtHmb
         X5/QyGJvvi6BWjtFTyg4nrtjhvm68kGYnd8RmCZKAgy7wTGKhjrJ0RoPxc/5WyUc5DZb
         GxaVacR9RbQMRVdGoZ9MMzmtz5zg1Xe1wpap+dERg+2uV9idOTfwLAwCKzYv9mF5AZZ4
         SMMDmJo2lBSEZLoNAuNP4MVAzt7pvQHjIiMeySzy4YQNS3XH3N2D/uAsh99gaMCu/73c
         hw2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fLS4mHC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18-20020a0ce212000000b0065af80f546asi329091qvl.2.2023.10.18.11.13.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:13:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=fLS4mHC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtB2h-0008VJ-Tw; Wed, 18 Oct 2023 14:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MiAwZQwKCGMOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1qtB2f-0008Qy-OZ
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:13 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MiAwZQwKCGMOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com>)
 id 1qtB2a-0008HZ-3f
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:13:13 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7e4745acdso110890297b3.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652787; x=1698257587; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KH9WNXKK+Fia+84fupKfWqQBd+GDIkl8AvAXT+hXQzU=;
 b=fLS4mHC5nEpG4MdljgSxe8MivS586rhyk4q/XvqcsnFTx2aLeEFLr06CMLfrKDFT3Z
 FVAZ3hU/Ly3YZWplaglxCdRLfeWXCwFzJoEiSoVBe+Wf1QljBXUe5Ru0EkV0kLYmKXSS
 MrugjWTz8YH1iKaxLpsegIXj2otz206zoai1r82ppOQD/7CMjVIHB0umZcChN9CAmw27
 iM/+vo5BOUS0b/v/yGzK0LSjWWuQqlK2piSOFnAxzFwKTvRmuV/iG2gSDbP4TSTd+B0d
 f18nUS0x+pskbSMuo+YjKQVpNq686JjdJHv5Rp2rHGW5YWuQE7FiepVoz5xAiGw3y6nS
 kuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652787; x=1698257587;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KH9WNXKK+Fia+84fupKfWqQBd+GDIkl8AvAXT+hXQzU=;
 b=bpTLUv5oFrtKujc2ky3SXgfTfFT5ioobQJ91xNfUxp2Z6cRRQFNDrLLHlH1eomlDT8
 ++YqrZwshBN1mfTWxmowRg/1E88HVu6Er5FgGOxw9vOU3jqERCMpMUeGDrb/dkP99jqT
 a36y5ZUnyk/jYnjZV0S6uPCT/nbv91imeyG4reUth0x2qDYlnWRAhbVMEXVR0LojJP57
 f6AlM+d7Xm6o5gKbvuFW2BXimpqPjSDDdlfiDsIqwKk48T2112zjPPriABkjYPFQRyVa
 YEpV747fcnbRgKE3n/Vk/5Aw53J7wEA81Ugp5cEzsl487K1G7q6wKX6KtKjqjIvBAEvv
 OXTw==
X-Gm-Message-State: AOJu0YzdAvyXK5xKt5cBcvHJ4AwrWMiXERtLUnRhok/twOMLUjxRQpPn
 S4xaLG2FaIBbh+ck3g2Nl3o58Vl3Ym3mjMr0qXY=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:4944:0:b0:58c:b45f:3e94 with SMTP
 id w65-20020a814944000000b0058cb45f3e94mr626ywa.8.1697652786946; Wed, 18 Oct
 2023 11:13:06 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:12:51 +0000
In-Reply-To: <20231018181259.748819-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181259.748819-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181259.748819-4-nabihestefan@google.com>
Subject: [PATCH v4 03/11] hw/misc: Add qtest for NPCM7xx PCI Mailbox
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3MiAwZQwKCGMOBCJIFTUFGBOHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
X-TUID: +p2dlAfumPVL

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
index 66795cfcd2..05d26e9292 100644
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
2.42.0.655.g421f12c284-goog

