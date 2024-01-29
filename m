Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp276772ejk;
        Mon, 29 Jan 2024 08:10:30 -0800 (PST)
X-Received: by 2002:a5d:6081:0:b0:339:47f0:7dda with SMTP id w1-20020a5d6081000000b0033947f07ddamr5483399wrt.54.1706544630643;
        Mon, 29 Jan 2024 08:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544630; cv=none;
        d=google.com; s=arc-20160816;
        b=pShqqnxyg4pT0N/7pf9+/4G+wof7WjGnvUwKLPJ0AR94sZb6yekgGqXRrXA9P00pkI
         WYte1KWVnwxbzZVr0Jy0pH8Ix1lT3q7/vAp2q3SbRP4peaV4sCqbWkvPoyFKhLeFKDww
         YL2ZbNRqh4vEBIufFQ+RMNip+hlQCyDXBO6TOSOgg3VIry4Xou+nsLwd2Cq9160ALl3L
         UgHEx6osTxkQfKaGIIO3KXpdSK5GdHytEMWqIdJtzqGaowGS9jwmBlxiTTmslUMPaQ4K
         o0oizzcpzzBb9XVamTCH0RtoVjQ9Nd094Ws6mNA3NjRTVv6T44hI8AyYlEXFJIGVk+B+
         Rlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W8ts9LydiTk8L1/WhwNtnM7rJn30kmj1TlpmRZR/snA=;
        fh=i8IrxfRLCV5OjP1q5SHj5PLJJsmsGE7RKBJUCNgfBeY=;
        b=j3d5X/1Ka8aUr0Zdxfu7qy6XrjuGH5wiZhjm+GU2PbXw1D8t4G5a91zawoXnhd9LVC
         xHmeawJ87q+4L9SUqEuFVqalcpctN2L3M/ccYa/wbseQPfV6nLXgs/ANSBywwz/lLXoB
         f7c4S0Pf7bK6uMcXuL8AGl0eYiDQ3FYggNbYDcOwZp/qsuCH+I3H3hMUZ1wS3PU3hTq6
         40nS3sRfXfx6gidCU5eFIB61UYI5AAE7QXyBR2lLP7zBUzvh6obtq3/uAzYsx0UhEGvt
         DGDhPEV7afuMtx8OaN5xRXSJtQZFksdnnfPOIgIMe1QGwykpnNJnUaDglM4CTGF9dT/4
         PrIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDl1Uq+i;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b4-20020adfc744000000b0033ae2d1e7f5sor366046wrh.5.2024.01.29.08.10.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:10:30 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDl1Uq+i;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544630; x=1707149430; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8ts9LydiTk8L1/WhwNtnM7rJn30kmj1TlpmRZR/snA=;
        b=KDl1Uq+ilBUBz6An0SQmLjjjRsk5GP/ZYji1wticLBU37SXxTGUUsjOxqxDAG/pMQA
         HRmJT4eTIXeZnASKWqgfB5WSRZTwGViKMwK47Hjey6yTrc+7EoFm+BOwAc6xZp8eGt2z
         ovASEDqMzmLigS13LSsQyVi6S1UYwJEeEgae3DC3E92lseZyeJIyNJAdvBzCGbQGVw9c
         ZKswuafe/BBa36t3LoE7N7mQ1/L+6htmugcXPY+4D6usN665RyNS4px+Uw98JG5YQaR9
         0whzkeU+1PNTpAvyBhcPuitM260uWTtyboBFgmyS/e5o9Ist7p8ZSbIQwxujOPNgFW08
         Dz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544630; x=1707149430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8ts9LydiTk8L1/WhwNtnM7rJn30kmj1TlpmRZR/snA=;
        b=aBbCGYZXB+NwCIEyDpjkixwzUawWvcncGuemw4aNMT/S/UCVRXuiqsr0MBMxxdROPE
         OBWkCUxhEbBuhK0GEhFaR2c2jlVTrh+6nkAqLo2485H9qbel+tEzTCLTMxKKxQTAgeBk
         LSy65Gvyaq62oK25XhlODBpwA/7pOkUPr8WKsFW5n7IW9GqIS/slFBqHVBFoF9Vv0ip8
         7LX5BR/qHZODSnAano6VaEOd1wqO/wWnpAHUocmR6HCOXnP4nd51Z6qtJtq4Os81/A6t
         LCbGAD3heojJd0ygTb49LWXjy7if5aIvotGUIbZ3TQN0WzYL1diRCpzjAMy4nIfdb5uu
         c++Q==
X-Gm-Message-State: AOJu0YxQ5UtV3AYrMvS/PIzqE/E+XoqDQAROcBXyZpLhpLjH8/gBWwNJ
	4ibdR4WikQC3uNAZFXItqNVrR6thUwU6kIDecD9Dhn1Y1TZb9DO+W8VyLzP8zfUL1/1r0I6hpkg
	ujDx8vQ==
X-Google-Smtp-Source: AGHT+IGGV4Zm4671PjUjI3AJyiVZTsWWQyu8wt1CUfZyBnvmPhvhHHwbklSJKmThDd16ZmR8xqdFuA==
X-Received: by 2002:a05:6000:890:b0:336:9e8a:6fde with SMTP id cs16-20020a056000089000b003369e8a6fdemr4741514wrb.22.1706544630130;
        Mon, 29 Jan 2024 08:10:30 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:10:29 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/6] hw/arm/strongarm.c: convert DPRINTF to trace events and guest errors
