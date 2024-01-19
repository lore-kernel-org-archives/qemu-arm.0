Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp937483ejg;
        Fri, 19 Jan 2024 05:24:52 -0800 (PST)
X-Received: by 2002:aa7:cf0e:0:b0:559:f3aa:5ecd with SMTP id a14-20020aa7cf0e000000b00559f3aa5ecdmr1439290edy.54.1705670692468;
        Fri, 19 Jan 2024 05:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705670692; cv=none;
        d=google.com; s=arc-20160816;
        b=WZptVunLNcY+w/OZPfoUrUxxNGdIeJTGcHOcSKPMEHzqifvG89rOcmfBYBiOJT9qBP
         OeV+U13Qss671jca713JpwZb/bM8u8/yEyw6YR4W8m2bvaTRn7sVh+cLYiSUTC5T2dRD
         BoFKWGsdWqKDWS/R1857exDqkdAZROBSRjisj2Rjr75FbiY0f66SpVA9Jab3SbUUxlvr
         dwC3qzDVkqeTWFuKbUjP8QHMHZog6vA3Eyo7jnXC9KWnrvLR/sRYPmeYH4NdTl3HbD7f
         ksB1DytNNaK4cp7cPVlK6jKJrMOedRI0O0z6k3fC+0aehwyy16dMHStQKdgbTPaseIOL
         i60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=46YiY2CEk5qY+rzHSC7rrIsEJwDXdSPiYCQhhnqgWUg=;
        fh=f3Y3sZEpYRjfEg90XhED1f3vandGp5Hk3HJV5rk3gQA=;
        b=rLltmLUgCw0KlyJdcCdbGAeMUjOTNKCG1ZQP9dsCQdSFPyH1X3PW2YFhk81TJ5WvkI
         JsoK0umVWI1E4KMgnT8NbhdWkevnA3xlob26mzKFCoAnfhl0zgyKnlgM0Ps9+/IumVni
         Z67Nd54yE0PtZLGFqPhCrloomyvWCRMYlydD4fKdMwGEPNpljdTcqnSXtlhAcI1iWtZ8
         Gj9DT/xZCq3brvrWkrIEgxf8KShk/tK8ALZEanU1TB4eJbK9RAFIvMYELqnnpI5U3/5x
         kGXPfD0jFJA0i8C060w3wFhcmwODr2b8TjRTOTKN5O2J3EBsSBfWJRUl8ClR+csh4Adc
         X8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIwb2Lh8;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h10-20020a05640250ca00b005596c9e0b76sor844647edb.8.2024.01.19.05.24.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 05:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIwb2Lh8;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670692; x=1706275492; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46YiY2CEk5qY+rzHSC7rrIsEJwDXdSPiYCQhhnqgWUg=;
        b=zIwb2Lh8wSuCrxCfO3mKs+sfxuZ3C7fluhgoY6REMTuI/AB+P/pnafg3R8YBZgxRUO
         Wu/PjnsR1bdOjurSmACdGciZklJzICFK+J5C9UYAMPxfdhQoOFidQ3FC6mhvEbV4c093
         TCjY/NpV/FTKxFtWWF5lqDBKlVHL9DmV8JTXTNRvuDj8nEjdxO3dsUoG2ERhXAWBFk6h
         Td2sMBWxfXC74fHKevbzb3rk0j9KbpG8yNhmJpDebkYDnS8Ua8tQUv6+VR0AhQ+gqvtY
         DTC2VgZ+rLsTyvZLOEKV2ciWBbE08mMcLwUs0efsCcEEo+jnDbdBE4sBm72m4TxeFOOu
         bM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670692; x=1706275492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46YiY2CEk5qY+rzHSC7rrIsEJwDXdSPiYCQhhnqgWUg=;
        b=j2gEbIYdoD90j0dfa94vcApz8UTucvRqF9F6JcPgKR0+/BdfRr66nA47DaGZp1y/Fm
         IrePbCZSxgFDIOhZ5u9U3LPH4WThgRRkiMR+qMZ59jb1mOXO1l/aCVFLuBxJNDeOkx0N
         UAf5zOp+DBWqCM3aCBFyRYgUiK8tEpOK62VqeTwvxsP7TYnLxpw1zJKObQcGEF+qpges
         2TZaYDCgKFnnUu3CMLDew0pxUbrv9aaezsteP+tF8wPWtlZKaUDdXhrDeI6Wik8yRa2B
         b1SgszoSY8Rxvyt4LjFCbIBVV6gLG+1S02Mv46Hm+S5aXXvSV+OP/EbUK98WLME5K9l4
         Anvg==
