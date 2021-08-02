Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2032038lff;
        Mon, 2 Aug 2021 16:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCM5e7xI1NY7Z+Oe/dSpO3++uoHdBhKR4qzMIGa25bfiahsfDIf+fq8nALqfLPmJ9L4z5J
X-Received: by 2002:a67:fd96:: with SMTP id k22mr11841082vsq.52.1627945434887;
        Mon, 02 Aug 2021 16:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627945434; cv=none;
        d=google.com; s=arc-20160816;
        b=zBzKWBAG+pgW7P/z3bQD+ITCyiMaPZkwZ5YaKEDYivdEnuUT+nXzDPdfEAVCdELyxv
         pJv6+uwpT7jEmQwVSCKQ349HHrtpns0c04t+KuoxqTUcL0IFJSNOXZd0d3tg+FSuZg8N
         bXUgbmFq1j6kNDhcFmHxUy0yUEMGBbgou3VnuqhZXv5jIHjt/fa1hemzoeu5s6V75gMS
         8kWPJVocTvwAtGsbn6Eu33kTJjyH31GmveLZfBA4RarW5LYtjlHmyNNTtUeoEK9g2xjO
         lylM7OPCsPP9es2XCcPmFj7+dvRC4OkuQfbu0cws39woQ49RcgCxZUIV/IlDxkiNxpwn
         h3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=e/dTbrxSAOETGr5gU6Sr7f/b7cvGQLB7erwbwnHaelY=;
        b=fRWZ+kJftpLbmYnXlL4ksqMLCqEHiKOPA1x/aobSW1R28H6z6gyCcHp5jh7plRevMV
         5Ph/gbrDAv4C5LjBGIWIVvcNM82F+q9WHIr7Yyfgl1oydzcERLE7UCrSP5/EuRK1I4DB
         gyxuuwIrYNGeZkbSzWdZs0m5eiWZGyJwFYKCmKeLVxLKDBZCrjSbo31QB2u+UAKf8xu3
         UGOs8ApsXvoAZDa/JqRcXKf6lkwn16CYw7yeu+geH6/regt3LAONX9CT1vK2IDeKuzUv
         7Jb1fdyvkviULs5ruXPXmiXrb250oy3urED/vS9XwOKjzzwAVJv4+W68L0RHzvV5gazd
         Pf1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=teOf0SNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si2188533vsm.88.2021.08.02.16.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 16:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=teOf0SNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAgyQ-0001GU-5X
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 19:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xXkIYQUKCOgcdWKYQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--stmao.bounces.google.com>)
 id 1mAgyA-0001DA-3L
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:38 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:47884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xXkIYQUKCOgcdWKYQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--stmao.bounces.google.com>)
 id 1mAgy7-00062r-8B
 for qemu-arm@nongnu.org; Mon, 02 Aug 2021 19:03:37 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 b4-20020a3799040000b02903b899a4309cso14102348qke.14
 for <qemu-arm@nongnu.org>; Mon, 02 Aug 2021 16:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=e/dTbrxSAOETGr5gU6Sr7f/b7cvGQLB7erwbwnHaelY=;
 b=teOf0SNHRsj4Oj3jxpLfz5cUn5WyoCw9pq6IcM0cO9q4ZLNj0GcKaf5GZg2kjsaCfF
 Bpc2eZs7uCJmMwe+lZV+g8+vWjHqsm5KnLE4EYinOeWaV1JXxm76QVITSGQgWlK/e6AN
 6c/aOMv6On65kEw+DQn4w9P7pETCbJ4+Ec8muw9GGC8BH6LpmWUPq26yT/RpAAW2a+Q1
 hchdIBc1SvedZ4BxFSpVCn+UXxwCnuGhx25GR1+xuvUZuSKMHoqQvaJPE2whPGybwUJh
 Ck5Za/lIhCntvxNOE+WHEnA8vqYeMRnH9GTrYCrL2zRS4FWoTk5KonAvdfwtiTTOjkyF
 kc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=e/dTbrxSAOETGr5gU6Sr7f/b7cvGQLB7erwbwnHaelY=;
 b=aTQDDqoLPC12hziiAWs3EjnVo+0BCgTZCqTUKPzxh6YlR6shB5WcNpBs/o7uToNLje
 svpMgceOxcA0WeoPyzRM0vrlMFpWLNuPwdLuZtlngqOgTAdMTVb1wZ7sTMF8QLdqG9Nd
 LBj6yHCge7q45/jGL2dTJtL7m2m9G+ZTsKHtwbuSzRjbqqgGMIDXDrwXf2F3p5WxI1vn
 zB3F9koVv/UjLPfsBKEPYLHRl9eb09aUdopo5i0FjW+js7P2EkRS/f4LWdHxxKcxiAoV
 r9bCwBAwJLl7xSJlRnLC1BXu2poWW6YyyQJ7i9EqkG3lnuNB+Xm2binbvYgbhwoU8Vyd
 Nb7Q==