Date: Mon, 29 Jan 2024 18:09:36 +0200
Message-Id: <39db71dd87bf2007cf7812f3d91dde53887f1f2f.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: 1xakzvJK0XIP

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on trace events should be able to opt-in to each trace event and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into trace events. DPRINTFs that report guest errors are logged with
LOG_GUEST_ERROR.#

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/strongarm.c  | 82 ++++++++++++++++++++++++++++-----------------
 hw/arm/trace-events |  3 ++
 2 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 7fd99a0f14..823b4931b0 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -46,8 +46,7 @@
 #include "qemu/log.h"
 #include "qom/object.h"
 #include "target/arm/cpu-qom.h"
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
+                      "%s: Bad register offset 0x"HWADDR_FMT_plx"\n",
+                      __func__, offset);
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
+                     "%s: Bad register offset 0x"HWADDR_FMT_plx"\n",
+                     __func__, offset);
         break;
     }
     strongarm_pic_update(s);
@@ -333,7 +328,9 @@ static uint64_t strongarm_rtc_read(void *opaque, hwaddr addr,
                 ((qemu_clock_get_ms(rtc_clock) - s->last_hz) << 15) /
                 (1000 * ((s->rttr & 0xffff) + 1));
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad rtc register read 0x"HWADDR_FMT_plx"\n",
+                      __func__, addr);
         return 0;
     }
 }
@@ -375,7 +372,9 @@ static void strongarm_rtc_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad rtc register write 0x"HWADDR_FMT_plx"\n",
+                      __func__, addr);
     }
 }
 
@@ -556,12 +555,12 @@ static uint64_t strongarm_gpio_read(void *opaque, hwaddr offset,
 
     case GPSR:        /* GPIO Pin-Output Set registers */
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "strongarm GPIO: read from write only register GPSR\n");
+                      "%s: read from write only register GPSR\n", __func__);
         return 0;
 
     case GPCR:        /* GPIO Pin-Output Clear registers */
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "strongarm GPIO: read from write only register GPCR\n");
+                      "%s: read from write only register GPCR\n", __func__);
         return 0;
 
     case GRER:        /* GPIO Rising-Edge Detect Enable registers */
@@ -581,7 +580,9 @@ static uint64_t strongarm_gpio_read(void *opaque, hwaddr offset,
         return s->status;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad gpio read offset 0x"HWADDR_FMT_plx"\n",
+                      __func__, offset);
     }
 
     return 0;
@@ -626,7 +627,9 @@ static void strongarm_gpio_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad write offset 0x"HWADDR_FMT_plx"\n",
+                      __func__, offset);
     }
 }
 
@@ -782,7 +785,9 @@ static uint64_t strongarm_ppc_read(void *opaque, hwaddr offset,
         return s->ppfr | ~0x7f001;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad ppc read offset 0x"HWADDR_FMT_plx "\n",
+                      __func__, offset);
     }
 
     return 0;
@@ -817,7 +822,9 @@ static void strongarm_ppc_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad ppc write offset 0x"HWADDR_FMT_plx"\n",
+                      __func__, offset);
     }
 }
 
@@ -1029,8 +1036,13 @@ static void strongarm_uart_update_parameters(StrongARMUARTState *s)
     s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
     qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
 
-    DPRINTF(stderr, "%s speed=%d parity=%c data=%d stop=%d\n", s->chr->label,
-            speed, parity, data_bits, stop_bits);
+    trace_strongarm_uart_update_parameters((s->chr.chr ?
+                                           s->chr.chr->label : "NULL") ?:
+                                           "NULL",
+                                           speed,
+                                           parity,
+                                           data_bits,
+                                           stop_bits);
 }
 
 static void strongarm_uart_rx_to(void *opaque)
@@ -1164,7 +1176,9 @@ static uint64_t strongarm_uart_read(void *opaque, hwaddr addr,
         return s->utsr1;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad uart register read 0x"HWADDR_FMT_plx"\n",
+                      __func__, addr);
         return 0;
     }
 }
@@ -1221,7 +1235,9 @@ static void strongarm_uart_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad uart register write 0x"HWADDR_FMT_plx"\n",
+                      __func__, addr);
     }
 }
 
@@ -1434,7 +1450,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
             return 0xffffffff;
         }
         if (s->rx_level < 1) {
-            printf("%s: SSP Rx Underrun\n", __func__);
+            trace_strongarm_ssp_read_underrun();
             return 0xffffffff;
         }
         s->rx_level--;
@@ -1443,7 +1459,9 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
         strongarm_ssp_fifo_update(s);
         return retval;
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad ssp register read 0x"HWADDR_FMT_plx"\n",
+                      __func__, addr);
         break;
     }
     return 0;
@@ -1458,8 +1476,8 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR0:
         s->sscr[0] = value & 0xffbf;
         if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
-            printf("%s: Wrong data size: %i bits\n", __func__,
-                   (int)SSCR0_DSS(value));
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Wrong data size: %i bits\n",
+                          __func__, (int)SSCR0_DSS(value));
         }
         if (!(value & SSCR0_SSE)) {
             s->sssr = 0;
@@ -1471,7 +1489,9 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR1:
         s->sscr[1] = value & 0x2f;
         if (value & SSCR1_LBM) {
-            printf("%s: Attempt to use SSP LBM mode\n", __func__);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Attempt to use SSP LBM mode\n",
+                          __func__);
         }
         strongarm_ssp_fifo_update(s);
         break;
@@ -1509,7 +1529,9 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad ssp register write 0x"HWADDR_FMT_plx"\n",
+                      __func__,  addr);
         break;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cdc1ea06a8..7c56943215 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,3 +55,6 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# strongarm.c
+strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
+strongarm_ssp_read_underrun(void) "SSP rx underrun"
-- 
γαῖα πυρί μιχθήτω
