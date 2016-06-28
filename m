Received: by 10.25.21.96 with SMTP id l93csp1458353lfi;
        Mon, 27 Jun 2016 22:47:21 -0700 (PDT)
X-Received: by 10.55.99.216 with SMTP id x207mr1501570qkb.163.1467092841153;
        Mon, 27 Jun 2016 22:47:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si2667671qkl.90.2016.06.27.22.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 22:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHlrk-0005he-Dt
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 01:47:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHlra-0005ZA-50
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 01:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHlrH-0007be-0h
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 01:47:09 -0400
Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]:56642)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHlrG-0007bB-Kj
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 01:46:50 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6FAEFFF8D8F
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 07:46:48 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id C8DE84C0073;
	Tue, 28 Jun 2016 07:46:41 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
	<1467045813-18144-6-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <475380b0-ecfa-10cb-32a7-845f06d872c0@kaod.org>
Date: Tue, 28 Jun 2016 07:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467045813-18144-6-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1101130110375201707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddvgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.98.231
Subject: Re: [Qemu-arm] [PATCH v4 5/5] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0H3xAVaZhRzD

On 06/27/2016 06:43 PM, C=C3=A9dric Le Goater wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>=20
>  Peter,
>=20
>  This is failing miserably on a ppc64/be host ... The addresses
>  reaching the flash memory region are in the wrong endian. Should I be
>  using qtest_big_endian() ?=20

Here is a possible solution tested on a fedora23/ppc64.

Thanks,

C.


From: C=C3=A9dric Le Goater <clg@kaod.org>
Subject: [PATCH] tests: fix m25p80 test to run on a big endian host
Date: Mon, 27 Jun 2016 23:31:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

When running on a big endian host, the data read from or written to
the flash module memory mapping also needs byte-swapping.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/m25p80-test.c |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

Index: qemu-ast2400-mainline.git/tests/m25p80-test.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-ast2400-mainline.git.orig/tests/m25p80-test.c
+++ qemu-ast2400-mainline.git/tests/m25p80-test.c
@@ -58,6 +58,16 @@ enum {
=20
 #define PAGE_SIZE           256
=20
+static inline uint32_t to_flash(uint32_t data)
+{
+    return bswap32(data);
+}
+
+static inline uint32_t from_flash(uint32_t data)
+{
+    return bswap32(data);
+}
+
 static void spi_conf(uint32_t value)
 {
     uint32_t conf =3D readl(AST2400_FMC_BASE + R_CONF);
@@ -109,11 +119,11 @@ static void read_page(uint32_t addr, uin
=20
     writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
     writeb(AST2400_FLASH_BASE, READ);
-    writel(AST2400_FLASH_BASE, cpu_to_be32(addr));
+    writel(AST2400_FLASH_BASE, to_flash(addr));
=20
     /* Continuous read are supported */
     for (i =3D 0; i < PAGE_SIZE / 4; i++) {
-        page[i] =3D be32_to_cpu(readl(AST2400_FLASH_BASE));
+        page[i] =3D from_flash(readl(AST2400_FLASH_BASE));
     }
     spi_ctrl_stop_user();
 }
@@ -130,7 +140,7 @@ static void test_erase_sector(void)
     writeb(AST2400_FLASH_BASE, WREN);
     writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
     writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
-    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
+    writel(AST2400_FLASH_BASE, to_flash(some_page_addr));
     spi_ctrl_stop_user();
=20
     /* Previous page should be full of zeroes as backend is not
@@ -186,11 +196,11 @@ static void test_write_page(void)
     spi_ctrl_start_user();
     writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
     writeb(AST2400_FLASH_BASE, PP);
-    writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr));
+    writel(AST2400_FLASH_BASE, to_flash(my_page_addr));
=20
     /* Fill the page with its own addresses */
     for (i =3D 0; i < PAGE_SIZE / 4; i++) {
-        writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr + i * 4));
+        writel(AST2400_FLASH_BASE, to_flash(my_page_addr + i * 4));
     }
     spi_ctrl_stop_user();
=20