X-Gm-Message-State: AOAM533+HYm22jCFMFJiTdXa9Gzmit6KIifgZ4a+/VrwC7hD7PE/5HOw
 BzEqpoLASP39Xp5LJCf8atfuOC8T5g==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:ad4:4ae6:: with SMTP id
 cp6mr18722197qvb.23.1627945413734; 
 Mon, 02 Aug 2021 16:03:33 -0700 (PDT)
Date: Mon,  2 Aug 2021 23:03:21 +0000
In-Reply-To: <20210802230323.1164787-1-stmao@google.com>
Message-Id: <20210802230323.1164787-2-stmao@google.com>
Mime-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH 1/1] hw/i2c: add remote I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, stmao@google.com, 
 crauer@google.com, wuhaotsh@google.com, venture@google.com, 
 maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3xXkIYQUKCOgcdWKYQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--stmao.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zp9u6/sY4Ybp

This patch adds the remote I2C device, which supports the usage of
external I2C devices.
Signed-off-by: Shengtan Mao <stmao@google.com>
---
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/meson.build            |   1 +
 hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
 6 files changed, 340 insertions(+)
 create mode 100644 hw/i2c/remote-i2c.c
 create mode 100644 tests/qtest/remote-i2c-test.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 90b19c0861..58fdfab90d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -392,6 +392,7 @@ config NPCM7XX
     select MAX34451
     select PL310  # cache controller
     select PMBUS
+    select REMOTE_I2C
     select SERIAL
     select SSI
     select UNIMP
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 8217cb5041..278156991d 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -1,6 +1,10 @@
 config I2C
     bool
 
+config REMOTE_I2C
+    bool
+    select I2C
+
 config SMBUS
     bool
     select I2C
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index d3df273251..ba0215db61 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -6,6 +6,7 @@ i2c_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('smbus_ich9.c'))
 i2c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i2c.c'))
 i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true: files('bitbang_i2c.c'))
 i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
+i2c_ss.add(when: 'CONFIG_REMOTE_I2C', if_true: files('remote-i2c.c'))
 i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
