Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2290218njb;
        Mon, 7 Oct 2024 18:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLx8qIr3gfLoV0KPDyLIwaKQoMx06zsrNkFXwlnDSgQo+rVNnAB0ukXyIjPCHK1LPx3NTywserGP5gpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFu7Zvx9jU+9KvPRACeqZ4wuwVlTQe+Y1Smr3ZWXN8s+fY2J4eYaBte3Yi4i2vYm5bwhyhV
X-Received: by 2002:a05:6214:451c:b0:6cb:41e1:b2b4 with SMTP id 6a1803df08f44-6cb9a2f80c8mr207610906d6.10.1728350689460;
        Mon, 07 Oct 2024 18:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728350689; cv=none;
        d=google.com; s=arc-20240605;
        b=XdGlLvzcNwBNQNSSzlxa12Uh5sFfGsgQNvw6kjt3pM776/NxJ+IcILIJWaX4hmDGrk
         f+UI2zVHgmDqgvzlHcdzrIdQvYbKE1z4hRYEi5y6jRc7Z4pX1LxMrzdqUeLrM9Lur79B
         6poxFf9OYqa5PBT1VNDIzhJweob6BIJsSBI9NPOvknMrX9HWJfbZZ5yunZXpJuQ3kqau
         Mz1xhpcCJYczhl+OJQ/QYGPXuSUnRbjr2P7TciykGVHDtfPYOhgD38cqNgYuqxKbJBG3
         k1Yh5fYLAJ+Z5m6zSO8ZrFBMiDmbgFZX4JbT0NBWVOaYsEE+8iKR4hhT6mmszNaAB2HG
         NUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HOp7WmLBwFJSSIU5qqNv1E/gmBAstHCHNzzXu4V4CBY=;
        fh=2mssAqYKJuMcD/Ya5YUzhxP7uPixmdZ7O75Bi0gtEhM=;
        b=Qp/qXr7IhZSrQXbKfGXqBee1WKFWb2Uf/C/tdLvckoF/ayfBri3KXpKCRkK4RaMGFJ
         kPiw8jfwh1UR3VHZitT92BGGC4uV8F1oBiNOC0hGfmmJdgCM/zljXgRbbmCgkewJhDAW
         3x0EVe9YkSzoc2HNZGYSfM50+tsInCOtHM0s0bR1ftzE+B6LIfXbXgn38KeFTVTv0eb3
         Ki98FwvEPZ7fFmYOo+cqYeWSib9+qoKL4xQRj6QHLZBQp+be3c2h9tEzH1ny3X/zDJMW
         Bf4NOOn7HK9Of8Odl5b7CvPsFlGPtZN8vLWQlOHIvlw+h6ozyY5lLZqygSzQFoc7/UiB
         pVYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gcV5sD3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba478ba5asi75621616d6.450.2024.10.07.18.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 18:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gcV5sD3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxyuB-0004is-IU; Mon, 07 Oct 2024 21:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nIgEZwUKCP0yf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxysx-0008CS-KM
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:36 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nIgEZwUKCP0yf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com>)
 id 1sxyst-0000Ce-6h
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 21:19:34 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2e2872e3c2bso114275a91.1
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 18:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1728350365; x=1728955165; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HOp7WmLBwFJSSIU5qqNv1E/gmBAstHCHNzzXu4V4CBY=;
 b=gcV5sD3hgDjDnWMy3BmQm1g9rgsrSLYaaLPiQ13VmiDPVXfnjSQI39+PJS0b2QijWx
 oamPPd5TuH9unpmiNMyeBNJf0fkl4Sg5Ki0Q5cSrMpWl8IH6oskPZSnhNjSw7JJdJf+3
 Phj7ve9b5iydeZb0EgKwGUuQmBYNsI66Wuy5eYGIp2ezkWD/+g9pi6FLMI9zLFkPu0RQ
 HchOV2UhAKWlDaVLVVPEesJY6vSYQQqMYSt2HVguk8U/PW0htF5NHXv/ddaumKmSIFSv
 xcUqZ3O5CTsuJCtqYIZGZ7dg538hKy/hBX/AYWRE9EWTvaaKC7uJqzx3BIdOYe2FraIS
 f7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728350365; x=1728955165;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HOp7WmLBwFJSSIU5qqNv1E/gmBAstHCHNzzXu4V4CBY=;
 b=PSJLjIOeO1NJHiVjqam97kDlWIitOMGiTzbn2O0zgXaKBwR8GKUXG51FdbwtwRWGOh
 dUwePUqL48fUlxe4nkpKYo79ZUCxS4u3wLERdvaViLYhtnA/dWI3/MMk89LgElFxckSf
 n2LVmS0gsso0s/nTxaAT9sZowIH0hk5Jjzmj0CD0vT7YDgHGdcyY7r14a+MAqbMgM+6a
 wd8+Mbrl+zg/xpV10ZYwtIub4vbsc+LEzfuU0BZMsSwNHi00WjxAm5zN78uKNVOtI3Nz
 mZ5DhFWYhzRc+unpT9lTIGqi8bE75srVt6ljqRSzj7CuQ83R86E8S+4ZUt2KyCTRriy3
 RzEQ==
