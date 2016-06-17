Received: by 10.25.21.96 with SMTP id l93csp179052lfi;
        Fri, 17 Jun 2016 02:53:38 -0700 (PDT)
X-Received: by 10.140.42.2 with SMTP id b2mr1053770qga.50.1466157218522;
        Fri, 17 Jun 2016 02:53:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si30781528qgk.13.2016.06.17.02.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 02:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDqT3-00064A-Nf
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 05:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDqSw-00060s-99
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 05:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDqSt-0002Zq-Oj
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 05:53:29 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bDqSm-0002QS-Ca; Fri, 17 Jun 2016 05:53:20 -0400
Received: by mail-wm0-x241.google.com with SMTP id m124so17328336wme.3;
	Fri, 17 Jun 2016 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=prpz3hlA8dNujrkRjG7vPozm75205fBeNf4Mqrwtn/g=;
	b=Hc+zjaKvyM6kX7m2fbLPGjOZ8lbn9pTVELEzVCDhh4pzkNrEZ8pwLWv1qERZ/p9ZL6
	9MUoeIg+xAPkXdUR5RvzvoggQPy1EDyGCoUcb+VWMNNfzIzHDZQ3jn46OgpmajwQQGyk
	nPjxRQraYAcIuvnwFWm0VwOs0gVWEmQvvTT9qaA7OSb2lVsD+80TBf6yZn7OzXXv35hk
	kstuOSmVj1WdYeLOSY5Hylry+qC7aj3eY/LrUmmtLslr1qNXd1Hq0mMULrlkLi+zaTBs
	sJrEm93TUlGDsrmd4WQATS5A47YKiDoH44R0XNeFwuRdVamLOtuCo6khqnx3UAI1H4fl
	tHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=prpz3hlA8dNujrkRjG7vPozm75205fBeNf4Mqrwtn/g=;
	b=AqKJcZWF7s8xbacZOeY7RAyXeEbxNiz3G4yTGr3wiI30deLVK7B9AFEwEfbqj86Ajz
	TEZ67f+RxBbvAKIA1o7dzDCuVVO3r9MxlCcDJipwrV/ZcS31+qJ3Bb1q0AeZB/XitK0K
	na3ZGNA5RZ6SancrVK2hjiz25QbGwSDHEFkhwMt0OujqYqPhcUvBp/dCucvhqfUFqSwC
	C9svcUuiSzqs9Rjx3DK6Pm0N3C1oukClpI4h+gIXa3LUgzv9Z161bEENBAVOOdbf15OZ
	PTOvMnCnT+wKLUhduQ0G1ib0+43bR0B/yktxt5HDWGF29135pbha93DeK8WdcSK1kC9+
	S11Q==
X-Gm-Message-State: ALyK8tJbN8/nIuwumPGQhU4JcW0DJGSJ6hQP7OmhYZJDXlKNd2IPsqhKHQNZHi6uCUlsAQ==
X-Received: by 10.194.86.70 with SMTP id n6mr1553076wjz.154.1466157199365;
	Fri, 17 Jun 2016 02:53:19 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	a84sm19295420wma.0.2016.06.17.02.53.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2016 02:53:17 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466152555-10406-1-git-send-email-clg@kaod.org>
	<1466152555-10406-5-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <884f8e43-2878-dc2e-7f4a-23aa2363b918@redhat.com>
Date: Fri, 17 Jun 2016 11:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466152555-10406-5-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH 4/4] tests: add a m25p80 test
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: krkrOK5fmEEU



On 17/06/2016 10:35, Cédric Le Goater wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  This ugly message polutes the log. How could we fix it ? 
> 
> WARNING: Image format was not specified for '/tmp/qtest.qFpMyW' and probing guessed raw.
>          Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
>          Specify the 'raw' format explicitly to remove the restrictions.

Instead of -mtdblock, use "-drive if=mtd,format=raw,file=%s".

