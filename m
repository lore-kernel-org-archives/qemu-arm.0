Received: by 10.25.150.194 with SMTP id y185csp2422221lfd;
        Tue, 29 Nov 2016 08:05:38 -0800 (PST)
X-Received: by 10.55.16.22 with SMTP id a22mr24374794qkh.226.1480435538882;
        Tue, 29 Nov 2016 08:05:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si27838081qtd.12.2016.11.29.08.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkuX-0006VR-J1
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:05:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcs-00081q-QD
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcn-0005Z9-Re
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:22 -0500
Received: from mo1.mail-out.ovh.net ([178.32.228.1]:44606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcn-0005YK-LA
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:17 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 7D7AA1F8A1
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:47:15 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id DD55412009B;
	Tue, 29 Nov 2016 16:47:07 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:56 +0100
Message-Id: <1480434248-27138-19-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11746232256814418705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.228.1
Subject: [Qemu-arm] [PATCH for-2.9 18/30] aspeed/smc: extend tests for
 Command mode
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1fb7DofdrCR

The Aspeed SMC controllers have a mode (Command mode) in which
accesses to the flash content are no different than doing MMIOs. The
controller generates all the necessary commands to load (or store)
data in memory.

So add a couple of tests doing direct reads and writes on the AHB bus.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 tests/m25p80-test.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
index cb7ec81f1a6d..3d449bd194a9 100644
--- a/tests/m25p80-test.c
+++ b/tests/m25p80-test.c
@@ -36,6 +36,9 @@
 #define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
 #define R_CTRL0             0x10
 #define   CTRL_CE_STOP_ACTIVE  (1 << 2)
+#define   CTRL_READMODE        0x0
+#define   CTRL_FREADMODE       0x1
+#define   CTRL_WRITEMODE       0x2
 #define   CTRL_USERMODE        0x3
=20
 #define ASPEED_FMC_BASE    0x1E620000
@@ -76,6 +79,22 @@ static void spi_conf(uint32_t value)
     writel(ASPEED_FMC_BASE + R_CONF, conf);
 }
=20
+static void spi_ce_ctrl(uint32_t value)
+{
+    uint32_t conf =3D readl(ASPEED_FMC_BASE + R_CE_CTRL);
+
+    conf |=3D value;
+    writel(ASPEED_FMC_BASE + R_CE_CTRL, conf);
+}
+
+static void spi_ctrl_setmode(uint8_t mode, uint8_t cmd)
+{
+    uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
+    ctrl &=3D ~(CTRL_USERMODE | 0xff << 16);
+    ctrl |=3D mode | (cmd << 16);
+    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
+}
+
 static void spi_ctrl_start_user(void)
 {
     uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
@@ -128,6 +147,18 @@ static void read_page(uint32_t addr, uint32_t *page)
     spi_ctrl_stop_user();
 }
=20
+static void read_page_mem(uint32_t addr, uint32_t *page)
+{
+    int i;
+
+    /* move out USER mode to use direct reads from the AHB bus */
+    spi_ctrl_setmode(CTRL_READMODE, READ);
+
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        page[i] =3D make_be32(readl(ASPEED_FLASH_BASE + addr + i * 4));
+    }
+}
+
 static void test_erase_sector(void)
 {
     uint32_t some_page_addr =3D 0x600 * PAGE_SIZE;
@@ -195,6 +226,7 @@ static void test_write_page(void)
=20
     spi_ctrl_start_user();
     writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
+    writeb(ASPEED_FLASH_BASE, WREN);
     writeb(ASPEED_FLASH_BASE, PP);
     writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
=20
@@ -217,6 +249,58 @@ static void test_write_page(void)
     }
 }
=20
+static void test_read_page_mem(void)
+{
+    uint32_t my_page_addr =3D 0x14000 * PAGE_SIZE; /* beyond 16MB */
+    uint32_t some_page_addr =3D 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    /* Enable 4BYTE mode for flash. This is should be strapped by HW
+     * for CE0 anyhow.
+     */
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+
+    /* Check what was written */
+    read_page_mem(my_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, my_page_addr + i * 4);
+    }
+
+    /* Check some other page. It should be full of 0xff */
+    read_page_mem(some_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, 0xffffffff);
+    }
+}
+
+static void test_write_page_mem(void)
+{
+    uint32_t my_page_addr =3D 0x15000 * PAGE_SIZE;
+    uint32_t page[PAGE_SIZE / 4];
+    int i;
+
+    /* Enable 4BYTE mode for flash. This is should be strapped by HW
+     * for CE0 anyhow.
+     */
+    spi_ce_ctrl(1 << CRTL_EXTENDED0);
+
+    /* move out USER mode to use direct writes to the AHB bus */
+    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
+
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        writel(ASPEED_FLASH_BASE + my_page_addr + i * 4,
+               make_be32(my_page_addr + i * 4));
+    }
+
+    /* Check what was written */
+    read_page_mem(my_page_addr, page);
+    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
+        g_assert_cmphex(page[i], =3D=3D, my_page_addr + i * 4);
+    }
+}
+
+
 static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
=20
 int main(int argc, char **argv)
@@ -242,6 +326,8 @@ int main(int argc, char **argv)
     qtest_add_func("/m25p80/erase_sector", test_erase_sector);
     qtest_add_func("/m25p80/erase_all",  test_erase_all);
     qtest_add_func("/m25p80/write_page", test_write_page);
+    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
+    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
=20
     ret =3D g_test_run();
=20
--=20
2.7.4

