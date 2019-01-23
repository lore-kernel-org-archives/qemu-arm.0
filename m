Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1173733wrt;
        Wed, 23 Jan 2019 13:30:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5cB0g+uS1PmQOnYfYtrEHF5zjYEnuC2okX+x48S31YkRDvvOMoT8qanGHOzGTBqBjFnBop
X-Received: by 2002:adf:b649:: with SMTP id i9mr4509221wre.70.1548279040506;
        Wed, 23 Jan 2019 13:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548279040; cv=none;
        d=google.com; s=arc-20160816;
        b=KvaXxAQzdR71jiO6NjD/1egDqAtiOE8KP8Ib2QizlyxrBGEwL6zr+CbR3/rKWi9pCg
         GfZDlg+gMwSDTujMLMHb+MFTGVg4jJKMGj8jX37MYOvmZIWbilFfL+Ya424E7yKw0pOv
         BfQJBAk8XwsI5L6vT3d1YxmgK1BZHjibEDXMf1iY7M8kzzSMeoAim4i8udRMI9wYGwdl
         /tdYNGyMFJOlR3OpGSuAkct9sngnVtTqvB+Q0leUz25RirJEfJ0iI3YxQyCBxS3NaqWO
         tp38YbUq9l4b3FnbIy7uMrrzslGh3kgWvqeVwDPAeap9tQGtDHa/AUqZDRbmCZyRMxau
         l8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3GJWhaB04CzHcFY9hVSvzEA4wCgOiKWXnU/a08ZpR+U=;
        b=Htt8aUlu/dhiROQXBPjcGgymA09KniGxEqdd1SGbGia12EMZmF0gGAJks57GFrv+sz
         +U4NKEf9YdG0j2ElIXm+ZewdwrjR9EePv8HheH7ifhZSo1+cGK/dWE/N7MleKr9Nzy3g
         a/QuPvhw4FyD605Z2YCw/wclXpElZMRrf+JnbwI+UG51qLveuDKRKpQx/iJQ5gfdPUAV
         2ltJ5YE3OAXjC0dlxkPyzbWx8zIpne0iQeaG6B3wj6UxpYzF4hwsXHtGl2HP3i74UuEC
         gl7idVxTQRzx/f11diZwaEWirGbZMT5ktSq1RbnsScF04S4oEiFU+XtlELavbZ70CC29
         mhiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si69389668wrr.364.2019.01.23.13.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:30:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ6Z-0003d9-Hd
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:30:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzq-0006ag-1m
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzp-00026n-1U
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gmPzo-0001xt-Ob; Wed, 23 Jan 2019 16:23:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B4BCF73A62;
	Wed, 23 Jan 2019 21:23:28 +0000 (UTC)
Received: from localhost (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38B675D6A6;
	Wed, 23 Jan 2019 21:23:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 21:22:34 +0000
Message-Id: <20190123212234.32068-6-stefanha@redhat.com>
In-Reply-To: <20190123212234.32068-1-stefanha@redhat.com>
References: <20190123212234.32068-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 23 Jan 2019 21:23:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/5] tests/microbit-test: Add tests for nRF51
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
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9tFe1IoaytZw

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/microbit-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/microbit-test.c b/tests/microbit-test.c
index 0c125535f6..d3edd38643 100644
--- a/tests/microbit-test.c
+++ b/tests/microbit-test.c
@@ -20,8 +20,104 @@
=20
 #include "hw/arm/nrf51.h"
 #include "hw/gpio/nrf51_gpio.h"
+#include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
=20
+#define FLASH_SIZE          (256 * NRF51_PAGE_SIZE)
+
+static void fill_and_erase(hwaddr base, hwaddr size, uint32_t address_re=
g)
+{
+    hwaddr i;
+
+    /* Erase Page */
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    writel(NRF51_NVMC_BASE + address_reg, base);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    /* Check memory */
+    for (i =3D 0; i < size / 4; i++) {
+        g_assert_cmpuint(readl(base + i * 4), =3D=3D, 0xFFFFFFFF);
+    }
+
+    /* Fill memory */
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < size / 4; i++) {
+        writel(base + i * 4, i);
+        g_assert_cmpuint(readl(base + i * 4), =3D=3D, i);
+    }
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+}
+
+static void test_nrf51_nvmc(void)
+{
+    uint32_t value;
+    hwaddr i;
+
+    /* Test always ready */
+    value =3D readl(NRF51_NVMC_BASE + NRF51_NVMC_READY);
+    g_assert_cmpuint(value & 0x01, =3D=3D, 0x01);
+
+    /* Test write-read config register */
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x03);
+    g_assert_cmpuint(readl(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG), =3D=3D,=
 0x03);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+    g_assert_cmpuint(readl(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG), =3D=3D,=
 0x00);
+
+    /* Test PCR0 */
+    fill_and_erase(NRF51_FLASH_BASE, NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPC=
R0);
+    fill_and_erase(NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
+                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR0);
+
+    /* Test PCR1 */
+    fill_and_erase(NRF51_FLASH_BASE, NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPC=
R1);
+    fill_and_erase(NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
+                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR1);
+
+    /* Erase all */
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
+        writel(NRF51_FLASH_BASE + i * 4, i);
+        g_assert_cmpuint(readl(NRF51_FLASH_BASE + i * 4), =3D=3D, i);
+    }
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
+        g_assert_cmpuint(readl(NRF51_FLASH_BASE + i * 4), =3D=3D, 0xFFFF=
FFFF);
+    }
+
+    /* Erase UICR */
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        g_assert_cmpuint(readl(NRF51_UICR_BASE + i * 4), =3D=3D, 0xFFFFF=
FFF);
+    }
+
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        writel(NRF51_UICR_BASE + i * 4, i);
+        g_assert_cmpuint(readl(NRF51_UICR_BASE + i * 4), =3D=3D, i);
+    }
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
+    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
+
+    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
+        g_assert_cmpuint(readl(NRF51_UICR_BASE + i * 4), =3D=3D, 0xFFFFF=
FFF);
+    }
+}
+
 static void test_nrf51_gpio(void)
 {
     size_t i;
@@ -246,6 +342,7 @@ int main(int argc, char **argv)
     global_qtest =3D qtest_initf("-machine microbit");
=20
     qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
+    qtest_add_func("/microbit/nrf51/nvmc", test_nrf51_nvmc);
     qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
=20
     ret =3D g_test_run();
--=20
2.20.1

