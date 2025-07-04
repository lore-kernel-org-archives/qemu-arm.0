Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064079dyc;
        Fri, 4 Jul 2025 01:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1U6en4cr2J0fpM08kLx3u+bs5qYdePpUBJdLHIZnYVQW8qYDDFjK6zbjvfb4b6uminm+SRIIhcHw/Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IH7bBPz7vOt5yHOUkhBhEzbZgVCKcy84MmAvfgdMAX7xvXrx0Nfncdy1P1a6UImftBir+fu
X-Received: by 2002:a05:622a:579a:b0:4a9:9359:4635 with SMTP id d75a77b69052e-4a995709637mr32343181cf.4.1751618280750;
        Fri, 04 Jul 2025 01:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618280; cv=none;
        d=google.com; s=arc-20240605;
        b=fhhdvUn6DJtLzJGFUv0IzbAQ1ZY+CHpZSqWgfoGGreBg2jgrdhjG1DASqSPKQguZs5
         myawA1fZppNFs+cN3XDvOLBgOzEfzx9LaCPkt8myZ8cil5ltdFxlVUdQYiYIyw34mGQk
         cp9NQVMrNMfzyZZIHSzE66RbtbkDbTP1e22W6a0zMfCUO1UByNLYuoZdY93HZo5j9ziY
         dBuZHTdYYYByrQwwK3StSC3nbx2XeMC3DJSL6eZf8CM+bO9R5qYAUhlWVE9dRUmYVyJf
         0gLAMuORYAjKLSHQSqH+dDvnP9SgFnEcyBNJWSO7+c8q7SZYb98KucKZntpW4EdMckYK
         LIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j/v5aWi/KdtenYoIox6FqeFx+QhduTqfwG+Qzvurhe4=;
        fh=kl2N1rGaVXWPJaE/vGzTrgcZv6cubfb5RXqyTTYJ5Ls=;
        b=jBQC+xwxXj1QetRxY97qPhqqOdkfcv6BCFbt6nmbwtkrh7F9bX8CPQzN7X78NwPAPD
         /7b5pbJnOPYkbI2d1LJE/MaN01q/0xAGAD+zVNOmGsoPY4feZWhUJoZqR/Zo7vWF4wuW
         YId1ej7jDexu01s6d8pdPq3TVPwPiVJahG3lE3DWHsL/a3WVMbCrtQbTSWHr0zr+SgE9
         YZkMhFv/UfVp5EOtwMPCiiR2CHreeFGajcM9xZFbo3xr48pP0eN21YCHjRwe5rswjcQS
         RPjRfVddb/nmT+ANZopcaYRzkaQx8mMyss0/91ujservZoB+RfHoEcRujN8tyOz0qDCq
         YmLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wj2aR2Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ab4c2asi14782111cf.228.2025.07.04.01.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wj2aR2Ew;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbve-0006ct-4i; Fri, 04 Jul 2025 04:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvc-0006bf-QG
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbva-0004Pg-6D
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/v5aWi/KdtenYoIox6FqeFx+QhduTqfwG+Qzvurhe4=;
 b=Wj2aR2Ewy2e0NuijkrtjVKgDw6XxeY2ctHmByfRva3V3oXwp1qoK+uOpo6Um09C4RWYt7s
 oqxftTh6qrlHzhPopgCoRDGPfeje1+djNFD8g6xC8rsaLMQ3lgqvvXt57+ZvOtBhef4EDX
 pE34g6maCCAULCsmz8TltzLwfrnKt3c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-F7_vuN5HMBadm92NUsqzGQ-1; Fri,
 04 Jul 2025 04:37:45 -0400
X-MC-Unique: F7_vuN5HMBadm92NUsqzGQ-1
X-Mimecast-MFC-AGG-ID: F7_vuN5HMBadm92NUsqzGQ_1751618264
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D1C891933E97; Fri,  4 Jul 2025 08:37:43 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8C6F8180045B; Fri,  4 Jul 2025 08:37:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tan Siewert <tan@siewert.io>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 06/11] tests/qtest: Add test for ASPEED SCU
Date: Fri,  4 Jul 2025 10:37:18 +0200
Message-ID: <20250704083723.1410455-7-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: ENwKKJYKy+HT

From: Tan Siewert <tan@siewert.io>

This adds basic tests for the ASPEED System Control Unit (SCU) and its
protection mechanism on the AST2500 and AST2600 platforms.

The tests verify:
  - That SCU protection registers can be unlocked and locked again
  - That modifying the primary protection register on AST2600 also
    affects the secondary one
  - That writes to protected SCU registers are blocked unless
    protection registers are unlocked explicitly

These tests ensure proper emulation of hardware locking behaviour
and help catch regressions in SCU access logic.

Signed-off-by: Tan Siewert <tan@siewert.io>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250630112646.74944-1-tan@siewert.io
[ clg: Reordered file list in meson.build ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_scu-test.c | 231 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 tests/qtest/aspeed_scu-test.c

diff --git a/tests/qtest/aspeed_scu-test.c b/tests/qtest/aspeed_scu-test.c
new file mode 100644
index 000000000000..ca09f9171f71
--- /dev/null
+++ b/tests/qtest/aspeed_scu-test.c
@@ -0,0 +1,231 @@
+/*
+ * QTest testcase for the ASPEED AST2500 and AST2600 SCU.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2025 Tan Siewert
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+/*
+ * SCU base, as well as protection key are
+ * the same on AST2500 and 2600.
+ */
+#define AST_SCU_BASE                    0x1E6E2000
+#define AST_SCU_PROT_LOCK_STATE         0x0
+#define AST_SCU_PROT_LOCK_VALUE         0x2
+#define AST_SCU_PROT_UNLOCK_STATE       0x1
+#define AST_SCU_PROT_UNLOCK_VALUE       0x1688A8A8
+
+#define AST2500_MACHINE                 "-machine ast2500-evb"
+#define AST2500_SCU_PROT_REG            0x00
+#define AST2500_SCU_MISC_2_CONTROL_REG  0x4C
+
+#define AST2600_MACHINE                 "-machine ast2600-evb"
+/* AST2600 has two protection registers */
+#define AST2600_SCU_PROT_REG            0x000
+#define AST2600_SCU_PROT_REG2           0x010
+#define AST2600_SCU_MISC_2_CONTROL_REG  0x0C4
+
+#define TEST_LOCK_ARBITRARY_VALUE       0xABCDEFAB
+
+/**
+ * Assert that a given register matches an expected value.
+ *
+ * Reads the register and checks if its value equals the expected value.
+ *
+ * @param *s - QTest machine state
+ * @param reg - Address of the register to be checked
+ * @param expected - Expected register value
+ */
+static inline void assert_register_eq(QTestState *s,
+                                      uint32_t reg,
+                                      uint32_t expected)
+{
+    uint32_t value = qtest_readl(s, reg);
+    g_assert_cmphex(value, ==, expected);
+}
+
+/**
+ * Assert that a given register does not match a specific value.
+ *
+ * Reads the register and checks that its value is not equal to the
+ * provided value.
+ *
+ * @param *s - QTest machine state
+ * @param reg - Address of the register to be checked
+ * @param not_expected - Value the register must not contain
+ */
+static inline void assert_register_neq(QTestState *s,
+                                       uint32_t reg,
+                                       uint32_t not_expected)
+{
+    uint32_t value = qtest_readl(s, reg);
+    g_assert_cmphex(value, !=, not_expected);
+}
+
+/**
+ * Test whether the SCU can be locked and unlocked correctly.
+ *
+ * When testing multiple registers, this function assumes that writing
+ * to the first register also affects the others. However, writing to
+ * any other register only affects itself.
+ *
+ * @param *machine - input machine configuration, passed directly
+ *                   to QTest
+ * @param regs[] - List of registers to be checked
+ * @param regc - amount of arguments for registers to be checked
+ */
+static void test_protection_register(const char *machine,
+                                     const uint32_t regs[],
+                                     const int regc)
+{
+    QTestState *s = qtest_init(machine);
+
+    for (int i = 0; i < regc; i++) {
+        uint32_t reg = regs[i];
+
+        qtest_writel(s, reg, AST_SCU_PROT_UNLOCK_VALUE);
+        assert_register_eq(s, reg, AST_SCU_PROT_UNLOCK_STATE);
+
+        /**
+         * Check that other registers are unlocked too, if more
+         * than one is available.
+         */
+        if (regc > 1 && i == 0) {
+            /* Initialise at 1 instead of 0 to skip first */
+            for (int j = 1; j < regc; j++) {
+                uint32_t add_reg = regs[j];
+                assert_register_eq(s, add_reg, AST_SCU_PROT_UNLOCK_STATE);
+            }
+        }
+
+        /* Lock the register again */
+        qtest_writel(s, reg, AST_SCU_PROT_LOCK_VALUE);
+        assert_register_eq(s, reg, AST_SCU_PROT_LOCK_STATE);
+
+        /* And the same for locked state */
+        if (regc > 1 && i == 0) {
+            /* Initialise at 1 instead of 0 to skip first */
+            for (int j = 1; j < regc; j++) {
+                uint32_t add_reg = regs[j];
+                assert_register_eq(s, add_reg, AST_SCU_PROT_LOCK_STATE);
+            }
+        }
+    }
+
+    qtest_quit(s);
+}
+
+static void test_2500_protection_register(void)
+{
+    uint32_t regs[] = { AST_SCU_BASE + AST2500_SCU_PROT_REG };
+
+    test_protection_register(AST2500_MACHINE,
+                             regs,
+                             ARRAY_SIZE(regs));
+}
+
+static void test_2600_protection_register(void)
+{
+    /**
+     * The AST2600 has two protection registers, both
+     * being required to be unlocked to do any operation.
+     *
+     * Modifying SCU000 also modifies SCU010, but modifying
+     * SCU010 only will keep SCU000 untouched.
+     */
+    uint32_t regs[] = { AST_SCU_BASE + AST2600_SCU_PROT_REG,
+                        AST_SCU_BASE + AST2600_SCU_PROT_REG2 };
+
+    test_protection_register(AST2600_MACHINE,
+                             regs,
+                             ARRAY_SIZE(regs));
+}
+
+/**
+ * Test if SCU register writes are correctly allowed or blocked
+ * depending on the protection register state.
+ *
+ * The test first locks the protection register and verifies that
+ * writes to the target SCU register are rejected. It then unlocks
+ * the protection register and confirms that the written value is
+ * retained when unlocked.
+ *
+ * @param *machine - input machine configuration, passed directly
+ *                   to QTest
+ * @param protection_register - first SCU protection key register
+ *                              (only one for keeping it simple)
+ * @param test_register - Register to be used for writing arbitrary
+ *                        values
+ */
+static void test_write_permission_lock_state(const char *machine,
+                                             const uint32_t protection_register,
+                                             const uint32_t test_register)
+{
+    QTestState *s = qtest_init(machine);
+
+    /* Arbitrary value to lock provided SCU protection register */
+    qtest_writel(s, protection_register, AST_SCU_PROT_LOCK_VALUE);
+
+    /* Ensure that the SCU is really locked */
+    assert_register_eq(s, protection_register, AST_SCU_PROT_LOCK_STATE);
+
+    /* Write a known arbitrary value to test that the write is blocked */
+    qtest_writel(s, test_register, TEST_LOCK_ARBITRARY_VALUE);
+
+    /* We do not want to have the written value to be saved */
+    assert_register_neq(s, test_register, TEST_LOCK_ARBITRARY_VALUE);
+
+    /**
+     * Unlock the SCU and verify that it can be written to.
+     * Assumes that the first SCU protection register is sufficient to
+     * unlock all protection registers, if multiple are present.
+     */
+    qtest_writel(s, protection_register, AST_SCU_PROT_UNLOCK_VALUE);
+    assert_register_eq(s, protection_register, AST_SCU_PROT_UNLOCK_STATE);
+
+    /* Write a known arbitrary value to test that the write works */
+    qtest_writel(s, test_register, TEST_LOCK_ARBITRARY_VALUE);
+
+    /* Ensure that the written value is retained */
+    assert_register_eq(s, test_register, TEST_LOCK_ARBITRARY_VALUE);
+
+    qtest_quit(s);
+}
+
+static void test_2500_write_permission_lock_state(void)
+{
+    test_write_permission_lock_state(
+            AST2500_MACHINE,
+            AST_SCU_BASE + AST2500_SCU_PROT_REG,
+            AST_SCU_BASE + AST2500_SCU_MISC_2_CONTROL_REG
+    );
+}
+
+static void test_2600_write_permission_lock_state(void)
+{
+    test_write_permission_lock_state(
+            AST2600_MACHINE,
+            AST_SCU_BASE + AST2600_SCU_PROT_REG,
+            AST_SCU_BASE + AST2600_SCU_MISC_2_CONTROL_REG
+    );
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/ast2500/scu/protection_register",
+                   test_2500_protection_register);
+    qtest_add_func("/ast2600/scu/protection_register",
+                   test_2600_protection_register);
+
+    qtest_add_func("/ast2500/scu/write_permission_lock_state",
+                   test_2500_write_permission_lock_state);
+    qtest_add_func("/ast2600/scu/write_permission_lock_state",
+                   test_2600_write_permission_lock_state);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 8ad849054fed..91b4a71a186f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -215,6 +215,7 @@ qtests_npcm8xx = \
 qtests_aspeed = \
   ['aspeed_gpio-test',
    'aspeed_hace-test',
+   'aspeed_scu-test',
    'aspeed_smc-test']
 qtests_aspeed64 = \
   ['ast2700-gpio-test',
-- 
2.50.0

