Received: by 10.80.163.71 with SMTP id 65csp3426755edn;
        Thu, 6 Oct 2016 13:55:02 -0700 (PDT)
X-Received: by 10.55.156.18 with SMTP id f18mr15693989qke.177.1475787301926;
        Thu, 06 Oct 2016 13:55:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m23si2021311qtc.142.2016.10.06.13.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 13:55:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsFgy-0004BL-ON
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 16:55:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bsFgs-0004BB-O7
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 16:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bsFgn-0004eW-LP
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 16:54:54 -0400
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:44199)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bsFgn-0004e6-Co
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 16:54:49 -0400
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id B8C9710E0D
	for <qemu-arm@nongnu.org>; Thu,  6 Oct 2016 22:54:46 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player726.ha.ovh.net (Postfix) with ESMTPSA id 4A2E72A0067;
	Thu,  6 Oct 2016 22:54:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  6 Oct 2016 22:54:31 +0200
Message-Id: <1475787271-28794-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13408904942490979089
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfedvgdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.158.110
Subject: [Qemu-arm] [PATCH v5] tests: add a m25p80 test
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIZPDVn06bQ/

This test uses the palmetto platform and the Aspeed SPI controller to
test the m25p80 flash module device model. The flash model is defined
by the platform (n25q256a) and it would be nice to find way to control
it, using a property probably.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Brainstormed-with: Greg Kurz <groug@kaod.org>
---

 Changes since v5:

 - use an explicit bswap for the values read/written to the flash
   region.

 Changes since v4:

 - fixed Makefile targets
 - replaced -M with -m in qtest command line
=20
 Changes since v2:

 - changed mkstemp() path prefix
=20
 Changes since v1:

 - fixed guest args to use -drive and not -mtdblock

 tests/Makefile.include |    2=20
 tests/m25p80-test.c    |  252 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
 2 files changed, 254 insertions(+)
 create mode 100644 tests/m25p80-test.c

Index: qemu-aspeed.git/tests/Makefile.include
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/tests/Makefile.include
+++ qemu-aspeed.git/tests/Makefile.include
@@ -288,6 +288,7 @@ check-qtest-sparc64-y =3D tests/endianness
=20
 check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
 check-qtest-arm-y +=3D tests/ds1338-test$(EXESUF)
+check-qtest-arm-y +=3D tests/m25p80-test$(EXESUF)
 gcov-files-arm-y +=3D hw/misc/tmp105.c
 check-qtest-arm-y +=3D tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y +=3D arm-softmmu/hw/block/virtio-blk.c
@@ -618,6 +619,7 @@ tests/bios-tables-test$(EXESUF): tests/b
 tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-o=
bj-y)
 tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
 tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
+tests/m25p80-test$(EXESUF): tests/m25p80-test.o
 tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
 tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
 tests/fw_cfg-test$(EXESUF): tests/fw_cfg-test.o $(libqos-pc-obj-y)
