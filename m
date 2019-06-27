Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694837wru;
        Thu, 27 Jun 2019 13:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAChj7Mct3W0CEgWIkYzVQDultaRRjZ0BIXMMp8sBj7ROwUL8NTkh8OsTYezN4WxSDzKMV
X-Received: by 2002:a0c:d947:: with SMTP id t7mr4789834qvj.127.1561667362961;
        Thu, 27 Jun 2019 13:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667362; cv=none;
        d=google.com; s=arc-20160816;
        b=NEcUn5MGy52SV3dc9dxbrv6suIaavfBxpr3SCEi6nDuiQOTHausuyTvSixO7X6695i
         Ft8DSfbPlBDOpDtmKd+U8t5tufYjfZ9qkwysfAjHdmCN1OiOA0NWFD2CuujIzOXuwCvn
         2QLKrw1nYO6Kcfgly5ST+Aw7A4iS4sJAq8s6qodJeDDTDfrSptvcSERMlFBV/vbaQuuT
         HepXWz13G8HeeHaIP3f/wpJbM3sTsOJBYpyTyqQ2W36JZNcty/6BG6lBfkagg8SZWcXk
         4wWGzLzoCmQfmSco41bEu2Yhxja34WVBWkE9zpU4jN4yaO24h0surjHK3aoyVdRwzba+
         hGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MIHAIY7WnPNRzsAYUVyDsUyC3Kh7cRUek04tMv7fjjw=;
        b=tY858PN7kjYmCuio0qRVa0wq4FFPzwc28WwRosjJx/hYlU2Q+N+kbb0D7iOwMIGqen
         QThZraGMTQo/LzLdzElOlOZOTWd9MlIXATKnvYGq+vvXKOcY0LWRBZ6LoOzm3qB+wlS5
         cu4Q6LGKTxLDwXLTyWHKd6agZWdZBEEZohbdgZ1GF/xy90fSWW7/WTC6pIxhoMNl0q4o
         PAWF3KZzh4vPDOyQmHA+N6Sg22hLwleSp8PaRbeXwKP2In/oaG/cPI7QkZWWSR6Bt3Ts
         99CYfA0kGKbq/1ooiY7bSMeNXRsPEpH8U5m9JJVi/sExX23XwM1LSylWebaG2jJnsDxp
         jUzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q36si113562qta.74.2019.06.27.13.29.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E208DC057E65;
	Thu, 27 Jun 2019 20:29:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ADFD600CC;
	Thu, 27 Jun 2019 20:29:11 +0000 (UTC)
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
Subject: [PATCH v5 13/28] tests/pflash-cfi02: Refactor to support testing multiple configurations
Date: Thu, 27 Jun 2019 22:27:04 +0200
Message-Id: <20190627202719.17739-14-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 27 Jun 2019 20:29:22 +0000 (UTC)
X-TUID: Q37apalEOzkK

Introduce the FlashConfig structure, to be able to run the same set
of tests on different flash models/configurations.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/pflash-cfi02-test.c | 386 +++++++++++++++++++++++++++-----------
 1 file changed, 277 insertions(+), 109 deletions(-)

diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
index e090b2e3a0..b00f5ca2e7 100644
--- a/tests/pflash-cfi02-test.c
+++ b/tests/pflash-cfi02-test.c
@@ -17,12 +17,18 @@
  */
 
 #define MP_FLASH_SIZE_MAX (32 * 1024 * 1024)
+#define FLASH_SIZE (8 * 1024 * 1024)
 #define BASE_ADDR (0x100000000ULL - MP_FLASH_SIZE_MAX)
 
-#define FLASH_WIDTH 2
-#define CFI_ADDR (FLASH_WIDTH * 0x55)
-#define UNLOCK0_ADDR (FLASH_WIDTH * 0x555)
-#define UNLOCK1_ADDR (FLASH_WIDTH * 0x2AA)
+/* Use a newtype to keep flash addresses separate from byte addresses. */
+typedef struct {
+    uint64_t addr;
+} faddr;
+#define FLASH_ADDR(x) ((faddr) { .addr = (x) })
+
+#define CFI_ADDR FLASH_ADDR(0x55)
+#define UNLOCK0_ADDR FLASH_ADDR(0x555)
+#define UNLOCK1_ADDR FLASH_ADDR(0x2AA)
 
 #define CFI_CMD 0x98
 #define UNLOCK0_CMD 0xAA
