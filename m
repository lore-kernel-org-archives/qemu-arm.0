Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7576104wrt;
        Thu, 31 Jan 2019 18:35:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaqeEn1Ra/Tg0+JkcT7on1EQXRL6p6qbp86zyjQeCopH35j8bO1dfkJ9VzhnMw1j2HBEp1n
X-Received: by 2002:a25:4055:: with SMTP id n82mr22263213yba.360.1548988505194;
        Thu, 31 Jan 2019 18:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548988505; cv=none;
        d=google.com; s=arc-20160816;
        b=aisrZXzKz6tIIQmzdPSUPZcsZeru1agHvyEjh9B2Y7RhFKc846TvXsarpG3lDEBOod
         nnkji2fr9jxI2peZqUyWbs8PnAbhcHjPXF76c5yOwLkTYmigCb/LtvWsOVi0W6I79BNx
         l9HeLzg8Wfg2k/mcGmzqcYQYw+5iuY0MiYdAwfbIShMrYb/RlIAR7zWLH80wipp4w7cC
         ws6L+zyNFOc1Spa4yxmAWJiQWUl0fZBqRAWdOXe++PqzilURUA9LvCUPl2pl+CuexAwH
         Vuzr+wljVgTxoxjhbDbIle6RYUXDKy4ukhcNB/x7LvWT5xruoCtOT1hOiPc6fibUYESB
         svbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6xzzeCFVdeXAda0m891W0asm2xzACXoBnbherCf3+EE=;
        b=WGpdwXXF40t0gyybAlmflXHNTacx0J24kgbnt8Nl4z1necZ19/3skIkHvWNAYC3/Hf
         xxjnCFVXA7OLe6ydO7gU0/dXojPARsC9FiAClG2P7/z6bW+JSAzsu/uH0CVy+LPT3ceh
         T984bSiVTvBXyfN0WUy0VbhBesdaqgh7wRAaUbm/bGBt69ctXC8f8znu7u/y0Hi4cwms
         1ssbPOnS+eonXdh0Nuz6FA0RjDg+0o5d6U77Q1sYw3F7Gm7688zumSD6CwdlSBHiH1B+
         cFrv3XrLiArt/FqOPweuyVO20PLbxmz3e1LZXBc0bVe0kCTjJzGYwsE3YV/CaCjmspgd
         eMkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k62si3480708ywd.392.2019.01.31.18.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 18:35:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpOfY-0008Go-I8
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 21:35:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gpOet-0007uc-Mg
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 21:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gpOes-0002pa-MZ
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 21:34:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54269)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gpOes-0002pH-Eh; Thu, 31 Jan 2019 21:34:22 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 105C9C05B039;
	Fri,  1 Feb 2019 02:34:21 +0000 (UTC)
Received: from localhost (unknown [10.64.242.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0B861370;
	Fri,  1 Feb 2019 02:34:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Feb 2019 10:33:57 +0800
Message-Id: <20190201023357.22596-4-stefanha@redhat.com>
In-Reply-To: <20190201023357.22596-1-stefanha@redhat.com>
References: <20190201023357.22596-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 01 Feb 2019 02:34:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 3/3] tests/microbit-test: Add tests for nRF51
 NVMC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T52j+i8B/5Hn

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
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

