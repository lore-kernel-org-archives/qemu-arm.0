Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695940wru;
        Thu, 27 Jun 2019 13:30:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAAeN1gwSkcR+3AfVX/G5i/xKXCl4bSYfUpjWhuhENFubqLk1hagWTY15oOCHhFOU0PHep
X-Received: by 2002:ac8:2f66:: with SMTP id k35mr4969961qta.174.1561667447218;
        Thu, 27 Jun 2019 13:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667447; cv=none;
        d=google.com; s=arc-20160816;
        b=RcQ4R15JR31bSaTe8oonTxoLboxtbhkv/4lRpHQgvzQVjdRUzeLtK3/+skMs4bwtUW
         xxehtEyxKe2ZTBXUXY4iHRZP4ZHpzvJzXG6eqQx+qVMiBFtZIPy6lSZU4TQtjw9F5SVa
         Tme/PlgZRLf1xDjUwijPA+PYtnhVO7jPJOeajnER6t57yhFEXtEDWuSXwqd/NGAsx59x
         A1PX6EyIabiXI1lYR/y+RkytRn8v5TVVV1NqrdB3Qqb/hnIPNd8eRd8xBAB4oxY/+ILD
         CgJOcMe/CCEfJhgYWRzXZHPO4xHrsX0WyK0OuXtP0ruv39jXIxEytuuk33ST9Xucm+mH
         gVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=eIx09FN23Zn00xHzw+MrFQy3WnTdF2V9wHQPXBouZiM=;
        b=R3jFT5x96+rIFk5W1CFc0TNtHbo6qUmB01ciFT/7SzTBSpyclat85bgpXMj2WI4K+j
         GdHVQMyjogsiMYN3wy1szCkE0XF5cgWdgeEuB6DgePdoRZs1ICB1Tl+VNLI6XLsCkK/m
         be9ZXagItqQ/q6Ub5PP1x4tK0A989jNoEUvUn03PJlQCGO3x+h58dw2F0oizfxHM/he/
         x8053K64vAZAuIviuuoBw/fZT3EHuaxIJK8YjgBUDkhFAgOxV400z+VPgt7zZPGbhxkP
         p5TSeqtBubEHoataP6nmWgLXrwcg0liYCONW7IAm9VtkaWArvJ5qsNbJbB2Ub5JCa00C
         5ZOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h14si101884qtc.229.2019.06.27.13.30.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 411DD30054AB;
	Thu, 27 Jun 2019 20:30:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4F86012D;
	Thu, 27 Jun 2019 20:30:36 +0000 (UTC)
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
Subject: [PATCH v5 24/28] hw/block/pflash_cfi02: Implement erase suspend/resume
Date: Thu, 27 Jun 2019 22:27:15 +0200
Message-Id: <20190627202719.17739-25-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 27 Jun 2019 20:30:46 +0000 (UTC)
X-TUID: 5wev6zAXxRQC

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

During a sector erase (but not a chip erase), the embeded erase program
can be suspended. Once suspended, the sectors not selected for erasure
may be read and programmed. Autoselect mode is allowed during erase
suspend mode. Presumably, CFI queries are similarly allowed so this
commit allows them as well.

Since guest firmware can use status bits DQ7, DQ6, DQ3, and DQ2 to
determine the current state of sector erasure, these bits are properly
implemented.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190426162624.55977-10-stephen.checkoway@oberlin.edu>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c   | 154 ++++++++++++++++++++++++++++++++++----
 tests/pflash-cfi02-test.c | 110 +++++++++++++++++++++++++++
 2 files changed, 250 insertions(+), 14 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 5874bd55ad..a3665da3b8 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -30,7 +30,6 @@
  *
  * It does not support flash interleaving.
  * It does not implement software data protection as found in many real chips
- * It does not implement erase suspend/resume commands
  */
 
 #include "qemu/osdep.h"
@@ -38,6 +37,7 @@
 #include "hw/block/block.h"
 #include "hw/block/flash.h"
 #include "qapi/error.h"
+#include "qemu/bitmap.h"
 #include "qemu/timer.h"
 #include "sysemu/block-backend.h"
 #include "qemu/host-utils.h"