@@ -35,170 +41,313 @@
 #define UNLOCK_BYPASS_CMD 0x20
 #define UNLOCK_BYPASS_RESET_CMD 0x00
 
+typedef struct {
+    int bank_width;
+
+    QTestState *qtest;
+} FlashConfig;
+
 static char image_path[] = "/tmp/qtest.XXXXXX";
 
-static inline void flash_write(uint64_t byte_addr, uint16_t data)
+/*
+ * The pflash implementation allows some parameters to be unspecified. We want
+ * to test those configurations but we also need to know the real values in
+ * our testing code. So after we launch qemu, we'll need a new FlashConfig
+ * with the correct values filled in.
+ */
+static FlashConfig expand_config_defaults(const FlashConfig *c)
 {
-    qtest_writew(global_qtest, BASE_ADDR + byte_addr, data);
+    FlashConfig ret = *c;
+
+    if (ret.bank_width == 0) {
+        ret.bank_width = 2;
+    }
+
+    /* XXX: Limitations of test harness. */
+    assert(ret.bank_width == 2);
+    return ret;
 }
 
-static inline uint16_t flash_read(uint64_t byte_addr)
+/*
+ * Return a bit mask suitable for extracting the least significant
+ * status/query response from an interleaved response.
+ */
+static inline uint64_t device_mask(const FlashConfig *c)
 {
-    return qtest_readw(global_qtest, BASE_ADDR + byte_addr);
+    return (uint64_t)-1;
 }
 
-static void unlock(void)
+/*
+ * Return a bit mask exactly as long as the bank_width.
+ */
+static inline uint64_t bank_mask(const FlashConfig *c)
 {
-    flash_write(UNLOCK0_ADDR, UNLOCK0_CMD);
-    flash_write(UNLOCK1_ADDR, UNLOCK1_CMD);
+    if (c->bank_width == 8) {
+        return (uint64_t)-1;
+    }
+    return (1ULL << (c->bank_width * 8)) - 1ULL;
 }
 
