Received: by 10.25.21.96 with SMTP id l93csp836434lfi;
        Sat, 2 Jul 2016 11:06:30 -0700 (PDT)
X-Received: by 10.55.18.86 with SMTP id c83mr6243376qkh.187.1467482790003;
        Sat, 02 Jul 2016 11:06:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si2924476qki.205.2016.07.02.11.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jul 2016 11:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJPJF-0001g0-Ce
	for alex.bennee@linaro.org; Sat, 02 Jul 2016 14:06:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJPIE-0001Cv-R6
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 14:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJPIB-0004Cj-RY
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 14:05:25 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bJPI5-0004CJ-4h; Sat, 02 Jul 2016 14:05:17 -0400
Received: by mail-lf0-x243.google.com with SMTP id a2so13968187lfe.3;
	Sat, 02 Jul 2016 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=0lTLsD7fdHAW11Qb+XVYD6CG4i9hHkUi5kAQEqEfnkg=;
	b=fDQHyLyHCo6RGv9TJzZsE9wXMgT8euMTRNpS1205SFGB8OfPIm0rc/cXjzJBUid9QP
	iuhDK+JPqJnrkHj3/TpqgGwTunfag1d+NJa0RXxlFLDoD7FU1Xt5VQVZhfXcYxlqN/RW
	kmuRtxFr4IV/8gzB3Id3C02+T7TZro0/cO6rCHfQiSzPZqZZ4wqH9f9duMeTdZNawvSt
	SJ5LiIKBop0bawyjZTxSWvtRQkin3Bp5Gt46AjrEDN/l3T5yKA/hDs+AgYKIWvCuraAJ
	ZFuyNBkKnoeS+qEw3bJf7K1tu5mTB0OjCNE7DuV7QakiNBV+tW8ZiNcHjjKwCfBCNPi3
	tUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0lTLsD7fdHAW11Qb+XVYD6CG4i9hHkUi5kAQEqEfnkg=;
	b=gsiktksOk76Ms5C5dNR1etyRh3UXUQ/PmUlNJ8q6CdmJcaxYHFCjGL2oJAKxN68g8R
	pOTzn1GLKpsHAbCD3I4LihLvMDPF4igpxDvwTvPXAhvNj77vSfdNEcfEJfs/Uwv1ziFb
	nz0ISgtYldfx2wrqTw3YuKXZm+FN9Jb1VZv2A6dCBwXX3euhuXxfAYsiT7rARFLRie2n
	hHn0LjXPSu49pK7GUnyxsYDaxqvJzY1hsH9qEyynFnjkXt9ju6UeQnyPHNwo9982ORq8
	mGNNyeCYVHJ2R9jJayzorBAKlsQayrhg5tMnvD7BFAtt//SyXhFtIrhic94+u14wuylR
	6RMw==
X-Gm-Message-State: ALyK8tKYvqV3Y8zFJMGBCUpjs4ibehOymuf7EmPMmmDKNiSzMu3hcNIcaNpjzOk1G5qbQQ==
X-Received: by 10.25.42.18 with SMTP id q18mr1179272lfq.102.1467482716198;
	Sat, 02 Jul 2016 11:05:16 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4]) by smtp.gmail.com with ESMTPSA id
	h83sm3145692lji.28.2016.07.02.11.05.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jul 2016 11:05:15 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <5778025A.9020608@gmail.com>
Date: Sat, 2 Jul 2016 20:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467138270-32481-10-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfKPsKdMZ941



W dniu 28.06.2016 o 20:24, Cédric Le Goater pisze:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>
>   Changes since v4:
>
>   - fixed Makefile targets
>   - replaced -M with -m in qtest command line
>   
>   Changes since v2:
>
>   - changed mkstemp() path prefix
>   
>   Changes since v1:
>
>   - fixed guest args to use -drive and not -mtdblock
>
>   tests/Makefile.include |   2 +
>   tests/m25p80-test.c    | 242 +++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 244 insertions(+)
>   create mode 100644 tests/m25p80-test.c
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 6c09962f7581..149f92585c1b 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -252,6 +252,7 @@ gcov-files-sparc-y += hw/timer/m48t59.c
>   gcov-files-sparc64-y += hw/timer/m48t59.c
>   check-qtest-arm-y = tests/tmp105-test$(EXESUF)
>   check-qtest-arm-y += tests/ds1338-test$(EXESUF)
> +check-qtest-arm-y += tests/m25p80-test$(EXESUF)
>   gcov-files-arm-y += hw/misc/tmp105.c
>   check-qtest-arm-y += tests/virtio-blk-test$(EXESUF)
>   gcov-files-arm-y += arm-softmmu/hw/block/virtio-blk.c
> @@ -568,6 +569,7 @@ tests/bios-tables-test$(EXESUF): tests/bios-tables-test.o \
>   tests/pxe-test$(EXESUF): tests/pxe-test.o tests/boot-sector.o $(libqos-obj-y)
>   tests/tmp105-test$(EXESUF): tests/tmp105-test.o $(libqos-omap-obj-y)
>   tests/ds1338-test$(EXESUF): tests/ds1338-test.o $(libqos-imx-obj-y)
> +tests/m25p80-test$(EXESUF): tests/m25p80-test.o
>   tests/i440fx-test$(EXESUF): tests/i440fx-test.o $(libqos-pc-obj-y)
>   tests/q35-test$(EXESUF): tests/q35-test.o $(libqos-pc-obj-y)
>   tests/fw_cfg-test$(EXESUF): tests/fw_cfg-test.o $(libqos-pc-obj-y)
> diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
> new file mode 100644
> index 000000000000..305c52319a33
> --- /dev/null
> +++ b/tests/m25p80-test.c
> @@ -0,0 +1,242 @@
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
Hi,

I think you should not make any byte swapping because
qtest for all write* instructions (see qtest.c:377).

Regards,
Marcin

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
> +static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
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
> +    args = g_strdup_printf("-m 256 -machine palmetto-bmc "
> +                           "-drive file=%s,format=raw,if=mtd",
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

