Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868789ejg;
        Fri, 19 Jan 2024 03:14:30 -0800 (PST)
X-Received: by 2002:a17:907:c316:b0:a2f:7876:5770 with SMTP id tl22-20020a170907c31600b00a2f78765770mr460296ejc.70.1705662870466;
        Fri, 19 Jan 2024 03:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662870; cv=none;
        d=google.com; s=arc-20160816;
        b=KhZH4+4gvK9vT1NXxLrSD58WzZWr+PSREga9LiKdWChOhjWYLiHe/hm6qeIGlJsUW1
         LLV8YdL20SLyeAFYWjUAGONic3wX0VxASW1Q929e1DkZgCzgTrxqyvRzJrY78JBSjHH4
         aG3XcwClSP0SzTNgnmwF0myvosTpWAZLQ5LnU/0ieWP51rX2J3OCc4ZCH2nbWk4jeMgF
         AZL45Ces2Niz+MN2J5NdPgNxQsZ5V3wyM/sof+WQzVsAMoSmVESsGxn1OmJMehScYV5g
         4WnAz8Oqtr/AFdsZ+a1H9A0YRpFLI41JGgbez8Khrnc+r3WVKlPgv8uYQW2VbkR7dJhQ
         lIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=axwu9OirAAbfzNHj3iKrYWOaH6e1S20UxGk7oz9UvVY=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=ZoSMoOo7OqTO0EkrBub4t81fyl6j0nguA2AJmqfiZZ5xd4NyHpXbpok2ZPM4ysc+qy
         xuIottnTNzuHD7OKrpZ3F6iYnbzfXDpPdf+5dBu+8pcYrwPPKmlPm4TyvUqwG8AjUWlH
         vTeQpyWp8HWiumSAsCO2Oq+6LGAs8CsK0KBrV3UwjEx97sfhS3sETJ6Ie3atIhzjlPRZ
         REK93OxAmvM5aK+NLgntwsN8rprfLcWnSfYCcRFVG65nxVBzBC5Hq+FUd5nN9hS6IQt4
         Egn4Ck4vvzvZ9fLVP50Vfd0/+ktyD03KU7pkqnxJI4Azy4M53yYeUUEt4FT35yNs4ney
         f2RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1g9rI6s;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gs19-20020a1709072d1300b00a2cd728e8b9sor1229317ejc.18.2024.01.19.03.14.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1g9rI6s;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662870; x=1706267670; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axwu9OirAAbfzNHj3iKrYWOaH6e1S20UxGk7oz9UvVY=;
        b=r1g9rI6sNoVQFOFRj6Zb5IuZQSR7RGJrnqAWaqDpmgotq0E1z+GuL19ELA7uNcxBa9
         xY2S/0W7fda/xlWDv6q6hsnZY014YziJsss2rW3qHTv2jPzNjqHZ7Yu8VCByEddsZho0
         n/lDqiFVV8Uh4EZPaC0+AX5Fd/gUaOaIcdY7jlW8FBz4Udyb/HL5EPxIFOHeCAJExBWh
         alFYQbWE3QfwHTKHzikbYqqMimrv+AqPIZJnef4MyTQ4JSc4O8WZf9SgKjDptlfoXIh9
         SLf1UOegOKZGZtWxCiAbv5x9R90sRQ2hVwN2P3Jdi1P50U73Ikk0jmpUOIM70OizU3XC
         oABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662870; x=1706267670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axwu9OirAAbfzNHj3iKrYWOaH6e1S20UxGk7oz9UvVY=;
        b=Bwj7jkX3xq2VqFQnLsdS6cu1y+DHK1kcdM1amlCFKy83tZXTFp5Rx6ZloBS/doi40A
         0m93cGB8+U1La7wVzEmlgdOqSL96ORGLQMmkXSHw83p8da0w+xq+dxa/ja89k4eVupaV
         Q49PI82iCjOO6d+omelOwZaklb3slSljH8Pc32qT5c0BywsORJNW7kU9dxVH1hbZzNQe
         NqBFRCmp5rQZajonj5jCD9HLTGfk1t9gQ5fJFubxUA7+FiOxsrJc0kYRwLGh4j3Xmpwx
         EaoZ8H1dVvCxIo9eK8ONvrRY3mWPUinsCHncHF2ZbnxIhr88oByQ10aRrlqzPRVygxt/
         GyiA==
X-Gm-Message-State: AOJu0YyOh6PRz0wofOSvQQLCD8+9MkipbEfSyA4LrB0CCVnx+Qlf8nsk
	NENiYwk5ipLvrV7zuALHMoLq0MaGJBi0wDu/tcLaeiH1Kl493yzyLQEY59i0y6E5Pw==
X-Google-Smtp-Source: AGHT+IHARoneApKjgPLy58+Put03cP3Oze0dmwhxjxb5Lpeq9M94R8OhG7zIpSvJ9lel5kPZR1bh1g==
X-Received: by 2002:a17:907:d510:b0:a2f:3f0f:964c with SMTP id wb16-20020a170907d51000b00a2f3f0f964cmr950846ejc.98.1705662870043;
        Fri, 19 Jan 2024 03:14:30 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:29 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/6] hw/arm/strongarm.c: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 13:14:20 +0200