@@ -76,6 +76,7 @@ struct PFlashCFI02 {
     BlockBackend *blk;
     uint32_t uniform_nb_blocs;
     uint32_t uniform_sector_len;
+    uint32_t total_sectors;
     uint32_t nb_blocs[PFLASH_MAX_ERASE_REGIONS];
     uint32_t sector_len[PFLASH_MAX_ERASE_REGIONS];
     uint32_t chip_len;
@@ -106,6 +107,8 @@ struct PFlashCFI02 {
     int rom_mode;
     int read_counter; /* used for lazy switch-back to rom mode */
     int sectors_to_erase;
+    uint64_t erase_time_remaining;
+    unsigned long *sector_erase_map;
     char *name;
     void *storage;
 };
@@ -151,6 +154,14 @@ static inline void reset_dq3(PFlashCFI02 *pfl)
     pfl->status &= ~0x08;
 }
 
+/*
+ * Toggle status bit DQ2.
+ */
+static inline void toggle_dq2(PFlashCFI02 *pfl)
+{
+    pfl->status ^= 0x04;
+}
+
 /*
  * Set up replicated mappings of the same region.
  */
@@ -179,6 +190,29 @@ static size_t pflash_regions_count(PFlashCFI02 *pfl)
     return pfl->cfi_table[0x2c];
 }
 
+/*
+ * Returns the time it takes to erase the number of sectors scheduled for
+ * erasure based on CFI address 0x21 which is "Typical timeout per individual
+ * block erase 2^N ms."
+ */
+static uint64_t pflash_erase_time(PFlashCFI02 *pfl)
+{
+    /*
+     * If there are no sectors to erase (which can happen if all of the sectors
+     * to be erased are protected), then erase takes 100 us. Protected sectors
+     * aren't supported so this should never happen.
+     */
+    return ((1ULL << pfl->cfi_table[0x21]) * pfl->sectors_to_erase) * SCALE_US;
+}
+
+/*
+ * Returns true if the device is currently in erase suspend mode.
+ */
+static inline bool pflash_erase_suspend_mode(PFlashCFI02 *pfl)
+{
+    return pfl->erase_time_remaining > 0;
+}
+
 static void pflash_timer(void *opaque)
 {
     PFlashCFI02 *pfl = opaque;
@@ -193,12 +227,7 @@ static void pflash_timer(void *opaque)
          */
         if ((pfl->status & 0x08) == 0) {
             assert_dq3(pfl);
-            /*
-             * CFI address 0x21 is "Typical timeout per individual block erase
-             * 2^N ms"
-             */
-            uint64_t timeout = ((1ULL << pfl->cfi_table[0x21]) *
-                                pfl->sectors_to_erase) * 1000000;
+            uint64_t timeout = pflash_erase_time(pfl);
             timer_mod(&pfl->timer,
                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
             DPRINTF("%s: erase timeout fired; erasing %d sectors\n",
@@ -206,6 +235,7 @@ static void pflash_timer(void *opaque)
             return;
         }
         DPRINTF("%s: sector erase complete\n", __func__);
+        bitmap_zero(pfl->sector_erase_map, pfl->total_sectors);
         pfl->sectors_to_erase = 0;
         reset_dq3(pfl);
     }
@@ -233,24 +263,44 @@ static uint64_t pflash_data_read(PFlashCFI02 *pfl, hwaddr offset,
     return ret;
 }
 
+typedef struct {
+    uint32_t len;
+    uint32_t num;
+} SectorInfo;
+
 /*
  * offset should be a byte offset of the QEMU device and _not_ a device
  * offset.
  */
-static uint32_t pflash_sector_len(PFlashCFI02 *pfl, hwaddr offset)
+static SectorInfo pflash_sector_info(PFlashCFI02 *pfl, hwaddr offset)
 {
     assert(offset < pfl->chip_len);
     hwaddr addr = 0;
+    uint32_t sector_num = 0;
     for (int i = 0; i < pflash_regions_count(pfl); ++i) {
         uint64_t region_size = (uint64_t)pfl->nb_blocs[i] * pfl->sector_len[i];
         if (addr <= offset && offset < addr + region_size) {
-            return pfl->sector_len[i];
+            return (SectorInfo) {
+                .len = pfl->sector_len[i],
+                .num = sector_num + (offset - addr) / pfl->sector_len[i],
+            };
         }
+        sector_num += pfl->nb_blocs[i];
         addr += region_size;
     }
     abort();
 }
 
+/*
+ * Returns true if the offset refers to a flash sector that is currently being
+ * erased.
+ */
+static bool pflash_sector_is_erasing(PFlashCFI02 *pfl, hwaddr offset)
+{
+    long sector_num = pflash_sector_info(pfl, offset).num;
+    return test_bit(sector_num, pfl->sector_erase_map);
+}
+
 static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
 {
     PFlashCFI02 *pfl = opaque;
@@ -280,6 +330,15 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     case 0x80:
         /* We accept reads during second unlock sequence... */
     case 0x00:
+        if (pflash_erase_suspend_mode(pfl) &&
+            pflash_sector_is_erasing(pfl, offset)) {
+            /* Toggle bit 2, but not 6. */
+            toggle_dq2(pfl);
+            /* Status register read */
+            ret = pfl->status;
+            DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
+            break;
+        }
         /* Flash area read */
         ret = pflash_data_read(pfl, offset, width);
         break;
@@ -305,13 +364,16 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         }
         DPRINTF("%s: ID " TARGET_FMT_plx " %" PRIx64 "\n", __func__, boff, ret);
         break;
-    case 0xA0:
     case 0x10:
     case 0x30:
+        /* Toggle bit 2 during erase, but not program. */
+        toggle_dq2(pfl);
+    case 0xA0:
+        /* Toggle bit 6 */
+        toggle_dq6(pfl);
         /* Status register read */
         ret = pfl->status;
         DPRINTF("%s: status %" PRIx64 "\n", __func__, ret);
-        toggle_dq6(pfl);
         break;
     case 0x98:
         /* CFI query mode */
@@ -343,7 +405,8 @@ static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
 
 static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
 {
-    uint64_t sector_len = pflash_sector_len(pfl, offset);
+    SectorInfo sector_info = pflash_sector_info(pfl, offset);
+    uint64_t sector_len = sector_info.len;
     offset &= ~(sector_len - 1);
     DPRINTF("%s: start sector erase at %0*" PRIx64 "-%0*" PRIx64 "\n",
             __func__, pfl->width * 2, offset,
@@ -355,6 +418,7 @@ static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
     }
     set_dq7(pfl, 0x00);
     ++pfl->sectors_to_erase;
+    set_bit(sector_info.num, pfl->sector_erase_map);
     /* Set (or reset) the 50 us timer for additional erase commands.  */
     timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 50000);
 }
@@ -405,6 +469,25 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             pfl->cmd = 0x98;
             return;
         }