Paolo

>  tests/Makefile.include |   2 +
>  tests/m25p80-test.c    | 241 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 243 insertions(+)
>  create mode 100644 tests/m25p80-test.c
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 6135875c37f6..81264fbdf7e7 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -252,6 +252,7 @@ gcov-files-sparc-y += hw/timer/m48t59.c
>  gcov-files-sparc64-y += hw/timer/m48t59.c
>  check-qtest-arm-y = tests/tmp105-test$(EXESUF)
>  check-qtest-arm-y = tests/ds1338-test$(EXESUF)
> +check-qtest-arm-y = tests/m25p80-test$(EXESUF)
>  gcov-files-arm-y += hw/misc/tmp105.c
>  check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
>  gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
> @@ -562,6 +563,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
>  tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-obj-y)
>  tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
>  tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
> +tests/m25p80-test$(EXESUF): tests/m25p80-test.o
>  tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
>  tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
>  tests/fw_cfg-test$(EXESUF): tests/fw_cfg-test.o $(libqos-pc-obj-y)
> diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
> new file mode 100644
> index 000000000000..5ab493ae9373
> --- /dev/null
> +++ b/tests/m25p80-test.c
> @@ -0,0 +1,241 @@
> +/*
> + * QTest testcase for the M25P80 Flash (Using the AST2400 SPI Controller)
> + *
> + * Copyright (C) 2016 IBM Corp.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bswap.h"
> +#include "libqtest.h"
> +
> +/*
> + * AST2400 SPI Controller registers
> + */
> +#define R_CONF              0x00
> +#define   CONF_ENABLE_W0       (1 << 16)
> +#define R_CE_CTRL           0x04
> +#define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
> +#define R_CTRL0             0x10
> +#define   CTRL_CE_STOP_ACTIVE  (1 << 2)
> +#define   CTRL_USERMODE        0x3
> +
> +#define AST2400_FMC_BASE    0x1E620000
> +#define AST2400_FLASH_BASE  0x20000000
> +
> +/*
> + * Flash commands
> + */
> +enum {
> +    JEDEC_READ = 0x9f,
> +    BULK_ERASE = 0xc7,
> +    READ = 0x03,
> +    PP = 0x02,
> +    WREN = 0x6,
> +    EN_4BYTE_ADDR = 0xB7,
> +    ERASE_SECTOR = 0xd8,
> +};
> +
> +#define FLASH_JEDEC         0x20ba19  /* n25q256a */
> +#define FLASH_SIZE          (32 * 1024 * 1024)
> +
> +#define PAGE_SIZE           256
> +
> +static void spi_conf(uint32_t value)
> +{
> +    uint32_t conf = readl(AST2400_FMC_BASE + R_CONF);
> +
> +    conf |= value;
> +    writel(AST2400_FMC_BASE + R_CONF, conf);
> +}
> +
> +static void spi_ctrl_start_user(void)
> +{
> +    uint32_t ctrl = readl(AST2400_FMC_BASE + R_CTRL0);
> +
> +    ctrl |= CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
> +    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
> +
> +    ctrl &= ~CTRL_CE_STOP_ACTIVE;
> +    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
> +}
> +
> +static void spi_ctrl_stop_user(void)
> +{
> +    uint32_t ctrl = readl(AST2400_FMC_BASE + R_CTRL0);
> +
> +    ctrl |= CTRL_USERMODE | CTRL_CE_STOP_ACTIVE;
> +    writel(AST2400_FMC_BASE + R_CTRL0, ctrl);
> +}
> +
> +static void test_read_jedec(void)
> +{
> +    uint32_t jedec = 0x0;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    spi_ctrl_start_user();
> +    writeb(AST2400_FLASH_BASE, JEDEC_READ);
> +    jedec |= readb(AST2400_FLASH_BASE) << 16;
> +    jedec |= readb(AST2400_FLASH_BASE) << 8;
> +    jedec |= readb(AST2400_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(jedec, ==, FLASH_JEDEC);
> +}
> +
> +static void read_page(uint32_t addr, uint32_t *page)
> +{
> +    int i;
> +
> +    spi_ctrl_start_user();
> +
> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(AST2400_FLASH_BASE, READ);
> +    writel(AST2400_FLASH_BASE, cpu_to_be32(addr));
> +
> +    /* Continuous read are supported */
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        page[i] = be32_to_cpu(readl(AST2400_FLASH_BASE));
> +    }
> +    spi_ctrl_stop_user();
> +}
> +
> +static void test_erase_sector(void)
> +{
> +    uint32_t some_page_addr = 0x600 * PAGE_SIZE;
> +    uint32_t page[PAGE_SIZE / 4];
> +    int i;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    spi_ctrl_start_user();
> +    writeb(AST2400_FLASH_BASE, WREN);
> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
> +    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
> +    spi_ctrl_stop_user();
> +
> +    /* Previous page should be full of zeroes as backend is not
> +     * initialized */
> +    read_page(some_page_addr - PAGE_SIZE, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0x0);
> +    }
> +
> +    /* But this one was erased */
> +    read_page(some_page_addr, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +}
> +
> +static void test_erase_all(void)
> +{
> +    uint32_t some_page_addr = 0x15000 * PAGE_SIZE;
> +    uint32_t page[PAGE_SIZE / 4];
> +    int i;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    /* Check some random page. Should be full of zeroes as backend is
> +     * not initialized */
> +    read_page(some_page_addr, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0x0);
> +    }
> +
> +    spi_ctrl_start_user();
> +    writeb(AST2400_FLASH_BASE, WREN);
> +    writeb(AST2400_FLASH_BASE, BULK_ERASE);
> +    spi_ctrl_stop_user();
> +
> +    /* Recheck that some random page */
> +    read_page(some_page_addr, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +}
> +
> +static void test_write_page(void)
> +{
> +    uint32_t my_page_addr = 0x14000 * PAGE_SIZE; /* beyond 16MB */
> +    uint32_t some_page_addr = 0x15000 * PAGE_SIZE;
> +    uint32_t page[PAGE_SIZE / 4];
> +    int i;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    spi_ctrl_start_user();
> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(AST2400_FLASH_BASE, PP);
> +    writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr));
> +
> +    /* Fill the page with its own addresses */
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        writel(AST2400_FLASH_BASE, cpu_to_be32(my_page_addr + i * 4));
> +    }
> +    spi_ctrl_stop_user();
> +
> +    /* Check what was written */
> +    read_page(my_page_addr, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, my_page_addr + i * 4);
> +    }
> +
> +    /* Check some other page. It should be full of 0xff */
> +    read_page(some_page_addr, page);
> +    for (i = 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], ==, 0xffffffff);
> +    }
> +}
> +
> +static char tmp_path[] = "/tmp/qtest.XXXXXX";
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +    int fd;
> +    char *args;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    fd = mkstemp(tmp_path);
> +    g_assert(fd >= 0);
> +    ret = ftruncate(fd, FLASH_SIZE);
> +    g_assert(ret == 0);
> +    close(fd);
> +
> +    args = g_strdup_printf("-M 256 -machine palmetto-bmc -mtdblock %s",
> +                           tmp_path);
> +    qtest_start(args);
> +
> +    qtest_add_func("/m25p80/read_jedec", test_read_jedec);
> +    qtest_add_func("/m25p80/erase_sector", test_erase_sector);
> +    qtest_add_func("/m25p80/erase_all",  test_erase_all);
> +    qtest_add_func("/m25p80/write_page", test_write_page);
> +
> +    ret = g_test_run();
> +
> +    qtest_quit(global_qtest);
> +    unlink(tmp_path);
> +    g_free(args);
> +    return ret;
> +}
> 
