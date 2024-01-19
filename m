Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868775ejg;
        Fri, 19 Jan 2024 03:14:29 -0800 (PST)
X-Received: by 2002:a05:6512:1188:b0:50e:7be3:d325 with SMTP id g8-20020a056512118800b0050e7be3d325mr664382lfr.86.1705662869148;
        Fri, 19 Jan 2024 03:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662869; cv=none;
        d=google.com; s=arc-20160816;
        b=rndf86yFUhPFc8mMxBHLuwhJgLEjaaCyyU4BBwpUe0/OlAk5oTYnbuQ5PsLs5zQx9L
         Us5k6N7WRD7kO0844Foi0SNqAWmYHpaNmR+hdg1uLxAVl4v2yrPGUFEGcLXHSjAlJ5a2
         g5H4yCirEdFtB/CWpMvA4CgpfQKp+0lvaJ9QNmu+OWG2MevHHQTvveGSwIjNgwQv0zeI
         vgSbAMxjqyelkStwslhyTUVsiP2Y4i0UVbchIPoT2u+xNNpiW4jpu1PqoRVD+pMQSTLW
         DoxecMbkzcroWnmDXRQwY1x67mrnbra5gMfRbbyFujsTeKl6ea/RR0zmMlurpOv/4h/V
         QoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ED7tv8DZ9a/S5xBH8be2DHeN5dwoaIIT6ClYiv99xYM=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=yyRoP8ZpiKV9DL9GWyKs0ivF2OoPajGoWGBeeAvFY8587oQAITjEKWyIDgoVpGObv6
         d55JxCFKemFNFOn2uggjv6AVVCuxqqHLXIzilYlRkf3k994W3+GCLuf1QkTGafYx44ku
         O+EVZ2IWBL0SmAKleCv8rsm+2lwDsYQpOPwvrvXt+wrf6Q38+mUG4gAJPydUGntIrNKu
         APzikXuOjOIMhLLPu7+tBwnB31gmbYBLJ8Kg1ng0t2gr952djCxi4l32FfPf40xMahnv
         p8G21SeaCcTNmgLAguncqkUd1EyRbS/xG6H81qGSGxMCNU9wk3Pd+F4WDjmeOsg1+RLx
         juWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIVaTH5H;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fy19-20020a170906b7d300b00a2dc01577fcsor2559858ejb.14.2024.01.19.03.14.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIVaTH5H;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662869; x=1706267669; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED7tv8DZ9a/S5xBH8be2DHeN5dwoaIIT6ClYiv99xYM=;
        b=YIVaTH5Hxwc+8ewpgD5pzsxPnd8O3HAGpnJi4AA10HO/QUK8Yn5mFv/5nTahfE5KrU
         sbt86Wf3vY4mw0II9SkdG6YcDcboe/KoidST0+Vrb09hJwPvieqs1RTuKD4c88iPVl9z
         0O3jXh4CJmA25qLxQ/BK1P6mnDqKip3rmO3KtTFSOnKNihUIpDm9+5F6SQcxh0lduWdq
         r8/WSGR1cLYYRPz1VgRpjD8GqEyOqxJcI60+O3KebDuQte7fe4sN70Orh7MkYHzDYNV5
         SvcT4DI0SkhYUG3Lrk8r31u+Ka2b9G5Wbmw+sYG7zvtyOsLO7FrKWjOtmnNw5mXzR0dI
         fTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662869; x=1706267669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED7tv8DZ9a/S5xBH8be2DHeN5dwoaIIT6ClYiv99xYM=;
        b=s51VUgnu8awDDbx31GmFc/R0LzBpwGo4nJR5Ed/9PtCZZLd36x33ZthIG3L5N1LNYD
         QVx/iX9bci0iNkMBDKL+aiKsrBKx8GkbdY4eQ3CvUnPl9tuGg0PnKhVZzB0+FN4wu1K1
         aHvlXZndJ9VFzotqVrngLAARvAuvA3p9Me+Sl/WMdv2Pq/dJFyqVMfc8+ecFZrP3ZPc1
         9cAHl2PH7iIe8dOzSpdQXkZTbF0Zc+tV1h8BRUWEWQPAqZbWaxMRZ+tiILQkPL85uD/W
         EpprsJ75N1ROPrpsMB8o4W7lEDwVQorIC3VzoM8HRGRkJdyVWBem7zrh+L10ai2TIMPK
         wwQA==
