Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5099086wrt;
        Sun, 20 Jan 2019 06:36:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7fApawwHnEuiiNJ5oUEPw5MTUckhSfiIhdlKQw5VTbDcoM+iUh6uRLbCOCPXsTOGXERFk8
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr14397478wrh.317.1547994961366;
        Sun, 20 Jan 2019 06:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547994961; cv=none;
        d=google.com; s=arc-20160816;
        b=dWpbVWJE6TuR9OWHgF8BCaN62fkx3JiAg7A6M7GTi751t/H/ljEEzOlTAsn6XlltDj
         TqeKtDT+ZgwJvWdhc74lzUQxCufoSsBGSoeFqEY3b07N8RPJjo+el2/peCTvPXMhDj28
         N1KuFJ+o60yQ6W7De2A9NkijQEC+nL5VY/7tvqBa2UVsyGvh2+Qnm9Kyn2n8B6pSUolA
         T4006p4xO1BS7uGyFK45jsaQtriVcPzg+4qkJsl1r0vprVns7ey9Pp+wXf5wZe33OCVE
         s2+TP/IsfxZGsEaZVd0WQJEu4qMWu0U6ncO0Qg6Y5YKVGZPKuaysgmkJQr7EPbhx30P4
         jqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3GJWhaB04CzHcFY9hVSvzEA4wCgOiKWXnU/a08ZpR+U=;
        b=LAvlI1q5psF8b0WsLr+wXkekQmatK2JuMWf7KYZ0PB6HtKogrVS+X9n8W/OSLu/5FF
         GikKj41VLo0am4T/f6boq90bHAKicNvQ0GKn7wVylrTSjy7QdiSmOCQ3vXWcX0NVB2fr
         7N5HeXmWmrZygEi8igEuvTJiQnrLu81+wltOB2gre0JpSu+dFYQ/Z/HV/r7S2prHMNE+
         4a6X2rF9w/lSLgZ5SqXrBG1Z//wFLxaK7sFVNpvGT0XIOYHWGzFk3Wxgghubifsr+cyx
         dkE/YlTFdNODo4uPZ5xnXmafYO8e6vqlTT5aOQodkZZ1xyDW1Azpu1QHxqOHydAP1L1j
         WZeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si62792396wrs.411.2019.01.20.06.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glECe-0002st-AD
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECM-0002rS-73
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECK-0002XI-8S
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:35:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1glECI-0002SU-4e; Sun, 20 Jan 2019 09:35:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2D9219CF6A;
	Sun, 20 Jan 2019 14:35:33 +0000 (UTC)
Received: from localhost (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39AD31001F50;
	Sun, 20 Jan 2019 14:35:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 20 Jan 2019 14:34:52 +0000
Message-Id: <20190120143452.21683-5-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-1-stefanha@redhat.com>
References: <20190120143452.21683-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 20 Jan 2019 14:35:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/4] tests/microbit-test: Add tests for nRF51 NVMC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5z7BYo9KLWFM

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

