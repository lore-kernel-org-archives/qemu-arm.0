Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp376249ejo;
        Mon, 11 Dec 2023 09:53:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs6jPxWodbMNjUHL8478VVWNLbzB/krqnQ9gHHVBaN7X48UtMrAf3Gg5aZAyXYvbaK0wK4
X-Received: by 2002:a0c:d80a:0:b0:67e:aa84:b093 with SMTP id h10-20020a0cd80a000000b0067eaa84b093mr5474295qvj.22.1702317230588;
        Mon, 11 Dec 2023 09:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702317230; cv=none;
        d=google.com; s=arc-20160816;
        b=rTD144VfKBWphqfT6/Kooz8n47qztvBO8AwdhyByPTiMYmkp5y9ItWlWyTuftE8/sO
         Zh/pYPmvLmVvbo+NbgT+zkyv8ma8DwLAgsfZ1auF0E/7lZbK4u7d61Rc+u+B043bx1Oe
         CxbhIbrAylcDYdFjW7r0TTesFsZMHkBR+BWICj+Yr5urpXinEC4RP0Jnv0e1T12YxMGy
         6Eo9VY8hlfzRNIPAhrwpCZsDviOkSD71KTsIbhVPw3CelpOxGpdYMY9pJnjxLfgBnOoR
         0h5ZVCX9+oU8cZvjZ+v37PcJk1qqwKj0ndk20qWeeOD+GwgmERWb3ZHSvtE0wSOtspFQ
         oG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=gqxsBDqoz9XDs17BoA3JvzrDX8A2CkxcCB14NDOaKvA=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=h7kl6OlHZI55klxzXFPFquRoQjlhRCTb1VDibiRrYZpSfUoBvFyUWE/MXpIWZRnhbD
         na6tWBF4N9PUsxYWG/m44SgIVZXe9/h92MyAGcg+UBjYbZo6Rjb8Yhtk8BFyPoNAxjRy
         6CmAe4NlRNn4Qt5c597vdTzZ5Ulnkc1ahsUHx4xQFnDu7am9z9uLvkOKbpgbIvX8Te18
         8FQa3yPK1/hSgR/fQwtMz9hrczBB+C8l7NL+zLvEmFuA9+EoiUcS/LKZRy/0oXW9U8DN
         bLkhsXEnAICWbQo9hYaJyq07jtJo5gPB0XrNuZfh8TOQGmpWLWbwwEs2lxz9z45klsWp
         r53g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DGcoKTQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a0ceaca000000b0067a24930fdasi8880260qvp.40.2023.12.11.09.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:53:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=DGcoKTQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCkSC-0003D2-28; Mon, 11 Dec 2023 12:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Vkx3ZQwKCP0sfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1rCkSA-0003Cj-28
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:52:26 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Vkx3ZQwKCP0sfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1rCkS8-0000XE-4h
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:52:25 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5ddd64f83a4so40049377b3.0
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702317142; x=1702921942; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gqxsBDqoz9XDs17BoA3JvzrDX8A2CkxcCB14NDOaKvA=;
 b=DGcoKTQ7KNV8Ohdc8rq+Wakw0qJRLJ4vxYQtrglsPgwAznBbX6LH0hPBKA1Wdnr2j5
 u5B7LDkzY8wiVSK56w+vEBb/BIBJ5qAGTCrhrrTN/BQPBigKAdXLVDUxOCGAqnXazoqb
 /WX/vWO/jApoqAZAJi0VVkxFAwDuIcjiuB0TlL0ADkKiDbpOIexP4TOM37rsAAfHaa8y
 pbzVIW94WHB85LA/4ZbDG8Lzzgx0fTn5BZYJ7bmhXMhZWvMTIVp8G2Jti/H3YJ/UxHn5
 bk3ptfC7DQm/U/Yjv1/I55rUav1ubbN2tbSujkscK0HHwBS85vPA0GjsJfSb6yUR862q
 anVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702317142; x=1702921942;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gqxsBDqoz9XDs17BoA3JvzrDX8A2CkxcCB14NDOaKvA=;
 b=nJ0ehriv231F3Xko4U+xgyNgfAf6P/fn77i8QMI2a0QYuypxDNIgAEsM05WrenlUFH
 6f/hepdFxkksWFXNgc1j4PkckG6gE9ULZGk8SvRctsk4Vxdc+5XM3rJPZkCgsDD6qasW
 PDEiDMGR4nNunt3XVrMZaQq7NnSkJPySXYD5K92A9xOIg3bE1J3g/zzIWzwdGc/oQE7s
 MOR/pLX9ZKTuhhpMwplZAyrKfzFUfxfCh2FJP78kyKasF8gXx70cJo/BWy8tgDAt+it7
 qPUO7xDPjtW2zz0S7+OAxDQGfsGnFnfH/4e/LDhxXN4m6sxzhkskHsQoJi5bJxsaFp65
 Scsw==
X-Gm-Message-State: AOJu0Yxy0iwZpx/OryE3mWTgMSK9f+OkNqs5Rz81j2uL741cJXs6x9GR
 2tBmns4P2Ndhg0P8lOX0WgEwdHAeK+n9QAHarHA=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:1e:b0:5d7:545e:3bd0 with
 SMTP id bc30-20020a05690c001e00b005d7545e3bd0mr52561ywb.4.1702317142448; Mon,
 11 Dec 2023 09:52:22 -0800 (PST)
Date: Mon, 11 Dec 2023 17:52:06 +0000
In-Reply-To: <20231211175215.3216667-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211175215.3216667-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211175215.3216667-4-nabihestefan@google.com>
Subject: [PATCH v7 03/11] hw/misc: Add qtest for NPCM7xx PCI Mailbox
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3Vkx3ZQwKCP0sfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: M5MZ5pCFdPB1

From: Hao Wu <wuhaotsh@google.com>

This patches adds a qtest for NPCM7XX PCI Mailbox module.
It sends read and write requests to the module, and verifies that
the module contains the correct data after the requests.

Change-Id: I3948da277fc26352068420a26d8cc7cb2674cf40
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