+        /* Handle erase resume in erase suspend mode, otherwise reset. */
+        if (cmd == 0x30) {
+            if (pflash_erase_suspend_mode(pfl)) {
+                /* Resume the erase. */
+                timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                          pfl->erase_time_remaining);
+                pfl->erase_time_remaining = 0;
+                pfl->wcycle = 6;
+                pfl->cmd = 0x30;
+                set_dq7(pfl, 0x00);
+                assert_dq3(pfl);
+                return;
+            }
+            goto reset_flash;
+        }
+        /* Ignore erase suspend. */
+        if (cmd == 0xB0) {
+            return;
+        }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
             DPRINTF("%s: unlock0 failed " TARGET_FMT_plx " %02x %04x\n",
                     __func__, boff, cmd, pfl->unlock_addr0);
@@ -450,6 +533,14 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0:
+            if (pflash_erase_suspend_mode(pfl) &&
+                pflash_sector_is_erasing(pfl, offset)) {
+                /* Ignore writes to erasing sectors. */
+                if (pfl->bypass) {
+                    goto do_bypass;
+                }
+                goto reset_flash;
+            }
             trace_pflash_data_write(offset, width << 1, value, 0);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
@@ -508,6 +599,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
         }
         break;
     case 5:
+        if (pflash_erase_suspend_mode(pfl)) {
+            /* Erasing is not supported in erase suspend mode. */
+            goto reset_flash;
+        }
         switch (cmd) {
         case 0x10:
             if (boff != pfl->unlock_addr0) {
@@ -542,6 +637,30 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             /* Ignore writes during chip erase */
             return;
         case 0x30:
+            if (cmd == 0xB0) {
+                /*
+                 * If erase suspend happens during the erase timeout (so DQ3 is
+                 * 0), then the device suspends erasing immediately. Set the
+                 * remaining time to be the total time to erase. Otherwise,
+                 * there is a maximum amount of time it can take to enter
+                 * suspend mode. Let's ignore that and suspend immediately and
+                 * set the remaining time to the actual time remaining on the
+                 * timer.
+                 */
+                if ((pfl->status & 0x08) == 0) {
+                    pfl->erase_time_remaining = pflash_erase_time(pfl);
+                } else {
+                    int64_t delta = timer_expire_time_ns(&pfl->timer) -
+                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+                    /* Make sure we have a positive time remaining. */
+                    pfl->erase_time_remaining = delta <= 0 ? 1 : delta;
+                }
+                reset_dq3(pfl);
+                timer_del(&pfl->timer);
+                pfl->wcycle = 0;
+                pfl->cmd = 0;
+                return;
+            }
             /*
              * If DQ3 is 0, additional sector erase commands can be
              * written and anything else (other than an erase suspend) resets
@@ -619,10 +738,12 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     int nb_regions;
     pfl->chip_len = 0;
+    pfl->total_sectors = 0;
     for (nb_regions = 0; nb_regions < PFLASH_MAX_ERASE_REGIONS; ++nb_regions) {
         if (pfl->nb_blocs[nb_regions] == 0) {
             break;
         }
+        pfl->total_sectors += pfl->nb_blocs[nb_regions];
         uint64_t sector_len_per_device = pfl->sector_len[nb_regions];
 
         /*
@@ -656,6 +777,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         pfl->nb_blocs[0] = pfl->uniform_nb_blocs;
         pfl->sector_len[0] = pfl->uniform_sector_len;
         pfl->chip_len = uniform_len;
+        pfl->total_sectors = pfl->uniform_nb_blocs;
     } else if (uniform_len != 0 && uniform_len != pfl->chip_len) {
         error_setg(errp, "\"num-blocks\"*\"sector-length\" "
                    "different from \"num-blocks0\"*\'sector-length0\" + ... + "
@@ -697,6 +819,9 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->unlock_addr0 &= 0x7FF;
     pfl->unlock_addr1 &= 0x7FF;
 
+    /* Allocate memory for a bitmap for sectors being erased. */
+    pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
+
     pflash_setup_mappings(pfl);
     pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
@@ -781,8 +906,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     /* Address sensitive unlock required. */
     pfl->cfi_table[0x05 + pri_ofs] = 0x00;
-    /* Erase suspend not supported. */
-    pfl->cfi_table[0x06 + pri_ofs] = 0x00;
+    /* Erase suspend to read/write. */
+    pfl->cfi_table[0x06 + pri_ofs] = 0x02;
     /* Sector protect not supported. */
     pfl->cfi_table[0x07 + pri_ofs] = 0x00;
     /* Temporary sector unprotect not supported. */
@@ -829,6 +954,7 @@ static void pflash_cfi02_unrealize(DeviceState *dev, Error **errp)
 {
     PFlashCFI02 *pfl = PFLASH_CFI02(dev);
     timer_del(&pfl->timer);
+    g_free(pfl->sector_erase_map);
 }
 
 static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
index 303bc87820..d3b23f4f66 100644
--- a/tests/pflash-cfi02-test.c
+++ b/tests/pflash-cfi02-test.c
@@ -43,6 +43,8 @@ typedef struct {
 #define CHIP_ERASE_CMD 0x10
 #define UNLOCK_BYPASS_CMD 0x20
 #define UNLOCK_BYPASS_RESET_CMD 0x00
+#define ERASE_SUSPEND_CMD 0xB0
+#define ERASE_RESUME_CMD SECTOR_ERASE_CMD
 
 typedef struct {
     int bank_width;
@@ -241,6 +243,16 @@ static void chip_erase(const FlashConfig *c)
     flash_cmd(c, UNLOCK0_ADDR, CHIP_ERASE_CMD);
 }
 
+static void erase_suspend(const FlashConfig *c)
+{
+    flash_cmd(c, FLASH_ADDR(0), ERASE_SUSPEND_CMD);
+}
+
+static void erase_resume(const FlashConfig *c)
+{
+    flash_cmd(c, FLASH_ADDR(0), ERASE_RESUME_CMD);
+}
+
 /*
  * Test flash commands with a variety of device geometry.
  */
@@ -312,11 +324,20 @@ static void test_geometry(const void *opaque)
     uint32_t device_len = 1 << flash_query_1(c, FLASH_ADDR(0x27));
     g_assert_cmphex(device_len, ==, UNIFORM_FLASH_SIZE);
 
+    /* Check that erase suspend to read/write is supported. */
+    uint16_t pri = flash_query_1(c, FLASH_ADDR(0x15)) +
+                   (flash_query_1(c, FLASH_ADDR(0x16)) << 8);
+    g_assert_cmpint(pri, >=, 0x2D + 4 * nb_erase_regions);
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(pri + 0)), ==, replicate(c, 'P'));
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(pri + 1)), ==, replicate(c, 'R'));
+    g_assert_cmpint(flash_query(c, FLASH_ADDR(pri + 2)), ==, replicate(c, 'I'));
+    g_assert_cmpint(flash_query_1(c, FLASH_ADDR(pri + 6)), ==, 2); /* R/W */
     reset(c);
 
     const uint64_t dq7 = replicate(c, 0x80);
     const uint64_t dq6 = replicate(c, 0x40);
     const uint64_t dq3 = replicate(c, 0x08);