-static void reset(void)
+static inline void flash_write(const FlashConfig *c, uint64_t byte_addr,
+                               uint64_t data)
 {
-    flash_write(0, RESET_CMD);
-}
-
-static void sector_erase(uint64_t byte_addr)
-{
-    unlock();
-    flash_write(UNLOCK0_ADDR, 0x80);
-    unlock();
-    flash_write(byte_addr, SECTOR_ERASE_CMD);
-}
-
-static void wait_for_completion(uint64_t byte_addr)
-{
-    /* If DQ6 is toggling, step the clock and ensure the toggle stops. */
-    if ((flash_read(byte_addr) & 0x40) ^ (flash_read(byte_addr) & 0x40)) {
-        /* Wait for erase or program to finish. */
-        clock_step_next();
-        /* Ensure that DQ6 has stopped toggling. */
-        g_assert_cmphex(flash_read(byte_addr), ==, flash_read(byte_addr));
+    /* Sanity check our tests. */
+    assert((data & ~bank_mask(c)) == 0);
+    uint64_t addr = BASE_ADDR + byte_addr;
+    switch (c->bank_width) {
+    case 1:
+        qtest_writeb(c->qtest, addr, data);
+        break;
+    case 2:
+        qtest_writew(c->qtest, addr, data);
+        break;
+    case 4:
+        qtest_writel(c->qtest, addr, data);
+        break;
+    case 8:
+        qtest_writeq(c->qtest, addr, data);
+        break;
+    default:
+        abort();
     }
 }
 
-static void bypass_program(uint64_t byte_addr, uint16_t data)
+static inline uint64_t flash_read(const FlashConfig *c, uint64_t byte_addr)
 {
-    flash_write(UNLOCK0_ADDR, PROGRAM_CMD);
-    flash_write(byte_addr, data);
+    uint64_t addr = BASE_ADDR + byte_addr;
+    switch (c->bank_width) {
+    case 1:
+        return qtest_readb(c->qtest, addr);
+    case 2:
+        return qtest_readw(c->qtest, addr);
+    case 4:
+        return qtest_readl(c->qtest, addr);
+    case 8:
+        return qtest_readq(c->qtest, addr);
+    default:
+        abort();
+    }
+}
+
+/*
+ * Convert a flash address expressed in the maximum width of the device as a
+ * byte address.
+ */
+static inline uint64_t as_byte_addr(const FlashConfig *c, faddr flash_addr)
+{
+    /*
+     * Command addresses are always given as addresses in the maximum
+     * supported bus size for the flash chip. So an x8/x16 chip in x8 mode
+     * uses addresses 0xAAA and 0x555 to unlock because the least significant
+     * bit is ignored. (0x555 rather than 0x554 is traditional.)
+     *
+     * In general we need to multiply by the maximum device width.
+     */
+    return flash_addr.addr * c->bank_width;
+}
+
+/*
+ * Return the command value or expected status replicated across all devices.
+ */
+static inline uint64_t replicate(const FlashConfig *c, uint64_t data)
+{
+    /* Sanity check our tests. */
+    assert((data & ~device_mask(c)) == 0);
+    return data;
+}
+
+static inline void flash_cmd(const FlashConfig *c, faddr cmd_addr,
+                             uint8_t cmd)
+{
+    flash_write(c, as_byte_addr(c, cmd_addr), replicate(c, cmd));
+}
+
+static inline uint64_t flash_query(const FlashConfig *c, faddr query_addr)
+{
+    return flash_read(c, as_byte_addr(c, query_addr));
+}
+
+static inline uint64_t flash_query_1(const FlashConfig *c, faddr query_addr)
+{
+    return flash_query(c, query_addr) & device_mask(c);
+}
+
+static void unlock(const FlashConfig *c)
+{
+    flash_cmd(c, UNLOCK0_ADDR, UNLOCK0_CMD);
+    flash_cmd(c, UNLOCK1_ADDR, UNLOCK1_CMD);
+}
+
+static void reset(const FlashConfig *c)
+{
+    flash_cmd(c, FLASH_ADDR(0), RESET_CMD);
+}
+
+static void sector_erase(const FlashConfig *c, uint64_t byte_addr)
+{
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, 0x80);
+    unlock(c);
+    flash_write(c, byte_addr, replicate(c, SECTOR_ERASE_CMD));
+}
+
+static void wait_for_completion(const FlashConfig *c, uint64_t byte_addr)
+{
+    /* If DQ6 is toggling, step the clock and ensure the toggle stops. */
+    const uint64_t dq6 = replicate(c, 0x40);
+    if ((flash_read(c, byte_addr) & dq6) ^ (flash_read(c, byte_addr) & dq6)) {
+        /* Wait for erase or program to finish. */
+        qtest_clock_step_next(c->qtest);
+        /* Ensure that DQ6 has stopped toggling. */
+        g_assert_cmphex(flash_read(c, byte_addr), ==, flash_read(c, byte_addr));
+    }
+}
+
+static void bypass_program(const FlashConfig *c, uint64_t byte_addr,
+                           uint16_t data)
+{
+    flash_cmd(c, UNLOCK0_ADDR, PROGRAM_CMD);
+    flash_write(c, byte_addr, data);
     /*
      * Data isn't valid until DQ6 stops toggling. We don't model this as
      * writes are immediate, but if this changes in the future, we can wait
      * until the program is complete.
      */
-    wait_for_completion(byte_addr);
+    wait_for_completion(c, byte_addr);
 }
 
-static void program(uint64_t byte_addr, uint16_t data)
+static void program(const FlashConfig *c, uint64_t byte_addr, uint16_t data)
 {
-    unlock();
-    bypass_program(byte_addr, data);
+    unlock(c);
+    bypass_program(c, byte_addr, data);
 }
 
