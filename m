Received: by 10.25.21.96 with SMTP id l93csp1210829lfi;
        Mon, 27 Jun 2016 09:48:23 -0700 (PDT)
X-Received: by 10.200.45.28 with SMTP id n28mr24735568qta.79.1467046100695;
        Mon, 27 Jun 2016 09:48:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si17279228qkl.167.2016.06.27.09.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 09:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHZhr-0006SS-Rd
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 12:48:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZeG-0002Tw-SY
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZeB-0008N2-Qc
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:35 -0400
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:54818)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHZeB-0008Ms-H1
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:31 -0400
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id E6CEF10049AC
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 18:44:30 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id 69C6E540076;
	Mon, 27 Jun 2016 18:44:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 27 Jun 2016 18:43:33 +0200
Message-Id: <1467045813-18144-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467045813-18144-1-git-send-email-clg@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6336001727583718161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.53.149
Subject: [Qemu-arm] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6iPNz6kvgA55

This test uses the palmetto platform and the AST2400 SPI controller to
test the m25p80 flash module device model. The flash model is defined
by the platform (n25q256a) and it would be nice to find way to control
it, using a property probably.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 Peter,

 This is failing miserably on a ppc64/be host ... The addresses
 reaching the flash memory region are in the wrong endian. Should I be
 using qtest_big_endian() ?=20

 Changes since v2:

 - changed mkstemp() path prefix
=20
 Changes since v1:

 - fixed guest args to use -drive and not -mtdblock

 tests/Makefile.include |   2 +
 tests/m25p80-test.c    | 242 +++++++++++++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 244 insertions(+)
 create mode 100644 tests/m25p80-test.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fd2dba49a741..c64bc2097e44 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -252,6 +252,7 @@ gcov-files-sparc-y +=3D hw/timer/m48t59.c
 gcov-files-sparc64-y +=3D hw/timer/m48t59.c
 check-qtest-arm-y =3D tests/tmp105-test$(EXESUF)
 check-qtest-arm-y =3D tests/ds1338-test$(EXESUF)
+check-qtest-arm-y =3D tests/m25p80-test$(EXESUF)
 gcov-files-arm-y +=3D hw/misc/tmp105.c
 check-qtest-arm-y +=3D tests/virtio-blk-test$(EXESUF)
 gcov-files-arm-y +=3D arm-softmmu/hw/block/virtio-blk.c
@@ -568,6 +569,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-te=
st.o \
 tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-o=
bj-y)
 tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
 tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
+tests/m25p80-test$(EXESUF): tests/m25p80-test.o
 tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
 tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
 tests/fw_cfg-test$(EXESUF): tests/fw_cfg-test.o $(libqos-pc-obj-y)
diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
new file mode 100644
index 000000000000..d5fb0b20283e
--- /dev/null
+++ b/tests/m25p80-test.c
@@ -0,0 +1,242 @@
+/*
+ * QTest testcase for the M25P80 Flash (Using the AST2400 SPI Controller=
)
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
+ * AST2400 SPI Controller registers
+ */
+#define R_CONF              0x00
+#define   CONF_ENABLE_W0       (1 << 16)
+#define R_CE_CTRL           0x04
+#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
+#define R_CTRL0             0x10
+#define   CTRL_CE_STOP_ACTIVE  (1 << 2)
+#define   CTRL_USERMODE        0x3
+
+#define AST2400_FMC_BASE    0x1E620000
+#define AST2400_FLASH_BASE  0x20000000
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
+static void spi_conf(uint32_t value)
+{
+    uint32_t conf =3D readl(AST2400_FMC_BASE + R_CONF);
+
+    conf |=3D value;
+    writel(AST2400_FMC_BASE + R_CONF, conf);
+}
+
+static void spi_ctrl_start_user(void)
+{
+    uint32_t ctrl =3D readl(AST2400_FMC_BASE + R_CTRL0);
+
+    ctrl |=3D CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
+    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
+
+    ctrl &=3D ~CTRL_CE_STOP_ACTIVE;
+    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
+}
+
+static void spi_ctrl_stop_user(void)
+{
+    uint32_t ctrl =3D readl(AST2400_FMC_BASE + R_CTRL0);
+
+    ctrl |=3D CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
+    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
+}
+
+static void test_read_jedec(void)
+{
+    uint32_t jedec =3D 0x0;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    spi_ctrl_start_user();
+    writeb(AST2400_FLASH_BASE, JEDEC_READ);
+    jedec |=3D readb(AST2400_FLASH_BASE) << 16;
+    jedec |=3D readb(AST2400_FLASH_BASE) << 8;
+    jedec |=3D readb(AST2400_FLASH_BASE);
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
+    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(AST2400_FLASH_BASE, READ);
+    writel(AST2400_FLASH_BASE, cpu_to_be32(addr));
+
+    /* Continuous read are supported */
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        page[i] =3D be32_to_cpu(readl(AST2400_FLASH_BASE));
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
+    writeb(AST2400_FLASH_BASE, WREN);
+    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
+    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
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
+    writeb(AST2400_FLASH_BASE, WREN);
+    writeb(AST2400_FLASH_BASE, BULK_ERASE);
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
+    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(AST2400_FLASH_BASE, PP);
+    writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr));
+
+    /* Fill the page with its own addresses */
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr + i * 4));
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
+    args =3D g_strdup_printf("-M 256 -machine palmetto-bmc "
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
--=20
2.1.4