diff --git a/hw/i2c/remote-i2c.c b/hw/i2c/remote-i2c.c
new file mode 100644
index 0000000000..083eaf2210
--- /dev/null
+++ b/hw/i2c/remote-i2c.c
@@ -0,0 +1,117 @@
+/*
+ * Remote I2C Device
+ *
+ * Copyright (c) 2021 Google LLC
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
+
+#include "chardev/char-fe.h"
+#include "hw/i2c/i2c.h"
+#include "hw/qdev-properties-system.h"
+
+#define TYPE_REMOTE_I2C "remote-i2c"
+#define REMOTE_I2C(obj) OBJECT_CHECK(RemoteI2CState, (obj), TYPE_REMOTE_I2C)
+#define ONE_BYTE 1
+
+typedef struct {
+    I2CSlave parent_obj;
+    CharBackend chr;
+} RemoteI2CState;
+
+typedef enum {
+    REMOTE_I2C_START_RECV = 0,
+    REMOTE_I2C_START_SEND = 1,
+    REMOTE_I2C_FINISH = 2,
+    REMOTE_I2C_NACK = 3,
+    REMOTE_I2C_RECV = 4,
+    REMOTE_I2C_SEND = 5,
+} RemoteI2CCommand;
+
+static uint8_t remote_i2c_recv(I2CSlave *s)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t resp = 0;
+    uint8_t type = REMOTE_I2C_RECV;
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp;
+}
+
+static int remote_i2c_send(I2CSlave *s, uint8_t data)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t type = REMOTE_I2C_SEND;
+    uint8_t resp = 1;
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+    qemu_chr_fe_write_all(&i2c->chr, &data, ONE_BYTE);
+
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp ? -1 : 0;
+}
+
+/* Returns non-zero when no response from the device. */
+static int remote_i2c_event(I2CSlave *s, enum i2c_event event)
+{
+    RemoteI2CState *i2c = REMOTE_I2C(s);
+    uint8_t type;
+    uint8_t resp = 1;
+    switch (event) {
+    case I2C_START_RECV:
+        type = REMOTE_I2C_START_RECV;
+        break;
+    case I2C_START_SEND:
+        type = REMOTE_I2C_START_SEND;
+        break;
+    case I2C_FINISH:
+        type = REMOTE_I2C_FINISH;
+        break;
+    case I2C_NACK:
+        type = REMOTE_I2C_NACK;
+    }
+    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
+    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
+    return resp ? -1 : 0;
+}
+
+static Property remote_i2c_props[] = {
+    DEFINE_PROP_CHR("chardev", RemoteI2CState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void remote_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    k->recv = &remote_i2c_recv;
+    k->send = &remote_i2c_send;
+    k->event = &remote_i2c_event;
+    device_class_set_props(dc, remote_i2c_props);
+}
+
+static const TypeInfo remote_i2c_type = {
+    .name = TYPE_REMOTE_I2C,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(RemoteI2CState),
+    .class_size = sizeof(I2CSlaveClass),
+    .class_init = remote_i2c_class_init,
+};
+
+static void remote_i2c_register(void)
+{
+    type_register_static(&remote_i2c_type);
+}
+
+type_init(remote_i2c_register)
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e22a0792c5..95faa2c379 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -218,6 +218,7 @@ qos_test_ss.add(
   'pca9552-test.c',
   'pci-test.c',
   'pcnet-test.c',
+  'remote-i2c-test.c',
   'sdhci-test.c',
   'spapr-phb-test.c',
   'tmp105-test.c',
diff --git a/tests/qtest/remote-i2c-test.c b/tests/qtest/remote-i2c-test.c
new file mode 100644
index 0000000000..b6ab210e4c
--- /dev/null
+++ b/tests/qtest/remote-i2c-test.c
@@ -0,0 +1,216 @@
+/*
+ * QTests for Remote I2C Device
+ *
+ * Copyright (c) 2021 Google LLC
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
+
+#include "qemu/config-file.h"
+#include "sysemu/sysemu.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+
+#include <sys/socket.h>
+
+#define TEST_ID "remote-i2c-test"
+#define TEST_ADDR (0x62)
+#define QEMU_CMD_CHR                                                           \
+    " -chardev socket,id=i2c-chardev,host=localhost,port=%d,reconnect=10"
+
+typedef enum {
+    REMOTE_I2C_START_RECV = 0,
+    REMOTE_I2C_START_SEND = 1,
+    REMOTE_I2C_FINISH = 2,
+    REMOTE_I2C_NACK = 3,
+    REMOTE_I2C_RECV = 4,
+    REMOTE_I2C_SEND = 5,
+} RemoteI2CCommand;
+
+static int setup_fd(int *sock)
+{
+    fd_set readfds;
+    int fd;
+
+    FD_ZERO(&readfds);
+    FD_SET(*sock, &readfds);
+    g_assert(select((*sock) + 1, &readfds, NULL, NULL, NULL) == 1);
+
+    fd = accept(*sock, NULL, 0);
+    g_assert(fd >= 0);
+
+    return fd;
+}
+
+static void test_recv(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t len)
+{
+    uint16_t buf_size = len + 2;
+    uint8_t *buf = g_new(uint8_t, buf_size);
+    uint16_t bytes_read = 0;
+    uint8_t zero = 0;
+    ssize_t rv;
+
+    /* write device responses to socket */
+    rv = write(fd, &zero, 1);
+    g_assert_cmpint(rv, ==, 1);
+    rv = write(fd, msg, len);
+    g_assert_cmpint(rv, ==, len);
+    rv = write(fd, &zero, 1);
+    g_assert_cmpint(rv, ==, 1);
+
+    /* check received value */
+    qi2c_recv(i2cdev, buf, len);
+    for (int i = 0; i < len; ++i) {
+        g_assert_cmphex(buf[i], ==, msg[i]);
+    }
+
+    /* check controller writes to chardev */
+    do {
+        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
+    } while (bytes_read < buf_size);
+
+    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_RECV);
+    for (int i = 1; i < len - 1; ++i) {
+        g_assert_cmphex(buf[i], ==, REMOTE_I2C_RECV);
+    }
+    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
+
+    g_free(buf);
+}
+
+static void test_send(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t len)
+{
+    uint16_t buf_size = len * 2 + 2;
+    uint8_t *buf = g_new0(uint8_t, buf_size);
+    uint16_t bytes_read = 0;
+    ssize_t rv;
+    int j = 0;
+
+    /* write device ACKs to socket*/
+    rv = write(fd, buf, len + 2);
+    g_assert_cmpint(rv, ==, len + 2);
+
+    qi2c_send(i2cdev, msg, len);
+
+    /* check controller writes to chardev */
+    do {
+        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
+    } while (bytes_read < buf_size);
+
+    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_SEND);
+    for (int i = 1; i < buf_size - 1; i += 2) {
+        g_assert_cmphex(buf[i], ==, REMOTE_I2C_SEND);
+        g_assert_cmphex(buf[i + 1], ==, msg[j++]);
+    }
+    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
+
+    g_free(buf);
+}
+
+static void test_remote_i2c_recv(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int *sock = (int *)data;
+    int fd = setup_fd(sock);
+
+    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F};
+
+    test_recv(i2cdev, fd, msg, 1);
+    test_recv(i2cdev, fd, msg, 2);
+    test_recv(i2cdev, fd, msg, 3);
+    test_recv(i2cdev, fd, msg, 4);
+    test_recv(i2cdev, fd, msg, 5);
+    test_recv(i2cdev, fd, msg, 6);
+    test_recv(i2cdev, fd, msg, 7);
+    test_recv(i2cdev, fd, msg, 8);
+    test_recv(i2cdev, fd, msg, 9);
+}
+
+static void test_remote_i2c_send(void *obj, void *data,
+                                 QGuestAllocator *t_alloc)
+{
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+    int *sock = (int *)data;
+    int fd = setup_fd(sock);
+
+    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F};
+
+    test_send(i2cdev, fd, msg, 1);
+    test_send(i2cdev, fd, msg, 2);
+    test_send(i2cdev, fd, msg, 3);
+    test_send(i2cdev, fd, msg, 4);
+    test_send(i2cdev, fd, msg, 5);
+    test_send(i2cdev, fd, msg, 6);
+    test_send(i2cdev, fd, msg, 7);
+    test_send(i2cdev, fd, msg, 8);
+    test_send(i2cdev, fd, msg, 9);
+}
+
+static in_port_t open_socket(int *sock)
+{
+    struct sockaddr_in myaddr;
+    socklen_t addrlen;
+
+    myaddr.sin_family = AF_INET;
+    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+    myaddr.sin_port = 0;
+
+    *sock = socket(AF_INET, SOCK_STREAM, 0);
+    g_assert(*sock != -1);
+    g_assert(bind(*sock, (struct sockaddr *)&myaddr, sizeof(myaddr)) != -1);
+
+    addrlen = sizeof(myaddr);
+    g_assert(getsockname(*sock, (struct sockaddr *)&myaddr, &addrlen) != -1);
+    g_assert(listen(*sock, 1) != -1);
+
+    return ntohs(myaddr.sin_port);
+}
+
+static void remote_i2c_test_cleanup(void *socket)
+{
+    int *s = socket;
+
+    close(*s);
+    qos_invalidate_command_line();
+    g_free(s);
+}
+
+static void *remote_i2c_test_setup(GString *cmd_line, void *arg)
+{
+    int *sock = g_new(int, 1);
+
+    g_string_append_printf(cmd_line, QEMU_CMD_CHR, open_socket(sock));
+    g_test_queue_destroy(remote_i2c_test_cleanup, sock);
+    return sock;
+}
+
+static void register_remote_i2c_test(void)
+{
+    QOSGraphEdgeOptions edge = {
+        .extra_device_opts = "id=" TEST_ID ",address=0x62,chardev=i2c-chardev"};
+    add_qi2c_address(&edge, &(QI2CAddress){TEST_ADDR});
+
+    qos_node_create_driver("remote-i2c", i2c_device_create);
+    qos_node_consumes("remote-i2c", "i2c-bus", &edge);
+
+    QOSGraphTestOptions opts = {
+        .before = remote_i2c_test_setup,
+    };
+    qemu_add_opts(&qemu_chardev_opts);
+    qos_add_test("test_remote_i2c_recv", "remote-i2c", test_remote_i2c_recv,
+                 &opts);
+    qos_add_test("test_remote_i2c_send", "remote-i2c", test_remote_i2c_send,
+                 &opts);
+}
+libqos_init(register_remote_i2c_test);
-- 
2.32.0.554.ge1b32706d8-goog