X-Gm-Message-State: AOJu0YwiL9EicMBLzskX3dWsGzpScG+PIoVDp9XHjS7ej08LvjOD5t/1
	0B3F+JxDz9PfunirJHADeCu3ed2n4YgkcoH3VTbto6xEKc7AAFiY4s0IL2wWooo5fvwIhtLDtj8
	jo4D/WQ==
X-Google-Smtp-Source: AGHT+IENp8muasuKq/i/1a39zy4Wl2/8UDdLhlmNZ42q7lXd1d929WXy1NPkktj6p0M8fw/3xE7SmA==
X-Received: by 2002:aa7:d743:0:b0:558:322f:3bcb with SMTP id a3-20020aa7d743000000b00558322f3bcbmr1636635eds.57.1705670692177;
        Fri, 19 Jan 2024 05:24:52 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:24:51 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/5] hw/arm/z2: convert DPRINTF to trace events and guest errors
Date: Fri, 19 Jan 2024 15:24:43 +0200
Message-Id: <339219e962d90f47cf125f2be2d64afb0833e905.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: gvOS51kg9YTj

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on trace events should be able to opt-in to each trace event and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into trace events. DPRINTFs that report guest errors are logged with
LOG_GUEST_ERROR.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/strongarm.c  | 55 ++++++++++++++++++++++-----------------------
 hw/arm/trace-events | 10 +++++++++
 hw/arm/z2.c         | 27 +++++++---------------
 3 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index fef3638aca..9fca0b302c 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -46,8 +46,7 @@
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qom/object.h"
-
-//#define DEBUG
+#include "trace.h"
 
 /*
  TODO
@@ -66,12 +65,6 @@
  - Enhance UART with modem signals
  */
 
-#ifdef DEBUG
-# define DPRINTF(format, ...) printf(format , ## __VA_ARGS__)
-#else
-# define DPRINTF(format, ...) do { } while (0)
-#endif
-
 static struct {
     hwaddr io_base;
     int irq;
@@ -151,8 +144,9 @@ static uint64_t strongarm_pic_mem_read(void *opaque, hwaddr offset,
     case ICPR:
         return s->pending;
     default:
-        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
-                        __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Bad pic mem register read offset 0x%zu",
+                      offset);
         return 0;
     }
 }
@@ -173,8 +167,9 @@ static void strongarm_pic_mem_write(void *opaque, hwaddr offset,
         s->int_idle = (value & 1) ? 0 : ~0;
         break;
     default:
-        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
-                        __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                     "Bad pic mem register write offset 0x%zu",
+                      offset);
         break;
     }
     strongarm_pic_update(s);
@@ -333,7 +328,7 @@ static uint64_t strongarm_rtc_read(void *opaque, hwaddr addr,
                 ((qemu_clock_get_ms(rtc_clock) - s->last_hz) << 15) /
                 (1000 * ((s->rttr & 0xffff) + 1));
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad rtc register read 0x%zu", addr);
         return 0;
     }
 }
@@ -375,7 +370,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad rtc register write 0x%zu", addr);
     }
 }
 
@@ -581,7 +576,7 @@ static uint64_t strongarm_gpio_read(void *opaque, hwaddr offset,
         return s->status;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad gpio read offset 0x%zu", offset);
     }
 
     return 0;
@@ -626,7 +621,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad gpio write offset 0x%zu", offset);
     }
 }
 
@@ -782,7 +777,7 @@ static uint64_t strongarm_ppc_read(void *opaque, hwaddr offset,
         return s->ppfr | ~0x7f001;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad ppc read offset 0x%zu", offset);
     }
 
     return 0;
@@ -817,7 +812,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad ppc write offset 0x%zu", offset);
     }
 }
 
@@ -1029,8 +1024,11 @@ static void strongarm_uart_update_parameters(StrongARMUARTState *s)
     s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
     qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
 
-    DPRINTF(stderr, "%s speed=%d parity=%c data=%d stop=%d\n", s->chr->label,
-            speed, parity, data_bits, stop_bits);
+    trace_strongarm_uart_update_parameters(s->chr.chr->label?:"NULL",
+                                           speed,
+                                           parity,
+                                           data_bits,
+                                           stop_bits);
 }
 
 static void strongarm_uart_rx_to(void *opaque)
@@ -1164,7 +1162,7 @@ static uint64_t strongarm_uart_read(void *opaque, hwaddr addr,
         return s->utsr1;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad uart register read 0x%zu", addr);
         return 0;
     }
 }
@@ -1221,7 +1219,7 @@ static void strongarm_uart_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad uart register write 0x%zu", addr);
     }
 }
 
