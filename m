Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1693745wru;
        Thu, 27 Jun 2019 13:27:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWe9vgV34lM/dK8uiv6zhWBJjB9/00qDPzyDkduDQpIcGrGFLv/AdgVfvLhq8AecaaiDtl
X-Received: by 2002:ac8:2bf1:: with SMTP id n46mr4919857qtn.372.1561667272921;
        Thu, 27 Jun 2019 13:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667272; cv=none;
        d=google.com; s=arc-20160816;
        b=wbD+d64k76gdXb/Bj8sU02UIzvkggNyM+xrpSymsxe0mAvI9jEFDDGIDZvbSmj1NWl
         Vc84sBbnEM1sp+oPzmHTtQMrgSIq8krExV1qkT4WTH64qbIx1glyMtZ8WFds3kxl2FuQ
         M4n8sKSSxKtzEa5EZUFiq+RXL1aOelWOfELv34Xr5cQwozLi/6tBpSgiGFP66x819Sxv
         mp/T7jb/XxLhBn9y/qHHQLH062l6rV+LPjXtqbB6RLFbMC71FNw0qLCOoQmMZeGvooR8
         AvYNVbDdcvGYEpbZbSLT+aO/l261I74qEKe6DN4+DAstsFnA6Jce/9U5IwGxbUcYSqiq
         yMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=n25M6GrZUZP6e0nlrAzn75qLPKj3bsC2rAzyZ/uJIKc=;
        b=CbsizWrdhfYTXUoR4cf5HprxGWNKsvWCc3IvcOqmYJS2rVkhNZChyvO/fvqdzKYERc
         Hk5BQmsht3JEsf+YWqj/023RqmiAZcEOBpNEK4/6rct5uC3XFwyyx4LZdgwSBYOtLEuK
         DgYprBViHmeljKZzssXBrcCT4Nzb/Qw3ye//VhJLG/CYlv+b0tCHuex/cpuKN+HoogSU
         OIYolpDKv7O1vJ9vdUuMpRQuhp4SlEMf63WNlQfu/cQfRxtWTvPNzPX1tXg3mIUAP6J6
         PnCp9OnGG1ejKVJ9kC+x3gcjyijuVAjIPTVt/2ltpXaXlYPJLvr6yDJ4bCRXOkCYMURD
         3+uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d53si109195qtk.9.2019.06.27.13.27.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3007308FB9D;
	Thu, 27 Jun 2019 20:27:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8DF6012D;
	Thu, 27 Jun 2019 20:27:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 01/28] tests/pflash-cfi02: Add test for supported CFI commands
Date: Thu, 27 Jun 2019 22:26:52 +0200
Message-Id: <20190627202719.17739-2-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 20:27:46 +0000 (UTC)
X-TUID: 5e88jI3+dWDg

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

Test the AMD command set for parallel flash chips. This test uses an
ARM musicpal board with a pflash drive to test the following list of
currently-supported commands.
- Autoselect
- CFI
- Sector erase
- Chip erase
- Program
- Unlock bypass
- Reset

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-2-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: reworded the patch subject, g_assert_cmpint -> cmphex]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/Makefile.include    |   2 +
 tests/pflash-cfi02-test.c | 225 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 tests/pflash-cfi02-test.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index db750dd6d0..d02132fb94 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -260,6 +260,7 @@ check-qtest-arm-y += tests/m25p80-test$(EXESUF)
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y += tests/hexloader-test$(EXESUF)
+check-qtest-arm-$(CONFIG_PFLASH_CFI02) += tests/pflash-cfi02-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
@@ -767,6 +768,7 @@ tests/device-introspect-test$(EXESUF): tests/device-introspect-test.o
 tests/rtc-test$(EXESUF): tests/rtc-test.o
 tests/m48t59-test$(EXESUF): tests/m48t59-test.o
 tests/hexloader-test$(EXESUF): tests/hexloader-test.o
+tests/pflash-cfi02$(EXESUF): tests/pflash-cfi02-test.o
 tests/endianness-test$(EXESUF): tests/endianness-test.o
 tests/prom-env-test$(EXESUF): tests/prom-env-test.o $(libqos-obj-y)
 tests/rtas-test$(EXESUF): tests/rtas-test.o $(libqos-spapr-obj-y)
diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
new file mode 100644
index 0000000000..e7e16a8dd8
--- /dev/null
+++ b/tests/pflash-cfi02-test.c
@@ -0,0 +1,225 @@
+/*
+ * QTest testcase for parallel flash with AMD command set
+ *
+ * Copyright (c) 2019 Stephen Checkoway
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/*
+ * To test the pflash_cfi02 device, we run QEMU with the musicpal machine with
+ * a pflash drive. This enables us to test some flash configurations, but not
+ * all. In particular, we're limited to a 16-bit wide flash device.
+ */
+
+#define MP_FLASH_SIZE_MAX (32 * 1024 * 1024)
+#define BASE_ADDR (0x100000000ULL - MP_FLASH_SIZE_MAX)
+
+#define FLASH_WIDTH 2
+#define CFI_ADDR (FLASH_WIDTH * 0x55)
+#define UNLOCK0_ADDR (FLASH_WIDTH * 0x5555)
+#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AAA)
+
+#define CFI_CMD 0x98
+#define UNLOCK0_CMD 0xAA
+#define UNLOCK1_CMD 0x55
+#define AUTOSELECT_CMD 0x90
+#define RESET_CMD 0xF0
+#define PROGRAM_CMD 0xA0
+#define SECTOR_ERASE_CMD 0x30
+#define CHIP_ERASE_CMD 0x10
+#define UNLOCK_BYPASS_CMD 0x20
+#define UNLOCK_BYPASS_RESET_CMD 0x00
+
+static char image_path[] = "/tmp/qtest.XXXXXX";
+
+static inline void flash_write(uint64_t byte_addr, uint16_t data)
+{
+    qtest_writew(global_qtest, BASE_ADDR + byte_addr, data);
+}
+
+static inline uint16_t flash_read(uint64_t byte_addr)
+{
+    return qtest_readw(global_qtest, BASE_ADDR + byte_addr);
+}
+
+static void unlock(void)
+{
+    flash_write(UNLOCK0_ADDR, UNLOCK0_CMD);
+    flash_write(UNLOCK1_ADDR, UNLOCK1_CMD);
+}
+
+static void reset(void)
+{
+    flash_write(0, RESET_CMD);
+}
+
+static void sector_erase(uint64_t byte_addr)
+{
+    unlock();
+    flash_write(UNLOCK0_ADDR, 0x80);
+    unlock();
+    flash_write(byte_addr, SECTOR_ERASE_CMD);
+}
+
+static void wait_for_completion(uint64_t byte_addr)
+{
+    /* If DQ6 is toggling, step the clock and ensure the toggle stops. */
+    if ((flash_read(byte_addr) & 0x40) ^ (flash_read(byte_addr) & 0x40)) {
+        /* Wait for erase or program to finish. */
+        clock_step_next();
+        /* Ensure that DQ6 has stopped toggling. */
+        g_assert_cmphex(flash_read(byte_addr), ==, flash_read(byte_addr));
+    }
+}
+
+static void bypass_program(uint64_t byte_addr, uint16_t data)
+{
+    flash_write(UNLOCK0_ADDR, PROGRAM_CMD);
+    flash_write(byte_addr, data);
+    /*
+     * Data isn't valid until DQ6 stops toggling. We don't model this as
+     * writes are immediate, but if this changes in the future, we can wait
+     * until the program is complete.
+     */
+    wait_for_completion(byte_addr);
+}
+
+static void program(uint64_t byte_addr, uint16_t data)
+{
+    unlock();
+    bypass_program(byte_addr, data);
+}
+
+static void chip_erase(void)
+{
+    unlock();
+    flash_write(UNLOCK0_ADDR, 0x80);
+    unlock();
+    flash_write(UNLOCK0_ADDR, SECTOR_ERASE_CMD);
+}
+
+static void test_flash(void)
+{
+    global_qtest = qtest_initf("-M musicpal,accel=qtest "
+                               "-drive if=pflash,file=%s,format=raw,copy-on-read",
+                               image_path);
+    /* Check the IDs. */
+    unlock();
+    flash_write(UNLOCK0_ADDR, AUTOSELECT_CMD);
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0000), ==, 0x00BF);
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0001), ==, 0x236D);
+    reset();
+
+    /* Check the erase blocks. */
+    flash_write(CFI_ADDR, CFI_CMD);
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x10), ==, 'Q');
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x11), ==, 'R');
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x12), ==, 'Y');
+    /* Num erase regions. */
+    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x2C), >=, 1);
+    uint32_t nb_sectors = flash_read(FLASH_WIDTH * 0x2D) +
+                          (flash_read(FLASH_WIDTH * 0x2E) << 8) + 1;
+    uint32_t sector_len = (flash_read(FLASH_WIDTH * 0x2F) << 8) +
+                          (flash_read(FLASH_WIDTH * 0x30) << 16);
+    reset();
+
+    /* Erase and program sector. */
+    for (uint32_t i = 0; i < nb_sectors; ++i) {
+        uint64_t byte_addr = i * sector_len;
+        sector_erase(byte_addr);
+        /* Read toggle. */
+        uint16_t status0 = flash_read(byte_addr);
+        /* DQ7 is 0 during an erase. */
+        g_assert_cmphex(status0 & 0x80, ==, 0);
+        uint16_t status1 = flash_read(byte_addr);
+        /* DQ6 toggles during an erase. */
+        g_assert_cmphex(status0 & 0x40, !=, status1 & 0x40);
+        /* Wait for erase to complete. */
+        clock_step_next();
+        /* Ensure DQ6 has stopped toggling. */
+        g_assert_cmphex(flash_read(byte_addr), ==, flash_read(byte_addr));
+        /* Now the data should be valid. */
+        g_assert_cmphex(flash_read(byte_addr), ==, 0xFFFF);
+
+        /* Program a bit pattern. */
+        program(byte_addr, 0x5555);
+        g_assert_cmphex(flash_read(byte_addr), ==, 0x5555);
+        program(byte_addr, 0xAA55);
+        g_assert_cmphex(flash_read(byte_addr), ==, 0x0055);
+    }
+
+    /* Erase the chip. */
+    chip_erase();
+    /* Read toggle. */
+    uint16_t status0 = flash_read(0);
+    /* DQ7 is 0 during an erase. */
+    g_assert_cmphex(status0 & 0x80, ==, 0);
+    uint16_t status1 = flash_read(0);
+    /* DQ6 toggles during an erase. */
+    g_assert_cmphex(status0 & 0x40, !=, status1 & 0x40);
+    /* Wait for erase to complete. */
+    clock_step_next();
+    /* Ensure DQ6 has stopped toggling. */
+    g_assert_cmphex(flash_read(0), ==, flash_read(0));
+    /* Now the data should be valid. */
+    g_assert_cmphex(flash_read(0), ==, 0xFFFF);
+
+    /* Unlock bypass */
+    unlock();
+    flash_write(UNLOCK0_ADDR, UNLOCK_BYPASS_CMD);
+    bypass_program(0, 0x0123);
+    bypass_program(2, 0x4567);
+    bypass_program(4, 0x89AB);
+    /*
+     * Test that bypass programming, unlike normal programming can use any
+     * address for the PROGRAM_CMD.
+     */
+    flash_write(6, PROGRAM_CMD);
+    flash_write(6, 0xCDEF);
+    wait_for_completion(6);
+    flash_write(0, UNLOCK_BYPASS_RESET_CMD);
+    bypass_program(8, 0x55AA); /* Should fail. */
+    g_assert_cmphex(flash_read(0), ==, 0x0123);
+    g_assert_cmphex(flash_read(2), ==, 0x4567);
+    g_assert_cmphex(flash_read(4), ==, 0x89AB);
+    g_assert_cmphex(flash_read(6), ==, 0xCDEF);
+    g_assert_cmphex(flash_read(8), ==, 0xFFFF);
+
+    qtest_quit(global_qtest);
+}
+
+static void cleanup(void *opaque)
+{
+    unlink(image_path);
+}
+
+int main(int argc, char **argv)
+{
+    int fd = mkstemp(image_path);
+    if (fd == -1) {
+        g_printerr("Failed to create temporary file %s: %s\n", image_path,
+                   strerror(errno));
+        exit(EXIT_FAILURE);
+    }
+    if (ftruncate(fd, 8 * 1024 * 1024) < 0) {
+        int error_code = errno;
+        close(fd);
+        unlink(image_path);
+        g_printerr("Failed to truncate file %s to 8 MB: %s\n", image_path,
+                   strerror(error_code));
+        exit(EXIT_FAILURE);
+    }
+    close(fd);
+
+    qtest_add_abrt_handler(cleanup, NULL);
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("pflash-cfi02", test_flash);
+    int result = g_test_run();
+    cleanup(NULL);
+    return result;
+}
-- 
2.20.1
