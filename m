Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp743244lff;
        Fri, 6 Aug 2021 16:50:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4IHrQZiDfEdPRyHWHqcJumZt4zkCFriW/zQFjggiAtlZjhZBv3lyMDtlGN8BqDGp5HSzh
X-Received: by 2002:a92:bf12:: with SMTP id z18mr132348ilh.274.1628293856950;
        Fri, 06 Aug 2021 16:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628293856; cv=none;
        d=google.com; s=arc-20160816;
        b=jBYsanU8dHh6aCxlTpxBlG+SD6frfh98a6gqilJB5qA5nfGHVeiWdzg8O4Y4lLH1qX
         u2KaK4WzMgsG0R7UyibVbcdw9IB2piIAIVlr7ZEnrEIuiTHkUbcrpgwn+jMYArHUG60K
         uTS14aXkl1Pr9wtE/zjEOAAcuydzHnS5yY2CcfVLaC2NbsdBvyoaFYIZ2GlF6aMI1Tim
         OMrJj4SanJzb0Ne2OSsn6tXcauwLT2l5m0gCBOH1x36zHYwv6fFwqT6zQabaQcfk1sXq
         W0sH46bytydp1Z8AHPy+BO9Vu9qrosJPsTC8QtNiyeuLW++zx3MJ6ryG8mXlpolZVsrB
         2bFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=pScfXTzd1F7hEhd63X3i506fl3OGOhBilrzIlNVPX4U=;
        b=ujsy/EjuvKGkxnkw3wnP5Gf19ajRXOhOf4fvkFAXsAr+OcKygJqilkJIdhmldZ/33w
         5wMcoLrm6m3WKtmUrYPpEwDUtwXx/bGFE/F66OVg9j1YxeN1exVpZp0gVm+vV/E0n1d5
         AQ1EySUAmE5eVvvOS40W8uDSmmcXHpI5jP4YE1RaHZgRTaobHGpdDK7dexzA2W26O7pT
         F1Co5eLPNzsz9t3Ukv8yX3mV4udbIiskW9Pm5gOUIg1E0nw/h8K4VhEsV5U8OpBEJbWY
         fRuOGu6QHKsKzpeFfB8Lwpkuj2ohgl7mLEQJcfv3+CBF7kUgyrham3fszRATraA2BpME
         dZnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="cw/njWdW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si10499739ils.120.2021.08.06.16.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 16:50:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="cw/njWdW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mC9c8-0000aN-7K
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 19:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ag-0005MJ-KV
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:26 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:53939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ad-0002sA-Dt
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 19:49:26 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 b8-20020a0562141148b02902f1474ce8b7so7472599qvt.20
 for <qemu-arm@nongnu.org>; Fri, 06 Aug 2021 16:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pScfXTzd1F7hEhd63X3i506fl3OGOhBilrzIlNVPX4U=;
 b=cw/njWdWyvlcg+LE7YZxEaWAAi4If3SSthfWQpTiOIinv6I47jpgVcrjmDtC5ezqRu
 lD30jHl1upmBht5dsifqIw0Q8G38+uOCwodX/n45uLU0SwXyZ/RRTfndZgromhJuSyaw
 9NoQi9JTBkpLYmJjmLsMjD08Hgnu4x/Pc5VzTbKwAXlUeAMRW0ONDtBis0r6owElvtvE
 hBF/KOO8SdkueZnVNpgEUPWOWH/qUJqTwWpgc1r0M0IdgWHqRKRE6LdaNhmn9Z7r9gBs
 HVy16vy9ETeR6ZXBW7WiHlqctBVvnOcl0mS1ndoyL5ohqSWsSftwX3KDkxjuqNyCe49K
 2PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pScfXTzd1F7hEhd63X3i506fl3OGOhBilrzIlNVPX4U=;
 b=VeeI+arVk2VVXLN3R934vmFlig9DfMc8MwLymb2v2fAB1rTv/pp0BsPY1DpolK/GUS
 v7KNdSTNeAfE22450TOUOnS0vEcuDVRK3M+iqdvvWh86dgz0wE41GREItPlxwbWhj27/
 +p+xBCNhzMBvS2D/QpFl13FQFWpuYIeeqfxPi2voE5sO3JEjVDGJEQmtUurysUolTqD1
 U8GkfBW7FzVCpiZjWhazMC5nZrvpDYwwpC8DaB4HGE5wcPm39l/wTjFPfwwOrpIDlAE+
 PmjOoDsFXz/JqKCbSp87qAWA4iFYRbIQ6BsN75ymLKIFq58w7plJJLchBm6HuwseJgJv
 lTyQ==
X-Gm-Message-State: AOAM530mogjKA8cHfvPd4HaVeTAbpFI1kHts09iasH11lJgr0SvMaP1H
 Kdtv8pfrkAIIIUdxzYImJNnyDc0oGw==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:ad4:4312:: with SMTP id
 c18mr2476675qvs.54.1628293762103; 
 Fri, 06 Aug 2021 16:49:22 -0700 (PDT)
Date: Fri,  6 Aug 2021 23:49:17 +0000
In-Reply-To: <20210806234918.122457-1-stmao@google.com>
Message-Id: <20210806234918.122457-2-stmao@google.com>
Mime-Version: 1.0
References: <20210806234918.122457-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v4 1/2] hw/i2c: add remote I2C device
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3gsoNYQUKCF0NOH5JBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--stmao.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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
X-TUID: 008zt/K6WYwm

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
index 4ba0aca067..922a3efdcc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -393,6 +393,7 @@ config NPCM7XX
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
2.32.0.605.g8dce9f2422-goog