X-Gm-Message-State: AOJu0Ywf1VJgiQIx+L0iSjK27mp6NlAxqVjBOcPYHNVWRGHXJXnQxlgA
	lYwxwwfmSURyCOcq+9OXBUCk54rvj5sqDc1OKzEDLKb9vJ6Xs9+abTmjdE9w+zsHJqSkZQotIFL
	/vBgYtw==
X-Google-Smtp-Source: AGHT+IE4ZX4c14VUo3cfdAFEFLYoCf8R4yQDCgPLrWhSQEz6A2ZGyGtoFDzZNWCjT0SPwkPNbtqy2Q==
X-Received: by 2002:a17:907:7f02:b0:a2b:ca83:1576 with SMTP id qf2-20020a1709077f0200b00a2bca831576mr1691215ejc.85.1705662868760;
        Fri, 19 Jan 2024 03:14:28 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:28 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/6] hw/arm/z2: convert DPRINTF to tracepoints
Date: Fri, 19 Jan 2024 13:14:19 +0200
Message-Id: <021405f5ef53ebe80c7218e1df537635d34889b3.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
References: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: +d0rsta8z7R/

Tracing DPRINTFs to stderr might not be desired. A developer that relies
on tracepoints should be able to opt-in to each tracepoint and rely on
QEMU's log redirection, instead of stderr by default.

This commit converts DPRINTFs in this file that are used for tracing
into tracepoints.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/trace-events |  8 ++++++++
 hw/arm/z2.c         | 26 +++++++++-----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cdc1ea06a8..a262ad2e6a 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -55,3 +55,11 @@ smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
 smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
 
+# z2.c
+z2_lcd_cur_reg_update(uint8_t r) "reg: 0x%x"
+z2_lcd_enable_disable(uint16_t v) "value: 0x%x"
+z2_lcd_enable_disable_result(const char * result) "LCD %s"
+z2_lcd_invalid_command(uint8_t value) "0x%x"
+z2_aer915_send_too_log(int8_t msg) "message too long (%i bytes)"
+z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
+z2_aer915_i2c_start_recv(uint16_t len) "I2C_START_RECV: short message with len %d"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 83741a4909..6c0889d698 100644
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
@@ -127,22 +121,22 @@ static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
     if (z->pos == 3) {
         switch (z->buf[0]) {
         case 0x74:
-            DPRINTF("%s: reg: 0x%.2x\n", __func__, z->buf[2]);
+            trace_z2_lcd_cur_reg_update(z->buf[2]);
             z->cur_reg = z->buf[2];
             break;
         case 0x76:
             val = z->buf[1] << 8 | z->buf[2];
-            DPRINTF("%s: value: 0x%.4x\n", __func__, val);
+            trace_z2_lcd_enable_disable(val);
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
+            trace_z2_lcd_invalid_command(z->buf[0]);
             break;
         }
         z->pos = 0;
@@ -212,14 +206,12 @@ static int aer915_send(I2CSlave *i2c, uint8_t data)
 
     s->buf[s->len] = data;
     if (s->len++ > 2) {
-        DPRINTF("%s: message too long (%i bytes)\n",
-            __func__, s->len);
+        trace_z2_aer915_send_too_log(s->len);
         return 1;
     }
 
     if (s->len == 2) {
-        DPRINTF("%s: reg %d value 0x%02x\n", __func__,
-                s->buf[0], s->buf[1]);
+        trace_z2_aer915_send(s->buf[0], s->buf[1]);
     }
 
     return 0;
@@ -235,7 +227,7 @@ static int aer915_event(I2CSlave *i2c, enum i2c_event event)
         break;
     case I2C_START_RECV:
         if (s->len != 1) {
-            DPRINTF("%s: short message!?\n", __func__);
+            trace_z2_aer915_i2c_start_recv(s->len);
         }
         break;
     case I2C_FINISH:
-- 
γαῖα πυρί μιχθήτω
