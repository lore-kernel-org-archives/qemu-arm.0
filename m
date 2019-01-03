Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp422715wrt;
        Thu, 3 Jan 2019 01:13:46 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4cq6fqEYSt75wEiltOzELTmQd5m3wfz0pzKI6e114Qwp6SdDjj7tjnDQBsEV2TC1mJaBeq
X-Received: by 2002:a37:cc4c:: with SMTP id r73mr42461386qki.120.1546506825974;
        Thu, 03 Jan 2019 01:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546506825; cv=none;
        d=google.com; s=arc-20160816;
        b=SSO2tWF2EbNhiydm+lwJxex+0zpU1Q/llAAjFPu3lJiPoV2jWoP/sbxI5pDj1OwQe7
         AovmT1G4W/qRVfkzfwMETc5eT8td4lh3mp9t8k42XJoIpRPAw6OoNl2YDv7gS9S2Q2/U
         JoWiAkc5WXuQtynirgUvbcx6ArwNAveUDJPyH2O4Fsx68kxFmTIvQPblW8Nhw/y2ctBl
         vEjoiVWRQG2WG2Cq40w63ZSpsOxSfFtMijqrhe/5sfbBe/xVA6kfLiqA4YbRbiKPPgdp
         eR317l06dDJ4weUN05QiKIhZGHVtsNiuHA1T4TZ3fvsiRg1NuT2fQS8FAQrY+H2ueBHP
         hkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lFAqktybD+kfySZ8Vl4xScWxjWUYxhLi0OgqpM4P9pI=;
        b=EFdkQkevTatxGKZ9v4qwVIO38oZCXE+ILclFUQ/X/FqSGS22ArVT3S0LN2rSxo4E+g
         Q/ignX7VtrgZ5vDzQrkl6qpZDaslLRjFJ6vGQqs+fUJR11vDBTGlzSeG5lBsTQZokOEh
         FR9gW6rvk3K70MenaJQP41CXIUJrYYevqDZcxK7XmCWlf7GyFFpCb37g4ZXffAaOPsJw
         wWmcKK2WrTKDPS0AYsgBnzmeQhEXa53yWDvlEAM7qnREoueZ2RAbZEcs5u75KiGBo8Ll
         suTbryE0qvoWJGmRlxt3/FMAtsWNbQJ1EllAO4RsUFcU9LV3xhPOCYhMDfzY2WlZfscE
         XVrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si101616qvf.141.2019.01.03.01.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:13:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez4T-0003rA-CV
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:13:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3u-0003k6-4d
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 04:13:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3s-0006jX-Ts
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 04:13:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:5782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3o-0006gn-DW; Thu, 03 Jan 2019 04:13:04 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3861C7A19;
	Thu,  3 Jan 2019 09:13:03 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA1719742;
	Thu,  3 Jan 2019 09:13:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:15 +0000
Message-Id: <20190103091119.9367-8-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Jan 2019 09:13:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 07/11] tests/microbit-test: Add Tests for nRF51
 GPIO
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
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a77sTZQPoCmE

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

The test suite for the nRF51 GPIO peripheral for now
only tests initial state. Additionally a set of
tests testing an implementation detail of the model
are included.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/Makefile.include |   2 +
 tests/microbit-test.c  | 160 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 tests/microbit-test.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3f5a1d0c30..9c84bbd829 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -277,6 +277,7 @@ check-qtest-sparc64-y +=3D tests/boot-serial-test$(EX=
ESUF)
 check-qtest-arm-y +=3D tests/tmp105-test$(EXESUF)
 check-qtest-arm-y +=3D tests/pca9552-test$(EXESUF)
 check-qtest-arm-y +=3D tests/ds1338-test$(EXESUF)
+check-qtest-arm-y +=3D tests/microbit-test$(EXESUF)
 check-qtest-arm-y +=3D tests/m25p80-test$(EXESUF)
 check-qtest-arm-y +=3D tests/virtio-blk-test$(EXESUF)
 check-qtest-arm-y +=3D tests/test-arm-mptimer$(EXESUF)
@@ -708,6 +709,7 @@ tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-=
sector.o $(libqos-obj-y)
 tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
 tests/pca9552-test$(EXESUF): tests/pca9552-test.o $(libqos-omap-obj-y)
 tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
