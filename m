Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1617356wrt;
        Thu, 10 Jan 2019 01:43:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5gM0AdkbYYtmv+vyO5bBPXhXGqgG8iOUtv8hb9HzhS1FrkjYiTa5b+PHZz4cYWcxxNg6+5
X-Received: by 2002:adf:fd87:: with SMTP id d7mr8095901wrr.74.1547113420885;
        Thu, 10 Jan 2019 01:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547113420; cv=none;
        d=google.com; s=arc-20160816;
        b=BXb9eZBDfPU3xC+T7NtfLIYCHCTXCgmigxx9+GldufcV/iMxZJF0bk+BAqVywsTrnI
         LqUp0b2f5bySK4R2f1wByrMZ4UhQ8JDku7a8eU/M48dfuKWosF5mNgmQTPxPGyFa2SQV
         exjGdn/kvxhKYhkohhtzxcQXfW6tDoE2DdugJU3nQthIvgMoeb87w06/5e+rWeZURdks
         smj5Bg36RQtxTLCmz5HjoTnNfPATaqJIB0CiqRn1CqoAUZC0VSXZRB0qw8X+H8VoZ3DP
         DJ6uRM/ZeZv9CXEk+GAGm+Vph9mIVmqgFdINc8cDWSX4fUXPHdDNsPjEQ2uwTH5m3xbj
         8DMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WEU/gEpcW3Jhx7/TAlN2ZCV3tHNdqKpHTWgy+FupsI8=;
        b=nUdJZgfnYVwBGR4yMSQ4MT3dtfWFndFj9tMn0AZWbWC+2KGkyDra1pD/rV277b0paI
         qWi60OV0rDA8WKkFLJHRvIBXk5KLUgLGqNrYhm+IGIlLs2bFkGCIErJZzugu+d0Rul5E
         lU1T5RtW4s10zqSb2oDaogrsHngH3G2jR2iMtnU/PM7SwTMbK+aYFwPaierXeRztDqID
         c5K7N4QR4vKlZLCPicbRGUwLHOmHekWkzExMcLZISRr1Xz3ft7aVZR2bim47zzBig2Mp
         emgRkG587yZCsRtXDtUcqjlyb2LgY3jgNIr2Y5Hwl8sJs4oRJk84kaL9MSN4DbWKUJLk
         nneQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si10934407wmr.17.2019.01.10.01.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 01:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghWsF-0002BR-Sx
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 04:43:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ghWpH-0000GF-U0
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:40:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ghWpG-0007WP-2y
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 04:40:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34512)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1ghWpF-0007Ug-Pt; Thu, 10 Jan 2019 04:40:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C85F80F95;
	Thu, 10 Jan 2019 09:40:32 +0000 (UTC)
Received: from localhost (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF5CF17CFB;
	Thu, 10 Jan 2019 09:40:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 10 Jan 2019 09:40:20 +0000
Message-Id: <20190110094020.18354-3-stefanha@redhat.com>
In-Reply-To: <20190110094020.18354-1-stefanha@redhat.com>
References: <20190110094020.18354-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 10 Jan 2019 09:40:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/2] tests/microbit-test: add TWI stub device
 test
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
	Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oofsLh2hy+y0

This test verifies that we read back the expected I2C WHO_AM_I register
values for the accelerometer/magnetometer.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/microbit-test.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/microbit-test.c b/tests/microbit-test.c
index 0c125535f6..dcdc0cd41a 100644
--- a/tests/microbit-test.c
+++ b/tests/microbit-test.c
@@ -21,6 +21,49 @@
 #include "hw/arm/nrf51.h"
 #include "hw/gpio/nrf51_gpio.h"
 #include "hw/timer/nrf51_timer.h"
+#include "hw/i2c/microbit_i2c.h"
+
+/* Read a byte from I2C device at @addr from register @reg */
+static uint32_t i2c_read_byte(uint32_t addr, uint32_t reg)
+{
+    uint32_t val;
+
+    writel(NRF51_TWI_BASE + NRF51_TWI_REG_ADDRESS, addr);
+    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTTX, 1);
+    writel(NRF51_TWI_BASE + NRF51_TWI_REG_TXD, reg);
+    val =3D readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_TXDSENT);
+    g_assert_cmpuint(val, =3D=3D, 1);
+    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);
+
+    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STARTRX, 1);
+    val =3D readl(NRF51_TWI_BASE + NRF51_TWI_EVENT_RXDREADY);
+    g_assert_cmpuint(val, =3D=3D, 1);
+    val =3D readl(NRF51_TWI_BASE + NRF51_TWI_REG_RXD);
+    writel(NRF51_TWI_BASE + NRF51_TWI_TASK_STOP, 1);
+
+    return val;
+}
+
+static void test_microbit_i2c(void)
+{
+    uint32_t val;
+
+    /* We don't program pins/irqs but at least enable the device */
+    writel(NRF51_TWI_BASE + NRF51_TWI_REG_ENABLE, 5);
+
+    /* MMA8653 magnetometer detection */
+    val =3D i2c_read_byte(0x3A, 0x0D);
+    g_assert_cmpuint(val, =3D=3D, 0x5A);
+
+    val =3D i2c_read_byte(0x3A, 0x0D);
+    g_assert_cmpuint(val, =3D=3D, 0x5A);
+
+    /* LSM303 accelerometer detection */
+    val =3D i2c_read_byte(0x3C, 0x4F);
+    g_assert_cmpuint(val, =3D=3D, 0x40);
+
+    writel(NRF51_TWI_BASE + NRF51_TWI_REG_ENABLE, 0);
+}
=20
 static void test_nrf51_gpio(void)
 {
@@ -247,6 +290,7 @@ int main(int argc, char **argv)
=20
     qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
     qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
+    qtest_add_func("/microbit/microbit/i2c", test_microbit_i2c);
=20
     ret =3D g_test_run();
=20
--=20
2.20.1