-static void chip_erase(void)
+static void chip_erase(const FlashConfig *c)
 {
-    unlock();
-    flash_write(UNLOCK0_ADDR, 0x80);
-    unlock();
-    flash_write(UNLOCK0_ADDR, SECTOR_ERASE_CMD);
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, 0x80);
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, CHIP_ERASE_CMD);
 }
 
-static void test_flash(void)
+static void test_flash(const void *opaque)
 {
-    global_qtest = qtest_initf("-M musicpal,accel=qtest "
-                               "-drive if=pflash,file=%s,format=raw,copy-on-read",
-                               image_path);
+    const FlashConfig *config = opaque;
+    QTestState *qtest;
+    qtest = qtest_initf("-M musicpal,accel=qtest"
+                        " -drive if=pflash,file=%s,format=raw,copy-on-read",
+                        image_path);
+    FlashConfig explicit_config = expand_config_defaults(config);
+    explicit_config.qtest = qtest;
+    const FlashConfig *c = &explicit_config;
+
     /* Check the IDs. */
-    unlock();
-    flash_write(UNLOCK0_ADDR, AUTOSELECT_CMD);
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0000), ==, 0x00BF);
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x0001), ==, 0x236D);
-    reset();
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, AUTOSELECT_CMD);
+    g_assert_cmphex(flash_query(c, FLASH_ADDR(0)), ==, replicate(c, 0xBF));
+    if (c->bank_width >= 2) {
+        /*
+         * XXX: The ID returned by the musicpal flash chip is 16 bits which
+         * wouldn't happen with an 8-bit device. It would probably be best to
+         * prohibit addresses larger than the device width in pflash_cfi02.c,
+         * but then we couldn't test smaller device widths at all.
+         */
+        g_assert_cmphex(flash_query(c, FLASH_ADDR(1)), ==,
+                        replicate(c, 0x236D));
+    }
+    reset(c);
 
     /* Check the erase blocks. */
-    flash_write(CFI_ADDR, CFI_CMD);
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x10), ==, 'Q');
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x11), ==, 'R');
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x12), ==, 'Y');
-    /* Num erase regions. */
-    g_assert_cmphex(flash_read(FLASH_WIDTH * 0x2C), >=, 1);
-    uint32_t nb_sectors = flash_read(FLASH_WIDTH * 0x2D) +
-                          (flash_read(FLASH_WIDTH * 0x2E) << 8) + 1;
-    uint32_t sector_len = (flash_read(FLASH_WIDTH * 0x2F) << 8) +
-                          (flash_read(FLASH_WIDTH * 0x30) << 16);
-    reset();
+    flash_cmd(c, CFI_ADDR, CFI_CMD);
+    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x10)), ==, replicate(c, 'Q'));
+    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x11)), ==, replicate(c, 'R'));
+    g_assert_cmphex(flash_query(c, FLASH_ADDR(0x12)), ==, replicate(c, 'Y'));
 