Index: qemu-aspeed.git/tests/m25p80-test.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null
+++ qemu-aspeed.git/tests/m25p80-test.c
@@ -0,0 +1,252 @@
+/*
+ * QTest testcase for the M25P80 Flash (Using the Aspeed SPI
+ * Controller)
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "libqtest.h"
+
+/*
+ * ASPEED SPI Controller registers
+ */
+#define R_CONF              0x00
+#define   CONF_ENABLE_W0       (1 << 16)
+#define R_CE_CTRL           0x04
+#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
+#define R_CTRL0             0x10
+#define   CTRL_CE_STOP_ACTIVE  (1 << 2)
+#define   CTRL_USERMODE        0x3
+
+#define ASPEED_FMC_BASE    0x1E620000
+#define ASPEED_FLASH_BASE  0x20000000
+
+/*
+ * Flash commands
+ */
+enum {
+    JEDEC_READ =3D 0x9f,
+    BULK_ERASE =3D 0xc7,
+    READ =3D 0x03,
+    PP =3D 0x02,
+    WREN =3D 0x6,
+    EN_4BYTE_ADDR =3D 0xB7,
+    ERASE_SECTOR =3D 0xd8,
+};
+
+#define FLASH_JEDEC         0x20ba19  /* n25q256a */
+#define FLASH_SIZE          (32 * 1024 * 1024)
+
+#define PAGE_SIZE           256
+
+/*
+ * Use an explicit bswap for the values read/wrote to the flash region
+ * as they are BE and the Aspeed CPU is LE.
+ */
+static inline uint32_t make_be32(uint32_t data)
+{
+    return bswap32(data);
+}
+
+static void spi_conf(uint32_t value)
+{
+    uint32_t conf =3D readl(ASPEED_FMC_BASE + R_CONF);
+
+    conf |=3D value;
+    writel(ASPEED_FMC_BASE + R_CONF, conf);
+}
+
+static void spi_ctrl_start_user(void)
+{
+    uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
+
+    ctrl |=3D CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
+    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
+
+    ctrl &=3D ~CTRL_CE_STOP_ACTIVE;
+    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
+}
+
+static void spi_ctrl_stop_user(void)
+{
+    uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
+
+    ctrl |=3D CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
+    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
+}
+
+static void test_read_jedec(void)
+{
+    uint32_t jedec =3D 0x0;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, JEDEC_READ);
+    jedec |=3D readb(ASPEED_FLASH_BASE) << 16;
+    jedec |=3D readb(ASPEED_FLASH_BASE) << 8;
+    jedec |=3D readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+
+    g_assert_cmphex(jedec, =3D=3D, FLASH_JEDEC);
+}
+
+static void read_page(uint32_t addr, uint32_t *page)
+{
+    int i;
+
+    spi_ctrl_start_user();
+
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, READ);
+    writel(ASPEED_FLASH_BASE, make_be32(addr));
+
+    /* Continuous read are supported */
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        page[i] =3D make_be32(readl(ASPEED_FLASH_BASE));
+    }
+    spi_ctrl_stop_user();
+}
+
+static void test_erase_sector(void)
+{
+    uint32_t some_page_addr =3D 0x600 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, ERASE_SECTOR);
+    writel(ASPEED_FLASH_BASE, make_be32(some_page_addr));
+    spi_ctrl_stop_user();
+
+    /* Previous page should be full of zeroes as backend is not
+     * initialized */
+    read_page(some_page_addr - PAGE_SIZE, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0x0);
+    }
+
+    /* But this one was erased */
+    read_page(some_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0xffffffff);
+    }
+}
+
+static void test_erase_all(void)
+{
+    uint32_t some_page_addr =3D 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    /* Check some random page. Should be full of zeroes as backend is
+     * not initialized */
+    read_page(some_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0x0);
+    }
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, BULK_ERASE);
+    spi_ctrl_stop_user();
+
+    /* Recheck that some random page */
+    read_page(some_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0xffffffff);
+    }
+}
+
+static void test_write_page(void)
+{
+    uint32_t my_page_addr =3D 0x14000 * PAGE_SIZE; /* beyond 16MB */
+    uint32_t some_page_addr =3D 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, PP);
+    writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE, make_be32(my_page_addr + i * 4));
+    }
+    spi_ctrl_stop_user();
+
+    /* Check what was written */
+    read_page(my_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, my_page_addr + i * 4);
+    }
+
+    /* Check some other page. It should be full of 0xff */
+    read_page(some_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0xffffffff);
+    }
+}
+
+static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
+
+int main(int argc, char **argv)
+{
+    int ret;
+    int fd;
+    char *args;
+
+    g_test_init(&argc, &argv, NULL);
+
+    fd =3D mkstemp(tmp_path);
+    g_assert(fd >=3D 0);
+    ret =3D ftruncate(fd, FLASH_SIZE);
+    g_assert(ret =3D=3D 0);
+    close(fd);
+
+    args =3D g_strdup_printf("-m 256 -machine palmetto-bmc "
+                           "-drive file=3D%s,format=3Draw,if=3Dmtd",
+                           tmp_path);
+    qtest_start(args);
+
+    qtest_add_func("/m25p80/read_jedec", test_read_jedec);
+    qtest_add_func("/m25p80/erase_sector", test_erase_sector);
+    qtest_add_func("/m25p80/erase_all",  test_erase_all);
+    qtest_add_func("/m25p80/write_page", test_write_page);
+
+    ret =3D g_test_run();
+
+    qtest_quit(global_qtest);
+    unlink(tmp_path);
+    g_free(args);
+    return ret;
+}