+    const uint64_t dq2 = replicate(c, 0x04);
 
     uint64_t byte_addr = 0;
     for (int region = 0; region < nb_erase_regions; ++region) {
@@ -456,6 +477,95 @@ static void test_geometry(const void *opaque)
         }
     }
 
+    /* Test erase suspend/resume during erase timeout. */
+    sector_erase(c, 0);
+    /*
+     * Check that DQ 3 is 0 and DQ6 and DQ2 are toggling in the sector being
+     * erased as well as in a sector not being erased.
+     */
+    byte_addr = c->sector_len[0];
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq3, ==, 0);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    status0 = flash_read(c, byte_addr);
+    status1 = flash_read(c, byte_addr);
+    g_assert_cmpint(status0 & dq3, ==, 0);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+
+    /*
+     * Check that after suspending, DQ6 does not toggle but DQ2 does toggle in
+     * an erase suspended sector but that neither toggle (we should be
+     * getting data) in a sector not being erased.
+     */
+    erase_suspend(c);
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq6, ==, status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    g_assert_cmpint(flash_read(c, byte_addr), ==, flash_read(c, byte_addr));
+
+    /* Check that after resuming, DQ3 is 1 and DQ6 and DQ2 toggle. */
+    erase_resume(c);
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    status0 = flash_read(c, byte_addr);
+    status1 = flash_read(c, byte_addr);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    wait_for_completion(c, 0);
+
+    /* Repeat this process but this time suspend after the timeout. */
+    sector_erase(c, 0);
+    qtest_clock_step_next(c->qtest);
+    /*
+     * Check that DQ 3 is 1 and DQ6 and DQ2 are toggling in the sector being
+     * erased as well as in a sector not being erased.
+     */
+    byte_addr = c->sector_len[0];
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    status0 = flash_read(c, byte_addr);
+    status1 = flash_read(c, byte_addr);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+
+    /*
+     * Check that after suspending, DQ6 does not toggle but DQ2 does toggle in
+     * an erase suspended sector but that neither toggle (we should be
+     * getting data) in a sector not being erased.
+     */
+    erase_suspend(c);
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq6, ==, status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    g_assert_cmpint(flash_read(c, byte_addr), ==, flash_read(c, byte_addr));
+
+    /* Check that after resuming, DQ3 is 1 and DQ6 and DQ2 toggle. */
+    erase_resume(c);
+    status0 = flash_read(c, 0);
+    status1 = flash_read(c, 0);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    status0 = flash_read(c, byte_addr);
+    status1 = flash_read(c, byte_addr);
+    g_assert_cmpint(status0 & dq3, ==, dq3);
+    g_assert_cmpint(status0 & dq6, ==, ~status1 & dq6);
+    g_assert_cmpint(status0 & dq2, ==, ~status1 & dq2);
+    wait_for_completion(c, 0);
+
     qtest_quit(qtest);
 }
 
-- 
2.20.1