+tests/microbit-test$(EXESUF): tests/microbit-test.o
 tests/m25p80-test$(EXESUF): tests/m25p80-test.o
 tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
 tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
diff --git a/tests/microbit-test.c b/tests/microbit-test.c
new file mode 100644
index 0000000000..535714797a
--- /dev/null
+++ b/tests/microbit-test.c
@@ -0,0 +1,160 @@
+ /*
+ * QTest testcase for Microbit board using the Nordic Semiconductor nRF5=
1 SoC.
+ *
+ * nRF51:
+ * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
pdf
+ * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.p=
df
+ *
+ * Microbit Board: http://microbit.org/
+ *
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include "libqtest.h"
+
+#include "hw/arm/nrf51.h"
+#include "hw/gpio/nrf51_gpio.h"
+
+static void test_nrf51_gpio(void)
+{
+    size_t i;
+    uint32_t actual, expected;
+
+    struct {
+        hwaddr addr;
+        uint32_t expected;
+    } const reset_state[] =3D {
+        {NRF51_GPIO_REG_OUT, 0x00000000}, {NRF51_GPIO_REG_OUTSET, 0x0000=
0000},
+        {NRF51_GPIO_REG_OUTCLR, 0x00000000}, {NRF51_GPIO_REG_IN, 0x00000=
000},
+        {NRF51_GPIO_REG_DIR, 0x00000000}, {NRF51_GPIO_REG_DIRSET, 0x0000=
0000},
+        {NRF51_GPIO_REG_DIRCLR, 0x00000000}
+    };
+
+    /* Check reset state */
+    for (i =3D 0; i < ARRAY_SIZE(reset_state); i++) {
+        expected =3D reset_state[i].expected;
+        actual =3D readl(NRF51_GPIO_BASE + reset_state[i].addr);
+        g_assert_cmpuint(actual, =3D=3D, expected);
+    }
+
+    for (i =3D 0; i < NRF51_GPIO_PINS; i++) {
+        expected =3D 0x00000002;
+        actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START + i =
* 4);
+        g_assert_cmpuint(actual, =3D=3D, expected);
+    }
+
+    /* Check dir bit consistency between dir and cnf */
+    /* Check set via DIRSET */
+    expected =3D 0x80000001;
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIRSET, expected);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIR);
+    g_assert_cmpuint(actual, =3D=3D, expected);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_END) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+
+    /* Check clear via DIRCLR */
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIRCLR, 0x80000001);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIR);
+    g_assert_cmpuint(actual, =3D=3D, 0x00000000);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_END) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+
+    /* Check set via DIR */
+    expected =3D 0x80000001;
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIR, expected);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIR);
+    g_assert_cmpuint(actual, =3D=3D, expected);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_END) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+
+    /* Reset DIR */
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_DIR, 0x00000000);
+
+    /* Check Input propagates */
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0x00);
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 0);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 1);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, -1);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0x02);
+
+    /* Check pull-up working */
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 0);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b0000);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b1110);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0x02);
+
+    /* Check pull-down working */
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 1);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b0000);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b0110);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0x02);
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, -1);
+
+    /* Check Output propagates */
+    irq_intercept_out("/machine/nrf51");
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b0011);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_OUTSET, 0x01);
+    g_assert_true(get_irq(0));
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_OUTCLR, 0x01);
+    g_assert_false(get_irq(0));
+
+    /* Check self-stimulation */
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b01);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_OUTSET, 0x01);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x01);
+
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_OUTCLR, 0x01);
+    actual =3D readl(NRF51_GPIO_BASE + NRF51_GPIO_REG_IN) & 0x01;
+    g_assert_cmpuint(actual, =3D=3D, 0x00);
+
+    /*
+     * Check short-circuit - generates an guest_error which must be chec=
ked
+     * manually as long as qtest can not scan qemu_log messages
+     */
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_CNF_START, 0b01);
+    writel(NRF51_GPIO_BASE + NRF51_GPIO_REG_OUTSET, 0x01);
+    qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 0);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    global_qtest =3D qtest_initf("-machine microbit");
+
+    qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
+
+    ret =3D g_test_run();
+
+    qtest_quit(global_qtest);
+    return ret;
+}
--=20
2.19.2

