Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2639333ejg;
        Mon, 22 Jan 2024 09:38:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZAvz3PJAUaSmpymu0EVKO/tEfdVVd81NiwD54TwjwjIQUCZAkGABY1OTtBJQCzS/zCwx2
X-Received: by 2002:a05:620a:1921:b0:783:3e95:701e with SMTP id bj33-20020a05620a192100b007833e95701emr6423031qkb.13.1705945082574;
        Mon, 22 Jan 2024 09:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705945082; cv=none;
        d=google.com; s=arc-20160816;
        b=rxSaK2hWp//k8Cnf/JaZBW8LG8MfS0zsm+QeYO5qQF/Veov3zziu83GUx0GypXvul3
         ceGj55aVw2vWBELLbmmKZSVXpzDIxv78bZEca3Docyq2uVewWEEJBJltPIJ6ZVIf0cwv
         GjRrXZvMnrZi7C+KHw4iO1wEt/tIgzcFcjhLkKZWBaBhmFZO4zzpfrc0WBQHrFT4FzV6
         TmN75St/KYNIz+x1vU4IEtNTLwhenz7+tAHLk6eZH9QKU7VcL+Dej4uF46YG/HeLm+IT
         h7c/b9XbwbmMXHeZbjLaSiRzNxXgEeTyrLN/X8quUJzylzTsFVzc2m1QCEo9kxPjNzOP
         olmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=dsYDTmZ2HQQJmcSg2LjhT57g1aKQVkj63I5GpCS+rhE=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=NBKwlWMpziIpQT7fBXmUmp6A+WdQUWVRRSXVYzCj7Nl596tBDF5BJt8lDDZiRIoKG1
         Pvr1k4270oVKJX2IUmjBy6XMYYIjBbQrfLX/FTTQHvp9RPcbPUiv7f16Etx4ghwd3hcE
         LPhOXhxDfgpytQANFsg/5L2sa52Myx9xFlW3jP06k2ac1/C25DKY6EePBj+9+vGeUGKi
         AYusvuuKGWKbdN8cLqGWIZt35prDVQKUoRUgmsgYjcP1WHtL/0/x6lDbp6OjRp2+NB22
         NCzVmrdM+kBTYAJxiwfCYUbRAiDISkBZlGfgySTGnhW0/t1bBH0NmMVO1L77aS1EHj21
         hqfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eBiCaQjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b28-20020a05620a089c00b007819c577ed0si5830709qka.693.2024.01.22.09.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 09:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=eBiCaQjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRyEk-0000AU-6e; Mon, 22 Jan 2024 12:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zKeuZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com>)
 id 1rRyEb-00006m-Ks
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:22 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zKeuZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com>)
 id 1rRyEY-0003xQ-4T
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:20 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5ff7cf2fd21so35123287b3.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705945036; x=1706549836; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dsYDTmZ2HQQJmcSg2LjhT57g1aKQVkj63I5GpCS+rhE=;
 b=eBiCaQjvdr0hVBZhgy2yI/1LKq6o8bWXWbRDwDwrZhd6xQwa9/0MoS3eJ+NvbE6Fl/
 0PEvu6OiuDx6cwu43tIsndCKVXKapo1jponIXP6IzfGiRM6Qypg+DUldsfIuPQMwrHR/
 HKYM9q3zQmz7J8GKOhm6t7nQYkTERedwDrmN0p2Dow9UJ0+E1ctfhiZs/uQ3nhOq7H8E
 lM7+euCSU8+zyNwES+rBx+0OzNTlZqOd/wzCzNCtnldhLaLozhR4tlqYrfjsVoDrdHlg
 XUHXyi9HBjKWg0vl5ySyJIQRSfuLRUj7NdGPhBFE6Sa2/m+QhX6wfxkKBnbbn5fVFNwB
 ad0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705945036; x=1706549836;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dsYDTmZ2HQQJmcSg2LjhT57g1aKQVkj63I5GpCS+rhE=;
 b=ZAEBuAA/xrdt2LVBiMsSsBaWrr/ftrSiVCasFwAvVBetFgeL3wuvVpo/b0Z+B1zzo7
 mC6Id+BO7lr6KufwhVmPUfHwEN3PLquQZ2ATE21Mtj+nrW4MXZXFTSvVWsHG/A68A/+U
 bsFDceamVNTG8QitST1uFvn6785+DBqJ1BtNc6PC6DgeU+lXTlA5PRnVHrRwDH4Vd6Lt
 m3k15aaaj5mxZaQz9ogqpOOAO0hX511pHKI182+GSZVQbHEzmWzpS+MTmktIA5TLjh4A
 saK2ITdD02lVGMO3aJzMTfCZYzmWi5xk7oLzpREOaorljuRXS8sWGFEwqADcRmw77rHZ
 x1YQ==
X-Gm-Message-State: AOJu0Ywp3uUONxVfbtM4y4BCi4gR/UftNXlLYhV7MQz83dXmFuLD1YWk
 LxKCxhyReqLqezz9JiPdH16DP5nE5IMbB5XGFl9r9eqxeZMHDA2t6D0iq7MpUl3p/HHssK7mXj0
 D5eFhV7C6PMU0v8nnP0MR6hpQyA==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:79d2:0:b0:5ff:8182:bc63 with SMTP
 id u201-20020a8179d2000000b005ff8182bc63mr1931560ywc.4.1705945036142; Mon, 22
 Jan 2024 09:37:16 -0800 (PST)
Date: Mon, 22 Jan 2024 17:37:00 +0000
In-Reply-To: <20240122173706.4019545-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240122173706.4019545-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122173706.4019545-4-nabihestefan@google.com>
Subject: [PATCH v14 3/9] hw/misc: Add qtest for NPCM7xx PCI Mailbox
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3zKeuZQwKCAsylmtsp34pqlyrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--nabihestefan.bounces.google.com;
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
X-TUID: H5K8IkzcZLhA

From: Hao Wu <wuhaotsh@google.com>

This patches adds a qtest for NPCM7XX PCI Mailbox module.
It sends read and write requests to the module, and verifies that
the module contains the correct data after the requests.

Change-Id: I2e1dbaecf8be9ec7eab55cb54f7fdeb0715b8275
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 tests/qtest/meson.build             |   1 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 242 ++++++++++++++++++++++++++++
 2 files changed, 243 insertions(+)
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index fd40136fa9..53c8a62f33 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -184,6 +184,7 @@ qtests_sparc64 = \
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
    'npcm7xx_gpio-test',
+   'npcm7xx_pci_mbox-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
    'npcm7xx_sdhci-test',
diff --git a/tests/qtest/npcm7xx_pci_mbox-test.c b/tests/qtest/npcm7xx_pci_mbox-test.c
new file mode 100644
index 0000000000..56103df2a8
--- /dev/null
+++ b/tests/qtest/npcm7xx_pci_mbox-test.c
@@ -0,0 +1,242 @@
+/*
+ * QTests for Nuvoton NPCM7xx PCI Mailbox Modules.
+ *
+ * Copyright 2024 Google LLC
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
+        uint8_t offset_bytes[8];
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
+        stq_le_p(offset_bytes, offset);
+        rv = write(fd, offset_bytes, sizeof(uint64_t));
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
+        uint8_t offset_bytes[8];
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
+        stq_le_p(offset_bytes, offset);
+        rv = write(fd, offset_bytes, sizeof(uint64_t));
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
2.43.0.429.g432eaa2c6b-goog