+    /* Num erase regions. */
+    g_assert_cmphex(flash_query_1(c, FLASH_ADDR(0x2C)), >=, 1);
+
+    uint32_t nb_sectors = flash_query_1(c, FLASH_ADDR(0x2D)) +
+                          (flash_query_1(c, FLASH_ADDR(0x2E)) << 8) + 1;
+    uint32_t sector_len = (flash_query_1(c, FLASH_ADDR(0x2F)) << 8) +
+                          (flash_query_1(c, FLASH_ADDR(0x30)) << 16);
+    reset(c);
+
+    const uint64_t dq7 = replicate(c, 0x80);
+    const uint64_t dq6 = replicate(c, 0x40);
     /* Erase and program sector. */
     for (uint32_t i = 0; i < nb_sectors; ++i) {
         uint64_t byte_addr = i * sector_len;
-        sector_erase(byte_addr);
+        sector_erase(c, byte_addr);
         /* Read toggle. */
-        uint16_t status0 = flash_read(byte_addr);
+        uint64_t status0 = flash_read(c, byte_addr);
         /* DQ7 is 0 during an erase. */
-        g_assert_cmphex(status0 & 0x80, ==, 0);
-        uint16_t status1 = flash_read(byte_addr);
+        g_assert_cmphex(status0 & dq7, ==, 0);
+        uint64_t status1 = flash_read(c, byte_addr);
         /* DQ6 toggles during an erase. */
-        g_assert_cmphex(status0 & 0x40, !=, status1 & 0x40);
+        g_assert_cmphex(status0 & dq6, ==, ~status1 & dq6);
         /* Wait for erase to complete. */
-        clock_step_next();
+        qtest_clock_step_next(c->qtest);
         /* Ensure DQ6 has stopped toggling. */
-        g_assert_cmphex(flash_read(byte_addr), ==, flash_read(byte_addr));
+        g_assert_cmphex(flash_read(c, byte_addr), ==, flash_read(c, byte_addr));
         /* Now the data should be valid. */
-        g_assert_cmphex(flash_read(byte_addr), ==, 0xFFFF);
+        g_assert_cmphex(flash_read(c, byte_addr), ==, bank_mask(c));
 
         /* Program a bit pattern. */
-        program(byte_addr, 0x5555);
-        g_assert_cmphex(flash_read(byte_addr), ==, 0x5555);
-        program(byte_addr, 0xAA55);
-        g_assert_cmphex(flash_read(byte_addr), ==, 0x0055);
+        program(c, byte_addr, 0x55);
+        g_assert_cmphex(flash_read(c, byte_addr) & 0xFF, ==, 0x55);
+        program(c, byte_addr, 0xA5);
+        g_assert_cmphex(flash_read(c, byte_addr) & 0xFF, ==, 0x05);
     }
 
     /* Erase the chip. */
-    chip_erase();
+    chip_erase(c);
     /* Read toggle. */
-    uint16_t status0 = flash_read(0);
+    uint64_t status0 = flash_read(c, 0);
     /* DQ7 is 0 during an erase. */
-    g_assert_cmphex(status0 & 0x80, ==, 0);
-    uint16_t status1 = flash_read(0);
+    g_assert_cmphex(status0 & dq7, ==, 0);
+    uint64_t status1 = flash_read(c, 0);
     /* DQ6 toggles during an erase. */
-    g_assert_cmphex(status0 & 0x40, !=, status1 & 0x40);
+    g_assert_cmphex(status0 & dq6, ==, ~status1 & dq6);
     /* Wait for erase to complete. */
-    clock_step_next();
+    qtest_clock_step_next(c->qtest);
     /* Ensure DQ6 has stopped toggling. */
-    g_assert_cmphex(flash_read(0), ==, flash_read(0));
+    g_assert_cmphex(flash_read(c, 0), ==, flash_read(c, 0));
     /* Now the data should be valid. */
-    g_assert_cmphex(flash_read(0), ==, 0xFFFF);
+
+    for (uint32_t i = 0; i < nb_sectors; ++i) {
+        uint64_t byte_addr = i * sector_len;
+        g_assert_cmphex(flash_read(c, byte_addr), ==, bank_mask(c));
+    }
 
     /* Unlock bypass */
-    unlock();
-    flash_write(UNLOCK0_ADDR, UNLOCK_BYPASS_CMD);
-    bypass_program(0, 0x0123);
-    bypass_program(2, 0x4567);
-    bypass_program(4, 0x89AB);
+    unlock(c);
+    flash_cmd(c, UNLOCK0_ADDR, UNLOCK_BYPASS_CMD);
+    bypass_program(c, 0 * c->bank_width, 0x01);
+    bypass_program(c, 1 * c->bank_width, 0x23);
+    bypass_program(c, 2 * c->bank_width, 0x45);
     /*
      * Test that bypass programming, unlike normal programming can use any
      * address for the PROGRAM_CMD.
      */