X-Gm-Message-State: AOJu0Yw8UVB7XpTNVZj9NI0ZoBZWCNT+Bh7yJCk0O+Cg50Sjz7OKm1bT
 JsPcAyevX28Zp8lndCzA4jPPu6QZmwc1YXCUPBxUA4rgdbPjW2akwbo4ww9/JNYF9zhF5C8J5A=
 =
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:903:234e:b0:206:96ae:dc30
 with SMTP id
 d9443c01a7336-20bff1c282bmr3551625ad.10.1728350364927; Mon, 07 Oct 2024
 18:19:24 -0700 (PDT)
Date: Mon,  7 Oct 2024 18:18:43 -0700
In-Reply-To: <20241008011852.1439154-1-tavip@google.com>
Mime-Version: 1.0
References: <20241008011852.1439154-1-tavip@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008011852.1439154-18-tavip@google.com>
Subject: [PATCH v2 17/25] tests/qtest: add flexcomm tests
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, luc@lmichel.fr, damien.hedde@dahe.fr, 
 alistair@alistair23.me, thuth@redhat.com, philmd@linaro.org, jsnow@redhat.com, 
 crosa@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3nIgEZwUKCP0yf0nulttlqj.htrvjrz-fwrstslsz.twl@flex--tavip.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.024,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: XCKzJNwe4uSH

Add flexcomm function selection unit tests.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 tests/qtest/flexcomm-test.c | 82 +++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build     |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/qtest/flexcomm-test.c

diff --git a/tests/qtest/flexcomm-test.c b/tests/qtest/flexcomm-test.c
new file mode 100644
index 0000000000..ffbee8bfb8
--- /dev/null
+++ b/tests/qtest/flexcomm-test.c
@@ -0,0 +1,82 @@
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
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "exec/memory.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/misc/flexcomm.h"
+#include "hw/arm/svd/flexcomm.h"
+#include "hw/arm/svd/rt500.h"
+#include "reg-utils.h"
+
+#define FLEXCOMM_BASE RT500_FLEXCOMM0_BASE
+
+static void select_test(gconstpointer data)
+{
+    static const unsigned persel[] = {
+        FLEXCOMM_PERSEL_USART,
+        FLEXCOMM_PERSEL_SPI,
+        FLEXCOMM_PERSEL_I2C,
+    };
+
+    g_assert(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL) == 0);
+
+    /* no register access until a function is selected  */
+    readl_fail(FLEXCOMM_BASE);
+    writel_fail(FLEXCOMM_BASE, 0);
+
+    for (int i = 0; i < ARRAY_SIZE(persel); i++) {
+
+        REG32_WRITE(FLEXCOMM, PSELID, persel[i]);
+        g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                         persel[i]);
+
+        /* test that we can access function registers */
+        writel(FLEXCOMM_BASE, 0xabcd);
+        readl(FLEXCOMM_BASE);
+    }
+
+    /* try to select something invalid */
+    REG32_WRITE(FLEXCOMM, PSELID, 7);
+    /* check for no function selected */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==, 0);
+
+    /* now select and lock USART */
+    REG32_WRITE(FLEXCOMM, PSELID,
+                FIELD_DP32(FLEXCOMM_PERSEL_USART, FLEXCOMM_PSELID, LOCK, 1));
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+
+    /* try to change the selection to spi */
+    REG32_WRITE(FLEXCOMM, PSELID, FLEXCOMM_PERSEL_SPI);
+    /* it should still be locked USART */
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, PERSEL), ==,
+                     FLEXCOMM_PERSEL_USART);
+    g_assert_cmpuint(REG32_READ_FIELD(FLEXCOMM, PSELID, LOCK), ==, 1);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/flexcomm/select", NULL, select_test);
+    qtest_start("-M rt595-evk");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2b90abf000..f35bb52aa2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -233,6 +233,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['aspeed_fsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_STM32L4X5_SOC') and
    config_all_devices.has_key('CONFIG_DM163')? ['dm163-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_FLEXCOMM')? ['flexcomm-test'] : []) + \
   ['arm-cpu-features',
    'boot-serial-test']
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog

