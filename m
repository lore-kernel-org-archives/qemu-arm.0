Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1974993wrt;
        Thu, 24 Jan 2019 06:14:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7iIS6RTtAoTv5EIBZJ8rqv6gA5mFhsmfxaYYVO5l/qXUcc2KvqglsoykhabhtMdNd10IOa
X-Received: by 2002:adf:c108:: with SMTP id r8mr7627330wre.233.1548339252769;
        Thu, 24 Jan 2019 06:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548339252; cv=none;
        d=google.com; s=arc-20160816;
        b=ocAKeqA3UCI3uK6v60OuY3/kHbE2Rc1TVmkpAJZ0IOtvAqQDhu4GgvkcIt5G/li5A7
         ORBLTVjk+4e2okigW2nn8OLGPcLA/svfwaIRbfJzS9nIW7uuOaxmqzo9iMahREVRDdfr
         NuCEed1jOZG3cqDL182pKxsceYFKSNqGmibSYZHb1RmeXF+5g5pvaE06gcUKo0V1vmRz
         Vd//BxXgQUS3npNO1u6pKU/sUUdQfj7L5lnqOlC5nRy7gW0CORV+Tn2aE7LqyKGzZCkV
         4mIfCI86EeUP3j+RCuGzwT9Rednlqf5R8EOascCM0474q64yu+FZUW5cxTxfCV20LFLN
         mu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=rhai5hmdmWF7wQlb5JYFC+TWKK6oKFEWp89T5vDAWgY=;
        b=J8BqanL7fozzis/BpLlR6YqQdOPxcP6WrAMrf1BwFOznxG1McEMMsyQnU7zHhU5FFM
         56AScvm8JsqHjDKgp/xjiI9ltlWRzseL6HH4FNvL2E9d4ESDuawzKE/OhICOHF5EI8Rq
         tBHXP6q+Qvj3JCN/kbZgqJI6yMMYalkcwtMvRybJ+9wzEl/igi6r8CIu7oRLSLSypamF
         R3jyy+BDbJw7leIIduG3JipOY30dp0dSnS9D5FDfrJXHS84FXQS+T6FsAoMlcgLbywTo
         k4fvP1GOgzBUBL/N/DnVfjkbW64Q4PF5BUc5U8YC/msHvcsnypOTY7xXaupTBI6vCrog
         lIdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si41523394wro.50.2019.01.24.06.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmflj-0004rl-N0
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmfjY-0003I0-OQ
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:11:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmfjX-0005a6-Kl
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:11:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gmfjV-0005WS-7F; Thu, 24 Jan 2019 09:11:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AD9F83F4C;
	Thu, 24 Jan 2019 14:11:52 +0000 (UTC)
Received: from localhost (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8A58672C1;
	Thu, 24 Jan 2019 14:11:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Jan 2019 14:11:47 +0000
Message-Id: <20190124141147.8416-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 24 Jan 2019 14:11:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/microbit-test: Add tests for nRF51 NVMC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, contrib@steffen-goertz.de,
	jim@groklearning.com, qemu-arm@nongnu.org, joel@jms.id.au,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZX4+jbfM0yc

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
This resolves the conflict with Julia's UART test series due to
global_qtest removal.

 tests/microbit-test.c | 108 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/microbit-test.c b/tests/microbit-test.c
index 3bad947b6c..04e199ec33 100644
--- a/tests/microbit-test.c
+++ b/tests/microbit-test.c
@@ -21,6 +21,7 @@
 #include "hw/arm/nrf51.h"
 #include "hw/char/nrf51_uart.h"
 #include "hw/gpio/nrf51_gpio.h"
+#include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
 #include "hw/i2c/microbit_i2c.h"
=20
@@ -156,6 +157,112 @@ static void test_microbit_i2c(void)
     qtest_quit(qts);
 }
=20
+#define FLASH_SIZE          (256 * NRF51_PAGE_SIZE)
+
+static void fill_and_erase(QTestState *qts, hwaddr base, hwaddr size,
+                           uint32_t address_reg)
+{
+    hwaddr i;
+
+    /* Erase Page */
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    qtest_writel(qts, NRF51_NVMC_BASE + address_reg, base);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    /* Check memory */
+    for (i =3D 0; i < size / 4; i++) {
+        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, 0xFFFFF=
FFF);
+    }
+
+    /* Fill memory */
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < size / 4; i++) {
+        qtest_writel(qts, base + i * 4, i);
+        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, i);
+    }
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+}
+
+static void test_nrf51_nvmc(void)
+{
+    uint32_t value;
+    hwaddr i;
+    QTestState *qts =3D qtest_init("-M microbit");
+
+    /* Test always ready */
+    value =3D qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_READY);
+    g_assert_cmpuint(value & 0x01, =3D=3D, 0x01);
+
+    /* Test write-read config register */
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x03);
+    g_assert_cmpuint(qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFI=
G),
+                     =3D=3D, 0x03);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+    g_assert_cmpuint(qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFI=
G),
+                     =3D=3D, 0x00);
+
+    /* Test PCR0 */
+    fill_and_erase(qts, NRF51_FLASH_BASE, NRF51_PAGE_SIZE,
+                   NRF51_NVMC_ERASEPCR0);
+    fill_and_erase(qts, NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
+                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR0);
+
+    /* Test PCR1 */
+    fill_and_erase(qts, NRF51_FLASH_BASE, NRF51_PAGE_SIZE,
+                   NRF51_NVMC_ERASEPCR1);
+    fill_and_erase(qts, NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
+                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR1);
+
+    /* Erase all */
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
+        qtest_writel(qts, NRF51_FLASH_BASE + i * 4, i);
+        g_assert_cmpuint(qtest_readl(qts, NRF51_FLASH_BASE + i * 4), =3D=
=3D, i);
+    }
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
+        g_assert_cmpuint(qtest_readl(qts, NRF51_FLASH_BASE + i * 4),
+                         =3D=3D, 0xFFFFFFFF);
+    }
+
+    /* Erase UICR */
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4),
+                         =3D=3D, 0xFFFFFFFF);
+    }
+
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        qtest_writel(qts, NRF51_UICR_BASE + i * 4, i);
+        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4), =3D=3D=
, i);
+    }
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
+    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4),
+                         =3D=3D, 0xFFFFFFFF);
+    }
+
+    qtest_quit(qts);
+}
+
 static void test_nrf51_gpio(void)
 {
     size_t i;
@@ -392,6 +499,7 @@ int main(int argc, char **argv)
=20
     qtest_add_func("/microbit/nrf51/uart", test_nrf51_uart);
     qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
+    qtest_add_func("/microbit/nrf51/nvmc", test_nrf51_nvmc);
     qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
     qtest_add_func("/microbit/microbit/i2c", test_microbit_i2c);
=20
--=20
2.20.1

