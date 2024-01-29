Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp276805ejk;
        Mon, 29 Jan 2024 08:10:34 -0800 (PST)
X-Received: by 2002:a05:600c:1d04:b0:40e:f9df:3531 with SMTP id l4-20020a05600c1d0400b0040ef9df3531mr1582607wms.8.1706544633922;
        Mon, 29 Jan 2024 08:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706544633; cv=none;
        d=google.com; s=arc-20160816;
        b=kunw6poAbB/M1TVjprszayKiHazvLPcSLwmxgoNHA09URVKnlLQFoJ3ZGxPve7/v+C
         TWOQvBWEH9r4V5dQj+IyulrSXr0C9WhXl11fDLwjdgxydltWYC+VqFKnDvgz6tvG/Kmg
         MJ80EE4v3hpU0vNyH0JInO90+N0EbvCSywa6OsYFTRKPU9fFXbZT3/KUFqnqnvedpv+/
         NCAS5K//ClE125yMA7CG5TAxmktXoKcTv4CsYxF6r29mtKndQkgBTVjz0NOXdpU+Zi2p
         XmLLzq5FK3AbiiebMVHjkeFraJYgTzIB1b7ZjkYsaSys5diEI221WVALReIBMe2nepKc
         cvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jJrBQU8/K6RcUc2wQkGztYkcJD87aocyjGftJaoYKA0=;
        fh=i8IrxfRLCV5OjP1q5SHj5PLJJsmsGE7RKBJUCNgfBeY=;
        b=xfG1VpiMwdabFHDMELGTkLtWpD16zsNb+fYWbgD9O3GIsyTKAlZZ3ZPiIsCGQPvuTB
         5xoBsOe3JXrPYPgiwBb3v0IHWwTWKJoHYuGjjNJC1AohK3cNPIbGpBLpzRRlgNIxIIFn
         ivd6bvx544Sd1HCggi6CXN7vQQmv4TfE5Slk6O/0d2MSUWtQ/P9gceBD+ZVvCZkXGMGa
         I1uxAvZGu/Eo2B6VIJGQ6isrfrJtby/5dHgLEc36CX42ayNVhT7YVjBuTxeqFTBwi2kn
         +tKS/Yt0+mzzRFGmC/xjcEeJFNkSWS3J29lJzSJHcuT5SgLUHoH5iIfsAHHcHlarKTlD
         FD3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHrHttEJ;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t12-20020a1c770c000000b0040ea01d514asor2202489wmi.8.2024.01.29.08.10.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jan 2024 08:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RHrHttEJ;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544633; x=1707149433; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJrBQU8/K6RcUc2wQkGztYkcJD87aocyjGftJaoYKA0=;
        b=RHrHttEJ6OOmTOjWsSRB7FoEgTNlG11WTbCXwFHFRTuO39oCro5ueaVUU5LQw9wPLf
         KUq8vexbxLawXoikEN/U3OQGA/+jgzB2h28hN+VCwy9NxPTrwtziVu/1B69nKMQyGqmv
         ZdtV5X+/AI4IFJycpP4T3DBwQo3phrMSW9iR0WWT/htnntiLpIW9Y+M8Diqz+u3wjNI4
         UZHBO5cqBVCAfU/Rp0gnrL32T5MdPFS5n979XA6jiCpcuUEPa6LrMz/7q95FDASDieMD
         uti63ecwQaDx+LGMBrUB+MmMMuSb1MjaeazYtHsH0hNTLTUhhxn0ixWmaF/x1eNgHxwO
         amPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544633; x=1707149433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJrBQU8/K6RcUc2wQkGztYkcJD87aocyjGftJaoYKA0=;
        b=eHZPrd2666hIPWz4tq10XsA1YNQSwLnsI3BC8Txe6RTcDlWU9+2tKgi2q1/1uFB+s4
         eX385Q57eyAkcXKvO6jsj6pHHDzY7Eb9KuCE/t6bxYO4IwbZ+lZUBIpCKZxlii8AOmMP
         XaOd9JS1hR4qodzVz5zyUxyJSOymoNmMfbzAuA7CU42IzgGsc6aCj6alxF9ZMNW5JYAE
         y9psOyMraghKDAmKXH4l647VO2TaCeMYniEZj4H1xWCbhHfKHAVQ0k5x94mR/wdSNS4Y
         f9NaIcSR+Zmsx4TU2WM364xQhtOtEPqT+O6f3hFMM95eBCrPTIumI/81UZ68GiB9LuQm
         sGDQ==
X-Gm-Message-State: AOJu0Yw12WxR7X5P/kE2nhag3NkUP0ZVWGwkwBEcDcVT10cV0dDSVM6r
	CLZWhqUxgsDBibYldtwT+SNYIxNlB9A38dYpohfbCawE5e2EZ/UZ5VZ9X29ZM5hPAA==
X-Google-Smtp-Source: AGHT+IGXEoIx/U9hfmpuCmgUgsEf0NYzJpBVKS4fOt1eKkdo5k209ufGMqzBoqKCECT5c24IOvKp7A==
X-Received: by 2002:a05:600c:4711:b0:40e:f67d:d5f9 with SMTP id v17-20020a05600c471100b0040ef67dd5f9mr2509964wmo.4.1706544633645;
        Mon, 29 Jan 2024 08:10:33 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr. [37.6.163.245])
        by smtp.gmail.com with ESMTPSA id co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 08:10:33 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/6] hw/arm/z2: convert DPRINTF to trace events and guest errors
Date: Mon, 29 Jan 2024 18:09:37 +0200
Message-Id: <799c5141c5751cf2341e1d095349612e046424a8.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: uBFu+GHgkq0Z

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on trace events should be able to opt-in to each trace event and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into trace events. DPRINTFs that report guest errors are logged with
LOG_GUEST_ERROR.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/trace-events |  7 +++++++
 hw/arm/z2.c         | 27 ++++++++-------------------
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 7c56943215..0ff41e6c78 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -58,3 +58,10 @@ smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64
 # strongarm.c
 strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
 strongarm_ssp_read_underrun(void) "SSP rx underrun"
+
+# z2.c
+z2_lcd_reg_update(uint8_t cur, uint8_t i_0, uint8_t i_1, uint8_t i_2, uint32_t value) "cur_reg = 0x%x, buf = [0x%x, 0x%x, 0x%x], value = 0x%x"
+z2_lcd_enable_disable_result(const char *result) "LCD %s"
+z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
+z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
+z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index a67fba2cfd..eb2ff8dbc8 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -27,13 +27,7 @@
 #include "exec/address-spaces.h"
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
@@ -119,6 +113,8 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
 {
     ZipitLCD *z = ZIPIT_LCD(dev);
     uint16_t val;
+
+    trace_z2_lcd_reg_update(z->cur_reg, z->buf[0], z->buf[1], z->buf[2], value);
     if (z->selected) {
         z->buf[z->pos] = value & 0xff;
         z->pos++;
@@ -126,22 +122,19 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
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
@@ -211,14 +204,12 @@ static int aer915_send(I2CSlave *i2c, uint8_t data)
 
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
@@ -228,14 +219,12 @@ static int aer915_event(I2CSlave *i2c, enum i2c_event event)
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