-    flash_write(6, PROGRAM_CMD);
-    flash_write(6, 0xCDEF);
-    wait_for_completion(6);
-    flash_write(0, UNLOCK_BYPASS_RESET_CMD);
-    bypass_program(8, 0x55AA); /* Should fail. */
-    g_assert_cmphex(flash_read(0), ==, 0x0123);
-    g_assert_cmphex(flash_read(2), ==, 0x4567);
-    g_assert_cmphex(flash_read(4), ==, 0x89AB);
-    g_assert_cmphex(flash_read(6), ==, 0xCDEF);
-    g_assert_cmphex(flash_read(8), ==, 0xFFFF);
+    flash_cmd(c, FLASH_ADDR(3 * c->bank_width), PROGRAM_CMD);
+    flash_write(c, 3 * c->bank_width, 0x67);
+    wait_for_completion(c, 3 * c->bank_width);
+    flash_cmd(c, FLASH_ADDR(0), UNLOCK_BYPASS_RESET_CMD);
+    bypass_program(c, 4 * c->bank_width, 0x89); /* Should fail. */
+    g_assert_cmphex(flash_read(c, 0 * c->bank_width), ==, 0x01);
+    g_assert_cmphex(flash_read(c, 1 * c->bank_width), ==, 0x23);
+    g_assert_cmphex(flash_read(c, 2 * c->bank_width), ==, 0x45);
+    g_assert_cmphex(flash_read(c, 3 * c->bank_width), ==, 0x67);
+    g_assert_cmphex(flash_read(c, 4 * c->bank_width), ==, bank_mask(c));
 
     /* Test ignored high order bits of address. */
-    flash_write(FLASH_WIDTH * 0x5555, UNLOCK0_CMD);
-    flash_write(FLASH_WIDTH * 0x2AAA, UNLOCK1_CMD);
-    flash_write(FLASH_WIDTH * 0x5555, AUTOSELECT_CMD);
-    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0000), ==, 0x00BF);
-    g_assert_cmpint(flash_read(FLASH_WIDTH * 0x0001), ==, 0x236D);
-    reset();
+    flash_cmd(c, FLASH_ADDR(0x5555), UNLOCK0_CMD);
+    flash_cmd(c, FLASH_ADDR(0x2AAA), UNLOCK1_CMD);
+    flash_cmd(c, FLASH_ADDR(0x5555), AUTOSELECT_CMD);
+    g_assert_cmphex(flash_query(c, FLASH_ADDR(0)), ==, replicate(c, 0xBF));
+    reset(c);
 
-    qtest_quit(global_qtest);
+    qtest_quit(qtest);
 }
 
 static void cleanup(void *opaque)
@@ -206,6 +355,17 @@ static void cleanup(void *opaque)
     unlink(image_path);
 }
 
+/*
+ * XXX: Tests are limited to bank_width = 2 for now because that's what
+ * hw/arm/musicpal.c has.
+ */
+static const FlashConfig configuration[] = {
+    /* One x16 device. */
+    {
+        .bank_width = 2,
+    },
+};
+
 int main(int argc, char **argv)
 {
     int fd = mkstemp(image_path);
@@ -214,19 +374,27 @@ int main(int argc, char **argv)
                    strerror(errno));
         exit(EXIT_FAILURE);
     }
-    if (ftruncate(fd, 8 * 1024 * 1024) < 0) {
+    if (ftruncate(fd, FLASH_SIZE) < 0) {
         int error_code = errno;
         close(fd);
         unlink(image_path);
-        g_printerr("Failed to truncate file %s to 8 MB: %s\n", image_path,
-                   strerror(error_code));
+        g_printerr("Failed to truncate file %s to %u MB: %s\n", image_path,
+                   FLASH_SIZE, strerror(error_code));
         exit(EXIT_FAILURE);
     }
     close(fd);
 
     qtest_add_abrt_handler(cleanup, NULL);
     g_test_init(&argc, &argv, NULL);
-    qtest_add_func("pflash-cfi02", test_flash);
+
+    size_t nb_configurations = sizeof configuration / sizeof configuration[0];
+    for (size_t i = 0; i < nb_configurations; ++i) {
+        const FlashConfig *config = &configuration[i];
+        char *path = g_strdup_printf("pflash-cfi02/%d",
+                                     config->bank_width);
+        qtest_add_data_func(path, config, test_flash);
+        g_free(path);
+    }
     int result = g_test_run();
     cleanup(NULL);
     return result;
-- 
2.20.1
