Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp730939lfp;
        Thu, 14 Jul 2022 08:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhGUwJu7Z8EFU5cwqa+W9mpQqFUQhYo2/u1eke8bXfQ4jJ6itRqpiX7yMNgQmoGkldx//Y
X-Received: by 2002:a05:620a:27cf:b0:6b5:473d:44eb with SMTP id i15-20020a05620a27cf00b006b5473d44ebmr6308869qkp.282.1657814202227;
        Thu, 14 Jul 2022 08:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657814202; cv=none;
        d=google.com; s=arc-20160816;
        b=PnMMmgMLgUoN42Dbmf5GGhgi6WrsKWGp4D2WevhrVVQ8cmSa09fEMMSyZRjc8uRZBr
         6MX0hlZmLxKFWwCsD6e+8+G4ZdpHs0TD5blIaOgr8VQhX2ahN5ckhqDo+wBOiNMFbtYj
         xAfwpO6ATjYt8GUXQzxDdoXdzrODKl4KD8JgvdvK8Ga4pV/GmyEy+xl9NfUJcMkQbMUp
         Dew+oW4QPQ7vcQ2d4vd4FBnhwilwKZ6QrUJhFC/YPRGrrrdkyNxkNMlKyqIPb9SNexNr
         b7lOh6d6dfaLBZ8A5KVQlHik2KF/u6VqX0DfML3tcJiNR6T2qw8Y/qElSSoC0STO4tHS
         15rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=oWq45uXFuWzonDWj69AG8Q/IX5y13K0zohT9Cakuk74=;
        b=KVctRaGfPnIxxMRL3l4DbKWG/D3uOWjHnZRROa9X2c37GS58sajq7dr1Q5Mit/gJ6d
         UzHyLhylS1Yzgt2ZIpDPob+aSC4iAQgw1cnOOmVwp6Vi63sjcpjbg9tan4O2Ff3fVqpH
         YKi/PhbJEZkDnvB45NIx8YScL9TTIbbMBEI4AbuDK0VJO67YhHSsP984JORRWueSSfQ/
         b3/FhK5Oe/ggwB9GfzfTHM7+PjhR+NTqdg/ZGCXY4uIiRXLfiZ4E47q6GL930IvnuB45
         52foqKvROfED1h3f+6qFxy54QHJ024KiC6mMk3angQWtVrOqSQ1xkYZcOUp3+yexA9Pj
         LA2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cp4-20020a05622a420400b0031d39929238si1138633qtb.310.2022.07.14.08.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC1Cj-0007hy-Mk
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12H-0005Rc-IV; Thu, 14 Jul 2022 11:45:56 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:59375
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12B-0000u8-LC; Thu, 14 Jul 2022 11:45:50 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjg3TbPz4xdJ;
 Fri, 15 Jul 2022 01:45:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjd5DNhz4xRC;
 Fri, 15 Jul 2022 01:45:41 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/19] qtest/aspeed_gpio: Add input pin modification test
Date: Thu, 14 Jul 2022 17:44:54 +0200
Message-Id: <20220714154456.2565189-18-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Vs1osjVyPXj

From: Peter Delevoryas <peter@pjd.dev>

Verify the current behavior, which is that input pins can be modified by
guest OS register writes.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-2-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index bac63e8742f4..8f524540998d 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -28,6 +28,11 @@
 #include "qapi/qmp/qdict.h"
 #include "libqtest-single.h"
 
+#define AST2600_GPIO_BASE 0x1E780000
+
+#define GPIO_ABCD_DATA_VALUE 0x000
+#define GPIO_ABCD_DIRECTION  0x004
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -46,6 +51,27 @@ static void test_set_colocated_pins(const void *data)
     g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
 }
 
+static void test_set_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t value;
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+        }
+    }
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0xffffffff);
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0x00000000);
+}
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -56,6 +82,7 @@ int main(int argc, char **argv)
     s = qtest_init("-machine ast2600-evb");
     qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
                         test_set_colocated_pins);
+    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
     r = g_test_run();
     qtest_quit(s);
 
-- 
2.35.3