@@ -1434,7 +1432,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
             return 0xffffffff;
         }
         if (s->rx_level < 1) {
-            printf("%s: SSP Rx Underrun\n", __func__);
+            trace_strongarm_ssp_read_underrun();
             return 0xffffffff;
         }
         s->rx_level--;
@@ -1443,7 +1441,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
         strongarm_ssp_fifo_update(s);
         return retval;
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad ssp register read 0x%zu", addr);
         break;
     }
     return 0;
@@ -1458,8 +1456,9 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR0:
         s->sscr[0] = value & 0xffbf;
         if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
-            printf("%s: Wrong data size: %i bits\n", __func__,
-                   (int)SSCR0_DSS(value));
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Wrong data size: %i bits",
+                          (int)SSCR0_DSS(value));
         }
         if (!(value & SSCR0_SSE)) {
             s->sssr = 0;
@@ -1471,7 +1470,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR1:
         s->sscr[1] = value & 0x2f;
         if (value & SSCR1_LBM) {
-            printf("%s: Attempt to use SSP LBM mode\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR, "Attempt to use SSP LBM mode");
         }
         strongarm_ssp_fifo_update(s);
         break;
@@ -1509,7 +1508,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR, "Bad ssp register write 0x%zu", addr);
         break;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cdc1ea06a8..b0a56fcdc6 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,3 +55,13 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# z2.c
+z2_lcd_reg_update(uint8_t cur, uint8_t _0, uint8_t _1, uint8_t _2, uint32_t value) "cur_reg = 0x%xd, buf = [0x%xd, 0x%xd, 0x%xd], value = 0x%x"
+z2_lcd_enable_disable_result(const char * result) "LCD %s"
+z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
+z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
+z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
+
+# strongarm.c
+strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
+strongarm_ssp_read_underrun(void) "SSP rx underrun"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 83741a4909..147a5f9857 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -28,13 +28,7 @@
 #include "cpu.h"
 #include "qom/object.h"
 #include "qapi/error.h"
-
-#ifdef DEBUG_Z2
-#define DPRINTF(fmt, ...) \
-        printf(fmt, ## __VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 static const struct keymap map[0x100] = {
     [0 ... 0xff] = { -1, -1 },
@@ -120,6 +114,8 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
 {
     ZipitLCD *z = ZIPIT_LCD(dev);
     uint16_t val;
+
+    trace_z2_lcd_reg_update(z->cur_reg, z->buf[0], z->buf[1], z->buf[2], value);
     if (z->selected) {
         z->buf[z->pos] = value & 0xff;
         z->pos++;
@@ -127,22 +123,19 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
     if (z->pos == 3) {
         switch (z->buf[0]) {
         case 0x74:
-            DPRINTF("%s: reg: 0x%.2x\n", __func__, z->buf[2]);
             z->cur_reg = z->buf[2];
             break;
         case 0x76:
             val = z->buf[1] << 8 | z->buf[2];
-            DPRINTF("%s: value: 0x%.4x\n", __func__, val);
             if (z->cur_reg == 0x22 && val == 0x0000) {
                 z->enabled = 1;
-                printf("%s: LCD enabled\n", __func__);
+                trace_z2_lcd_enable_disable_result("enabled");
             } else if (z->cur_reg == 0x10 && val == 0x0000) {
                 z->enabled = 0;
-                printf("%s: LCD disabled\n", __func__);
+                trace_z2_lcd_enable_disable_result("disabled");
             }
             break;
         default:
-            DPRINTF("%s: unknown command!\n", __func__);
             break;
         }
         z->pos = 0;
@@ -212,14 +205,12 @@ static int aer915_send(I2CSlave *i2c, uint8_t data)
 
     s->buf[s->len] = data;
     if (s->len++ > 2) {
-        DPRINTF("%s: message too long (%i bytes)\n",
-            __func__, s->len);
+        trace_z2_aer915_send_too_long(s->len);
         return 1;
     }
 
     if (s->len == 2) {
-        DPRINTF("%s: reg %d value 0x%02x\n", __func__,
-                s->buf[0], s->buf[1]);
+        trace_z2_aer915_send(s->buf[0], s->buf[1]);
     }
 
     return 0;
@@ -229,14 +220,12 @@ static int aer915_event(I2CSlave *i2c, enum i2c_event event)
 {
     AER915State *s = AER915(i2c);
 
+    trace_z2_aer915_event(s->len, event);
     switch (event) {
     case I2C_START_SEND:
         s->len = 0;
         break;
     case I2C_START_RECV:
-        if (s->len != 1) {
-            DPRINTF("%s: short message!?\n", __func__);
-        }
         break;
     case I2C_FINISH:
         break;
-- 
γαῖα πυρί μιχθήτω