Message-Id: <3c6fbd73a14fdf120a6b0c1e168e5469acd00306.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: iO+v7+Qng0o5

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/strongarm.c  | 49 +++++++++++++++++++--------------------------
 hw/arm/trace-events | 18 +++++++++++++++++
 2 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index fef3638aca..3ff748e826 100644
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
@@ -151,8 +144,7 @@ static uint64_t strongarm_pic_mem_read(void *opaque, hwaddr offset,
     case ICPR:
         return s->pending;
     default:
-        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
-                        __func__, offset);
+        trace_strongarm_pic_mem_read(offset);
         return 0;
     }
 }
@@ -173,8 +165,7 @@ static void strongarm_pic_mem_write(void *opaque, hwaddr offset,
         s->int_idle = (value & 1) ? 0 : ~0;
         break;
     default:
-        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
-                        __func__, offset);
+        trace_strongarm_pic_mem_write(offset);
         break;
     }
     strongarm_pic_update(s);
@@ -333,7 +324,7 @@ static uint64_t strongarm_rtc_read(void *opaque, hwaddr addr,
                 ((qemu_clock_get_ms(rtc_clock) - s->last_hz) << 15) /
                 (1000 * ((s->rttr & 0xffff) + 1));
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_rtc_read(addr);
         return 0;
     }
 }
@@ -375,7 +366,7 @@ static void strongarm_rtc_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_rtc_write(addr);
     }
 }
 
@@ -581,7 +572,7 @@ static uint64_t strongarm_gpio_read(void *opaque, hwaddr offset,
         return s->status;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        trace_strongarm_gpio_read(offset);
     }
 
     return 0;
@@ -626,7 +617,7 @@ static void strongarm_gpio_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        trace_strongarm_gpio_write(offset);
     }
 }
 
@@ -782,7 +773,7 @@ static uint64_t strongarm_ppc_read(void *opaque, hwaddr offset,
         return s->ppfr | ~0x7f001;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        trace_strongarm_ppc_read(offset);
     }
 
     return 0;
@@ -817,7 +808,7 @@ static void strongarm_ppc_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
+        trace_strongarm_ppc_write(offset);
     }
 }
 
@@ -1029,8 +1020,11 @@ static void strongarm_uart_update_parameters(StrongARMUARTState *s)
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
@@ -1164,7 +1158,7 @@ static uint64_t strongarm_uart_read(void *opaque, hwaddr addr,
         return s->utsr1;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_uart_read_bad_register(addr);
         return 0;
     }
 }
@@ -1221,7 +1215,7 @@ static void strongarm_uart_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_uart_write_bad_register(addr);
     }
 }
 
@@ -1434,7 +1428,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
             return 0xffffffff;
         }
         if (s->rx_level < 1) {
-            printf("%s: SSP Rx Underrun\n", __func__);
+            trace_strongarm_ssp_read_underrun();
             return 0xffffffff;
         }
         s->rx_level--;
@@ -1443,7 +1437,7 @@ static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr,
         strongarm_ssp_fifo_update(s);
         return retval;
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_ssp_read(addr);
         break;
     }
     return 0;
@@ -1458,8 +1452,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR0:
         s->sscr[0] = value & 0xffbf;
         if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
-            printf("%s: Wrong data size: %i bits\n", __func__,
-                   (int)SSCR0_DSS(value));
+            trace_strongarm_ssp_write_wrong_data_size((int)SSCR0_DSS(value));
         }
         if (!(value & SSCR0_SSE)) {
             s->sssr = 0;
@@ -1471,7 +1464,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
     case SSCR1:
         s->sscr[1] = value & 0x2f;
         if (value & SSCR1_LBM) {
-            printf("%s: Attempt to use SSP LBM mode\n", __func__);
+            trace_strongarm_ssp_write_wrong_data_size_invalid();
         }
         strongarm_ssp_fifo_update(s);
         break;
@@ -1509,7 +1502,7 @@ static void strongarm_ssp_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
+        trace_strongarm_ssp_write_bad_register(addr);
         break;
     }
 }
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index a262ad2e6a..a6a67d5f16 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -63,3 +63,21 @@ z2_lcd_invalid_command(uint8_t value) "0x%x"
 z2_aer915_send_too_log(int8_t msg) "message too long (%i bytes)"
 z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
 z2_aer915_i2c_start_recv(uint16_t len) "I2C_START_RECV: short message with len %d"
+
+# strongarm.c
+strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
+strongarm_uart_read_bad_register(uint64_t addr) "Bad uart register 0x%zu"
+strongarm_uart_write_bad_register(uint64_t addr) "Bad uart register 0x%zu"
+strongarm_pic_mem_read(uint64_t offset) "Bad pic mem register read offset 0x%zu"
+strongarm_pic_mem_write(uint64_t offset) "Bad pic mem register write offset 0x%zu"
+strongarm_rtc_read(uint64_t addr) "Bad rtc register read 0x%zu"
+strongarm_rtc_write(uint64_t addr) "Bad rtc register write 0x%zu"
+strongarm_gpio_read(uint64_t offset) "Bad gpio read offset 0x%zu"
+strongarm_gpio_write(uint64_t offset) "Bad gpio write offset 0x%zu"
+strongarm_ppc_write(uint64_t offset) "Bad ppc write offset 0x%zu"
+strongarm_ppc_read(uint64_t offset) "Bad ppc write offset 0x%zu"
+strongarm_ssp_read_underrun(void) "SSP Rx Underrun"
+strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
+strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
+strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LBM mode"
+strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"
-- 
γαῖα πυρί μιχθήτω
